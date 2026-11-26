rpc.exports.test = () => new Promise(resolve => Java.perform(() => {
    let prefs, had, previous, app, traffic;
    try {
        app = Java.use('android.app.ActivityThread').currentApplication();
        if (!/\.haiagaru\.reporter(?:191|226|242)$/.test(String(app.getPackageName()))) throw Error('Isolated reporter only');
        prefs = app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config', 0);
        had = prefs.contains('recordAppTraffic');
        previous = prefs.getBoolean('recordAppTraffic', true);
        prefs.edit().remove('recordAppTraffic').commit();
        traffic = Java.use('app.morphe.extension.chmate.AppTrafficUsage');
        traffic.start(app);
        const contextClass = Java.use('android.content.Context').class;
        const method = traffic.class.getDeclaredMethod('enabled', Java.array('java.lang.Class', [contextClass]));
        method.setAccessible(true);
        const enabled = Java.cast(method.invoke(null, Java.array('java.lang.Object', [app])), Java.use('java.lang.Boolean')).booleanValue();
        if (enabled) throw Error('recording defaults to enabled');
        const startedField = traffic.class.getDeclaredField('started');
        startedField.setAccessible(true);
        const samplerStarted = startedField.getBoolean(null);
        if (samplerStarted) throw Error('sampler started while recording defaults to disabled');
        const counting = traffic.counting.overload('android.content.Context', 'java.lang.String', 'java.io.InputStream');
        const input = Java.use('java.io.ByteArrayInputStream').$new(Java.array('byte', [1, 2, 3]));
        const passthrough = counting.call(traffic, app, 'fixture_off', input);
        if (!passthrough.equals(input)) throw Error('off mode still wraps media streams');
        prefs.edit().putBoolean('recordAppTraffic', true).commit();
        traffic.start(app);
        if (!startedField.getBoolean(null)) throw Error('sampler did not start after explicit opt-in');
        prefs.edit().putBoolean('recordAppTraffic', false).commit();
        traffic.start(app);
        if (startedField.getBoolean(null)) throw Error('sampler remained active after disabling');
        const taskField = traffic.class.getDeclaredField('samplerTask');
        taskField.setAccessible(true);
        if (taskField.get(null) !== null) throw Error('scheduled sampler task was retained after disabling');
        resolve({defaultOff: true, samplerStopsOnDisable: true, streamCountingBypassedWhenOff: true, fixtureOnly: true, settingRestored: true});
    } catch (error) {
        resolve({error: String(error), fixtureOnly: true});
    } finally {
        if (prefs) {
            const edit = prefs.edit();
            if (had) edit.putBoolean('recordAppTraffic', previous); else edit.remove('recordAppTraffic');
            edit.commit();
        }
        if (traffic && app) traffic.start(app);
    }
}));
