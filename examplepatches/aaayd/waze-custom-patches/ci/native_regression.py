"""Exercise discovery and rejection cases on an authentic renderer fixture."""
import argparse
import io
import struct
import zipfile
from pathlib import Path

from native_icons import Renderer, discover, read_package, verify_assets, require
from PIL import Image


def rejected(data, description):
    try:
        discover(bytes(data))
    except (ValueError, AssertionError):
        return
    raise AssertionError('Accepted invalid renderer: ' + description)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--input', type=Path, required=True)
    args = parser.parse_args()
    original, base = read_package(args.input)
    verify_assets(base)
    report = discover(original)
    require(report['groups'] >= 8 and report['groups'] * 2 <= report['call_sites'] <= report['groups'] * 4,
            'incomplete report coverage')
    renderer = Renderer(original)
    changed = bytearray(original)
    changed[renderer.offset(report['builder'])] ^= 1
    rejected(changed, 'changed builder')
    changed = bytearray(original)
    # Remove an actual icon call without changing the surrounding helper signatures.
    patch = next(p for p in report['patches'] if len(p['before']) == 8)
    struct.pack_into('<I', changed, patch['offset'], 0xd503201f)
    rejected(changed, 'missing report constructor call')
    # An unused duplicate helper is not an ambiguous live report table.
    changed = bytearray(original)
    at = renderer.text['sh_offset']
    start = renderer.offset(report['builder'], 28)
    changed[at:at + 28] = original[start:start + 28]
    duplicate = discover(bytes(changed))
    require(duplicate['groups'] == report['groups'] and duplicate['call_sites'] == report['call_sites'],
            'unreferenced helper duplication changes discovery')
    changed = bytearray(original)
    changed[4] = 1
    rejected(changed, 'wrong ELF class')
    # A build-id change must not disable discovery or produce stale edits.
    note = renderer.elf.get_section_by_name('.note.gnu.build-id')
    require(note is not None and note['sh_size'] > 16, 'build-id fixture missing')
    changed = bytearray(original)
    changed[note['sh_offset'] + note['sh_size'] - 1] ^= 1
    revised = discover(bytes(changed))
    require(revised['source_sha256'] != report['source_sha256'] and revised['patches'] == report['patches'], 'unrelated ELF metadata affects discovery')
    png = io.BytesIO()
    Image.new('RGBA', (1, 1)).save(png, format='PNG')
    archive = io.BytesIO()
    with zipfile.ZipFile(archive, 'w') as target:
        target.writestr('assets/res/skins/default/tinypin_hazard.png', png.getvalue())
    try:
        verify_assets(archive.getvalue())
    except ValueError as error:
        require('template family missing' in str(error), 'unexpected asset failure')
    else:
        raise AssertionError('Accepted an entirely missing icon template family')
    print('PASS native discovery: real report mappings, output disassembly and ELF mapping; rejects changed helpers, missing calls and wrong architecture; accepts unrelated metadata changes and unused helper duplicates')


if __name__ == '__main__':
    main()
