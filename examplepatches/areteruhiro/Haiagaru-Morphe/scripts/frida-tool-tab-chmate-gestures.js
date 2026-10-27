// Verification clones only. Uses native recognizers and native pane/close APIs;
// creates local address-form tabs (no searches/posting), then restores preferences.
Java.perform(function () {
    const app = Java.use('android.app.ActivityThread').currentApplication();
    const pkg = String(app.getPackageName());
    if (!/\.haiagaru\.(settingsfix191|resumefix226|resumefix242)$/.test(pkg))
        throw Error('Verification package required');
    Java.classFactory.loader = app.getClassLoader();
    const T = Java.use('app.morphe.extension.chmate.NativeToolTabs');
    const Layout = Java.use('app.morphe.extension.chmate.NativeToolTabSwipeLayout');
    const H = Java.use('app.morphe.extension.chmate.Haiagaru');
    const Fragment = Java.use('androidx.fragment.app.Fragment');
    const Intent = Java.use('android.content.Intent');
    const Motion = Java.use('android.view.MotionEvent');
    const Integer = Java.use('java.lang.Integer'), Boolean = Java.use('java.lang.Boolean');
    const prefs = app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config', 0);
    const native = Java.use('android.preference.PreferenceManager').getDefaultSharedPreferences(app);
    const KEY = 'nativeToolTabChMateGestures';
    const saved = prefs.getAll(), savedNative = native.getAll();
    const version = String(app.getPackageManager().getPackageInfo(pkg, 0).versionName.value);
    const v191 = version.includes('191'), v226 = version.includes('226');
    const keys = new Set(['gesture', 'gestureLength', 'gestureCloseTab', 'gestureLeftTab', 'gestureRightTab', 'gestureBack']);
    for (const key of savedNative.keySet().toArray())
        if (/^(gesture|haiagaruGesture)/.test(String(key))) keys.add(String(key));
    let host, checks = 0, dispatching = false, closes = 0, moves = 0, cancels = 0;
    const created = [];
    function check(ok, message) { if (!ok) throw Error(message); checks++; console.log('PASS ' + message); }
    function main(fn) {
        return new Promise((resolve, reject) => Java.perform(() => Java.scheduleOnMainThread(() => {
            try { resolve(fn()); } catch (error) { reject(error); }
        })));
    }
    function wait(ms) { return new Promise(resolve => setTimeout(resolve, ms)); }
    function field(object, name) {
        for (let c = object.getClass(); c !== null; c = c.getSuperclass()) {
            try { const f = c.getDeclaredField(name); f.setAccessible(true); return f.get(object); } catch (_) { }
        }
        throw Error('Missing field ' + name);
    }
    function number(object, name) { return Java.cast(field(object, name), Integer).intValue(); }
    function call(object, name) {
        const m = object.getClass().getMethod(name, Java.array('java.lang.Class', []));
        m.setAccessible(true); return m.invoke(object, Java.array('java.lang.Object', []));
    }
    function state(home) {
        const pane = v191 ? field(host, home ? 'k' : 'I') : Java.use('java.lang.reflect.Array').get(field(host, v226 ? 'r' : 'w'), home ? 0 : 1);
        if (v191) return { index: number(field(pane, 'e'), 'a'), pages: Java.cast(field(field(pane, 'd'), 'a'), Java.use('java.util.List')) };
        const model = field(pane, v226 ? 'a' : 'e');
        const s = call(field(model, v226 ? 'd' : 'e'), v226 ? 'c' : 'd');
        return { index: number(s, v226 ? 'a' : 'b'), pages: Java.cast(field(s, v226 ? 'b' : 'a'), Java.use('java.util.List')) };
    }
    function selected(home) {
        const s = state(home);
        return Java.cast(field(s.pages.get(s.index), v191 ? 'c' : v226 ? 'b' : 'd'), Fragment);
    }
    function assign(key) {
        const edit = native.edit();
        for (const k of keys) if (k !== 'gesture' && k !== 'gestureLength' &&
                (!savedNative.containsKey(k) || Integer.class.isInstance(savedNative.get(k)))) edit.putInt(k, 0);
        edit.putBoolean('gesture', true).putInt('gestureLength', 40);
        if (key) edit.putInt(key, 4);
        edit.commit();
    }
    const close = T.closeCurrentTab.overload('android.app.Activity', 'java.lang.Object');
    const move = T.moveAdjacentTool.overload('android.app.Activity', 'java.lang.Object', 'int');
    const child = Layout.dispatchChildTouchEvent.overload('android.view.MotionEvent');
    close.implementation = function (a, f) { check(!dispatching, 'close runs after touch dispatch'); closes++; return close.call(this, a, f); };
    move.implementation = function (a, f, offset) { check(!dispatching, 'tab movement runs after touch dispatch'); moves++; return move.call(this, a, f, offset); };
    child.implementation = function (event) { if (event.getActionMasked() === 3) cancels++; return child.call(this, event); };
    function swipe(fragment) {
        const view = fragment.getView(), pos = Java.array('int', [0, 0]);
        check(view !== null && view.isShown() && view.hasWindowFocus() && view.getWidth() > 200, 'tool view attached and focused');
        view.getLocationOnScreen(pos);
        const x = pos[0] + view.getWidth() * .65, y = pos[1] + view.getHeight() * .8;
        const now = Number(Java.use('android.os.SystemClock').uptimeMillis());
        dispatching = true;
        try {
            for (let i = 0; i <= 5; i++) {
                const event = Motion.obtain.overload('long', 'long', 'int', 'float', 'float', 'int')
                    .call(Motion, now, now + i * 30, i === 0 ? 0 : i === 5 ? 1 : 2, x - i * 24, y, 0);
                event.offsetLocation(-pos[0], -pos[1]);
                view.dispatchTouchEvent(event); event.recycle();
            }
        } finally { dispatching = false; }
    }
    async function open(home) {
        await main(() => {
            check(host.getWindow().getDecorView().hasWindowFocus(), 'host focused before adding fixture');
            prefs.edit().putBoolean('nativeToolTabs', home).commit();
            const launch = Intent.$new();
            launch.putExtra.overload('java.lang.String', 'boolean').call(launch, 'haiagaru.gesture.fixture', true);
            check(T.createTab(host, 'hissi', launch), 'create disposable ' + (home ? 'HOME' : 'thread') + ' tab');
            const s = state(home);
            for (let n = 0; n < s.pages.size(); n++) {
                const page = s.pages.get(n), args = T.pageArgs(page);
                if (!args || !String(args.getString('android.intent.extra.TEXT', '')).includes('haiagaru.gesture.fixture')) continue;
                const f = field(page, v191 ? 'c' : v226 ? 'b' : 'd');
                if (f && !created.some(other => other.equals(f))) created.push(Java.retain(Java.cast(f, Fragment)));
            }
        });
        for (let attempt = 0; attempt < 30; attempt++) {
            await wait(300);
            const found = await main(() => {
                const f = selected(home), args = f.getArguments(), view = f.getView();
                const data = args ? String(args.getString('_data')) : '';
                if (attempt === 0 || attempt === 29) console.log('WAIT_FIXTURE index=' + state(home).index + ' data=' + data + ' fragment=' + f.getClass().getName() + ' view=' + (view ? view.getClass().getName() + '/shown=' + view.isShown() : 'null'));
                if (!data.startsWith('haiagaru-tool://hissi?pane=' + (home ? 'home' : 'thread'))
                        || !view || !view.isShown() || view.getWidth() < 200) return null;
                console.log('FIXTURE_VIEW ' + f.getClass().getName() + ' ' + view.getClass().getName() + ' pref=' + prefs.getBoolean(KEY, false));
                return Java.retain(f);
            });
            if (found) { if (!created.some(other => other.equals(found))) created.push(found); return found; }
        }
        throw Error('New fixture tab did not become visible');
    }
    function restore(p, snapshot, names) {
        const edit = p.edit();
        for (const key of names) {
            if (!snapshot.containsKey(key)) edit.remove(key);
            else if (Boolean.class.isInstance(snapshot.get(key))) edit.putBoolean(key, Java.cast(snapshot.get(key), Boolean).booleanValue());
            else if (Integer.class.isInstance(snapshot.get(key))) edit.putInt(key, Java.cast(snapshot.get(key), Integer).intValue());
        }
        edit.commit();
    }
    function find(view, label) {
        const Text = Java.use('android.widget.TextView'), Group = Java.use('android.view.ViewGroup');
        if (Text.class.isInstance(view) && String(Java.cast(view, Text).getText()) === label) return view;
        if (Group.class.isInstance(view)) { const g = Java.cast(view, Group); for (let i = 0; i < g.getChildCount(); i++) { const found = find(g.getChildAt(i), label); if (found) return found; } }
        return null;
    }
    (async function () {
        try {
            await main(() => {
                host = Java.retain(T.manualHost(H.toolbarActivity(null)));
                check(!!host, 'tablet host available');
                check(host.getWindow().getDecorView().hasWindowFocus(), 'tablet host has window focus');
                prefs.edit().remove(KEY).commit();
                const panel = H.settingsCategory(host, 'GENERAL');
                const toggle = Java.cast(find(panel, '追加画面のタブでChMateのジェスチャーを使う'), Java.use('android.widget.Switch'));
                check(!toggle.isChecked(), 'setting defaults OFF');
                toggle.performClick(); check(prefs.getBoolean(KEY, false), 'settings toggle saves ON');
                toggle.performClick(); check(!prefs.getBoolean(KEY, true), 'settings toggle saves OFF');
                prefs.edit().putBoolean(KEY, true).commit();
                assign('gestureCloseTab');
            });
            let f = await open(false);
            await main(() => check(Layout.ownsHistoryGesture(f.getView()), 'new mode owns history before touch'));
            await main(() => { assign('gestureCloseTab'); native.edit().putBoolean('gesture', false).commit(); swipe(f); });
            await wait(250); await main(() => check(closes === 0, 'ChMate global OFF prevents close'));
            await main(() => { assign('gestureTop'); swipe(f); });
            await wait(250); await main(() => check(closes === 0 && moves === 0, 'unsupported Top is not remapped'));
            await main(() => { assign('gestureCloseTab'); prefs.edit().putBoolean(KEY, false).commit(); swipe(f); });
            await wait(250); await main(() => check(closes === 0, 'Haiagaru option OFF prevents native close'));
            await main(() => { prefs.edit().putBoolean(KEY, true).commit(); swipe(f); check(closes === 0, 'close not synchronous with UP'); });
            await wait(350); await main(() => check(closes === 1 && cancels > 0 && !f.isAdded(), 'native recognizer closes only fixture tab after CANCEL'));
            for (const home of [false, true]) {
                const first = await open(home), second = await open(home);
                const initial = await main(() => state(home).index);
                await main(() => { assign('gestureLeftTab'); swipe(second); });
                await wait(350); await main(() => check(state(home).index === initial - 1 && first.equals(selected(home)), (home ? 'HOME' : 'thread') + ' left assignment selects same-pane neighbour'));
                await main(() => { assign('gestureRightTab'); swipe(first); });
                await wait(350); await main(() => check(state(home).index === initial && second.equals(selected(home)), (home ? 'HOME' : 'thread') + ' right assignment selects same-pane neighbour'));
            }
            console.log('TOOL_TAB_CHMATE_GESTURES_COMPLETE ' + version + ' checks=' + checks);
        } catch (error) { console.log('FAIL ' + error.stack); }
        finally {
            await main(() => {
                close.implementation = null; move.implementation = null; child.implementation = null;
                for (const f of created.reverse()) T.closeCurrentTab(host, f);
                restore(prefs, saved, [KEY, 'nativeToolTabs']); restore(native, savedNative, keys);
                console.log('FIXTURE_TABS_CLOSED_AND_PREFERENCES_RESTORED');
            });
        }
    })();
});
