rpc.exports.test = () => new Promise(resolve => Java.perform(() => {
    let preferences, hadSetting, oldSetting, hidden, previousRows;
    const settingKey = 'excludeHiddenNgUnread';
    const threadKey = 'fixture.invalid/board/1999999988';
    try {
        const application = Java.use('android.app.ActivityThread').currentApplication();
        if (!/\.haiagaru\.reporter(?:191|226|242)$/.test(String(application.getPackageName())))
            throw Error('Use an isolated reporter package');
        preferences = application.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config', 0);
        hadSetting = preferences.contains(settingKey);
        oldSetting = preferences.getBoolean(settingKey, false);
        const unread = Java.use('app.morphe.extension.chmate.HiddenNgUnread');
        const hiddenField = unread.class.getDeclaredField('HIDDEN');
        hiddenField.setAccessible(true);
        hidden = Java.cast(hiddenField.get(null), Java.use('java.util.Map'));
        previousRows = hidden.get(threadKey);
        const rows = Java.use('java.util.HashSet').$new();
        rows.add(Java.use('java.lang.Integer').valueOf(21));
        rows.add(Java.use('java.lang.Integer').valueOf(22));
        hidden.put(threadKey, rows);
        const effects = Java.use('app.morphe.extension.chmate.SettingsEffects');
        let checks = 0;
        for (const enabled of [true, false, true]) {
            preferences.edit().putBoolean(settingKey, enabled).commit();
            effects.changed(application, settingKey, enabled);
            const retained = hidden.get(threadKey);
            if (retained === null || !rows.equals(retained)) throw Error('Setting change discarded hidden-NG membership');
            checks++;
        }
        if (Number(unread.subtract(22, 20, rows)) !== 20) throw Error('Hidden-only unread count was not zero');
        checks++;
        if (Number(unread.subtract(23, 20, rows)) !== 21) throw Error('Visible unread response was excluded');
        checks++;
        resolve({passed: checks, nativeHistoryChanged: false, networkRequests: 0});
    } catch (error) {
        resolve({error: String(error)});
    } finally {
        if (hidden) {
            if (previousRows !== null && previousRows !== undefined) hidden.put(threadKey, previousRows);
            else hidden.remove(threadKey);
        }
        if (preferences) {
            const edit = preferences.edit();
            if (hadSetting) edit.putBoolean(settingKey, oldSetting);
            else edit.remove(settingKey);
            edit.commit();
        }
    }
}));
