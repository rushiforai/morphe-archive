"""Declaration fixtures use the published DEX layout, not patch implementation."""
import hashlib
from pathlib import Path
import re
import struct
import tempfile
import unittest
import zipfile

from dex_declarations import DexDeclarations


def uleb(value):
    result = bytearray()
    while value >= 128:
        result.append((value & 127) | 128)
        value >>= 7
    return bytes(result + bytes([value]))


def mutf8(value):
    result = bytearray()
    encoded = value.encode("utf-16-le", "surrogatepass")
    for i in range(0, len(encoded), 2):
        unit = int.from_bytes(encoded[i:i + 2], "little")
        if 0 < unit < 128:
            result.append(unit)
        elif unit < 2048:
            result.extend((192 | (unit >> 6), 128 | (unit & 63)))
        else:
            result.extend((224 | (unit >> 12), 128 | ((unit >> 6) & 63), 128 | (unit & 63)))
    return uleb(len(encoded) // 2) + result + b"\0"


DEFAULT_METHODS = (
    ("<init>", "()V", 0x10001, "direct"),
    ("reportAdError", "(Ljava/lang/String;)V", 0x12, "direct"),
    ("reportAdError", "(I)V", 0x12, "direct"),
    ("getState", "()I", 0x1, "virtual"),
    ("factory", "()Lsample/Player;", 0x9, "direct"),
)


def make_dex(owner="Lsample/Player;", flags=0x1, superclass="Ljava/lang/Object;",
             interfaces=(), methods=DEFAULT_METHODS):
    """Small declaration-only DEX; execution/code validity is a separate check."""
    signatures = {row[1] for row in methods}
    args = {s: re.findall(r"\[*L[^;]+;|\[*[ZBCSIJFD]", s[1:s.index(")")]) for s in signatures}
    returns = {s: s.split(")")[1] for s in signatures}
    types = {owner, *interfaces, *returns.values()}
    if superclass:
        types.add(superclass)
    for values in args.values():
        types.update(values)
    types = sorted(types)
    type_ids = {value: i for i, value in enumerate(types)}
    short = lambda t: "L" if t.startswith(("L", "[")) else t
    shorties = {s: short(returns[s]) + "".join(map(short, args[s])) for s in signatures}
    strings = sorted({*types, *shorties.values(), *(row[0] for row in methods)},
                     key=lambda s: s.encode("utf-16-be", "surrogatepass"))
    string_ids = {value: i for i, value in enumerate(strings)}
    signatures = sorted(signatures, key=lambda s: (type_ids[returns[s]], tuple(type_ids[t] for t in args[s])))
    proto_ids = {value: i for i, value in enumerate(signatures)}
    methods = sorted(methods, key=lambda m: (string_ids[m[0]], proto_ids[m[1]]))
    string_off = 112
    type_off = string_off + 4 * len(strings)
    proto_off = type_off + 4 * len(types)
    method_off = proto_off + 12 * len(signatures)
    class_off = method_off + 8 * len(methods)
    image = bytearray(class_off + 32)
    while len(image) % 4:
        image.append(0)
    data_off = len(image)

    def append(data, alignment=1):
        while len(image) % alignment:
            image.append(0)
        at = len(image)
        image.extend(data)
        return at

    offsets = {s: append(mutf8(s)) for s in strings}

    def type_list(values):
        return append(struct.pack("<I", len(values)) + b"".join(struct.pack("<H", type_ids[t]) for t in values), 4) if values else 0

    parameters = {s: type_list(args[s]) for s in signatures}
    interface_off = type_list(interfaces)
    direct = [(i, m) for i, m in enumerate(methods) if m[3] == "direct"]
    virtual = [(i, m) for i, m in enumerate(methods) if m[3] == "virtual"]
    members = bytearray(uleb(0) + uleb(0) + uleb(len(direct)) + uleb(len(virtual)))
    for group in (direct, virtual):
        previous = 0
        for index, method in group:
            members.extend(uleb(index - previous) + uleb(method[2]) + uleb(0))
            previous = index
    class_data = append(members)
    image[:8] = b"dex\n039\0"
    for at, value in {32: len(image), 36: 112, 40: 0x12345678,
                      56: len(strings), 60: string_off, 64: len(types), 68: type_off,
                      72: len(signatures), 76: proto_off, 88: len(methods), 92: method_off,
                      96: 1, 100: class_off, 104: len(image) - data_off, 108: data_off}.items():
        struct.pack_into("<I", image, at, value)
    for i, s in enumerate(strings):
        struct.pack_into("<I", image, string_off + 4 * i, offsets[s])
    for i, t in enumerate(types):
        struct.pack_into("<I", image, type_off + 4 * i, string_ids[t])
    for i, s in enumerate(signatures):
        struct.pack_into("<III", image, proto_off + 12 * i, string_ids[shorties[s]], type_ids[returns[s]], parameters[s])
    for i, m in enumerate(methods):
        struct.pack_into("<HHI", image, method_off + 8 * i, type_ids[owner], proto_ids[m[1]], string_ids[m[0]])
    struct.pack_into("<8I", image, class_off, type_ids[owner], flags,
                     type_ids[superclass] if superclass else 0xFFFFFFFF,
                     interface_off, 0xFFFFFFFF, 0, class_data, 0)
    return bytes(image)


class DexDeclarationTests(unittest.TestCase):
    def load(self, *files):
        with tempfile.TemporaryDirectory() as directory:
            source = Path(directory) / "fixture.apk"
            with zipfile.ZipFile(source, "w") as archive:
                for i, data in enumerate(files, 1):
                    archive.writestr("classes.dex" if i == 1 else f"classes{i}.dex", data)
            expected_sha = hashlib.sha256(source.read_bytes()).hexdigest()
            result = DexDeclarations.from_apk(source)
            self.assertEqual(result.source_sha256, expected_sha)
            return result

    def test_overloads_static_private_constructor_and_hierarchy(self):
        index = self.load(make_dex(interfaces=("Lsample/Contract;",)))
        cls = index.classes["Lsample/Player;"]
        self.assertEqual(cls.superclass, "Ljava/lang/Object;")
        self.assertEqual(cls.interfaces, ("Lsample/Contract;",))
        self.assertFalse(cls.is_interface)
        self.assertEqual(set(cls.methods), {m[0] + m[1] for m in DEFAULT_METHODS})
        private = cls.methods["reportAdError(Ljava/lang/String;)V"]
        self.assertTrue(private.is_private)
        self.assertEqual(private.kind, "direct")
        self.assertEqual(private.declaring_type, "Lsample/Player;")
        self.assertTrue(cls.methods["factory()Lsample/Player;"].is_static)
        self.assertEqual(cls.methods["getState()I"].kind, "virtual")
        self.assertEqual(cls.methods["<init>()V"].kind, "direct")

    def test_multidex_inheritance_and_interface_flags(self):
        parent = make_dex()
        child = make_dex("Lsample/Child;", superclass="Lsample/Player;", methods=())
        interface = make_dex("Lsample/Contract;", flags=0x601, methods=(("run", "()V", 0x401, "virtual"),))
        index = self.load(parent, child, interface)
        self.assertEqual(len(index.classes), 3)
        self.assertTrue(index.classes["Lsample/Contract;"].is_interface)
        self.assertEqual(index.resolve_method("Lsample/Child;", "getState()I").declaring_type, "Lsample/Player;")
        self.assertIsNone(index.resolve_method("Lsample/Child;", "reportAdError(I)V"))
        self.assertIsNone(index.resolve_method("Lsample/Child;", "<init>()V"))

    def test_modified_utf8_unicode_member_names(self):
        name = "método\U0001f680"
        index = self.load(make_dex(methods=((name, "()V", 0x1, "virtual"),)))
        self.assertIn(name + "()V", index.classes["Lsample/Player;"].methods)

    def test_duplicate_class_definitions_are_rejected(self):
        with self.assertRaisesRegex(ValueError, "duplicate class"):
            self.load(make_dex(), make_dex())

    def test_out_of_bounds_table_is_rejected(self):
        data = bytearray(make_dex())
        struct.pack_into("<I", data, 60, len(data) + 4)
        with self.assertRaises(ValueError):
            self.load(data)

    def test_malformed_uleb128_is_rejected(self):
        data = bytearray(make_dex())
        class_off = struct.unpack_from("<I", data, 100)[0]
        class_data = struct.unpack_from("<I", data, class_off + 24)[0]
        data[class_data:class_data + 5] = b"\xff" * 5
        with self.assertRaisesRegex(ValueError, "ULEB128"):
            self.load(data)

    def test_wrong_method_owner_is_rejected(self):
        data = bytearray(make_dex())
        class_off = struct.unpack_from("<I", data, 100)[0]
        superclass = struct.unpack_from("<I", data, class_off + 8)[0]
        method_off = struct.unpack_from("<I", data, 92)[0]
        struct.pack_into("<H", data, method_off, superclass)
        with self.assertRaisesRegex(ValueError, "owner"):
            self.load(data)

    def test_wrong_method_list_kind_is_rejected(self):
        with self.assertRaisesRegex(ValueError, "direct|virtual"):
            self.load(make_dex(methods=(("privateCall", "()V", 0x2, "virtual"),)))

    def test_truncated_unsupported_and_reversed_endian_headers(self):
        for data in (b"dex\n039\0", b"dex\n041\0" + make_dex()[8:],
                     make_dex()[:40] + struct.pack("<I", 0x78563412) + make_dex()[44:]):
            with self.subTest(header=data[:8]), self.assertRaises(ValueError):
                self.load(data)


if __name__ == "__main__":
    unittest.main()
