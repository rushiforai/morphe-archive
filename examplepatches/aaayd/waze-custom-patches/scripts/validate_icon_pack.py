"""Check shipped pack against extracted sources, Waze dimensions and mesh UV regions."""
import hashlib
import io
import json
from pathlib import Path
import zipfile
import argparse
from PIL import Image, ImageChops, ImageDraw

root = Path(__file__).resolve().parents[1]
parser = argparse.ArgumentParser()
parser.add_argument('--apk', type=Path, default=root/'dist/waze-5.24.5.0-themes-moods-badges-arm64.apk')
args = parser.parse_args()
sha = lambda b: hashlib.sha256(b).hexdigest()
report = json.loads((root/'references/google-maps-icons/pack-manifest.json').read_text())
with zipfile.ZipFile(root/'downloads/waze-arm64/base.apk') as original, zipfile.ZipFile(args.apk) as patched:
    paths = patched.read('assets/morphe/iconpacks/paths.txt').decode().splitlines()
    rows=report['assets']+report.get('aliases',[])
    assert len(set(paths)) == len(paths) == len(rows)
    assert set(paths) == {r['path'] for r in rows}
    for row in rows:
        path = row['path']
        assert '..' not in path and not path.startswith('/')
        is_alias='template' in row
        stock = (patched if is_alias else original).read('assets/res/skins/default/'+path)
        assert patched.read('assets/res/skins/default/'+path) == stock
        data = patched.read('assets/morphe/iconpacks/google_maps/'+path)
        assert sha(stock) == row['original_sha256'] and sha(data) == row['sha256']
        im = Image.open(io.BytesIO(data)).convert('RGBA')
        assert list(im.size) == row['size'] and im.getbbox()
        old = Image.open(io.BytesIO(stock)).convert('RGBA')
        if not row.get('fallback'): assert im.tobytes() != old.tobytes(), path
        if is_alias:
            template=Image.open(io.BytesIO(original.read('assets/res/skins/default/'+row['template']))).convert('RGBA')
            assert im.size==template.size, path
            if not row['texture']:
                bounds=template.getbbox(); actual=im.getbbox()
                assert actual[0]>=bounds[0] and actual[1]>=bounds[1] and actual[2]<=bounds[2] and actual[3]<=bounds[3], path
        if row['texture']:
            # Retain all pixels outside the 222x222 face, including side/bottom UV swatches.
            mask=Image.new('L',im.size,255);ImageDraw.Draw(mask).rectangle((17,17,238,238),fill=0)
            if not row.get('fallback'): assert ImageChops.difference(im,old).convert('RGB').getbbox() is not None
            for channel in ImageChops.difference(im,old).split():
                assert ImageChops.multiply(channel,mask).getbbox() is None, path
    # Exact camera palette survives vector rasterization in the report artwork.
    camera=Image.open(io.BytesIO(patched.read('assets/morphe/iconpacks/google_maps/alert_icons/icon_report_camera_speed@3x.png'))).convert('RGBA')
    colors=set(camera.get_flattened_data())
    assert (227,116,0,255) in colors and (255,255,255,255) in colors
    police=Image.open(io.BytesIO(patched.read('assets/morphe/iconpacks/google_maps/bigpin_police@3x.png'))).convert('RGBA')
    assert {(27,110,243,255),(255,255,255,255)} <= set(police.get_flattened_data())
    for row in report['assets']:
        if row['icon'] != 'jam': continue
        traffic=Image.open(io.BytesIO(patched.read('assets/morphe/iconpacks/google_maps/'+row['path']))).convert('RGBA')
        assert {(220,54,46,255),(255,255,255,255)} <= set(traffic.get_flattened_data()), row['path']
    for path in ['bigpin_closure@3x.png','map_pins_report_closure_albedo@3x.png',
                 'bigpin_blocked_lane@3x.png','map_pins_report_blocked-lane_albedo@3x.png',
                 'bigpin_hazard_stopped@3x.png','map_pins_report_hazard-stopped_albedo@3x.png',
                 'alert_icons/icon_report_hazard_stopped@3x.png']:
        closure=Image.open(io.BytesIO(patched.read('assets/morphe/iconpacks/google_maps/'+path))).convert('RGBA')
        assert {(220,54,46,255),(255,255,255,255)} <= set(closure.get_flattened_data()), path
    # Warning glyph must stay inside 85% of the circular face radius, including mesh textures.
    for path in ['bigpin_hazard@3x.png','map_pins_report_hazards_albedo@3x.png']:
        im=Image.open(io.BytesIO(patched.read('assets/morphe/iconpacks/google_maps/'+path))).convert('RGBA')
        if path.startswith('map_pins'): im=im.crop((17,17,239,239))
        else: im=im.crop(im.getbbox())
        radius=min(im.size)/2
        points=[((x+.5-im.width/2)**2+(y+.5-im.height/2)**2)**.5 for y in range(im.height) for x in range(im.width)
                if max(im.getpixel((x,y))[:3])<30 and im.getpixel((x,y))[3]>200]
        assert points and max(points)<radius*.85, (path,max(points),radius)
for resource in report['resources']:
    data=(root/'references/google-maps-icons/extracted'/resource['file']).read_bytes()
    assert sha(data)==resource['sha256']
result={'assets':len(paths),'source_resources':len(report['resources']),'originals_unchanged':True,'dimensions_preserved':True,'texture_uv_regions_preserved':True,'camera_exact_source_colors':True}
(root/'dist/validation-icon-pack.json').write_text(json.dumps(result,indent=2))
print('PASS:',json.dumps(result))
