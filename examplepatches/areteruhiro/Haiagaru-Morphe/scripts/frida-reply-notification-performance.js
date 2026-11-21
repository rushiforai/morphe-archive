'use strict';

Java.perform(() => {
    const p = 'app.morphe.extension.chmate.';
    const app = Java.use('android.app.ActivityThread').currentApplication();
    if (!/\.haiagaru\.reporter(191|226|242)$/.test(String(app.getPackageName())))
        throw new Error('Isolated reporter package required');

    const Watch = Java.use(p + 'ThreadWatchNative');
    const Frame = Java.use(p + 'ThreadWatchNative$Frame');
    const Rules = Java.use(p + 'ThreadWatchRules');
    const File = Java.use('java.io.File');
    const JString = Java.use('java.lang.String');
    const Output = Java.use('java.io.FileOutputStream');
    const SystemClock = Java.use('android.os.SystemClock');
    const prefs = Java.use(p + 'FeatureSwitches').prefs(app);
    const watchPrefs = Java.use(p + 'ThreadWatch').prefs(app);
    const suppress = 'suppressNgReplyNotifications';
    const chain = 'suppressChainedNgReplyNotifications';
    const previous = [suppress, chain].map(k => [k, prefs.contains(k), prefs.getBoolean(k, false)]);
    const file = File.createTempFile('reply-notify-frida', '.dat', app.getCacheDir());
    const observations = [];
    const check = (pass, label) => { if (!pass) throw new Error(label); };

    try {
        for (const [host, board] of [['bbs.eddibb.cc', 'liveedge'], ['bbs.punipuni.eu', 'vaporeon']]) {
            const url = 'https://' + host + '/test/read.cgi/' + board + '/1000000042/';
            const target = Rules.target(url);
            check(target !== null, 'target ' + host);
            const saved = watchPrefs.getString(url, null);
            const boardKey = Java.use(p + 'ThreadWatchOwnPosts').board(app, target);
            const root = Java.use(p + 'HaiagaruSyncSnapshot').externalRoot(app);
            const directory = File.$new(root, 'dat');
            directory.mkdirs();
            const indexFile = File.$new(directory, boardKey + '_1000000042.idx');
            check(!indexFile.exists(), 'fixture index already exists');
            const write = (path, text) => {
                const output = Output.$new(path);
                try { output.write(JString.$new(text).getBytes('UTF-8')); }
                finally { output.close(); }
            };
            try {
                watchPrefs.edit().putString(url, '{"own":[1]}').commit();
                for (const count of [5, 1000]) {
                    const history = Array.from({length: count}, (_, index) =>
                        'fixture<><>2026/11/21 ID:frida' + index + '<>本文 <b>' + index + '</b><>\n').join('');
                    for (const mode of ['no-reply', 'reply', 'direct-ng', 'chain', 'off']) {
                        prefs.edit().putBoolean(suppress, mode !== 'off').putBoolean(chain, mode === 'chain').commit();
                        const next = mode === 'no-reply' ? '独立レス' : '&gt;&gt;1 &gt;&gt;2 返信';
                        const text = history + 'fixture<><>2026/11/21 ID:fridaReply<>' + next + '<>\n';
                        write(indexFile, '{}\n1:1,2:8' + (mode === 'direct-ng' || mode === 'off' ? ',' + (count + 1) + ':8' : '') + '\n');
                        write(file, text);
                        const frame = Frame.$new(target, '', file, count);
                        const start = SystemClock.elapsedRealtimeNanos();
                        const replies = Watch.replies(frame, app);
                        const elapsedMs = (SystemClock.elapsedRealtimeNanos() - start) / 1000000;
                        const label = host + ' ' + count + ' ' + mode;
                        if (mode === 'no-reply') check(replies === null, 'unexpected reply: ' + label);
                        else if (mode === 'direct-ng' || mode === 'chain')
                            check(replies !== null && replies.isEmpty(), 'NG not honored: ' + label);
                        else check(replies !== null && replies.size() === 1 &&
                            Java.cast(replies.iterator().next(), Java.use('java.lang.Integer')).intValue() === count + 1,
                            'reply was lost: ' + label);
                        observations.push({host, count, mode, elapsedMs});
                    }
                }
            } finally {
                indexFile.delete();
                const editor = watchPrefs.edit();
                if (saved === null) editor.remove(url); else editor.putString(url, saved);
                editor.commit();
            }
        }
        send({type:'reply-notification-result', result:'PASS', observations});
    } catch (error) {
        send({type:'reply-notification-result', result:'FAIL', error: error.stack, details: Object.getOwnPropertyNames(error), observations});
    } finally {
        const editor = prefs.edit();
        for (const [key, existed, value] of previous) {
            if (existed) editor.putBoolean(key, value); else editor.remove(key);
        }
        editor.commit();
        file.delete();
    }
});
