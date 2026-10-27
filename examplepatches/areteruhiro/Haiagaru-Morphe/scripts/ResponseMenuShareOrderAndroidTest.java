package app.morphe.extension.chmate;

import android.content.ComponentName;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.res.Resources;
import android.view.Menu;
import android.view.MenuItem;
import java.lang.reflect.*;
import java.util.*;
import org.json.*;

/** app_process fixture: native menu + production ordering; no app prefs, UI or share launch. */
public final class ResponseMenuShareOrderAndroidTest {
    static int checks;
    static void check(boolean ok,String label) { checks++; if(!ok)throw new AssertionError(label); }
    static Menu menu(String type)throws Exception {
        Context context=new ContextWrapper(null) {
            @Override public Resources getResources(){return Resources.getSystem();}
            @Override public Context getApplicationContext(){return this;}
            @Override public String getPackageName(){return "haiagaru.share.order.fixture";}
        };
        Class<?> cls=Class.forName(type);
        for(Constructor<?> ctor:cls.getConstructors()) {
            Class<?>[] p=ctor.getParameterTypes();
            if(p.length==1&&p[0]==Context.class)return (Menu)ctor.newInstance(context);
            if(p.length==2&&p[0]==Context.class&&!p[1].isPrimitive())return (Menu)ctor.newInstance(context,null);
        }
        throw new AssertionError("Native menu constructor unavailable");
    }
    static JSONObject saved(int... ids)throws Exception {
        JSONArray buttons=new JSONArray();
        for(int id:ids)buttons.put(new JSONObject().put("id",id).put("visible",true));
        return new JSONObject().put("buttons",buttons);
    }
    static List<Integer> ids(Menu menu) {
        List<Integer> ids=new ArrayList<>();for(int n=0;n<menu.size();n++)ids.add(menu.getItem(n).getItemId());return ids;
    }
    static void apply(Menu menu,JSONObject saved)throws Exception {
        Method method=Class.forName("app.morphe.extension.chmate.ResponseMenuSettings").getDeclaredMethod("applySavedOrder",Object.class,JSONObject.class);
        method.setAccessible(true);method.invoke(null,menu,saved);
    }
    public static void main(String[] args)throws Exception {
        System.out.println("START native menu fixture "+args[0]);
        Menu menu=menu(args[0]);
        int[] original={50,51,70,71,72,73,74,0x7e484a01,0x7e484b01,999,998};
        Map<Integer,MenuItem> identity=new HashMap<>();Map<Integer,Intent> intents=new HashMap<>();
        for(int id:original) {
            MenuItem item=menu.add(0,id,0,"fixture "+id);identity.put(id,item);
            if(id>=70&&id<=74) {
                Intent intent=new Intent(Intent.ACTION_SEND).setType("text/plain")
                    .setComponent(new ComponentName("fixture.app","fixture.app.Destination"+id))
                    .putExtra(Intent.EXTRA_TEXT,"response "+id);
                item.setIntent(intent);intents.put(id,intent);
            }
        }
        List<Integer> initial=ids(menu);apply(menu,new JSONObject());check(ids(menu).equals(initial),"missing settings preserves native order");
        apply(menu,saved(51,50));check(ids(menu).equals(initial),"no saved share leaves old behavior");
        JSONObject order=saved(74,51,0x7e484a01,72,70,50,0x7e484b01,73,71);
        String before=order.toString();apply(menu,order);
        check(ids(menu).equals(Arrays.asList(74,51,0x7e484a01,72,70,50,0x7e484b01,73,71,999,998)),"share slots interleave native and added items");
        check(before.equals(order.toString()),"saved JSON not rewritten");
        for(int id:original) {
            check(menu.findItem(id)==identity.get(id),"native item identity retained "+id);
            if(intents.containsKey(id)) {
                check(menu.findItem(id).getIntent()==intents.get(id),"share Intent identity retained "+id);
                check(menu.findItem(id).getIntent().getComponent().getClassName().equals("fixture.app.Destination"+id),"share destination retained "+id);
            }
        }
        List<Integer> once=ids(menu);apply(menu,order);check(ids(menu).equals(once),"repeated finalization is stable");
        menu.findItem(72).setVisible(false);menu.findItem(71).setEnabled(false);
        JSONObject explicit=saved(50,70,71,72,73,74);
        explicit.getJSONArray("buttons").getJSONObject(0).put("position",20);
        explicit.getJSONArray("buttons").getJSONObject(1).put("id","0x46").put("order",-1);
        explicit.getJSONArray("buttons").put(new JSONObject().put("id",70).put("position",99));
        explicit.getJSONArray("buttons").put("invalid row");
        apply(menu,explicit);
        check(ids(menu).indexOf(70)<ids(menu).indexOf(50),"hex ID, explicit order/position and first duplicate retained");
        check(!menu.findItem(72).isVisible()&&!menu.findItem(71).isEnabled(),"native visibility and enabled state retained");
        check(menu.size()==original.length,"no action dropped or duplicated");
        System.out.println("PASS "+args[0]+": "+checks+" native remembered-share order checks; no prefs/network/UI changes");
    }
}
