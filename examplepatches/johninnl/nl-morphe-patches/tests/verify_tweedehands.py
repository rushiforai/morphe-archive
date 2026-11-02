"""Inspect genuine Belgian bytecode and execute privacy-effect boundaries."""
import argparse
from collections import defaultdict
import hashlib
from pathlib import Path
import re
import zipfile
import xml.etree.ElementTree as ET

from brabant_smali import canonical
from brabant_effects import restore_edits, restore_alignment
from dex_declarations import DexDeclarations
from rtl_vm import Memory, Reference, VmThrown, execute, is_zero
from verify_dumpert import Smali, absolute_registers, xml_digest, audit_call
from marktplaats_1619 import audit_fields
from verify_parool import sdk_classes
from tweedehands_contracts import DATA, selected_edits

A = '{http://schemas.android.com/apk/res/android}'
AD_TYPES = {'SRP_HEADER_NATIVE_AD', 'SRP_LIST_NATIVE_AD', 'DISPLAY_BANNER',
            'ICAS_TOPBLOCK_LISTING', 'ICAS_SIBLING_LISTING', 'SHIPPING_PROMOTION', 'GENAI_PROMOTION'}
PUBLISHER_SHA1 = '5BFB2470C28371C4273CA0232A57C120977619D3'


def verify_firebase_headers(source, tracking):
    owner = 'Lo16;'
    signature = 'c(Ljava/net/URL;Ljava/lang/String;)Ljava/net/HttpURLConnection;'
    body = source.body(owner, signature)
    local = int(re.search(r'\.locals (\d+)', body)[1])
    program = canonical(body).program
    program.instructions = [absolute_registers(line, local) for line in program.instructions]
    context = Reference({}, 'Landroid/content/Context;')
    provider = Reference({}, 'Lllc;')
    receiver = Reference({owner + '->a:Landroid/content/Context;': context,
                          owner + '->b:Lllc;': provider}, owner)
    connection = Reference({}, 'Ljava/net/HttpURLConnection;')
    headers, settings = {}, {}
    def invoke(target, values):
        if target == 'Ljava/net/URL;->openConnection()Ljava/net/URLConnection;':
            return connection
        if target.endswith('->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V'):
            assert values[0] is connection
            headers[values[1]] = values[2]
            return None
        if target.startswith('Ljava/net/') and any(name in target for name in
                ['->setConnectTimeout(', '->setReadTimeout(', '->setUseCaches(']):
            settings[target.split('->')[1].split('(')[0]] = values[1]
            return None
        if target == 'Landroid/content/Context;->getPackageName()Ljava/lang/String;':
            assert values[0] is context
            return 'be.tweedehands.m'
        if target == 'Lllc;->get()Ljava/lang/Object;':
            assert not tracking, 'Firebase heartbeat provider still resolved'
            return None
        if 'AndroidUtilsLight;->getPackageCertificateHashBytes' in target:
            return Reference(b'resigned-fixture-certificate')
        if 'Hex;->bytesToStringUppercase' in target:
            return 'RESIGNED_FIXTURE_FINGERPRINT'
        raise AssertionError('Unexpected Firebase request-builder effect: ' + target)
    frame = {'v' + str(local): receiver, 'v' + str(local + 1): Reference({}),
             'v' + str(local + 2): 'fixture-api-key'}
    result = execute(program, frame, invoke, memory=Memory())
    assert result is connection
    assert headers['X-Android-Package'] == 'be.tweedehands.m'
    assert headers['X-Android-Cert'] == PUBLISHER_SHA1, 'Re-signing breaks functional Firebase registration'
    assert headers['x-goog-api-key'] == 'fixture-api-key'
    assert 'x-firebase-client' not in headers
    assert settings == {'setConnectTimeout': 10000, 'setReadTimeout': 10000, 'setUseCaches': 0}


def verify_paid_items(source):
    item = 'Lcom/horizon/android/core/datamodel/search/SearchResultItem;'
    enum = 'Lcom/horizon/android/core/datamodel/search/SearchResultItemType;'
    owner = 'Lcom/horizon/android/feature/search/search/model/FlexibleSearchResponse;'
    signature = 'morpheAdSlots(Ljava/util/List;)Ljava/util/List;'
    body = source.body(owner, signature)
    local = int(re.search(r'\.locals (\d+)', body)[1])
    program = canonical(body).program
    program.instructions = [absolute_registers(line, local) for line in program.instructions]
    names = ['DEFAULT_LISTING', 'SELLER_HEADER_INFORMATION', 'SIMILAR_ITEMS', 'FOOTER', 'DISCLAIMER',
             'DAC7_BANNER', 'KNN_INFO_BOX'] + sorted(AD_TYPES)
    kinds = {name: Reference(name, enum) for name in names}
    memory = Memory(statics={enum + '->' + name + ':' + enum: value for name, value in kinds.items()})
    def invoke(target, values):
        obj = values[0]
        if target == 'Ljava/util/ArrayList;-><init>()V':
            obj.value = []
        elif target in {'Ljava/util/List;->iterator()Ljava/util/Iterator;',
                        'Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;'}:
            return Reference({'items': obj.value, 'position': 0})
        elif target == 'Ljava/util/Iterator;->hasNext()Z':
            return obj.value['position'] < len(obj.value['items'])
        elif target == 'Ljava/util/Iterator;->next()Ljava/lang/Object;':
            value = obj.value['items'][obj.value['position']]
            obj.value['position'] += 1
            return value
        elif target == 'Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z':
            obj.value.append(values[1])
            return True
        elif target in {'Ljava/util/List;->size()I', 'Ljava/util/ArrayList;->size()I'}:
            return len(obj.value)
        elif target == item + '->getItemType()' + enum:
            return obj.value['type']
        elif target == item + '->getListing()Lcom/horizon/android/core/datamodel/CapiAd;':
            return obj.value['listing']
        elif target == 'Lcom/horizon/android/core/datamodel/CapiAd;->isAdmarktAd()Z':
            return obj.value['admarkt']
        elif target == 'Lcom/horizon/android/core/datamodel/CapiAd;->getRankingLabel()Lcom/horizon/android/core/datamodel/RankingLabel;':
            return obj.value['rank']
        else:
            raise AssertionError('Unexpected listing-filter effect: ' + target)
    def run(value):
        return execute(program, {'v' + str(local): value}, invoke, memory=memory)
    assert run(None) is None
    unknown = Reference({}, 'Lfixture/Unknown;')
    for name in [None] + names:
        for rank, admarkt in [(None, False), (None, True), (Reference('TOPADVERTENTIE'), False),
                              (Reference('DAGTOPPER'), False)]:
            listing = Reference({'rank': rank, 'admarkt': admarkt}, 'Lcom/horizon/android/core/datamodel/CapiAd;')
            row = Reference({'type': kinds.get(name), 'listing': listing}, item)
            original = Reference([unknown, row, None])
            result = run(original)
            removed = name in AD_TYPES or rank is not None or admarkt
            assert result.value == ([unknown, None] if removed else original.value), (name, rank, result.value)
            assert original.value == [unknown, row, None], 'Source listing list mutated'
            if not removed:
                assert result is original, 'Unchanged listing list identity lost'


def verify_manifest(root, selected):
    from verify_marktplaats import TRACKING_FLAGS, TRACKING_PROVIDERS, TRACKING_RECEIVERS
    manifest = ET.parse(root / 'AndroidManifest.xml').getroot()
    assert manifest.get('package') == 'be.tweedehands.m'
    app = manifest.find('application')
    if selected & {'Disable tracking', 'Skip consent screens'}:
        existing = {'google_analytics_automatic_screen_reporting_enabled',
                    'firebase_crashlytics_collection_enabled', 'com.facebook.sdk.AutoLogAppEventsEnabled',
                    'com.facebook.sdk.AdvertiserIDCollectionEnabled'}
        for name, expected in TRACKING_FLAGS.items():
            nodes = [node for node in app if node.tag == 'meta-data' and node.get(A + 'name') == name]
            assert len(nodes) == 1 and nodes[0].attrib == {A + 'name': name, A + 'value': expected}
            if name not in existing:
                app.remove(nodes[0])
        receivers = set(TRACKING_RECEIVERS) | {'com.google.android.gms.analytics.CampaignTrackingReceiver'}
        for tag, names in [('provider', TRACKING_PROVIDERS), ('receiver', receivers)]:
            for name in names:
                nodes = [node for node in app if node.tag == tag and node.get(A + 'name') == name]
                assert len(nodes) == 1 and nodes[0].get(A + 'enabled') == 'false'
                del nodes[0].attrib[A + 'enabled']
        for index, attributes in DATA['tracking_permissions']:
            assert not any(node.tag == 'uses-permission' and node.get(A + 'name') == attributes[A + 'name']
                           for node in manifest), 'Advertising permission remains'
            manifest.insert(index, ET.Element('uses-permission', attributes))
    if selected:
        nodes = [node for node in app if node.tag == 'meta-data' and
                 node.get(A + 'name') == 'com.android.dynamic.apk.fused.modules']
        assert len(nodes) == 1 and nodes[0].get(A + 'value') == 'alertscentercompose'
        app.remove(nodes[0])
        for name, value in DATA['packaging']['attributes'].items():
            assert name not in manifest.attrib
            manifest.set(name, value)
        for index, attributes in DATA['packaging']['metadata']:
            assert not any(node.tag == 'meta-data' and node.get(A + 'name') == attributes[A + 'name'] for node in app)
            app.insert(index, ET.Element('meta-data', attributes))
    assert xml_digest(manifest) == DATA['manifest_digest'], 'Belgian original manifest changed'


def run_without_sdk(source, owner, signature, args, expected, memory=None):
    body = source.body(owner, signature)
    local = int(re.search(r'\.locals (\d+)', body)[1])
    program = canonical(body).program
    program.instructions = [absolute_registers(line, local) for line in program.instructions]
    registers = {'v' + str(local + i): value for i, value in enumerate(args)}
    def forbidden(target, values):
        raise AssertionError('Optional SDK work remains: ' + owner + '->' + signature + ' calls ' + target)
    result = execute(program, registers, forbidden, memory=memory or Memory())
    assert result == expected, 'Incorrect private outcome: ' + owner + '->' + signature


def verify_gemius(source):
    event = 'Lcom/gemius/sdk/audience/AudienceEvent;'
    run_without_sdk(source, event, 'sendEvent()V', [Reference({}, event)], None)
    for force in (False, True):
        run_without_sdk(source, event, 'flushBuffer(Z)V', [force], None)
    config = 'Lcom/horizon/android/core/tracking/config/a;'
    run_without_sdk(source, config, 'p()Z', [Reference({}, config)], 0)
    run_without_sdk(source, 'Lcom/gemius/sdk/Config;', 'isUserTrackingEnabled()Z', [], 0)
    unit = Reference({}, 'Lkotlin/Unit;')
    memory = Memory(statics={'Lkotlin/Unit;->a:Lkotlin/Unit;': unit})
    run_without_sdk(source, 'Lcom/sourcepoint/mobile_core/Coordinator;',
                    'pvData(Lkotlinx/serialization/json/JsonObject;Ljava/util/List;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;',
                    [Reference({}), None, Reference([]), Reference({})], unit, memory)


def verify_publisher_measurement(source):
    owner = 'Lcom/horizon/android/feature/vip/usecase/b;'
    signature = 'a(Lcom/horizon/android/core/datamodel/MpAd;Ljava/lang/String;ZLj43;)Z'
    run_without_sdk(source, owner, signature,
                    [Reference({}, owner), Reference({}), 'search', True, Reference({})], 0)
    flags = 'Lcom/horizon/android/core/datamodel/AdFlags;'
    run_without_sdk(source, flags, 'getHasCallTracking()Z', [Reference({}, flags)], 0)


def verify_no_consent_render(source):
    owner = 'Lcom/sourcepoint/cmplibrary/SpConsentLibMobileCore;'
    campaign = 'Lcom/sourcepoint/cmplibrary/data/network/util/CampaignType;'
    body = source.body(owner, 'renderNextMessageIfAny()V')
    local = int(re.search(r'\.locals (\d+)', body)[1])
    program = canonical(body).program
    program.instructions = [absolute_registers(line, local) for line in program.instructions]
    for rejected in (False, True):
        events = []
        receiver = Reference({
            owner + '->morpheRejectedWithoutUi:Z': rejected,
            owner + '->pendingActions:I': 1,
            owner + '->messagesToDisplay:Lkotlin/collections/ArrayDeque;': Reference([Reference({})]),
        }, owner)
        memory = Memory(statics={campaign + '->GDPR:' + campaign: Reference({}, campaign)})
        def invoke(target, values):
            if target == 'Ljava/lang/Object;->getClass()Ljava/lang/Class;':
                if is_zero(values[0]):
                    raise VmThrown(Reference({}, 'Ljava/lang/NullPointerException;'))
                return Reference({})
            if target == 'Lkotlin/collections/ArrayDeque;->clear()V':
                values[0].value.clear()
                events.append('clear-ui-queue')
                return None
            if target == owner + '->rejectAll(' + campaign + ')V':
                events.append('native-reject')
                return None
            raise AssertionError('Consent rendering or synthetic completion remains: ' + target)
        execute(program, {'v' + str(local): receiver}, invoke, memory=memory)
        assert events == ([] if rejected else ['clear-ui-queue', 'native-reject'])
        # The real rejectAll coroutine routes asynchronous failures through
        # SDK onError. Execute its owned reset prefix, then leave the retained
        # native error cleanup/callback path at its independently hashed boundary.
        error_body = source.body(owner, 'onError(Lcom/sourcepoint/cmplibrary/exception/ConsentLibExceptionK;)V')
        error_local = int(re.search(r'\.locals (\d+)', error_body)[1])
        error_program = canonical(error_body).program
        error_program.instructions = [absolute_registers(line, error_local) for line in error_program.instructions]
        error = Reference({}, 'Lcom/sourcepoint/cmplibrary/exception/ConsentLibExceptionK;')
        execute(error_program, {'v' + str(error_local): receiver,
                               'v' + str(error_local + 1): error}, invoke, memory=memory, stop_at=(3,))
        assert receiver.value[owner + '->morpheRejectedWithoutUi:Z'] == 0, 'Failed native rejection cannot retry'
        receiver.value[owner + '->messagesToDisplay:Lkotlin/collections/ArrayDeque;'] = Reference([Reference({})])
        events.clear()
        execute(program, {'v' + str(local): receiver}, invoke, memory=memory)
        assert events == ['clear-ui-queue', 'native-reject'], 'Fresh native load did not retry genuine rejection'


def verify_consent(source):
    client, controller = 'Lhl3;', 'Lil3;'
    campaign = 'Lcom/sourcepoint/cmplibrary/data/network/util/CampaignType;'
    library = 'Lcom/sourcepoint/cmplibrary/SpConsentLib;'
    for manual in (False, True):
        for available in (False, True):
            for rejected in (False, True):
                events = []
                sdk = Reference({}, library) if available else None
                live = Reference({}, 'Loff;')
                manager = Reference({controller + '->h:' + library: sdk,
                                     controller + '->i:Loff;': live}, controller)
                receiver = Reference({client + '->d:' + controller: manager,
                                      client + '->a:Z': True,
                                      client + '->b:Z': manual,
                                      client + '->morpheRejectedConsent:Z': rejected}, client)
                memory = Memory(statics={
                    campaign + '->GDPR:' + campaign: Reference({}, campaign),
                    'Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;': Reference(True),
                })
                def run(owner, signature, values, stop_at=()):
                    body = source.body(owner, signature)
                    local = int(re.search(r'\.locals (\d+)', body)[1])
                    program = canonical(body).program
                    program.instructions = [absolute_registers(line, local) for line in program.instructions]
                    frame = {'v' + str(local + i): value for i, value in enumerate(values)}
                    return execute(program, frame, invoke, memory=memory, stop_at=stop_at)
                def invoke(target, values):
                    if target == 'Ljava/lang/Object;->getClass()Ljava/lang/Class;':
                        if is_zero(values[0]):
                            raise VmThrown(Reference({}, 'Ljava/lang/NullPointerException;'))
                        return Reference({}, 'Ljava/lang/Class;')
                    if target == client + '->onUIFinished(Landroid/view/View;)V':
                        return run(client, 'onUIFinished(Landroid/view/View;)V', values)
                    if target == library + '->rejectAll(' + campaign + ')V':
                        assert values[0] is sdk
                        events.append('reject')
                        return None
                    if target == library + '->removeView(Landroid/view/View;)V':
                        events.append('remove')
                        return None
                    if target == 'Loff;->k(Ljava/lang/Object;)V':
                        assert values[0] is live and values[1].value is True
                        events.append('closed')
                        return None
                    raise AssertionError('Consent UI/measurement work remains: ' + target)
                view = Reference({}, 'Landroid/view/View;')
                run(client, 'onUIReady(Landroid/view/View;)V', [receiver, view])
                expected = (['reject'] if available and not rejected else [])
                expected += (['remove'] if available else []) + ['closed']
                assert events == expected, (manual, available, rejected, events)
                assert receiver.value[client + '->a:Z'] == 0
                events.clear()
                run(client, 'onUIReady(Landroid/view/View;)V', [receiver, view])
                assert events == (['remove'] if available else []) + ['closed']
                try:
                    run(client, 'onUIReady(Landroid/view/View;)V', [receiver, None])
                except VmThrown as error:
                    assert error.value.descriptor == 'Ljava/lang/NullPointerException;'
                else:
                    raise AssertionError('Native null-view validation lost')
                if available:
                    # Test the defensive app callback path after a real error,
                    # without treating a failed asynchronous request as success.
                    run(client, 'onError(Ljava/lang/Throwable;)V',
                        [receiver, Reference({}, 'Ljava/lang/Throwable;')], stop_at=(3,))
                    assert receiver.value[client + '->morpheRejectedConsent:Z'] == 0
                    events.clear()
                    run(client, 'onUIReady(Landroid/view/View;)V', [receiver, view])
                    assert events == ['reject', 'remove', 'closed']


def verify(root, selected, apk):
    assert apk.is_file(), 'Provide the actual original or rebuilt APK'
    assert selected <= {'Hide ads', 'Disable tracking', 'Disable ThreatMetrix', 'Skip consent screens'}
    source = Smali(root)
    verify_manifest(root, selected)
    metadata = (root / 'apktool.yml').read_text()
    for name, expected in [('versionName', '16.19.0'), ('versionCode', '633464'),
                           ('minSdkVersion', '32'), ('targetSdkVersion', '37')]:
        values = re.findall(r'^  ' + name + r": ['\"]?([^'\"\s]+)['\"]?\s*$", metadata, re.M)
        assert values == [expected], 'Unaudited 2dehands build: ' + name
    if not selected:
        assert hashlib.sha256(apk.read_bytes()).hexdigest() == DATA['base_sha256'], 'Original Belgian APK changed'
    edits = defaultdict(list)
    for edit in selected_edits(selected):
        edits[edit['owner'], edit['signature']].append(edit)
    declarations = DexDeclarations.from_apk(apk)
    sdk, sdk_archive = sdk_classes()
    for owner, signature, local, count, digest in DATA['contracts']:
        body = source.body(owner, signature)
        assert int(re.search(r'\.locals (\d+)', body)[1]) == local, 'Original register ABI changed'
        value = canonical(body)
        if (owner, signature) in edits:
            value = restore_edits(value, edits[owner, signature], local)
            value = restore_alignment(value, count)
        assert len(value.code) == count and value.digest() == digest, 'Belgian retained graph changed: ' + owner + '->' + signature
    hidden = bool(selected & {'Hide ads', 'Disable tracking', 'Skip consent screens'})
    tracking = bool(selected & {'Disable tracking', 'Skip consent screens'})
    if selected:
        verify_firebase_headers(source, tracking)
    if hidden:
        verify_paid_items(source)
    helpers = [row for row in DATA['helpers'] if
               (tracking if row[1].startswith('morpheMeasurementBatch') else hidden)]
    expected_helpers = {(row[0], row[1]) for row in helpers}
    actual_helpers = {(owner, signature) for owner, cls in declarations.classes.items()
                      for signature in cls.methods if signature.startswith('morphe')}
    assert actual_helpers == expected_helpers, 'Unexpected or missing Belgian helper'
    for owner, signature, flags, local, count, digest in helpers:
        assert declarations.classes[owner].methods[signature].access_flags == flags
        body = source.body(owner, signature)
        assert int(re.search(r'\.locals (\d+)', body)[1]) == local
        value = canonical(body)
        assert len(value.code) == count and value.digest() == digest, 'Belgian helper graph changed: ' + signature
        audit_fields(source, declarations, body)
        for instruction in value.code:
            if instruction.startswith('invoke-'):
                audit_call(instruction, owner, declarations, sdk)
    for (owner, signature), modifications in edits.items():
        for edit in modifications:
            for instruction in edit['replacement']:
                if instruction.startswith('invoke-'):
                    audit_call(instruction, owner, declarations, sdk)
    sdk_archive.close()
    if selected:
        for original in DATA['feature']:
            actual = declarations.classes[original['name']]
            assert (actual.access_flags, actual.superclass, list(actual.interfaces)) == (
                original['flags'], original['superclass'], original['interfaces'])
            assert {key: value.access_flags for key, value in actual.methods.items()} == original['methods']
        with zipfile.ZipFile(apk) as archive:
            libraries = {name: hashlib.sha256(archive.read(name)).hexdigest()
                         for name in archive.namelist() if name.startswith('lib/') and name.endswith('.so')}
        assert libraries == DATA['libraries'], 'Belgian native library inventory changed'
    if 'Disable tracking' in selected or 'Skip consent screens' in selected:
        verify_gemius(source)
        verify_publisher_measurement(source)
    if 'Skip consent screens' in selected:
        verify_consent(source)
        verify_no_consent_render(source)
    print('PASS 2dehands retained graphs, helper ABI, module/libraries and bounded effects: ' +
          (', '.join(sorted(selected)) or 'original'))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('root', type=Path)
    parser.add_argument('--apk', required=True, type=Path)
    parser.add_argument('-e', '--enable', action='append', default=[])
    args = parser.parse_args()
    verify(args.root, set(args.enable), args.apk)


if __name__ == '__main__':
    main()
