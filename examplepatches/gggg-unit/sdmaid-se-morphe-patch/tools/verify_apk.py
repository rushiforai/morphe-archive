"""Check that an SD Maid SE FOSS APK still has the patch's DEX anchor."""

import argparse
import struct
import sys
import zipfile


TARGET_CLASS = "Leu/darken/sdmse/common/upgrade/core/UpgradeRepoFoss$Info;"


def uleb(data, offset):
    value = 0
    shift = 0
    while True:
        byte = data[offset]
        offset += 1
        value |= (byte & 0x7F) << shift
        if byte < 0x80:
            return value, offset
        shift += 7


def verify_dex(data, patched=False):
    u32 = lambda offset: struct.unpack_from("<I", data, offset)[0]
    strings_size, strings_off = struct.unpack_from("<II", data, 0x38)
    types_size, types_off = struct.unpack_from("<II", data, 0x40)
    fields_size, fields_off = struct.unpack_from("<II", data, 0x50)
    methods_size, methods_off = struct.unpack_from("<II", data, 0x58)
    classes_size, classes_off = struct.unpack_from("<II", data, 0x60)

    strings = []
    for index in range(strings_size):
        pos = u32(strings_off + index * 4)
        _, pos = uleb(data, pos)
        strings.append(data[pos:data.index(0, pos)].decode("utf-8", "replace"))
    types = [strings[u32(types_off + index * 4)] for index in range(types_size)]
    fields = []
    for index in range(fields_size):
        owner, kind, name = struct.unpack_from("<HHI", data, fields_off + index * 8)
        fields.append((types[owner], strings[name], types[kind]))
    methods = []
    for index in range(methods_size):
        owner, _, name = struct.unpack_from("<HHI", data, methods_off + index * 8)
        methods.append((types[owner], strings[name]))

    target_fields = {
        index for index, field in enumerate(fields)
        if field == (TARGET_CLASS, "isPro", "Z")
    }
    if len(target_fields) != 1:
        return 0
    target_field = target_fields.pop()
    matches = 0

    for index in range(classes_size):
        class_off = classes_off + index * 32
        if types[u32(class_off)] != TARGET_CLASS:
            continue
        pos = u32(class_off + 24)
        counts = []
        for _ in range(4):
            count, pos = uleb(data, pos)
            counts.append(count)
        for count in counts[:2]:
            for _ in range(count):
                _, pos = uleb(data, pos)
                _, pos = uleb(data, pos)
        for count in counts[2:]:
            method_index = 0
            for _ in range(count):
                delta, pos = uleb(data, pos)
                method_index += delta
                access, pos = uleb(data, pos)
                code_off, pos = uleb(data, pos)
                if methods[method_index] != (TARGET_CLASS, "<init>") or not code_off:
                    continue
                if access & 0x10001 != 0x10001:
                    continue
                registers, _, _, _, _, code_size = struct.unpack_from("<HHHHII", data, code_off)
                units = struct.unpack_from("<" + "H" * code_size, data, code_off + 16)
                for cursor in range(code_size - 1):
                    word = units[cursor]
                    if word & 0xFF != 0x5C or units[cursor + 1] != target_field:
                        continue
                    source_register = word >> 8 & 0xF
                    has_true_write = (
                        cursor > 0
                        and units[cursor - 1] & 0xFF == 0x12
                        and (units[cursor - 1] >> 8) & 0xF == source_register
                        and (units[cursor - 1] >> 12) & 0xF == 1
                    )
                    if source_register < registers and (not patched or has_true_write):
                        matches += 1
    return matches


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--patched", action="store_true", help="Require the injected const/4 true before isPro write")
    parser.add_argument("apks", nargs="+", help="Official SD Maid SE FOSS APKs")
    args = parser.parse_args()
    failed = False
    for path in args.apks:
        with zipfile.ZipFile(path) as apk:
            count = sum(
                verify_dex(apk.read(name), args.patched)
                for name in apk.namelist() if name.endswith(".dex")
            )
        result = "PASS" if count == 1 else f"FAIL ({count} matching writes)"
        print(f"{result}: {path}")
        failed |= count != 1
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main())
