"""Verify Wanderlog APKM output: reviewed HBC98 edits, footer, OTA guard and unchanged payloads.

The expected bundle is rebuilt from the stock bundle using function names and semantic site
patterns, so both reviewed versions (2.227 and 2.228) are checked without absolute offsets.
"""
import argparse
import hashlib
import io
from pathlib import Path
import re
import struct
import subprocess
import zipfile

MAGIC = 0x1F1903C103BC1FC6
BILLING_HEADLINE = b"Pro guides you from idea to itinerary"
BILLING_REPLACEMENT = b"Pro is Activated by BadFella for you!"
PROFILE_KEY = b"Get Pro"
PROFILE_LABEL = b"Pro Activated"
PROFILE_STORAGE = b"faRedditSquare"
RETURN_UNDEFINED = b"\x93\x00\x76\x00\x00\x00"

# (role, function name, size, [(relative offset, "tier" | (stock bytes, patched bytes))])
ROLES = [
    ("shouldShowSubscribeOrTrialModal", "shouldShowSubscribeOrTrialModal", 339,
     [(57, "tier"), (177, "tier"), (327, (b"\x17\x03\x05\x03", b"\x96\x03\x96\x04"))]),
    ("shouldShowUpgradeOrResubscribeModal", "shouldShowUpgradeOrResubscribeModal", 311,
     [(39, "tier"), (161, "tier")]),
    ("shouldShowProBadge", "shouldShowProBadge", 318, [(46, "tier"), (168, "tier")]),
    ("canUserStartSubscription", "canUserStartSubscription", 317, [(33, "tier"), (155, "tier")]),
    ("isTrialOrProUser", "isTrialOrProUser", 305, [(33, "tier"), (155, "tier")]),
    ("getUserTierFromLatestSubscription", "getUserTierFromLatestSubscription", 256,
     [(33, "tier"), (152, "tier")]),
    ("RoundProButton", "RoundProButton", 549, [(0, (b"\x34\x07\x00\x89\x03\x01", RETURN_UNDEFINED))]),
    ("canAutoShowSubscribeModal", "canAutoShowSubscribeModal", 259,
     [(0, (b"\x34\x0b\x00\x89\x06\x01", RETURN_UNDEFINED))]),
    ("paywallGateA", "getCanAutoShowSubscribeModal_", 189,
     [(0, (b"\x34\x04\x00\x04\x03\x89", RETURN_UNDEFINED))]),
    ("paywallGateB", "getCanAutoShowSubscribeModal_", 257,
     [(0, (b"\x34\x05\x00\x34\x06\x01", RETURN_UNDEFINED))]),
    ("DarkModeContextProvider", "DarkModeContextProvider", 297,
     [(190, (b"\xb2\x51\x0a", b"\xb2\x03\x0a")), (229, (b"\xd3\x2a\x08\x09", b"\xd3\x04\x08\x09"))]),
]


def sha1(data):
    return hashlib.sha1(data).digest()


class Bundle:
    def __init__(self, data):
        self.data = data
        self.size = len(data)
        assert struct.unpack_from("<Q", data, 0)[0] == MAGIC, "Not Hermes bytecode"
        assert struct.unpack_from("<I", data, 8)[0] == 98, "Unexpected Hermes bytecode version"
        assert struct.unpack_from("<I", data, 32)[0] == self.size, "Invalid Hermes bundle length"
        self.footer = self.size - 20
        assert sha1(data[:self.footer]) == data[-20:], "Invalid HBC footer"
        self.count = struct.unpack_from("<I", data, 40)[0]
        assert 0 < self.count <= 250_000, "Invalid function table"
        self.table_end = 128 + self.count * 12
        assert self.table_end <= self.footer, "Truncated function table"
        kind_count, ident_count, self.string_count, overflow_count, storage_size = struct.unpack_from(
            "<5I", data, 44)
        ident_off = self.table_end + kind_count * 4
        self.string_table_off = ident_off + ident_count * 4
        self.overflow_table_off = self.string_table_off + self.string_count * 4
        self.storage_off = self.overflow_table_off + overflow_count * 8
        assert self.storage_off + storage_size <= self.footer, "Invalid string table"
        self.overflow_count = overflow_count
        self.storage_size = storage_size
        self.functions = []
        for index in range(self.count):
            header = 128 + index * 12
            first, second, third = struct.unpack_from("<III", data, header)
            offset = first & 0x1FFFFFF
            size = second & 0x3FFF
            name_id = (second >> 14) & 0xFF
            if data[header + 11] & 0x20:
                large = (name_id << 24) | offset
                assert 128 + self.count * 12 <= large <= self.footer - 36, "Invalid overflow header"
                offset = struct.unpack_from("<I", data, large)[0]
                size = struct.unpack_from("<I", data, large + 12)[0]
                name_id = struct.unpack_from("<I", data, large + 16)[0]
            assert offset >= self.table_end and offset + size <= self.footer, "Invalid function bounds"
            assert name_id < self.string_count, "Invalid function name reference"
            self.functions.append((index, offset, size, name_id))

    def entry(self, index):
        return struct.unpack_from("<I", self.data, self.string_table_off + index * 4)[0]

    def is_overflow(self, index):
        return (self.entry(index) >> 24) & 0xFF == 0xFF

    def is_utf16(self, index):
        return self.entry(index) & 1 == 1

    def length(self, index):
        entry = self.entry(index)
        if self.is_overflow(index):
            return struct.unpack_from("<I", self.data, self.overflow_table_off +
                                      ((entry >> 1) & 0x7FFFFF) * 8 + 4)[0]
        return (entry >> 24) & 0xFF

    def raw_offset(self, index):
        entry = self.entry(index)
        if self.is_overflow(index):
            relative = struct.unpack_from("<I", self.data, self.overflow_table_off +
                                          ((entry >> 1) & 0x7FFFFF) * 8)[0]
        else:
            relative = (entry >> 1) & 0x7FFFFF
        return self.storage_off + relative

    def string(self, index):
        start = self.raw_offset(index)
        if self.is_utf16(index):
            return self.data[start:start + self.length(index) * 2].decode("utf-16-le")
        return self.data[start:start + self.length(index)].decode("latin-1")

    def entry_offset(self, index):
        return self.string_table_off + index * 4

    def exact_entry(self, text):
        value = text.decode("latin-1")
        hits = [i for i in range(self.string_count)
                if not self.is_overflow(i) and not self.is_utf16(i)
                and self.length(i) == len(value)
                and self.data[self.raw_offset(i):self.raw_offset(i) + len(value)] == text]
        assert len(hits) == 1, f"Hermes string entry is missing or ambiguous: {value}"
        return hits[0]

    def containing_entry(self, text):
        hits = [i for i in range(self.string_count)
                if not self.is_overflow(i) and len(text) <= self.length(i)
                and text.decode("latin-1") in self.string(i)]
        assert len(hits) == 1, f"Hermes containing string is missing or ambiguous: {text!r}"
        return hits[0]

    def function_named(self, name, size):
        hits = [f for f in self.functions if f[2] == size and self.string(f[3]) == name]
        assert len(hits) == 1, f"Wanderlog function is missing or ambiguous: {name} ({size} bytes)"
        return hits[0]


def expected_bundle(stock):
    before = Bundle(stock)
    free = before.exact_entry(b"free")
    pro = before.exact_entry(b"pro")
    free_bytes = struct.pack("<H", free)
    pro_bytes = struct.pack("<H", pro)
    expected = bytearray(stock)
    for role, name, size, sites in ROLES:
        index, offset, length, _ = before.function_named(name, size)
        for relative, spec in sites:
            stock_bytes, patched_bytes = (free_bytes, pro_bytes) if spec == "tier" else spec
            actual = stock[offset + relative:offset + relative + len(stock_bytes)]
            assert actual == stock_bytes, f"Stock {role} site changed at {relative}: {actual.hex()}"
            expected[offset + relative:offset + relative + len(patched_bytes)] = patched_bytes

    key = before.exact_entry(PROFILE_KEY)
    label = before.exact_entry(PROFILE_STORAGE)
    label_raw = before.raw_offset(label)
    relative = label_raw - before.storage_off
    assert relative < (1 << 23), "Profile label storage is out of range"
    expected[label_raw:label_raw + len(PROFILE_LABEL)] = PROFILE_LABEL
    struct.pack_into("<I", expected, before.entry_offset(key),
                     (len(PROFILE_LABEL) << 24) | (relative << 1))

    headline = before.containing_entry(BILLING_HEADLINE)
    text = before.string(headline)
    start = text.index(BILLING_HEADLINE.decode("latin-1"))
    assert text.count(BILLING_HEADLINE.decode("latin-1")) == 1, "Billing headline is ambiguous"
    assert len(BILLING_HEADLINE) == len(BILLING_REPLACEMENT), "Billing headline length changed"
    raw = before.raw_offset(headline) + start
    expected[raw:raw + len(BILLING_REPLACEMENT)] = BILLING_REPLACEMENT
    expected[-20:] = sha1(bytes(expected[:-20]))
    return bytes(expected), before


def verify(args):
    with zipfile.ZipFile(args.stock) as stock, zipfile.ZipFile(args.output) as output:
        assert len(output.namelist()) == len(set(output.namelist())), "Duplicate ZIP entry"
        with zipfile.ZipFile(io.BytesIO(stock.read("base.apk"))) as base:
            before = base.read("assets/index.android.bundle")
            after = output.read("assets/index.android.bundle")
            assert len(before) == len(after) and int.from_bytes(after[8:12], "little") == 98
            expected, parsed = expected_bundle(before)
            assert after == expected, "Hermes bytecode differs from the reviewed edits"
            dex = {n for n in base.namelist() if re.fullmatch(r"classes\d*\.dex", n)}
            assert dex == {n for n in output.namelist() if re.fullmatch(r"classes\d*\.dex", n)}
            for name in base.namelist():
                if name in dex or name.startswith("assets/") and name != "assets/index.android.bundle":
                    assert base.read(name) == output.read(name), "Original payload changed: " + name
        natives = {}
        for name in stock.namelist():
            if not name.endswith(".apk"):
                continue
            with zipfile.ZipFile(io.BytesIO(stock.read(name))) as split:
                for item in split.infolist():
                    if item.filename.startswith("lib/") and not item.is_dir():
                        natives[item.filename] = (split.read(item), item.compress_type)
        assert set(natives) == {n for n in output.namelist() if n.startswith("lib/") and not n.endswith("/")}
        for name, (data, compression) in natives.items():
            assert output.read(name) == data and output.getinfo(name).compress_type == compression, "Native payload changed"
    manifest = subprocess.check_output([str(args.aapt2), "dump", "xmltree", str(args.output),
        "--file", "AndroidManifest.xml"], text=True, encoding="utf-8")
    assert re.search(r'expo.modules.updates.ENABLED[^\n]*\n[^\n]*=false', manifest), "Expo OTA enabled"
    assert re.search(r'expo.modules.updates.EXPO_UPDATE_URL[^\n]*\n[^\n]*=""', manifest), "OTA URL remains"
    print(f"PASS: {len(ROLES)} function roles through whole-body fingerprints, whole-bundle byte comparison, "
          "profile label, billing headline, valid footer, all DEX, other assets and native payloads "
          "unchanged, OTA disabled")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("stock", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--aapt2", type=Path, required=True)
    verify(parser.parse_args())
