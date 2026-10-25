#!/usr/bin/env python3
"""Emulate all palette call sites for both modes without running Immich."""
import argparse
import struct
from pathlib import Path
from unicorn import Uc, UC_ARCH_ARM64, UC_MODE_ARM
from unicorn.arm64_const import UC_ARM64_REG_X0, UC_ARM64_REG_X1, UC_ARM64_REG_X2, UC_ARM64_REG_X3, UC_ARM64_REG_X4, UC_ARM64_REG_X22, UC_ARM64_REG_X27, UC_ARM64_REG_X28, UC_ARM64_REG_X29, UC_ARM64_REG_X30

p = argparse.ArgumentParser()
p.add_argument('libapp')
p.add_argument('recipe')
args = p.parse_args()
source = Path(args.libapp).read_bytes()
binary = bytearray(source)
lines = [line for line in Path(args.recipe).read_text().splitlines() if line and not line.startswith('#')]
sites = []
for line in lines[1:]:
    address, before, after = line.split('\t')
    offset = int(address, 16)
    before, after = bytes.fromhex(before), bytes.fromhex(after)
    assert binary[offset:offset+len(before)] == before
    binary[offset:offset+len(after)] = after
    if len(after) == 8:
        sites.append(offset)
assert len(sites) == 49
uc = Uc(UC_ARCH_ARM64, UC_MODE_ARM)
uc.mem_map(0, (len(binary)+0xfff) & ~0xfff)
uc.mem_write(0, bytes(binary))
uc.mem_map(0x30000000, 0x10000)
uc.mem_map(0x40000000, 0x40000)
dark_pointer, light_pointer = 0x60000001, 0x60000021
uc.mem_write(0x40019d38, struct.pack('<Q', dark_pointer))
results = []
for brightness in (light_pointer, dark_pointer):
    colors = []
    for site in sorted(sites):
        uc.reg_write(UC_ARM64_REG_X0, 0)
        uc.reg_write(UC_ARM64_REG_X2, brightness)
        uc.reg_write(UC_ARM64_REG_X27, 0x40000000)
        uc.reg_write(UC_ARM64_REG_X29, 0x30001000)
        uc.reg_write(UC_ARM64_REG_X30, 0)
        uc.emu_start(site, site+8, count=30)
        color = uc.reg_read(UC_ARM64_REG_X0)
        assert struct.unpack('<Q', uc.mem_read(0x30000fc8, 8))[0] == color
        colors.append(color)
    results.append(colors)
assert results[0][0] == 0xff8839ef and results[1][0] == 0xffc6a0f6
assert results[0][30] == 0xffeff1f5 and results[1][30] == 0xff24273a
assert results[0][38] == 0xff4c4f69 and results[1][38] == 0xffcad3f5
scheme = 0x30002001
uc.mem_write(scheme+0xb, struct.pack('<I', 0x12345679))
uc.mem_write(scheme+0x7f, struct.pack('<I', 0x23456789))
for site, destination in ((0x13fdac8, UC_ARM64_REG_X0), (0x13fdfec, UC_ARM64_REG_X1)):
    uc.reg_write(UC_ARM64_REG_X0, scheme)
    uc.reg_write(UC_ARM64_REG_X2, scheme)
    uc.emu_start(site, site+4, count=1)
    assert uc.reg_read(destination) == 0x12345679
for site in (0x13fdc24, 0x13fe028):
    assert binary[site:site+4] == source[site:site+4], 'Unselected/disabled label changed'
property_pointer, style_pointer = 0x30003001, 0x30004001
uc.mem_write(0x40034738, struct.pack('<Q', property_pointer))
uc.mem_write(property_pointer+0xb, struct.pack('<I', style_pointer))
uc.reg_write(UC_ARM64_REG_X28, 0)
uc.reg_write(UC_ARM64_REG_X29, 0x30001000)
uc.emu_start(0x13fdee4, 0x13fdef8, count=5)
assert uc.reg_read(UC_ARM64_REG_X3) == style_pointer
assert struct.unpack('<Q', uc.mem_read(0x30000ff0, 8))[0] == style_pointer
uc.reg_write(UC_ARM64_REG_X1, scheme)
uc.reg_write(UC_ARM64_REG_X22, 0x12345)
uc.emu_start(0x12afe88, 0x12afe8c, count=1)
assert struct.unpack('<I', uc.mem_read(scheme+0x23, 4))[0] == 0x12345
uc.mem_write(0x30000fe0, struct.pack('<Q', scheme))
uc.mem_write(scheme+0x93, struct.pack('<I', 0x34567891))
uc.emu_start(0x12afe38, 0x12afe54, count=7)
assert uc.reg_read(UC_ARM64_REG_X4) == 0x34567891
assert results[1][34] == 0xff1e2030
assert binary[0x12afe58:0x12afe60] == source[0x12afe58:0x12afe60]
print('PASS: all 98 native palette lookups return and spill correctly; Latte/Macchiato accents, surfaces and text verified')
print('PASS: selected label paths read primary; unselected and disabled paths preserved')
print('PASS: all-states override removed; resolver retains the exact original label TextStyle')
print('PASS: dark dock uses Mantle through surfaceContainerLow; light dock preserved')
