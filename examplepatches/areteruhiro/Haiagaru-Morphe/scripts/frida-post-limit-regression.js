// Run against an isolated reporter APK. Exercises the shipped parser and UTF-16 counter.
Java.perform(function () {
    const app = Java.use('android.app.ActivityThread').currentApplication();
    const pkg = String(app.getPackageName());
    if (!/\.reporter(191|226|242)$/.test(pkg)) throw Error('Reporter verification build only');

    const loader = Java.classFactory.loader;
    const Rules = loader.loadClass('app.morphe.extension.chmate.PostLimitRules');
    const Source = loader.loadClass('app.morphe.extension.chmate.PostLimitSource');
    const sourceMethods = Source.getDeclaredMethods();
    let parse = null;
    for (let i = 0; i < sourceMethods.length; i++) {
        const m = sourceMethods[i], p = m.getParameterTypes();
        if (p.length === 2 && String(p[0].getName()) === 'java.lang.String' && String(p[1].getName()) === 'java.lang.String') {
            parse = m; break;
        }
    }
    if (parse === null) throw Error('PostLimitSource.parse(String,String) not found');
    parse.setAccessible(true);
    const StringClass = Java.use('java.lang.String');
    const settings = StringClass.$new('BBS_MESSAGE_COUNT=4096\nBBS_LINE_NUMBER=16');
    function value(board) {
        const result = parse.invoke(null, Java.array('java.lang.Object', [StringClass.$new(board), settings]));
        const type = result.getClass();
        function intField(name) { const f = type.getDeclaredField(name); f.setAccessible(true); return Number(String(f.get(result))); }
        function boolField(name) { const f = type.getDeclaredField(name); f.setAccessible(true); return String(f.get(result)) === 'true'; }
        return {columns: intField('columns'), columnCharacters: boolField('columnCharacters')};
    }
    const live = value('https://nova.5ch.io/livegalileo/');
    if (live.columns !== 1024 || live.columnCharacters) throw Error('livegalileo .io must resolve to 1024 bytes: ' + JSON.stringify(live));
    const alias = value('https://nova.5ch.net/livegalileo/');
    if (alias.columns !== 1024 || alias.columnCharacters) throw Error('livegalileo .net alias cap mismatch: ' + JSON.stringify(alias));
    const unrelated = value('https://nova.5ch.io/news4vip/');
    if (unrelated.columns !== 0) throw Error('per-line fallback escaped board scope: ' + JSON.stringify(unrelated));
    send('PASS shipped parser applies 1024-byte limit only to livegalileo');

    const ruleFields = Rules.getDeclaredFields();
    let measure = null;
    for (let i = 0; i < ruleFields.length; i++) if (String(ruleFields[i].getName()) === 'UTF16') {
        ruleFields[i].setAccessible(true); measure = ruleFields[i].get(null); break;
    }
    if (measure === null) throw Error('UTF16 measure not found');
    const Limit = loader.loadClass('app.morphe.extension.chmate.PostLimitRules$Limit');
    const ctors = Limit.getDeclaredConstructors(); let ctor = null;
    for (let i = 0; i < ctors.length; i++) if (ctors[i].getParameterTypes().length === 3) { ctor = ctors[i]; break; }
    if (ctor === null) throw Error('Limit constructor not found');
    ctor.setAccessible(true);
    const ResultMethods = Rules.getDeclaredMethods(); let inspect = null;
    for (let i = 0; i < ResultMethods.length; i++) {
        const m = ResultMethods[i], p = m.getParameterTypes();
        if (p.length === 3 && String(p[0].getName()) === 'java.lang.CharSequence' && String(p[2].getName()) === 'int') { inspect = m; break; }
    }
    if (inspect === null) throw Error('inspect(CharSequence,Limit,int) not found');
    inspect.setAccessible(true);
    const Integer = Java.use('java.lang.Integer');
    function measured(text, maximum) {
        const limit = ctor.newInstance(Java.array('java.lang.Object', [Integer.valueOf(maximum), StringClass.$new('文字'), measure]));
        const res = inspect.invoke(null, Java.array('java.lang.Object', [StringClass.$new(text), limit, Integer.valueOf(0)]));
        const type = res.getClass();
        function field(name) { const f = type.getDeclaredField(name); f.setAccessible(true); return Number(String(f.get(res))); }
        return {characters: field('characters'), used: field('used'), excessStart: field('excessStart')};
    }
    const one = measured('😀', 1);
    if (one.characters !== 2 || one.used !== 2 || one.excessStart !== 0) throw Error('supplementary emoji UTF-16 count / safe highlight mismatch: ' + JSON.stringify(one));
    const mixed = measured('a😀b', 2);
    if (mixed.characters !== 4 || mixed.used !== 4 || mixed.excessStart !== 1) throw Error('mixed emoji count / overflow boundary mismatch: ' + JSON.stringify(mixed));
    const exact = measured('a'.repeat(1024), 1024);
    if (exact.excessStart !== -1 || exact.used !== 1024) throw Error('1024-byte ASCII line was incorrectly marked over limit: ' + JSON.stringify(exact));
    const over = measured('a'.repeat(1025), 1024);
    if (over.excessStart !== 1024 || over.used !== 1025) throw Error('first byte beyond 1024 was not identified: ' + JSON.stringify(over));
    send('PASS shipped counter counts supplementary emoji as two, keeps highlights code-point-safe, and identifies byte 1025');
    send('DONE ' + pkg);
});
