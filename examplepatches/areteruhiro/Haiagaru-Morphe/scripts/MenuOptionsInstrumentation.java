package app.haiagaru.tests.menuoptions;

import android.app.*;
import android.content.*;
import android.os.*;
import android.view.*;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;

/** Exercise production menu gates without invoking native navigation or touching saved threads. */
public final class MenuOptionsInstrumentation extends Instrumentation {
    int checks;
    void ok(boolean condition,String label){if(!condition)throw new AssertionError(label);checks++;}
    @Override public void onCreate(Bundle args){super.onCreate(args);start();}
    @Override public void onStart(){Bundle result=new Bundle();try{
        FutureTask<Void> task=new FutureTask<>(()->{test();return null;});runOnMainSync(task);task.get(20,TimeUnit.SECONDS);
        result.putString("result","PASS "+checks+" menu option checks");finish(Activity.RESULT_OK,result);
    }catch(Throwable error){result.putString("error",android.util.Log.getStackTraceString(error));finish(Activity.RESULT_CANCELED,result);}}
    static final class Item implements InvocationHandler {
        int id;String title;boolean visible=true;MenuItem proxy;
        Item(int id,String title){this.id=id;this.title=title;proxy=(MenuItem)Proxy.newProxyInstance(MenuItem.class.getClassLoader(),new Class<?>[]{MenuItem.class},this);}
        public Object invoke(Object object,Method method,Object[] args){switch(method.getName()){
            case "getItemId":return id;case "getTitle":return title;case "isVisible":return visible;
            case "setVisible":visible=(Boolean)args[0];return proxy;
            case "setTitle":title=String.valueOf(args[0]);return proxy;
            case "hashCode":return System.identityHashCode(proxy);case "equals":return proxy==args[0];
            default:if(method.getReturnType()==MenuItem.class)return proxy;
                if(method.getReturnType()==boolean.class)return false;if(method.getReturnType()==int.class)return 0;return null;
        }}
    }
    static final class Items implements InvocationHandler {
        List<Item> list=new ArrayList<>();Menu proxy;
        Items(){proxy=(Menu)Proxy.newProxyInstance(Menu.class.getClassLoader(),new Class<?>[]{Menu.class},this);}
        public Object invoke(Object object,Method method,Object[] args){switch(method.getName()){
            case "size":return list.size();case "getItem":return list.get((Integer)args[0]).proxy;
            case "findItem":for(Item item:list)if(item.id==(Integer)args[0])return item.proxy;return null;
            case "add":Item item=new Item(args.length==4?(Integer)args[1]:0,String.valueOf(args[args.length-1]));list.add(item);return item.proxy;
            default:if(method.getReturnType()==boolean.class)return false;return null;
        }}
    }
    void test()throws Exception {
        Context context=getTargetContext();ClassLoader loader=context.getClassLoader();
        Class<?> options=loader.loadClass("app.morphe.extension.chmate.WacchoiSearchOptions");
        Field field=options.getDeclaredField("PREFS");field.setAccessible(true);
        SharedPreferences prefs=context.getSharedPreferences((String)field.get(null),0);
        String[] keys={"threadOverflowSearch","threadOverflowResponseSelection"};
        Map<String,?> before=prefs.getAll();
        Method menu=loader.loadClass("app.morphe.extension.chmate.MultiResponseNg").getMethod("menu",Object.class,Menu.class);
        try{
            prefs.edit().remove(keys[0]).remove(keys[1]).commit();
            Items items=new Items();Item search=new Item(1,"検索");items.list.add(search);
            menu.invoke(null,new Object(),items.proxy);
            ok(!search.visible,"search defaults OFF");ok(items.proxy.findItem(0x4847381).isVisible(),"response multi-selection defaults ON");
            prefs.edit().putBoolean(keys[0],true).putBoolean(keys[1],false).commit();
            items=new Items();search=new Item(1,"検索");items.list.add(search);menu.invoke(null,new Object(),items.proxy);
            ok(search.visible,"search can be enabled");ok(!items.proxy.findItem(0x4847381).isVisible(),"response multi-selection can be disabled");
            search.visible=false;menu.invoke(null,new Object(),items.proxy);
            ok(!search.visible,"native toolbar-hidden Search is not forced visible");ok(items.list.size()==2,"repeated preparation does not duplicate items");
        }finally{SharedPreferences.Editor edit=prefs.edit();for(String key:keys){Object value=before.get(key);if(value instanceof Boolean)edit.putBoolean(key,(Boolean)value);else edit.remove(key);}edit.commit();}
        Class<?> profiles=loader.loadClass("app.morphe.extension.chmate.SettingsProfiles");
        Method read=profiles.getDeclaredMethod("prefs",Context.class);read.setAccessible(true);
        SharedPreferences general=(SharedPreferences)read.invoke(null,context);
        String keyword="homeKeywordDisplayNameMenu",order="homeThreadCustomOrderEnabled";
        Map<String,?> saved=general.getAll();
        Method homeMenu=loader.loadClass("app.morphe.extension.chmate.HomeThreadOrder").getMethod("menu",Object.class,Menu.class);
        try{
            general.edit().remove(keyword).remove(order).commit();
            Items items=new Items();homeMenu.invoke(null,new Object(),items.proxy);
            ok(!items.proxy.findItem(0x48690139).isVisible(),"keyword display-name menu defaults OFF");
            general.edit().putBoolean(keyword,true).commit();homeMenu.invoke(null,new Object(),items.proxy);
            ok(items.proxy.findItem(0x48690139).isVisible(),"keyword display-name menu can be enabled");
            Method enabled=loader.loadClass("app.morphe.extension.chmate.HomeThreadOrder").getDeclaredMethod("enabled");enabled.setAccessible(true);
            ok((Boolean)enabled.invoke(null),"HOME ordering defaults ON");
            general.edit().putBoolean(order,false).commit();ok(!(Boolean)enabled.invoke(null),"HOME ordering can be disabled");
        }finally{SharedPreferences.Editor edit=general.edit();for(String key:new String[]{keyword,order}){Object value=saved.get(key);if(value instanceof Boolean)edit.putBoolean(key,(Boolean)value);else edit.remove(key);}edit.commit();}
    }
}
