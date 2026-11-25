"""Execute West's consent boundaries and retained manual paths from actual smali."""
import argparse
import hashlib
import json
from pathlib import Path
import xml.etree.ElementTree as ET

from brabant_smali import canonical
from brabant_vm import Fixture
from dex_declarations import DexDeclarations
from rtl_vm import Reference
from verify_dumpert import Smali
from verify_parool import sdk_classes
from west_consent_contracts import CONSENT_CONTRACTS
from west_consent_edits import (HOME, ARTICLE, NEXT, SCROLL, COMPOSE_CLICK,
                               XML_CLICK, COMPOSE_MENU, PAGES, PLAYER)


class ConsentFixture(Fixture):
    def __init__(self, *args):
        super().__init__(*args)
        self.rows = {r[:2]: r for r in CONSENT_CONTRACTS}
        self.required = True
        self.permission = -1
        self.notifications = True
        self.context = Reference({}, 'Landroid/content/Context;')
        self.manager = Reference({}, 'Landroid/app/NotificationManager;')
        self.statics['Lnl/stichtingrpo/news/onboarding/OnboardingActivity;->M:I'] = 0

    def invoke(self, target, args):
        owner, signature = target.split('->', 1)
        if target == 'Lj51;->a(Landroid/content/Context;)Z':
            self.events.append(('read-consent-required', self.required))
            return int(self.required)
        if target == 'Lty2;->c()Ljava/lang/Object;':
            self.events.append(('completion', args[0].descriptor))
            if args[0].descriptor in {'Ldn;', 'Lva5;'}:
                return self.run(args[0].descriptor, signature, args)[0]
            return Reference({}, 'Le88;')
        if target == 'Ln90;->y(Lty2;)V':
            self.events.append(('automatic-notification-presenter', args[1]))
            return None
        if target == 'Lnb1;->b(Lzv0;ZLty2;)V':
            self.events.append(('cookie-presenter', args[2], args[3]))
            return None
        if target == 'Lpf;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lra1;I)V':
            self.defaults(args[0])
            self.events.append(('native-consent-observer', args[4]))
            return None
        if target == 'Lzq;->r(Lwc1;Lnc1;Lzc1;Ljz2;I)Lqh7;':
            self.events.append(('scheduled-consent-observer',))
            return Reference({}, 'Lqh7;')
        if target == 'Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V':
            args[0].value['class'] = args[2].value
            return None
        if target == 'Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;':
            args[0].value[args[1]] = args[2]
            return args[0]
        if target == 'Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;':
            args[0].value['flags'] = args[1]
            return args[0]
        if target in {'Landroid/content/Context;->startActivity(Landroid/content/Intent;)V',
                      'Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V'}:
            self.events.append(('native-cookie-activity', dict(args[1].value)))
            return None
        if target == 'Landroid/app/Activity;->overridePendingTransition(II)V':
            return None
        if target == 'Lg94;->i(Ljava/lang/Object;)V':
            args[0].value['published'] = args[1]
            self.events.append(('onboarding-native-ready', args[1]))
            return None
        if target == 'Ljw7;->e(Ljava/lang/String;[Ljava/lang/Object;)V':
            self.events.append(('native-log', args[1]))
            return None
        if target == 'Lzv2;->o()Lsw2;':
            return Reference({}, 'Lsw2;')
        if owner == 'Ljava/util/ArrayList;' and signature == '<init>()V':
            args[0].value = []
            return None
        if target == 'Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z':
            args[0].value.append(args[1])
            return 1
        if owner in {'Lt57;', 'Ldn;', 'Lec5;'} and signature.startswith('<init>('):
            self.defaults(args[0])
            if owner == 'Lt57;':
                args[0].value['Lt57;->a:I'] = args[2]
                args[0].value['Lt57;->b:Lnl/stichtingrpo/news/settings/SettingsOverviewComposeFragment;'] = args[1]
            elif owner == 'Ldn;':
                args[0].value['Ldn;->a:I'] = args[2]
                args[0].value['Ldn;->b:Ljava/lang/Object;'] = args[1]
            return None
        if target == 'Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;':
            return Reference(args[0], 'Ljava/lang/Integer;')
        if target == 'Lo37;->C(ILm21;)Ljava/lang/String;':
            return 'privacy-title' if args[0] == 0x7f14017c else str(args[0])
        if target == 'Lm21;->i(Ljava/lang/Object;)Z':
            return 1
        if target == 'Lm21;->H()Ljava/lang/Object;':
            return Reference({}, 'Ljava/lang/Object;')
        if target == 'Lm21;->b0(Ljava/lang/Object;)V':
            self.events.append(('compose-remember', args[1]))
            return None
        if target.endswith('->l0(Ljava/lang/Integer;Ljava/lang/String;Lty2;Lev7;Ll05;Lm21;II)V'):
            self.events.append(('compose-row', args[2]))
            return None
        if target == 'Ln80;->g(ILm21;)J':
            return 0
        if target == 'Lnc8;->a(Ll05;JFLm21;I)V':
            self.events.append(('compose-divider',))
            return None
        if target == 'Lv70;->getActivity$bbnativeplayersdk_kotlin_release()Lzv2;':
            return Reference({}, 'Lzv2;')
        if target == 'Lv70;->l(Ljava/lang/String;Ljava/util/Map;)V':
            self.events.append(('player-native-ready', args[1], args[2]))
            return None
        if target == 'Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;':
            assert args[1] == 'notification'
            return self.manager
        if target == 'Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I':
            assert args[1] == 'android.permission.POST_NOTIFICATIONS'
            return self.permission
        if target == 'Landroid/app/NotificationManager;->areNotificationsEnabled()Z':
            return int(self.notifications)
        if target == 'Landroid/app/Activity;->requestPermissions([Ljava/lang/String;I)V':
            self.events.append(('manual-os-request', args[1].value, args[2]))
            return None
        if target in {'Ljava/lang/String;->equals(Ljava/lang/Object;)Z',
                      'Ljava/lang/Object;->equals(Ljava/lang/Object;)Z'}:
            return int(args[0] == args[1])
        if target == 'Lui8;->a(Lsi8;)Lzv0;':
            return Reference({}, 'Lzv0;')
        return super().invoke(target, args)


def verify_consent(source, declarations, sdk_read, enabled):
    f = ConsentFixture(source, declarations, sdk_read)
    # Both fresh and retained native decisions are consumed only at automatic
    # callers. The shared presenter and actual vendor state remain untouched.
    for required in (True, False):
        f.required = required
        for key, start, stops, registers in [
            (HOME, 35, (38, 47), {'v1': f.context}),
            (ARTICLE, 101, (104, 113), {'v6': f.context}),
        ]:
            f.events.clear()
            reached, _ = f.run(*key, start=start, stop_at=stops, registers=registers)
            assert reached == stops[1 if enabled or not required else 0], 'West automatic cookie decision was not bypassed'
            assert f.events == [('read-consent-required', required)]

    # The real dn27 callback publishes the original onboarding completion event.
    flow = f.new('Lq60;')
    vm = f.new('Lxi5;', {'Lxi5;->a0:Lq60;': flow})
    callback = f.new('Ldn;', {'Ldn;->a:I': 27, 'Ldn;->b:Ljava/lang/Object;': vm})
    f.events.clear()
    f.run(*NEXT, start=225, stop_at=(226,), registers={
        'v1': f.new('Lnb1;'), 'v2': Reference({}, 'Lzv0;'), 'v5': 0, 'v3': callback})
    assert len([e for e in f.events if e[0] == 'onboarding-native-ready']) == int(enabled), 'West onboarding continuation did not complete exactly once'
    assert len([e for e in f.events if e[0] == 'cookie-presenter']) == int(not enabled)

    for key, start, stop, register, discriminator in [(NEXT, 211, 212, 'v1', 14), (SCROLL, 105, 106, 'p1', 15)]:
        f.events.clear()
        cb = f.new('Lva5;', {'Lva5;->a:I': discriminator})
        f.run(*key, start=start, stop_at=(stop,), registers={'v0': f.new('Ln90;'), register: cb})
        assert len([e for e in f.events if e[0] == 'automatic-notification-presenter']) == int(not enabled), 'West onboarding still requests notifications'
        assert len([e for e in f.events if e[0] == 'completion']) == int(enabled), 'West native no-prompt completion changed'

    for repeat in (False, True):
        for language in (False, True):
            for interests in (False, True):
                adapter = f.new('Lzi5;')
                f.run(*PAGES, start=4, registers={'p0': adapter, 'p2': repeat, 'p3': language, 'p4': interests})
                pages = adapter.value['Lzi5;->m:Ljava/util/ArrayList;'].value
                expected = (['c'] if interests else []) if enabled else ((['a'] if not repeat and language else []) + (['b'] if not repeat else []) + (['c'] if interests else []) + ['d'] + (['e'] if not repeat else []))
                assert pages == [f.statics['Lyi5;->'+s+':Lyi5;'] for s in expected], 'West startup must contain only region selection'

    f.events.clear()
    f.run(*COMPOSE_MENU, start=308, stop_at=(337,), registers={
        'v0': f.new('Lm21;'), 'v13': f.new('Lnl/stichtingrpo/news/settings/SettingsOverviewComposeFragment;'),
        'v5': Reference({}, 'Ljava/lang/Object;'), 'v6': 0x7f060033,
        'v17': Reference({}, 'Lev7;')})
    assert len([e for e in f.events if e[0] == 'compose-row']) == int(not enabled), 'West Compose cookie row still composed'
    assert len([e for e in f.events if e[0] == 'compose-divider']) == int(not enabled), 'West Compose cookie divider remains'
    if enabled:
        for key, index, registers in [(COMPOSE_CLICK, 63, {'v2': Reference({}, 'Le88;')}), (XML_CLICK, 48, {})]:
            f.events.clear()
            f.run(*key, start=index, registers=registers)
            assert not f.events, 'West hidden cookie click still presents a dialog'

    # The player is already initialized before CMP. Select its actual l/return
    # continuation rather than fabricating consent or returning before readiness.
    player = f.new('Lv70;', {'Lv70;->x1:Lqt9;': f.new('Lqt9;'), 'Lv70;->D1:Z': 1})
    options = Reference({}, 'Ljava/util/LinkedHashMap;')
    f.events.clear()
    f.run(*PLAYER, (player, 'original-clip', options), start=423, stop_at=(430, 469))
    ready = [e for e in f.events if e[0] == 'player-native-ready']
    assert len(ready) == int(enabled), 'West player CMP bypass lost native readiness'
    if ready:
        assert ready[0][1:] == ('original-clip', options)

    # Manual embed/privacy actions still get the native observer and settings
    # activity. The test stops at Android scheduling and does not invent choices.
    for activity_context in (False, True):
        for settings in (False, True):
            context = Reference({}, 'Landroid/app/Activity;' if activity_context else 'Landroid/content/Context;')
            bp = f.new('Lbp1;', {'Lbp1;->d:Lfs1;': Reference({}, 'Lfs1;')})
            presenter = f.new('Lnb1;', {'Lnb1;->a:Landroid/content/Context;': context, 'Lnb1;->b:Lbp1;': bp})
            f.events.clear()
            f.run('Lnb1;', 'b(Lzv0;ZLty2;)V', (presenter, Reference({}, 'Lzv0;'), settings, callback))
            assert [e[0] for e in f.events] == ['native-consent-observer', 'scheduled-consent-observer', 'native-cookie-activity'], 'West manual privacy presentation changed'
            expected_class = 'Lnl/groei/consent/activities/GcwSettingsActivity;' if settings else 'Lnl/groei/consent/activities/GcwChoiceListActivity;'
            assert f.events[-1][1]['class'] == expected_class
            assert not activity_context or 'flags' not in f.events[-1][1]

    # The real shared permission helper still reaches Android for a manual call.
    for sdk in (32, 33, 36):
        f.statics.update({'Lci0;->a:I': 0, 'Landroid/os/Build$VERSION;->SDK_INT:I': sdk,
                          'Landroid/os/Build$VERSION;->CODENAME:Ljava/lang/String;': 'REL'})
        cb = f.new('Lva5;', {'Lva5;->a:I': 14})
        f.events.clear()
        f.run('Ln90;', 'y(Lty2;)V', (f.new('Ln90;'), cb))
        requests = [e for e in f.events if e[0] == 'manual-os-request']
        assert len(requests) == int(sdk >= 33), 'West manual OS notification request was disabled'
        if requests:
            assert requests[0][1:] == (['android.permission.POST_NOTIFICATIONS'], 1200)


def layout_digest(node):
    def tree(n):
        return n.tag, sorted(n.attrib.items()), (n.text or '').strip(), [tree(c) for c in n]
    return hashlib.sha256(json.dumps(tree(node), separators=(',', ':')).encode()).hexdigest()


LAYOUT_SHA256 = '9c87784f26711ff06419f339c7e64fc1a465578ea09d0be436bdc0e182146a33'


def verify_resources(root, enabled):
    paths = list((root / 'res').glob('layout*/fragment_settings_overview.xml'))
    assert len(paths) == 1, 'West settings layout variants changed'
    layout = ET.parse(paths[0]).getroot()
    a = '{http://schemas.android.com/apk/res/android}'
    children = list(layout)
    indexes = [i for i, n in enumerate(children) if n.get(a+'id') == '@id/privacy_item']
    assert len(indexes) == 1, 'West privacy row identity changed'
    index = indexes[0]
    row, divider = children[index:index+2]
    assert divider.tag == 'include' and divider.get('layout') == '@layout/divider_settings'
    assert any(n.get(a+'text') == '@string/Settings_Privacy_Title' for n in row.iter())
    for node in (row, divider):
        assert node.get(a+'visibility') == ('gone' if enabled else None), 'West XML cookie row/divider still visible on first draw'
        node.attrib.pop(a+'visibility', None)
    assert layout_digest(layout) == LAYOUT_SHA256, 'West unrelated settings resource changed'


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('root', type=Path)
    parser.add_argument('--apk', type=Path, required=True)
    parser.add_argument('--enabled', action='store_true')
    args = parser.parse_args()
    source = Smali(args.root)
    declarations = DexDeclarations.from_apk(args.apk)
    sdk_read, archive = sdk_classes()
    try:
        verify_consent(source, declarations, sdk_read, args.enabled)
        verify_resources(args.root, args.enabled)
    finally:
        archive.close()
    print('PASS West consent fixtures:', 'enabled' if args.enabled else 'original')
