// Search form only: never starts a scan or opens a public page.
Java.perform(function(){
    const T=Java.use('android.app.ActivityThread'),app=T.currentApplication(),pkg=String(app.getPackageName());
    if(!/\.haiagaru\.resumefix226$/.test(pkg))throw Error('Isolated 226 app required');
    const name='app.morphe.extension.chmate.HissiWacchoiSearchActivity',A=Java.use(name);
    const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),key='search.lastSource';
    const had=prefs.contains(key),old=prefs.getInt(key,0);let checks=0,active=null;
    function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
    function main(delay,fn){setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{fn();}catch(e){console.log('FAIL '+e+'\n'+e.stack);restore();}})),delay);}
    function restore(){const edit=prefs.edit();if(had)edit.putInt(key,old);else edit.remove(key);edit.commit();if(active&&!active.isFinishing())active.finish();}
    function launch(host,board){
        prefs.edit().putInt(key,1).commit();
        const i=Java.use('android.content.Intent').$new();i.setClassName(pkg,name);i.addFlags(0x10000000);
        i.putExtra.overload('java.lang.String','java.lang.String').call(i,'haiagaru.wacchoi.host',host);
        i.putExtra.overload('java.lang.String','java.lang.String').call(i,'haiagaru.wacchoi.board',board);
        i.putExtra.overload('java.lang.String','java.lang.String').call(i,'haiagaru.wacchoi.query','-Ab12');app.startActivity(i);
    }
    function activity(){
        const recordType=Java.use('android.app.ActivityThread$ActivityClientRecord');
        for(const record of T.currentActivityThread().mActivities.value.values().toArray()){
            const a=Java.cast(record,recordType).activity.value;
            if(a&&String(a.getClass().getName())===name&&!a.isFinishing())return Java.retain(Java.cast(a,A));
        }throw Error('Search activity missing');
    }
    main(0,()=>launch('egg.5ch.io','software'));
    main(2200,()=>{
        active=activity();check(active.searchSource.value===0,'5ch overrides previously selected Edge with Hissi');
        check(active.selectedBoards.value.size()===1&&active.selectedBoards.value.contains(Java.use('java.lang.String').$new('software')),'source thread board replaces previous board');
        check(Java.use('android.text.TextUtils').equals(active.fourInput.value.getText(),Java.use('java.lang.String').$new('Ab12')),'suffix search token is retained');
        const setText=Java.use('android.widget.TextView').setText.overload('java.lang.CharSequence');
        setText.call(active.startOffsetInput.value,Java.use('java.lang.String').$new('12'));const form=active.captureSearchFields();
        setText.call(active.startOffsetInput.value,Java.use('java.lang.String').$new('0'));active.selectSource(1);active.restoreSearchFields(form);
        check(Java.use('android.text.TextUtils').equals(active.startOffsetInput.value.getText(),Java.use('java.lang.String').$new('12')),'manual start offset survives form restoration');
        check(active.searchSource.value===0,'saved form restores its own source');
        check(!active.stopButton.value.isEnabled(),'opening/restoring conditions does not start network scanning');
        active.finish();active=null;launch('bbs.eddibb.cc','liveedge');
    });
    main(4500,()=>{
        active=activity();check(active.searchSource.value===1,'Edge thread starts with Edge source');
        check(active.selectedBoards.value.size()===1&&active.selectedBoards.value.contains(Java.use('java.lang.String').$new('liveedge')),'Edge board is retained');
        console.log('PASS '+checks+' source board/form checks');restore();
    });
});
