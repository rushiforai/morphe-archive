"""Execute RTL startup routes; Android/SDK UI calls are explicit failure boundaries.

This proves emitted bytecode routing, not on-device rendering or network absence.
"""
import re

from brabant_effects import restore_alignment, restore_edits
from brabant_smali import canonical
from rtl_startup_contracts import STARTUP_CONTRACTS, STARTUP_EDITS
from rtl_vm import Reference, VmThrown
from verify_rtl_tracking import TrackingFixture

SUSPEND = 'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;'


def verify_contracts(source, declarations, enabled):
    for owner, signature, flags, locals_, count, digest in STARTUP_CONTRACTS:
        method = declarations.classes[owner].methods[signature]
        assert method.access_flags == flags, 'RTL startup access contract'
        body = source.body(owner, signature)
        assert int(re.search(r'\.locals (\d+)', body)[1]) == locals_, 'RTL startup register contract'
        value = canonical(body)
        if enabled and (owner, signature) in STARTUP_EDITS:
            value = restore_edits(value, STARTUP_EDITS[owner, signature], locals_)
            value = restore_alignment(value, count)
        assert len(value.code) == count and value.digest() == digest, 'Preserve RTL startup/manual graph: ' + owner + signature


class StartupFixture(TrackingFixture):
    def __init__(self, *args):
        super().__init__(*args)
        self.rows.update({r[:2]: r for r in STARTUP_CONTRACTS})
        self.native_helpers.add(('Lyf4;', 'b(Ljava/lang/String;Ljava/util/Map;)V'))
        self.native_helpers |= {r[:2] for r in STARTUP_CONTRACTS if r[0] in {
            'Lx9e;', 'Lop9;', 'Lnl/rtl/rtnl/core/model/notification/ChannelCodeGroup;'} and r[1] != '<clinit>()V'}

    def invoke(self, caller, target, args):
        if 'PrivacyGateSdk;->refreshConsent' in target:
            raise AssertionError('Automatic PrivacyGate UI still requested')
        if 'MainScreenDestinations$OnboardingDialog;-><init>' in target:
            raise AssertionError('Automatic notification onboarding still requested')
        if target == 'Lyf4;->a(Ljava/lang/String;Ljava/util/Map;)V':
            return None  # Original trace start; UI boundary below must expose old regression.
        if target == 'Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;':
            return args[0].value.get(args[1])
        if target == 'Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;':
            return args[0].value.pop(args[1], None)
        if target == 'Lqp9;->b(Lop9;)Ljava/lang/Object;':
            return args[0].value.get(args[1].value['Lop9;->a:Ljava/lang/String;'])
        if target == 'Lj07;->v(Ljava/lang/Object;Ljava/lang/Object;)Z':
            return int(args[0] is args[1])  # Native Boolean singletons or missing key.
        if target == 'Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;':
            return self.true if args[0] else self.false
        if target == 'Llj4;->emit(Ljava/lang/Object;Lui2;)Ljava/lang/Object;':
            args[0].value.append(args[1])
            return self.statics['Lk9d;->a:Lk9d;']
        return super().invoke(caller, target, args)


def privacy(f):
    # Fresh/returning instances and repeat invocations never write real choices.
    for busy_value, ready_value in ((f.false, f.false), (f.true, f.false), (f.false, f.true)):
        busy, ready = Reference({'value': busy_value}, 'Ldyb;'), Reference({'value': ready_value}, 'Ldyb;')
        trace = Reference({'Lyf4;->b:Ljava/util/LinkedHashMap;': Reference({}, 'Ljava/util/LinkedHashMap;')}, 'Lyf4;')
        choices = Reference({'marketing': False, 'other': 'real stored choice'}, 'Ljra;')
        manager = Reference({'Lkc2;->i:Ldyb;': busy, 'Lkc2;->j:Ldyb;': ready,
                             'Lkc2;->b:Lbe9;': trace, 'Lkc2;->c:Lnpa;': choices,
                             'Lkc2;->d:Lbe/dpgmedia/privacy/privacygatesdk/PrivacyGateSdk;': Reference({}, 'Lbe/dpgmedia/privacy/privacygatesdk/PrivacyGateSdk;')}, 'Lkc2;')
        coroutine = Reference({'Lqq1;->u:I': 5, 'Lqq1;->v:I': 0,
                               'Lqq1;->w:Ljava/lang/Object;': manager,
                               'Lqq1;->x:Ljava/lang/Object;': Reference({}, 'Landroidx/fragment/app/s;')}, 'Lqq1;')
        stored = dict(choices.value)
        for _ in range(2):
            f.events.clear()
            assert f.run('Lqq1;', SUSPEND, [coroutine, None])[0] is f.statics['Lk9d;->a:Lk9d;']
            assert busy.value['value'] is f.false and ready.value['value'] is f.true
            assert choices.value == stored and coroutine.value['Lqq1;->v:I'] == 0
            assert f.events == [('published', f.false), ('published', f.true)] and not f.scheduled
        # Native initial result failure propagates before startup changes state.
        error = Reference({}, 'Ljava/lang/IllegalStateException;')
        failure = Reference({'Luka;->h:Ljava/lang/Throwable;': error}, 'Luka;')
        f.events.clear()
        try:
            f.run('Lqq1;', SUSPEND, [coroutine, failure])
        except VmThrown as caught:
            assert caught.value is error and not f.events
        else:
            raise AssertionError('Initial privacy error must propagate')
        # Resume=1 retains its native result path and failure cleanup/rethrow.
        coroutine.value['Lqq1;->v:I'] = 1
        provider = Reference({}, 'Lzb2;')
        result, frame = f.run('Lqq1;', SUSPEND, [coroutine, provider], stop_at=(803,))
        assert frame['v0'] is provider
        f.events.clear()
        try:
            f.run('Lqq1;', SUSPEND, [coroutine, failure])
        except VmThrown as caught:
            assert caught.value is error
            assert f.events == [('published', f.false), ('published', f.true)]
        else:
            raise AssertionError('Resumed privacy error must propagate')


def notifications(f):
    for completed in (f.false, f.true):
        for reminder in (f.false, f.true):
            states = [Reference({'value': v}, 'Lzh8;') for v in (completed, reminder)]
            nav = Reference({}, 'Lkl8;')
            navigator = Reference({'Lhpa;->a:Lkl8;': nav}, 'Lhpa;')
            coroutine = Reference({'Lfm7;->u:Lhpa;': navigator, 'Lfm7;->v:Lzh8;': states[0],
                                   'Lfm7;->w:Lzh8;': states[1]}, 'Lfm7;')
            f.events.clear()
            before = [dict(state.value) for state in states]
            for _ in range(2):
                assert f.run('Lfm7;', SUSPEND, [coroutine, None])[0] is f.statics['Lk9d;->a:Lk9d;']
                assert [state.value for state in states] == before
                assert not f.events and not f.scheduled and not nav.value
            error = Reference({}, 'Ljava/lang/IllegalStateException;')
            failure = Reference({'Luka;->h:Ljava/lang/Throwable;': error}, 'Luka;')
            try:
                f.run('Lfm7;', SUSPEND, [coroutine, failure])
            except VmThrown as caught:
                assert caught.value is error
            else:
                raise AssertionError('Notification result error must propagate')


def notification_defaults(f):
    # Execute the shipped preference mapper with real missing/false/true keys.
    group_owner = 'Lnl/rtl/rtnl/core/model/notification/ChannelCodeGroup;'
    for breaking in (None, f.false, f.true):
        for nonbreaking in (None, f.false, f.true):
            stored = {k: v for k, v in [('news', breaking), ('news_nb', nonbreaking)] if v is not None}
            snapshot = dict(stored)
            group = Reference({group_owner + '->channelCodeBreaking:Ljava/lang/String;': 'news',
                               group_owner + '->channelCodeNonBreaking:Ljava/lang/String;': 'news_nb'}, group_owner)
            collector = Reference([], 'Llj4;')
            mapper = Reference({'Lfa;->h:I': 18, 'Lfa;->j:Ljava/lang/Object;': group,
                                'Lfa;->i:Ljava/lang/Object;': collector}, 'Lfa;')
            continuation = Reference({'Lwqa;->v:I': -2**31, 'Lwqa;->u:Ljava/lang/Object;': None}, 'Lwqa;')
            result = f.run('Lfa;', 'emit(Ljava/lang/Object;Lui2;)Ljava/lang/Object;',
                           [mapper, Reference(stored, 'Lqp9;'), continuation])[0]
            expected = f.true if breaking is f.true or nonbreaking is f.true else f.false
            assert collector.value == [expected] and stored == snapshot
            assert result is f.statics['Lk9d;->a:Lk9d;']


def verify_startup(source, declarations, sdk_read, enabled):
    verify_contracts(source, declarations, enabled)
    notification_defaults(StartupFixture(source, declarations, sdk_read))
    if enabled:
        privacy(StartupFixture(source, declarations, sdk_read))
        notifications(StartupFixture(source, declarations, sdk_read))
