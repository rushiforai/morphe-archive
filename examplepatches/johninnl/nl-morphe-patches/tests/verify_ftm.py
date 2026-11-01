"""Verify emitted FTM 2.6.8 controls, retained native contracts and live-web boundaries."""
import argparse
import hashlib
import json
import itertools
import os
from pathlib import Path
import re
import subprocess
import xml.etree.ElementTree as ET
from urllib.parse import urlsplit
from verify_weerplaza import canonical_method, smali_string
from verify_trouw import sdk_classes
from ftm_browser_fixtures import verify_cascade, verify_guest_start
from ftm_start_navigation import verify_start_navigation, NAVIGATION, LEGACY_NAVIGATION

CLIENT = 'nl/ftm/ftmpulse/MainActivity$MyWebViewClient'
TYPE = 'L' + CLIENT + ';'
RESPONSE = 'Landroid/webkit/WebResourceResponse;'
FINISHED = 'onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V'
METRICS = 'com/google/firebase/messaging/MessagingAnalytics'
METRIC_FALSE = ['deliveryMetricsExportToBigQueryEnabled()Z', 'shouldUploadScionMetrics(Landroid/os/Bundle;)Z']
METRIC_VOID = ['logToScion(Ljava/lang/String;Landroid/os/Bundle;)V', 'logToFirelog(Lcom/google/firebase/messaging/reporting/MessagingClientEvent$Event;Landroid/content/Intent;Lcom/google/android/datatransport/TransportFactory;)V', 'setUserPropertyIfRequired(Landroid/os/Bundle;)V']
NAMES = {'Hide ads', 'Disable tracking', 'Skip consent screens', 'Hide Premium banner', 'Read full articles'}
A = '{http://schemas.android.com/apk/res/android}'
# Independently pinned from the unmodified three-DEX publisher input. Each digest
# covers every original method, its descriptor, canonical instructions and targets.
RETAINED = {'com/google/firebase/installations/FirebaseInstallations': 'd942be3bcb8364ab3019a5adc628f85d64fe276aa45704ce4107a63f78f5edf1',
 'com/google/firebase/messaging/FirebaseMessaging': 'cffc91a99adb5514cf7933c757c827de9ec73883f6e0c4e90129f7b9597486ec',
 'com/google/firebase/messaging/MessagingAnalytics': '50c4a4ef63587d02c66956f256093ecb51f7190590272a8e9f43674f9cd72051',
 'nl/ftm/ftmpulse/App': '4c9615faab1509492e66db510c3213913b6bc61e584a2eaf1607a65c7ddf8a94',
 'nl/ftm/ftmpulse/BuildConfig': 'c24fa0296e347c20f74fd853e6f78b24973395d04f1ca879a8db776fef299d72',
 'nl/ftm/ftmpulse/MainActivity': '7d06293ef75407e54945ac38c7f45bec325a200ed38190610bac111cc468b00c',
 'nl/ftm/ftmpulse/MainActivity$$ExternalSyntheticApiModelOutline0': '864a6441cc9f72113a39cbaa76df69efe426009b99385786ad82f8deb034963b',
 'nl/ftm/ftmpulse/MainActivity$$ExternalSyntheticLambda1': '089673af6788efc7dc4b3b6007c9796eb515b7761017b8cd45b04069ade501ad',
 'nl/ftm/ftmpulse/MainActivity$$ExternalSyntheticLambda2': 'b5298e5b9cec3f549894d61a52195f053cd5a8a002aed2e4d00eb82907572cdb',
 'nl/ftm/ftmpulse/MainActivity$$ExternalSyntheticLambda3': 'e99fd20362a8ba611914b280e76710e50ff131a38da90d5159be3defd8630195',
 'nl/ftm/ftmpulse/MainActivity$$ExternalSyntheticLambda4': 'b7af4adf8326697060ac88d56247d0cfe1c27b59115126f486933fc38d53361f',
 'nl/ftm/ftmpulse/MainActivity$$ExternalSyntheticLambda5': 'a17551fd86d815fc56a4fd81a9f6f01b1fc48214013a8ca9cd981b0cbd8cbb35',
 'nl/ftm/ftmpulse/MainActivity$$ExternalSyntheticLambda6': '3fe9565686a5b5a45a66c7405b0828fb72b01e0532be0ed4694d48802a15d7fc',
 'nl/ftm/ftmpulse/MainActivity$$ExternalSyntheticLambda7': '06642300340aeddbbb62168de55032d28c2f80f5ec32e9bf0e3449ee3f473fc8',
 'nl/ftm/ftmpulse/MainActivity$1': '2a5c60fb66dee9c98f6b79933d0526edcaf95ba339967c96afe80cf4464795fb',
 'nl/ftm/ftmpulse/MainActivity$2': '32b7feab5c4ce8bab2e57bf007852bcf3b9342bc5cc6f8d4331487620562de64',
 'nl/ftm/ftmpulse/MainActivity$3': 'c095dbed53165e8de96af5f7adc834fde9c82ee0b9a62a6e78081dd119a78182',
 'nl/ftm/ftmpulse/MainActivity$MyWebChromeClient': '1e71e4fa2364cc39616ed35d5f0355483f38f5f6e7c35bad5e57f5d3d649261b',
 'nl/ftm/ftmpulse/MainActivity$MyWebChromeClient$1': 'f1d0279f08da391ed8336beee732112a37176eb7046b4738665aac21a011d7a9',
 'nl/ftm/ftmpulse/MainActivity$MyWebViewClient': 'd964de6bbb45a71f7ec0ac079991f3fa858ef856260681c0c8299981901014ca',
 'nl/ftm/ftmpulse/MainActivity-IA': '44136fa355b3678a1146ad16f7e8649e94fb4fc21fe77e8310c060f61caaff8a',
 'nl/ftm/ftmpulse/R': 'c24fa0296e347c20f74fd853e6f78b24973395d04f1ca879a8db776fef299d72',
 'nl/ftm/ftmpulse/R$color': 'c24fa0296e347c20f74fd853e6f78b24973395d04f1ca879a8db776fef299d72',
 'nl/ftm/ftmpulse/R$dimen': 'c24fa0296e347c20f74fd853e6f78b24973395d04f1ca879a8db776fef299d72',
 'nl/ftm/ftmpulse/R$drawable': 'c24fa0296e347c20f74fd853e6f78b24973395d04f1ca879a8db776fef299d72',
 'nl/ftm/ftmpulse/R$id': 'c24fa0296e347c20f74fd853e6f78b24973395d04f1ca879a8db776fef299d72',
 'nl/ftm/ftmpulse/R$layout': 'c24fa0296e347c20f74fd853e6f78b24973395d04f1ca879a8db776fef299d72',
 'nl/ftm/ftmpulse/R$mipmap': 'c24fa0296e347c20f74fd853e6f78b24973395d04f1ca879a8db776fef299d72',
 'nl/ftm/ftmpulse/R$raw': 'c24fa0296e347c20f74fd853e6f78b24973395d04f1ca879a8db776fef299d72',
 'nl/ftm/ftmpulse/R$string': 'c24fa0296e347c20f74fd853e6f78b24973395d04f1ca879a8db776fef299d72',
 'nl/ftm/ftmpulse/R$style': 'c24fa0296e347c20f74fd853e6f78b24973395d04f1ca879a8db776fef299d72',
 'nl/ftm/ftmpulse/R$xml': 'c24fa0296e347c20f74fd853e6f78b24973395d04f1ca879a8db776fef299d72',
 'nl/ftm/ftmpulse/audio/AudioBinder': 'ae43d2650a4cc980db4bbf9b0193a2a575fef30819b8090bf545b7a3c0b5d884',
 'nl/ftm/ftmpulse/audio/AudioService': '3437f50c5f78f05cfb38b66444a4bc899549555b2545e071016b1be314ad66e5',
 'nl/ftm/ftmpulse/audio/AudioService$1': '4f91deffbc20488e533668c5e66b278b9d7a5b85f2aa5349bba82b8ee7899b14',
 'nl/ftm/ftmpulse/audio/AudioService$2': 'c9817c20989641bd05786babcd155e0166bd23e6105e9a4fe996b9f96e4958aa',
 'nl/ftm/ftmpulse/audio/AudioService$3': '4fe7032d4071c7192a7456d607e794dbecadbb2cbd827573d15ff3062ca702ea',
 'nl/ftm/ftmpulse/audio/AudioService$3$1': '59fd04faffa30272d1928982a685049e056d8534fdcd30944beb254bc059b983',
 'nl/ftm/ftmpulse/audio/AudioService$4': '556aed653680edeb705e3628840c2474d778173a67e86aa37e0a5175721255fb',
 'nl/ftm/ftmpulse/audio/MusicEvents': 'd7c1a5d2f66a6af672ca21cdd362d26b2cb2a3b24c5897cd67971c4e00fe7bd1',
 'nl/ftm/ftmpulse/audio/Utils': 'ee914b5c3bc1e6eb12ac8733ca08a5c88cf9a1590c4e335845273a7413c93c4d',
 'nl/ftm/ftmpulse/audio/models/Track': '6de15ea785d2c1bc11e4c6dd1a1809a5e678482c881a3e58f60fe63319b323d1',
 'nl/ftm/ftmpulse/audio/models/Track$1': 'c2808e071629f0950ba057d746013dd82c7902763d32024f6977be1d6d5a897b',
 'nl/ftm/ftmpulse/audio/polyfill/OnRejectType': 'a8eb2bda2392bf084d1ecde4685caae3522056da2f0c81bdde0f6bce5f52eaf4',
 'nl/ftm/ftmpulse/audio/polyfill/OnResolveType': 'b3d915c300c8ec711b3d37afdf9056a450c2655e67eb735c25b187d4998c76ad',
 'nl/ftm/ftmpulse/audio/polyfill/Promise': 'd89f1d989732d54071b767452eab89ffbc7e2d43dcf3e6c858ea52129e28e697',
 'nl/ftm/ftmpulse/firebase/MyFirebaseMessagingService': 'b64030dbb67e69475c8f08dcbe9ac4513614828da1e5ab720f394aa69d02b4d7',
 'nl/ftm/ftmpulse/firebase/MyFirebaseMessagingService$1': 'db46eeecd5b624f3546b82b3fd2fdc8ef4b02d6c755ebcfd80b8c0852c10a60a',
 'nl/ftm/ftmpulse/helper/JsonHelper': '649e979e53e1ff275f4c46677154029e115e4ff979d9c3983ec82b970958c805',
 'nl/ftm/ftmpulse/helper/Routing': '7351fbaeadf6209b7bd847dea57f732ffe16568ca76b365ce12fa48be8c845c3',
 'nl/ftm/ftmpulse/helper/Settings': '8c36f4d0efcff028b515562535f09de371514c6efc404e4d23da47a3c7ee4a22',
 'nl/ftm/ftmpulse/helper/SpinnerHelper': 'c966c4750d231d8786ecd7e80fd0176e12f8ee9e70119c48ec3093227871a541',
 'nl/ftm/ftmpulse/helper/Util': '86c8554aa84457e26e69e2b47fea38f3c95fe0d384bcb27d72c1ffa2777d6fcb',
 'nl/ftm/ftmpulse/javascriptInterface/AndroidShareHandler': 'fb3add2d0574b8ca3d02a4ea19d5887ae545d5b266ca04d9551709d7d5df6407',
 'nl/ftm/ftmpulse/nativeComponent/AudioComponent': 'c8d732f1346d9166a80eff60d2e3ced27f2eae45e3c58e71649f39d8ba501b72',
 'nl/ftm/ftmpulse/nativeComponent/AudioComponent$$ExternalSyntheticLambda0': '038e5a2cd87a5463306199e55c194b40d9a7b6e8a785bf1aea0074e3551b8c85',
 'nl/ftm/ftmpulse/nativeComponent/AudioComponent$1': 'd08ac3ef6e9ffda9a1be1b8d4f309d8e7123ff0b78048cfd827f216537d34989',
 'nl/ftm/ftmpulse/nativeComponent/LocaleComponent': '88d204e00a0a3e3afe842d5f963865a6563888ec9d66686e9f1a7e6430b0171a',
 'nl/ftm/ftmpulse/nativeComponent/MessageForWeb': '5b95156a38734fb92deb984a8cf116651762cd82da874964c50e33f4b9942179',
 'nl/ftm/ftmpulse/nativeComponent/NativeComponent': '0a09562bf7a9a0b406879b52269eb04ac876816c1c2a856de6cbd6e9a85273dd',
 'nl/ftm/ftmpulse/nativeComponent/TokenCallback': '057ff47ee4901d6f5e6deb782820df2a2b9e8e4f6b14f0ed7de1164e047bb0a9'}

MANIFEST_COMPONENTS = {'androidx.profileinstaller.ProfileInstallReceiver': '29760d19fdf501938a970f8f944a7fe7ceedb7a3343868e1e00b32663876986d',
 'androidx.startup.InitializationProvider': 'fc5dce0c185093e619918dfab24d978b0c1c97c4db0610a7fcbd19d6dc57c56b',
 'com.google.android.datatransport.runtime.backends.TransportBackendDiscovery': 'c6227ffcc9c56db5102c24ec57a88b0881a38391b0a146fafa45b593de251f93',
 'com.google.android.datatransport.runtime.scheduling.jobscheduling.AlarmManagerSchedulerBroadcastReceiver': 'e772bacdb9428ddcaeac1f0b3017dab0840681d7353dea29881dea05b8d4d2f0',
 'com.google.android.datatransport.runtime.scheduling.jobscheduling.JobInfoSchedulerService': 'f18a7b0ae83c96204d628f6408d8c75ff66d930535928c6e5b673a16a1bd3c44',
 'com.google.android.gms.common.api.GoogleApiActivity': '5ab6cf6d88316928b2083cbe2be9d5cc8c7b115d898bb0ce6b9253570fcbfb99',
 'com.google.firebase.components.ComponentDiscoveryService': '645c2f3816793e203016bde1bd2e93c35a1a97922c51753cea62b753677f9d47',
 'com.google.firebase.iid.FirebaseInstanceIdReceiver': '5a796bb526192e52203ff2b4a0fe9c6a0e6f40d865f0b0003b5b9547aea77a60',
 'com.google.firebase.messaging.FirebaseMessagingService': 'd8e083fe334005cec46ba3db54d10c6d1fed8d377af9298da37cc19706155209',
 'com.google.firebase.provider.FirebaseInitProvider': '564c372ad3e2388c86124917d550452c7078257deefd624b0b02bbc4493abb15',
 'nl.ftm.ftmpulse.MainActivity': '6b41146f0b52ceb0fffed15c1c1ee5bd5ac7cf6b8d8e5925ea80686b61ca8dc6',
 'nl.ftm.ftmpulse.audio.AudioService': 'de638a0160969260267546b830227c240568823ae57e123f830f8160f8eda860',
 'nl.ftm.ftmpulse.firebase.MyFirebaseMessagingService': '0aea7e94069acf61c2592552e56e5b03234f478eca8067ac21cf5055503df9f7'}


def source(root, cls):
    paths = list(root.glob(f'smali*/{cls}.smali')) + list(root.glob(f'smali/smali*/{cls}.smali'))
    assert len(paths) == 1, cls
    return paths[0].read_text()


def canonical(root, cls, sig, skip=0):
    return [s.replace('const-string/jumbo ', 'const-string ') for s in canonical_method(root, cls, sig, skip)]


def retained_digest(root, cls, tracking=False, web=False):
    methods = {}
    for sig in re.findall(r'^\.method[^\n]* (\S+)\n', source(root, cls), re.M):
        if (sig.startswith(('morphe', 'shouldInterceptRequest(')) or sig == NAVIGATION) and cls == CLIENT:
            continue
        skip = 1 if web and cls == CLIENT and sig == FINISHED else 0
        if tracking and cls == METRICS:
            skip = 2 if sig in METRIC_FALSE else (1 if sig in METRIC_VOID else 0)
        methods[sig] = canonical(root, cls, sig, skip)
    return hashlib.sha256(json.dumps(methods, sort_keys=True, separators=(',', ':')).encode()).hexdigest()


def exception_handler(root, sig):
    body = re.search(r'^\.method[^\n]* ' + re.escape(sig) + r'\n(.*?)^\.end method', source(root, CLIENT), re.M | re.S)[1]
    target = re.search(r'\.catch Ljava/lang/Exception; \{:[^ ]+ \.\. :[^}]+\} (:[^\s]+)', body)
    assert target, 'Fail-open policy parser needs actual emitted exception table'
    index, annotations = 0, 0
    for raw in body.splitlines():
        line = raw.strip()
        if line.startswith('.annotation'): annotations += 1
        if line.startswith('.end annotation'): annotations -= 1; continue
        if annotations or not line or line.startswith(('.', '#')): continue
        if line == target[1]: return index
        if not line.startswith(':'): index += 1
    raise AssertionError('Missing emitted exception target')


def emitted(root, sig, args):
    """Interpret the actual emitted helper instructions, never a copied URL policy."""
    code = canonical(root, CLIENT, sig)
    regs = {'p' + str(i): value for i, value in enumerate(args)}
    result, pc = None, 0
    for _ in range(5000):
        line = code[pc]; pc += 1
        if line.startswith('const-string '):
            dest, value = line.split(' ', 1)[1].split(', ', 1); regs[dest] = smali_string(value)
        elif line.startswith(('const/4 ', 'const/16 ')):
            dest, value = line.split(' ', 1)[1].split(', ', 1); regs[dest] = int(value, 16)
        elif line.startswith('move-result'):
            regs[line.split()[1]] = result
        elif line.startswith('move-object '):
            dest, src = line.split(' ', 1)[1].split(', '); regs[dest] = regs[src]
        elif line.startswith('sget-object '): regs[line.split()[1].strip(',')] = 'Locale.ROOT'
        elif line.startswith('new-instance '):
            dest, typ = line.split(' ', 1)[1].split(', '); regs[dest] = {'type': typ}
        elif line.startswith('new-array '):
            dest, count, typ = line.split(' ', 1)[1].split(', '); assert typ == '[B'; regs[dest] = bytes(regs[count])
        elif line.startswith('invoke-'):
            names = line.split('{', 1)[1].split('}', 1)[0]
            values = [regs[n] for n in names.split(', ')] if names else []
            ref = line.split('}, ', 1)[1]
            if line.startswith('invoke-super '): return ('super', ref, values)
            if ref.startswith(TYPE + '->morphe'): result = emitted(root, ref.split('->')[1], values)
            elif 'Uri;->parse' in ref:
                try: result = urlsplit(values[0])
                except ValueError:
                    pc = exception_handler(root, sig)
                    continue
            elif 'Uri;->getHost' in ref: result = values[0].hostname
            elif 'Uri;->getScheme' in ref: result = values[0].scheme
            elif 'Uri;->getEncodedPath' in ref: result = values[0].path
            elif 'Uri;->toString' in ref: result = values[0]
            elif 'WebResourceRequest;->getUrl' in ref: result = values[0]['url']
            elif 'WebResourceRequest;->getMethod' in ref: result = values[0]['method']
            elif 'WebResourceRequest;->isForMainFrame' in ref: result = values[0]['mainFrame']
            elif 'WebView;->getUrl' in ref: result = values[0]['url']
            elif 'WebView;->loadUrl' in ref: values[0]['loads'].append(values[1]); result = None
            elif ref == TYPE + '->' + LEGACY_NAVIGATION:
                assert line.startswith('invoke-virtual ')
                assert values[0]['view'] is values[1], 'Delegate original router with the original WebView'
                values[1]['nativeCalls'].append(values[2])
                result = values[1]['nativeConsumes']
            elif 'String;->toLowerCase' in ref: result = values[0].lower()
            elif 'String;->equals' in ref: result = values[0] == values[1]
            elif 'String;->endsWith' in ref: result = values[0].endswith(values[1])
            elif 'String;->matches' in ref: result = re.fullmatch(values[1], values[0]) is not None
            elif 'ByteArrayInputStream;-><init>' in ref: values[0]['bytes'] = values[1]
            elif 'WebResourceResponse;-><init>' in ref:
                values[0].update(mime=values[1], encoding=values[2], stream=values[3], status=200)
            elif 'WebView;->evaluateJavascript' in ref:
                values[0].append(values[1]); assert values[2] == 0
            else: raise AssertionError('Unsupported emitted operation: ' + line)
        elif line.startswith(('if-eqz ', 'if-nez ')):
            op, reg, target = line.replace(',', '').split()
            if bool(regs[reg]) == (op == 'if-nez'): pc = int(target[1:])
        elif line.startswith('if-eq '):
            left, right, target = line.split(' ', 1)[1].split(', ')
            if regs[left] == regs[right]: pc = int(target[1:])
        elif line.startswith('goto'): pc = int(line.split('@')[1])
        elif line == 'return-void': return None
        elif line.startswith('return'): return regs[line.split()[1]]
        elif line.startswith('move-exception '): regs[line.split()[1]] = Exception()
        else: raise AssertionError('Unsupported emitted instruction: ' + line)
    raise AssertionError('Nonterminating emitted helper: ' + sig)


def verify_policy(root, tracking, article):
    blocked = ['https://insight.ftm.nl/js/', 'HTTPS://EVENTOR.FTM.NL/api/event/save', 'http://sub.glitchtip.ftm.nl/api/1/store/', 'https://diffuser-cdn.app-us1.com/diffuser/diffuser.js', 'https://sub.diffuser-cdn.app-us1.com/x', 'https://www.ftm.nl/activecampaign/event/create/view_comments/14542?x=1', 'https://www.ftm.eu/activecampaign/event/create/view_comments/0']
    decisions = ['https://www.ftm.nl/abonnement/paywall/14542', 'https://WWW.FTM.EU/abonnement/paywall/0001?x=1']
    allowed = [None, '', 'not a URI', 'https://[invalid', 'about:blank', 'data:text/html,insight.ftm.nl', 'ftp://insight.ftm.nl/x', '//insight.ftm.nl/x', 'https://insight.ftm.nl.evil.test/x', 'https://notinsight.ftm.nl/x', 'https://www.ftm.nl/x?next=/abonnement/paywall/42', 'https://www.ftm.nl/abonnement/paywall/42/more', 'https://www.ftm.nl/abonnement/paywall/-1', 'https://www.ftm.nl/abonnement/paywall/42/', 'https://www.ftm.nl/abonnement/paywall/%34%32', 'https://www.ftm.nl/abonnement%2fpaywall/42', 'https://www.ftm.nl/abonnement/paywall/42%2f', 'https://ftm.nl/abonnement/paywall/42', 'https://sub.www.ftm.nl/abonnement/paywall/42', 'https://www.ftm.nl.evil.test/abonnement/paywall/42', 'https://www.ftm.nl/activecampaign/event/create/view_comments/42/more', 'https://www.ftm.nl/activecampaign/event/create/view_comments/%34%32', 'https://www.ftm.nl/x?next=/activecampaign/event/create/view_comments/42', 'https://www.ftm.nl/pageview/visited', 'https://www.ftm.nl/pageview/create', 'https://www.ftm.nl/device_log/log', 'https://www.ftm.nl/security/login', 'https://www.ftm.nl/favorite_paywall/article/42', 'https://www.ftm.nl/feature_paywall/comment', 'https://www.ftm.nl/sharehash/42', 'https://www.ftm.nl/sharehash_check/42', 'https://www.ftm.eu/notifications/ask/banner', 'https://www.ftm.nl/abonnement/article/42', 'https://www.ftm.nl/assets/compiled/js/footer.min.js', 'https://www.ftm.eu/gebruik-de-app', 'https://www.youtube.com/embed/x', 'https://datawrapper.dwcdn.net/x', 'https://fcmregistrations.googleapis.com/x']
    for url, expected in [(u, 1 if tracking else 0) for u in blocked] + [(u, 2 if article else 0) for u in decisions] + [(u, 0) for u in allowed]:
        assert emitted(root, 'morpheWebPolicy(Ljava/lang/String;)I', [url]) == expected, str(url)
        response = emitted(root, 'morpheWebResponse(Ljava/lang/String;)' + RESPONSE, [url])
        if expected:
            assert response['mime'] == ('text/html' if expected == 2 else 'text/plain'), url
            assert response['encoding'] == 'UTF-8' and response['status'] == 200
            assert response['stream']['bytes'] == b'' and response['stream']['type'] == 'Ljava/io/ByteArrayInputStream;'
        else: assert response == 0, url
        for typ, arg in [('Ljava/lang/String;', url), ('Landroid/webkit/WebResourceRequest;', {'url': url})]:
            actual = emitted(root, 'shouldInterceptRequest(Landroid/webkit/WebView;' + typ + ')' + RESPONSE, ['client', 'webview', arg])
            if expected: assert actual['mime'] == response['mime']
            else:
                assert actual == ('super', 'Landroid/webkit/WebViewClient;->shouldInterceptRequest(Landroid/webkit/WebView;' + typ + ')' + RESPONSE, ['client', 'webview', arg]), url


def verify_call_kinds(root):
    text = source(root, CLIENT)
    assert '.super Landroid/webkit/WebViewClient;' in text
    sdk, archive = sdk_classes()
    try:
        declarations = {m[1]: m[0].split() for m in re.findall(r'^\.method ([^\n]*?) (\S+)\n', text, re.M)}
        for sig, body in re.findall(r'^\.method[^\n]* (\S+)\n(.*?)^\.end method', text, re.M | re.S):
            if not (sig.startswith(('morphe', 'shouldInterceptRequest(')) or sig == NAVIGATION): continue
            for kind, typ, target in re.findall(r'invoke-(static|virtual|interface|direct|super)(?:/range)?\s+\{[^}]*\},\s+(L[^;]+;)->(\S+)', body):
                if typ == TYPE:
                    assert target in declarations, (sig, target)
                    if target == LEGACY_NAVIGATION:
                        assert kind == 'virtual' and 'static' not in declarations[target], (sig, target)
                    else:
                        assert kind == 'static' and 'static' in declarations[target], (sig, target)
                    continue
                contract = sdk(typ)
                assert contract, 'Missing Android SDK call contract: ' + typ
                if kind in {'virtual', 'interface'}: assert (kind == 'interface') == contract[0], (sig, typ)
                while target not in contract[2] and contract[1]: contract = sdk(contract[1]); assert contract
                assert target in contract[2], 'Missing SDK method ' + typ + '->' + target
                assert (kind == 'static') == bool(contract[2][target] & 8), (sig, target)
                if kind == 'direct': assert target.startswith('<init>(')
                if kind == 'super': assert typ == 'Landroid/webkit/WebViewClient;' and (target.startswith('shouldInterceptRequest(') or target == NAVIGATION)
    finally: archive.close()
    exception_handler(root, 'morpheWebPolicy(Ljava/lang/String;)I')


def verify_dom(scripts, tracking, consent, premium, ads=False, announcement_functions=None):
    runner = Path(__file__).with_name('ftm_dom_fixtures.js')
    proc = subprocess.run(['node', str(runner)], input=json.dumps(dict(scripts=scripts, tracking=tracking, consent=consent, premium=premium, ads=ads, announcementFunctions=announcement_functions)), text=True, capture_output=True)
    assert proc.returncode == 0, proc.stdout + proc.stderr



def manifest_contract(element):
    return [element.tag, sorted(element.attrib.items()), [manifest_contract(child) for child in element]]


def verify(root: Path, selected: set[str]) -> list[str]:
    assert selected <= NAMES, selected - NAMES
    tracking = bool(selected & {'Disable tracking', 'Skip consent screens'})
    article = bool(selected & {'Read full articles', 'Hide Premium banner'})
    web = bool(selected)
    manifest = ET.parse(root / 'AndroidManifest.xml')
    for name, digest in MANIFEST_COMPONENTS.items():
        matches = [e for e in manifest.iter() if e.get(A + 'name') == name]
        assert len(matches) == 1, 'Preserve manifest component ' + name
        actual = hashlib.sha256(json.dumps(manifest_contract(matches[0]), separators=(',', ':')).encode()).hexdigest()
        assert actual == digest, 'Retained manifest component ' + name
    for name, expected in [('firebase_analytics_collection_deactivated', 'true'), ('delivery_metrics_exported_to_big_query_enabled', 'false')]:
        matches = [e.get(A + 'value') for e in manifest.iter('meta-data') if e.get(A + 'name') == name]
        assert matches == ([expected] if tracking else []), name
    for sig in METRIC_FALSE + METRIC_VOID:
        body = canonical(root, METRICS, sig)
        prefix = ['const/4 v0, 0x0', 'return v0'] if sig in METRIC_FALSE else ['return-void']
        assert (body[:len(prefix)] == prefix) == tracking, sig
    text = source(root, CLIENT)
    assert (' morphePageFinished(' in text) == web, 'Install existing-client web controls for selected patch'
    assert (' ' + NAVIGATION in text) == web, 'Install one modern navigation callback only with web controls'
    for cls, digest in RETAINED.items():
        assert retained_digest(root, cls, tracking, web) == digest, 'Retained original methods: ' + cls
    if not web:
        assert ' morphe' not in text and ' shouldInterceptRequest(' not in text
        return []
    for flag, enabled in [('Tracking', tracking), ('ArticleDecision', article), ('Consent', 'Skip consent screens' in selected), ('Premium', 'Hide Premium banner' in selected), ('Ads', bool(selected & {'Hide ads', 'Disable tracking', 'Skip consent screens'}))]:
        assert bool(emitted(root, 'morphe' + flag + 'Enabled()Z', [])) == enabled, flag
    finished = canonical(root, CLIENT, FINISHED)
    assert finished[0] == 'invoke-static {p1}, ' + TYPE + '->morphePageFinished(Landroid/webkit/WebView;)V'
    assert sum('->morphePageFinished(' in s for s in finished) == 1
    verify_policy(root, tracking, article)
    verify_call_kinds(root)
    verify_start_navigation(root, 'Skip consent screens' in selected, emitted, text)
    scripts = []
    emitted(root, 'morphePageFinished(Landroid/webkit/WebView;)V', [scripts])
    verify_dom(scripts, tracking, 'Skip consent screens' in selected, 'Hide Premium banner' in selected, bool(selected & {'Hide ads', 'Disable tracking', 'Skip consent screens'}))
    verify_cascade(scripts, 'Hide Premium banner' in selected)
    verify_guest_start(scripts, 'Skip consent screens' in selected)
    if selected == NAMES:
        # Exercise independent emitted cleanup combinations, beyond dependency
        # selections, so an Ads style/observer cannot mask a Premium regression.
        cleanups = {}
        for name in ['Tracking', 'Consent', 'Premium', 'Ads']:
            captured = []
            emitted(root, 'morpheClean' + name + '(Landroid/webkit/WebView;)V', [captured])
            assert len(captured) == 1, name
            cleanups[name] = captured[0]
        verify_guest_start([script for name, script in cleanups.items() if name != 'Consent'], False)
        for flags in itertools.product([False, True], repeat=4):
            verify_dom([cleanups[name] for name, enabled in zip(cleanups, flags) if enabled], *flags)
    return scripts


def private_web_probe(directory, scripts=None, selected=frozenset()):
    """Opt-in: execute captured publisher callback functions without redistributing them.

    Raw footer/article HTML stays in the caller's private scratch directory.
    Outputs contain counts, ancestry and hashes only. Samples do not establish
    paid-only access; server classification and a restricted sample remain open.
    """
    from html.parser import HTMLParser
    footer = (directory / 'footer.min.js').read_text()
    def extract(name, next_marker):
        start = footer.index('function ' + name + '(')
        return footer[start:footer.index(next_marker, start)]
    # Extract next function after the signature, rather than the current start.
    announcement_functions = '\n'.join(footer[start:footer.index('function ', start + 10)] for name in ['Oe', 'FA', 'qA'] for start in [footer.index('function ' + name + '(')])
    verify_dom(scripts or [], bool(selected & {'Disable tracking', 'Skip consent screens'}), 'Skip consent screens' in selected, 'Hide Premium banner' in selected, bool(selected & {'Hide ads', 'Disable tracking', 'Skip consent screens'}), announcement_functions)
    print('PASS captured Oe/FA/qA with emitted cleanup: scoped close, share restoration, replacements and retained state')
    functions = '\n'.join([extract('Hk', 'function jk('), extract('jk', 'var si='), extract('bc', 'function Hk('), extract('Sc', 'function Gk('), extract('Gk', 'function Yg('), extract('Ec', 'var yc=')])
    assert re.search(r'\bhc=3\b', footer), 'Re-audit original truncation boundary if remote JS changes'
    class Parser(HTMLParser):
        def __init__(self):
            super().__init__(); self.root = dict(tag='root', attrs={}, children=[]); self.stack = [self.root]
        def handle_starttag(self, tag, attrs):
            node = dict(tag=tag, attrs=dict(attrs), children=[], text='')
            self.stack[-1]['children'].append(node)
            if tag not in {'area','base','br','col','embed','hr','img','input','link','meta','param','source','track','wbr'}: self.stack.append(node)
        def handle_endtag(self, tag):
            for i in range(len(self.stack)-1, 0, -1):
                if self.stack[i]['tag'] == tag:
                    self.stack = self.stack[:i]; break
        def handle_data(self, text): self.stack[-1]['text'] = self.stack[-1].get('text', '') + text
    def walk(node, ancestry=()):
        yield node, ancestry
        for child in node['children']: yield from walk(child, ancestry + (node['tag'] + '.' + '.'.join(node['attrs'].get('class','').split()),))
    articles, evidence = [], []
    for path in sorted(directory.glob('article-*.html')):
        parser = Parser(); parser.feed(path.read_text())
        bodies = [n for n, a in walk(parser.root) if 'body' in n['attrs'].get('class','').split() and any(s.startswith('article.') for s in a)]
        assert len(bodies) == 1, 'Expected one supplied article body in ' + path.name
        body = bodies[0]
        paragraphs = []
        for n, ancestry in walk(body):
            text = ' '.join(' '.join(x.get('text','') for x, _ in walk(n)).split())
            if n['tag'] == 'p' and len(text.split()) >= 12:
                paragraphs.append(dict(words=len(text.split()), sha256=hashlib.sha256(text.encode()).hexdigest(), ancestry=ancestry))
        assert paragraphs, 'Expected substantial supplied paragraphs'
        # These are candidates, not an assertion that the last qualifying node is
        # substantive editorial content. A human/source classification is still open.
        evidence.append(dict(file=path.name, parts=len(body['children']), qualifying_paragraphs=len(paragraphs), last_candidate=paragraphs[-1]))
        def redact(n):
            return dict(tag=n['tag'], classes=n['attrs'].get('class','').split(), content_hash=hashlib.sha256(n.get('text','').encode()).hexdigest(), children=[redact(c) for c in n['children']])
        articles.append(redact(body))
    assert articles, 'Supply private article-*.html files'
    runner = r'''
const vm=require('node:vm'),assert=require('node:assert/strict'),input=JSON.parse(require('node:fs').readFileSync(0,'utf8'));
function setup(original, scenario) {
 const body=structuredClone(original);let callbacks=[],allowedCallbacks=0,referrals=0,request;
 function parents(n){for(const c of n.children){c.parent=n;parents(c)}}parents(body);
 function coll(nodes){return {nodes,length:nodes.length,slice(i){return coll(nodes.slice(i))},filter(selectors){return coll(nodes.filter(n=>selectors.split(',').some(s=>n.classes.includes(s.trim().slice(1)))))},remove(){for(const n of nodes){if(n.parent)n.parent.children=n.parent.children.filter(c=>c!==n)}return this},eq(i){return coll(nodes[i]?[nodes[i]]:[])},is(s){return !!nodes[0]?.classes.includes(s.slice(1))},children(){return coll(nodes.flatMap(n=>n.children))},data(k){return k==='id'?14542:'private-slug'},removeAttr(){return this},append(){return this},insertAfter(other){const n=other.nodes[0];if(n?.parent){const p=n.parent;nodes.forEach(x=>x.parent=p);p.children.splice(p.children.indexOf(n)+1,0,...nodes)}return this},on(_e,f){f()}}}
 const $=selector=>selector==='article.article .body'?coll([body]):selector==='article.article'?coll([body]):typeof selector==='string'&&selector.startsWith('<')?coll([{tag:'div',classes:['text-pp'],children:[]}]):coll([]);
 $.ajax=options=>{request=options;if(scenario.kind==='error')options.error();else options.success(scenario.body,'success',{getResponseHeader(k){assert.equal(k,'content-type');return scenario.mime}})};
 const ctx={$,window:{FTM:{user:{loggedIn:false}},innerWidth:100},location:{search:'?test=1'},document:{readyState:'complete',referrer:''},navigator:{userAgent:'FTM_APP'},B:{generate(name,args){assert.ok(['user_subscription_paywall','security_login','register'].includes(name));return name}},ie:x=>x,si:{log(){},error(){}},Bk:{log(){}},hc:3,Mh:false,Pr:false,En:true,_c:[v=>callbacks.push(v)],Fn:()=>({}),lc:()=>false,fs:()=>allowedCallbacks++,Jg(){},setTimeout:f=>f(),_h:()=>referrals++,me:()=>false,be:{openBecomeMemberInWebbrowser(){throw Error('Unexpected account redirect')}}};
 vm.createContext(ctx);vm.runInContext(input.functions,ctx);const supplied=[];function snapshot(n){supplied.push([n,[...n.children]]);n.children.forEach(snapshot)}snapshot(body);
 vm.runInContext('Sc()',ctx,{timeout:1000});
 assert.equal(request.type,'POST');assert.equal(request.url,'user_subscription_paywall');assert.equal(request.data.userAgent,'ftm_app');
 assert.equal(ctx.Pr,true);assert.deepEqual(callbacks,[scenario.allowed]);assert.equal(ctx.En,scenario.allowed);assert.equal(allowedCallbacks,scenario.allowed?1:0);
 if(scenario.allowed){for(const [node,children] of supplied){assert.equal(node.children.length,children.length);children.forEach((c,i)=>assert.equal(node.children[i],c))}}else assert.ok(body.children.length<supplied[0][1].length,'Actual HTML modal must exercise original destructive branch');
 return {ctx,body};
}
const scenarios=[{kind:'success',mime:'text/html; charset=UTF-8',body:'',allowed:true},{kind:'success',mime:'text/html',body:'<div>modal</div>',allowed:false},{kind:'success',mime:'application/json',body:{type:'shareLink',html:'share'},allowed:true},{kind:'success',mime:'application/json',body:{type:'other'},allowed:true},{kind:'success',mime:'application/json',body:'invalid JSON object type',allowed:true},{kind:'error',allowed:true}];
for(const article of input.articles)for(const scenario of scenarios)setup(article,scenario);
// Explicitly exercise the original third-part paragraph truncation, in addition
// to the real received bodies; supplied >4 paragraphs catch a partial-body test.
const synthetic={tag:'div',classes:['body'],children:Array.from({length:7},(_,i)=>({tag:'div',classes:[i===3?'banner-pp':'text-pp'],children:Array.from({length:9},()=>({tag:'p',classes:[],children:[]}))}))};
const {body}=setup(synthetic,scenarios[1]);assert.equal(body.children[2].children.length,4);assert.equal(body.children.some(n=>n.classes.includes('banner-pp')),false);
setup(synthetic,scenarios[0]);console.log('PASS captured Gk/Sc/Hk: empty/HTML/JSON/error callbacks; all supplied editorial descendants retained in supported empty decision; original truncation reproduced');
'''
    proc = subprocess.run(['node', '-e', runner], input=json.dumps(dict(functions=functions, articles=articles)), text=True, capture_output=True)
    assert proc.returncode == 0, proc.stdout + proc.stderr
    print(proc.stdout.strip())
    print(json.dumps(dict(private_body_evidence=evidence, restricted_sample_proven=False), sort_keys=True))


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('decoded_root', type=Path)
    p.add_argument('-e', '--enable', action='append', default=[], choices=sorted(NAMES))
    p.add_argument('--web-fixtures', type=Path, help='Opt-in private captured footer/article directory; raw source stays outside Git')
    args = p.parse_args()
    scripts = verify(args.decoded_root, set(args.enable))
    if args.web_fixtures: private_web_probe(args.web_fixtures, scripts, set(args.enable))
    print('PASS FTM ' + (', '.join(sorted(args.enable)) or 'original baseline'))


if __name__ == '__main__': main()
