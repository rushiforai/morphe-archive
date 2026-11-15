#!/usr/bin/env python3
"""verify_v8_markers.py <sm1_tree> <sm3_tree> <sm5_tree> <apk>

Verifies every v8 patch marker inside baksmali trees of the final APK, the
manifest binary edits, and the presence of the embedded VPN payload.
Exit code != 0 on any failure.
"""
import struct
import sys
import zipfile
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from v8_splice import StringPool, ACON  # noqa: E402

FAILURES = []


def check(name, cond, detail=''):
    print('%-6s %s %s' % ('OK' if cond else 'FAIL', name, detail))
    if not cond:
        FAILURES.append(name)


def must_contain(path, snippet, name):
    try:
        t = Path(path).read_text()
    except OSError:
        check(name, False, '(missing %s)' % path)
        return
    check(name, snippet in t)


def goto_before(path, needle, before_chars, name):
    """Label-agnostic: a 'goto :' occurs shortly before needle."""
    try:
        t = Path(path).read_text()
    except OSError:
        check(name, False, '(missing)')
        return
    i = t.find(needle)
    check(name, i >= 0 and 'goto :' in t[max(0, i - before_chars):i])


def main():
    sm1, sm3, sm5, apk = sys.argv[1:5]

    # --- v7-equivalent patches (label-agnostic where rebuilt labels
    # --- are renumbered) ------------------------------------------------
    must_contain(Path(sm3) / 'xoj.smali',
                 'iget-boolean p0, p2, Lyoj;->a:Z\n\n    nop', 'V7a')
    goto_before(Path(sm3) / 'xoj.smali', 'Legn;->d:Z', 100, 'V8a')
    oa = (Path(sm3) / 'com/opera/android/OperaApplication.smali').read_text()
    check('V7b1', 'const/4 v8, 0x1\n\n    invoke-virtual {v2, v5, v8}, '
          'Lien;->l(Landroid/content/Context;Z)V' in oa)
    check('V7b2', 'const/4 v8, 0x1\n\n    invoke-virtual {v2, v5, v8}, '
          'Lyen;->l(Landroid/content/Context;Z)V' in oa)
    must_contain(Path(sm3) / 'com/opera/android/settings/SettingsManager.smali',
                 'const-string v0, "accept_cookies"\n\n    const/4 v4, 0x2', 'C7')
    must_contain(Path(sm3) / 'i06.smali',
                 'Ljwk;->a:Z\n\n    goto :', 'N7')
    must_contain(Path(sm3) / 'rqd.smali',
                 'invoke-virtual {v1, p1}, Landroid/view/ViewGroup;->getChildAt(I)'
                 'Landroid/view/View;', 'N8')
    must_contain(Path(sm3) / 'rqd.smali',
                 'invoke-virtual {p2}, Landroid/view/View;->getParent()'
                 'Landroid/view/ViewParent;', 'N8b')
    r4k = (Path(sm3) / 'r4k.smali').read_text()
    check('SD1', r4k.count('WHERE 0') == 3, '3 WHERE-0 selects')
    must_contain(Path(sm3) / 'com/opera/android/favorites/'
                 'PushedSpeedDialSuggestionProvider.smali',
                 'const/4 v0, 0x0\n\n    nop\n\n    new-array p0, v0, '
                 '[Lcom/opera/android/favorites/PushedSpeedDialFavorite;', 'SD2')
    goto_before(Path(sm1) / 'd37.smali', 'Lwol;->m:Lwol;', 100, 'M3c')
    lk6 = (Path(sm3) / 'lk6.smali').read_text()
    check('R5a', 'invoke-virtual {p2}, Lk3i;->b()Z\n\n    move-result p2\n\n    nop' in lk6)
    check('R5b', 'invoke-virtual {p0}, Lk3i;->b()Z\n\n    move-result p0\n\n    nop' in lk6)
    must_contain(Path(sm3) / 'k9.smali',
                 'iget-object v0, v0, Lfl9;->f:Lcom/opera/android/ui/catalog/'
                 'widget/OperaListItem;\n\n    invoke-virtual {v0, v6}, '
                 'Landroid/view/View;->setVisibility(I)V', 'RS8')

    # --- embedded VPN stack (classes5) -----------------------------------
    for rel in ('com/kape/vpnservicemanager/data/externals/Service.smali',
                'hev/htproxy/TProxyService.smali',
                'com/zai/sysvpn/VpnController.smali',
                'com/zai/sysvpn/Res.smali'):
        check('C5:' + rel.split('/')[-1],
              (Path(sm5) / rel).is_file())

    # --- repurposed Opera components (classes3) ---------------------------
    tile = (Path(sm3) / 'com/opera/android/vpn/quick_settings_tile/'
            'VpnProQuickSettingsTileService.smali').read_text()
    check('T8a', 'invoke-static {p0}, Lcom/zai/sysvpn/VpnController;->'
          'toggle(Landroid/content/Context;)V' in tile)
    check('T8b', 'VpnController;->isRunning(Landroid/content/Context;)Z' in tile
          and 'Landroid/service/quicksettings/Tile;->setState(I)V' in tile)
    wdg = (Path(sm3) / 'com/opera/android/vpn/app_widget/'
           'VpnProAppWidget.smali').read_text()
    check('W8a', 'VpnController;->isRunning(Landroid/content/Context;)Z' in wdg
          and 'setOnClickPendingIntent' in wdg
          and 'Lcom/kape/vpnservicemanager/data/externals/Service;' in wdg)
    check('W8b', 'Landroid/appwidget/AppWidgetManager;->getInstance' in wdg
          and 'getAppWidgetIds' in wdg)
    check('W8c', 'invoke-virtual {p0, p1}, Lcom/opera/android/vpn/app_widget/'
          'VpnProAppWidget;->b(Landroid/content/Context;)V' in wdg)
    rcv = (Path(sm3) / 'com/opera/android/vpn/VpnReceiver.smali').read_text()
    check('R8', 'com.opera.android.VPN_PRO_ENABLE' in rcv
          and 'VpnController;->toggle(Landroid/content/Context;)V' in rcv
          and 'VpnController;->region(Landroid/content/Context;Ljava/lang/String;)V' in rcv)

    # --- manifest binary edits -------------------------------------------
    z = zipfile.ZipFile(apk)
    mb = z.read('AndroidManifest.xml')
    pool = None
    off = 8
    while off < len(mb):
        ctype, hdr, csize = struct.unpack_from('<HHI', mb, off)
        if ctype == 0x0001:
            pool = StringPool(mb[off:off + csize])
            break
        off += csize
    extract_true = False
    label_swaps = 0
    off = 8
    while off < len(mb):
        ctype, hdr, csize = struct.unpack_from('<HHI', mb, off)
        if ctype == 0x0102:
            attr_start, attr_size, attr_count = struct.unpack_from('<HHH', mb, off + 24)
            base = off + hdr + attr_start
            for i in range(attr_count):
                a = base + i * attr_size
                a_ns, a_name = struct.unpack_from('<II', mb, a)
                dtype = mb[a + 15]
                data = struct.unpack_from('<I', mb, a + 16)[0]
                ns_s = pool.get(a_ns) if a_ns != 0xFFFFFFFF else None
                name_s = pool.get(a_name)
                if (ns_s == ACON and name_s == 'extractNativeLibs'
                        and dtype == 0x12 and data == 1):
                    extract_true = True
                if (ns_s == ACON and name_s == 'label'
                        and dtype == 0x01 and data == 0x7f141408):
                    label_swaps += 1
        off += csize if csize else 1
    check('M:extract', extract_true, 'extractNativeLibs=true')
    check('M:labels', label_swaps == 2,
          'vpn_title label refs=%d' % label_swaps)

    # --- native payload ---------------------------------------------------
    names = z.namelist()
    check('LIB:oprx', 'lib/armeabi-v7a/liboprx.so' in names)
    check('LIB:hev', 'lib/armeabi-v7a/libhev-socks5-tunnel.so' in names)
    check('SIG:v1-fresh', 'META-INF/MANIFEST.MF' in names
          and 'META-INF/MORPHE.RSA' in names,
          're-signed v1 block present')
    c5 = z.read('classes5.dex')
    check('C5:size', len(c5) > 10000, '%d bytes' % len(c5))

    if FAILURES:
        raise SystemExit('FAILED: %s' % ', '.join(FAILURES))
    print('ALL V8 MARKERS OK')


if __name__ == '__main__':
    main()
