/* Synthetic private fixture only. Does not access MEGA or export real credentials. */
'use strict';
rpc.exports={test(){return new Promise((resolve,reject)=>Java.perform(function () {
    const app = Java.use('android.app.ActivityThread').currentApplication();
    const pkg = String(app.getPackageName());
    if (pkg !== 'jp.co.airfront.android.a2chMate.haiagaru.migration191242') throw Error('Dedicated migration app required');
    const File = Java.use('java.io.File'), Out = Java.use('java.io.FileOutputStream');
    const In = Java.use('java.io.FileInputStream'), A = Java.use('app.morphe.extension.chmate.HaiagaruBackupArchive');
    const S = Java.use('app.morphe.extension.chmate.HaiagaruBackupSecrets');
    const Snapshot = Java.use('app.morphe.extension.chmate.HaiagaruSyncSnapshot');
    const Json = Java.use('org.json.JSONObject'), Zip = Java.use('java.util.zip.ZipFile');
    const ZipOut = Java.use('java.util.zip.ZipOutputStream'), Entry = Java.use('java.util.zip.ZipEntry');
    const root = File.$new(app.getCacheDir(), 'backup-fixture-' + Date.now()); root.mkdirs();
    const files = File.$new(root, 'files'), cache = File.$new(root, 'cache'), external = File.$new(root, 'external');
    files.mkdirs(); cache.mkdirs(); external.mkdirs();
    const Info = Java.use('android.content.pm.ApplicationInfo'), info = Info.$new(app.getApplicationInfo());
    info.dataDir.value = String(root.getPath());
    const fixturePreferences=new Set();
    const Context = Java.registerClass({
        name: 'app.haiagaru.test.BackupContext' + Date.now(), superClass: Java.use('android.content.ContextWrapper'),
        methods: {
            $init: [{returnType:'void', argumentTypes:['android.content.Context'], implementation:function(base) { this.$super.$init(base); }}],
            getFilesDir: function () { return File.$new(String(files.getAbsolutePath())); }, getCacheDir: function () { return File.$new(String(cache.getAbsolutePath())); },
            getExternalFilesDir: [{returnType:'java.io.File', argumentTypes:['java.lang.String'], implementation:function(type) { return File.$new(String(external.getAbsolutePath())); }}],
            getApplicationInfo: function () { return Info.$new(info); },
            getFileStreamPath: [{returnType:'java.io.File',argumentTypes:['java.lang.String'],implementation:function(name){return File.$new(String(files.getAbsolutePath())+'/'+String(name));}}],
            getDatabasePath: [{returnType:'java.io.File',argumentTypes:['java.lang.String'],implementation:function(name){return File.$new(String(root.getAbsolutePath())+'/databases/'+String(name));}}],
            getSharedPreferences: [{returnType:'android.content.SharedPreferences',argumentTypes:['java.lang.String','int'],implementation:function(name,mode){const key='backup-fixture.'+String(name);fixturePreferences.add(key);return app.getSharedPreferences(key,mode);}}]
        }
    });
    const context = Context.$new(app), nativeRoot = File.$new(external, '2chMate'); nativeRoot.mkdirs();
    let count = 0;
    function check(ok, label) { if (!ok) throw Error(label); count++; console.log('PASS ' + label); }
    function write(file, text) {
        file.getParentFile().mkdirs(); const out = Out.$new(file);
        try { out.write(Java.use('java.lang.String').$new(text).getBytes('UTF-8')); } finally { out.close(); }
    }
    function text(file) {
        const scanner = Java.use('java.util.Scanner').$new(file, 'UTF-8');
        try { scanner.useDelimiter('\\A'); return scanner.hasNext() ? String(scanner.next()) : ''; } finally { scanner.close(); }
    }
    function digest(file) {
        const md = Java.use('java.security.MessageDigest').getInstance('SHA-256'), input = In.$new(file);
        const buffer = Java.array('byte', Array(65536).fill(0));
        try { let n; while ((n = input.read(buffer)) !== -1) md.update(buffer, 0, n); } finally { input.close(); }
        return String(Java.use('android.util.Base64').encodeToString(md.digest(), 2));
    }
    function rejects(fn, label) { let rejected = false; try { fn(); } catch (e) { rejected = true; } check(rejected, label); }
    function removeFixture(file) {
        // Exact fixture root, canonical containment checked before every deletion.
        if (!String(file.getCanonicalPath()).startsWith(String(root.getCanonicalPath()) + '/') && !file.equals(root)) throw Error('Cleanup outside fixture');
        if (file.isDirectory()) for (const child of file.listFiles()) removeFixture(child);
        file.delete();
    }

    let backup,settings,full,empty;
    try {
        const idx=File.$new(nativeRoot,'dat/android_1790000000.idx'),dat=File.$new(nativeRoot,'dat/android_1790000000.dat'),posts=File.$new(files,'postDataList.json');
        const original='0\thttps://egg.5ch.io/test/read.cgi/android/1790000000/\n3:1,17:16\n';
        write(idx,original);write(dat,'original DAT body');write(posts,'[{"url":"fixture"}]');
        backup=A.read(context,A.capture(context,8));
        const zip=Zip.$new(backup.file.value);
        try{check(zip.getEntry('dat/android_1790000000.idx')!==null,'history-only capture includes native response index');check(zip.getEntry('dat/android_1790000000.dat')===null,'history-only capture excludes DAT body');check(zip.getEntry('posts/data')!==null,'posting history retained');}finally{zip.close();}
        write(idx,'changed index');write(dat,'new local DAT body');write(posts,'[]');
        A.restore(context,backup,8,false);
        check(text(idx)===original,'restore returns exact own-post and other response flags');check(text(dat)==='new local DAT body','restore without DAT leaves body unchanged');check(text(posts)==='[{"url":"fixture"}]','posting history restored');
        const version=String(app.getPackageManager().getPackageInfo(pkg,0).versionName.value),binding=version.includes('191')?['o.r8lambdaY6jOWe768BsjNXDLvrbMiwug18','d']:version.includes('226')?['o.SocketAdapter','a']:['o.hMq3','b'];
        const nativeIndex=Java.use(binding[0]).$new(dat);
        try{check((nativeIndex[binding[1]].overload('int').call(nativeIndex,3)&1)!==0,'native ChMate index reader recognizes restored own-post mark');}
        finally{if(version.includes('242')){const observer=nativeIndex.getClass().getDeclaredField('j');observer.setAccessible(true);const value=observer.get(nativeIndex);if(value)Java.cast(value,Java.use('android.os.FileObserver')).stopWatching();}}
        full=A.read(context,A.capture(context,8|256));write(idx,'changed again');write(dat,'retained DAT');A.restore(context,full,8,false);
        check(text(idx)===original&&text(dat)==='retained DAT','history-only restore of a DAT backup restores index without body');
        const pref=context.getSharedPreferences('haiagaru.local-auto-backup',0);
        pref.edit().putBoolean('enabled',true).putString('tree','content://fixture/tree/old').putInt('hours',12).putInt('keep',5).putInt('categories',8).putString('files','["owned-old"]' ).putLong('last',123).putString('status','old').commit();
        settings=A.read(context,A.capture(context,4));
        const values=settings.snapshot.value.getJSONObject('settings').getJSONObject('haiagaru.local-auto-backup');
        check(values.length()===3&&values.has('hours')&&values.has('keep')&&values.has('categories'),'portable schedule is included');
        check(!values.has('files')&&!values.has('tree')&&!values.has('enabled')&&!values.has('last')&&!values.has('status'),'destination permission and backup ownership excluded');
        pref.edit().putInt('hours',24).putInt('keep',3).putInt('categories',256).putBoolean('enabled',false).putString('tree','content://fixture/tree/current').putString('files','["owned-current"]').putLong('last',456).commit();
        A.restore(context,settings,4,false);
        check(pref.getInt('hours',0)===12&&pref.getInt('keep',0)===5&&pref.getInt('categories',0)===8,'schedule settings restored');
        check(!pref.getBoolean('enabled',true)&&String(pref.getString('tree',''))==='content://fixture/tree/current','current installation destination and enablement retained');
        check(String(pref.getString('files',''))==='["owned-current"]'&&Number(pref.getLong('last',0))===456,'current retention ownership and last success retained');
        A.restore(context,settings,4,true);check(pref.getInt('hours',0)===12&&!pref.getBoolean('enabled',true),'settings merge keeps existing schedule and enablement');
        pref.edit().putInt('categories',0).commit();empty=A.read(context,A.capture(context,4));pref.edit().putInt('categories',8).commit();A.restore(context,empty,4,false);
        check(pref.getInt('categories',-1)===0,'no selected categories can be restored without enabling a backup');
        resolve({checks:count,passed:true});
    } catch(e){console.log('BACKUP_MARK_TEST_ERROR '+String(e.stack||e));reject(Error(String(e.stack||e)));}
    finally{if(backup)backup.close();if(settings)settings.close();if(full)full.close();if(empty)empty.close();removeFixture(root);for(const key of fixturePreferences)if(key.startsWith('backup-fixture.'))app.deleteSharedPreferences(key);}
}));}};
