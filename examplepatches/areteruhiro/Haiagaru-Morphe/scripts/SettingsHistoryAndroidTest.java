package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.*;
import org.json.*;
import java.lang.reflect.*;
import java.util.*;

/** Isolated values and page fixtures. No network calls or native history writes. */
public final class SettingsHistoryAndroidTest {
    static int checks;
    static void check(boolean ok,String label){if(!ok)throw new AssertionError(label);checks++;android.util.Log.i("HaiagaruTest","PASS "+label);}
    static ClassLoader loader;
    static Class<?> type(String n)throws Exception{return Class.forName("app.morphe.extension.chmate."+n,true,loader);}
    static Object call(String owner,String name,Class<?>[] t,Object... args)throws Exception{
        Method m=type(owner).getDeclaredMethod(name,t);m.setAccessible(true);
        try{return m.invoke(null,args);}catch(InvocationTargetException e){throw new Exception(e.getCause());}
    }
    static void rejected(JSONObject j,String label)throws Exception{
        boolean rejected=false;try{call("SettingsProfiles","validate",new Class<?>[]{JSONObject.class},j);}catch(Exception e){rejected=true;}check(rejected,label);
    }
    public static String run(Activity a)throws Exception{
        loader=a.getClassLoader();checks=0;
        call("SettingsProfiles","catalog",new Class<?>[]{Activity.class},a);
        JSONObject data=(JSONObject)call("SettingsProfiles","exportData",new Class<?>[]{Context.class},a);
        check("haiagaru-settings".equals(data.getString("format")),"profile format");
        check(data.getJSONObject("settings").length()>20,"profile includes catalog defaults");
        check(!data.toString().contains("cookieClass")&&!data.toString().contains("userAgent")&&!data.toString().contains("token"),"no credentials / arbitrary strings");
        Map<?,?> validated=(Map<?,?>)call("SettingsProfiles","validate",new Class<?>[]{JSONObject.class},data);
        check(validated.size()>20,"profile round trip validation");
        JSONObject bad=new JSONObject(data.toString()).put("version",2);rejected(bad,"unknown schema rejected");
        bad=new JSONObject(data.toString());bad.getJSONObject("settings").put("hideAd","false");rejected(bad,"boolean type strict");
        bad=new JSONObject(data.toString());bad.getJSONObject("settings").put("videoPreviewCount",1000);rejected(bad,"numeric range strict");
        JSONObject mixed=new JSONObject(data.toString());mixed.getJSONObject("settings").put("token","secret").put("minimalSetupPromptV1",true);
        Map<?,?> sanitized=(Map<?,?>)call("SettingsProfiles","validate",new Class<?>[]{JSONObject.class},mixed);
        check(!sanitized.containsKey("token")&&!sanitized.containsKey("minimalSetupPromptV1"),"unknown keys and prompt state ignored");
        Map<?,?> minimal=(Map<?,?>)call("SettingsProfiles","minimalValues",new Class<?>[]{});
        for(String k:new String[]{"hideAd","edgeReporterId","edgeReporterBoardList","automaticDat","dedicatedViewerEnabled","kyodemoEnhancedViewer","videoViewerEnabled","urlImageFetchEnabled"})
            check(Boolean.TRUE.equals(minimal.get(k)),"minimal enable "+k);
        for(String k:new String[]{"xPostPreviewEnabled","threadCommandsEnabled","imageVpnEnabled","groupBrowsingHistoryByBoard","quickFilterCounts","patrolImagesEnabled"})
            check(Boolean.FALSE.equals(minimal.get(k)),"minimal disable "+k);
        Class<?> cursor=type("SearchCursor");Constructor<?> ctor=cursor.getDeclaredConstructors()[0];ctor.setAccessible(true);
        Object hissi=ctor.newInstance(Arrays.asList("android","software"),"android,software","20261019","20261021","software",3,"Ab+/",false,100,null,0);
        Method encode=cursor.getDeclaredMethod("encode",String.class,String.class,String.class,Set.class);encode.setAccessible(true);
        JSONObject checkpoint=(JSONObject)encode.invoke(hissi,null,null,"",Collections.emptySet());
        Object loaded=call("SearchCursor","decode",new Class<?>[]{JSONObject.class},checkpoint);
        Field page=cursor.getDeclaredField("page");page.setAccessible(true);check(page.getInt(loaded)==3,"Hissi page restored");
        Object edge=ctor.newInstance(null,"","","","",0,"ID",false,100,new ArrayList<>(Arrays.asList("1792292838","1792292839")),1);
        String next="https://www.kyodemo.net/sdemo/b/e_e_liveedge/2/?kt=k_";
        String url="https://www.kyodemo.net/sdemo/r/e_e_liveedge/1792292839/n100-";
        JSONObject e=(JSONObject)encode.invoke(edge,next,url,"スレ",new LinkedHashSet<>(Arrays.asList(next)));
        Object edgeLoaded=call("SearchCursor","decode",new Class<?>[]{JSONObject.class},e);
        Field index=cursor.getDeclaredField("edgeIndex");index.setAccessible(true);check(index.getInt(edgeLoaded)==1,"Edge thread index restored");
        check(url.equals(e.getString("url"))&&e.getJSONArray("visited").length()==1,"Edge page / visited list retained");
        boolean failed=false;try{call("SearchCursor","decode",new Class<?>[]{JSONObject.class},new JSONObject(e.toString()).put("url","https://evil.example/sdemo/r/e_e_liveedge/1/"));}catch(Exception ex){failed=true;}
        check(failed,"checkpoint URL cannot change origin");
        failed=false;try{call("SearchCursor","decode",new Class<?>[]{JSONObject.class},new JSONObject());}catch(Exception ex){failed=true;}
        check(failed,"legacy history without checkpoint rejected clearly");
        return "PASS "+checks+" settings / preset / checkpoint checks";
    }
}
