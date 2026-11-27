"""Rasterize extracted Google Maps artwork into Waze's existing asset dimensions.

No generated/redrawn glyphs: paths come from the installed Maps APK. Incident
background/foreground constants come from amvy (Maps' bundled incident renderer).
Waze's mesh texture outside the circular face is preserved to keep its UV layout.
"""
import base64
import hashlib
import io
import json
import os
from pathlib import Path
import re
import subprocess
import xml.etree.ElementTree as ET
import zipfile

from PIL import Image, ImageDraw
from playwright.sync_api import sync_playwright

ROOT = Path(__file__).resolve().parents[1]
EXTRACTED = ROOT / 'references/google-maps-icons/extracted'
OUTPUT = ROOT / 'src/main/resources/iconpacks/google_maps'
NS = 'http://www.w3.org/2000/svg'
ET.register_namespace('', NS)
# Bundled Maps amvy incident styles: warning (default), red (2), blue (4).
INCIDENT_STYLES = {'police': ('#1B6EF3', '#FFFFFF'), 'road_closure': ('#DC362E', '#FFFFFF'),
                   'lane_closure': ('#DC362E', '#FFFFFF'), 'stalled_vehicle': ('#DC362E', '#FFFFFF'),
                   'jam': ('#DC362E', '#FFFFFF')}
WARNING_STYLE = ('#FFBB29', '#000000')


def sha(data):
    return hashlib.sha256(data).hexdigest()


def main():
    manifest = json.loads((EXTRACTED / 'manifest.json').read_text())
    resources = {e['name']: e for e in manifest if e['kind'] == 'raw'}
    used = {}

    def raw(name):
        entry = resources[name]
        data = (EXTRACTED / entry['file']).read_bytes()
        assert sha(data) == entry['sha256'], name
        used[name] = entry
        return ET.fromstring(data)

    def incident(name):
        glyph = 'lane_closure' if name == 'road_closure' else name
        node = raw('ic_report_incident_' + glyph) if name != 'warning' else raw('car_only_ic_incident_warning_36dp')
        background, foreground = INCIDENT_STYLES.get(name, WARNING_STYLE)
        # Preserve Google's police glyph; apply Maps' blue/white incident style.
        for element in node.iter():
            for attr in ('fill', 'stroke'):
                if element.get(attr, '').lower() in ('white', '#fff', '#ffffff'):
                    element.set(attr, foreground)
        if not node.get('viewBox'):
            node.set('viewBox', '0 0 ' + re.sub(r'[^0-9.]', '', node.get('width')) + ' ' + re.sub(r'[^0-9.]', '', node.get('height')))
        inset = 10 if name == 'warning' else 0
        node.set('x', str(inset)); node.set('y', str(inset))
        node.set('width', str(100 - 2 * inset)); node.set('height', str(100 - 2 * inset))
        svg = ET.Element(f'{{{NS}}}svg', {'viewBox': '0 0 100 100'})
        ET.SubElement(svg, f'{{{NS}}}circle', {'cx': '50', 'cy': '50', 'r': '50', 'fill': background})
        svg.append(node)
        return ET.tostring(svg, encoding='unicode')

    camera = next(e for e in manifest if e['name'] == 'car_only_callout_ic_speed_camera_default_28dp')
    used[camera['name']] = camera
    aapt = Path(os.environ['LOCALAPPDATA']) / 'Android/Sdk/build-tools/36.0.0/aapt2.exe'
    dump = subprocess.check_output([str(aapt), 'dump', 'xmltree', str(ROOT / 'downloads/google-maps-phone/base.apk'), '--file', camera['apk_path']]).decode('utf-8')
    paths = []
    for block in dump.split('E: path')[1:]:
        color = re.search(r'fillColor\([^)]*\)=#([0-9a-f]{8})', block).group(1)
        path = re.search(r'pathData\([^)]*\)="([^"]+)"', block).group(1)
        assert color[:2] == 'ff'
        paths.append(f'<path fill="#{color[2:]}" d="{path}"/>')
    art = {'speed_camera': f'<svg xmlns="{NS}" viewBox="0 0 132 132">' + ''.join(paths) + '</svg>'}
    for kind in ['crash', 'police', 'mobile_speed_camera', 'construction', 'flood', 'fog', 'jam', 'lane_closure', 'object_on_road', 'road_closure', 'snow', 'stalled_vehicle', 'warning']:
        art[kind] = incident(kind)
    art['parking'] = ET.tostring(raw('blue_p_save_parking'), encoding='unicode')
    for kind in ('home', 'work'):
        svg = ET.Element(f'{{{NS}}}svg', {'viewBox': '0 0 32 47'})
        for resource in ('car_only_home_work_pin_outline', 'car_only_home_work_pin_fill'):
            svg.extend(list(raw(resource)))
        glyph = raw('car_only_ic_' + kind + '_36dp')
        glyph.set('x', '6'); glyph.set('y', '6'); glyph.set('width', '20'); glyph.set('height', '20')
        svg.append(glyph)
        art[kind] = ET.tostring(svg, encoding='unicode')

    mapping = {}
    def map_names(kind, *names):
        for name in names:
            assert name not in mapping, name
            mapping[name] = kind
    map_names('speed_camera', 'bigpin_speed_camera', 'alert_icons/icon_report_camera_speed')
    map_names('mobile_speed_camera', 'bigpin_police_mobile_camera', 'map_pins_report_police_mobile_camera_albedo')
    map_names('crash', 'bigpin_accident', 'bigpin_accident_minor', 'smallpin_accident', 'tinypin_accident',
              'map_pins_report_crashes_albedo', 'map_pins_report_crash-minor_albedo', 'map_pins_report_medium_small_accident',
              *['alert_icons/icon_accident_' + s for s in ['major', 'minor', 'other_side', 'other_side_uk']])
    map_names('police', 'bigpin_police', 'smallpin_police', 'tinypin_police', 'map_pins_report_police_albedo', 'map_pins_report_medium_small_police',
              *['alert_icons/icon_report_police_' + s for s in ['hidden', 'visible', 'other_side', 'other_side_uk']])
    map_names('construction', 'bigpin_hazard_construction', 'map_pins_report_hazards_construction_albedo', 'alert_icons/icon_report_hazard_construction')
    map_names('lane_closure', 'bigpin_blocked_lane', 'map_pins_report_blocked-lane_albedo')
    map_names('road_closure', 'bigpin_closure', 'smallpin_closure', 'tinypin_closure', 'map_pins_report_closure_albedo', 'map_pins_report_medium_closure', 'map_pins_report_small_closure')
    map_names('object_on_road', 'bigpin_hazard_object_on_road', 'map_pins_report_hazard-object-on-road_albedo', 'alert_icons/icon_report_hazard_object')
    map_names('stalled_vehicle', 'bigpin_hazard_stopped', 'map_pins_report_hazard-stopped_albedo', 'alert_icons/icon_report_hazard_stopped')
    for weather in ('flood', 'fog', 'snow'):
        map_names(weather, 'bigpin_hazard_weather_' + weather, 'map_pins_report_hazard-weather-' + weather + '_albedo', 'alert_icons/icon_hazard_weather_' + weather)
    map_names('warning', 'bigpin_hazard', 'bigpin_hazardonroad', 'smallpin_hazard', 'tinypin_hazard', 'map_pins_report_hazards_albedo',
              'map_pins_report_hazards-on-road_albedo3x', 'map_pins_report_medium_small_hazard', 'alert_icons/icon_report_hazard', 'alert_icons/icon_report_hazard_road')
    map_names('jam', *['bigpin_traffic_' + str(i) for i in range(1, 5)], 'smallpin_traffic', 'tinypin_traffic',
              'map_pins_report_medium_small_heavy_traffic', 'map_pins_report_medium_small_standstill',
              'map_pins_report_traffic_jam_heavy_albedo', 'map_pins_report_traffic_jam_moderate_albedo',
              'map_pins_report_traffic_jams_light_albedo', 'map_pins_report_traffic_jams_standstill_albedo')
    map_names('parking', 'bigpin_parking', 'smallpin_parking')
    map_names('home', 'home_pin')
    map_names('work', 'work_pin')
    OUTPUT.mkdir(parents=True, exist_ok=True)
    rows = []
    with zipfile.ZipFile(ROOT / 'downloads/waze-arm64/base.apk') as waze, sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        page = browser.new_page()
        rendered = {}
        def raster(kind, width, height):
            key = kind, width, height
            if key not in rendered:
                # Extracted SVGs may already have width/height: normalize root instead.
                node = ET.fromstring(art[kind]); node.set('width', str(width)); node.set('height', str(height))
                uri = 'data:image/svg+xml;base64,' + base64.b64encode(ET.tostring(node)).decode()
                png = page.evaluate('''async ({uri,width,height}) => {
                    const image = new Image(); image.src = uri; await image.decode();
                    const canvas = document.createElement('canvas'); canvas.width=width; canvas.height=height;
                    canvas.getContext('2d').drawImage(image,0,0,width,height);
                    return canvas.toDataURL('image/png').split(',')[1];
                }''', {'uri': uri, 'width': width, 'height': height})
                rendered[key] = Image.open(io.BytesIO(base64.b64decode(png))).convert('RGBA')
            return rendered[key]
        for entry in waze.namelist():
            prefix = 'assets/res/skins/default/'
            if not entry.startswith(prefix) or not entry.endswith('.png'): continue
            name = entry[len(prefix):]
            stem = re.sub(r'@\dx$', '', name[:-4])
            if stem not in mapping: continue
            original_bytes = waze.read(entry)
            original = Image.open(io.BytesIO(original_bytes)).convert('RGBA')
            kind = mapping[stem]
            texture = name.startswith('map_pins_report_')
            if texture:
                assert original.size == (256, 256), name
                # Texture's disk spans x/y 17..238; retain the surrounding UV swatches.
                result = original.copy()
                disk = raster(kind, 222, 222)
                mask = Image.new('L', (256, 256)); ImageDraw.Draw(mask).ellipse((17, 17, 238, 238), fill=255)
                background = Image.new('RGBA', (256, 256), INCIDENT_STYLES.get(kind, WARNING_STYLE)[0])
                result.paste(background, (0, 0), mask)
                result.alpha_composite(disk, (17, 17))
            else:
                result = Image.new('RGBA', original.size)
                bounds = original.getbbox()
                x0,y0,x1,y1 = bounds
                # Reuse footprint/anchor, keep aspect ratio; camera becomes Google's circle.
                width,height = x1-x0,y1-y0
                if kind not in ('home','work'):
                    side=min(width,height); x0+=(width-side)//2; y0+=(height-side)//2; width=height=side
                result.alpha_composite(raster(kind,width,height),(x0,y0))
            destination = OUTPUT / name
            destination.parent.mkdir(parents=True, exist_ok=True)
            result.save(destination)
            rows.append({'path': name, 'icon': kind, 'size': list(original.size), 'texture': texture,
                         'original_sha256': sha(original_bytes), 'sha256': sha(destination.read_bytes())})
        browser.close()
    actual = {re.sub(r'@\dx$', '', r['path'][:-4]) for r in rows}
    assert actual == set(mapping), set(mapping) - actual
    (OUTPUT.parent / 'paths.txt').write_text(''.join(r['path'] + '\n' for r in rows), encoding='utf-8')
    report = {'source_package': 'com.google.android.apps.maps', 'source_version': '26.39.04.984891338',
              'source_apk_sha256': sha((ROOT/'downloads/google-maps-phone/base.apk').read_bytes()),
              'incident_colors': {'default': WARNING_STYLE, **INCIDENT_STYLES, 'source': 'amvy.java j/m default, red and blue styles'},
              'warning_glyph_inset_percent': 10,
              'road_closure_glyph': 'ic_report_incident_lane_closure',
              'camera': 'Unmodified default callout vector paths/colors (#E37400, white).',
              'resources': list(used.values()), 'assets': rows}
    (ROOT/'references/google-maps-icons/pack-manifest.json').write_text(json.dumps(report,indent=2),encoding='utf-8')
    # A reviewable sheet of the exact rasters shipped in the pack.
    sheet=Image.new('RGB',(800,((len(art)+4)//5)*160),'#e9e9e9')
    for i,kind in enumerate(art):
        examples=[r for r in rows if r['icon']==kind and not r['texture']]
        if not examples: continue
        example=max(examples,key=lambda row:row['size'][0]*row['size'][1])
        im=Image.open(OUTPUT/example['path']).convert('RGBA'); im.thumbnail((110,110))
        x=(i%5)*160+25;y=(i//5)*160+8
        sheet.paste(im,(x,y),im);ImageDraw.Draw(sheet).text((x-15,y+118),kind,fill='black')
    sheet.save(ROOT/'references/google-maps-icons/pack-preview.png')
    print(f'Built {len(rows)} Waze asset variants from {len(used)} Google Maps resources.')


if __name__ == '__main__':
    main()
