"""Independent decoded-output contracts for the supplied Videoland TV build."""
import argparse
import copy
import json
import hashlib
from pathlib import Path
import re
import xml.etree.ElementTree as ET

from atv_smali import graph, methods, classes

CONTRACTS = json.loads(Path(__file__).with_name('videoland_atv_contracts.json').read_text())
SUBSCRIPTION_CONTRACTS = json.loads(Path(__file__).with_name('videoland_subscription_contracts.json').read_text())
UNAVAILABLE_CONTRACTS = json.loads(Path(__file__).with_name('videoland_unavailable_contracts.json').read_text())
SUBSCRIPTION = 'Lcom/bedrockstreaming/component/layout/domain/core/model/Target$Lock$RequireSubscriptionLock;'
TARGET = 'Lcom/bedrockstreaming/component/layout/domain/core/model/Target;'
CONFIG_KEYS = ('activateTealium', 'playerNPAWv7Enabled', 'playerSnowplowMediaTrackingEnabled')
A = '{http://schemas.android.com/apk/res/android}'
FLAGS = {
    'firebase_analytics_collection_deactivated': 'true',
    'firebase_analytics_collection_enabled': 'false',
    'google_analytics_adid_collection_enabled': 'false',
    'firebase_crashlytics_collection_enabled': 'false',
    'firebase_performance_collection_deactivated': 'true',
    'firebase_sessions_enabled': 'false',
    'delivery_metrics_exported_to_big_query_enabled': 'false',
    'com.facebook.sdk.AutoLogAppEventsEnabled': 'false',
    'com.facebook.sdk.AdvertiserIDCollectionEnabled': 'false',
}
AD_PERMISSIONS = {
    'com.google.android.gms.permission.AD_ID', 'android.permission.ACCESS_ADSERVICES_AD_ID',
    'android.permission.ACCESS_ADSERVICES_ATTRIBUTION', 'android.permission.ACCESS_ADSERVICES_TOPICS',
    'android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE',
}
MERGE_METADATA = {'com.android.stamp.source', 'com.android.stamp.type',
                  'com.android.vending.splits.required', 'com.android.vending.splits',
                  'com.android.vending.derived.apk.id'}


def digest(node):
    return node.tag, tuple(sorted(node.attrib.items())), tuple(digest(child) for child in node)


def verify_manifest(before, after, tracking):
    expected = copy.deepcopy(before)
    # Morphe's APKS merger removes exactly these original distribution/split fields.
    for name in ('requiredSplitTypes', 'splitTypes'):
        expected.attrib.pop(A + name)
    app = expected.find('application')
    metadata = {n.get(A + 'name'): n for n in app.findall('meta-data')}
    assert MERGE_METADATA <= metadata.keys(), 'Stock split metadata changed'
    for name in MERGE_METADATA:
        app.remove(metadata[name])
    if tracking:
        permissions = [n for n in expected.findall('uses-permission') if n.get(A + 'name') in AD_PERMISSIONS]
        assert len(permissions) == 5, 'Stock advertising permission inventory changed'
        for node in permissions:
            expected.remove(node)
        providers = [n for n in app.findall('provider') if n.get(A + 'name') ==
                     'com.newrelic.agent.android.rum.contentprovider.NewRelicAppContentProvider']
        assert len(providers) == 1
        app.remove(providers[0])
        for name, value in FLAGS.items():
            if name not in metadata:
                metadata[name] = ET.SubElement(app, 'meta-data', {A + 'name': name})
            metadata[name].set(A + 'value', value)
    assert digest(after) == digest(expected), 'Manifest changed outside owned merge/privacy edits'


def config_code():
    lines = []
    for key in CONFIG_KEYS:
        lines += [f'const-string v0, "{key}"',
                  'invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z',
                  'move-result v0', f'if-nez v0, :disabled']
    return '\n'.join(lines + ['goto :original', ':disabled', 'const/4 v0, 0x0',
                              'return v0', ':original', 'nop'])


def remove_insertion(rows, start, count):
    """Rebase all branch/catch targets after removing a known contiguous insertion."""
    result = rows[:start] + rows[start + count:]
    def target(match):
        value = int(match[1])
        assert not start <= value < start + count, 'Original control flow enters inserted code'
        return '@' + str(value - (count if value >= start + count else 0))
    return [''.join(part if index % 2 else re.sub(r'@(\d+)', target, part)
                    for index, part in enumerate(re.split(r'("(?:\\.|[^"\\])*")', row)))
            for row in result]


def subscription_effect(original, contract):
    """Independently specify only the permitted routing additions and destinations."""
    start = contract['insertion'] + 1  # graph includes the register declaration
    if contract['insertion'] == 0:
        code = f"""instance-of v0, p1, {SUBSCRIPTION}
if-eqz v0, :original
move-object v0, p1
check-cast v0, {SUBSCRIPTION}
invoke-virtual {{v0}}, {SUBSCRIPTION}->b(){TARGET}
move-result-object v0
if-eqz v0, :original
instance-of v2, v0, {SUBSCRIPTION}
if-nez v2, :original
move-object p1, v0
:original
nop"""
        effect = graph(code)[:-1]
        effect = [re.sub(r'@(\d+)', lambda m: '@' + str(int(m[1]) + start), row) for row in effect]
    else:
        # hasNext is executable instruction 107 (graph row 108).
        effect = [f'instance-of v6, v15, {SUBSCRIPTION}', 'if-nez v6, @108']
    shifted = [re.sub(r'@(\d+)', lambda m: '@' + str(int(m[1]) + (len(effect) if int(m[1]) >= start else 0)), row)
               for row in original]
    return shifted[:start] + effect + shifted[start:]



COVER_ACTION_RESET = """if-eqz p1, :hideCover
invoke-static {p1}, LWu/I;->G(Ljava/util/List;)Ljava/lang/Object;
move-result-object v0
if-eqz v0, :hideCover
instance-of v1, v0, Lkn/f$e;
if-eqz v1, :originalCover
iget-object v0, p0, LEo/a;->b:Lcom/bedrockstreaming/tornado/tv/molecule/CoverView;
invoke-virtual {v0}, Lcom/bedrockstreaming/tornado/tv/molecule/CoverView;->getButtonView()Lcom/bedrockstreaming/tornado/compose/molecule/button/TornadoButton;
move-result-object v0
const/4 v1, 0x0
invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
goto :originalCover
:hideCover
iget-object v0, p0, LEo/a;->b:Lcom/bedrockstreaming/tornado/tv/molecule/CoverView;
const/4 v1, 0x0
invoke-virtual {v0, v1}, Lcom/bedrockstreaming/tornado/tv/molecule/CoverView;->setButtonText(Ljava/lang/String;)V
invoke-virtual {v0}, Lcom/bedrockstreaming/tornado/tv/molecule/CoverView;->getButtonView()Lcom/bedrockstreaming/tornado/compose/molecule/button/TornadoButton;
move-result-object v0
const/16 v1, 0x8
invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
const/4 v1, 0x0
invoke-virtual {v0, v1}, Lcom/bedrockstreaming/tornado/compose/molecule/button/TornadoButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V
return-void
:originalCover
nop"""

def unavailable_effect(original, contract):
    helper = 'Lpatches/videoland/Availability;'
    block = 'Lcom/bedrockstreaming/component/layout/domain/core/model/Block;'
    kind = contract['kind']
    if kind == 'section_notification':
        effect = [f'invoke-static {{p0}}, {helper}->sectionsChanged(LNk/a$b;)Z', 'move-result v0', 'if-eqz v0, @5', 'return-void']
        shifted = [re.sub(r'@(\d+)', lambda m: '@' + str(int(m[1]) + 4), row) for row in original]
        return shifted[:1] + effect + shifted[1:]
    if kind == 'cover_action_reset':
        effect = graph(COVER_ACTION_RESET)[:-1]
        effect = [re.sub(r'@(\d+)', lambda m: '@' + str(int(m[1]) + 1), row) for row in effect]
        shifted = [re.sub(r'@(\d+)', lambda m: '@' + str(int(m[1]) + len(effect)), row) for row in original]
        return shifted[:1] + effect + shifted[1:]
    if kind == 'subscription_action':
        code = f"""invoke-static {{p0}}, {helper}->hideAction(Lcom/bedrockstreaming/component/layout/domain/core/model/Action;)Z
move-result v0
if-eqz v0, :original
const/4 v0, 0x0
return-object v0
:original
nop"""
        effect = graph(code)[:-1]
        effect = [re.sub(r'@(\d+)', lambda m: '@' + str(int(m[1]) + 1), row) for row in effect]
        shifted = [re.sub(r'@(\d+)', lambda m: '@' + str(int(m[1]) + len(effect)), row) for row in original]
        return shifted[:1] + effect + shifted[1:]
    if kind == 'compose_empty':
        start = contract['insertion'] + 1
        effect = [f"invoke-static {{v{contract['block_register']}, v{contract['paging_register']}}}, {helper}->hideEmpty({block}Lx4/c;)Z",
                  f"move-result v{contract['scratch_register']}",
                  f"if-nez v{contract['scratch_register']}, @{contract['exit'] + 4}"]
        shifted = [re.sub(r'@(\d+)', lambda m: '@' + str(int(m[1]) + (3 if int(m[1]) >= start else 0)), row) for row in original]
        return shifted[:start] + effect + shifted[start:]
    if kind == 'legacy':
        start = 4
        code = f"""invoke-static {{p1, p2}}, {helper}->visiblePager({block}Lw4/A1;)Lw4/A1;
move-result-object p2
invoke-static {{p1, p3}}, {helper}->visibleIndex({block}I)I
move-result p3
invoke-static {{p1}}, {helper}->visibleBlock({block}){block}
move-result-object p1"""
    elif kind == 'compose':
        start = 6
        code = f"""invoke-static {{p1, p3}}, {helper}->visibleIndex({block}I)I
move-result p3
invoke-static {{p1}}, {helper}->visibleBlock({block}){block}
move-result-object p1"""
    elif kind == 'factory':
        start = original.index(contract['after']) + 1
        code = f"""invoke-static {{v2, v6}}, {helper}->visibleFactory({block}Ljv/a;)Ljv/a;
move-result-object v6"""
    else:
        assert kind == 'row'
        start = 1
        code = f"""invoke-static {{p0}}, {helper}->rowCount(LQk/t;)I
move-result v0
return v0"""
    effect = graph(code)
    shifted = [re.sub(r'@(\d+)', lambda m: '@' + str(int(m[1]) + (len(effect) if int(m[1]) >= start else 0)), row) for row in original]
    return shifted[:start] + effect + shifted[start:]


def verify_owned_helpers(after):
    owned = json.loads(Path(__file__).with_name('videoland_unavailable_helpers.json').read_text())
    actual = {key: value for key, value in after.items() if key.split('->')[0] in owned['classes']}
    assert actual.keys() == owned['methods'].keys(), 'Availability helper method inventory changed'
    for key, rows in actual.items():
        assert hashlib.sha256('\n'.join(rows).encode()).hexdigest() == owned['methods'][key], 'Availability helper effect changed: ' + key
    return actual.keys()

def verify_methods(before, after, ads, tracking, subscription=False, unavailable=False):
    selected = {c['owner'] + '->' + c['signature']: c for c in CONTRACTS
                if ads and c['selection'] == 'ads' or tracking and c['selection'] == 'tracking'}
    routing = {c['owner'] + '->' + c['signature']: c for c in SUBSCRIPTION_CONTRACTS} if subscription else {}
    assert routing.keys() <= before.keys(), 'Missing subscription method contracts'
    assert before, 'Empty original method inventory'
    assert selected.keys() <= before.keys(), 'Missing selected method contracts'
    filtering = {c['owner'] + '->' + c['signature']: c for c in UNAVAILABLE_CONTRACTS} if unavailable else {}
    assert filtering.keys() <= before.keys(), 'Missing unavailable method contracts'
    if unavailable:
        owned = verify_owned_helpers(after)
        after = {key: rows for key, rows in after.items() if key not in owned}
    assert before.keys() == after.keys(), 'Original method inventory changed'
    for key, original in before.items():
        current = after[key]
        if key in filtering:
            contract = filtering[key]
            assert hashlib.sha256('\n'.join(original).encode()).hexdigest() == contract['graph_sha256'], 'Changed original availability contract: ' + key
            assert current == unavailable_effect(original, contract), 'Incorrect availability effect or original graph changed: ' + key
            continue
        if key in routing:
            contract = routing[key]
            assert hashlib.sha256('\n'.join(original).encode()).hexdigest() == contract['graph_sha256'], 'Changed original subscription contract: ' + key
            expected = subscription_effect(original, contract) if contract['insertion'] is not None else original
            assert current == expected, 'Incorrect subscription effect or original graph changed: ' + key
            continue
        if key not in selected:
            assert original == current, 'Unrelated method changed: ' + key
            continue
        contract = selected[key]
        code = config_code() if contract['code'] == 'CONFIG' else contract['code']
        offset = original.index(contract['after']) + 1 if 'after' in contract else 1
        expected = graph(code)
        # Expected local label targets become whole-method row targets here.
        expected = [re.sub(r'@(\d+)', lambda m: '@' + str(int(m[1]) + offset), row)
                    for row in expected]
        assert current[offset:offset + len(expected)] == expected, 'Missing/incorrect effect: ' + key
        assert remove_insertion(current, offset, len(expected)) == original, 'Original tail changed: ' + key
    return len(before)



def declaration_shape(text):
    result = []
    defaults = {'false', '0x0', '0x0L', '0.0f', '0.0', 'null'}
    for line in text.splitlines():
        if not line.startswith(('.class ', '.super ', '.implements ', '.field ')):
            continue
        # DEX writers may omit explicitly encoded JVM default field values.
        if line.startswith('.field ') and ' = ' in line and line.rsplit(' = ', 1)[1] in defaults:
            line = line.rsplit(' = ', 1)[0]
        result.append(line)
    return result

def verify(original, patched, ads, tracking, subscription=False, unavailable=False):
    verify_manifest(ET.parse(Path(original) / 'AndroidManifest.xml').getroot(),
                    ET.parse(Path(patched) / 'AndroidManifest.xml').getroot(), tracking)
    old_classes, new_classes = classes(original), classes(patched)
    owned = json.loads(Path(__file__).with_name('videoland_unavailable_helpers.json').read_text()) if unavailable else {'classes': {}}
    assert set(new_classes) == set(old_classes) | set(owned['classes']), 'APK class inventory changed'
    def shape(path):
        return declaration_shape(path.read_text())
    for name, path in old_classes.items():
        assert shape(path) == shape(new_classes[name]), 'Original class declaration changed: ' + name
    for name, expected in owned['classes'].items():
        text = new_classes[name].read_text()
        shape = [line for line in text.splitlines() if line.startswith(('.class ', '.super ', '.implements ', '.field '))]
        assert shape == expected, 'Availability helper declaration changed: ' + name
    before = methods(original)
    assert len(before) == 140770, 'Incomplete or unsupported stock method inventory'
    return verify_methods(before, methods(patched), ads, tracking, subscription, unavailable)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('original')
    parser.add_argument('patched')
    parser.add_argument('--subscription', action='store_true')
    parser.add_argument('--unavailable', action='store_true')
    parser.add_argument('--ads', action='store_true')
    parser.add_argument('--tracking', action='store_true')
    parser.add_argument('--original-apks')
    parser.add_argument('--patched-apk')
    args = parser.parse_args()
    print(f'PASS: {verify(args.original, args.patched, args.ads, args.tracking, args.subscription, args.unavailable)} original Videoland TV methods and selected effects')
    if args.original_apks or args.patched_apk:
        from media_inputs import verify_payload
        assert args.original_apks and args.patched_apk
        print(f'PASS: {verify_payload(args.original_apks, args.patched_apk)} complete Videoland TV payload entries')
