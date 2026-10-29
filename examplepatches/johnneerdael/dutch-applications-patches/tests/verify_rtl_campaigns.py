"""Native campaign selection and pre-presentation checks for emitted RTL code."""
import re

from brabant_effects import restore_alignment, restore_edits
from brabant_smali import canonical
from rtl_campaign_contracts import CAMPAIGN_CONTRACTS, CAMPAIGN_PREFIXES
from rtl_vm import Reference, VmThrown, is_zero
from verify_rtl_startup import StartupFixture

ELIGIBILITY = ('Lym7;', 'a(Lym7;Ljava/lang/String;)Ljava/lang/Boolean;')
PRESENTER = ('Ln55;', 'f(Lym7;Lb4e;Lu72;I)V')
QUEUE = ('Lxm7;', 'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;')


def verify_contracts(source, declarations, enabled):
    for row in CAMPAIGN_CONTRACTS:
        owner, signature, flags, locals_, count, digest = row
        assert declarations.classes[owner].methods[signature].access_flags == flags, 'RTL campaign access'
        body = source.body(owner, signature)
        assert int(re.search(r'\.locals (\d+)', body)[1]) == locals_, 'RTL campaign registers'
        value = canonical(body)
        prefix = CAMPAIGN_PREFIXES.get((owner, signature)) if enabled else None
        if prefix:
            value = restore_edits(value, [dict(index=0, original=[], replacement=prefix)], locals_)
            value = restore_alignment(value, count)
        assert len(value.code) == count and value.digest() == digest, 'Retain full RTL campaign graph: ' + owner + signature


class CampaignFixture(StartupFixture):
    def __init__(self, *args):
        super().__init__(*args)
        self.rows.update({r[:2]: r for r in CAMPAIGN_CONTRACTS})
        self.native_helpers.add(ELIGIBILITY)
        self.native_helpers |= {r[:2] for r in CAMPAIGN_CONTRACTS if r[0].startswith('Lcom/swrve/')}
        self.collected = []
        self.delay_suspended = False

    def invoke(self, caller, target, args):
        if target == 'Ljava/lang/String;->hashCode()I':
            value = 0
            encoded = args[0].encode('utf-16-be')
            for pos in range(0, len(encoded), 2):
                unit = int.from_bytes(encoded[pos:pos + 2], 'big')
                value = (31 * value + unit) & 0xffffffff
            return value if value < 2**31 else value - 2**32
        if target.startswith('Lly4;->'):
            raise AssertionError('Native campaign presenter entered Compose/UI')
        if target == 'Ls9g;->n(JLui2;)Ljava/lang/Object;':
            assert args[0] == 200
            return self.statics['Lal2;->h:Lal2;'] if self.delay_suspended else self.statics['Lk9d;->a:Lk9d;']
        if target == 'Llj4;->emit(Ljava/lang/Object;Lui2;)Ljava/lang/Object;':
            self.collected.append(args[1])
            return self.statics['Lk9d;->a:Lk9d;']
        if target == 'Lj07;->v(Ljava/lang/Object;Ljava/lang/Object;)Z':
            return int(args[0] is args[1])
        if target == 'Lcom/swrve/sdk/SwrveImp;->getContext()Landroid/content/Context;':
            raise AssertionError('SDK campaign started creating an Activity')
        if target == 'Lcom/swrve/sdk/SwrveBase;->isSdkReady()Z':
            return 1
        if target == 'Lcom/swrve/sdk/SwrveImp;->getDeviceOrientation()Lcom/swrve/sdk/messaging/SwrveOrientation;':
            return Reference({}, 'Lcom/swrve/sdk/messaging/SwrveOrientation;')
        if target == 'Ljava/util/Date;-><init>()V':
            return None  # Clock is an external fixture boundary.
        if target in {'Lcom/swrve/sdk/SwrveBase;->getNow()Ljava/util/Date;',
                      'Lcom/swrve/sdk/SwrveImp;->getNow()Ljava/util/Date;'}:
            return Reference({}, 'Ljava/util/Date;')
        return super().invoke(caller, target, args)


def verify_native(f):
    manager = Reference({'Lym7;->m:Lefa;': Reference({}, 'Lefa;')}, 'Lym7;')
    for campaign in ('show_bbvolliefde_push_overlay', 'show_push_subscribe_sport',
                     'show_push_optin_modal', 'future-campaign', ''):
        assert f.run(*ELIGIBILITY, [manager, campaign])[0] is f.false, 'Native campaign remains eligible: ' + campaign
    before = dict(manager.value)
    for _ in range(2):
        assert f.run(*PRESENTER, [manager, None, Reference({}, 'Lly4;'), 0])[0] is None
        assert manager.value == before and not f.events and not f.scheduled

    bb = Reference({'Ll98;->a:Ljava/lang/String;': 'show_bbvolliefde_push_overlay'}, 'Ll98;')
    sport = Reference({'Ll98;->a:Ljava/lang/String;': 'show_push_subscribe_sport'}, 'Ll98;')
    manager.value.update({'Lym7;->b0:Ll98;': bb, 'Lym7;->c0:Ll98;': sport})
    for suspended in (False, True):
        # Both campaigns qualify by source input conditions; policy alone excludes them.
        values = Reference([Reference({}, 'Ljava/util/Map;'), f.false, f.false,
                            f.true, f.true, f.false], '[Ljava/lang/Object;')
        coroutine = Reference({'Lxm7;->y:Lym7;': manager, 'Lxm7;->w:Llj4;': Reference({}, 'Llj4;'),
                               'Lxm7;->x:[Ljava/lang/Object;': values, 'Lxm7;->v:I': 0}, 'Lxm7;')
        f.collected.clear()
        f.delay_suspended = suspended
        result = f.run(*QUEUE, [coroutine, None])[0]
        if suspended:
            assert result is f.statics['Lal2;->h:Lal2;'] and not f.collected
            assert coroutine.value['Lxm7;->v:I'] == 3
            result = f.run(*QUEUE, [coroutine, None])[0]
        assert result is f.statics['Lk9d;->a:Lk9d;']
        assert f.collected == [f.statics['Lk98;->a:Lk98;']], 'Native campaign queued instead of native None'
    # Initial result failures remain failures, without emitting or changing preferences.
    f.collected.clear()
    coroutine.value['Lxm7;->v:I'] = 0
    error = Reference({}, 'Ljava/lang/IllegalStateException;')
    failure = Reference({'Luka;->h:Ljava/lang/Throwable;': error}, 'Luka;')
    try:
        f.run(*QUEUE, [coroutine, failure])
    except VmThrown as thrown:
        assert thrown.value is error and not f.collected
    else:
        raise AssertionError('Campaign result error swallowed')


def verify_campaigns(source, declarations, sdk_read, enabled):
    verify_contracts(source, declarations, enabled)
    if enabled:
        verify_native(CampaignFixture(source, declarations, sdk_read))
        verify_swrve(CampaignFixture(source, declarations, sdk_read))


def verify_swrve(f):
    owner = 'Lcom/swrve/sdk/SwrveBase;'
    core = '_getBaseMessageForEvent(Ljava/lang/String;Ljava/util/Map;Lcom/swrve/sdk/messaging/SwrveOrientation;Ljava/util/Date;)Lcom/swrve/sdk/messaging/SwrveBaseMessage;'
    # Empty and populated caches must never be consulted at the gated boundaries.
    for populated in (False, True):
        instance = Reference({'Lcom/swrve/sdk/SwrveImp;->autoShowMessagesEnabled:Z': 1,
                              'Lcom/swrve/sdk/SwrveImp;->campaigns:Ljava/util/List;':
                              Reference([Reference({}, 'Lcom/swrve/sdk/messaging/SwrveInAppCampaign;')] if populated else [], 'Ljava/util/ArrayList;')}, owner)
        before = dict(instance.value)
        assert is_zero(f.run(owner, core, [instance, 'Swrve.Messages.showAtSessionStart', None, None, None])[0])
        assert is_zero(f.run(owner, core, [instance, 'future-server-event', None, None, None])[0])
        for sig, args in [
            ('getBaseMessageForEvent(Ljava/lang/String;)Lcom/swrve/sdk/messaging/SwrveBaseMessage;', [instance, 'future-server-event']),
            ('getBaseMessageForEvent(Ljava/lang/String;Ljava/util/Map;)Lcom/swrve/sdk/messaging/SwrveBaseMessage;', [instance, 'future-server-event', None]),
            ('getBaseMessageForEvent(Ljava/lang/String;Ljava/util/Map;Lcom/swrve/sdk/messaging/SwrveOrientation;)Lcom/swrve/sdk/messaging/SwrveBaseMessage;', [instance, 'future-server-event', None, None]),
        ]:
            assert is_zero(f.run(owner, sig, args)[0])
        # Automatic session entry completes with genuine no-message semantics.
        assert f.run('Lcom/swrve/sdk/SwrveImp;', 'autoShowMessage(Lcom/swrve/sdk/SwrveBase;)V', [instance, instance])[0] is None
        assert instance.value == before
        for (o, signature), prefix in CAMPAIGN_PREFIXES.items():
            if not o.startswith('Lcom/swrve/'):
                continue
            parameters = re.findall(r'\[*L[^;]+;|\[*[ZBCSIJFD]', signature.split('(', 1)[1].split(')', 1)[0])
            row = next(r for r in CAMPAIGN_CONTRACTS if r[:2] == (o, signature))
            receiver = instance if o in {owner, 'Lcom/swrve/sdk/SwrveImp;'} else Reference({}, o)
            saved = dict(receiver.value)
            arguments = [0 if p in 'ZBCSIJFD' else 'fixture' if p == 'Ljava/lang/String;'
                         else Reference({}, p) for p in parameters]
            args = ([] if row[2] & 8 else [receiver]) + arguments
            result = f.run(o, signature, args)[0]
            if 'Ljava/util/ArrayList;' in prefix[0]:
                assert result.descriptor == 'Ljava/util/ArrayList;' and result.value == []
                again = f.run(o, signature, args)[0]
                assert again is not result, 'Each native empty message-center result is independently mutable'
            elif signature.endswith(')V'):
                assert result is None
            else:
                assert is_zero(result), 'Campaign must report no message/display, never a success'
            assert receiver.value == saved and instance.value == before
            assert not f.events and not f.scheduled and not f.collected
