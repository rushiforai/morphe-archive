"""Compare Rollerbank emitted DEX against original methods and resource behavior."""
import argparse
import base64
import hashlib
from pathlib import Path
import re
import xml.etree.ElementTree as ET

from brabant_smali import canonical
from verify_dumpert import Smali

APP = 'Lcom/dennisk/rollerbank/ui/'
FLAGS = {
    'Lhh1;': 'd', 'Lbh1;': 'd', 'Lsh1;': 'f',
    APP + 'ActivityMelding;': 'j', APP + 'ActivityMeldingNew;': 'n',
    APP + 'ActivityMeldingNewRoute;': 'k', APP + 'ActivityRoute;': 'i',
}
NAMES = {'Fix Google services', 'Hide ads', 'Disable tracking', 'Skip consent screens', 'Hide Premium banner', 'Enable En Route alerts'}
ANDROID = '{http://schemas.android.com/apk/res/android}'
CONSENT = ['const/4 v0, 0x1', 'const/4 v1, 0x0', 'const/4 v2, 0x0',
           'const/4 v3, 0x0', 'invoke-interface {p2, v0, v1, v2, v3}, Lqh0;->b(ZZZLjava/lang/String;)V',
           'return-void']


def prefix(body, code):
    return re.sub(r'(\.locals \d+)', lambda m: m[0] + '\n' + '\n'.join(code), body, count=1)


def verify(root: Path, original: Path, selected: set[str]):
    assert selected <= NAMES, 'Unknown Rollerbank patch'
    ads = bool(selected & {'Hide ads', 'Disable tracking', 'Skip consent screens'})
    tracking = bool(selected & {'Disable tracking', 'Skip consent screens'})
    consent = 'Skip consent screens' in selected
    promotions = 'Hide Premium banner' in selected
    route = 'Enable En Route alerts' in selected
    expected, actual = Smali(original), Smali(root)
    edits = {}
    if ads:
        edits['Lrn2;', 'a(Landroid/app/Activity;)V'] = lambda b: prefix(b, ['return-void'])
        edits['Lrn2;', 'b(Landroid/app/Activity;Lcom/google/android/libraries/ads/mobile/sdk/banner/AdView;Ljava/lang/String;)V'] = lambda b: prefix(b, [
            'move-object/from16 v0, p1', 'const/16 v1, 0x8',
            'invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V', 'return-void'])
        edits['Lrn2;', 'c(Lyu2;ILjava/lang/String;)V'] = lambda b: prefix(b, ['return-void'])
    if tracking:
        edits['Lo50;', 'a(Luq;)Lvq;'] = lambda b: prefix(b, [
            'new-instance v0, Lvq;', 'sget-object v1, Lqu$a;->a:Lqu$a;',
            'const-wide/16 v2, 0x0', 'invoke-direct {v0, v1, v2, v3}, Lvq;-><init>(Lqu$a;J)V', 'return-object v0'])
        for key in [('Ls91;', 'b(Ljava/lang/String;)V'), ('Ls91;', 'c(Ljava/lang/Throwable;)V'),
                    ('Ls91;', 'd(Ljava/lang/String;Ljava/lang/String;)V'),
                    ('Lcom/google/firebase/analytics/FirebaseAnalytics;', 'a(Ljava/lang/String;Landroid/os/Bundle;)V')]:
            edits[key] = lambda b: prefix(b, ['return-void'])
        def remove_auth_logs(body):
            result, count = re.subn(r'invoke-static \{[^}]+\}, Landroid/util/Log;->e\(Ljava/lang/String;Ljava/lang/String;\)I', 'nop', body)
            assert count == 2, 'Expected the original two credential log calls'
            return result
        edits['Lcom/dennisk/rollerbank/url/CallbackHandler$a;', 'onSuccess(Ljava/lang/Object;)V'] = remove_auth_logs
        for key in [(APP + 'ActivityMain;', 'onCreate(Landroid/os/Bundle;)V'),
                    ('Lon2;', 'a(Ljg1;)V'), ('Lqn2;', 'a(Ljg1;)V')]:
            def stop_upload(body):
                pattern = r'(iget-object [^\n]+Lim0;->p:Lei4;\s*(?:\.line \d+\s*)*sget-object \w+, Ljava/lang/Boolean;->)TRUE'
                result, count = re.subn(pattern, r'\1FALSE', body)
                assert count == 1, 'Expected one explicit crash upload decision'
                return result
            edits[key] = stop_upload
    if consent:
        edits['Lrn2;', 'e(Landroid/app/Activity;ZLqh0;)V'] = lambda b: prefix(b, CONSENT)
    if promotions:
        def skip_premium(body):
            pattern = r'(const v3, 0x7f14029d.*?getBoolean\(Ljava/lang/String;Z\)Z.*?)move-result v1'
            result, count = re.subn(pattern, r'\1const/4 v1, 0x1', body, count=1, flags=re.S)
            assert count == 1, 'Missing premium page selection'
            return result
        edits[APP + 'ActivityOnboard;', 'onCreate(Landroid/os/Bundle;)V'] = skip_premium
    if route:
        owner = APP + 'ActivityRoute;'
        edits[owner, 'f(Lcom/android/billingclient/api/Purchase;)V'] = lambda b: prefix(b, ['return-void'])
        def prepare_route(body):
            needle = 'invoke-super {p0, p1}, Landroidx/fragment/app/n;->onCreate(Landroid/os/Bundle;)V'
            assert body.count(needle) == 1
            return body.replace(needle, needle + '\ninvoke-static {p0}, ' + owner + '->morphePrepareEnRoute(' + owner + ')V')
        edits[owner, 'onCreate(Landroid/os/Bundle;)V'] = prepare_route
        edits[owner, 'r()V'] = lambda b: prefix(b, [
            'invoke-static {p0}, ' + owner + '->morpheCanStartEnRoute(' + owner + ')Z',
            'move-result v0', 'if-nez v0, :morphe_original_start', 'return-void', ':morphe_original_start'])
        def tts_independent(body):
            needle = 'iget-boolean v0, p0, Lcom/dennisk/rollerbank/model/RouteService;->i:Z'
            assert body.count(needle) == 1
            body = body.replace(needle, 'const/4 v0, 0x1', 1)
            pattern = r'(const v5, 0x7f1402b3.*?invoke-virtual \{v3, v5, v4\}, Lu34;->b\(IZ\)Z.*?move-result v3)'
            body, count = re.subn(pattern, r'\1\niget-boolean v4, p0, Lcom/dennisk/rollerbank/model/RouteService;->i:Z\nand-int/2addr v3, v4', body, count=1, flags=re.S)
            assert count == 1
            return body
        edits['Lcom/dennisk/rollerbank/model/RouteService;', 'b()V'] = tts_independent
    # Compare complete original graphs for every method in each touched class.
    # This includes unmodified entitlement, report submission and lifecycle methods.
    checked = 0
    for owner in {k[0] for k in edits} | set(FLAGS):
        original_text = expected.text(owner)
        actual_text = actual.text(owner)
        signatures = re.findall(r'^\.method [^\n]*?([^\s]+\([^\n]+)', original_text, re.M)
        actual_signatures = re.findall(r'^\.method [^\n]*?([^\s]+\([^\n]+)', actual_text, re.M)
        added_override = 'onRequestPermissionsResult(I[Ljava/lang/String;[I)V'
        assert signatures == [s for s in actual_signatures if not s.startswith('morphe') and
                              not (route and owner == APP + 'ActivityRoute;' and s == added_override)], 'Method inventory changed: ' + owner
        for signature in signatures:
            key = owner, signature
            before = expected.body(*key)
            after = actual.body(*key)
            wanted = edits[key](before) if key in edits else before
            if selected:
                pattern = r'invoke-virtual(?P<range>/range)? (?P<regs>\{[^}]*\}), Landroid/content/pm/PackageManager;->getPackageInfo\((?P<params>Ljava/lang/String;(?:I|Landroid/content/pm/PackageManager\$PackageInfoFlags;))\)Landroid/content/pm/PackageInfo;'
                wanted = re.sub(pattern, lambda m: 'invoke-static' + (m['range'] or '') + ' ' + m['regs'] + ', Lpatches/buienalarm/extension/SignatureCompatibility;->getPackageInfo(Landroid/content/pm/PackageManager;' + m['params'] + ')Landroid/content/pm/PackageInfo;', wanted)
            assert canonical(wanted).digest() == canonical(after).digest(), 'Method graph differs: ' + str(key)
            assert re.search(r'\.locals \d+', before)[0] == re.search(r'\.locals \d+', after)[0], 'Registers changed'
            checked += 1
        if owner in FLAGS:
            field = FLAGS[owner]
            pattern = rf'^\.field public static {field}:Z(?: = (true|false))?$'
            wanted = 'false' if ads else 'true'
            match = re.search(pattern, actual_text, re.M)
            assert match and (match[1] or 'false') == wanted, 'Ad placement flag: ' + owner
    layout = ET.parse(root / 'res/layout/fragment_intro_home.xml').getroot()
    for tag, attribute, value in [('Button', 'id', 'dialog_intro_home_permission'),
                                  ('TextView', 'text', 'dialog_intro_home_text2')]:
        nodes = [n for n in layout.iter(tag) if n.get(ANDROID + attribute, '').endswith('/' + value)]
        assert len(nodes) == 1
        assert (nodes[0].get(ANDROID + 'visibility') == 'gone') == consent, value
    location = [n for n in layout.iter('Button') if n.get(ANDROID + 'id', '').endswith('/dialog_intro_home_location_setup')]
    assert len(location) == 1 and location[0].get(ANDROID + 'visibility') != 'gone', 'Preserve optional location setup'
    settings = ET.parse(root / 'res/xml/preferences_settings.xml').getroot()
    upgrade = [n for n in settings if n.get(ANDROID + 'key', '').endswith('/preference_category_upgrades')]
    assert bool(upgrade) != promotions, 'Upgrades category selection'
    main_menu = ET.parse(root / 'res/menu/main.xml').getroot()
    ids = [n.get(ANDROID + 'id', '').rsplit('/', 1)[-1] for n in main_menu.findall('item')]
    assert ids == (['menu_settings'] if promotions else ['menu_settings', 'menu_premium', 'menu_remove_ads']), 'Shared toolbar purchase overflow selection'
    if promotions:
        for menu_path in (root / 'res').glob('menu*/*.xml'):
            for node in ET.parse(menu_path).getroot().iter('item'):
                assert node.get(ANDROID + 'id', '').rsplit('/', 1)[-1] not in {'menu_premium', 'menu_remove_ads'}, 'Purchase menu remains: ' + str(menu_path)
    manifest = ET.parse(root / 'AndroidManifest.xml').getroot()
    app = manifest.find('application')
    flags = {n.get(ANDROID + 'name'): n.get(ANDROID + 'value') for n in app.findall('meta-data')}
    if tracking:
        for name, value in {'firebase_analytics_collection_deactivated': 'true',
                            'google_analytics_adid_collection_enabled': 'false',
                            'firebase_crashlytics_collection_enabled': 'false',
                            'firebase_sessions_enabled': 'false',
                            'delivery_metrics_exported_to_big_query_enabled': 'false'}.items():
            assert flags.get(name) == value, name
        permissions = {n.get(ANDROID + 'name') for n in manifest.findall('uses-permission')}
        assert 'com.google.android.gms.permission.AD_ID' not in permissions
        assert not any('ACCESS_ADSERVICES_' in p for p in permissions)
    original_manifest = ET.parse(original / 'AndroidManifest.xml').getroot()
    def functional_components(m):
        return {(n.tag, n.get(ANDROID + 'name'), n.get(ANDROID + 'exported'), n.get(ANDROID + 'foregroundServiceType'))
                for n in m.find('application') if n.tag in {'activity', 'receiver', 'service', 'provider'}}
    assert functional_components(manifest) == functional_components(original_manifest), 'App/push components changed'
    from rollerbank_route import verify_route
    verify_route(root, route)
    if tracking:
        from rtl_vm import Memory, Reference, execute, parse
        ok = Reference({}, 'Lqu$a;')
        calls = []
        def acknowledge(method, args):
            assert method == 'Lvq;-><init>(Lqu$a;J)V', 'CCT acknowledgement must not invoke transport'
            result, status, wait, high = args
            assert status is ok and wait == high == 0
            result.value.update(status=status, wait=wait)
            calls.append(method)
        result = execute(parse(actual.body('Lo50;', 'a(Luq;)Lvq;')), {}, acknowledge,
                         memory=Memory(statics={'Lqu$a;->a:Lqu$a;': ok}))
        assert result.descriptor == 'Lvq;' and result.value == {'status': ok, 'wait': 0} and len(calls) == 1
    if selected:
        helper = actual.text('Lpatches/buienalarm/extension/SignatureCompatibility;')
        cert = re.search(r'const-string(?:/jumbo)? [vp]\d+, "([A-Za-z0-9+/=]+)"',
                         actual.body('Lpatches/buienalarm/extension/SignatureCompatibility;', 'getOriginalCertificate()Ljava/lang/String;'))
        assert cert and hashlib.sha256(base64.b64decode(cert[1], validate=True)).hexdigest() == 'dff7cf9d4f59e4be49a5135425a00c6feb0fc561d5b3aa0d703456dab6d9b788'
        assert helper.count('"com.dennisk.rollerbank"') == 2 and '"org.yoki.android.buienalarm"' not in helper
        maps = [n for n in app.findall('meta-data') if n.get(ANDROID + 'name') == 'com.google.android.geo.API_KEY']
        assert len(maps) == 1 and hashlib.sha256(maps[0].get(ANDROID + 'value', '').encode()).hexdigest() == 'd34670058a95454d4826a032feffef6a6a0960439368b797fe4b322079a8dcf9', 'Authorized community Maps key'
        before_strings = ET.parse(original / 'res/values/strings.xml').getroot()
        after_strings = ET.parse(root / 'res/values/strings.xml').getroot()
        def firebase_key(strings):
            return next(n.text for n in strings if n.get('name') == 'google_api_key')
        assert firebase_key(before_strings) == firebase_key(after_strings), 'Firebase configuration changed'
        redirected = 0
        for path in root.glob('smali*/**/*.smali'):
            if '/patches/buienalarm/extension/' in str(path):
                continue
            text = path.read_text()
            redirected += text.count('SignatureCompatibility;->getPackageInfo(')
            assert 'Landroid/content/pm/PackageManager;->getPackageInfo(' not in text, 'Unwrapped SDK package lookup'
        assert redirected == 48, f'Expected 48 wrapped package lookups, found {redirected}'
    print(f'PASS Rollerbank: {checked} complete method graphs; resources, placement flags and functional components; {sorted(selected)}')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('root', type=Path)
    parser.add_argument('--original-root', type=Path, required=True)
    parser.add_argument('-e', action='append', default=[], choices=sorted(NAMES))
    args = parser.parse_args()
    verify(args.root, args.original_root, set(args.e))
