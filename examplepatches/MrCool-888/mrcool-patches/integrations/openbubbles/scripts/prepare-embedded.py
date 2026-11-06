#!/usr/bin/env python3
"""Audit native bridge class linkage and build a deterministic class-only payload."""

from __future__ import annotations

import argparse
from functools import lru_cache
from dataclasses import dataclass
import hashlib
import io
from pathlib import Path
import re
import struct
import sys
import zipfile
from typing import Iterable, Mapping


class AuditError(Exception):
    """Input archive or class linkage failed closed."""


# GMS protobuf uses this Android boot class reflectively; public android.jar omits it.
# https://android.googlesource.com/platform/libcore/+/refs/heads/main/luni/src/main/java/libcore/io/Memory.java
ANDROID_BOOT_TYPES = frozenset({"libcore/io/Memory", "sun/misc/Unsafe"})
# Android's documented Unsafe surface used by GMS protobuf (not bundled into the APK).
# https://developer.android.com/reference/sun/misc/Unsafe
UNSAFE_MEMBERS = frozenset({
    ("allocateInstance", "(Ljava/lang/Class;)Ljava/lang/Object;"),
    ("arrayBaseOffset", "(Ljava/lang/Class;)I"), ("arrayIndexScale", "(Ljava/lang/Class;)I"),
    ("getInt", "(Ljava/lang/Object;J)I"), ("getLong", "(Ljava/lang/Object;J)J"),
    ("getObject", "(Ljava/lang/Object;J)Ljava/lang/Object;"),
    ("objectFieldOffset", "(Ljava/lang/reflect/Field;)J"),
    ("putInt", "(Ljava/lang/Object;JI)V"), ("putLong", "(Ljava/lang/Object;JJ)V"),
    ("putObject", "(Ljava/lang/Object;JLjava/lang/Object;)V"),
})
D8_BOOTSTRAPS = frozenset({"java/lang/invoke/StringConcatFactory", "java/lang/invoke/LambdaMetafactory"})


@dataclass(frozen=True)
class MemberRef:
    owner: str
    name: str
    descriptor: str
    is_method: bool


@dataclass(frozen=True)
class ClassInfo:
    name: str
    super_name: str | None
    interfaces: tuple[str, ...]
    fields: frozenset[tuple[str, str]]
    methods: frozenset[tuple[str, str]]
    class_refs: frozenset[str]
    member_refs: tuple[MemberRef, ...]
    is_interface: bool
    data: bytes


@dataclass(frozen=True)
class CpEntry:
    tag: int
    value: object


def _fail(message: str) -> AuditError:
    return AuditError(message)


class Reader:
    def __init__(self, data: bytes, label: str):
        self.data = data
        self.pos = 0
        self.label = label

    def take(self, size: int) -> bytes:
        if size < 0 or self.pos + size > len(self.data):
            raise _fail(f"Malformed class/archive entry: {self.label}")
        result = self.data[self.pos:self.pos + size]
        self.pos += size
        return result

    def u1(self) -> int:
        return self.take(1)[0]

    def u2(self) -> int:
        return struct.unpack(">H", self.take(2))[0]

    def u4(self) -> int:
        return struct.unpack(">I", self.take(4))[0]


def _mutf8(raw: bytes, label: str) -> str:
    # Class names and descriptors are ASCII; this also accepts Java's encoded NUL and surrogates.
    raw = raw.replace(b"\xc0\x80", b"\x00")
    try:
        return raw.decode("utf-8", errors="surrogatepass")
    except UnicodeDecodeError as error:
        raise _fail(f"Malformed modified UTF-8 in {label}") from error


def _cp_entry(cp: list[CpEntry | None], index: int, tag: int | tuple[int, ...], label: str) -> CpEntry:
    if index <= 0 or index >= len(cp) or cp[index] is None:
        raise _fail(f"Invalid constant-pool index {index} in {label}")
    entry = cp[index]
    assert entry is not None
    expected = (tag,) if isinstance(tag, int) else tag
    if entry.tag not in expected:
        raise _fail(f"Unexpected constant-pool tag {entry.tag} at index {index} in {label}")
    return entry


def _utf8(cp: list[CpEntry | None], index: int, label: str) -> str:
    return str(_cp_entry(cp, index, 1, label).value)


def _class_name(cp: list[CpEntry | None], index: int, label: str) -> str:
    name_index = int(_cp_entry(cp, index, 7, label).value)
    name = _utf8(cp, name_index, label)
    if name.startswith("["):
        refs = _descriptor_classes(name)
        return refs[0] if refs else name
    return name


_SIGNATURE_CLASS = re.compile(r"L([^;]+);")


def _descriptor_classes(value: str) -> tuple[str, ...]:
    """Extract reference types from JVM descriptors, including after primitive parameters."""
    return tuple(dict.fromkeys(match.group(1) for match in _SIGNATURE_CLASS.finditer(value)))


def parse_class(data: bytes, label: str = "<class>") -> ClassInfo:
    reader = Reader(data, label)
    if reader.u4() != 0xCAFEBABE:
        raise _fail(f"Malformed classfile magic: {label}")
    reader.u2()  # minor version
    reader.u2()  # major version
    cp_count = reader.u2()
    if cp_count < 1:
        raise _fail(f"Malformed constant pool: {label}")
    cp: list[CpEntry | None] = [None] * cp_count
    index = 1
    while index < cp_count:
        tag = reader.u1()
        if tag == 1:
            cp[index] = CpEntry(tag, _mutf8(reader.take(reader.u2()), label))
        elif tag in (3, 4):
            cp[index] = CpEntry(tag, reader.take(4))
        elif tag in (5, 6):
            cp[index] = CpEntry(tag, reader.take(8))
            index += 1
            if index < cp_count:
                cp[index] = None
        elif tag in (7, 8, 16, 19, 20):
            cp[index] = CpEntry(tag, reader.u2())
        elif tag in (9, 10, 11, 12, 17, 18):
            cp[index] = CpEntry(tag, (reader.u2(), reader.u2()))
        elif tag == 15:
            cp[index] = CpEntry(tag, (reader.u1(), reader.u2()))
        else:
            raise _fail(f"Unknown constant-pool tag {tag} in {label}")
        index += 1

    access_flags = reader.u2()
    this_index = reader.u2()
    super_index = reader.u2()
    name = _class_name(cp, this_index, label)
    super_name = _class_name(cp, super_index, label) if super_index else None
    interfaces = tuple(_class_name(cp, reader.u2(), label) for _ in range(reader.u2()))

    declared_refs: set[str] = set()

    def parse_members() -> frozenset[tuple[str, str]]:
        members: set[tuple[str, str]] = set()
        for _ in range(reader.u2()):
            reader.u2()  # access flags
            member_name = _utf8(cp, reader.u2(), label)
            descriptor = _utf8(cp, reader.u2(), label)
            if not descriptor or (member_name, descriptor) in members:
                raise _fail(f"Malformed or duplicate class member in {label}")
            members.add((member_name, descriptor))
            declared_refs.update(_descriptor_classes(descriptor))
            for _ in range(reader.u2()):
                _utf8(cp, reader.u2(), label)
                reader.take(reader.u4())
        return frozenset(members)

    fields = parse_members()
    methods = parse_members()
    for _ in range(reader.u2()):
        _utf8(cp, reader.u2(), label)
        reader.take(reader.u4())
    if reader.pos != len(data):
        raise _fail(f"Trailing bytes after classfile: {label}")

    class_refs: set[str] = {name}
    class_refs.update(declared_refs)
    if super_name:
        class_refs.add(super_name)
    class_refs.update(interfaces)
    member_refs: list[MemberRef] = []
    string_constants = {int(entry.value) for entry in cp if entry is not None and entry.tag == 8}
    for cp_index, entry in enumerate(cp):
        if entry is None:
            continue
        if entry.tag == 7:
            class_value = _utf8(cp, int(entry.value), label)
            if class_value.startswith("["):
                class_refs.update(_descriptor_classes(class_value))
            else:
                class_refs.add(class_value)
        elif entry.tag == 16:
            descriptor = _utf8(cp, int(entry.value), label)
            class_refs.update(_descriptor_classes(descriptor))
        elif entry.tag in (9, 10, 11):
            owner_index, name_type_index = entry.value  # type: ignore[misc]
            owner_utf_index = int(_cp_entry(cp, owner_index, 7, label).value)
            owner = _utf8(cp, owner_utf_index, label)
            nt_name_index, descriptor_index = _cp_entry(cp, name_type_index, 12, label).value  # type: ignore[misc]
            member_name = _utf8(cp, nt_name_index, label)
            descriptor = _utf8(cp, descriptor_index, label)
            if owner.startswith("["):
                class_refs.update(_descriptor_classes(owner))
            else:
                class_refs.add(owner)
            class_refs.update(_descriptor_classes(descriptor))
            member_refs.append(MemberRef(owner, member_name, descriptor, entry.tag != 9))
        elif entry.tag == 12:
            _, descriptor_index = entry.value  # type: ignore[misc]
            class_refs.update(_descriptor_classes(_utf8(cp, descriptor_index, label)))
        # Arbitrary UTF8 entries include Kotlin metadata and are not JVM type references.

    return ClassInfo(name, super_name, interfaces, fields, methods, frozenset(class_refs),
                     tuple(member_refs), bool(access_flags & 0x0200), data)


@lru_cache(maxsize=100_000)
def _cached_class(data: bytes) -> ClassInfo:
    return parse_class(data)


def _is_resource_class(name: str) -> bool:
    return re.search(r"(?:^|/)R(?:\$[^/]*)?$", name) is not None


def _archive_class_bytes(data: bytes, label: str) -> dict[str, bytes]:
    result: dict[str, bytes] = {}
    try:
        with zipfile.ZipFile(io.BytesIO(data)) as archive:
            names = archive.namelist()
            if len(names) != len(set(names)):
                raise _fail(f"Duplicate ZIP entries in {label}")
            for entry_name in names:
                if entry_name.endswith("/") or not entry_name.endswith(".class"):
                    continue
                if entry_name.startswith("META-INF/") or entry_name == "module-info.class":
                    continue
                class_data = archive.read(entry_name)
                parsed = _cached_class(class_data)
                if entry_name != parsed.name + ".class":
                    raise _fail(f"Class path/name mismatch in {label}!{entry_name}: {parsed.name}")
                previous = result.get(parsed.name)
                if previous is not None and previous != class_data:
                    raise _fail(f"Conflicting duplicate class {parsed.name} in {label}")
                result[parsed.name] = class_data
    except AuditError:
        raise
    except Exception as error:
        raise _fail(f"Invalid archive {label}: {error}") from error
    return result


def _read_class_container(path: Path, required: bool) -> dict[str, bytes]:
    try:
        data = path.read_bytes()
    except OSError as error:
        raise _fail(f"Cannot read input {path}: {error}") from error
    if path.suffix.lower() == ".aar":
        try:
            with zipfile.ZipFile(io.BytesIO(data)) as archive:
                try:
                    classes_jar = archive.read("classes.jar")
                except KeyError:
                    if required:
                        raise _fail(f"AAR has no classes.jar: {path}")
                    return {}
        except AuditError:
            raise
        except Exception as error:
            raise _fail(f"Invalid AAR {path}: {error}") from error
        return _archive_class_bytes(classes_jar, f"{path}!classes.jar")
    if path.suffix.lower() != ".jar":
        raise _fail(f"Expected a .jar or .aar input: {path}")
    return _archive_class_bytes(data, str(path))


def _load_infos(class_bytes: Mapping[str, bytes], label: str) -> dict[str, ClassInfo]:
    return {name: _cached_class(data) for name, data in class_bytes.items()}


def _add_candidates(target: dict[str, bytes], incoming: Mapping[str, bytes], label: str) -> None:
    for name, data in incoming.items():
        previous = target.get(name)
        if previous is not None and previous != data:
            raise _fail(f"Conflicting candidate class {name} from {label}")
        target[name] = data


def _resolve_member(info: ClassInfo, reference: MemberRef, classes: Mapping[str, ClassInfo]) -> bool:
    if reference.owner == "sun/misc/Unsafe":
        return reference.is_method and (reference.name, reference.descriptor) in UNSAFE_MEMBERS
    if reference.owner.startswith("[") and reference.name == "clone" and reference.is_method:
        return True
    if reference.owner in D8_BOOTSTRAPS:
        return reference.name in {"makeConcat", "makeConcatWithConstants", "metafactory", "altMetafactory"}
    if reference.owner == "java/lang/invoke/MethodHandle" and reference.name in ("invoke", "invokeExact"):
        return True
    owner = classes.get(reference.owner)
    if owner is None:
        raise _fail(f"Missing class {reference.owner} referenced by {info.name}")
    key = (reference.name, reference.descriptor)
    if reference.name == "<init>" or reference.name == "<clinit>":
        members = owner.methods
        return key in members

    visited: set[str] = set()

    def search(name: str) -> bool:
        if name in visited:
            return False
        visited.add(name)
        current = classes.get(name)
        if current is None:
            return False
        own = current.methods if reference.is_method else current.fields
        if key in own:
            return True
        if current.super_name and search(current.super_name):
            return True
        return any(search(interface) for interface in current.interfaces)

    if search(reference.owner):
        return True
    # Interface method references may resolve public instance methods declared by Object.
    if owner.is_interface and reference.is_method and search("java/lang/Object"):
        return True
    return False


def select_and_audit(
    root_names: Iterable[str],
    candidates: Mapping[str, ClassInfo],
    host: Mapping[str, ClassInfo],
    android: Mapping[str, ClassInfo],
) -> set[str]:
    selected: set[str] = set()
    queue = list(dict.fromkeys(root_names))
    origins = {name: "payload roots" for name in queue}
    missing: dict[str, str] = {}
    available = dict(android)
    available.update(host)  # Host classes take precedence over platform stubs.
    while queue:
        name = queue.pop()
        if _is_resource_class(name) and name not in host:
            raise _fail(f"Missing resource class {name}; resource integration is required")
        if name in available or name in D8_BOOTSTRAPS or name in ANDROID_BOOT_TYPES:
            continue
        if name in selected:
            continue
        info = candidates.get(name)
        if info is None:
            missing[name] = origins.get(name, "unknown")
            continue
        selected.add(name)
        for dependency in info.class_refs:
            origins.setdefault(dependency, name)
        queue.extend(info.class_refs)

    if missing:
        raise _fail("Missing referenced classes: " + "; ".join(
            f"{name} (from {origin})" for name, origin in sorted(missing.items())))

    available.update({name: candidates[name] for name in selected})
    for name in sorted(selected):
        info = candidates[name]
        for reference in info.member_refs:
            if not _resolve_member(info, reference, available):
                kind = "method" if reference.is_method else "field"
                raise _fail(f"Unresolved {kind} {reference.owner}->{reference.name}{reference.descriptor} referenced by {name}")
    return selected


def build_payload(
    host_jar: Path,
    android_jar: Path,
    bridge_aar: Path,
    protocol_jar: Path,
    dependencies: Iterable[Path],
    output_jar: Path,
) -> tuple[int, str]:
    host_bytes = _read_class_container(host_jar, required=True)
    android_bytes = _read_class_container(android_jar, required=True)
    bridge_bytes = _read_class_container(bridge_aar, required=True)
    protocol_bytes = _read_class_container(protocol_jar, required=True)
    host_infos = _load_infos(host_bytes, "host")
    android_infos = _load_infos(android_bytes, "android")

    dependency_paths = list(dependencies)
    wearable = [path for path in dependency_paths if path.name.casefold() == "play-services-wearable-19.0.0.aar".casefold()]
    if len(wearable) != 1:
        raise _fail("Pass exactly one play-services-wearable-19.0.0.aar dependency")

    own_names = set(bridge_bytes) | set(protocol_bytes)
    collisions = sorted(own_names & set(host_infos))
    if collisions:
        raise _fail("Bridge/protocol class overlaps host: " + ", ".join(collisions))
    platform_collisions = sorted(own_names & set(android_infos))
    if platform_collisions:
        raise _fail("Bridge/protocol class overlaps Android platform: " + ", ".join(platform_collisions))

    candidate_bytes: dict[str, bytes] = {}
    _add_candidates(candidate_bytes, bridge_bytes, str(bridge_aar))
    _add_candidates(candidate_bytes, protocol_bytes, str(protocol_jar))
    for path in dependency_paths:
        _add_candidates(candidate_bytes, _read_class_container(path, required=False), str(path))
    candidates = _load_infos(candidate_bytes, "candidate")

    root_names = set(bridge_bytes) | set(protocol_bytes) | set(_read_class_container(wearable[0], required=True))
    selected = select_and_audit(root_names, candidates, host_infos, android_infos)
    payload_classes = {name: candidate_bytes[name] for name in selected}

    if output_jar.resolve() in {host_jar.resolve(), android_jar.resolve(), bridge_aar.resolve(), protocol_jar.resolve(),
                                *(path.resolve() for path in dependency_paths)}:
        raise _fail("Output path must not overwrite an input archive")
    output_jar.parent.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(output_jar, "w", compression=zipfile.ZIP_DEFLATED, compresslevel=9) as archive:
        for name in sorted(payload_classes):
            info = zipfile.ZipInfo(name + ".class", date_time=(1980, 1, 1, 0, 0, 0))
            info.compress_type = zipfile.ZIP_DEFLATED
            info.create_system = 3
            info.external_attr = 0o100644 << 16
            archive.writestr(info, payload_classes[name], compress_type=zipfile.ZIP_DEFLATED, compresslevel=9)
    digest = hashlib.sha256(output_jar.read_bytes()).hexdigest()
    return len(payload_classes), digest


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--host", required=True, type=Path, help="Host-derived class JAR")
    parser.add_argument("--android", required=True, type=Path, help="Android platform JAR")
    parser.add_argument("--bridge", required=True, type=Path, help="Phone bridge release AAR")
    parser.add_argument("--protocol", required=True, type=Path, help="Wear protocol JAR")
    parser.add_argument("--dependency", action="append", default=[], type=Path,
                        help="Dependency class JAR/AAR candidate source (repeatable)")
    parser.add_argument("--output", required=True, type=Path, help="Output JAR containing only new classfiles")
    args = parser.parse_args(argv)
    try:
        count, digest = build_payload(args.host, args.android, args.bridge, args.protocol, args.dependency, args.output)
    except AuditError as error:
        print(f"prepare-embedded: {error}", file=sys.stderr)
        return 2
    print(f"classes={count} sha256={digest}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
