"""Compare every original Medium method and exact selected control effects."""
import argparse
import copy
import hashlib
import json
from pathlib import Path
import re
import xml.etree.ElementTree as ET

from atv_smali import classes, class_methods, graph, methods
from verify_videoland_atv import declaration_shape, digest, MERGE_METADATA
from verify_videoland import edited_graph

TRACKING = 'Disable optional tracking'
PROMOTIONS = 'Hide native promotions'
READER = 'Read full articles natively'
UNIT = 'sget-object v0, Ltzg;->a:Ltzg;\nreturn-object v0'
WEB_CLIENTS = ('Lv90;', 'Le57;', 'Lhcb;', 'Lwnh;', 'Ldfi;', 'Lbx4;', 'Ldoj;', 'Lsprig/b/f;')
A = '{http://schemas.android.com/apk/res/android}'


def replacements(selected):
    bodies = {}
    def add(owner, signature, code, locals_count=1):
        bodies[owner + '->' + signature] = graph(f'.locals {locals_count}\n' + code)
    if TRACKING in selected:
        for owner, signatures in {
            'Lzmg;': ['a(Lzmg;Lcom/squareup/wire/AndroidMessage;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;I)V'],
            'Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;': [
                'logEvent(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;ZZJ)V',
                'setUserId(Ljava/lang/String;J)V', 'setUserProperty(Ljava/lang/String;Ljava/lang/String;Lz37;ZJ)V',
                'beginAdUnitExposure(Ljava/lang/String;J)V', 'endAdUnitExposure(Ljava/lang/String;J)V'],
            'Lp0j;': ['run()V'], 'Lu8k;': ['S(La70;Lb5;)V'], 'Lrx4;': ['run()V'],
            'Lv95;': ['b(Ljava/lang/String;)V', 'c(Ljava/lang/String;Ljava/lang/String;)V'],
            'Lrpe;': ['g(Ljava/lang/Throwable;Ljava/lang/Thread;Ljava/lang/String;Lvq4;Z)V'],
        }.items():
            for signature in signatures:
                add(owner, signature, 'return-void')
        for owner in ['Lcom/userleap/Sprig;', 'Lcom/userleap/UserLeap;']:
            for signature in ['configure(Landroid/content/Context;Ljava/lang/String;)V',
                              'setUserIdentifier(Ljava/lang/String;)V', 'setPreviewKey(Ljava/lang/String;)V',
                              'logout()V', 'trackAndPresent(Lcom/userleap/EventPayload;Landroid/app/Activity;)V']:
                add(owner, signature, 'return-void')
        for owner, signatures in {
            'Lzmg;': ['b(Lcom/squareup/wire/AndroidMessage;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Lam2;)Ljava/lang/Object;'],
            'Lqf9;': ['a(ZLam2;)Ljava/lang/Object;', 'b(Lam2;)Ljava/lang/Object;', 'c(Ljava/util/List;Lam2;)Ljava/lang/Object;'],
            'Lqe9;': ['t1(Ljava/util/List;Lam2;)Ljava/lang/Object;'],
        }.items():
            for signature in signatures:
                add(owner, signature, UNIT)
        for name in ['common/datadog/DatadogSdkInitializer', 'common/datadog/DatadogLogsInitializer',
                     'common/sprig/SprigSdkInitializer', 'donkey/initializer/MetricsInitializer',
                     'donkey/initializer/InstallReferrerInitializer']:
            add('Lcom/medium/android/' + name + ';', 'b(Landroid/content/Context;)Ljava/lang/Object;', UNIT)
        success = 'invoke-static {}, Lzh8;->a()Lyh8;\nmove-result-object v0\nreturn-object v0'
        add('Lcom/datadog/android/core/UploadWorker;', 'b()Lyh8;', success)
        for name in ['UploadWorker', 'ReplayEncoderWorker']:
            add('Lcom/userleap/internal/sessions/util/' + name + ';', 'doWork(Lyl2;)Ljava/lang/Object;', success)
        add('Ld70;', 'a(Lb5;Lgpe;ZLkd;)Lpl6;', 'const/4 v0, 0x0\nreturn-object v0')
        add('Lp83;', 'a()Z', 'const/4 v0, 0x0\nreturn v0')
        add('Lrpe;', 'h(Ljava/lang/String;Ljava/util/concurrent/Executor;)Lmrk;',
            'const/4 v0, 0x0\ninvoke-static {v0}, Ll9e;->h(Ljava/lang/Object;)Lmrk;\nmove-result-object v0\nreturn-object v0')
        add('Lgp3;', 'q()Lt27;', 'new-instance v0, Lt27;\nconst/16 v1, 0xcc\nconst-string v2, ""\n'
            'invoke-direct {v0, v1, v2}, Lt27;-><init>(ILjava/lang/String;)V\nreturn-object v0', 3)
        add('Lha0;', 'h(Ld80;)Lqa0;', 'new-instance v0, Lqa0;\nconst/16 v1, 0xc8\nconst/4 v2, 0x0\n'
            'const-wide/16 v3, 0x0\ninvoke-direct {v0, v1, v2, v3, v4}, Lqa0;-><init>(ILjava/net/URL;J)V\nreturn-object v0', 5)
    if PROMOTIONS in selected:
        for name in ['p', 'q']:
            add('Lbvg;', name + '(Lef9;Lvtb;Lqi9;Lde2;I)V', 'return-void')
        for owner, signature in {
            'Lcom/medium/android/graphql/fragment/PostPromotionBannerData$ViewerEdge;':
                'getPromotionBanner()Lcom/medium/android/graphql/fragment/PostPromotionBannerData$PromotionBanner;',
            'Lcom/medium/android/graphql/fragment/PublicationSections$OnPublicationSection;':
                'getPublicationPromotionSectionData()Lcom/medium/android/graphql/fragment/PublicationPromotionSectionData;',
        }.items():
            add(owner, signature, 'const/4 v0, 0x0\nreturn-object v0')
    return bodies


def insertions(selected):
    edits = {}
    def add(key, index, effect):
        edits[key] = [{'index': index, 'remove': 0, 'effect': effect}]
    if TRACKING in selected:
        for signature in ['setDataCollectionEnabled(Z)V', 'setMeasurementEnabled(ZJ)V']:
            add('Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;->' + signature,
                1, 'const/4 p1, 0x0')
    if PROMOTIONS in selected:
        add('Lu48;->invoke()Ljava/lang/Object;', 1, 'move-object/from16 v0, p0\niget-byte v1, v0, Lu48;->a:B\n'
            'const/16 v2, 0x1a\nif-ne v1, v2, :original\nsget-object v1, Ltzg;->a:Ltzg;\nreturn-object v1\n:original\nnop')
    if READER in selected:
        add('Lxub;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;', 82,
            'invoke-static {v1, v3}, LMediumReaderFlow;->bindOwner(Ljava/lang/Object;Ljava/lang/Object;)V')
        add('Lwi6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;', 38,
            'invoke-static {v3, v0}, Lwi6;->mediumReaderWrap(Ljd5;Lwi6;)Ljd5;\nmove-result-object v3')
        add('Lcom/medium/android/donkey/DonkeyApplication;->onCreate()V', 2,
            'invoke-static/range {p0 .. p0}, Lnl/johninnl/medium/reader/ReaderBootstrap;->initialize(Landroid/content/Context;)V')
        add('Lcom/medium/android/donkey/main/MainActivity;->onCreate(Landroid/os/Bundle;)V', 1,
            'invoke-static/range {p0 .. p0}, Lnl/johninnl/medium/reader/OfflineEntry;->attach(Landroid/app/Activity;)V')
    return edits


def wrappers(before, selected):
    """Map renamed originals to their original graphs; specify every new wrapper."""
    renamed, added = {}, {}
    def wrap(owner, signature, original_name, code, locals_count=1):
        key = owner + '->' + signature
        if key in before:
            renamed[owner + '->' + original_name + signature[signature.index('('):]] = key
        added[key] = graph(f'.locals {locals_count}\n' + code)
    if TRACKING in selected:
        for owner in WEB_CLIENTS:
            for request in ['Ljava/lang/String;', 'Landroid/webkit/WebResourceRequest;']:
                signature = 'shouldInterceptRequest(Landroid/webkit/WebView;' + request + ')Landroid/webkit/WebResourceResponse;'
                has_original = owner + '->' + signature in before
                fallback = ('invoke-virtual {p0, p1, p2}, ' + owner + '->mediumPrivacyInterceptRequest' if has_original else
                            'invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldInterceptRequest')
                url = 'move-object v0, p2' if request == 'Ljava/lang/String;' else (
                    'if-eqz p2, :allowed\ninvoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;\n'
                    'move-result-object v0\ninvoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;\nmove-result-object v0')
                wrap(owner, signature, 'mediumPrivacyInterceptRequest', url + '\n'
                     'invoke-static {v0}, Lnl/johninnl/medium/privacy/WebPrivacy;->intercept(Ljava/lang/String;)Landroid/webkit/WebResourceResponse;\n'
                     'move-result-object v0\nif-eqz v0, :allowed\nreturn-object v0\n:allowed\n' + fallback +
                     '(Landroid/webkit/WebView;' + request + ')Landroid/webkit/WebResourceResponse;\nmove-result-object v0\nreturn-object v0')
    if READER in selected:
        wrap('Lvw;', 'a(Lr67;Lika;)Ljava/lang/String;', 'mediumReaderOriginalImage',
             'invoke-virtual {p1}, Lr67;->getId()Ljava/lang/String;\nmove-result-object v0\n'
             'invoke-static {v0}, Lnl/johninnl/medium/reader/ReaderImages;->resolve(Ljava/lang/String;)Ljava/lang/String;\n'
             'move-result-object v0\nif-eqz v0, :native\nreturn-object v0\n:native\n'
             'invoke-virtual {p0, p1, p2}, Lvw;->mediumReaderOriginalImage(Lr67;Lika;)Ljava/lang/String;\nmove-result-object v0\nreturn-object v0')
        for name, getter in [('PostFragment', 'l1'), ('PostPageFragment2', 'd0')]:
            owner = 'Lcom/medium/android/donkey/post/' + name + ';'
            bundle = owner[:-1] + '$BundleInfo;'
            returns = bundle if name == 'PostFragment' else 'Lcom/medium/android/core/fragments/AbstractMediumFragment$BundleInfo;'
            signature = 'H(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;'
            wrap(owner, signature, 'mediumReaderCreateView',
                 'invoke-virtual {p0, p1, p2, p3}, ' + owner + '->mediumReaderCreateView' + signature[1:] + '\n'
                 'move-result-object v0\ninvoke-static {v0, p0}, ' + owner + '->mediumReaderUi(Landroid/view/View;' + owner +
                 ')Landroid/view/View;\nmove-result-object v0\nreturn-object v0')
            added[owner + '->mediumReaderUi(Landroid/view/View;' + owner + ')Landroid/view/View;'] = graph(
                '.locals 1\ninvoke-virtual {p1}, ' + owner + '->' + getter + '()' + returns + '\nmove-result-object v0\n'
                'check-cast v0, ' + bundle + '\ninvoke-virtual {v0}, ' + bundle + '->getPost()Lcom/medium/android/data/post/TargetPost;\n'
                'move-result-object v0\ninvoke-virtual {v0}, Lcom/medium/android/data/post/TargetPost;->getId()Ljava/lang/String;\n'
                'move-result-object v0\ninvoke-static {p0, v0}, Lnl/johninnl/medium/reader/ReaderUi;->wrap(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;\n'
                'move-result-object v0\nreturn-object v0')
        added['Lwi6;->mediumReaderWrap(Ljd5;Lwi6;)Ljd5;'] = graph('.locals 2\n'
            'iget-object v0, p1, Lwi6;->f:Ljava/lang/String;\niget-object v1, p1, Lwi6;->g:Ljava/lang/Object;\ncheck-cast v1, Lnib;\n'
            'iget-object v1, v1, Lnib;->d:Lqye;\ninvoke-static {v1, v0}, LMediumReaderRetry;->bind(Lqye;Ljava/lang/String;)V\n'
            'iget-object v1, p1, Lwi6;->h:Ljava/lang/Object;\ninvoke-static {p0, v0, v1}, LMediumReaderFlow;->wrap(Ljd5;Ljava/lang/String;Ljava/lang/Object;)Ljd5;\n'
            'move-result-object v0\nreturn-object v0')
    return renamed, added


def class_digest(path):
    content = [declaration_shape(path.read_text()), class_methods(path)]
    return hashlib.sha256(json.dumps(content, sort_keys=True, separators=(',', ':')).encode()).hexdigest()


def verify_methods(before, after, selected, extension_owners=()):
    assert before, 'Empty original Medium inventory'
    bodies, edits = replacements(selected), insertions(selected)
    renamed, added = wrappers(before, selected)
    assert bodies.keys() <= before.keys() and edits.keys() <= before.keys(), 'Missing Medium effect target'
    originals = json.loads(Path(__file__).with_name('medium_original_contracts.json').read_text())
    for key in bodies.keys() | edits.keys() | set(renamed.values()):
        assert hashlib.sha256('\n'.join(before[key]).encode()).hexdigest() == originals[key], 'Changed Medium original contract: ' + key
    owned = set(extension_owners)
    after = {key: rows for key, rows in after.items() if key.split('->')[0] not in owned}
    expected = dict(before)
    for key, original_key in renamed.items():
        expected[key] = expected.pop(original_key)
    expected.update(bodies)
    for key, change in edits.items():
        expected[key] = edited_graph(before[key], change)
    expected.update(added)
    assert expected.keys() == after.keys(), 'Medium method inventory changed'
    for key, rows in expected.items():
        assert rows == after[key], 'Incorrect Medium effect or changed original method: ' + key
    return len(before)


FLAGS = {name: 'false' for name in ['firebase_analytics_collection_enabled', 'google_analytics_adid_collection_enabled',
    'google_analytics_ssaid_collection_enabled', 'google_analytics_automatic_screen_reporting_enabled',
    'firebase_crashlytics_collection_enabled', 'firebase_performance_collection_enabled', 'firebase_sessions_enabled',
    'delivery_metrics_exported_to_big_query_enabled', 'com.facebook.sdk.AutoLogAppEventsEnabled',
    'com.facebook.sdk.AdvertiserIDCollectionEnabled', 'com.facebook.sdk.AutoInitEnabled']}
FLAGS.update({name: 'true' for name in ['firebase_analytics_collection_deactivated', 'firebase_performance_collection_deactivated']})
FLAGS = {name: FLAGS[name] for name in ['firebase_analytics_collection_deactivated',
    'firebase_analytics_collection_enabled', 'google_analytics_adid_collection_enabled',
    'google_analytics_ssaid_collection_enabled', 'google_analytics_automatic_screen_reporting_enabled',
    'firebase_crashlytics_collection_enabled', 'firebase_performance_collection_deactivated',
    'firebase_performance_collection_enabled', 'firebase_sessions_enabled',
    'delivery_metrics_exported_to_big_query_enabled', 'com.facebook.sdk.AutoLogAppEventsEnabled',
    'com.facebook.sdk.AdvertiserIDCollectionEnabled', 'com.facebook.sdk.AutoInitEnabled']}
PERMISSIONS = {'com.google.android.gms.permission.AD_ID', 'android.permission.ACCESS_ADSERVICES_ATTRIBUTION',
    'android.permission.ACCESS_ADSERVICES_AD_ID', 'android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE',
    'android.permission.ACCESS_ADSERVICES_TOPICS', 'com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE'}
REGISTRARS = {'com.google.firebase.components:com.google.firebase.sessions.FirebaseSessionsRegistrar',
    'com.google.firebase.components:com.google.firebase.analytics.connector.internal.AnalyticsConnectorRegistrar'}
COMPONENTS = {'com.google.firebase.sessions.SessionLifecycleService', 'com.google.android.gms.analytics.AnalyticsReceiver',
    'com.google.android.gms.analytics.AnalyticsService', 'com.google.android.gms.analytics.AnalyticsJobService'}


def verify_manifest(before, after, selected, original=None, patched=None):
    expected = copy.deepcopy(before)
    for name in ['requiredSplitTypes', 'splitTypes']:
        expected.attrib.pop(A + name, None)
    app = expected.find('application')
    metadata = {n.get(A + 'name'): n for n in app.findall('meta-data')}
    for name in MERGE_METADATA & metadata.keys():
        app.remove(metadata[name])
    if TRACKING in selected:
        permissions = [n for n in expected.findall('uses-permission') if n.get(A + 'name') in PERMISSIONS]
        assert len(permissions) == 6, 'Medium original advertising permissions changed'
        for node in permissions:
            expected.remove(node)
        for name, value in FLAGS.items():
            if name not in metadata:
                metadata[name] = ET.SubElement(app, 'meta-data', {A + 'name': name})
            metadata[name].set(A + 'value', value)
        for name in REGISTRARS:
            matches = [(parent, node) for parent in app.iter() for node in parent
                       if node.tag == 'meta-data' and node.get(A + 'name') == name]
            assert len(matches) == 1, 'Medium optional registrar inventory changed'
            parent, node = matches[0]
            parent.remove(node)
        components = [n for n in app if n.tag in ['service', 'receiver'] and n.get(A + 'name') in COMPONENTS]
        assert len(components) == 4, 'Medium original optional components changed'
        for node in components:
            node.set(A + 'enabled', 'false')
    if READER in selected:
        ET.SubElement(app, 'provider', {A + 'name': 'nl.johninnl.medium.reader.ReaderImageProvider',
            A + 'authorities': 'com.medium.reader.native-reader.images', A + 'exported': 'false', A + 'grantUriPermissions': 'false'})
        ET.SubElement(app, 'activity', {A + 'name': 'nl.johninnl.medium.reader.OfflineArticlesActivity',
            A + 'exported': 'true', A + 'enableOnBackInvokedCallback': 'false'})
    actual = copy.deepcopy(after)
    # ARSC may expose a duplicate resource under a generated alias. Compare its
    # preserved numeric identity, never waive an arbitrary FileProvider edit.
    for manifest, root in [(expected, original), (actual, patched)]:
        if root is None:
            continue
        public = ET.parse(Path(root) / 'res/values/public.xml').getroot()
        ids = {'@' + n.get('type') + '/' + n.get('name'): n.get('id') for n in public}
        for node in manifest.iter():
            for key, value in node.attrib.items():
                if value in ids:
                    node.set(key, ids[value])
    assert digest(expected) == digest(actual), 'Medium manifest changed outside selected merge/privacy/reader edits'


def verify_reader_resources(original, patched, selected):
    before = ET.parse(Path(original) / 'res/xml/shortcuts.xml').getroot()
    after = ET.parse(Path(patched) / 'res/xml/shortcuts.xml').getroot()
    expected = copy.deepcopy(before)
    if READER in selected:
        shortcut = ET.SubElement(expected, 'shortcut', {A + 'shortcutId': 'medium_reader_offline',
            A + 'shortcutShortLabel': '@string/medium_reader_offline_articles', A + 'icon': '@android:drawable/ic_menu_save'})
        ET.SubElement(shortcut, 'intent', {A + 'action': 'android.intent.action.VIEW',
            A + 'targetPackage': 'com.medium.reader', A + 'targetClass': 'nl.johninnl.medium.reader.OfflineArticlesActivity'})
    assert digest(after) == digest(expected), 'Medium shortcuts changed outside the selected offline entry'
    # Preserve every original default string and permit only the owned label.
    def text_digest(node):
        return node.tag, tuple(sorted(node.attrib.items())), node.text, tuple((text_digest(child), child.tail) for child in node)
    def strings(root):
        return {n.get('name'): text_digest(n) for n in ET.parse(Path(root) / 'res/values/strings.xml').getroot()}
    old, new = strings(original), strings(patched)
    name = 'medium_reader_offline_articles'
    assert new.keys() == old.keys() | ({name} if READER in selected else set()), 'Medium default string inventory changed'
    for key in old:
        assert old[key] == new[key], 'Medium original default string changed: ' + key
    assert (name in new) == (READER in selected), 'Medium offline label selection mismatch'
    if READER in selected:
        assert new[name] == text_digest(ET.fromstring('<string name="medium_reader_offline_articles">Offline articles</string>'))


def verify(original, patched, selected):
    original, patched = Path(original), Path(patched)
    old, new = classes(original), classes(patched)
    assert len(old) == 25391, 'Unsupported Medium original class inventory'
    extensions = json.loads(Path(__file__).with_name('medium_extension_contracts.json').read_text())
    needed = set()
    if TRACKING in selected or READER in selected:
        needed.add('privacy')
    if READER in selected:
        needed.add('reader')
    owned = {owner: value for label in needed for owner, value in extensions[label].items()}
    assert new.keys() == old.keys() | owned.keys(), 'Medium class inventory changed'
    for owner, path in old.items():
        assert declaration_shape(path.read_text()) == declaration_shape(new[owner].read_text()), 'Medium original class changed: ' + owner
    for owner, value in owned.items():
        assert class_digest(new[owner]) == value, 'Medium extension class changed: ' + owner
    verify_manifest(ET.parse(original / 'AndroidManifest.xml').getroot(), ET.parse(patched / 'AndroidManifest.xml').getroot(), selected,
                    original, patched)
    verify_reader_resources(original, patched, selected)
    return verify_methods(methods(original), methods(patched), selected, owned)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('original')
    parser.add_argument('patched')
    parser.add_argument('-e', '--enable', action='append', choices=[TRACKING, PROMOTIONS, READER], default=[])
    parser.add_argument('--original-apks')
    parser.add_argument('--patched-apk')
    args = parser.parse_args()
    print(f'PASS: {verify(args.original, args.patched, set(args.enable))} original Medium methods and exact selected effects')
    if args.original_apks or args.patched_apk:
        from media_inputs import verify_payload
        assert args.original_apks and args.patched_apk
        allowed = ['res/xml/shortcuts.xml'] if READER in args.enable else []
        print(f'PASS: {verify_payload(args.original_apks, args.patched_apk, allowed)} complete Medium payload entries')
