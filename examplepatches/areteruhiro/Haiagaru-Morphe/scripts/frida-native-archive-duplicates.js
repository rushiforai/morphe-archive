'use strict';

Java.perform(() => {
    const app = Java.use('android.app.ActivityThread').currentApplication();
    const version = /\.reporter(191|226|242)$/.exec(String(app.getPackageName()));
    if (version === null) throw Error('Isolated reporter package required');
    const v = version[1];
    const File = Java.use('java.io.File');
    const URI = Java.use('android.net.Uri');
    const Output = Java.use('java.io.FileOutputStream');
    const JString = Java.use('java.lang.String');
    const Model = Java.use('jp.syoboi.a2chMate.client.BBSUrlInfo');
    const Archive = Java.use({
        191: 'o.r8lambda9_COK73qqUUFHkYp0uhRYVshnk',
        226: 'o.AndroidLogKt',
        242: 'o.GNk16'
    }[v]);
    const resolve = v === '242' ? 'b' : 'a';
    const temporary = File.createTempFile('archive-regression', '.tmp', app.getCacheDir());
    temporary.delete();
    const archive = File.$new(temporary, 'archive');
    const board = File.$new(archive, 'egg.5ch.io%2Fandroid');
    const thread = File.$new(board, 'fixture(3)[1795001234]');
    const original = File.$new(thread, 'egg.5ch.io%2Fandroid_1795001234.dat');
    const numbered = File.$new(thread, 'egg.5ch.io%2Fandroid_17950012341.dat');
    const unrelated = File.$new(thread, 'egg.5ch.io%2Fandroid_1795009876.dat');
    const empty = File.$new(thread, 'egg.5ch.io%2Fandroid_17950012342.dat');
    let checks = 0;
    function check(value, message) {
        if (!value) throw Error(message);
        checks++;
    }
    function write(file, text) {
        const output = Output.$new(file);
        try { output.write(JString.$new(text).getBytes('UTF-8')); }
        finally { output.close(); }
    }
    try {
        check(thread.mkdirs(), 'fixture directory');
        write(original, 'a<><>time<>original<>fixture\n');
        write(numbered, 'a<><>time<>newest-snapshot<>fixture\n');
        write(unrelated, 'a<><>time<>other<>fixture\n');
        write(empty, '');
        original.setLastModified(1700000000000);
        numbered.setLastModified(1700000100000);
        unrelated.setLastModified(1700000200000);
        const ctor = Archive.class.getDeclaredConstructors().find(c => {
            const types = c.getParameterTypes();
            return types.length === 2 && String(types[0].getName()) === 'java.io.File';
        });
        check(ctor !== undefined, 'native archive constructor');
        ctor.setAccessible(true);
        const nativeArchive = Java.cast(ctor.newInstance(Java.array('java.lang.Object', [thread, null])), Archive);
        const selected = nativeArchive[resolve].overload().call(nativeArchive);
        check(selected !== null && String(selected.getPath()) === String(numbered.getPath()), 'native resolver selects the newest readable copy');
        const parse = Model[v === '242' ? 'd' : 'c'].overload('java.lang.String');
        const info = parse.call(Model, URI.fromFile(selected).toString());
        check(info !== null, 'numbered archive URI parses');
        const idField = Model.class.getDeclaredField(v === '226' ? 'c' : 'e');
        idField.setAccessible(true);
        const infoNumber = idField.get(info);
        check(String(infoNumber) === '1795001234', 'numbered DAT retains original thread ID: ' + infoNumber);
        const modelUri = URI.parse(info.haiagaruNativeArchiveUrl());
        check(String(modelUri.getPath()) === String(numbered.getPath()), 'numbered DAT keeps its real local path');
        check(original.isFile() && numbered.isFile() && unrelated.isFile() && empty.isFile(), 'all copies remain on disk');
        numbered.delete();
        check(String(nativeArchive[resolve].overload().call(nativeArchive).getPath()) === String(original.getPath()), 'resolver falls back to original');
        send({type:'archive-duplicate-result', result:'PASS', checks});
    } catch (e) {
        send({type:'archive-duplicate-result', result:'FAIL', error:e.stack});
    } finally {
        for (const file of [empty, unrelated, numbered, original, thread, board, archive, temporary]) file.delete();
    }
});
