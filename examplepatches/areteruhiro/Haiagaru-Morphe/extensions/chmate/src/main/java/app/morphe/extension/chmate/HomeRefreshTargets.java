package app.morphe.extension.chmate;

import android.content.Context;
import android.util.Log;
import java.util.*;

/** HOME view of the same registrations used by manual refresh and history. */
public final class HomeRefreshTargets {
    public static final int TAB=109;
    private static final Map<Object,Boolean> selected=new WeakHashMap<>();
    static synchronized void selected(Object home,int mode){selected.put(home,Math.abs(mode)==TAB);}
    static boolean active(Object home){
        synchronized(HomeRefreshTargets.class){if(Boolean.TRUE.equals(selected.get(home)))return true;}
        if(home==null||!home.getClass().getName().equals("jp.syoboi.a2chMate.ui.home.HomeFragment"))return false;
        try{
            Object model=home.getClass().getMethod("m").invoke(home);
            Object flow=NativeFields.find(model.getClass(),"o").get(model);
            return Math.abs(((Number)flow.getClass().getMethod("d").invoke(flow)).intValue())==TAB;
        }catch(Exception error){Log.w("Haiagaru","Refresh target HOME selection unavailable",error);return false;}
    }
    static List<?> filter(List<?> rows){
        ArrayList<Object> result=new ArrayList<>();
        Context context=Haiagaru.applicationContextForExtension();if(context==null||rows==null)return result;
        Set<String> keys=RefreshTargets.selected(context);if(keys.isEmpty())return result;
        for(Object row:rows){
            if(row==null)continue;
            String type=row.getClass().getName(),board,id;
            if(type.equals("o.onAdDisplayed$setIcon")){board="g";id="h";}
            else if(type.equals("o.Yy2$open")){board="b";id="g";}
            else if(type.equals("o.getAvailabilityStatus$r8lambdawJ5MHcSJed_CjC7r4OWD0UxyJsQ")){board="e";id="b";}
            else continue;
            try{
                Object nativeBoard=NativeFields.find(row.getClass(),board).get(row);
                long thread=NativeFields.find(row.getClass(),id).getLong(row);
                if(nativeBoard!=null&&keys.contains(nativeBoard.toString()+"\n"+thread))result.add(row);
            }catch(Exception error){Log.w("Haiagaru","Refresh target HOME identity unavailable",error);}
        }
        return result;
    }
    static int titleResource(int original){
        Context context=Haiagaru.applicationContextForExtension();if(context==null)return original;
        int id=context.getResources().getIdentifier("haiagaru_refresh_target_threads_description","string",context.getPackageName());
        return id==0?original:id;
    }
    private HomeRefreshTargets(){}
}
