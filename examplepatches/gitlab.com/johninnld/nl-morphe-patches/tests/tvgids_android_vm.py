"""APK-bound native ad-view lifecycle with explicit Android/SDK boundaries."""
import json
import re

from brabant_smali import canonical
from rtl_vm import Memory, Reference, VmThrown, execute, is_zero
from tvgids_android_contracts import CONTRACTS
from verify_dumpert import absolute_registers, audit_call


VIEW = 'Lwa;'
ACTIVITY = 'Lnl/tvgids/MainActivity;'
CTOR = '<init>(Landroid/content/Context;ILorg/json/JSONObject;Li20;Lnl/tvgids/MainActivity;)V'
METHOD = 'onMethodCall(Lin3;Lln3;)V'
RUNNABLE = '<init>(ILjava/lang/Object;Ljava/lang/Object;)V'
FACTORY = 'n(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lh9;)Landroid/widget/LinearLayout;'


class AdViewFixture:
    def __init__(self, source, declarations, sdk):
        self.source, self.declarations, self.sdk = source, declarations, sdk
        self.rows = {r[:2]: r for r in CONTRACTS}
        self.native = {(VIEW, sig) for owner, sig, *_ in CONTRACTS if owner == VIEW}
        self.native.update({('Lua;', RUNNABLE), ('Lua;', 'run()V'), (ACTIVITY, 'c(Lrt1;)V')})
        self.memory = Memory(self.parents)
        self.memory.statics['Lhg1;->a:Lhg1;'] = Reference({}, 'Lhg1;')
        self.memory.statics['Lni1;->PRODUCTION:Lni1;'] = Reference({}, 'Lni1;')
        self.events = []

    def parents(self, owner):
        if owner in self.declarations.classes:
            cls = self.declarations.classes[owner]
            return tuple(p for p in (cls.superclass, *cls.interfaces) if p)
        cls = self.sdk(owner)
        assert cls, 'Missing TVgids platform type: '+owner
        return tuple(p for p in (cls[1], *self.sdk.interfaces(owner)) if p)

    def defaults(self, value):
        owner = value.descriptor
        while owner in self.declarations.classes:
            for line in self.source.text(owner).splitlines():
                if not line.startswith('.field ') or 'static' in line.split():
                    continue
                match = re.search(r' ([^ ]+):([^ ]+)(?: |$)', line)
                assert match
                value.value.setdefault(owner+'->'+match[1]+':'+match[2], 0)
            owner = self.declarations.classes[owner].superclass
        return value

    def new(self, owner, fields=None):
        value = self.defaults(Reference({}, owner))
        value.value.update(fields or {})
        return value

    def run(self, owner, signature, args):
        assert (owner, signature) in self.rows, 'Unpinned TVgids Android execution'
        body = self.source.body(owner, signature)
        local = int(re.search(r'\.locals (\d+)', body)[1])
        program = canonical(body).program
        program.instructions = [absolute_registers(line, local) for line in program.instructions]
        registers = {'v'+str(local+i): value for i, value in enumerate(args)}

        def trace(line):
            audit_call(line, owner, self.declarations, self.sdk)

        return execute(program, registers, self.invoke, memory=self.memory, trace=trace)

    def invoke(self, target, args):
        owner, signature = target.split('->', 1)
        if (owner, signature) in self.native:
            return self.run(owner, signature, args)
        if target == 'Ljava/lang/Object;-><init>()V':
            self.defaults(args[0])
            return None
        if target == 'Ljava/lang/Object;->getClass()Ljava/lang/Class;':
            if is_zero(args[0]):
                raise VmThrown(Reference({}, 'Ljava/lang/NullPointerException;'))
            return Reference({}, 'Ljava/lang/Class;')
        if target == 'Ljava/lang/String;->hashCode()I':
            value = 0
            for character in args[0]:
                value = (31*value+ord(character)) & 0xffffffff
            return value if value < 0x80000000 else value-0x100000000
        if target == 'Ljava/lang/String;->equals(Ljava/lang/Object;)Z':
            return int(args[0] == args[1])
        if target == 'Ljava/lang/String;->length()I':
            return len(args[0])
        if target == 'Ljava/lang/Object;->toString()Ljava/lang/String;':
            assert isinstance(args[0], str), 'Expected native loadAd argument string'
            return args[0]
        if target == 'Lyl5;->r(ILjava/lang/String;)Ljava/lang/String;':
            return args[1]+str(args[0])
        if target == 'Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V':
            args[0].value.update(context=args[1], children=[])
            return None
        if target == 'Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V':
            args[0].value['context'] = args[1]
            return None
        if target == 'Landroid/view/ViewGroup$LayoutParams;-><init>(II)V':
            args[0].value.update(width=args[1], height=args[2])
            return None
        if target == 'Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V':
            args[0].value['layout'] = args[1]
            return None
        if target == 'Landroid/widget/LinearLayout;->setGravity(I)V':
            args[0].value['gravity'] = args[1]
            return None
        if target in ('Landroid/view/ViewGroup;->addView(Landroid/view/View;)V', 'Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V'):
            args[0].value['children'].append(args[1])
            return None
        if target == 'Landroid/view/ViewGroup;->removeAllViews()V':
            args[0].value['children'].clear()
            return None
        if target == 'Landroid/view/ViewGroup;->getChildCount()I':
            return len(args[0].value['children'])
        if target == 'Landroid/view/ViewGroup;->removeViewAt(I)V':
            del args[0].value['children'][args[1]]
            return None
        if target == 'Landroid/view/ViewGroup;->setOnHierarchyChangeListener(Landroid/view/ViewGroup$OnHierarchyChangeListener;)V':
            args[0].value['listener'] = args[1]
            return None
        if target == 'Lmn3;-><init>(Li20;Ljava/lang/String;)V':
            args[0].value.update(messenger=args[1], channel=args[2])
            return None
        if target == 'Lmn3;->b(Lkn3;)V':
            args[0].value['handler'] = args[1]
            return None
        if target == 'Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;':
            return Reference({}, 'Landroid/os/Looper;')
        if target == 'Landroid/os/Handler;-><init>(Landroid/os/Looper;)V':
            args[0].value.update(looper=args[1], queue=[])
            return None
        if target == 'Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z':
            assert len(args) == 4 and args[3] == 0, 'Unexpected delay register ABI'
            args[0].value['queue'].append((args[1], args[2]))
            self.events.append(('scheduled', args[2]))
            return 1
        if target == 'Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V':
            args[0].value['queue'][:] = [q for q in args[0].value['queue'] if q[0] is not args[1]]
            return None
        if target == 'Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V':
            assert is_zero(args[1]), 'Expected own-handler cancellation'
            args[0].value['queue'].clear()
            return None
        if target == 'Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;':
            assert args[1] == 'filterEvents' and args[1] not in args[0].value, 'Unexpected JSON array fixture'
            return None
        if target == 'Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;':
            value = args[0].value.get(args[1])
            return None if value is None else Reference(value, 'Lorg/json/JSONObject;')
        if target == 'Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;':
            return args[0].value.get(args[1], '')
        if target == 'Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z':
            return int(args[0].value.get(args[1], False))
        if target == 'Ljw1;->success(Ljava/lang/Object;)V':
            args[0].value['results'].append(('success', args[1]))
            return None
        if target == 'Ljw1;->notImplemented()V':
            args[0].value['results'].append(('notImplemented',))
            return None
        if owner == ACTIVITY and signature == FACTORY:
            assert args[0].descriptor == ACTIVITY and args[4].descriptor == VIEW
            self.events.append(('ad factory admission',))
            view = self.new('Landroid/widget/LinearLayout;')
            view.value['children'] = []
            return view
        if owner == 'Lqj2;' and signature.startswith('<init>('):
            self.events.append(('ad SDK startup',))
            return None
        if target == 'Landroid/app/Activity;->getApplication()Landroid/app/Application;':
            return self.new('Landroid/app/Application;')
        if owner == 'Lyo0;' and signature == 'y(Lrt1;)V':
            self.events.append(('Flutter plugins',))
            return None
        if owner == 'Lyn8;' and signature.startswith('<init>(Lnl/tvgids/MainActivity;'):
            self.events.append(('OSB bridge',))
            return None
        if target == 'Lst1;->a(Ljava/lang/String;Lfd4;)Z':
            self.events.append(('platform view registration', args[1]))
            return 1
        if target == 'Lhb0;->E(Lot0;)V':
            self.events.append(('functional dispatch',))
            return None
        if target == 'Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I':
            return 0
        if owner in ('Ljava/util/ArrayList;', 'Lbe/persgroep/advertising/banner/config/Platform;', 'Lrx4;', 'Lxa;', 'Lva;', 'Lxp4;') and signature.startswith('<init>('):
            return None
        raise AssertionError('Unmodeled TVgids Android boundary: '+target)


def verify_ad_views(source, declarations, sdk, hidden):
    failures = []

    def check(value, want, name):
        if value != want:
            failures.append(f'{name}: observed {value!r}, expected {want!r}')

    for payload in (None, {}, {'compatibility': {'nativeVideo': True}},
                    {'config': 'bounded fixture ad', 'compatibility': {'nativeVideo': True}}):
        fixture = AdViewFixture(source, declarations, sdk)
        view = fixture.new(VIEW)
        context, activity, messenger = (fixture.new(t) for t in ('Landroid/content/Context;', ACTIVITY, 'Lkt8;'))
        config = None if payload is None else Reference(payload, 'Lorg/json/JSONObject;')
        fixture.run(VIEW, CTOR, [view, context, 7, config, messenger, activity])
        container = fixture.run(VIEW, 'getView()Landroid/view/View;', [view])
        check(container.descriptor, 'Landroid/widget/LinearLayout;', 'platform view remains valid')
        check(view.value[VIEW+'->d:Lmn3;'].value['channel'], 'tvgids/ad_7', 'channel identity retained')
        scheduled = len(view.value[VIEW+'->j:Landroid/os/Handler;'].value['queue'])
        check(scheduled, 0 if hidden or not payload or not payload.get('config') else 1, 'constructor scheduling')
        check(len(container.value['children']), 0 if hidden or not payload else 1, 'native video overlay')
        for name in ('loadAd', 'onScroll', 'disposeAd', 'unsupported'):
            handler = view.value[VIEW+'->j:Landroid/os/Handler;']
            handler.value['queue'].clear()
            call = fixture.new('Lin3;', {'Lin3;->a:Ljava/lang/String;': name, 'Lin3;->b:Ljava/lang/Object;': 'fixture ad'})
            result = fixture.new('Ljw1;', {'results': []})
            fixture.run(VIEW, METHOD, [view, call, result])
            check(result.value['results'], [('notImplemented',)] if name == 'unsupported' else [('success', 0)], name+' replies once')
            check(len(handler.value['queue']), 0 if hidden or name != 'loadAd' else 1, name+' scheduling')
        pending = fixture.new('Lua;')
        fixture.run('Lua;', RUNNABLE, [pending, 0, view, 'fixture ad'])
        handler = view.value[VIEW+'->j:Landroid/os/Handler;']
        handler.value['queue'][:] = [(pending, 50)]
        view.value[VIEW+'->l:Lua;'] = pending
        fixture.run(VIEW, 'dispose()V', [view])
        check(len(handler.value['queue']), 0 if hidden else 1, 'dispose cancels own pending work')
        check(view.value[VIEW+'->d:Lmn3;'].value['handler'], 0, 'dispose unregisters channel')
        fixture.run('Lua;', 'run()V', [pending])
        check(sum(e[0] == 'ad factory admission' for e in fixture.events), 0 if hidden else 1, 'late Runnable admission')
        other = fixture.new('Lua;')
        fixture.run('Lua;', RUNNABLE, [other, 99, fixture.new('Lhb0;'), fixture.new('Lw92;')])
        fixture.run('Lua;', 'run()V', [other])
        check(fixture.events[-1], ('functional dispatch',), 'merged non-ad Runnable retained')
    for plugins_ready in (0, 1):
        fixture = AdViewFixture(source, declarations, sdk)
        state = fixture.new('Lnt1;', {'Lnt1;->g:Z': plugins_ready})
        fragment = fixture.new('Lbv1;', {'Lbv1;->X:Lnt1;': state})
        activity = fixture.new(ACTIVITY, {'Lcv1;->a:Lbv1;': fragment})
        messenger = fixture.new('Lkt8;')
        binding = fixture.new('Lzw0;', {'Lzw0;->f:Ljava/lang/Object;': messenger})
        registry = fixture.new('Lst1;')
        platform = fixture.new('Lio/flutter/plugin/platform/c;', {'Lio/flutter/plugin/platform/c;->a:Lst1;': registry})
        engine = fixture.new('Lrt1;', {'Lrt1;->c:Lzw0;': binding, 'Lrt1;->s:Lio/flutter/plugin/platform/c;': platform})
        fixture.run(ACTIVITY, 'c(Lrt1;)V', [activity, engine])
        check(sum(e[0] == 'ad SDK startup' for e in fixture.events), 0 if hidden else 1, 'ad SDK startup')
        check(sum(e[0] == 'Flutter plugins' for e in fixture.events), 0 if plugins_ready else 1, 'Flutter plugin registration')
        check(sum(e[0] == 'OSB bridge' for e in fixture.events), 1, 'shared bridge registration')
        check(sum(e == ('platform view registration', 'tvgids/ad') for e in fixture.events), 1, 'platform view factory registration')
    assert not failures, '\n'.join(failures)
    print('PASS TVgids native ad view: constructor/load/dispose/late-runnable/channel contracts')
