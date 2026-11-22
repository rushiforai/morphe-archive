// Exercises DAT decoding and the native reply preview with notification NG disabled.
Java.perform(() => {
    const prefix = 'app.morphe.extension.chmate.';
    const app = Java.use('android.app.ActivityThread').currentApplication();
    if (!/\.haiagaru\.reporter(191|226|242)$/.test(String(app.getPackageName())))
        throw Error('Use an isolated reporter package');
    const Watch = Java.use(prefix + 'ThreadWatch');
    const NativeWatch = Java.use(prefix + 'ThreadWatchNative');
    const Frame = Java.use(prefix + 'ThreadWatchNative$Frame');
    const Target = Java.use(prefix + 'ThreadWatchRules');
    const Text = Java.use(prefix + 'NotificationDatText');
    const Switches = Java.use(prefix + 'FeatureSwitches');
    const File = Java.use('java.io.File');
    const Output = Java.use('java.io.FileOutputStream');
    const JString = Java.use('java.lang.String');
    const message = '育成落ち 7 引退 2 佐藤 1 戦力外 3';
    const url = 'https://egg.5ch.io/test/read.cgi/android/1799999987/';
    const prefs = Switches.prefs(app);
    const watch = Watch.prefs(app);
    const key = 'suppressNgReplyNotifications';
    const wasEnabled = prefs.getBoolean(key, true), hadSetting = prefs.contains(key);
    const saved = watch.getString(url, null);
    const dat = File.createTempFile('haiagaru-frida-reply-', '.dat', app.getCacheDir());
    let checks = 0;
    function check(ok, label) {
        if (!ok) throw Error(label);
        checks++;
        send('PASS ' + label);
    }
    try {
        for (const charset of ['MS932', 'EUC-JP', 'UTF-8']) {
            const actual = Text.decode(JString.$new(message).getBytes(charset), 'UTF-8');
            check(String(actual) === message, 'correct Japanese with ' + charset + ' DAT');
        }
        watch.edit().putString(url, '{"own":[1]}').commit();
        prefs.edit().putBoolean(key, false).commit();
        const stream = Output.$new(dat);
        try {
            stream.write(JString.$new('own<><>2026/11/21 ID:owner123<>original<>確認\n'
                + 'reply<><>2026/11/21 ID:other123<>&gt;&gt;1 ' + message + '<>\n').getBytes('MS932'));
        } finally { stream.close(); }
        const frame = Frame.$new(Target.target(url), 'fixture', dat, 1);
        const replies = NativeWatch.replies(frame, app);
        check(replies !== null && String(replies.toString()) === '[2]', 'native reply candidate with NG suppression off');
        check(String(frame.preview.value) === '>>2 ' + message, 'native reply preview uses the decoded Japanese body');
        send({stage:'reply-notification-text',checks,publicPosts:0});
    } finally {
        if (hadSetting) prefs.edit().putBoolean(key, wasEnabled).commit();
        else prefs.edit().remove(key).commit();
        if (saved === null) watch.edit().remove(url).commit();
        else watch.edit().putString(url, saved).commit();
        dat.delete();
    }
});
