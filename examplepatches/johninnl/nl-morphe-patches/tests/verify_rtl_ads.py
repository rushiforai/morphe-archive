"""Bounded execution of actual RTL emitted ad callbacks and no-ad media paths."""
import re

from rtl_contracts import CONTRACTS, ADS_EDITS
from rtl_ads_contracts import ADS_CONTRACTS
from rtl_vm import Memory, Reference, execute, is_zero, parse
from verify_dumpert import absolute_registers, audit_call

VM = 'Lnl/rtl/videoplayer/ui/videoplayer/VideoPlayerViewModel;'
AD_CONFIG = 'Lcom/bitmovin/player/api/advertising/AdvertisingConfig;'
USER_CONFIG = 'Lnl/rtl/videoplayer/config/UserConfig;'
VIDEO_CONFIG = 'Lnl/rtl/videoplayer/config/VideoPlayerConfig;'
LOAD_DATA = 'Lnl/rtl/videoplayer/ui/videoplayer/VideoPlayerViewModel$loadData$1;'


class AdsFixture:
    def __init__(self, source, declarations, sdk_read):
        self.source, self.declarations, self.sdk_read = source, declarations, sdk_read
        self.rows = {(r[0], r[1]): r for r in CONTRACTS + ADS_CONTRACTS}
        self.native_helpers = {(r[0], r[1]) for r in ADS_CONTRACTS}
        self.programs, self.events, self.posted = {}, [], []
        self.true = Reference(True, 'Ljava/lang/Boolean;')
        self.false = Reference(False, 'Ljava/lang/Boolean;')
        self.statics = {'Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;': self.true,
                        'Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;': self.false,
                        'Low3;->h:Low3;': Reference([], 'Low3;')}
        self.memory = Memory(self.parents, self.statics)

    def parents(self, owner):
        if owner in self.declarations.classes:
            c = self.declarations.classes[owner]
            return tuple(x for x in (c.superclass, *c.interfaces) if x)
        c = self.sdk_read(owner)
        assert c, 'Missing RTL fixture hierarchy: ' + owner
        return tuple(x for x in (c[1], *self.sdk_read.interfaces(owner)) if x)

    def program(self, owner, signature):
        key = owner, signature
        if key not in self.programs:
            assert key in self.rows, 'Unpinned RTL fixture method: ' + str(key)
            p = parse(self.source.body(owner, signature))
            p.instructions = [absolute_registers(x, self.rows[key][3]) for x in p.instructions]
            for line in p.instructions:
                if line.startswith('sget-object '):
                    field = line.split(', ', 1)[1]
                    self.statics.setdefault(field, Reference({}, field.rsplit(':', 1)[1]))
            self.programs[key] = p
        return self.programs[key]

    def run(self, owner, signature, args=(), start=0, stop_at=(), registers=None):
        row = self.rows[owner, signature]
        frame = {'v' + str(row[3] + i): v for i, v in enumerate(args)}
        for name, value in (registers or {}).items():
            frame['v' + str(row[3] + int(name[1:])) if name.startswith('p') else name] = value
        result = execute(self.program(owner, signature), frame,
                         lambda target, values: self.invoke(owner, target, values),
                         start=start, stop_at=stop_at, memory=self.memory,
                         trace=lambda line: audit_call(line, owner, self.declarations, self.sdk_read))
        return result, frame

    def method(self, owner, prefix):
        rows = [r for r in self.rows if r[0] == owner and r[1].startswith(prefix)]
        assert len(rows) == 1, 'Ambiguous RTL fixture prefix: ' + owner + prefix
        return rows[0][1]

    def invoke(self, caller, target, args):
        owner, signature = target.split('->', 1)
        if ((owner, signature) in self.native_helpers or owner == 'Lkg;' or
                (owner == VIDEO_CONFIG and signature.startswith('get'))):
            return self.run(owner, signature, args)[0]
        if signature == '<init>()V' and owner == 'Ljava/lang/Object;':
            return None
        if target == 'Ljava/lang/Object;->getClass()Ljava/lang/Class;':
            assert not is_zero(args[0]), 'Real RTL nonnull check'
            return Reference({}, 'Ljava/lang/Class;')
        if target == 'Lnl/rtl/rtnl/core/model/AdMetaData;->getSlotName()Ljava/lang/String;':
            return 'fixture-slot'
        if owner == 'Ljava/lang/StringBuilder;':
            if signature.startswith('<init>('): args[0].value['text'] = str(args[1]) if len(args) > 1 else ''
            elif signature.startswith('append('): args[0].value['text'] += str(args[1])
            elif signature.startswith('toString('): return args[0].value['text']
            else: raise AssertionError('Unsupported RTL StringBuilder: ' + target)
            return args[0]
        if target == 'Lloc;->d(Ljava/lang/String;[Ljava/lang/Object;)V':
            self.events.append(('native-log',))
            return None
        if target == 'Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;':
            return Reference(args[0], 'Ljava/lang/Integer;')
        if target == 'Ljava/lang/Boolean;->booleanValue()Z':
            assert isinstance(args[0], Reference) and args[0].descriptor == 'Ljava/lang/Boolean;'
            return int(args[0].value)
        if target in {'Lew4;->invoke()Ljava/lang/Object;', 'Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;'}:
            return args[0].value(*args[1:])
        if target == 'Lzh8;->setValue(Ljava/lang/Object;)V':
            args[0].value['value'] = args[1]
            self.events.append(('state', args[1]))
            return None
        if target in {'Lzxb;->getValue()Ljava/lang/Object;', 'Lbyb;->getValue()Ljava/lang/Object;'}:
            return args[0].value['value']
        if owner == 'Lw9;' and signature.startswith('<init>('):
            assert args[4] == 0 and args[5] == 0x7c, 'Native fallback keeps automatic load disabled'
            args[0].value['children'] = ['native-template']
            return None  # Android layout inflation is a device boundary.
        if target == 'Landroid/view/View;->post(Ljava/lang/Runnable;)Z':
            self.posted.append(args[1])
            return 1
        if target == 'Landroid/view/ViewGroup;->removeAllViews()V':
            args[0].value['children'].clear()
            self.events.append(('remove-children',))
            return None
        if target == 'Landroid/view/View;->setVisibility(I)V':
            args[0].value['visibility'] = args[1]
            return None
        if target == 'Landroid/view/ViewGroup$LayoutParams;-><init>(II)V':
            args[0].value.update(width=args[1], height=args[2])
            return None
        if target == 'Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V':
            args[0].value['layout'] = args[1]
            return None
        if target == 'Lly4;->m0(Ljava/lang/Object;)V':
            self.events.append(('remember-view', args[1]))
            return None
        if target == 'Lly4;->c0(I)V':
            self.events.append(('open-group', args[1]))
            return None
        if target == 'Lly4;->p(Z)V':
            self.events.append(('close-group', args[1]))
            return None
        if target == 'Lly4;->t()Lo8a;':
            self.events.append(('end-restart',))
            return None
        if target == 'Lxlb;->n(Lda8;F)Lda8;':
            assert args[1] == 0, 'Native completed ad slot must have zero height'
            self.events.append(('zero-height',))
            return args[0]
        if target == 'Lgxh;->b(Lu72;Lda8;)V':
            self.events.append(('compose-zero-space',))
            return None
        if target == 'Ljjb;->d3()V' or target == 'Lq64;->A3()V':
            return None
        if target == 'Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;':
            return Reference([args[0]], 'Ljava/util/List;')
        if target == 'Lq64;->s3(Ljava/util/List;Z)V':
            assert args[2] == 0
            args[0].value['sources'] = args[1].value
            return None
        if target == 'Ljjb;->prepare()V':
            args[0].value['prepared'] = True
            return None
        if target == 'Lb3;->y2(IJ)V':
            assert args[1] == 5
            args[0].value['seek'] = args[2]
            return None
        if target == 'Lnl/rtl/videoplayer/data/LoadDataRepository;->loadLabels(Ljava/lang/String;Lui2;)Ljava/lang/Object;':
            self.events.append(('labels', args[1]))
            return self.labels_response
        if target == 'Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;':
            return args[0].value.get(args[1])
        if target.startswith(VM + '->access$createSessionConsumerFactory('):
            self.factory_content = args[1]
            return self.factory
        if target == 'Ldyb;->m(Ljava/lang/Object;Ljava/lang/Object;)Z':
            assert is_zero(args[1]), 'Original unconditional StateFlow update'
            args[0].value['value'] = args[2]
            self.events.append(('published', args[2]))
            return 1
        raise AssertionError('Unsupported RTL ads invocation: ' + target)


def verify_ads(source, declarations, sdk_read):
    f = AdsFixture(source, declarations, sdk_read)
    # Both pure ad wrappers exit before creating groups, height or Loading state.
    for edit in ADS_EDITS:
        if edit['owner'] in {'Lgr6;', 'Lv71;'}:
            assert f.run(edit['owner'], edit['signature'])[0] is None

    height, errors = [], []
    completed = Reference({'value': f.false}, 'Lzh8;')
    slot = Reference({}, 'Lmaa;')
    callback = Reference({}, 'Lkg;')
    error = Reference(lambda: errors.append('native-error'), 'Lew4;')
    resized = Reference(lambda value: height.append(value.value), 'Lkotlin/jvm/functions/Function1;')
    unused = Reference(lambda *_: (_ for _ in ()).throw(AssertionError('Unexpected ad-success callback')), 'Lkotlin/jvm/functions/Function1;')
    ctor = f.method('Lkg;', '<init>(')
    f.run('Lkg;', ctor, [callback, slot, unused, unused, Reference({}, 'Lnl/rtl/rtnl/core/model/AdMetaData;'),
                         error, resized, Reference({'value': ''}, 'Lzh8;'), completed])
    common = f.method('Llg;', 'a(')
    composer = Reference({}, 'Lly4;')
    f.run('Llg;', common, start=764, registers={'v12': callback, 'v13': slot,
        'v2': Reference({}, 'Lewi;'), 'v5': 8, 'v30': Reference({}, 'Landroid/content/Context;'),
        'v7': composer, 'v8': 0, 'v14': 0, 'v17': 0, 'v18': 0, 'v20': completed,
        'v22': 0, 'v23': 0, 'p9': composer})
    assert errors == ['native-error'] and height == [0], 'Real ad-free completion clears error/height waiters once'
    assert completed.value['value'] is f.true, 'Original callback publishes actual completed=true'
    view = slot.value['Lmaa;->h:Ljava/lang/Object;']
    assert view.value['visibility'] == 8, 'Native fallback view is GONE'
    assert len(f.posted) == 1, 'Original fallback schedules exactly one cleanup'
    f.run('Lp0;', 'run()V', [f.posted[0]])
    assert view.value['children'] == [], 'Real merged Runnable case2 removes child views'
    assert ('zero-height',) in f.events and ('end-restart',) in f.events
    assert [e for e in f.events if e[0] == 'close-group'] == [('close-group', 0), ('close-group', 1)]

    # The existing regular-player branch gets AdFree while auth stays genuine.
    regular = f.method('Ley4;', 'd(')
    auth_field = 'Lcod;->n:Lv7a;'
    flow_field = 'Lv7a;->h:Lbyb;'
    for token in (None, 'fixture-auth-id'):
        auth_flow = Reference({'value': token}, 'Lbyb;')
        config_holder = Reference({auth_field: Reference({flow_field: auth_flow}, 'Lv7a;')}, 'Lcod;')
        consent = Reference({}, 'Lnl/rtl/videoplayer/model/UserConsentState;')
        pc, frame = f.run('Ley4;', regular, start=379, stop_at={398},
                          registers={'v0': consent, 'v1': 0, 'v2': config_holder})
        assert pc == 398
        config = frame['v4']
        profile = f.run(USER_CONFIG, 'getAdProfile()Lnl/rtl/videoplayer/config/AdProfile;', [config])[0]
        auth = f.run(USER_CONFIG, 'getAuthentication()Lnl/rtl/videoplayer/config/Authentication;', [config])[0]
        actual_consent = f.run(USER_CONFIG, 'getUserConsent()Lnl/rtl/videoplayer/model/UserConsentState;', [config])[0]
        assert profile is f.statics['Lnl/rtl/videoplayer/config/AdProfile$AdFree;->INSTANCE:Lnl/rtl/videoplayer/config/AdProfile$AdFree;']
        assert actual_consent is consent
        if token is None:
            assert auth is f.statics['Lnl/rtl/videoplayer/config/Authentication$NotAuthenticated;->INSTANCE:Lnl/rtl/videoplayer/config/Authentication$NotAuthenticated;']
        else:
            assert auth.value['Lnl/rtl/videoplayer/config/Authentication$Authenticated;->userId:Ljava/lang/String;'] is token
    native_user_config = config

    # Execute the actual SDK constructor chain with its native default mask;
    # merely returning null/Unit or inventing an AdvertisingConfig is insufficient.
    empty, _ = f.run(VM, f.method(VM, 'createAdvertisingConfig('), [Reference({}, VM), 0, 0, 0])
    assert isinstance(empty, Reference) and empty.descriptor == AD_CONFIG
    schedule = f.run(AD_CONFIG, 'getSchedule()Ljava/util/List;', [empty])[0]
    assert schedule is f.statics['Low3;->h:Low3;'] and schedule.value == [], 'Real native empty advertising schedule'
    assert f.run('Low3;', 'size()I', [schedule])[0] == 0
    assert f.run('Low3;', 'isEmpty()Z', [schedule])[0] == 1

    loader = 'Lnl/rtl/videoplayer/rtlxl/config/ContentLoader;'
    settings_type = 'Lnl/rtl/videoplayer/rtlxl/config/Config$AdSettings;'
    settings_key = 'Lnl/rtl/videoplayer/rtlxl/config/Config;->adSettings:' + settings_type
    vmap = f.method(loader, 'loadVmapUrl(')
    f.program(loader, vmap)
    disabled = f.statics[settings_type + '->DISABLED:' + settings_type]
    for setting in (disabled, Reference({}, settings_type)):
        config = Reference({settings_key: setting}, 'Lnl/rtl/videoplayer/rtlxl/config/Config;')
        result, _ = f.run(loader, vmap, [Reference({}, loader), 'id', 'user', config, 'channel', 0],
                           start=30, registers={'v3': 0})
        assert is_zero(result), 'Legacy VMAP uses the native disabled nullable return before any request'

    tfk = 'Lcom/triple/tfkplayer/exo/TFKExoPlayer;'
    build = 'd(Ljava/lang/Long;)V'
    program = f.program(tfk, build)
    # Only two native assignments carry the selected nullable tag to its consumers.
    assert [(i, x) for i, x in enumerate(program.instructions) if re.match(r'move-object/from16 v24,', x)] == [
        (109, 'move-object/from16 v24, v7'), (144, 'move-object/from16 v24, v7')]
    assert f.run(tfk, build, start=100, stop_at={101})[1]['v7'] == 0
    for copy, stop in ((109, 110), (144, 145)):
        assert f.run(tfk, build, start=copy, stop_at={stop}, registers={'v7': 0})[1]['v24'] == 0
    assert f.run(tfk, build, start=268, stop_at={373}, registers={'v24': 0})[0] == 373
    position = 1234567
    player = Reference({}, 'Ljjb;')
    engine = Reference({}, 'Lq64;')
    player.value['Ljjb;->j:Lq64;'] = engine
    ordinary_source = Reference({}, 'Lsr0;')
    pc, _ = f.run(tfk, build, start=514, stop_at={550}, registers={
        'v24': 0, 'v16': position, 'v17': 0, 'v7': player, 'v6': ordinary_source})
    assert pc == 550
    assert engine.value['sources'] == [ordinary_source] and engine.value['sources'][0] is ordinary_source
    assert player.value['prepared'] and player.value['seek'] == position, 'Native prepare/seek suffix remains live'

    # Follow the actual current-player coroutine from its unchanged metadata
    # boundary through no-VMAP content construction and StateFlow publication.
    # The functional labels service is an external reply boundary here.
    load = 'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;'
    f.program(LOAD_DATA, load)
    suspended = f.statics['Lal2;->h:Lal2;']
    unit = f.statics['Lk9d;->a:Lk9d;']
    labels = Reference({}, 'Ljava/util/LinkedHashMap;')
    f.factory = Reference({}, 'Lnl/rtl/videoplayer/analytics/tracker/MultiSessionTrackerFactory;')
    for defer in (False, True):
        result_flow = Reference({'value': None}, 'Ldyb;')
        view_model = Reference({VM + '->_contentResult:Lai8;': result_flow}, VM)
        video_config = Reference({VIDEO_CONFIG + '->userConfig:' + USER_CONFIG: native_user_config,
            VIDEO_CONFIG + '->videoMetadata:Lnl/rtl/videoplayer/config/VideoMetadata;': 0,
            VIDEO_CONFIG + '->analyticsConfig:Lnl/rtl/videoplayer/config/VideoAnalyticsConfig;':
                Reference({}, 'Lnl/rtl/videoplayer/config/VideoAnalyticsConfig;')}, VIDEO_CONFIG)
        coroutine = Reference({LOAD_DATA + '->$config:' + VIDEO_CONFIG: video_config,
            LOAD_DATA + '->$uuid:Ljava/lang/String;': 'fixture-video-id',
            LOAD_DATA + '->this$0:' + VM: view_model}, LOAD_DATA)
        play = Reference({'Lnl/rtl/videoplayer/rtlxl/model/internal/PlayResponse;->streamId:Ljava/lang/String;': 'fixture-stream'},
                         'Lnl/rtl/videoplayer/rtlxl/model/internal/PlayResponse;')
        f.labels_response = suspended if defer else labels
        output, _ = f.run(LOAD_DATA, load, start=237, registers={
            'v0': coroutine, 'v1': 0, 'v2': play, 'v5': suspended,
            'v7': Reference({}, 'Lnl/rtl/videoplayer/data/LoadDataRepository;'),
            'v12': 'fixture-content-id', 'v18': unit})
        if defer:
            assert output is suspended and result_flow.value['value'] is None, 'Do not fabricate coroutine completion'
            assert coroutine.value[LOAD_DATA + '->label:I'] == 6
            output, _ = f.run(LOAD_DATA, load, [coroutine, labels])
        assert output is unit
        published = result_flow.value['value']
        assert published.descriptor == 'Lnl/rtl/videoplayer/model/MetadataResult$Success;'
        assert published.value['Lnl/rtl/videoplayer/model/MetadataResult$Success;->sessionTrackerFactory:Lnl/rtl/videoplayer/analytics/tracker/SessionTrackerFactory;'] is f.factory
        content = f.factory_content
        assert published.value['Lnl/rtl/videoplayer/model/MetadataResult$Success;->videoContent:Lnl/rtl/videoplayer/model/Content;'] is content
        assert f.run('Lnl/rtl/videoplayer/model/Content;', 'getVmapUrl()Ljava/lang/String;', [content])[0] == 0
        assert f.run('Lnl/rtl/videoplayer/model/Content;', 'getPlayResponse()Lnl/rtl/videoplayer/rtlxl/model/internal/PlayResponse;', [content])[0] is play
