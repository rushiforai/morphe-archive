#!/usr/bin/env python3
"""Audit the Firefox 160.0 GeckoEngine extension-management DEX layout.

Uses only Python's standard library. It reads AndroidManifest.xml and classes*.dex
from an APK; it does not modify the APK.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import struct
import sys
import zipfile
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Iterable

TARGET_PACKAGE = "org.mozilla.firefox"
TARGET_VERSION = "160.0"
LEECHBLOCK_ID = "leechblockng@proginosko.com"
GECKO_ENGINE = "Lmozilla/components/browser/engine/gecko/GeckoEngine;"
WEB_EXTENSION = "Lmozilla/components/concept/engine/webextension/WebExtension;"
LAMBDA1 = "Lmozilla/components/browser/engine/gecko/GeckoEngine$$ExternalSyntheticLambda1;"
LAMBDA5 = "Lmozilla/components/feature/addons/AddonManager$$ExternalSyntheticLambda5;"
LAMBDA11 = "Lmozilla/components/feature/addons/AddonManager$$ExternalSyntheticLambda11;"

DISABLE_PARAMS = [
    WEB_EXTENSION,
    "Lmozilla/components/concept/engine/webextension/EnableSource;",
    "Lmozilla/components/feature/addons/AddonManager$$ExternalSyntheticLambda4;",
    LAMBDA5,
]
UNINSTALL_PARAMS = [
    WEB_EXTENSION,
    "Lmozilla/components/feature/addons/AddonManager$$ExternalSyntheticLambda10;",
    LAMBDA11,
]


def uleb128(data: bytes, offset: int) -> tuple[int, int]:
    value = 0
    shift = 0
    while True:
        if offset >= len(data) or shift > 35:
            raise ValueError("Invalid ULEB128 value")
        byte = data[offset]
        offset += 1
        value |= (byte & 0x7F) << shift
        if byte < 0x80:
            return value, offset
        shift += 7


class DexFile:
    def __init__(self, data: bytes, name: str):
        self.data = data
        self.name = name
        if len(data) < 0x70 or not data.startswith(b"dex\n"):
            raise ValueError(f"{name} is not a valid DEX file")
        if data[4:7] not in (b"035", b"037", b"038", b"039", b"040", b"041"):
            raise ValueError(f"Unsupported DEX version in {name}: {data[4:7]!r}")

        read_u32 = lambda off: struct.unpack_from("<I", data, off)[0]
        self.string_size, self.string_off = read_u32(0x38), read_u32(0x3C)
        self.type_size, self.type_off = read_u32(0x40), read_u32(0x44)
        self.proto_size, self.proto_off = read_u32(0x48), read_u32(0x4C)
        self.field_size, self.field_off = read_u32(0x50), read_u32(0x54)
        self.method_size, self.method_off = read_u32(0x58), read_u32(0x5C)
        self.class_size, self.class_off = read_u32(0x60), read_u32(0x64)

        self.strings: list[str] = []
        for index in range(self.string_size):
            string_off = read_u32(self.string_off + index * 4)
            _, start = uleb128(data, string_off)  # UTF-16 length; not needed here.
            end = data.find(b"\0", start)
            if end < 0:
                raise ValueError(f"Unterminated DEX string in {name}")
            self.strings.append(data[start:end].decode("utf-8", errors="replace"))

        self.types = [self.strings[read_u32(self.type_off + i * 4)] for i in range(self.type_size)]

        self.protos: list[tuple[str, list[str]]] = []
        for index in range(self.proto_size):
            off = self.proto_off + index * 12
            _shorty_idx, return_type_idx, parameters_off = struct.unpack_from("<III", data, off)
            params: list[str] = []
            if parameters_off:
                count = read_u32(parameters_off)
                params = [
                    self.types[struct.unpack_from("<H", data, parameters_off + 4 + i * 2)[0]]
                    for i in range(count)
                ]
            self.protos.append((self.types[return_type_idx], params))

        self.methods: list[tuple[str, str, str, list[str]]] = []
        for index in range(self.method_size):
            class_idx, proto_idx, name_idx = struct.unpack_from("<HHI", data, self.method_off + index * 8)
            return_type, params = self.protos[proto_idx]
            self.methods.append((self.types[class_idx], self.strings[name_idx], return_type, params))

        self.fields: list[tuple[str, str, str]] = []
        for index in range(self.field_size):
            class_idx, type_idx, name_idx = struct.unpack_from("<HHI", data, self.field_off + index * 8)
            self.fields.append((self.types[class_idx], self.types[type_idx], self.strings[name_idx]))

        self.defined_methods: dict[tuple[str, str, str, tuple[str, ...]], dict] = {}
        self.class_data: dict[str, list[tuple[int, int, int]]] = {}
        self.class_interfaces: dict[str, list[str]] = {}
        for class_index in range(self.class_size):
            off = self.class_off + class_index * 32
            class_idx = read_u32(off)
            interfaces_off = read_u32(off + 12)
            class_data_off = read_u32(off + 24)
            class_name = self.types[class_idx]
            if interfaces_off:
                interface_count = read_u32(interfaces_off)
                self.class_interfaces[class_name] = [
                    self.types[struct.unpack_from("<H", data, interfaces_off + 4 + i * 2)[0]]
                    for i in range(interface_count)
                ]
            else:
                self.class_interfaces[class_name] = []
            if not class_data_off:
                continue
            static_fields, pos = uleb128(data, class_data_off)
            instance_fields, pos = uleb128(data, pos)
            direct_methods, pos = uleb128(data, pos)
            virtual_methods, pos = uleb128(data, pos)

            for _ in range(static_fields + instance_fields):
                _idx_diff, pos = uleb128(data, pos)
                _access_flags, pos = uleb128(data, pos)

            class_methods: list[tuple[int, int, int]] = []
            for method_count in (direct_methods, virtual_methods):
                method_index = 0
                for _ in range(method_count):
                    diff, pos = uleb128(data, pos)
                    access_flags, pos = uleb128(data, pos)
                    code_off, pos = uleb128(data, pos)
                    method_index += diff
                    class_methods.append((method_index, access_flags, code_off))
                    owner, name, ret, params = self.methods[method_index]
                    self.defined_methods[(owner, name, ret, tuple(params))] = {
                        "access_flags": access_flags,
                        "code_off": code_off,
                        "dex": name and self.name,
                    }
            self.class_data[class_name] = class_methods

    def code_item(self, code_off: int) -> dict | None:
        if not code_off:
            return None
        registers, ins, outs, tries, debug_off, insns_size = struct.unpack_from(
            "<HHHHII", self.data, code_off
        )
        insns_start = code_off + 16
        insns = list(struct.unpack_from("<" + "H" * insns_size, self.data, insns_start)) if insns_size else []
        return {
            "registers": registers,
            "ins": ins,
            "outs": outs,
            "tries": tries,
            "debug_info_off": debug_off,
            "insns": insns,
        }

    def invoke_sites_in(self, code: dict) -> list[dict]:
        """Return invoke method references together with their explicit register lists.

        Supports the 35c and 3rc invoke formats used by the audited synthetic adapter.
        The audit fails on an unexpected opcode rather than silently skipping instructions.
        """
        words = code["insns"]
        sites: list[dict] = []
        i = 0
        while i < len(words):
            word = words[i]
            opcode = word & 0xFF
            if 0x6E <= opcode <= 0x72:  # invoke-virtual/super/direct/static/interface, 35c
                if i + 2 >= len(words):
                    raise ValueError("Truncated 35c invoke instruction")
                count = (word >> 12) & 0xF
                g = (word >> 8) & 0xF
                packed = words[i + 2]
                registers = [
                    packed & 0xF,
                    (packed >> 4) & 0xF,
                    (packed >> 8) & 0xF,
                    (packed >> 12) & 0xF,
                    g,
                ][:count]
                method = self.methods[words[i + 1]]
                sites.append({"method": method, "registers": registers, "offset": i})
                i += 3
            elif 0x74 <= opcode <= 0x78:  # invoke-*/range, 3rc
                if i + 2 >= len(words):
                    raise ValueError("Truncated 3rc invoke instruction")
                count = (word >> 8) & 0xFF
                method = self.methods[words[i + 1]]
                first_register = words[i + 2]
                registers = list(range(first_register, first_register + count))
                sites.append({"method": method, "registers": registers, "offset": i})
                i += 3
            elif 0x52 <= opcode <= 0x5F:  # iget/iput variants, 22c
                i += 2
            elif opcode == 0x22:  # new-instance, 21c
                i += 2
            elif opcode in (0x0E, 0x11):  # return-void / return-object
                i += 1
            else:
                raise ValueError(f"Unexpected opcode 0x{opcode:02x} in audited adapter at code unit {i}")
        return sites

    def method(self, owner: str, name: str, return_type: str, params: Iterable[str]) -> dict | None:
        key = (owner, name, return_type, tuple(params))
        info = self.defined_methods.get(key)
        if info is None:
            return None
        result = dict(info)
        result["code"] = self.code_item(info["code_off"])
        return result

    def has_method(self, owner: str, name: str, return_type: str, params: Iterable[str]) -> bool:
        return (owner, name, return_type, tuple(params)) in self.defined_methods

    def has_field(self, owner: str, field_type: str, name: str) -> bool:
        return (owner, field_type, name) in self.fields

    def method_refs_in(self, code: dict) -> list[tuple[str, str, str, list[str]]]:
        """Decode the method-reference instructions used by the small lambda under audit."""
        words = code["insns"]
        refs: list[tuple[str, str, str, list[str]]] = []
        i = 0
        while i < len(words):
            opcode = words[i] & 0xFF
            if 0x6E <= opcode <= 0x72:  # invoke-virtual/super/direct/static/interface, 35c
                if i + 2 >= len(words):
                    raise ValueError("Truncated invoke instruction")
                method_index = words[i + 1]
                refs.append(self.methods[method_index])
                i += 3
            elif 0x52 <= opcode <= 0x5F:  # iget/iput variants, 22c
                if i + 1 >= len(words):
                    raise ValueError("Truncated field instruction")
                field_index = words[i + 1]
                refs.append(self.fields[field_index])
                i += 2
            elif opcode == 0x22:  # new-instance, 21c
                i += 2
            elif opcode == 0x0E or opcode == 0x11:  # return-void / return-object
                i += 1
            else:
                raise ValueError(f"Unexpected opcode 0x{opcode:02x} in audited lambda at code unit {i}")
        return refs


def parse_manifest(data: bytes) -> dict[str, str | int]:
    if len(data) < 8 or struct.unpack_from("<H", data, 0)[0] != 0x0003:
        raise ValueError("AndroidManifest.xml is not binary Android XML")
    strings: list[str] = []
    result: dict[str, str | int] = {}
    offset = 8
    while offset + 8 <= len(data):
        chunk_type, header_size, chunk_size = struct.unpack_from("<HHI", data, offset)
        if chunk_size < header_size or offset + chunk_size > len(data):
            raise ValueError("Malformed AndroidManifest.xml chunk")
        if chunk_type == 0x0001:  # string pool
            count, _style_count, flags, strings_start, _styles_start = struct.unpack_from("<IIIII", data, offset + 8)
            utf8 = bool(flags & 0x100)
            offsets_start = offset + header_size
            for index in range(count):
                relative = struct.unpack_from("<I", data, offsets_start + index * 4)[0]
                pos = offset + strings_start + relative
                if utf8:
                    _, pos = uleb128(data, pos)
                    byte_length, pos = uleb128(data, pos)
                    value = data[pos:pos + byte_length].decode("utf-8", errors="replace")
                else:
                    char_length = struct.unpack_from("<H", data, pos)[0]
                    pos += 2
                    value = data[pos:pos + char_length * 2].decode("utf-16le", errors="replace")
                strings.append(value)
        elif chunk_type == 0x0102:  # start element
            ext = offset + header_size
            name_idx = struct.unpack_from("<I", data, ext + 4)[0]
            element_name = strings[name_idx] if name_idx < len(strings) else ""
            attr_start, attr_size, attr_count = struct.unpack_from("<HHH", data, ext + 8)
            if element_name == "manifest":
                base = ext + attr_start
                for index in range(attr_count):
                    attr_off = base + index * attr_size
                    _ns, name_idx, raw_idx = struct.unpack_from("<III", data, attr_off)
                    _value_size, _res0, value_type, value_data = struct.unpack_from("<HBBI", data, attr_off + 12)
                    attr_name = strings[name_idx] if name_idx < len(strings) else str(name_idx)
                    if raw_idx != 0xFFFFFFFF and raw_idx < len(strings):
                        value: str | int = strings[raw_idx]
                    elif value_type == 0x03 and value_data < len(strings):
                        value = strings[value_data]
                    else:
                        value = value_data
                    if attr_name in ("package", "versionName", "versionCode"):
                        result[attr_name] = value
        offset += chunk_size
    return result


def load_apk(path: Path) -> tuple[dict, dict[str, DexFile], str]:
    digest = hashlib.sha256(path.read_bytes()).hexdigest()
    with zipfile.ZipFile(path) as archive:
        manifest = parse_manifest(archive.read("AndroidManifest.xml"))
        dex_files: dict[str, DexFile] = {}
        for name in archive.namelist():
            if name.endswith(".dex") and name.rsplit("/", 1)[-1].startswith("classes"):
                dex_files[name] = DexFile(archive.read(name), name)
    return manifest, dex_files, digest


def audit(path: Path) -> dict:
    manifest, dex_files, digest = load_apk(path)
    if manifest.get("package") != TARGET_PACKAGE:
        raise AssertionError(f"Unexpected package: {manifest.get('package')!r}")
    if manifest.get("versionName") != TARGET_VERSION:
        raise AssertionError(f"Expected Firefox {TARGET_VERSION}, got {manifest.get('versionName')!r}")

    all_dex = list(dex_files.values())
    def find_method(owner: str, name: str, ret: str, params: list[str]) -> tuple[DexFile, dict]:
        for dex in all_dex:
            info = dex.method(owner, name, ret, params)
            if info is not None:
                return dex, info
        raise AssertionError(f"Missing method: {owner}->{name}({''.join(params)}){ret}")

    disable_dex, disable = find_method(GECKO_ENGINE, "disableWebExtension", "V", DISABLE_PARAMS)
    uninstall_dex, uninstall = find_method(GECKO_ENGINE, "uninstallWebExtension", "V", UNINSTALL_PARAMS)

    if not (disable["access_flags"] & 0x1 and disable["access_flags"] & 0x10):
        raise AssertionError("disableWebExtension is no longer public final")
    if not (uninstall["access_flags"] & 0x1 and uninstall["access_flags"] & 0x10):
        raise AssertionError("uninstallWebExtension is no longer public final")
    if not disable["code"] or (disable["code"]["registers"], disable["code"]["ins"]) != (6, 5):
        raise AssertionError("Unexpected disableWebExtension register layout")
    if not uninstall["code"] or (uninstall["code"]["registers"], uninstall["code"]["ins"]) != (5, 4):
        raise AssertionError("Unexpected uninstallWebExtension register layout")

    web_extension_has_id = any(dex.has_field(WEB_EXTENSION, "Ljava/lang/String;", "id") for dex in all_dex)
    if not web_extension_has_id:
        raise AssertionError("WebExtension.id:String field not found")

    lambda_method = (LAMBDA1, "onException", "Lorg/mozilla/geckoview/GeckoResult;", ["Ljava/lang/Throwable;"])
    lambda_dex = next((dex for dex in all_dex if dex.has_method(*lambda_method)), None)
    if lambda_dex is None:
        raise AssertionError("GeckoEngine uninstall error adapter not found")
    lambda_info = lambda_dex.method(*lambda_method)
    refs = lambda_dex.method_refs_in(lambda_info["code"])
    if not any(ref == (WEB_EXTENSION, "Ljava/lang/String;", "id") for ref in refs if len(ref) == 3):
        raise AssertionError("Uninstall error adapter no longer reads WebExtension.id")
    expected_callback = (LAMBDA11, "invoke", "Ljava/lang/Object;", ["Ljava/lang/Object;", "Ljava/lang/Object;"])
    invoke_sites = lambda_dex.invoke_sites_in(lambda_info["code"])
    callback_sites = [site for site in invoke_sites if site["method"] == expected_callback]
    if len(callback_sites) != 1:
        raise AssertionError("Uninstall error adapter callback signature changed")
    # The adapter is an instance method with registers_size=3 and ins_size=2:
    # p0/v1 is the callback receiver, v0 is WebExtension.id, and p1/v2 is Throwable.
    if callback_sites[0]["registers"] != [1, 0, 2]:
        raise AssertionError(
            "Uninstall callback argument order changed; expected receiver, extension ID, Throwable"
        )

    def class_implements(class_name: str, interface_name: str) -> bool:
        return any(interface_name in dex.class_interfaces.get(class_name, []) for dex in all_dex)

    if not class_implements(LAMBDA5, "Lkotlin/jvm/functions/Function1;"):
        raise AssertionError("Disable callback adapter does not implement Kotlin Function1")
    if not class_implements(LAMBDA11, "Lkotlin/jvm/functions/Function2;"):
        raise AssertionError("Uninstall callback adapter does not implement Kotlin Function2")
    if not any(dex.has_method(LAMBDA5, "invoke", "Ljava/lang/Object;", ["Ljava/lang/Object;"]) for dex in all_dex):
        raise AssertionError("Disable error callback adapter invoke(Object) method was not found")

    return {
        "package": manifest["package"],
        "versionName": manifest["versionName"],
        "versionCode": manifest.get("versionCode"),
        "apk_sha256": digest,
        "dex_files": sorted(dex_files),
        "targets": {
            "disableWebExtension": {
                "dex": disable_dex.name,
                "descriptor": f"{GECKO_ENGINE}->disableWebExtension({''.join(DISABLE_PARAMS)})V",
                "registers": disable["code"]["registers"],
                "incoming_registers": disable["code"]["ins"],
                "failure_callback_parameter": "p4: Function1.invoke(Throwable)",
            },
            "uninstallWebExtension": {
                "dex": uninstall_dex.name,
                "descriptor": f"{GECKO_ENGINE}->uninstallWebExtension({''.join(UNINSTALL_PARAMS)})V",
                "registers": uninstall["code"]["registers"],
                "incoming_registers": uninstall["code"]["ins"],
                "failure_callback_parameter": "p3: Function2.invoke(extensionId: String, error: Throwable)",
            },
            "uninstall_error_adapter": {
                "class": LAMBDA1,
                "reads": f"{WEB_EXTENSION}->id:Ljava/lang/String;",
                "calls": f"{LAMBDA11}->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
                "callback_registers": [1, 0, 2],
                "callback_argument_order": ["receiver", "extension_id", "throwable"],
                "callback_interface": "Lkotlin/jvm/functions/Function2;",
            },
            "disable_error_adapter": {
                "class": LAMBDA5,
                "invoke": f"{LAMBDA5}->invoke(Ljava/lang/Object;)Ljava/lang/Object;",
                "callback_interface": "Lkotlin/jvm/functions/Function1;",
            },
            "web_extension_id_field": f"{WEB_EXTENSION}->id:Ljava/lang/String;",
        },
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("apk", type=Path, help="Official Firefox 160.0 APK")
    parser.add_argument("--json", type=Path, help="Write audit report JSON to this path")
    args = parser.parse_args()
    try:
        report = audit(args.apk)
    except (AssertionError, OSError, ValueError, zipfile.BadZipFile, struct.error) as error:
        print(f"FAIL: {error}", file=sys.stderr)
        return 1
    serialized = json.dumps(report, indent=2)
    if args.json:
        args.json.write_text(serialized + "\n", encoding="utf-8")
    print(serialized)
    print("\nPASS: Firefox 160.0 extension-management layout matches the patch fingerprints.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
