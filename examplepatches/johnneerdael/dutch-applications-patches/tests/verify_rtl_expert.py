"""Execute RTL expert opt-out using the shipped disabled SDK and failure results."""
import re

from brabant_effects import restore_alignment, restore_edits
from brabant_smali import canonical
from rtl_expert_contracts import EXPERT_CONTRACTS, EXPERT_EDITS, EXPERT_HELPER
from rtl_vm import Reference, VmThrown, is_zero
from verify_dumpert import audit_call
from verify_rtl_campaigns import CampaignFixture

FACTORY = ('Lcom/swrve/sdk/SwrveSDK;', 'createInstance(Landroid/app/Application;ILjava/lang/String;Lcom/swrve/sdk/config/SwrveConfig;)Lcom/swrve/sdk/ISwrve;')
EMPTY = 'Lcom/swrve/sdk/SwrveBaseEmpty;'


def verify_contracts(source, declarations, sdk_read, enabled):
    for owner, signature, flags, locals_, count, digest in EXPERT_CONTRACTS:
        assert declarations.classes[owner].methods[signature].access_flags == flags, 'RTL expert access'
        body = source.body(owner, signature)
        assert int(re.search(r'\.locals (\d+)', body)[1]) == locals_, 'RTL expert registers'
        value = canonical(body)
        if enabled and (owner, signature) in EXPERT_EDITS:
            value = restore_edits(value, EXPERT_EDITS[owner, signature], locals_)
            value = restore_alignment(value, count)
        assert len(value.code) == count and value.digest() == digest, 'Retain RTL expert original graph: ' + owner + signature
    owner, signature = EXPERT_HELPER
    present = signature in declarations.classes[owner].methods
    assert present == enabled, 'Expert helper must be absent when unselected'
    if enabled:
        assert declarations.classes[owner].methods[signature].access_flags == 9
        body = source.body(owner, signature)
        assert re.search(r'\.locals (\d+)', body)[1] == '0'
        value = canonical(body)
        assert value.code == ['iput-object p1, p0, ' + EMPTY + '->config:Lcom/swrve/sdk/config/SwrveConfigBase;', 'return-void']
        assert not value.switches and not value.handlers and not value.arrays
        for line in value.code:
            audit_call(line, owner, declarations, sdk_read)


class ExpertFixture(CampaignFixture):
    def __init__(self, *args):
        super().__init__(*args)
        self.rows.update({r[:2]: r for r in EXPERT_CONTRACTS})
        self.rows[EXPERT_HELPER] = (*EXPERT_HELPER, 9, 0, 2, '')
        self.native_helpers |= {r[:2] for r in EXPERT_CONTRACTS if r[0] not in {
            'Lb7c;', 'Lcom/google/firebase/messaging/FirebaseMessaging$AutoInit;'}}
        self.native_helpers.add(EXPERT_HELPER)
        self.sdk_available = True
        self.callbacks = []
        self.statics['Lcom/swrve/sdk/SwrveSDKBase;->instance:Lcom/swrve/sdk/ISwrveBase;'] = None

    def invoke(self, caller, target, args):
        if target.startswith('Lcom/swrve/sdk/Swrve;-><init>('):
            raise AssertionError('Real Swrve initialization still runs')
        if target == 'Lcom/swrve/sdk/SwrveHelper;->sdkAvailable(Ljava/util/List;)Z':
            return int(self.sdk_available)  # Hardware/model availability boundary.
        if target == 'Lcom/swrve/sdk/SwrveHelper;->isNullOrEmpty(Ljava/lang/String;)Z':
            return int(is_zero(args[0]) or args[0] == '')
        if target == 'Lcom/swrve/sdk/SwrveHelper;->isInvalidAPIKey(Ljava/lang/String;)Z':
            return int(args[0].startswith('secret-'))
        if target == 'Lcom/swrve/sdk/SwrveHelper;->logAndThrowException(Ljava/lang/String;)V':
            raise VmThrown(Reference({'message': args[0]}, 'Ljava/lang/IllegalArgumentException;'))
        if target == 'Lcom/swrve/sdk/config/SwrveConfigBase;->getModelBlackList()Ljava/util/List;':
            if is_zero(args[0]):
                raise VmThrown(Reference({}, 'Ljava/lang/NullPointerException;'))
            return Reference([], 'Ljava/util/ArrayList;')
        if target == 'Landroid/content/Context;->getApplicationContext()Landroid/content/Context;':
            return args[0]
        if target == 'Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V':
            args[0].value['reference'] = args[1]
            return None
        if target == 'Lcom/swrve/sdk/SwrveBaseEmpty$SwrveConfigBaseImp;-><init>(Lcom/swrve/sdk/SwrveBaseEmpty;I)V':
            return None  # Default data-only configuration constructor boundary.
        if target == 'Lcom/swrve/sdk/config/SwrveConfigBase;->getLanguage()Ljava/lang/String;':
            return 'fixture'
        if target == 'Lcom/swrve/sdk/config/SwrveConfigBase;->getCacheDir()Ljava/io/File;':
            return None
        if target == 'Landroid/content/Context;->getCacheDir()Ljava/io/File;':
            return Reference({}, 'Ljava/io/File;')
        if target.endswith('->getConfig()Lcom/swrve/sdk/config/SwrveConfigBase;') and args[0].descriptor == 'Lcom/swrve/sdk/SwrveEmpty;':
            return self.run(EMPTY, 'getConfig()Lcom/swrve/sdk/config/SwrveConfigBase;', args)[0]
        if any(token in target for token in ('->onUserResourcesSuccess(', '->onRealTimeUserPropertiesSuccess(', '->onUserResourcesDiffSuccess(')):
            self.callbacks.append(args[1:])
            return None
        return super().invoke(caller, target, args)


def verify_effects(f):
    app = Reference({}, 'Landroid/app/Application;')
    config = Reference({}, 'Lcom/swrve/sdk/config/SwrveConfig;')
    for available in (False, True):
        for existing in (None, Reference({}, 'Lcom/swrve/sdk/Swrve;')):
            f.sdk_available = available
            f.statics['Lcom/swrve/sdk/SwrveSDKBase;->instance:Lcom/swrve/sdk/ISwrveBase;'] = existing
            result = f.run(*FACTORY, [app, 1, 'fixture-key', config])[0]
            assert result.descriptor == 'Lcom/swrve/sdk/SwrveEmpty;'
            assert f.run('Lcom/swrve/sdk/SwrveSDKBase;', 'getInstance()Lcom/swrve/sdk/ISwrveBase;')[0] is result
            assert f.run('Lcom/swrve/sdk/SwrveCommon;', 'getInstance()Lcom/swrve/sdk/ISwrveCommon;')[0] is result
            assert f.run('Lcom/swrve/sdk/SwrveSDK;', 'getConfig()Lcom/swrve/sdk/config/SwrveConfig;')[0] is config
            assert f.run(EMPTY, 'isStarted()Z', [result])[0] == 0
            assert f.run(EMPTY, 'isTrackingStateStopped()Z', [result])[0] == 1
            f.run(EMPTY, 'userUpdate(Ljava/util/Map;)V', [result, Reference({}, 'Ljava/util/Map;')])
            f.run('Lcom/swrve/sdk/SwrveEmpty;', 'setRegistrationId(Ljava/lang/String;)V', [result, 'fixture-token'])
            for signature in ('identify(Ljava/lang/String;Lcom/swrve/sdk/SwrveIdentityResponse;)V',
                              'refreshContent(Lcom/swrve/sdk/SwrveRefreshContentListener;)V'):
                args = [result, None, None] if signature.startswith('identify') else [result, None]
                f.run(EMPTY, signature, args)
            assert not f.events and not f.scheduled and not f.callbacks
            for signature in ('getUserResources(Lcom/swrve/sdk/SwrveUserResourcesListener;)V',
                              'getRealTimeUserProperties(Lcom/swrve/sdk/SwrveRealTimeUserPropertiesListener;)V',
                              'getUserResourcesDiff(Lcom/swrve/sdk/SwrveUserResourcesDiffListener;)V'):
                f.callbacks.clear()
                f.run(EMPTY, signature, [result, None])
                assert not f.callbacks
                listener = Reference({}, signature.split('(', 1)[1].split(')', 1)[0])
                f.run(EMPTY, signature, [result, listener])
                assert len(f.callbacks) == 1 and is_zero(f.callbacks[0][-1])
                assert all(value.value == {} for value in f.callbacks[0][:-1])
            f.callbacks.clear()
    # Real factory validation failures must still exit the monitor and propagate.
    cases = [(args, 'Ljava/lang/IllegalArgumentException;') for args in (
        [None, 1, 'fixture-key', config], [app, 1, '', config], [app, 1, 'secret-fixture', config])]
    cases.append(([app, 1, 'fixture-key', None], 'Ljava/lang/NullPointerException;'))
    for args, expected in cases:
        try:
            f.run(*FACTORY, args)
        except VmThrown as caught:
            assert caught.value.descriptor == expected
        else:
            raise AssertionError('Factory validation error swallowed')
    for (owner, signature), edits in EXPERT_EDITS.items():
        if signature != 'doWork()Lp57;':
            continue
        result = f.run(owner, signature, [Reference({}, owner)])[0]
        assert result.descriptor == 'Lm57;'
        assert f.memory.instance_of(result, 'Lp57;') and 'Lm57;->a:Lzr2;' in result.value
    owner = 'Lcom/swrve/sdk/SwrvePushServiceDefault;'
    assert f.run(owner, 'handle(Landroid/content/Context;Ljava/util/Map;Ljava/lang/String;J)Z',
                 [app, Reference({}, 'Ljava/util/Map;'), 'fixture', 0, 0])[0] == 0
    # Stored or in-memory FCM opt-ins must not restart automatic registration.
    owner = 'Lcom/google/firebase/messaging/FirebaseMessaging$AutoInit;'
    for state in (None, f.false, f.true):
        for firebase_default in (False, True):
            instance = Reference({owner + '->autoInitEnabled:Ljava/lang/Boolean;': state,
                                  owner + '->this$0:Lcom/google/firebase/messaging/FirebaseMessaging;':
                                  Reference({'default_data_collection': firebase_default}, 'Lcom/google/firebase/messaging/FirebaseMessaging;')}, owner)
            before = dict(instance.value)
            assert f.run(owner, 'isEnabled()Z', [instance])[0] == 0 and instance.value == before
    assert not f.events and not f.scheduled


def verify_expert(source, declarations, sdk_read, enabled):
    verify_contracts(source, declarations, sdk_read, enabled)
    if enabled:
        verify_effects(ExpertFixture(source, declarations, sdk_read))
