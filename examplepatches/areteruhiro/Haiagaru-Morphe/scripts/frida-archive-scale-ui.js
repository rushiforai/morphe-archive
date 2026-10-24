// Local result fixture only. CLI -e may set archiveControls/archiveResults (70..150),
// or archiveRestore=true. Original preferences are kept in an in-process property.
Java.perform(function(){
    const T=Java.use('android.app.ActivityThread'),app=T.currentApplication(),pkg=String(app.getPackageName());
    if(!/\.haiagaru\.resumefix226$/.test(pkg))throw Error('Isolated 226 app required');
    const System=Java.use('java.lang.System'),property='haiagaru.test.archiveAppearance';
    const prefs=app.getSharedPreferences('haiagaru_eddi_search',0);
    if(System.getProperty(property)===null)System.setProperty(property,JSON.stringify([
        [prefs.contains('controlTextScale'),prefs.getInt('controlTextScale',100)],
        [prefs.contains('resultTextScale'),prefs.getInt('resultTextScale',100)],
        [prefs.contains('hideSearchForm'),prefs.getBoolean('hideSearchForm',false)]]));
    const C=Java.use('app.morphe.extension.chmate.EddiArchiveSearchUi');
    const search=C.search.overload('int');let searches=0;
    search.implementation=function(){searches++;};
    function controller(){
        const R=Java.use('android.app.ActivityThread$ActivityClientRecord'),A=Java.use('app.morphe.extension.chmate.HissiMenuActivity');
        for(const record of T.currentActivityThread().mActivities.value.values().toArray()){
            const a=Java.cast(record,R).activity.value;
            if(a&&String(a.getClass().getName())==='app.morphe.extension.chmate.HissiMenuActivity'&&!a.isFinishing()){
                const activity=Java.cast(a,A);if(activity.archiveSearchUi.value!==null)return Java.retain(Java.cast(activity.archiveSearchUi.value,C));
            }
        }return null;
    }
    Java.scheduleOnMainThread(function(){
        if(controller()!==null)return;
        const intent=Java.use('android.content.Intent').$new();intent.setClassName(pkg,'app.morphe.extension.chmate.HissiMenuActivity');intent.addFlags(0x10000000);
        intent.setData(Java.use('android.net.Uri').parse('haiagaru-eddi://eddiarchive3rd.boy.jp/'));app.startActivity(intent);
    });
    setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{
        try{
            const c=controller();if(c===null)throw Error('Archive controller missing');
            if(globalThis.archiveRestore){
                const values=JSON.parse(String(System.getProperty(property)));
                c.saveAppearance(values[0][1],values[1][1],values[2][1]);
                const edit=prefs.edit();['controlTextScale','resultTextScale','hideSearchForm'].forEach((key,i)=>{if(!values[i][0])edit.remove(key);});edit.commit();
                System.clearProperty(property);c.activity.value.finish();console.log('ARCHIVE_APPEARANCE_RESTORED');return;
            }
            let html='<main id="threadContainer">検索結果 50件';
            for(let i=1;i<=50;i++)html+='<div class="thread"><a class="title" href="https://bbs.eddibb.cc/test/read.cgi/liveedge/1792292838/">SCALE-TEST-'+String(i).padStart(2,'0')+'</a><p class="date">2026-10-20</p></div>';
            c.display(1,c.parse(html+'</main>'));
            const before=searches,control=globalThis.archiveControls||70,result=globalThis.archiveResults||70;
            c.saveAppearance(control,result,false);
            if(searches!==before)throw Error('Appearance must not start a new search');
            if(c.root.value.getTag(0x48690c01)===null||c.root.value.getTag(0x48690c02)===null)throw Error('Compose scale tags missing');
            console.log('ARCHIVE_SCALE_READY controls='+control+' results='+result+' no-network fixture rows=50');
        }catch(e){console.log('FAIL '+e+'\n'+e.stack);}finally{search.implementation=null;}
    })),5000);
});
