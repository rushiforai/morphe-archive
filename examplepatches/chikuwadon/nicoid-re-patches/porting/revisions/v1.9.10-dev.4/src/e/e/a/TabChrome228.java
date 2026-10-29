package e.e.a;
import android.app.Activity;import java.util.*;
/** Hidden fragments may complete network loads; they must not overwrite the visible toolbar. */
public final class TabChrome228 {
 static final WeakHashMap<Object,String[]> CHROME=new WeakHashMap<Object,String[]>();
 public static android.content.Intent fragmentIntent(Object owner,Activity a){try{return new android.content.Intent(android.content.Intent.ACTION_VIEW,android.net.Uri.parse(String.valueOf(MultiTabs227.get(owner,"d0")))).putExtra("type",((Number)MultiTabs227.get(owner,"g0")).intValue());}catch(Exception e){return a.getIntent();}}
 static boolean current(Object owner){try{Activity a=(Activity)MultiTabs227.get(owner,"o0");MultiTabs227.Host h=MultiTabs227.HOSTS.get(a);return !MultiTabs227.enabled()||h==null||h.current==owner;}catch(Exception e){return true;}}
 static void bar(Object bar,String method,CharSequence text){try{MultiTabs227.invoke(bar,method,new Class<?>[]{CharSequence.class},text);}catch(Exception e){android.util.Log.w("nicoid-tabs","Cannot update native toolbar",e);}}
 public static void title(Object bar,CharSequence text,Object owner){String[] s=CHROME.get(owner);if(s==null){s=new String[]{"",""};CHROME.put(owner,s);}s[0]=text==null?"":text.toString();if(current(owner))bar(bar,"b",text);}
 public static void subtitle(Object bar,CharSequence text,Object owner){text=RankingCaption232.subtitle(owner,text);String[] s=CHROME.get(owner);if(s==null){s=new String[]{"",""};CHROME.put(owner,s);}s[1]=text==null?"":text.toString();if(current(owner))bar(bar,"a",text);}
 static void restore(Object owner,SavedTabs227.Tab t){try{Activity a=(Activity)MultiTabs227.get(owner,"o0");Object bar=MultiTabs227.get(a,"t");String[] s=CHROME.get(owner);String sub=s==null?t.subtitle:s[1];if(s==null)try{Object model=MultiTabs227.get(owner,"c0");Object value=MultiTabs227.get(model,"d");if(value!=null)sub=String.valueOf(value);}catch(Exception ignored){}a.setTitle(t.label);bar(bar,"b",t.label);bar(bar,"a",RankingCaption232.subtitle(owner,sub));}catch(Exception e){android.util.Log.w("nicoid-tabs","Cannot restore list toolbar",e);}}
}
