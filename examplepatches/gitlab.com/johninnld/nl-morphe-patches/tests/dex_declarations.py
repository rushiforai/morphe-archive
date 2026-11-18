"""Read DEX declarations without opening every decoded smali file.

Format: https://source.android.com/docs/core/runtime/dex-format
This indexes declarations, not executable behavior or APK/signature validity.
The verifier still checks actual decoded instructions and retained contracts.
"""
from dataclasses import dataclass
import hashlib
from pathlib import Path
import re
import struct
import zipfile


@dataclass(frozen=True)
class MethodDeclaration:
    declaring_type: str
    signature: str
    access_flags: int
    kind: str
    code_offset: int

    @property
    def is_private(self):
        return bool(self.access_flags & 0x2)

    @property
    def is_static(self):
        return bool(self.access_flags & 0x8)


@dataclass(frozen=True)
class ClassDeclaration:
    name: str
    access_flags: int
    superclass: str | None
    interfaces: tuple[str, ...]
    methods: dict[str, MethodDeclaration]
    dex_name: str

    @property
    def is_interface(self):
        return bool(self.access_flags & 0x200)


class _Dex:
    def __init__(self, data, name):
        self.data, self.name = data, name
        if len(data) < 112 or data[:4] != b"dex\n" or data[7] != 0:
            raise ValueError("Truncated or invalid DEX header")
        if data[4:7] not in (b"035", b"037", b"038", b"039", b"040"):
            raise ValueError("Unsupported DEX version (container DEX requires a separate reader)")
        if self.u32(32) != len(data) or self.u32(36) != 112:
            raise ValueError("DEX file/header size mismatch")
        if self.u32(40) != 0x12345678:
            raise ValueError("Unsupported DEX endianness")
        self.data_start, self.data_end = self.u32(108), self.u32(108) + self.u32(104)
        if self.data_start < 112 or self.data_end > len(data):
            raise ValueError("DEX data section outside file bounds")
        self.strings = self.table(56, 4)
        self.types = self.table(64, 4)
        self.protos = self.table(72, 12)
        self.fields = self.table(80, 8)
        self.methods = self.table(88, 8)
        self.classes = self.table(96, 32)
        self.string_cache, self.type_cache, self.proto_cache = {}, {}, {}

    def bounds(self, offset, size):
        if offset < 0 or size < 0 or offset > len(self.data) - size:
            raise ValueError("DEX offset/size outside file bounds")

    def u32(self, offset):
        self.bounds(offset, 4)
        return struct.unpack_from("<I", self.data, offset)[0]

    def table(self, header_offset, width):
        count, offset = self.u32(header_offset), self.u32(header_offset + 4)
        if count and (offset < 112 or offset % 4):
            raise ValueError("Invalid DEX table offset/alignment")
        self.bounds(offset, count * width)
        return count, offset

    def data_offset(self, offset):
        if not self.data_start <= offset < self.data_end:
            raise ValueError("DEX data offset outside data section")

    def uleb(self, offset):
        value = 0
        for i in range(5):
            self.data_offset(offset)
            byte = self.data[offset]
            offset += 1
            if i == 4 and byte > 15:
                raise ValueError("Malformed/overflowing DEX ULEB128")
            value |= (byte & 127) << (i * 7)
            if not byte & 128:
                return value, offset
        raise ValueError("Malformed DEX ULEB128")

    def string(self, index):
        count, base = self.strings
        if index >= count:
            raise ValueError("DEX string index out of bounds")
        offset = self.u32(base + 4 * index)
        if offset in self.string_cache:
            return self.string_cache[offset]
        self.data_offset(offset)
        length, cursor = self.uleb(offset)
        end = self.data.find(b"\0", cursor, self.data_end)
        if end < 0:
            raise ValueError("Unterminated DEX string")
        raw = self.data[cursor:end]
        if raw.isascii():
            value = raw.decode("ascii")
            if len(value) != length:
                raise ValueError("DEX string UTF-16 length mismatch")
        else:
            units, at = [], 0
            while at < len(raw):
                first = raw[at]
                at += 1
                if 0 < first < 128:
                    unit, extra = first, 0
                elif 192 <= first <= 223:
                    unit, extra = first & 31, 1
                elif 224 <= first <= 239:
                    unit, extra = first & 15, 2
                else:
                    raise ValueError("Invalid DEX modified UTF-8")
                for _ in range(extra):
                    if at >= len(raw) or not 128 <= raw[at] <= 191:
                        raise ValueError("Truncated/invalid DEX modified UTF-8")
                    unit = (unit << 6) | (raw[at] & 63)
                    at += 1
                if (extra == 1 and unit < 128 and unit != 0) or (extra == 2 and unit < 2048):
                    raise ValueError("Overlong DEX modified UTF-8")
                units.append(unit)
            if len(units) != length:
                raise ValueError("DEX string UTF-16 length mismatch")
            value = b"".join(struct.pack("<H", u) for u in units).decode("utf-16-le", "surrogatepass")
        self.string_cache[offset] = value
        return value

    def type(self, index):
        count, base = self.types
        if index >= count:
            raise ValueError("DEX type index out of bounds")
        if index not in self.type_cache:
            self.type_cache[index] = self.string(self.u32(base + 4 * index))
        return self.type_cache[index]

    def type_list(self, offset):
        if not offset:
            return ()
        self.data_offset(offset)
        if offset % 4:
            raise ValueError("Unaligned DEX type list")
        count = self.u32(offset)
        self.bounds(offset + 4, count * 2)
        if offset + 4 + count * 2 > self.data_end:
            raise ValueError("DEX type list outside data bounds")
        return tuple(self.type(struct.unpack_from("<H", self.data, offset + 4 + 2 * i)[0]) for i in range(count))

    def proto(self, index):
        count, base = self.protos
        if index >= count:
            raise ValueError("DEX prototype index out of bounds")
        if index not in self.proto_cache:
            _, result, parameters = struct.unpack_from("<III", self.data, base + 12 * index)
            self.proto_cache[index] = "(" + "".join(self.type_list(parameters)) + ")" + self.type(result)
        return self.proto_cache[index]

    def members(self, owner, offset):
        if not offset:
            return {}
        self.data_offset(offset)
        counts = []
        for _ in range(4):
            count, offset = self.uleb(offset)
            counts.append(count)
        if sum(counts[:2]) > self.fields[0] or sum(counts[2:]) > self.methods[0]:
            raise ValueError("DEX class member counts exceed tables")
        for count in counts[:2]:
            field_index = 0
            for i in range(count):
                delta, offset = self.uleb(offset)
                _, offset = self.uleb(offset)
                field_index += delta
                if field_index >= self.fields[0] or (i and not delta):
                    raise ValueError("Invalid/duplicate DEX field index")
                defined = struct.unpack_from("<H", self.data, self.fields[1] + 8 * field_index)[0]
                if self.type(defined) != owner:
                    raise ValueError("DEX field owner mismatch")
        methods = {}
        for kind, count in zip(("direct", "virtual"), counts[2:]):
            method_index = 0
            for i in range(count):
                delta, offset = self.uleb(offset)
                flags, offset = self.uleb(offset)
                code, offset = self.uleb(offset)
                method_index += delta
                if method_index >= self.methods[0] or (i and not delta):
                    raise ValueError("Invalid/duplicate DEX method index")
                defined, proto, name = struct.unpack_from("<HHI", self.data, self.methods[1] + 8 * method_index)
                if self.type(defined) != owner:
                    raise ValueError("DEX method owner mismatch")
                signature = self.string(name) + self.proto(proto)
                direct = bool(flags & 0xA) or signature.startswith(("<init>(", "<clinit>("))
                if (kind == "direct") != direct:
                    raise ValueError("DEX direct/virtual declaration mismatch")
                if signature in methods:
                    raise ValueError("Duplicate DEX method declaration")
                if code:
                    self.data_offset(code)
                    if code % 4:
                        raise ValueError("Unaligned DEX code offset")
                methods[signature] = MethodDeclaration(owner, signature, flags, kind, code)
        return methods

    def declarations(self):
        result = {}
        for i in range(self.classes[0]):
            owner, flags, parent, interfaces, _, _, data, _ = struct.unpack_from("<8I", self.data, self.classes[1] + 32 * i)
            name = self.type(owner)
            if not name.startswith("L") or not name.endswith(";") or "\0" in name:
                raise ValueError("Invalid DEX class descriptor")
            if name in result:
                raise ValueError("duplicate class in DEX")
            result[name] = ClassDeclaration(name, flags, None if parent == 0xFFFFFFFF else self.type(parent),
                                            self.type_list(interfaces), self.members(name, data), self.name)
        return result


@dataclass(frozen=True)
class DexDeclarations:
    classes: dict[str, ClassDeclaration]
    source_sha256: str

    @classmethod
    def from_apk(cls, source: Path):
        digest = hashlib.sha256()
        with source.open("rb") as stream:
            for block in iter(lambda: stream.read(1024 * 1024), b""):
                digest.update(block)
        classes = {}
        with zipfile.ZipFile(source) as archive:
            entries = [entry for entry in archive.infolist() if re.fullmatch(r"classes(?:[1-9]\d*)?\.dex", entry.filename)]
            ordinal = lambda e: int(e.filename[7:-4] or 1)
            entries.sort(key=ordinal)
            if not entries or entries[0].filename != "classes.dex" or [ordinal(e) for e in entries] != list(range(1, len(entries) + 1)):
                raise ValueError("Missing, duplicate or noncontiguous APK DEX entries")
            for entry in entries:
                if entry.file_size > 128 * 1024 * 1024:
                    raise ValueError("DEX exceeds declaration reader size limit")
                declarations = _Dex(archive.read(entry), entry.filename).declarations()
                if classes.keys() & declarations.keys():
                    raise ValueError("duplicate class across APK DEX files")
                classes.update(declarations)
        return cls(classes, digest.hexdigest())

    def resolve_method(self, owner, signature):
        pending, visited = [owner], set()
        while pending:
            name = pending.pop(0)
            if name in visited:
                continue
            visited.add(name)
            declaration = self.classes.get(name)
            if declaration is None:
                continue
            method = declaration.methods.get(signature)
            if method:
                inherited = not method.is_private and not signature.startswith(("<init>(", "<clinit>("))
                if name == owner or inherited:
                    return method
            if declaration.superclass:
                pending.append(declaration.superclass)
            pending.extend(declaration.interfaces)
        return None
