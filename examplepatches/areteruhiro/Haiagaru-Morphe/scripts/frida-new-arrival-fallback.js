rpc.exports.test = () => new Promise(resolve => Java.perform(() => {
    try {
        const app = Java.use('android.app.ActivityThread').currentApplication();
        const pkg = String(app.getPackageName());
        if (!/\.haiagaru\.reporter(?:191|226|242)$/.test(pkg)) throw Error('Isolated reporter only');
        const ArrayList = Java.use('java.util.ArrayList');
        const fallback = Java.use('app.morphe.extension.chmate.NewArrivalCountFallback');
        const begin = fallback.beginForKey.overload('java.lang.String', 'java.util.Collection');
        const after = fallback.afterForKey.overload('java.lang.String', 'java.util.Collection');
        const count = fallback.countForKey.overload('java.lang.String', 'int', 'int');
        const hiddenNg = Java.use('app.morphe.extension.chmate.HiddenNgUnread');
        const hiddenCheck = hiddenNg.isHiddenNewArrival.overload('java.lang.String', 'int');
        const Row = Java.registerClass({
            name: 'app.haiagaru.test.ArrivalRow' + Date.now(),
            fields: {o: 'int'},
            methods: {$init: [{
                returnType: 'void', argumentTypes: ['int'],
                implementation: function (number) { this.o.value = number; }
            }]}
        });
        const rows = values => {
            const list = ArrayList.$new();
            values.forEach(number => list.add(Row.$new(number)));
            return list;
        };
        const key = 'fixture.5ch.io/board/1999999901';
        const run = (beforeRows, afterRows, previous, current, expected, label) => {
            begin.call(fallback, key, rows(beforeRows));
            after.call(fallback, key, rows(afterRows));
            const actual = count.call(fallback, key, previous, current);
            if (actual !== expected) throw Error(label + ': expected ' + expected + ', got ' + actual);
        };
        run([1,2,3,4,5], [1,2,3,4,6], 5, 5, 1, 'deleted row offset one new response');
        run([1,2,3,4,5,6], [1,2,3,4,7,8], 6, 6, 2, 'deleted rows offset two new responses');
        run([1,2,3,4,5], [1,2,3,4], 5, 4, 0, 'deletion without a new response');
        run([5,1,3], [8,5,1,6], 3, 3, 2, 'unordered list fallback');
        run([1,2,3], [1,2,3,4], 3, 4, 1, 'normal positive total delta remains unchanged');
        hiddenCheck.implementation = function (threadKey, number) {
            if (String(threadKey) === key && number === 8) return true;
            return hiddenCheck.call(this, threadKey, number);
        };
        run([1,2,3,4,5], [1,2,3,4,6,7,8], 5, 5, 2, 'hidden NG excluded from zero-delta fallback');
        hiddenCheck.implementation = null;
        const stale = count.call(fallback, key, 5, 5);
        if (stale !== 0) throw Error('snapshot must be consumed exactly once');
        resolve({passed: 7, fixtureOnly: true, postsSent: 0, realThreadDataChanged: false});
    } catch (error) {
        resolve({error: String(error)});
    }
}));
