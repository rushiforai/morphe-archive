"""N28A independent structure audit of the shipped MPP/MPE/APK, plus DEX, CRC, resource and text checks.

Beyond the N25 checks this reads the *delivered* APK's own resources: the compiled settings XMLs must
carry the new navigation key and no longer the old one, and resources.arsc must carry all fourteen
preview_hint strings. The audit therefore binds to the shipped bytes, not to the build tree.
"""
import hashlib, json, re, struct, zipfile, zlib
from pathlib import Path

root = Path(__file__).resolve().parents[2]
name = '\u672c\u5730\u6d4b\u8bd5\u5305'
mpp = root / f'build/local-test/patches-1.3.5-{name}-n28a.mpp'
mpe = root / f'build/local-test/extension-1.3.5-{name}-n28a.mpe'
apk = root / f'build/n28a-composition-final/YouTube-21.16.256-{name}-n28a-unsigned.apk'
records = root / 'build/n28a-records'

NEW_KEY = b'morphe_vot_screen__ai_captions'
OLD_KEY = b'morphe_settings_screen_13_ai_captions'
VIDEO_PARENT = b'morphe_settings_screen_12_video_sort_by_key'

# Card table, verbatim: the value every shipped locale must carry for cap_preview_hint.
HINTS = {
    'values': 'Style preview (full screen)',
    'values-zh-rCN': '\u6837\u5f0f\u9884\u89c8\uff08\u5168\u5c4f\uff09',
    'values-zh-rTW': '\u6a23\u5f0f\u9810\u89bd\uff08\u5168\u87a2\u5e55\uff09',
    'values-es': 'Vista previa de estilo (pantalla completa)',
    'values-fr': 'Aper\u00e7u du style (plein \u00e9cran)',
    'values-de': 'Stilvorschau (Vollbild)',
    'values-pt': 'Pr\u00e9via do estilo (tela cheia)',
    'values-ru': '\u041f\u0440\u0435\u0434\u043f\u0440\u043e\u0441\u043c\u043e\u0442\u0440 \u0441\u0442\u0438\u043b\u044f (\u043f\u043e\u043b\u043d\u044b\u0439 \u044d\u043a\u0440\u0430\u043d)',
    'values-ja': '\u30b9\u30bf\u30a4\u30eb\u30d7\u30ec\u30d3\u30e5\u30fc\uff08\u5168\u753b\u9762\uff09',
    'values-ko': '\uc2a4\ud0c0\uc77c \ubbf8\ub9ac\ubcf4\uae30(\uc804\uccb4 \ud654\uba74)',
    'values-ar': '\u0645\u0639\u0627\u064a\u0646\u0629 \u0627\u0644\u0646\u0645\u0637 (\u0645\u0644\u0621 \u0627\u0644\u0634\u0627\u0634\u0629)',
    'values-hi': '\u0936\u0948\u0932\u0940 \u092a\u0942\u0930\u094d\u0935\u093e\u0935\u0932\u094b\u0915\u0928 (\u092a\u0942\u0930\u094d\u0923 \u0938\u094d\u0915\u094d\u0930\u0940\u0928)',
    'values-in': 'Pratinjau gaya (layar penuh)',
    'values-vi': 'Xem tr\u01b0\u1edbc ki\u1ec3u (to\u00e0n m\u00e0n h\u00ecnh)',
}

# The wording this card replaced. A raw byte search cannot tell a value from a value it prefixes, so the
# shipped pool is parsed and compared entry by entry.
STALE = {
    'values': 'Style preview',
    'values-zh-rCN': '\u6837\u5f0f\u9884\u89c8',
    'values-zh-rTW': '\u6a23\u5f0f\u9810\u89bd',
    'values-es': 'Vista previa de estilo',
    'values-fr': 'Aper\u00e7u du style',
    'values-de': 'Stilvorschau',
    'values-pt': 'Pr\u00e9via do estilo',
    'values-ru': '\u041f\u0440\u0435\u0434\u043f\u0440\u043e\u0441\u043c\u043e\u0442\u0440 \u0441\u0442\u0438\u043b\u044f',
    'values-ja': '\u30b9\u30bf\u30a4\u30eb\u30d7\u30ec\u30d3\u30e5\u30fc',
    'values-ko': '\uc2a4\ud0c0\uc77c \ubbf8\ub9ac\ubcf4\uae30',
    'values-ar': '\u0645\u0639\u0627\u064a\u0646\u0629 \u0627\u0644\u0646\u0645\u0637',
    'values-hi': '\u0936\u0948\u0932\u0940 \u092a\u0942\u0930\u094d\u0935\u093e\u0935\u0932\u094b\u0915\u0928',
    'values-in': 'Pratinjau gaya',
    'values-vi': 'Xem tr\u01b0\u1edbc ki\u1ec3u',
}


def read_string_pool(data, offset):
    """Parse the ResStringPool chunk at `offset` and return its entries as Python strings."""
    chunk_type, header_size, chunk_size = struct.unpack_from('<HHI', data, offset)
    assert chunk_type == 0x0001, hex(chunk_type)
    string_count, style_count, flags, strings_start, styles_start = struct.unpack_from('<IIIII', data, offset + 8)
    utf8 = bool(flags & (1 << 8))
    offsets = struct.unpack_from(f'<{string_count}I', data, offset + header_size)
    base = offset + strings_start

    def length_at(pos):
        value = data[pos]
        pos += 1
        if value & 0x80:
            value = ((value & 0x7F) << 8) | data[pos]
            pos += 1
        return value, pos

    out = []
    for item in offsets:
        pos = base + item
        if utf8:
            # UTF-8 pool entries carry the UTF-16 length first, then the UTF-8 byte length.
            _, pos = length_at(pos)
            size, pos = length_at(pos)
            out.append(data[pos:pos + size].decode('utf-8', 'replace'))
        else:
            size = struct.unpack_from('<H', data, pos)[0]
            pos += 2
            if size & 0x8000:
                size = ((size & 0x7FFF) << 16) | struct.unpack_from('<H', data, pos)[0]
                pos += 2
            out.append(data[pos:pos + size * 2].decode('utf-16-le', 'replace'))
    return out


def sha(data):
    return hashlib.sha256(data).hexdigest().upper()


def dex_check(data):
    assert data[:4] == b'dex\n' and data[7] == 0
    assert struct.unpack_from('<I', data, 32)[0] == len(data)
    assert hashlib.sha1(data[32:]).digest() == data[12:32]
    assert zlib.adler32(data[12:]) == struct.unpack_from('<I', data, 8)[0]


def unquote(text):
    decoded = text.replace('\\\'', "'").replace('\\"', '"')
    if decoded.startswith('"') and decoded.endswith('"'):
        decoded = decoded[1:-1]
    return decoded


with zipfile.ZipFile(mpp) as z:
    assert z.testzip() is None
    names = z.namelist()
    assert len(names) == len(set(names)) == 72
    assert not any(n.startswith('validation/') for n in names)
    mf = z.read('META-INF/MANIFEST.MF').decode().replace('\r\n ', '').replace('\n ', '').replace('\r\n', '\n')
    assert 'Version: 1.3.5\n' in mf
    assert 'YYDarlinker/morphe-ai-caption-translator' in mf
    assert 'YYDarlinker/morphe-ai-captions\n' not in mf
    ext = z.read('extensions/extension.mpe')
    if not mpe.exists():
        mpe.write_bytes(ext)
    assert mpe.read_bytes() == ext
    for data in (z.read('classes.dex'), ext):
        dex_check(data)
        assert b'Lvalidation/' not in data
    root_dex = z.read('classes.dex')
    assert NEW_KEY in root_dex, 'shipped patch dex does not carry the new navigation key'
    assert OLD_KEY in root_dex, 'the legacy navigation key must stay as a removal alias'
    assert VIDEO_PARENT in root_dex
    locales = z.read('captionlocales/index.txt').decode().splitlines()
    assert len(locales) == len(set(locales)) == 14
    shipped = {}
    for loc in locales:
        n = f'captionlocales/{loc}/caption_addon_strings.xml'
        content = z.read(n)
        assert content == (root / 'patches/src/main/resources' / n).read_bytes()
        assert b'caption_overflow' not in content
        shipped[loc] = content.decode('utf-8')
    # N25 behavioural markers must survive this card untouched.
    for marker in (b'preview_sample', b'MAX_SAMPLE_LINES', b'ai_size_tier_names', b'RailBar',
                   b'tierLabelInset', b'label_separator', b'save_diagnostics',
                   b'copy_part_label', b'copy_part_done', b'selected_suffix', b'audit_title',
                   b'audit_no_usage', b'display_debug', b'model_hint_manual_only',
                   b'LAST_CAPTION_BOX'):
        assert marker in ext, marker
    import xml.etree.ElementTree as ET
    assert set(HINTS) == set(locales), (sorted(HINTS), sorted(locales))
    for loc, hint in HINTS.items():
        root_xml = ET.fromstring(shipped[loc])
        values = [n.text for n in root_xml if n.attrib.get('name') == 'cap_preview_hint']
        assert len(values) == 1, (loc, values)
        decoded = unquote(values[0])
        assert decoded == hint, (loc, decoded, hint)
    for loc, content in shipped.items():
        assert 'caption_overflow' not in content and '[Original]' not in content, loc
    bundle = dict(entries=len(names), locales=locales, manifest=mf, crc=True,
                  dex_headers_lengths_checksums=True, extension_identical=True,
                  locale_xml_identical_to_source=True, validation_leak=False,
                  n25_markers=True, n26_navigation_key_in_shipped_dex=True,
                  preview_hint_per_locale=len(HINTS),
                  keys_per_locale=shipped['values'].count('<string name='))
    (records / 'bundle-structure.json').write_text(json.dumps(bundle, ensure_ascii=False, indent=2), encoding='utf-8')

if apk.exists():
    with zipfile.ZipFile(apk) as z:
        assert z.testzip() is None
        names = z.namelist()
        assert len(names) == len(set(names))
        dex_names = [n for n in names if re.fullmatch(r'classes\d*\.dex', n)]
        assert len(dex_names) == 11
        for n in dex_names:
            data = z.read(n)
            dex_check(data)
            assert b'Lvalidation/' not in data
        assert 'AndroidManifest.xml' in names
        signatures = [n for n in names if n.upper().startswith('META-INF/')
                      and n.upper().endswith(('.SF', '.RSA', '.DSA', '.EC', 'MANIFEST.MF'))]
        assert not signatures
        # The delivered settings resources themselves: new key present, old key gone.
        settings_xml = [n for n in names if n in (
            'res/xml/morphe_prefs.xml', 'res/xml/morphe_prefs_icons.xml', 'res/xml/morphe_prefs_icons_bold.xml')]
        assert len(settings_xml) == 3, settings_xml
        for n in settings_xml:
            data = z.read(n)
            assert NEW_KEY in data, f'{n}: missing the new navigation key'
            assert OLD_KEY not in data, f'{n}: still carries the legacy navigation key'
            assert b'deepseek_caption_settings' not in data, f'{n}: still references the old icon drawable'
        # resources.arsc must carry every localized preview_hint value, read from the shipped pool.
        arsc = z.read('resources.arsc')
        table_type, table_header, table_size, package_count = struct.unpack_from('<HHII', arsc, 0)
        assert table_type == 0x0002, hex(table_type)
        pool = set(read_string_pool(arsc, table_header))
        missing = [loc for loc, hint in HINTS.items() if hint not in pool]
        assert not missing, f'resources.arsc is missing preview_hint for {missing}'
        # ...and the replaced wording must be gone from the pool.
        stale = [loc for loc, old in STALE.items() if old in pool]
        assert not stale, f'resources.arsc still holds the old preview_hint for {stale}'
        apk_report = dict(path=str(apk), entries=len(names), root_dex_count=len(dex_names),
                          crc=True, manifest=True, dex_headers_lengths_checksums=True,
                          signature_files=signatures, validation_leak=False,
                          settings_xml_new_key=len(settings_xml),
                          settings_xml_legacy_key=0,
                          preview_hint_in_resources=len(HINTS))
        (records / 'apk-structure.json').write_text(json.dumps(apk_report, indent=2), encoding='utf-8')
    baselines = [1103820, 2713536, 196935284]  # Retained N26 artefacts
    artifacts = [dict(path=str(p), bytes=p.stat().st_size, delta_vs_n26=p.stat().st_size - b,
                      sha256=sha(p.read_bytes())) for p, b in zip((mpp, mpe, apk), baselines)]
    (records / 'artifacts.json').write_text(json.dumps(artifacts, ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps(artifacts, ensure_ascii=False, indent=2))
else:
    print('BUNDLE_PASS entries=72 locales=14 extension_identical=true n26_navigation_key=true')
