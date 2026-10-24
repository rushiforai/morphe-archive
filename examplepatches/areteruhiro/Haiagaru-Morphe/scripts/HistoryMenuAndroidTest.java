package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.SharedPreferences;
import android.view.Menu;
import android.view.View;
import android.widget.PopupMenu;
import java.lang.reflect.Method;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.function.Consumer;

/** UI-thread-only menu fixture; all preferences restored, no NG registration. */
public final class HistoryMenuAndroidTest {
    public static final class Target { public Object c; }
    public static final class Board { public Object b; }
    public static final class Parent { public Object o,r; public String neighbor="(ﾜｯﾁｮｲ ffff-zzzz)"; }
    static int checks;
    static void check(boolean value,String label){if(!value)throw new AssertionError(label);checks++;}
    static Object call(Activity a,String name,Class<?>[] types,Object... args)throws Exception{
        Method m=Class.forName("app.morphe.extension.chmate.ResponseMenuSettings",true,a.getClassLoader()).getDeclaredMethod(name,types);
        m.setAccessible(true);return m.invoke(null,args);
    }
    public static String run(Activity activity)throws Exception{
        if(!activity.getPackageName().endsWith(".resumefix242"))throw new AssertionError("242 verification only");
        checks=0;
        SharedPreferences prefs=activity.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0);
        Map<String,Object> before=new LinkedHashMap<>();
        for(String key:new String[]{"responseExtraTools","responseArchiveEnabled"})before.put(key,prefs.getAll().get(key));
        try{
            Menu menu=new PopupMenu(activity,new View(activity)).getMenu();
            Consumer<Menu> fill=target->target.add("診断項目");
            prefs.edit().putBoolean("responseExtraTools",false).commit();
            call(activity,"addTools",new Class<?>[]{Menu.class,Consumer.class},menu,fill);
            check(menu.size()==0,"extra tools OFF");
            prefs.edit().putBoolean("responseExtraTools",true).commit();
            call(activity,"addTools",new Class<?>[]{Menu.class,Consumer.class},menu,fill);
            check(menu.size()==1&&"追加ツール".contentEquals(menu.getItem(0).getTitle()),"extra tools ON");
            call(activity,"addTools",new Class<?>[]{Menu.class,Consumer.class},menu,fill);
            check(menu.size()==1,"no duplicate on menu reuse");
            call(activity,"prepare",new Class<?>[]{Object.class},menu);
            check(menu.size()==0,"stale response action removed");
            prefs.edit().putBoolean("responseArchiveEnabled",false).commit();
            check(!(Boolean)call(activity,"visible",new Class<?>[]{int.class},0x7e484a01),"archive master OFF");
            ClassLoader loader=activity.getClassLoader();
            Object response=Class.forName("o.KeJ11",true,loader).getConstructor(String.class,String.class,String.class).newInstance("診断","2026/10/21","本文");
            java.lang.reflect.Field name=response.getClass().getDeclaredField("n");name.setAccessible(true);name.set(response,"名無し (ﾜｯﾁｮｲ ab12-Cd34)");
            Target target=new Target();target.c=response;
            Board board=new Board();board.b=DroppedThreadsAndroidTest.board(activity);
            Parent parent=new Parent();parent.o=target;parent.r=board;
            Method find=Class.forName("app.morphe.extension.chmate.WacchoiLongPressMenu",true,loader).getDeclaredMethod("findContext",Object.class,Object.class);find.setAccessible(true);
            Object context=find.invoke(null,null,parent);
            check(context!=null,"242 selected response context");
            java.lang.reflect.Field query=context.getClass().getDeclaredField("query");query.setAccessible(true);
            check(query.get(context).toString().contains("ab12-Cd34"),"242 selected token rather than neighboring token");
            return "PASS "+checks+" menu checks";
        }finally{
            SharedPreferences.Editor edit=prefs.edit();
            for(Map.Entry<String,Object> entry:before.entrySet())if(entry.getValue()==null)edit.remove(entry.getKey());else edit.putBoolean(entry.getKey(),(Boolean)entry.getValue());
            edit.commit();
        }
    }
}
