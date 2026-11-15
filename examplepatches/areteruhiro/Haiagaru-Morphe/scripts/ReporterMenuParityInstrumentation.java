package app.haiagaru.tests.reportermenu;

import android.app.*;
import android.content.*;
import android.os.*;
import android.view.accessibility.AccessibilityNodeInfo;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.regex.Pattern;

/** Real native NG entry points on isolated apps; synthetic registrations are restored. */
public final class ReporterMenuParityInstrumentation extends Instrumentation {
    private Activity host;
    private Context app;
    private ClassLoader loader;
    private String version;
    private Class<?> history, storeType;
    private Object store, nativeStore, category, board, legacyDialog;
    private Method entry, entries;
    private ArrayList<Object> snapshot;
    private SharedPreferences config, personal;
    private Map<String,?> oldConfig, oldPersonal;
    private boolean baseline;
    private int checks;
    private static final String TITLE="Haiagaru fixture [A1b2C3d4★]";
    private static final String KEY="bbs.eddibb.cc%2Fliveedge";
    private static final String[] LABELS={"記者IDだけをNG","前半4桁NG","後半4桁NG","記者ID・スレ名で過去スレ検索"};
    private void ok(boolean value,String label){if(!value)throw new AssertionError(label);checks++;}
    private Method method(Class<?> type,String name,Class<?>...args)throws Exception{Method m=type.getDeclaredMethod(name,args);m.setAccessible(true);return m;}
    private Field field(Class<?> type,String name)throws Exception{Field f=type.getDeclaredField(name);f.setAccessible(true);return f;}
    private <T>T main(Callable<T> action)throws Exception{FutureTask<T> t=new FutureTask<>(action);runOnMainSync(t);return t.get(15,TimeUnit.SECONDS);}
    private AccessibilityNodeInfo find(AccessibilityNodeInfo n,String s){if(n==null)return null;if(n.isVisibleToUser()&&n.getText()!=null&&n.getText().toString().startsWith(s))return n;for(int i=0;i<n.getChildCount();i++){AccessibilityNodeInfo f=find(n.getChild(i),s);if(f!=null)return f;}return null;}
    private boolean scroll(AccessibilityNodeInfo n){if(n==null)return false;if(n.isScrollable()&&n.performAction(AccessibilityNodeInfo.ACTION_SCROLL_FORWARD))return true;for(int i=0;i<n.getChildCount();i++)if(scroll(n.getChild(i)))return true;return false;}
    private String visible(AccessibilityNodeInfo n){if(n==null)return "";String s=n.getText()==null?"":n.getText().toString()+" | ";for(int i=0;i<n.getChildCount();i++)s+=visible(n.getChild(i));return s;}
    private AccessibilityNodeInfo waitText(String s)throws Exception{for(int i=0;i<50;i++){AccessibilityNodeInfo n=find(getUiAutomation().getRootInActiveWindow(),s);if(n!=null)return n;if(i>5&&i%5==0)scroll(getUiAutomation().getRootInActiveWindow());Thread.sleep(100);}throw new AssertionError("Missing "+s+"; "+visible(getUiAutomation().getRootInActiveWindow()));}
    private void tap(String s)throws Exception{AccessibilityNodeInfo n=waitText(s);while(n!=null&&!n.isClickable())n=n.getParent();ok(n!=null&&n.performAction(AccessibilityNodeInfo.ACTION_CLICK),"tap "+s);Thread.sleep(400);}
    private void open()throws Exception{
        main(()->{
            if(version.equals("191")){
                Method manager=null;for(Method m:host.getClass().getMethods())if(m.getParameterTypes().length==0&&m.getReturnType().getName().equals("androidx.fragment.app.FragmentManager")){manager=m;break;}
                if(manager==null)throw new NoSuchMethodException("native fragment manager");
                legacyDialog=entry.invoke(null,host,manager.invoke(host),TITLE,category,board);
            }else entry.invoke(null,host,TITLE,category,board);
            return null;
        });
        for(String s:LABELS)ok(waitText(s)!=null,"native entry exposes "+s);
    }
    private void dismissLegacy()throws Exception{if(legacyDialog!=null){Object current=legacyDialog;legacyDialog=null;main(()->{current.getClass().getMethod("dismiss").invoke(current);return null;});Thread.sleep(300);}}
    @Override public void onCreate(Bundle b){super.onCreate(b);baseline=b!=null&&"1".equals(b.getString("baseline"));start();}
    @Override public void onStart(){Bundle out=new Bundle();try{test();out.putString("result","PASS "+checks+" native reporter menu/store/search parity checks; network/submissions=0");finish(Activity.RESULT_OK,out);}catch(Throwable t){out.putString("error",android.util.Log.getStackTraceString(t));finish(Activity.RESULT_CANCELED,out);}}
    private void test()throws Exception{
        app=getTargetContext();ok(app.getPackageName().matches(".*\\.reporter(191|226|242)"),"isolated target only");version=app.getPackageName().substring(app.getPackageName().length()-3);loader=app.getClassLoader();
        config=app.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0);personal=app.getSharedPreferences("haiagaru.personal-ng-submissions",0);oldConfig=new HashMap<>(config.getAll());oldPersonal=new HashMap<>(personal.getAll());
        personal.edit().putBoolean("consent",false).commit();config.edit().putBoolean("edgeReporterId",true).putBoolean("reporterSearchEnabled",true).commit();
        try{
            host=startActivitySync(new Intent().setClassName(app.getPackageName(),"jp.syoboi.a2chMate.activity.SettingActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));Thread.sleep(700);
            history=loader.loadClass("app.morphe.extension.chmate.EdgeReporterHistory");storeType=loader.loadClass("app.morphe.extension.chmate.NativeNgStore");Constructor<?> constructor=storeType.getDeclaredConstructor(Context.class,String.class);constructor.setAccessible(true);
            main(()->{
                for(String kind:new String[]{"THREAD","ID","NAME","WORD"}){Object s=constructor.newInstance(host,kind);ok(method(storeType,"entries").invoke(s) instanceof List,"native "+kind+" store readable");}
                store=constructor.newInstance(host,"THREAD");nativeStore=field(storeType,"store").get(store);category=field(storeType,"category").get(store);entries=method(storeType,"entries");
                Method reader=(Method)field(storeType,"snapshot").get(store);snapshot=new ArrayList<>((List<Object>)reader.invoke(nativeStore));
                Class<?> b=loader.loadClass(version.equals("191")?"jp.syoboi.a2chMate.client.BBSUrlInfo$BoardID":"jp.syoboi.a2chMate.client.BoardID");Constructor<?> boardConstructor=b.getDeclaredConstructor(String.class,String.class,String.class,String.class);boardConstructor.setAccessible(true);board=boardConstructor.newInstance("bbs.eddibb.cc","liveedge",KEY,"エッヂ");ok(KEY.equals(board.toString()),"real board key retained");
                String owner=version.equals("191")?"o.MaxFullscreenAdImplExternalSyntheticLambda4":version.equals("226")?"o.getSegmentsokio":"o.getLandscapeInlineAdaptiveBannerAdSize";
                for(Method m:loader.loadClass(owner).getDeclaredMethods())if(m.getName().equals("e")&&Modifier.isStatic(m.getModifiers())&&Arrays.asList(m.getParameterTypes()).contains(category.getClass())&&m.getParameterTypes().length==(version.equals("191")?5:4)&&m.getParameterTypes()[0].getName().equals(version.equals("191")?"android.content.Context":"androidx.fragment.app.FragmentActivity")){entry=m;entry.setAccessible(true);break;}
                ok(entry!=null,"actual native editor entry bound");return null;
            });
            if(baseline){boolean handled=main(()->(Boolean)method(history,"choose",Activity.class,String.class,Object.class,Object.class).invoke(null,host,TITLE,category,board));ok(handled==version.equals("226"),"pre-fix 226 handled / 242 missing reproduced");if(handled)tap("キャンセル");return;}
            Class<?> search=loader.loadClass("app.morphe.extension.chmate.ReporterSearch");
            for(int action=0;action<3;action++){
                open();tap(LABELS[action]);final int mode=action;
                main(()->{
                    String expected=mode==0?"[A1b2C3d4★]":(String)method(search,"pattern",String.class,int.class).invoke(null,"[A1b2C3d4★]",mode);
                    boolean found=false;for(Object e:(List<?>)entries.invoke(store))if(expected.equals(field(e.getClass(),"pattern").get(e))&&KEY.equals(field(e.getClass(),"board").get(e))){found=true;ok(field(e.getClass(),"flags").getShort(e)==(mode==0?0x10:0x20),"native matching mode "+mode);}
                    ok(found,"native store receives reporter rule "+mode);if(mode!=0){Pattern p=Pattern.compile(expected);ok(p.matcher("題名 [A1b2C3d4★]").find(),"regex matches original ID");ok(!p.matcher("題名 [Z9x8W7v6★]").find(),"regex rejects unrelated ID");}return null;
                });dismissLegacy();
            }
            open();tap(LABELS[3]);ok(waitText("エッヂの過去スレ検索")!=null,"archive search form opens");ok(waitText("A1b2C3d4")!=null,"archive search receives exact reporter ID");tap("閉じる");dismissLegacy();
            if(!version.equals("191")){
                open();tap("スレタイでNG");Thread.sleep(500);ok(find(getUiAutomation().getRootInActiveWindow(),"前半4桁NG")==null,"native title editor opens without recursively reopening chooser");sendKeyDownUpSync(android.view.KeyEvent.KEYCODE_BACK);Thread.sleep(300);
                main(()->{config.edit().putBoolean("edgeReporterId",false).commit();ok(!(Boolean)method(history,"choose",Activity.class,String.class,Object.class,Object.class).invoke(null,host,TITLE,category,board),"OFF retains original editor");config.edit().putBoolean("edgeReporterId",true).commit();ok(!(Boolean)method(history,"choose",Activity.class,String.class,Object.class,Object.class).invoke(null,host,"no reporter",category,board),"plain title retains original editor");return null;});
            }
        }finally{
            main(()->{if(snapshot!=null){Method save=(Method)field(storeType,"save").get(store);save.invoke(nativeStore,snapshot);}if(host!=null)host.finish();return null;});restore(config,oldConfig);restore(personal,oldPersonal);
        }
    }
    private static void restore(SharedPreferences p,Map<String,?> values){SharedPreferences.Editor e=p.edit().clear();for(Map.Entry<String,?> r:values.entrySet()){Object v=r.getValue();String k=r.getKey();if(v instanceof Boolean)e.putBoolean(k,(Boolean)v);else if(v instanceof Integer)e.putInt(k,(Integer)v);else if(v instanceof Long)e.putLong(k,(Long)v);else if(v instanceof Float)e.putFloat(k,(Float)v);else if(v instanceof String)e.putString(k,(String)v);else if(v instanceof Set)e.putStringSet(k,(Set<String>)v);}e.commit();}
}
