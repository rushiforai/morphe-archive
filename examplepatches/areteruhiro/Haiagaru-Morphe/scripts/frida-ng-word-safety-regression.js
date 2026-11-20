// Isolated reporter packages only. Registration probes are rejected before writing; temporary valid data is removed.
setImmediate(function () { Java.perform(function () {
    var app = Java.use('android.app.ActivityThread').currentApplication();
    var pkg = app.getPackageName().toString();
    if (!/\.reporter(191|226|242)$/.test(pkg)) throw new Error('Refusing to touch a non-reporter package: ' + pkg);
    var Safety = Java.use('app.morphe.extension.chmate.NgRuleSafety');
    var Store = Java.use('app.morphe.extension.chmate.NativeNgStore');
    var ThreadNg = Java.use('app.morphe.extension.chmate.ThreadScopedNg');
    var ObjectClass = Java.use('java.lang.Object');
    var checks = 0;
    function check(value, label) { if (!value) throw new Error(label); checks++; send('PASS ' + label); }
    function field(object, name) {
        var base = Java.cast(object, ObjectClass);
        var reflected = base.getClass().getDeclaredField(name);
        reflected.setAccessible(true);
        return reflected.get(base);
    }
    var example = '.*[\\x{E000}-\\x{F8FF}\\x{10000}-\\x{FFFFF}].*';
    check(Safety.containsPrivateUseRange(example), 'reported PUA regex is detected');
    check(Safety.rejection('WORD', 'abcde', 0) !== null, 'new five-character NG word is rejected');
    check(Safety.rejection('WORD', 'abcdef', 0) === null, 'six-character NG word is accepted');
    check(Safety.rejection('ID', 'abc', 0) === null, 'short NG IDs remain allowed');
    check(Safety.rejection('NAME', 'abc', 0) === null, 'short NG names remain allowed');
    check(Safety.rejection('ID', example, 0x20) !== null, 'private-use regex is blocked for NG IDs');
    check(Safety.rejection('NAME', example, 0x20) !== null, 'private-use regex is blocked for NG names');
    Java.scheduleOnMainThread(function () {
        var store = Store.$new(app, 'WORD');
        var nativeStore = field(store, 'store');
        var idStore = Store.$new(app, 'ID'), nameStore = Store.$new(app, 'NAME');
        var before = store.entries().size();
        var forbidden = store.item(example, 0x20, Date.now(), null);
        var shortWord = store.item('abcde', 0, Date.now() + 1, null);
        var accepted = store.item('abcdef', 0, Date.now() + 2, null);
        check(ThreadNg.interceptRegistration(nativeStore, null, forbidden), 'native registration hook cancels PUA regex');
        check(ThreadNg.interceptRegistration(nativeStore, null, shortWord), 'native registration hook cancels short NG word');
        check(!ThreadNg.interceptRegistration(nativeStore, null, accepted), 'native registration hook allows six-character word');
        check(ThreadNg.interceptRegistration(field(idStore, 'store'), null, idStore.item(example, 0x20, Date.now(), null)), 'native hook blocks PUA regex in NG ID');
        check(ThreadNg.interceptRegistration(field(nameStore, 'store'), null, nameStore.item(example, 0x20, Date.now(), null)), 'native hook blocks PUA regex in NGName');
        check(!ThreadNg.interceptRegistration(field(idStore, 'store'), null, idStore.item('abc', 0, Date.now(), null)), 'native hook leaves short NG IDs alone');
        check(!ThreadNg.interceptRegistration(field(nameStore, 'store'), null, nameStore.item('abc', 0, Date.now(), null)), 'native hook leaves short NGNames alone');
        check(store.entries().size() === before, 'rejected probes never reach the native store');
        var blockedShort = false, blockedUnsafe = false;
        try { store.update(null, shortWord); } catch (_) { blockedShort = true; }
        try { store.update(null, forbidden); } catch (_) { blockedUnsafe = true; }
        check(blockedShort && blockedUnsafe, 'NativeNgStore write boundary rejects invalid entries');
        var beforeEntries = store.entries(), oldItems = Java.use('java.util.ArrayList').$new();
        for (var i = 0; i < beforeEntries.size(); i++) oldItems.add(field(beforeEntries.get(i), 'nativeItem'));
        var ngType = Java.use('java.lang.Class').forName('jp.syoboi.a2chMate.ng.NGWord', false, app.getClassLoader());
        var methods = ngType.getDeclaredMethods(), writer = null;
        for (var m = 0; m < methods.length; m++) {
            var params = methods[m].getParameterTypes();
            if (String(methods[m].getReturnType().getName()) === 'void' && params.length === 1
                    && String(params[0].getName()) === 'java.util.ArrayList') writer = methods[m];
        }
        if (writer === null) throw new Error('native NG writer not found');
        writer.setAccessible(true);
        var rawList = Java.use('java.util.ArrayList').$new();
        for (var j = 0; j < oldItems.size(); j++) rawList.add(oldItems.get(j));
        rawList.add(forbidden); rawList.add(shortWord); rawList.add(accepted);
        var migrationFlag = ThreadNg.class.getDeclaredField('unsafeRegexMigrationComplete');
        migrationFlag.setAccessible(true);
        var wasComplete = migrationFlag.getBoolean(null), fixtureWritten = false;
        function rawWrite(items) { writer.invoke(nativeStore, Java.array('java.lang.Object', [items])); }
        try {
            rawWrite(rawList); fixtureWritten = true; migrationFlag.setBoolean(null, false);
            var removed = ThreadNg.removeUnsafeRegexRules(app), after = store.entries();
            var unsafeRemaining = false, shortRemaining = false, normalRemaining = false;
            for (var k = 0; k < after.size(); k++) {
                var entry = after.get(k), flags = field(entry, 'flags'), pattern = String(field(entry, 'pattern'));
                if ((flags & 0x20) !== 0 && Safety.containsPrivateUseRange(pattern)) unsafeRemaining = true;
                if (pattern === 'abcde') shortRemaining = true;
                if (pattern === 'abcdef') normalRemaining = true;
            }
            check(removed === 1 && !unsafeRemaining, 'migration deletes an existing PUA regex');
            check(shortRemaining && normalRemaining, 'migration preserves short legacy and valid NG words');
            send('NG_WORD_SAFETY_COMPLETE ' + checks + ' checks; migration removed=' + removed);
        } finally {
            if (fixtureWritten) rawWrite(oldItems);
            migrationFlag.setBoolean(null, wasComplete);
        }
    });
}); });
