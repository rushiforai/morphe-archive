rpc.exports.test = () => new Promise(resolve => Java.perform(() => {
    let preferences, hadSetting, oldSetting, hadNumbered, oldNumbered;
    try {
        const application = Java.use('android.app.ActivityThread').currentApplication();
        if (!/\.haiagaru\.reporter(?:191|226|242)$/.test(String(application.getPackageName()))) throw Error('Use an isolated reporter');
        const packageName=String(application.getPackageName());
        const callbackType=packageName.endsWith('191')?'o.pa$15':packageName.endsWith('226')?'jp.syoboi.a2chMate.ui.reslist.ResListFragment$setHasDecor':'jp.syoboi.a2chMate.ui.reslist.ResListFragmentViewModel';
        Java.use(callbackType).class.getDeclaredMethods();
        preferences = application.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config', 0);
        hadSetting = preferences.contains('excludeHiddenNgNewArrivals');
        oldSetting = preferences.getBoolean('excludeHiddenNgNewArrivals', false);
        preferences.edit().putBoolean('excludeHiddenNgNewArrivals', false).commit();
        hadNumbered = preferences.contains('countNewArrivalResponseNumbers');
        oldNumbered = preferences.getBoolean('countNewArrivalResponseNumbers', true);
        preferences.edit().remove('countNewArrivalResponseNumbers').commit();
        const response = Java.registerClass({name: 'app.haiagaru.test.ArrivalResponse' + Date.now(),
            fields: {o: 'int'}, methods: {$init: [{returnType: 'void', argumentTypes: ['int'], implementation: function(number) { this.$super.$init(); this.o.value = number; }}]}});
        const numbers = Java.use('app.morphe.extension.chmate.NewArrivalNumbers');
        if (!numbers.enabled()) throw Error('Numbered counts must default ON');
        const collection = values => { const rows = Java.use('java.util.ArrayList').$new(); for (const number of values) rows.add(response.$new(number)); return rows; };
        let checks = 0;
        const verify = (before, after, expected) => {
            const owner = Java.use('java.lang.Object').$new();
            const oldRows = collection(before), newRows = collection(after);
            numbers.owner(owner);
            if (numbers.before.overload('java.util.Collection').call(numbers, oldRows) !== before.length) throw Error('Native size changed');
            numbers.owner(owner);
            numbers.after.overload('java.util.Collection').call(numbers, newRows);
            numbers.owner(owner);
            const actual = numbers.count.overload('int', 'int').call(numbers, before.length, after.length);
            if (actual !== expected) throw Error(JSON.stringify({before, after, expected, actual}));
            if (oldRows.size() !== before.length || newRows.size() !== after.length) throw Error('Source list mutated');
            checks++;
        };
        verify([1,2,3,4,5], [1,4,5,6], 1);
        verify([1,2,3,4,5], [4,5], 0);
        verify([1,3,5], [1,3,5,6,8], 2);
        verify([1,3,5], [1,3,5,6,8,8], 2);
        verify([5,1,3], [8,5,1,6], 2);
        verify([1,2,3], [1,2,3], 0);
        verify([], [1,3], 2);
        verify([1,2,3], [], 0);
        verify([1,3,5], [1,2,3,5], 0);
        preferences.edit().putBoolean('countNewArrivalResponseNumbers', false).commit();
        verify([1,2,3,4,5], [1,4,5,6], 0);
        preferences.edit().putBoolean('countNewArrivalResponseNumbers', true).commit();
        verify([1,2,3,4,5], [1,4,5,6], 1);
        verify([5,1,3], [8,5,1,6,8,0,-1], 2);
        const a=Java.use('java.lang.Object').$new(),b=Java.use('java.lang.Object').$new();
        const capture=(owner,rows)=>{numbers.owner(owner);numbers.before.overload('java.util.Collection').call(numbers,rows);};
        const finish=(owner,rows,previous,current)=>{numbers.owner(owner);numbers.after.overload('java.util.Collection').call(numbers,rows);numbers.owner(owner);return numbers.count.overload('int','int').call(numbers,previous,current);};
        capture(a,collection([1,2,3]));capture(b,collection([10,12]));
        if(finish(a,collection([1,3,4]),3,3)!==1||finish(b,collection([10,12,13]),2,3)!==1)throw Error('Concurrent owners crossed snapshots');checks++;
        const reused=collection([1,2,3]);capture(a,reused);reused.remove.overload('int').call(reused,1);reused.add(response.$new(4));
        if(finish(a,reused,3,3)!==1)throw Error('Reused native list lost the old maximum');checks++;
        capture(a,collection([1,2,3]));
        if(finish(a,collection([1,2,3]),3,3)!==0)throw Error('No-change update changed count');
        numbers.owner(a);if(numbers.count.overload('int','int').call(numbers,3,5)!==2)throw Error('Snapshot not consumed');checks++;
        resolve({passed: checks, networkRequests: 0, modifiesNativeHistory: false});
    } catch (error) { resolve({error: String(error)}); }
    finally {
        if (preferences) {
            const edit = preferences.edit();
            if (hadSetting) edit.putBoolean('excludeHiddenNgNewArrivals', oldSetting);
            else edit.remove('excludeHiddenNgNewArrivals');
            if (hadNumbered) edit.putBoolean('countNewArrivalResponseNumbers', oldNumbered);
            else edit.remove('countNewArrivalResponseNumbers');
            edit.commit();
        }
    }
}));
