// Offline native pages: no searches, authentication, posts or history deletion.
Java.perform(function(){
    const app=Java.use('android.app.ActivityThread').currentApplication();
    if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('Verification package only');
    const Tools=Java.use('app.morphe.extension.chmate.NativeToolTabs'),Page=Java.use('o.zzeq'),Bundle=Java.use('android.os.Bundle'),Intent=Java.use('android.content.Intent');
    const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0);
    const keys=['nativeToolTabs','nativeToolTabSearch','nativeToolTabChecker','nativeToolTabWacchoi'];
    const saved=keys.map(k=>({k,had:prefs.contains(k),value:prefs.getBoolean(k,false)}));
    let host=null,original=[],checks=0;const added=new Set();
    function check(ok,label){if(!ok)throw Error(label);checks++;console.log('PASS '+label);}
    function field(o,key){const f=o.getClass().getDeclaredField(key);f.setAccessible(true);return f.get(o);}
    function panes(){const out=[],all=field(host,'w'),Array=Java.use('java.lang.reflect.Array');
        for(let i=0;i<Array.getLength(all);i++){
            const model=Java.cast(field(Java.cast(Array.get(all,i),Java.use('o.getRemoteCreator')),'e'),Java.use('o.zzev'));
            const state=Java.cast(Java.cast(field(model,'e'),Java.use('o.zzcpf')).d(),Java.use('o.zzew'));
            out.push({model,list:state.a.value,selection:Number(state.b.value)});
        }return out;
    }
    function rows(){const out=[];panes().forEach(p=>{for(let i=0;i<p.list.size();i++){const row=Java.cast(p.list.get(i),Page);out.push({pane:p,index:i,row,id:String(row.g.value),args:row.i.value});}});return out;}
    function remember(){const known=new Set(original.flatMap(p=>p.ids));for(const r of rows())if(!known.has(r.id)&&String(r.args.getString('_data')).startsWith('haiagaru-tool://'))added.add(r.id);}
    function restore(){try{if(host){remember();for(const p of panes())for(let i=p.list.size()-1;i>=0;i--)if(added.has(String(Java.cast(p.list.get(i),Page).g.value)))p.model.c.overload('int').call(p.model,i);
        panes().forEach((p,index)=>{const old=original[index];if(!old)return;for(let i=0;i<p.list.size();i++)if(String(Java.cast(p.list.get(i),Page).g.value)===old.selected)p.model.e.overload('int').call(p.model,i);});}}
        finally{const edit=prefs.edit();saved.forEach(s=>{if(s.had)edit.putBoolean(s.k,s.value);else edit.remove(s.k);});edit.commit();}}
    Java.scheduleOnMainThread(()=>{try{
        const edit=prefs.edit();keys.forEach(k=>edit.putBoolean(k,true));edit.commit();
        app.startActivity(Intent.$new(app,Java.use('jp.syoboi.a2chMate.activity.TabletHomeActivity').class).addFlags(0x10000000));
    }catch(e){console.log('FAIL START '+e.stack);restore();}});
    setTimeout(()=>Java.perform(()=>Java.choose('jp.syoboi.a2chMate.activity.TabletHomeActivity',{onMatch(a){if(host||!a.getWindow().getDecorView().isShown())return;host=Java.retain(a);
        Java.scheduleOnMainThread(()=>{try{
            original=panes().map(p=>{const ids=[];for(let i=0;i<p.list.size();i++)ids.push(String(Java.cast(p.list.get(i),Page).g.value));return {ids,selected:ids[p.selection]};});
            check(Tools.open(host,'search',Intent.$new().putExtra('haiagaru.wacchoi.query','abcd-')),'post search opens as native page');remember();
            check(Tools.open(host,'wacchoi',Intent.$new().putExtra('haiagaru.wacchoi.query','efgh-IJKL')),'full Wacchoi search opens as native page');remember();
            check(Tools.open(host,'checker'),'checker address form opens as native page');remember();
        }catch(e){console.log('FAIL OPEN '+e.stack);restore();}});},onComplete(){}})),4000);
    setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{
        check(host!==null,'native tablet host available');remember();
        const pages=rows().filter(r=>added.has(r.id));check(pages.length===3,'three separate native pages retained');
        const Fragment=Java.use('androidx.fragment.app.Fragment');
        for(const r of pages){const fragment=field(r.row,'d');check(fragment!==null,'native Fragment wired '+r.args.getString('_data'));
            check(Java.use('app.morphe.extension.chmate.NativeToolFragment').class.isInstance(fragment),'not a standalone Activity or Web-tab fallback');
            const view=Java.cast(fragment,Fragment).getView();if(view)check(String(view.getClass().getName())==='android.widget.FrameLayout','bounded embedded screen root');
        }
        const first=pages.find(r=>String(r.args.getString('_data'))==='haiagaru-tool://search');
        const full=pages.find(r=>String(r.args.getString('_data'))==='haiagaru-tool://wacchoi');
        check(JSON.parse(String(first.args.getString('android.intent.extra.TEXT'))).launch.includes('abcd-'),'first page keeps its own query');
        check(JSON.parse(String(full.args.getString('android.intent.extra.TEXT'))).launch.includes('efgh-IJKL'),'full search keeps a different query');
        console.log('SEARCH_NATIVE_TABS_COMPLETE checks='+checks);
    }catch(e){console.log('FAIL VERIFY '+e.stack);}finally{restore();console.log('SEARCH_NATIVE_TABS_RESTORED');}})),15000);
});
