"""Behavioral fixtures for Rollerbank's emitted En Route initialization and queue gate."""
import re
import xml.etree.ElementTree as ET

from rtl_vm import Memory, Reference, execute, parse
from verify_dumpert import Smali

ROUTE = 'Lcom/dennisk/rollerbank/ui/ActivityRoute;'
SERVICE = 'Lcom/dennisk/rollerbank/model/RouteService;'
HELPER = 'morphePrepareEnRoute'
HELPER_SIGNATURE = HELPER + '(' + ROUTE + ')V'
GATE = 'morpheCanStartEnRoute'
GATE_SIGNATURE = GATE + '(' + ROUTE + ')Z'
CALLBACK_SIGNATURE = 'onRequestPermissionsResult(I[Ljava/lang/String;[I)V'
REQUESTED = ROUTE + '->morpheNotificationRequested:Z'
PENDING = ROUTE + '->morpheNotificationPending:Z'
MARKER = 'morphe_en_route_static_defaults_v1'
STATIC_KEY = 'route_static_push_status'
PERMISSION = 'android.permission.POST_NOTIFICATIONS'
ANDROID = '{http://schemas.android.com/apk/res/android}'


def run_initializer(body, preferences, sdk, granted):
    """Model only Android preferences/permission APIs; reject every other call."""
    activity = Reference({}, ROUTE)
    prefs = Reference(preferences, 'Landroid/content/SharedPreferences;')
    editor = Reference({}, 'Landroid/content/SharedPreferences$Editor;')
    requests, writes = [], []

    def invoke(method, args):
        if method == 'Landroidx/preference/c;->a(Landroid/content/Context;)Landroid/content/SharedPreferences;':
            assert args == [activity]
            return prefs
        if method == 'Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z':
            assert args[0] is prefs and args[1] == MARKER and args[2] == 0
            return preferences.get(args[1], args[2])
        if method == 'Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;':
            assert args == [prefs]
            return editor
        if method == 'Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;':
            assert args[0] is editor and args[1] in {MARKER, STATIC_KEY} and args[2] == 1
            editor.value[args[1]] = args[2]
            return editor
        if method == 'Landroid/content/SharedPreferences$Editor;->apply()V':
            assert args == [editor] and editor.value == {STATIC_KEY: 1, MARKER: 1}
            preferences.update(editor.value)
            writes.append(dict(editor.value))
            return None
        if method == 'Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I':
            assert args == [activity, PERMISSION]
            return 0 if granted else -1
        if method == 'Landroid/app/Activity;->requestPermissions([Ljava/lang/String;I)V':
            assert args[0] is activity and args[1].descriptor == '[Ljava/lang/String;'
            assert args[1].value == [PERMISSION] and args[2] == 0x6d52
            requests.append(tuple(args[1].value))
            return None
        raise AssertionError('Unexpected En Route initializer API: ' + method)

    execute(parse(body), {'p0': activity}, invoke,
            memory=Memory(statics={'Landroid/os/Build$VERSION;->SDK_INT:I': sdk}))
    return requests, writes


def verify_initializer(body):
    for initial in ({}, {STATIC_KEY: 0}, {STATIC_KEY: 1}):
        prefs = dict(initial)
        requests, writes = run_initializer(body, prefs, 33, False)
        assert prefs == {STATIC_KEY: 1, MARKER: 1} and len(writes) == 1, 'First entry enables static warnings once'
        assert not requests, 'Initialization must not overlap native location rationale with notification permission'
        prefs[STATIC_KEY] = 0
        requests, writes = run_initializer(body, prefs, 33, True)
        assert prefs[STATIC_KEY] == 0 and not writes and not requests, 'Later user disabling must survive re-entry'
    for sdk, granted in [(32, False), (32, True), (33, True), (36, True)]:
        prefs = {MARKER: 1, STATIC_KEY: 0}
        requests, writes = run_initializer(body, prefs, sdk, granted)
        assert prefs == {MARKER: 1, STATIC_KEY: 0} and not writes and not requests, 'Permission/version or migration guard failed'
    requests, writes = run_initializer(body, {MARKER: 1, STATIC_KEY: 1}, 36, False)
    assert not requests and not writes


def run_notification_gate(body, state, sdk, granted):
    requests = []
    def invoke(method, args):
        if method == 'Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I':
            assert args == [state, PERMISSION]
            return 0 if granted else -1
        if method == 'Landroid/app/Activity;->requestPermissions([Ljava/lang/String;I)V':
            assert args[0] is state and args[1].value == [PERMISSION] and args[2] == 0x6d52
            assert state.value == {REQUESTED: 1, PENDING: 1}, 'Mark the prompt pending before opening it'
            requests.append(tuple(args[1].value))
            return None
        raise AssertionError('Unexpected notification gate API: ' + method)
    ready = execute(parse(body), {'p0': state}, invoke,
                    memory=Memory(statics={'Landroid/os/Build$VERSION;->SDK_INT:I': sdk}))
    return ready, requests


def verify_notification_flow(gate, callback):
    for sdk, granted in [(32, False), (32, True), (33, True), (36, True)]:
        state = Reference({REQUESTED: 0, PENDING: 0}, ROUTE)
        ready, requests = run_notification_gate(gate, state, sdk, granted)
        assert ready == 1 and not requests, 'Already permitted or pre-33 route must start normally'
    for decision in (False, True):
        state = Reference({REQUESTED: 0, PENDING: 0}, ROUTE)
        ready, requests = run_notification_gate(gate, state, 33, False)
        assert ready == 0 and requests == [(PERMISSION,)], 'Prompt must postpone service startup'
        ready, requests = run_notification_gate(gate, state, 33, decision)
        assert ready == 0 and not requests, 'An outstanding prompt must not start service or request twice'
        starts, forwarded = [], []
        def invoke(method, args):
            if method == ROUTE + '->r()V':
                assert args == [state]
                ready, requests = run_notification_gate(gate, state, 33, decision)
                assert ready == 1 and not requests, 'Both grant and denial must resume without looping'
                starts.append(True)
                return None
            if method == 'Lyj;->' + CALLBACK_SIGNATURE:
                forwarded.append(args)
                return None
            raise AssertionError('Unexpected permission callback API: ' + method)
        permissions = Reference([PERMISSION], '[Ljava/lang/String;')
        results = Reference([0 if decision else -1], '[I')
        execute(parse(callback), {'p0': state, 'p1': 0x6d52, 'p2': permissions, 'p3': results}, invoke)
        assert starts == [True] and not forwarded and state.value == {REQUESTED: 1, PENDING: 0}
        starts.clear()
        execute(parse(callback), {'p0': state, 'p1': 100, 'p2': permissions, 'p3': results}, invoke)
        assert not starts and forwarded == [[state, 100, permissions, results]], 'Preserve inherited native permission callbacks'
        # Android can recreate the activity while its permission prompt is open.
        state.value = {REQUESTED: 0, PENDING: 0}
        execute(parse(callback), {'p0': state, 'p1': 0x6d52, 'p2': permissions, 'p3': results}, invoke)
        assert starts == [True] and state.value == {REQUESTED: 1, PENDING: 0}, 'Recreated denial callback must not re-prompt'


def verify_queue_gate(body):
    program = parse(body)
    assert program.instructions[0] == 'const/4 v0, 0x1', 'Notifications must not wait for TTS initialization'
    assert program.instructions[32:34] == [f'iget-boolean v4, p0, {SERVICE}->i:Z', 'and-int/2addr v3, v4'], 'Only speech waits for TTS'
    boundary = 34
    assert program.instructions[boundary].startswith('if-eqz v2, ')
    for ready in (0, 1):
        for sound in (0, 1):
            for speech in (0, 1):
                queue = Reference([Reference({}, 'Lnl2;')], 'Ljava/util/LinkedList;')
                prefs = Reference({}, 'Lu34;')
                resources = Reference({}, 'Landroid/content/res/Resources;')
                service = Reference({f'{SERVICE}->i:Z': ready, f'{SERVICE}->j:Z': 1,
                                     f'{SERVICE}->g:Ljava/util/LinkedList;': queue,
                                     f'{SERVICE}->b:Lu34;': prefs}, SERVICE)
                def invoke(method, args):
                    if method == 'Ljava/util/Collection;->isEmpty()Z':
                        assert args == [queue]
                        return int(not queue.value)
                    if method == 'Ljava/util/LinkedList;->poll()Ljava/lang/Object;':
                        assert args == [queue]
                        return queue.value.pop(0)
                    if method == 'Landroid/content/Context;->getResources()Landroid/content/res/Resources;':
                        assert args == [service]
                        return resources
                    if method == 'Landroid/content/res/Resources;->getBoolean(I)Z':
                        assert args[0] is resources and args[1] in {0x7f050009, 0x7f05000a}
                        return 1
                    if method == 'Lu34;->b(IZ)Z':
                        assert args[0] is prefs and args[1] in {0x7f1402b2, 0x7f1402b3}
                        return sound if args[1] == 0x7f1402b2 else speech
                    raise AssertionError('Unexpected queue gate API: ' + method)
                registers = {'p0': service}
                stopped = execute(program, registers, invoke, stop_at=(boundary,))
                assert stopped == boundary and not queue.value, 'Ready alert must leave the queue even without TTS'
                assert service.value[f'{SERVICE}->j:Z'] == 0
                assert registers['v2'] == sound and registers['v3'] == (speech & ready), 'Sound/speech availability differs'


def verify_route(root, enabled):
    """Validate emitted helpers and route resources; original graphs are checked by the caller."""
    smali = Smali(root)
    route = smali.text(ROUTE)
    assert (HELPER + '(' in route) == enabled, 'En Route helper selection'
    value = re.search(r'^\.field public static j:Z(?: = (true|false))?$', route, re.M)
    assert value and (value[1] or 'false') == str(enabled).lower(), 'Local route access flag'
    layout = ET.parse(root / 'res/layout/activity_main.xml').getroot()
    button = [n for n in layout.iter() if n.get(ANDROID + 'id', '').endswith('/open_route')]
    assert len(button) == 1 and button[0].get(ANDROID + 'visibility') == ('visible' if enabled else 'gone'), 'Route button selection'
    default = [n for n in ET.parse(root / 'res/values/bools.xml').getroot() if n.get('name') == 'route_default_static_push_status']
    assert len(default) == 1 and default[0].text == str(enabled).lower(), 'Static warning default selection'
    if not enabled:
        return
    init = parse(smali.body(ROUTE, 'onCreate(Landroid/os/Bundle;)V')).instructions
    assert init[0].startswith('invoke-super ') and init[1] == f'invoke-static {{p0}}, {ROUTE}->{HELPER_SIGNATURE}', 'Initializer must follow native super.onCreate'
    callback = parse(smali.body(ROUTE, 'f(Lcom/android/billingclient/api/Purchase;)V')).instructions
    assert callback[0] == 'return-void', 'Purchase callbacks must not close local route access'
    helper = smali.body(ROUTE, HELPER_SIGNATURE)
    assert re.search(r'^\.method public static ' + re.escape(HELPER_SIGNATURE) + r'$', route, re.M)
    assert re.search(r'\.locals 4\b', helper), 'Initializer requires its own four local registers'
    verify_initializer(helper)
    for name in ('morpheNotificationRequested', 'morpheNotificationPending'):
        assert re.search(r'^\.field private ' + name + r':Z$', route, re.M), 'Per-activity notification request state'
    start = parse(smali.body(ROUTE, 'r()V')).instructions
    assert start[0] == f'invoke-static {{p0}}, {ROUTE}->{GATE_SIGNATURE}'
    assert start[1] == 'move-result v0' and start[2].startswith('if-nez v0, ') and start[3] == 'return-void', 'Service waits for notification decision after native location gates'
    assert start[4] == f'iget-object v0, p0, {ROUTE}->b:Landroid/content/Intent;'
    verify_notification_flow(smali.body(ROUTE, GATE_SIGNATURE), smali.body(ROUTE, CALLBACK_SIGNATURE))
    verify_queue_gate(smali.body(SERVICE, 'b()V'))
