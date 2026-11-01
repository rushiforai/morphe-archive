"""Scoped Facebook/FCM caller execution with explicit SDK/platform boundaries.

No requests, real SDK threads or account operations run in these fixtures.
Static caches and initialized SDK state are supplied explicitly; code outside
pinned methods and declared boundaries fails, rather than counting as a stop.
"""
import re
from brabant_smali import canonical
from rtl_vm import Reference, execute
from tvgids_osb_vm import OsbFixture
from tvgids_sdk_contracts import SDK_CONTRACTS, SDK_TARGETS
from verify_dumpert import absolute_registers, audit_call

LOGGER = 'Lys;'
EVENT = SDK_TARGETS['fb_events'][1]


class SdkAdmission(Exception): pass


class SdkFixture(OsbFixture):
    def __init__(self, *args):
        super().__init__(*args)
        self.rows.update({row[:2]: row for row in SDK_CONTRACTS})
        self.native.update(SDK_TARGETS.values())
        self.native.update({('La86;', 'a()Z'), (LOGGER, 'a()Ljava/lang/String;'),
            (LOGGER, 'b()Ljava/util/concurrent/ScheduledThreadPoolExecutor;'),
            (LOGGER, 'c()Ljava/lang/Object;'), (LOGGER, '<init>(Ljava/lang/String;Ljava/lang/String;)V'),
            ('Lp2;', '<init>(Ljava/lang/String;Ljava/lang/String;)V'), ('Lms;', '<init>(I)V'),
            ('Ld;', '<init>(I)V'), ('Lom1;', '<init>(Landroid/content/Context;Ljava/lang/String;I)V'),
            ('Ltz;', '<init>(IC)V')})
        self.jobs = []; self.sdk_calls = []; self.access_token = 0
        self.remote_flags = {'auto_log_app_events_enabled': Reference(True, 'Ljava/lang/Boolean;')}
        self.memory.statics.update({
            'Lfu0;->a:Ljava/util/Set;': Reference(set(), 'Ljava/util/Set;'),
            'Lb86;->a:Lb86;': self.new('Lb86;'),
            LOGGER+'->e:Ljava/lang/Object;': self.new('Ljava/lang/Object;'),
            LOGGER+'->d:Ljava/util/concurrent/ScheduledThreadPoolExecutor;': 0,
            LOGGER+'->f:Ljava/lang/String;': 0,
            'Lns;->b:Ljava/util/concurrent/ScheduledExecutorService;': Reference({}, 'Ljava/util/concurrent/ScheduledExecutorService;'),
            'Lns;->a:Lot8;': self.new('Lot8;'),
            'Lkt1;->a:Lkt1;': self.new('Lkt1;'),
            'Lpm1;->a:Lpm1;': self.new('Lpm1;'),
            'Leu4;->b:Leu4;': self.new('Leu4;'),
            'Lgg1;->a:Lgg1;': self.new('Lgg1;'),
            'Lh30;->a:Lh30;': self.new('Lh30;'),
            'Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;': Reference('SECONDS', 'Ljava/util/concurrent/TimeUnit;'),
        })
        self.flag(True)

    def flag(self, value):
        for field in ('d', 'e', 'f'):
            self.memory.statics['Lb86;->'+field+':La86;'] = self.new('La86;', {
                'La86;->a:Z': 1, 'La86;->c:Ljava/lang/Boolean;': Reference(True if field == 'd' else bool(value), 'Ljava/lang/Boolean;')})

    def invoke(self, target, args):
        owner, sig = target.split('->', 1)
        if target == 'Ljava/util/Set;->contains(Ljava/lang/Object;)Z': return int(args[1] in args[0].value)
        if target == 'Ljava/lang/Boolean;->booleanValue()Z': return int(args[0].value)
        if target == 'Lb86;->e()V': self.sdk_calls.append('settings-cache'); return None
        if target == 'Ldo1;->c()Ljava/util/HashMap;': return Reference(self.remote_flags, 'Ljava/util/HashMap;')
        if target == 'Ljava/util/Map;->isEmpty()Z': return int(not args[0].value)
        if target == 'Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;' and isinstance(args[1], Reference):
            args[0].value.append(str(args[1].value)); return args[0]
        if target == 'Lux5;->y()V': self.sdk_calls.append('core-validation'); return None
        if target == 'Lwl2;->r()Lcom/facebook/AccessToken;': return self.access_token
        if target == 'Lcom/facebook/AccessToken;->a()Z': return 0
        if target == 'Lpm1;->b()Ljava/lang/String;': return 'fixture-app'
        if target == 'Lpm1;->a()Landroid/content/Context;': return self.context
        if target == 'Lp86;->E0(Ljava/lang/String;)Z': return int(args[0] in (0, None, ''))
        if target == 'Lxy;->c()Z': return 0
        if target == 'Lyn1;->b(Ljava/lang/String;Ljava/lang/String;Z)Z': return 0
        if target == 'Leu4;->y(Landroid/os/Bundle;Lb34;Z)Lo74;': raise SdkAdmission('event payload processing')
        if target == 'Lls;->E()Laa4;': raise SdkAdmission('persisted event read')
        if target == 'Lns;->b(Lot8;Ltz;)Ljava/util/ArrayList;': raise SdkAdmission('event request construction')
        if target == 'Lyo0;->p(Landroid/content/Context;)Lpw;': raise SdkAdmission('attribution lookup')
        if target == 'Leu4;->J(ILjava/lang/String;Ljava/util/List;)I': raise SdkAdmission('on-device install processing')
        if target == 'Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(I)V':
            args[0].value['queue'] = []; return None
        if target == 'Ljava/util/concurrent/ScheduledThreadPoolExecutor;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;':
            assert args[2:6] == [0, 0, 86400, 0] and args[6].value == 'SECONDS'
            self.jobs.append(('periodic', args[1])); return Reference({}, 'Ljava/util/concurrent/ScheduledFuture;')
        if target == 'Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V':
            self.jobs.append(('execute', args[1])); return None
        return super().invoke(target, args)

    def role(self, name, args=()):
        return self.run(*SDK_TARGETS[name], args)

    def slice(self, owner, signature, start, stop, registers):
        body = self.source.body(owner, signature)
        local = int(re.search(r'\.locals (\d+)', body)[1])
        program = canonical(body).program
        program.instructions = [absolute_registers(line, local) for line in program.instructions]
        return execute(program, registers, self.invoke, start=start, stop_at=(stop,), memory=self.memory,
            trace=lambda line: audit_call(line, owner, self.declarations, self.sdk))


def verify_facebook(f, disabled, group):
    if group == 'flags':
        for value in (False, True):
            f.flag(value)
            f.remote_flags = {'auto_log_app_events_enabled': Reference(value, 'Ljava/lang/Boolean;')}
            for name in ('fb_adid', 'fb_auto', 'fb_auto_remote'):
                args = (f.memory.statics['Lb86;->a:Lb86;'],) if name == 'fb_auto_remote' else ()
                assert f.role(name, args) == (0 if disabled else int(value))
            assert f.memory.statics['Lb86;->d:La86;'].value['La86;->a:Z'] == 1, 'Core auto-init policy changed'
    elif group == 'guid':
        for kind in ('fresh', 'stored', 'cached'):
            f.memory.statics[LOGGER+'->f:Ljava/lang/String;'] = 'fixture-cached' if kind == 'cached' else 0
            f.prefs = {'com.facebook.sdk.appEventPreferences': {'anonymousAppDeviceGUID': 'fixture-stored'}} if kind == 'stored' else {}
            before = {k: dict(v) for k, v in f.prefs.items()}; f.osb_calls.clear()
            result = f.role('fb_guid', (f.context,))
            if disabled:
                assert result == '' and not f.osb_calls and f.prefs == before
            else:
                assert result and (result.startswith('XZ') if kind == 'fresh' else result == 'fixture-'+kind)
                if kind == 'fresh': assert ('uuid',) in f.osb_calls
    elif group == 'events':
        f.memory.statics['Lh30;->b:Z'] = 0
        try: f.role('fb_events', (f.new(LOGGER), 'fixture-event', 0, f.new('Landroid/os/Bundle;'), 1, 0, 0))
        except SdkAdmission as e: assert not disabled and str(e) == 'event payload processing'
        else: assert disabled
    elif group == 'queues':
        f.jobs.clear(); f.role('fb_flush_job', (1,)); assert len(f.jobs) == (0 if disabled else 1)
        for name, args, reason in [('fb_flush', (1,), 'persisted event read'),
                ('fb_send', (1, f.new('Lot8;')), 'event request construction')]:
            try: result = f.role(name, args)
            except SdkAdmission as e: assert not disabled and str(e) == reason
            else: assert disabled and (result == 0 if name == 'fb_send' else True)
    elif group == 'install':
        for kind, reason in ((0, 'attribution lookup'), (1, 'on-device install processing')):
            runner = f.new('Lom1;', {'Lom1;->a:I': kind, 'Lom1;->b:Landroid/content/Context;': f.context,
                'Lom1;->c:Ljava/lang/String;': 'fixture-app'})
            try: f.role('fb_install', (runner,))
            except SdkAdmission as e: assert not disabled and str(e) == reason
            else: assert disabled
        # Actual settings-runner continuation after remote settings handling.
        # Its earlier settings/cache work is pinned and not executed here.
        f.jobs.clear()
        for start, stop, registers in [(138, 144, {'v7': f.context, 'v1': 'fixture-app', 'v2': 0}),
                (160, 168, {'v0': f.context, 'v1': 'fixture-app', 'v3': 1})]:
            registers['v8'] = Reference({}, 'Ljava/util/concurrent/Executor;')
            delta = int(disabled and start == 160)
            f.slice('Lxn1;', 'run()V', start+delta, stop+(1 if start == 138 else 2)*int(disabled), registers)
        assert len(f.jobs) == (0 if disabled else 2)
    elif group == 'timers':
        f.jobs.clear(); f.role('fb_timers'); assert len(f.jobs) == (0 if disabled else 1)
    elif group == 'logger':
        for logged_in in (False, True):
            f.jobs.clear(); f.memory.statics[LOGGER+'->d:Ljava/util/concurrent/ScheduledThreadPoolExecutor;'] = 0
            f.memory.statics['Lcom/facebook/AccessToken;->l:Ljava/util/Date;'] = f.new('Ljava/util/Date;')
            f.access_token = f.new('Lcom/facebook/AccessToken;', {'Lcom/facebook/AccessToken;->e:Ljava/lang/String;': 'fixture-token',
                'Lcom/facebook/AccessToken;->h:Ljava/lang/String;': 'fixture-app'}) if logged_in else 0
            logger = f.new(LOGGER)
            f.run(LOGGER, '<init>(Ljava/lang/String;Ljava/lang/String;)V', (logger, 'fixture-screen', 'fixture-app'))
            assert logger.value[LOGGER+'->a:Ljava/lang/String;'] == 'fixture-screen'
            assert logger.value[LOGGER+'->b:Lp2;'].descriptor == 'Lp2;'
            assert len(f.jobs) == (0 if disabled else 1)
    else: raise AssertionError('Unknown Facebook group')
    print('PASS Facebook', group, 'disabled' if disabled else 'original')
