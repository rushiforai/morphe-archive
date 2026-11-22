// Use an isolated reporter APK. Remove only the temporary witness rules.
Java.perform(() => {
    const prefix = 'app.morphe.extension.chmate.';
    const app = Java.use('android.app.ActivityThread').currentApplication();
    if (!/\.haiagaru\.reporter(191|226|242)$/.test(String(app.getPackageName())))
        throw new Error('Isolated reporter required');
    const Local = Java.use(prefix + 'NgRuleSafety');
    const Shared = Java.use(prefix + 'SharedNgRules');
    const Store = Java.use(prefix + 'NativeNgStore');
    const Rule = Java.use(prefix + 'SharedNgRules$Rule');
    const ArrayList = Java.use('java.util.ArrayList');
    const regex = '[\\x{E000}-\\x{F8FF}](?=HaiagaruFixture' + Date.now() + ')';
    let checks = 0;
    function check(value, label) {
        if (!value) throw new Error(label);
        checks++;
        send('PASS ' + label);
    }
    Java.scheduleOnMainThread(() => {
        check(Local.rejection('WORD', '短') === null, 'personal word can be one character');
        check(Local.rejection('WORD', ' ') !== null, 'blank personal word rejected');
        check(!Shared.shareableCondition('keyword', '短い単語', false), 'short keyword excluded from sharing');
        check(!Shared.shareableCondition('keyword', 'abcde', false), 'Latin-only keyword excluded from sharing');
        check(Shared.shareableCondition('keyword', '短い単語例', false), 'eligible five-character shared word retained');
        const remote = Rule.$new('a'.repeat(64), '*', 'name', '[\\x{E000}-\\x{F8FF}]', '', 1, false, 1, 0, true);
        check(!remote.expressionMatches('\uE000'), 'legacy private-use expression from shared feed ignored');
        for (const [category, kind] of [['ID', 'id'], ['NAME', 'name'], ['WORD', 'keyword']]) {
            check(Local.rejection(category, regex) === null, category + ' permits valid personal regex');
            check(!Shared.shareableCondition(kind, regex, true), kind + ' private-use regex excluded from sharing');
            const store = Store.$new(app, category);
            const witness = store.item(regex, 0x20, Date.now(), null);
            function field(name) {
                const member = Store.class.getDeclaredField(name);
                member.setAccessible(true);
                return member.get(store);
            }
            const Method = Java.use('java.lang.reflect.Method');
            const native = field('store');
            const snapshot = Java.cast(field('snapshot'), Method);
            const writer = Java.cast(field('save'), Method);
            const before = Java.cast(snapshot.invoke(native, Java.array('java.lang.Object', [])), ArrayList);
            const saved = ArrayList.$new();
            for (let index = 0; index < before.size(); index++) {
                const row = before.get(index);
                if (row !== null && !String(row.toString()).includes('(?=HaiagaruFixture')) saved.add(row);
            }
            function restore() { writer.invoke(native, Java.array('java.lang.Object', [saved])); }
            if (saved.size() !== before.size()) restore();
            try {
                store.updateAndVerify(null, witness);
                check(true, category + ' native store saves personal regex');
            } finally {
                restore();
            }
        }
        send('NG_WORD_SAFETY_COMPLETE ' + checks + ' checks');
    });
});
