// Settings-integrated tab chooser and per-screen policy. Restores touched preferences.
Java.perform(function(){
    const app=Java.use('android.app.ActivityThread').currentApplication();
    if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('Verification package only');
    const Tools=Java.use('app.morphe.extension.chmate.NativeToolTabs'),prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0);
    const keys=['nativeToolTabs','nativeToolTabSettings','nativeToolTabEddi','nativeToolTabSearch','nativeToolTabChecker','nativeToolTabWacchoi'],saved=keys.map(k=>({k,had:prefs.contains(k),v:prefs.getBoolean(k,false)}));
    let host=null,checks=0;
    function check(value,label){if(!value)throw Error(label);checks++;console.log('PASS '+label);}
    function restore(){const e=prefs.edit();saved.forEach(s=>{if(s.had)e.putBoolean(s.k,s.v);else e.remove(s.k);});e.commit();console.log('PREFS_RESTORED checks='+checks);}
    function find(view,text){const Text=Java.use('android.widget.TextView'),Group=Java.use('android.view.ViewGroup');if(Text.class.isInstance(view)&&String(Java.cast(view,Text).getText())===text)return view;if(Group.class.isInstance(view)){const g=Java.cast(view,Group);for(let i=0;i<g.getChildCount();i++){const result=find(g.getChildAt(i),text);if(result)return result;}}return null;}
    Java.scheduleOnMainThread(()=>{try{
        const editor=prefs.edit();keys.forEach(k=>editor.putBoolean(k,true));editor.commit();
        const Tablet=Java.use('jp.syoboi.a2chMate.activity.TabletHomeActivity');app.startActivity(Java.use('android.content.Intent').$new(app,Tablet.class).addFlags(0x10000000));
    }catch(e){console.log('FAIL START '+e.stack);restore();}});
    setTimeout(()=>Java.perform(()=>Java.choose('jp.syoboi.a2chMate.activity.TabletHomeActivity',{onMatch(a){if(host||!a.getWindow().getDecorView().isShown())return;host=Java.retain(a);Java.scheduleOnMainThread(()=>{try{
        prefs.edit().putBoolean(keys[1],false).commit();check(!Tools.open(host,'settings'),'settings exclusion uses standalone route');
        prefs.edit().putBoolean(keys[2],false).commit();check(!Tools.open(host,'eddi'),'archive exclusion uses standalone route');
        prefs.edit().putBoolean(keys[0],false).commit();
        check(!Tools.open(host,'search'),'master OFF keeps search standalone');
        const editor=prefs.edit();keys.forEach(k=>editor.putBoolean(k,true));editor.commit();
        const panel=Java.use('app.morphe.extension.chmate.Haiagaru').settingsCategory(host,'GENERAL');
        check(find(panel,'画面を新しいタブに追加')!==null,'chooser is an existing settings action');
        const existing=find(host.getWindow().getDecorView(),'Haiagaruの画面をタブに追加');
        check(existing===null,'no independent button added above native New tab');
    }catch(e){console.log('FAIL POLICY '+e.stack);restore();}});},onComplete(){}})),4000);
    setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{
        const panel=Java.use('app.morphe.extension.chmate.Haiagaru').settingsCategory(host,'GENERAL');
        const button=find(panel,'画面を新しいタブに追加');
        check(button!==null&&button.performClick(),'settings action opens the tab chooser');
        Java.choose('app.morphe.extension.chmate.HaiagaruDialog',{onMatch(d){if(!d.isShowing())return;
            const list=d.getListView();check(list.getAdapter().getCount()===5,'all five screen choices available');
            const labels=[];for(let i=0;i<5;i++)labels.push(String(list.getAdapter().getItem(i)));
            check(labels.some(s=>s==='投稿を探す')&&labels.some(s=>s.includes('投稿検索・結果'))&&labels.some(s=>s==='ワッチョイ全文検索'),'both search forms and checker viewer are selectable');
            d.dismiss();},onComplete(){}});
        console.log('READY_NEW_TAB_CHOOSER');
    }catch(e){console.log('FAIL ENTRY '+e.stack);restore();}})),9500);
    setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{
        try{console.log('NEW_TAB_TEST_COMPLETE checks='+checks);}finally{restore();}
    })),18000);
});
