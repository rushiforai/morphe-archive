// Native tablet fixture. Removes only newly created tool pages and restores preferences/selection.
Java.perform(function(){
    const app=Java.use('android.app.ActivityThread').currentApplication();
    if(String(app.getPackageName())!=='jp.co.airfront.android.a2chMate.haiagaru.resumefix242')throw Error('Isolated 242 only');
    const Tools=Java.use('app.morphe.extension.chmate.NativeToolTabs'),Page=Java.use('o.zzeq'),Bundle=Java.use('android.os.Bundle');
    const prefs=app.getSharedPreferences('io.github.areteruhiro.chmate.haiagaru.ui-config',0),had=prefs.contains('nativeToolTabs'),old=prefs.getBoolean('nativeToolTabs',false);
    let host=null,original=[],checks=0;
    const added=new Set();
    function check(value,label){if(!value)throw Error(label);checks++;console.log('PASS '+label);}
    function field(o,key){const f=o.getClass().getDeclaredField(key);f.setAccessible(true);return f.get(o);}
    function find(view,match){if(match(view))return view;if(Java.use('android.view.ViewGroup').class.isInstance(view)){const group=Java.cast(view,Java.use('android.view.ViewGroup'));for(let i=0;i<group.getChildCount();i++){const child=find(group.getChildAt(i),match);if(child)return child;}}return null;}
    function panes(){const result=[],all=field(host,'w'),Array=Java.use('java.lang.reflect.Array');
        for(let i=0;i<Array.getLength(all);i++){
            const model=Java.cast(field(Java.cast(Array.get(all,i),Java.use('o.getRemoteCreator')),'e'),Java.use('o.zzev'));
            const flow=Java.cast(field(model,'e'),Java.use('o.zzcpf')),state=Java.cast(flow.d(),Java.use('o.zzew'));
            result.push({model,list:state.a.value,selection:Number(state.b.value)});
        }return result;
    }
    function rows(){const out=[];panes().forEach(p=>{for(let i=0;i<p.list.size();i++){const row=Java.cast(p.list.get(i),Page);out.push({pane:p,index:i,row,id:String(row.g.value)});}});return out;}
    function rememberAdded(){const known=new Set(original.flatMap(p=>p.ids));for(const item of rows())if(!known.has(item.id)&&String(item.row.i.value.getString('_data')).startsWith('haiagaru-tool://'))added.add(item.id);}
    function restore(){
        try{if(host){rememberAdded();for(const p of panes())for(let i=p.list.size()-1;i>=0;i--)if(added.has(String(Java.cast(p.list.get(i),Page).g.value)))p.model.c.overload('int').call(p.model,i);
            panes().forEach((p,index)=>{const before=original[index];if(!before)return;for(let i=0;i<p.list.size();i++)if(String(Java.cast(p.list.get(i),Page).g.value)===before.selectedId)p.model.e.overload('int').call(p.model,i);});}}
        finally{const e=prefs.edit();if(had)e.putBoolean('nativeToolTabs',old);else e.remove('nativeToolTabs');e.commit();}
    }
    Java.scheduleOnMainThread(function(){try{
        check(Tools.supported(),'native bridge wired');
        const ordinary=Bundle.$new();ordinary.putString('_data','https://example.invalid/');
        check(String(Tools.createFragment(Page.$new(4,ordinary)).getClass().getName())==='jp.syoboi.a2chMate.fragment.WebViewFragment','ordinary Web tab still uses native Fragment');
        const tool=Bundle.$new();tool.putString('_data','haiagaru-tool://settings');
        const fragment=Tools.createFragment(Page.$new(4,tool));
        check(Java.use('o.CustomEventAdapter').class.isInstance(fragment),'tool Fragment has native base and ART verifies it');
        const current=Java.use('app.morphe.extension.chmate.Haiagaru').toolbarActivity(null);
        prefs.edit().putBoolean('nativeToolTabs',false).commit();check(!Tools.open(current,'settings'),'OFF retains legacy routing');
        prefs.edit().putBoolean('nativeToolTabs',true).commit();
        if(String(current.getClass().getName())!=='jp.syoboi.a2chMate.activity.TabletHomeActivity')check(!Tools.open(current,'settings'),'phone routing unchanged when ON');
        const Tablet=Java.use('jp.syoboi.a2chMate.activity.TabletHomeActivity');
        app.startActivity(Java.use('android.content.Intent').$new(app,Tablet.class).addFlags(0x10000000));
    }catch(e){console.log('FAIL INITIAL '+e.stack);restore();}});
    setTimeout(()=>Java.perform(()=>Java.choose('jp.syoboi.a2chMate.activity.TabletHomeActivity',{
        onMatch(a){if(!a.getWindow().getDecorView().isShown())return;host=Java.retain(a);Java.scheduleOnMainThread(()=>{try{
            original=panes().map(p=>{const ids=[];for(let i=0;i<p.list.size();i++)ids.push(String(Java.cast(p.list.get(i),Page).g.value));return {ids,selectedId:ids[p.selection]};});
            check(Tools.open(host,'settings'),'ON opens settings through native tab API');rememberAdded();
        }catch(e){console.log('FAIL OPEN '+e.stack);restore();}});},onComplete(){}
    })),5000);
    setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{if(!host)return;try{
        const args=Bundle.$new();args.putString('_data','haiagaru-tool://eddi');args.putString('android.intent.extra.TITLE','エッヂ過去ログ検索');
        args.putString('android.intent.extra.TEXT',JSON.stringify({query:'https://eddiarchive3rd.boy.jp/',page:1,total:1,expanded:false,threads:[{title:'TAB-RESULT-FIXTURE',date:'2026-10-21',url:'https://bbs.eddibb.cc/test/read.cgi/liveedge/1792292838/'}]}));
        host.a.overload('androidx.fragment.app.Fragment','android.os.Bundle','boolean').call(host,null,args,true);rememberAdded();
    }catch(e){console.log('FAIL ARCHIVE '+e.stack);}})),8500);
    setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{
        check(host!==null,'native tablet host available');rememberAdded();
        const created=rows().filter(item=>added.has(item.id));check(created.length===2,'settings and archive are actual native pages');
        for(const item of created){const f=field(item.row,'d');check(f!==null,'native page has attached Fragment '+item.id);const view=Java.cast(f,Java.use('androidx.fragment.app.Fragment')).getView();check(view!==null&&String(view.getClass().getName())==='android.widget.LinearLayout','native page content attached '+item.id);}
        const settings=created.find(item=>String(item.row.i.value.getString('_data'))==='haiagaru-tool://settings');
        const settingsView=Java.cast(field(settings.row,'d'),Java.use('androidx.fragment.app.Fragment')).getView();
        const general=find(settingsView,v=>Java.use('android.widget.Button').class.isInstance(v)&&String(Java.cast(v,Java.use('android.widget.Button')).getText())==='基本設定');
        check(general!==null,'native settings category available');Java.cast(general,Java.use('android.widget.Button')).performClick();
        settings.pane.model.e.overload('int').call(settings.pane.model,settings.index);
        const composeClass=Java.use('app.morphe.extension.chmate.HaiagaruDialog').class.getDeclaredField('composeContent').getType().getSuperclass();
        const compose=find(settingsView,v=>composeClass.isInstance(v));
        check(compose!==null&&compose.isAttachedToWindow(),'settings category uses attached shared Compose cards');
        check(find(settingsView,v=>Java.use('android.widget.Switch').class.isInstance(v))===null,'legacy settings widgets are not mounted');
        // Compose switches are accessibility nodes, not android.widget.Switch Views.
        // This fixture checks API routing; exercise the actual switch separately by touch.
        prefs.edit().putBoolean('nativeToolTabs',false).commit();const count=rows().length;
        check(!Tools.open(host,'settings')&&rows().length===count,'OFF prevents new tool tabs without deleting open tabs');
        console.log('READY_SCREEN_NATIVE_TABS checks='+checks);
    }catch(e){console.log('FAIL DISPLAY '+e.stack);}})),12500);
    setTimeout(()=>Java.perform(()=>Java.scheduleOnMainThread(()=>{try{restore();console.log('NATIVE_TABS_RESTORED checks='+checks);}catch(e){console.log('FAIL CLEANUP '+e.stack);}})),27000);
});
