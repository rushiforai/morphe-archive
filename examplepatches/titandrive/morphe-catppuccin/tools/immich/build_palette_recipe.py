#!/usr/bin/env python3
"""Generate a checked, version-pinned AOT patch without rebuilding Immich.

Uses the existing Flutter Color allocations and their original GC safepoints.
The replaced palette lookup is a leaf (no allocation, no runtime calls).
"""
import argparse
import hashlib
from pathlib import Path
import re
import struct
import subprocess
import tempfile
from elftools.elf.elffile import ELFFile

p = argparse.ArgumentParser()
p.add_argument('libapp')
p.add_argument('analysis', help='Blutter asm output directory')
p.add_argument('output')
args = p.parse_args()
binary = Path(args.libapp).read_bytes()
scheme = Path(args.analysis, 'flutter/src/material/color_scheme.dart').read_text()
factory = scheme.split('  factory _ ColorScheme.fromSeed', 1)[1].split('  static _ _buildDynamicScheme', 1)[0]
roles = []
role = None
for line in factory.splitlines():
    match = re.search(r'Field <MaterialDynamicColors\.(\w+)>', line)
    if match:
        role = match[1]
    match = re.search(r'//\s+0x([a-f0-9]+): bl\s+#0x121fde8', line)
    if match:
        roles.append((int(match[1], 16), role))
assert len(roles) == 49

def palette(dark):
    c = dict(zip(('base','mantle','crust','surface0','surface1','surface2','overlay0','overlay1','text','subtext','mauve','lavender','blue','red'),
        ('24273a','1e2030','181926','363a4f','494d64','5b6078','6e738d','8087a2','cad3f5','b8c0e0','c6a0f6','b7bdf8','8aadf4','ed8796') if dark else
        ('eff1f5','e6e9ef','dce0e8','ccd0da','bcc0cc','acb0be','9ca0b0','8c8fa1','4c4f69','5c5f77','8839ef','7287fd','1e66f5','d20f39')))
    out = {}
    for prefix, accent in [('primary','mauve'),('secondary','lavender'),('tertiary','blue'),('error','red')]:
        out[prefix] = c[accent]
        out['on'+prefix.title()] = c['base']
        out[prefix+'Container'] = c['surface0']
        out['on'+prefix.title()+'Container'] = c['text']
        out[prefix+'Fixed'] = c[accent]
        out[prefix+'FixedDim'] = c[accent]
        out['on'+prefix.title()+'Fixed'] = c['base']
        out['on'+prefix.title()+'FixedVariant'] = c['base']
    out.update(surface=c['base'], surfaceDim=c['mantle'], surfaceBright=c['surface0'],
        surfaceContainerLowest=c['crust'], surfaceContainerLow=c['mantle'], surfaceContainer=c['surface0'],
        surfaceContainerHigh=c['surface1'], surfaceContainerHighest=c['surface2'],
        onSurface=c['text'], onSurfaceVariant=c['subtext'], outline=c['overlay1'], outlineVariant=c['surface1'],
        inverseSurface='eff1f5' if dark else '24273a', inverseOnSurface='4c4f69' if dark else 'cad3f5',
        inversePrimary='8839ef' if dark else 'c6a0f6', shadow=c['crust'], scrim=c['crust'],
        background=c['base'], onBackground=c['text'], surfaceVariant=c['surface0'])
    return {key: int('ff'+value, 16) for key, value in out.items()}

light, dark = palette(False), palette(True)
# _buildDynamicScheme has exactly one caller, replaced below. Its 0x204-byte
# allocation-free replacement reads the brightness argument already saved in
# the factory's live root slot. Lookup table entries are [Latte, Macchiato].
assembly = '''.text
add x16, x27, #0x19, lsl #12
ldr x16, [x16, #0xd38]
cmp w2, w16
cset x16, eq
adr x17, palette
add x17, x17, x0, lsl #3
ldr w0, [x17, x16, lsl #2]
stur x0, [x29, #-0x38]
ret
.p2align 3
palette:
'''
for _, role in roles:
    assembly += f'.word 0x{light[role]:08x}, 0x{dark[role]:08x}\n'
with tempfile.TemporaryDirectory() as tmp:
    source, obj = Path(tmp, 'palette.s'), Path(tmp, 'palette.o')
    source.write_text(assembly)
    subprocess.run(['llvm-mc', '-triple=aarch64', '-filetype=obj', str(source), '-o', str(obj)], check=True)
    with obj.open('rb') as f:
        helper = ELFFile(f).get_section_by_name('.text').data()
assert len(helper) <= 0x204

edits = []
def edit(offset, data):
    edits.append((offset, binary[offset:offset+len(data)], data))
def word(value):
    return struct.pack('<I', value)
def bl(site, dest):
    return word(0x94000000 | (((dest-site)//4) & 0x3ffffff))
helper_start = 0x12282e8
edit(helper_start, helper)
# Preserve brightness as the palette input; bypass the now replaced generator.
edit(0x121cee4, word(0xaa0103e0))  # mov x0, x1
for index, (site, _) in enumerate(roles):
    assert binary[site+4:site+8] == bytes.fromhex('a0831cf8')  # original result spill
    edit(site, word(0xd2800000 | (index << 5)) + bl(site+4, helper_start))
# Indigo's copyWith overrides primary/onSurface after the factory returns.
# Keep the factory's complete palette instead. Other presets share that palette.
presets = Path(args.analysis, 'immich_mobile/theme/color_scheme.dart').read_text()
copy_sites = re.findall(r'//\s+0x([a-f0-9]+): bl\s+#[^;]+; .*ColorScheme::copyWith', presets)
assert len(copy_sites) == 2
for site in copy_sites:
    edit(int(site,16), word(0xd503201f))  # nop: x0 already holds the palette

# Selected navigation labels: both the app's font-size override fallback and
# Material's selected-state resolver should read primary instead of onSurface.
# The separate unselected/disabled paths retain their original text colors.
for site in (0x13fdac8, 0x13fdfec):
    instruction = struct.unpack_from('<I', binary, site)[0]
    assert ((instruction >> 12) & 0x1ff) == 0x7f
    edit(site, word((instruction & ~(0x1ff << 12)) | (0xb << 12)))

# Immich's WidgetStatePropertyAll overrides the resolver for every state, even
# though its TextStyle supplies no color. Let Material resolve state colors and
# feed that resolver the exact same 14px/medium/ellipsis TextStyle constant.
with tempfile.TemporaryDirectory() as tmp:
    source, obj = Path(tmp, 'labels.s'), Path(tmp, 'labels.o')
    source.write_text('''.text
add x3, x27, #0x34, lsl #12
ldr x3, [x3, #0x738]
ldur w3, [x3, #0xb]
add x3, x3, x28, lsl #32
stur x3, [x29, #-0x10]
''')
    subprocess.run(['llvm-mc', '-triple=aarch64', '-filetype=obj', str(source), '-o', str(obj)], check=True)
    with obj.open('rb') as f:
        label_style = ELFFile(f).get_section_by_name('.text').data()
assert len(label_style) == 20
edit(0x13fdee4, label_style)
# stur w22, [x1, #0x23] -- NULL rather than the all-states property.
edit(0x12afe88, word((struct.unpack_from('<I', binary, 0x12afe88)[0] & ~31) | 22))

# Only the dark navigation dock uses surfaceContainerLow (Mantle). Keep other
# raised surfaces and the light-mode dock unchanged.
with tempfile.TemporaryDirectory() as tmp:
    source, obj = Path(tmp, 'dock.s'), Path(tmp, 'dock.o')
    source.write_text('''.text
ldur x0, [x29, #-0x20]
ldur w2, [x0, #0x93]
add x2, x2, x28, lsl #32
nop
nop
nop
''')
    subprocess.run(['llvm-mc', '-triple=aarch64', '-filetype=obj', str(source), '-o', str(obj)], check=True)
    with obj.open('rb') as f:
        dock = ELFFile(f).get_section_by_name('.text').data()
assert len(dock) == 24
edit(0x12afe38, dock)

lines = ['# Immich 3.3.5 arm64; SHA256 checked before modifying any byte.', hashlib.sha256(binary).hexdigest()]
for offset, before, after in sorted(edits):
    lines.append(f'{offset:x}\t{before.hex()}\t{after.hex()}')
Path(args.output).write_text('\n'.join(lines)+'\n')
print(f'Generated {len(edits)} verified edits, 49 semantic colors, {len(helper)}-byte leaf lookup')
