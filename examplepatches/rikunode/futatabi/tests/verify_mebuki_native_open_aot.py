"""A2: execute the actual APK's two ARM64 AppLinks hooks, with a mocked Dart heap.

The stock URI.toString result is passed in x0. The only substituted value is
an exact Mebuki loopback thread string in the existing tagged URI stack slot.
The second hook receives the same frame after the stock global-key setup.
No new Dart call/GC site is introduced. Android/Flutter runtime is not emulated.
"""
import struct
import sys
import zipfile

from unicorn import Uc, UC_ARCH_ARM64, UC_MODE_ARM
from unicorn.arm64_const import (
    UC_ARM64_REG_X0, UC_ARM64_REG_X2, UC_ARM64_REG_X16,
    UC_ARM64_REG_X27, UC_ARM64_REG_X29, UC_ARM64_REG_X30,
)

with zipfile.ZipFile(sys.argv[1]) as apk:
    code = apk.read("lib/arm64-v8a/libapp.so")

assert code[0x7ac4d8:0x7ac4dc].hex() == "79e80b14"
assert code[0x7ac5ec:0x7ac5f0].hex() == "6ce80b14"
assert struct.unpack_from("<QQ", code, 0xd0) in ((0x6867ec, 0x6867ec), (0x6868ac, 0x6868ac), (0x6869e4, 0x6869e4))
HEAP, FRAME, PP = 0x11000000, 0x12008000, 0x13000000
URI, STRING = HEAP + 1, HEAP + 0x1001
URL = "http://127.0.0.1:18765/mebuki/res/1234567890123.htm"

def run(value, cid, expected):
    u = Uc(UC_ARCH_ARM64, UC_MODE_ARM)
    u.mem_map(0, 0xac0000)
    u.mem_write(0, code)
    u.mem_map(HEAP, 0x10000)
    u.mem_map(FRAME - 0x8000, 0x10000)
    u.mem_map(PP, 0x20000)
    # Tagged non-string URI and one-/two-byte Dart strings.
    u.mem_write(URI - 1, struct.pack("<I", 0x100 << 12))
    u.mem_write(STRING - 1, struct.pack("<I", cid << 12))
    u.mem_write(STRING + 7, struct.pack("<I", 2 * len(value)))
    u.mem_write(STRING + 15, value.encode("latin-1" if cid == 94 else "utf-16le"))
    u.mem_write(FRAME - 0x18, struct.pack("<Q", URI))
    for reg, val in ((UC_ARM64_REG_X0, STRING), (UC_ARM64_REG_X27, PP),
                     (UC_ARM64_REG_X29, FRAME), (UC_ARM64_REG_X30, 0x7ac4d8)):
        u.reg_write(reg, val)
    u.emu_start(0x7ac4d8, 0x7ac50c if expected else 0x7ac4dc, count=2000)
    assert u.reg_read(UC_ARM64_REG_X0) == STRING
    assert u.reg_read(UC_ARM64_REG_X30) == 0x7ac4d8
    assert struct.unpack("<Q", u.mem_read(FRAME - 0x18, 8))[0] == (STRING if expected else URI)
    if not expected:
        assert u.reg_read(UC_ARM64_REG_X16) == PP + 0x1e000
    # Skip only the unmodified global-key setup. Check the exact input at
    # 0x7acaa0 (stock URL store, then pushAndOpen/fetch/navigation).
    u.emu_start(0x7ac5ec, 0x7acaa0 if expected else 0x7ac5f0, count=2000)
    if expected:
        assert u.reg_read(UC_ARM64_REG_X0) == STRING
        u.emu_start(0x7acaa0, 0x7acaa8, count=2)
        assert struct.unpack("<Q", u.mem_read(FRAME - 0x20, 8))[0] == STRING
    else:
        assert u.reg_read(UC_ARM64_REG_X2) == URI

cases = [
    URL, URL.replace("1234567890123", "9876543210987"),
    URL.replace("http:", "https:"), URL.replace("18765", "18766"),
    URL.replace("127.0.0.1", "127.0.0.2"),
    URL.replace("mebuki", "aimoge"), URL.replace("mebuki", "animanch"),
    URL.replace("res/", "src/"), URL + "?x=1", URL + "#x",
    URL.replace("1234567890123", "0123456789012"),
    URL.replace("1234567890123", "123456789012"), URL[:-1] + "x",
    URL.replace("1234567890123", "123456789012a"),
    "https://may.2chan.net/b/res/1234567890.htm",
    "https://img.2chan.net/b/", "",
]
for cid in (94, 95):
    for index, value in enumerate(cases):
        run(value, cid, index < 2)
run(URL.replace("1234567890123", "123456789012\u0100"), 95, False)
print("PASS A2 native AppLinks", 2 * len(cases) + 1, "URL cases; exact URL and original continuation")
