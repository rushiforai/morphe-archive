package app.morphe.extension.chmate;

import android.content.Context;
import android.content.SharedPreferences;
import java.lang.reflect.*;
import java.util.*;

/** Native rows/AdapterData, synthetic display copies only; never writes the native history DB. */
public final class DroppedThreadsAndroidTest {
    static int checks;
    static void check(boolean ok,String label){if(!ok)throw new AssertionError(label);checks++;}
    static Object call(Context c,String owner,String name,Class<?>[] types,Object... args)throws Exception{
        Method m=Class.forName("app.morphe.extension.chmate."+owner,true,c.getClassLoader()).getDeclaredMethod(name,types);m.setAccessible(true);return m.invoke(null,args);
    }
    static Field field(Object o,String name)throws Exception{Field f=o.getClass().getDeclaredField(name);f.setAccessible(true);return f;}
    static Object board(Context c)throws Exception{
        return board(c,"https://greta.5ch.io/test/read.cgi/poverty/1792155688/");
    }
    static Object board(Context c,String address)throws Exception{
        Class<?> type=Class.forName("jp.syoboi.a2chMate.client.BBSUrlInfo",true,c.getClassLoader());Object model=null;
        for(Method m:type.getDeclaredMethods())if(Modifier.isStatic(m.getModifiers())&&m.getReturnType()==type&&Arrays.equals(m.getParameterTypes(),new Class<?>[]{String.class})){
            m.setAccessible(true);model=m.invoke(null,address);if(model!=null)break;
        }
        if(model==null)throw new AssertionError("Native URL parser missing");
        for(Method m:type.getDeclaredMethods())if(m.getReturnType().getName().endsWith("BoardID")){
            m.setAccessible(true);
            if(!Modifier.isStatic(m.getModifiers())&&m.getParameterTypes().length==0)return m.invoke(model);
            if(Modifier.isStatic(m.getModifiers())&&Arrays.equals(m.getParameterTypes(),new Class<?>[]{type}))return m.invoke(null,model);
        }
        throw new AssertionError("Native BoardID missing");
    }
    static Object row(Class<?> type,Object board,long key,int state,boolean v191)throws Exception{
        for(Constructor<?> ctor:type.getDeclaredConstructors()){
            Class<?>[] t=ctor.getParameterTypes();if(t.length<12||t[0]!=long.class||t[1]!=String.class||t[t.length-1].getName().startsWith("o.zz"))continue;
            Object[] args=new Object[t.length];
            for(int i=0;i<t.length;i++){
                if(t[i]==long.class)args[i]=i==3?key:i==7?System.currentTimeMillis():1L;
                else if(t[i]==int.class)args[i]=0;else if(t[i]==byte.class)args[i]=(byte)0;else if(t[i]==boolean.class)args[i]=false;
            }
            args[1]="Haiagaru DAT-drop verification";args[2]=board;ctor.setAccessible(true);Object r=ctor.newInstance(args);
            field(r,v191?"o":"l").setInt(r,state);return r;
        }
        throw new AssertionError("Native row constructor missing");
    }
    public static String run(Context context)throws Exception{
        if(!context.getPackageName().startsWith("jp.co.airfront.android.a2chMate.haiagaru"))throw new AssertionError("Isolated verification package required");
        checks=0;String version=context.getPackageManager().getPackageInfo(context.getPackageName(),0).versionName;
        boolean v191=version.contains("191"),v226=version.contains("226");int historyMode=v191||v226?100:103;
        Class<?> rowType=Class.forName(v191?"o.onAdDisplayed$setIcon":v226?"o.Yy2$open":"o.getAvailabilityStatus$r8lambdawJ5MHcSJed_CjC7r4OWD0UxyJsQ",true,context.getClassLoader());
        Object bid=board(context),dropped=row(rowType,bid,1792155688L,1,v191),unknown=row(rowType,bid,1999999999L,0,v191);
        List<Object> source=Arrays.asList(unknown,dropped);
        SharedPreferences prefs=context.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0);
        String key="hideDroppedHomeThreads";boolean had=prefs.contains(key),before=prefs.getBoolean(key,false);
        try{
            check((Boolean)call(context,"HiddenDroppedThreads","dropped",new Class<?>[]{Object.class},dropped),"native DROP bit");
            check(!(Boolean)call(context,"HiddenDroppedThreads","dropped",new Class<?>[]{Object.class},unknown),"native zero bit remains unknown");
            Class<?> headingType=Class.forName(v191?"o.onAdDisplayed$write":v226?"o.Yy2$ComponentActivity":"o.getAvailabilityStatus$RemoteActionCompatParcelizer",true,context.getClassLoader());
            Object emptyHeading=headingType.getConstructor(String.class).newInstance("1分前");
            Object liveHeading=headingType.getConstructor(String.class).newInstance("2分前");
            Object trailingHeading=headingType.getConstructor(String.class).newInstance("3分前");
            List<Object> grouped=Arrays.asList(emptyHeading,dropped,liveHeading,unknown,trailingHeading,dropped);
            check((Boolean)call(context,"HiddenDroppedThreads","target",new Class<?>[]{int.class},historyMode),"native history mode recognized for "+version);
            if(!v191&&!v226)check(!(Boolean)call(context,"HiddenDroppedThreads","target",new Class<?>[]{int.class},100),"242 all/favorites mode 100 remains outside DAT history filtering");
            List<?> history=(List<?>)call(context,"HiddenDroppedThreads","filter",new Class<?>[]{List.class,int.class,boolean.class},grouped,historyMode,true);
            check(history.equals(Arrays.asList(liveHeading,unknown)),"HOME history removes dropped rows and empty time groups");
            check(call(context,"HiddenDroppedThreads","filter",new Class<?>[]{List.class,int.class,boolean.class},grouped,historyMode,false)==grouped,"history OFF retains all time groups");
            check(grouped.size()==6,"grouped source history unchanged");
            if(v226){
                Object nonHeading=Class.forName("o.Yy2$write",true,context.getClassLoader()).getConstructor(String.class).newInstance("保持する項目");
                check(!(Boolean)call(context,"HiddenDroppedThreads","timeHeading",new Class<?>[]{Object.class},nonHeading),"226 non-divider row is not a time heading");
            }
            for(int mode:new int[]{101,102,-101,historyMode}){
                List<?> filtered=(List<?>)call(context,"HiddenDroppedThreads","filter",new Class<?>[]{List.class,int.class,boolean.class},source,mode,true);
                check(filtered.size()==1&&filtered.get(0)==unknown,"native target mode "+mode);
            }
            check(call(context,"HiddenDroppedThreads","filter",new Class<?>[]{List.class,int.class,boolean.class},source,104,true)==source,"posted history excluded");
            prefs.edit().putBoolean(key,false).commit();
            List<?> output=(List<?>)call(context,"BrowsingHistory","transform",new Class<?>[]{List.class,int.class},source,101);
            check(output.equals(source)&&output!=source,"display copy while OFF");
            prefs.edit().putBoolean(key,true).commit();
            call(context,"BrowsingHistory","refreshVisible",new Class<?>[]{android.app.Activity.class},new Object[]{null});
            check(output.size()==1&&output.get(0)==unknown,"setting ON updates existing modern display");
            prefs.edit().putBoolean(key,false).commit();
            call(context,"BrowsingHistory","refreshVisible",new Class<?>[]{android.app.Activity.class},new Object[]{null});
            check(output.equals(source),"setting OFF restores existing display");
            check(source.size()==2&&field(dropped,v191?"o":"l").getInt(dropped)==1,"native rows and flags unchanged");
            if(!v191&&!v226){
                Class<?> options=Class.forName("o.ApiApiOptionsHasAccountOptions",true,context.getClassLoader());
                Object opt=options.getConstructors()[0].newInstance(1f,0,false,false,false,false,false,false);
                Class<?> data=Class.forName("o.SafeParcelableClass",true,context.getClassLoader());
                Object instance=data.getConstructor(List.class,int.class,boolean.class,options,int.class,int.class).newInstance(source,2,false,opt,historyMode,0);
                prefs.edit().putBoolean(key,true).commit();
                call(context,"BrowsingHistory","refreshVisible",new Class<?>[]{android.app.Activity.class},new Object[]{null});
                check(((List<?>)field(instance,"a").get(instance)).size()==1,"242 native AdapterData updates in place");
                prefs.edit().putBoolean(key,false).commit();
                call(context,"BrowsingHistory","refreshVisible",new Class<?>[]{android.app.Activity.class},new Object[]{null});
                check(((List<?>)field(instance,"a").get(instance)).equals(source),"242 AdapterData restores OFF");
            }else{
                java.util.concurrent.FutureTask<Void> nativeUi=new java.util.concurrent.FutureTask<>(()->{
                Class<?> wrapper=Class.forName(v191?"o.onAdDisplayed$setBackgroundResource":"o.Yy2$CheckResult",true,context.getClassLoader());
                Object input=wrapper.getConstructor(List.class).newInstance(source);
                Object adapter=Class.forName(v191?"o.r8lambdaXZREaGE4vvLAA2ZOtsKBd3knAPA":"o.bea1",true,context.getClassLoader()).getConstructor(Context.class).newInstance(context);
                field(adapter,v191?"i":"g").set(adapter,input);field(adapter,v191?"g":"d").set(adapter,input);
                if(v191)field(adapter,"j").set(adapter,input);
                Object fragment=Class.forName(v191?"o.r8lambdaTb_p0z6z2AqSZIga1YhmAVmiTPk":"jp.syoboi.a2chMate.fragment.HomeFragment",true,context.getClassLoader()).getConstructor().newInstance();
                field(fragment,v191?"e":"i").set(fragment,adapter);
                if(v191){
                    field(adapter,"g").set(adapter,null);
                    prefs.edit().putBoolean(key,true).commit();
                    call(context,"BrowsingHistory","applyLegacy",new Class<?>[]{Object.class,int.class},fragment,historyMode);
                    check(((android.widget.BaseAdapter)adapter).getCount()==1,"191 visible list filtered with uninitialized source cache");
                    check(field(adapter,"g").get(adapter)==null,"191 uninitialized cache stays null");
                    field(adapter,"g").set(adapter,input);
                }
                for(int i=0;i<12;i++){
                    prefs.edit().putBoolean(key,(i&1)==0).commit();
                    call(context,"BrowsingHistory","applyLegacy",new Class<?>[]{Object.class,int.class},fragment,historyMode);
                    check(((List<?>)field(adapter,v191?"g":"d").get(adapter)).size()==((i&1)==0?1:2),"legacy ON/OFF source retention "+i);
                    check(((android.widget.BaseAdapter)adapter).getCount()==((i&1)==0?1:2),"actual getCount respects DAT switch "+i);
                    field(adapter,v191?"j":"d").set(adapter,wrapper.getConstructor(List.class).newInstance(source));
                    ((android.widget.BaseAdapter)adapter).notifyDataSetChanged();
                    check(((android.widget.BaseAdapter)adapter).getCount()==((i&1)==0?1:2),"late filter publication respects DAT switch "+i);
                }
                return null;
                });
                new android.os.Handler(android.os.Looper.getMainLooper()).post(nativeUi);
                nativeUi.get(20,java.util.concurrent.TimeUnit.SECONDS);
            }
            Object target=row(rowType,bid,1792155688L,0,v191);
            String url=(String)call(context,"DroppedThreadStatus","rowUrl",new Class<?>[]{Object.class,Context.class},target,context);
            android.util.Log.i("HaiagaruTest","target URL="+url);
            check(url.contains("1792155688"),"native URL retains thread key: "+url);
            prefs.edit().putBoolean(key,true).commit();
            // A synthetic BoardID has no entry in ChMate's server registry. Its URL
            // can legitimately have host "null"; never treat that as a real network test.
            String confirmedUrl="https://greta.5ch.io/test/read.cgi/poverty/1792155688/";
            long deadline=System.currentTimeMillis()+30000;boolean hidden=false;
            while(System.currentTimeMillis()<deadline){
                if((Boolean)call(context,"DroppedThreadStatus","droppedUrl",new Class<?>[]{String.class},confirmedUrl)){hidden=true;break;}android.os.SystemClock.sleep(250);
            }
            check(hidden,"positive confirmation cache works without native flag");
            check(field(target,v191?"o":"l").getInt(target)==0,"confirmation never changes native DB/row flag");
            prefs.edit().putBoolean(key,false).commit();
            List<Object> original=Collections.singletonList(target);
            check(call(context,"HiddenDroppedThreads","filter",new Class<?>[]{List.class,int.class,boolean.class},original,historyMode,false)==original,"OFF shows confirmed archive again");
        }finally{
            SharedPreferences.Editor edit=prefs.edit();if(had)edit.putBoolean(key,before);else edit.remove(key);edit.commit();
        }
        return "PASS "+version+" "+checks+" native DAT-drop tests including reported URL";
    }
}
