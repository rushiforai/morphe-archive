"""Run native startup completion and newsletter omission from emitted West code."""
from brabant_smali import canonical
from rtl_vm import Reference, is_zero
from west_consent import ConsentFixture
from west_consent_edits import NEXT, PAGES
from west_retained_contracts import RETAINED_CONTRACTS
from west_startup_feed_contracts import STARTUP_FEED_CONTRACTS

ACTIVITY = 'Lnl/stichtingrpo/news/onboarding/OnboardingActivity;'
CONTROLLER = 'Lnl/stichtingrpo/news/base/BaseController;'
STARTUP_HELPERS = {('Lxi5;', 'morpheSaveRegions(Lxi5;)V'): 4}
REGION_KEY = 'user_setting_user_selected_topics'


class StartupFeedFixture(ConsentFixture):
    def __init__(self, *args):
        super().__init__(*args)
        self.rows.update({r[:2]: r for r in RETAINED_CONTRACTS + STARTUP_FEED_CONTRACTS})
        self.rows.update({key: (*key, 9, locals_, 0, '') for key, locals_ in STARTUP_HELPERS.items()})
        self.native.update(STARTUP_HELPERS)
        self.native.update({('Lzi5;', 'b()I'), ('Ls67;', 'm(Ljava/util/ArrayList;)V'),
                            ('Ldt0;', 'm(Ljava/lang/String;Ljava/lang/String;)V'),
                            ('Ldt0;', 'n(Ljava/lang/String;)V')})
        self.adapter = self.binding = self.vm = None
        self.activity = None
        self.preferences = {'device_settings_breaking': False, 'device_settings_sport': False,
                            'device_settings_personalized': False}

    def invoke(self, target, args):
        if target == 'Lhx;->L(Lmb5;Let5;)V':
            self.events.append(('newsletter-builder',))
            return None
        if target == ACTIVITY + '->C()V':
            self.run(ACTIVITY, 'C()V', args, stop_at=(3,))
            self.events.append(('native-home-completion',))
            return None
        if target == ACTIVITY + '->D()Lxi5;':
            return self.vm
        if target == 'Ln90;->u()Lfh8;':
            return self.binding
        if target == 'Landroidx/viewpager2/widget/ViewPager2;->getCurrentItem()I':
            return 0
        if target == 'Landroidx/viewpager2/widget/ViewPager2;->getAdapter()Lgh6;':
            return self.adapter
        if target == 'Landroidx/viewpager2/widget/ViewPager2;->setAdapter(Lgh6;)V':
            assert args[1].value['Lzi5;->m:Ljava/util/ArrayList;'].value, 'West attempted to bind an empty startup pager'
            self.events.append(('bind-pager',))
            return None
        if target == 'Lqx0;->z0(ILjava/util/List;)Ljava/lang/Object;':
            return args[1].value[args[0]]
        if target == 'Lxi5;->U(Z)Z':
            raise AssertionError('Region-only startup must not apply notification subscriptions')
        if target == 'Lg94;->d()Ljava/lang/Object;':
            return args[0].value.get('value')
        if target == 'Ljava/util/List;->isEmpty()Z':
            return int(not args[0].value)
        if target in {'Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;',
                      'Ljava/util/List;->iterator()Ljava/util/Iterator;'}:
            return Reference({'items': list(args[0].value), 'index': 0}, 'Ljava/util/Iterator;')
        if target == 'Ljava/util/Iterator;->hasNext()Z':
            return int(args[0].value['index'] < len(args[0].value['items']))
        if target == 'Ljava/util/Iterator;->next()Ljava/lang/Object;':
            state = args[0].value
            value = state['items'][state['index']]
            state['index'] += 1
            return value
        if target in {'Lsy6;->a()Lez7;', 'Lsy6;->b()Z'}:
            return self.run('Lui5;', target.split('->', 1)[1], args)[0]
        if target == 'Ljava/util/ArrayList;->isEmpty()Z':
            return int(not args[0].value)
        if target == 'Ljava/util/ArrayList;->size()I':
            return len(args[0].value)
        if target == 'Lqx0;->M0(Ljava/lang/Iterable;)Ljava/util/List;':
            return Reference(sorted(args[0].value), 'Ljava/util/ArrayList;')
        if target == 'Lqx0;->C0(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/String;Ljava/lang/String;Lvy2;I)Ljava/lang/String;':
            assert args[1:] == [',', None, None, None, 0x3e] or args[1:] == [',', 0, 0, 0, 0x3e]
            return ','.join(args[0].value)
        if target == 'Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z':
            return int(args[1] in self.preferences)
        if target == 'Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;':
            return Reference(dict(self.preferences), 'Landroid/content/SharedPreferences$Editor;')
        if target == 'Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;':
            args[0].value[args[1]] = args[2]
            return args[0]
        if target == 'Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;':
            args[0].value.pop(args[1], None)
            return args[0]
        if target == 'Landroid/content/SharedPreferences$Editor;->apply()V':
            self.preferences.clear()
            self.preferences.update(args[0].value)
            self.events.append(('preferences-applied',))
            return None
        if target == 'Lms3;->f(Ljava/lang/Object;Ljava/lang/Object;)Z':
            return int(args[0] is args[1])
        if target == 'Lg94;->i(Ljava/lang/Object;)V':
            result = super().invoke(target, args)
            if self.activity is not None and args[1].descriptor == 'Lvi5;':
                self.run('Le14;', 'b(Ljava/lang/Object;)Ljava/lang/Object;', start=518,
                         registers={'v11': self.activity, 'p1': args[1],
                                    'v10': self.statics['Le88;->a:Le88;'],
                                    'v8': self.statics['Le88;->a:Le88;']})
            return result
        return super().invoke(target, args)


def verify_startup_feed(source, declarations, sdk_read, ads, consent):
    f = StartupFeedFixture(source, declarations, sdk_read)
    if ads:
        # The false result is the controller's native absent-component contract,
        # avoiding both the newsletter model and parent-owned component spacing.
        parent = f.new('Lpo5;', {'Lpo5;->A0:Lhx;': f.new('Lhx;')})
        result, _ = f.run(CONTROLLER, 'buildComponent(Lh01;Let5;)Z', start=1464,
                          registers={'v3': parent, 'v1': f.new('Lmb5;'), 'v4': f.new('Let5;')})
        assert is_zero(result) and not f.events, 'West newsletter component still renders or owns feed space'
        # Independent direct/cached factory entry omits the header and form too.
        f.run('Lhx;', 'L(Lmb5;Let5;)V', (None, None, None))
        assert not f.events, 'West newsletter builder still creates feed models'
    if not consent:
        return

    def set_regions(rows):
        prefs = f.new('Landroid/content/SharedPreferences;')
        store = f.new('Ls67;', {'Ls67;->a:Ldt0;': f.new('Ldt0;', {
            'Ldt0;->a:Landroid/content/SharedPreferences;': prefs}), 'Ls67;->c:Ljava/lang/String;': 'old'})
        choices = None if rows is None else Reference([
            f.new('Lui5;', {'Lui5;->c:Lez7;': f.new('Lez7;', {'Lez7;->a:Ljava/lang/String;': identity}),
                           'Lui5;->d:Z': int(selected), 'Lui5;->f:Z': 0})
            for identity, selected in rows], 'Ljava/util/ArrayList;')
        f.vm = f.new('Lxi5;', {'Lxi5;->d0:Lq60;': f.new('Lq60;', {'value': choices}),
                              'Lxi5;->T:Ls67;': store, 'Lxi5;->a0:Lq60;': f.new('Lq60;')})
        return store

    # Execute the real preference writer, including sorted IDs/cache and native
    # removal when all available regions are deselected. Notification keys never
    # change, regardless of fresh defaults or existing enabled choices.
    for breaking in (False, True):
        for choices, expected in [(None, 'old'), ([], 'old'),
                                  ([('zuid', True), ('noord', False), ('den-haag', True)], 'den-haag,zuid'),
                                  ([('den-haag', False)], None)]:
            f.preferences.update({REGION_KEY: 'old', 'device_settings_breaking': breaking})
            old_notifications = {k: v for k, v in f.preferences.items() if k != REGION_KEY}
            store = set_regions(choices)
            f.run('Lxi5;', 'morpheSaveRegions(Lxi5;)V', [f.vm])
            assert f.preferences.get(REGION_KEY) == expected, 'West region selection is not persisted'
            assert {k: v for k, v in f.preferences.items() if k != REGION_KEY} == old_notifications, 'West region selection changed notification preferences'
            if choices:
                cached = store.value['Ls67;->c:Ljava/lang/String;']
                assert is_zero(cached) if expected is None else cached == expected, 'West region cache disagrees with persisted IDs'

    # First launch and upgrade flow both have just the available region page.
    for upgrade in (False, True):
        for language in (False, True):
            for regions in (False, True):
                adapter = f.new('Lzi5;')
                f.run(*PAGES, start=4, registers={'p0': adapter, 'p2': upgrade,
                                                'p3': language, 'p4': regions})
                pages = adapter.value['Lzi5;->m:Ljava/util/ArrayList;'].value
                assert pages == ([f.statics['Lyi5;->c:Lyi5;']] if regions else []), 'West startup still asks intro/language/notification/consent pages'
                f.adapter = adapter
                set_regions(None)
                f.events.clear()
                f.run(ACTIVITY, 'onCreate(Landroid/os/Bundle;)V', start=251, stop_at=(256,),
                      registers={'p0': f.new(ACTIVITY), 'v2': adapter})
                assert f.events == ([] if regions else [('native-home-completion',)]), 'West empty-region startup does not complete normally'

    # Tap Next on the actual last region page. The native last-page branch must
    # finish normally, never visit or commit the notification preferences page.
    f.binding = f.new('Lnl/stichtingrpo/news/databinding/ActivityOnboardingBinding;', {
        'Lnl/stichtingrpo/news/databinding/ActivityOnboardingBinding;->viewPager:Landroidx/viewpager2/widget/ViewPager2;':
            f.new('Landroidx/viewpager2/widget/ViewPager2;')})
    for upgrade in (False, True):
        f.adapter = f.new('Lzi5;', {'Lzi5;->m:Ljava/util/ArrayList;':
            Reference([f.statics['Lyi5;->c:Lyi5;']], 'Ljava/util/ArrayList;')})
        f.preferences[REGION_KEY] = 'old'
        set_regions([('den-haag', True), ('delft', False)])
        activity = f.new(ACTIVITY, {ACTIVITY + '->L:Z': int(upgrade)})
        f.activity = activity
        code = canonical(source.body(*NEXT)).code
        start = code.index('check-cast v0, ' + ACTIVITY)
        f.events.clear()
        f.run(*NEXT, start=start, registers={'v0': activity, 'v5': 0, 'v6': 1})
        assert not any(e[0] in {'automatic-notification-presenter', 'cookie-presenter'} for e in f.events)
        assert f.preferences[REGION_KEY] == 'den-haag', 'Last-region Next discarded the selected region'
        assert f.events[-2:] == [('preferences-applied',), ('native-home-completion',)]
        if not upgrade:
            assert len([e for e in f.events if e[0] == 'onboarding-native-ready']) == 1


if __name__ == '__main__':
    import argparse
    from pathlib import Path
    from dex_declarations import DexDeclarations
    from verify_dumpert import Smali
    from verify_parool import sdk_classes

    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('root', type=Path)
    parser.add_argument('--apk', type=Path, required=True)
    parser.add_argument('--ads', action='store_true')
    parser.add_argument('--consent', action='store_true')
    args = parser.parse_args()
    sdk_read, archive = sdk_classes()
    try:
        verify_startup_feed(Smali(args.root), DexDeclarations.from_apk(args.apk), sdk_read, args.ads, args.consent)
    finally:
        archive.close()
    print('PASS West region-only startup and omitted inline newsletter')
