#!/usr/bin/env python3
"""Exercise the production Kotlin resource transformation and nine-patch geometry.

Requires a JDK, kotlinc and Pillow. This does not simulate an OEM launcher.
"""
import hashlib
import os
from pathlib import Path
import shutil
import struct
import zlib
import subprocess
import tempfile
import xml.etree.ElementTree as ET
from PIL import Image

ROOT = Path(__file__).resolve().parents[1]
ANDROID = '{http://schemas.android.com/apk/res/android}'
FIXTURE = {
    'res/layout/widgetschedule_chip_background.xml': '''<ImageView xmlns:android="http://schemas.android.com/apk/res/android" android:id="@id/agenda_item_color" android:src="@drawable/widget_chip_fill" android:scaleType="fitXY"/>''',
    'res/drawable/widget_chip_fill.xml': '''<layer-list xmlns:android="http://schemas.android.com/apk/res/android"><item><shape android:shape="rectangle"><solid android:color="?widget_blue"/><corners android:radius="@dimen/widget_chip_corner_radius"/></shape></item><item><ripple android:color="?colorControlHighlight"><item android:gravity="center" android:id="@android:id/mask"><shape android:shape="rectangle"><corners android:radius="12.0dip"/><solid android:color="@android:color/black"/></shape></item></ripple></item></layer-list>''',
    'res/drawable/widget_chip_outline.xml': '''<shape xmlns:android="http://schemas.android.com/apk/res/android" android:shape="rectangle"><stroke android:width="1.0dip" android:color="?widget_blue"/><solid android:color="#00000000"/><corners android:radius="@dimen/widget_chip_corner_radius"/></shape>''',
    'res/values/dimens.xml': '<resources><dimen name="widget_chip_corner_radius">12.0dip</dimen></resources>',
}

def snapshot(root):
    return {str(p.relative_to(root)): hashlib.sha256(p.read_bytes()).hexdigest()
            for p in root.rglob('*') if p.is_file()}

def fixture(root):
    for name, content in FIXTURE.items():
        path = root / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(content)

def nine_patch(image, width, height):
    """Stretch the marked centre; copy all fixed edge/corner segments unchanged."""
    # Pillow exposes the aapt2 npTc chunk; Android uses its compiled stretch divs.
    chunk = image.info['npTc']
    assert chunk[:4] == bytes([0, 2, 2, 9])
    xs = struct.unpack_from('>2i', chunk, 32)
    ys = struct.unpack_from('>2i', chunk, 40)
    assert xs == ys == (52, 60)
    source = image
    sx = [0, *xs, source.width]
    sy = [0, *ys, source.height]
    dx = [0, sx[1], width - (source.width - sx[2]), width]
    dy = [0, sy[1], height - (source.height - sy[2]), height]
    assert dx[2] > dx[1] and dy[2] > dy[1]
    result = Image.new('RGBA', (width, height))
    for x in range(3):
        for y in range(3):
            block = source.crop((sx[x], sy[y], sx[x+1], sy[y+1]))
            block = block.resize((dx[x+1]-dx[x], dy[y+1]-dy[y]), Image.Resampling.NEAREST)
            result.paste(block, (dx[x], dy[y]))
    assert result.crop((0, 0, sx[1], sy[1])).tobytes() == source.crop((0, 0, sx[1], sy[1])).tobytes()
    return result

with tempfile.TemporaryDirectory(prefix='calendar-shapes-') as temporary:
    directory = Path(temporary)
    stub = directory / 'PatchException.kt'
    stub.write_text('package app.morphe.patcher.patch\nclass PatchException(message: String): RuntimeException(message)')
    harness = directory / 'ApplyShapes.kt'
    harness.write_text('package app.template.patches.calendar.widget\nimport java.io.File\nfun main(args: Array<String>) { ScheduleTileShapes.install { File(args[0], it) } }')
    jar = directory / 'shapes.jar'
    compiler = os.environ.get('KOTLINC') or shutil.which('kotlinc')
    if not compiler:
        raise SystemExit('A Kotlin compiler is required; set KOTLINC to its absolute path.')
    production = ROOT / 'patches/src/main/kotlin/app/template/patches/calendar/widget/ScheduleTileShapes.kt'
    subprocess.run([compiler, str(production), str(stub), str(harness), '-include-runtime', '-d', str(jar)], check=True)
    def run(root, success=True):
        result = subprocess.run(['java', '-jar', str(jar), str(root)], capture_output=True, text=True)
        assert (result.returncode == 0) == success, result.stderr

    clean = directory / 'clean'
    fixture(clean)
    before = snapshot(clean)
    run(clean)
    after = snapshot(clean)
    assert all(after[name] == digest for name, digest in before.items()), 'native pre-36 inputs changed'
    for name, count in [('widget_chip_fill', 2), ('widget_chip_outline', 1)]:
        document = ET.parse(clean / f'res/drawable-v36/{name}.xml')
        assert not list(document.iter('shape')), 'mutable shape remains'
        patches = list(document.iter('nine-patch'))
        assert len(patches) == count
        assert patches[0].get(ANDROID + 'tint') == '?widget_blue'
        png = clean / f'res/drawable-xxxhdpi/dudeks_{name}_pixels.png'
        data = png.read_bytes()
        position = 8
        chunks = {}
        while position < len(data):
            length = struct.unpack_from('>I', data, position)[0]
            kind = data[position + 4:position + 8]
            payload = data[position + 8:position + 8 + length]
            crc = struct.unpack_from('>I', data, position + 8 + length)[0]
            assert zlib.crc32(kind + payload) == crc, 'corrupt PNG chunk'
            chunks[kind] = payload
            position += length + 12
        assert b'npTc' in chunks, 'Android nine-patch chunk missing'
        image = Image.open(png).convert('RGBA')
        image.info['npTc'] = chunks[b'npTc']
        assert image.size == (112, 112), 'uncompiled border remains'
        for width, height in [(960, 144), (1920, 144), (960, 208), (2560, 320)]:
            rendered = nine_patch(image, width, height)
            assert rendered.getpixel((0, 0))[3] == 0
            assert rendered.getpixel((width // 4, 0))[3] > 240, 'top edge became an ellipse'
            assert rendered.getpixel((width // 2, height // 2))[3] == (255 if count == 2 else 0)
    fill = ET.parse(clean / 'res/drawable-v36/widget_chip_fill.xml')
    ripple = next(fill.iter('ripple'))
    assert ripple.get(ANDROID + 'color') == '?colorControlHighlight'
    assert next(ripple.iter('item')).get(ANDROID + 'id') == '@android:id/mask'
    assert list(ripple.iter('nine-patch'))[0].get(ANDROID + 'tint') == '@android:color/black'
    existing = snapshot(clean)
    run(clean, False)
    assert snapshot(clean) == existing, 'already patched input was modified'
    # Resource-decoder equivalence: dp vs dip, integer vs float, inline vs reference.
    for index, spelling in enumerate(['12dp', '12.0dp', '12dip', '12.000000dip', '+12.0dp']):
        root = directory / f'normalized-{index}'
        fixture(root)
        (root / 'res/values/dimens.xml').write_text(f'<resources><dimen name="widget_chip_corner_radius">{spelling}</dimen></resources>')
        for name in ['widget_chip_fill', 'widget_chip_outline']:
            path = root / f'res/drawable/{name}.xml'
            path.write_text(path.read_text().replace('@dimen/widget_chip_corner_radius', spelling).replace('12.0dip', spelling))
        before = snapshot(root)
        run(root)
        after = snapshot(root)
        assert all(after[name] == digest for name, digest in before.items())
    root = directory / 'dimension-alias'
    fixture(root)
    (root / 'res/values/dimens.xml').write_text('<resources><dimen name="widget_chip_corner_radius">@dimen/corner_alias</dimen><dimen name="corner_alias">12dp</dimen></resources>')
    run(root)
    for kind in ['radius', 'layout', 'variant', 'partial', 'units', 'cycle', 'missing', 'inline-radius']:
        root = directory / kind
        fixture(root)
        if kind == 'radius':
            (root / 'res/values/dimens.xml').write_text('<resources><dimen name="widget_chip_corner_radius">18.0dip</dimen></resources>')
        elif kind in ['units', 'cycle', 'missing']:
            value = {'units': '12px', 'cycle': '@dimen/widget_chip_corner_radius', 'missing': '@dimen/absent'}[kind]
            (root / 'res/values/dimens.xml').write_text(f'<resources><dimen name="widget_chip_corner_radius">{value}</dimen></resources>')
        elif kind == 'inline-radius':
            path = root / 'res/drawable/widget_chip_fill.xml'
            path.write_text(path.read_text().replace('12.0dip', '18dp'))
        elif kind == 'layout':
            (root / 'res/layout/widgetschedule_chip_background.xml').write_text(FIXTURE['res/layout/widgetschedule_chip_background.xml'].replace('fitXY', 'centerCrop'))
        else:
            path = root / ('res/drawable-night/widget_chip_fill.xml' if kind == 'variant' else 'res/drawable-xxxhdpi/dudeks_widget_chip_outline_pixels.png')
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text('unexpected')
        before = snapshot(root)
        run(root, False)
        assert snapshot(root) == before, f'{kind}: rejected input partially modified'
print('PASS: dp/dip/reference normalization and invalid geometry rejection; production transformer, native inputs, theme/tint/ripple, fixed corners at 4 sizes, clean-input rejection')
