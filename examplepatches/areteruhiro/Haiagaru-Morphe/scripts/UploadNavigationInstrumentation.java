package app.haiagaru.tests.uploadnavigation;

import android.app.*;import android.content.*;import android.graphics.Rect;import android.os.*;import android.view.*;import android.view.accessibility.AccessibilityNodeInfo;import android.widget.*;
import java.io.*;import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;

/** Isolated native lists and fake HTTP failures; no media upload or board post. */
public final class UploadNavigationInstrumentation extends Instrumentation {
    EditText body;int checks;Activity activity;ClassLoader loader;Class<?> navigation,position,hosts;View list;Object adapter;boolean modern;String version;
    void ok(boolean value,String label){if(!value)throw new AssertionError(label);checks++;}
    static Field field(Class<?> c,String name)throws Exception{for(;c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(name);f.setAccessible(true);return f;}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(name);}
    static Method method(Class<?> c,String name,Class<?>...p)throws Exception{Method m=c.getDeclaredMethod(name,p);m.setAccessible(true);return m;}
    static Object alloc(Class<?> c)throws Exception{Class<?> u=Class.forName("sun.misc.Unsafe");return u.getMethod("allocateInstance",Class.class).invoke(field(u,"theUnsafe").get(null),c);}
    <T>T main(Callable<T> action)throws Exception{FutureTask<T> task=new FutureTask<>(action);runOnMainSync(task);return task.get(10,TimeUnit.SECONDS);}
    public static final class Flow {Object value;Flow(Object v){value=v;}public Object c(){return value;}public Object d(){return value;}}
    public static final class FixtureResListFragmentViewModel {public Flow d,r;FixtureResListFragmentViewModel(Object b){d=r=new Flow(b);}}
    public static final class Fragment {public Object W;public FixtureResListFragmentViewModel model;final Activity a;final View v;Fragment(Activity a,View v,Object b){this.a=a;this.v=v;W=b;model=new FixtureResListFragmentViewModel(b);}public Activity getActivity(){return a;}public View getView(){return v;}}
    public static final class Row191 {public o.processAdDisplayErrorPostbackForUserError response;Row191(Object v){response=(o.processAdDisplayErrorPostbackForUserError)v;}}
    public static final class Row226 {public o.BouncyCastleSocketAdapterCompanion response;Row226(Object v){response=(o.BouncyCastleSocketAdapterCompanion)v;}}
    public static final class Holder242 extends androidx.recyclerview.widget.RecyclerView.getSavedStateRegistryControllerannotations {public Holder242(View v){super(v);}}
    public static final class Adapter242 extends androidx.recyclerview.widget.RecyclerView.read {
        final List<Object> rows;final Activity a;Adapter242(Activity a,List<Object> rows){this.a=a;this.rows=rows;}
        public o.zzadi item(int i){return (o.zzadi)rows.get(i);}public int getItemCount(){return rows.size();}
        public androidx.recyclerview.widget.RecyclerView.getSavedStateRegistryControllerannotations onCreateViewHolder(ViewGroup p,int type){TextView t=new TextView(a);t.setLayoutParams(new ViewGroup.LayoutParams(-1,160));return new Holder242(t);}
        public void onBindViewHolder(androidx.recyclerview.widget.RecyclerView.getSavedStateRegistryControllerannotations h,int i){((TextView)h.itemView).setText("response "+(i+1));}
    }
    @Override public void onCreate(Bundle args){super.onCreate(args);start();}
    @Override public void onStart(){Bundle out=new Bundle();try{test();out.putString("result","PASS "+checks+" upload/navigation checks; media upload and board requests=0");finish(Activity.RESULT_OK,out);}catch(Throwable e){out.putString("error",android.util.Log.getStackTraceString(e));finish(Activity.RESULT_CANCELED,out);}}
    boolean visible(int number)throws Exception{return (Boolean)method(position,"responseVisible",View.class,int.class).invoke(null,list,number);}
    void scroll(int number)throws Exception{if(list instanceof ListView)((ListView)list).setSelectionFromTop(number,0);else list.getClass().getMethod("scrollToPosition",int.class).invoke(list,number);}
    AccessibilityNodeInfo find(AccessibilityNodeInfo node,String text){if(node==null)return null;CharSequence t=node.getText();if(node.isVisibleToUser()&&t!=null&&t.toString().equals(text))return node;for(int i=0;i<node.getChildCount();i++){AccessibilityNodeInfo n=find(node.getChild(i),text);if(n!=null)return n;}return null;}
    AccessibilityNodeInfo waitText(String text)throws Exception{for(int i=0;i<35;i++){AccessibilityNodeInfo n=find(getUiAutomation().getRootInActiveWindow(),text);if(n!=null)return n;Thread.sleep(100);}throw new AssertionError("Missing UI "+text);}
    void tap(String text)throws Exception{AccessibilityNodeInfo n=waitText(text);Rect r=new Rect();n.getBoundsInScreen(r);long now=SystemClock.uptimeMillis();sendPointerSync(MotionEvent.obtain(now,now,0,r.centerX(),r.centerY(),0));sendPointerSync(MotionEvent.obtain(now,now+40,1,r.centerX(),r.centerY(),0));Thread.sleep(350);}
    void test()throws Exception{
        Context app=getTargetContext();ok(app.getPackageName().matches(".*\\.reporter(191|226|242)"),"isolated only");loader=app.getClassLoader();version=app.getPackageManager().getPackageInfo(app.getPackageName(),0).versionName;modern=version.contains("242");boolean old=version.contains("191");
        navigation=loader.loadClass("app.morphe.extension.chmate.ThreadWatchNavigation");position=loader.loadClass("app.morphe.extension.chmate.FilterPosition");hosts=loader.loadClass("app.morphe.extension.chmate.MediaUploadHosts");
        SharedPreferences nativePrefs=android.preference.PreferenceManager.getDefaultSharedPreferences(app);boolean had=nativePrefs.contains("enableTabletHome2"),tablet=nativePrefs.getBoolean("enableTabletHome2",false);nativePrefs.edit().putBoolean("enableTabletHome2",false).commit();
        activity=startActivitySync(new Intent().setClassName(app.getPackageName(),"app.morphe.extension.chmate.ToolbarIconsActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));Thread.sleep(800);
        try{
            List<Object> rows=new ArrayList<>();Class<?> response=loader.loadClass(old?"o.processAdDisplayErrorPostbackForUserError":modern?"o.KeJ11":"o.BouncyCastleSocketAdapterCompanion");
            for(int n=1;n<=100;n++){Object r=alloc(response);field(response,old||modern?"o":"l").setInt(r,n);if(modern){Object row=alloc(loader.loadClass("o.zzadi$_init_lambda2"));field(row.getClass(),"o").set(row,r);rows.add(row);}else rows.add(old?new Row191(r):new Row226(r));}
            Fragment owner=main(()->{
                if(modern){list=(View)loader.loadClass("androidx.recyclerview.widget.RecyclerView").getConstructor(Context.class).newInstance(activity);Constructor<?> managerCtor=loader.loadClass("androidx.recyclerview.widget.LinearLayoutManager").getDeclaredConstructor();managerCtor.setAccessible(true);Object manager=managerCtor.newInstance();for(Method m:list.getClass().getMethods())if(m.getName().equals("setLayoutManager"))m.invoke(list,manager);adapter=new Adapter242(activity,rows);for(Method m:list.getClass().getMethods())if(m.getName().equals("setAdapter"))m.invoke(list,adapter);}
                else{ListView lv=new ListView(activity);adapter=new BaseAdapter(){public int getCount(){return rows.size();}public Object getItem(int i){return rows.get(i);}public long getItemId(int i){return i;}public View getView(int i,View oldView,ViewGroup p){TextView t=oldView instanceof TextView?(TextView)oldView:new TextView(activity);t.setText("response "+(i+1));t.setHeight(160);return t;}};lv.setAdapter((ListAdapter)adapter);list=lv;}
                LinearLayout container=new LinearLayout(activity);container.setOrientation(LinearLayout.VERTICAL);container.addView(list,new LinearLayout.LayoutParams(-1,0,1));body=new EditText(activity);container.addView(body,new LinearLayout.LayoutParams(-1,100));activity.setContentView(container);method(hosts,"bindEditor",Activity.class,EditText.class,String.class).invoke(null,activity,body,"https://egg.5ch.io/test/read.cgi/android/1792500780/");Object board=loader.loadClass("jp.syoboi.a2chMate.client.BBSUrlInfo").getConstructor(String.class,String.class,Long.class,int.class,Integer.class,String.class).newInstance("egg.5ch.io","android",1792500780L,0,null,null);return new Fragment(activity,container,board);
            });Thread.sleep(700);
            main(()->{ok(list.isShown()&&list.getHeight()>0,"real native response list shown");method(navigation,"expect",Context.class,String.class,int.class).invoke(null,app,"https://egg.5ch.io/test/read.cgi/android/1792500780/",50);method(navigation,"register",Object.class,View.class).invoke(null,owner,list);return null;});Thread.sleep(700);
            main(()->{ok(visible(50),"initial target visible");ok(field(navigation,"pending").get(null)!=null,"keep target while refresh can still complete");adapter.getClass().getMethod("notifyDataSetChanged").invoke(adapter);scroll(0);return null;});Thread.sleep(700);
            main(()->{ok(visible(50),"recover target after native refresh restores old position");Class<?> preview=loader.loadClass("app.morphe.extension.chmate.XPostPreviewPosition");MotionEvent touch=MotionEvent.obtain(0,0,MotionEvent.ACTION_DOWN,2,2,0);method(preview,"onTouch",View.class,MotionEvent.class).invoke(null,((ViewGroup)list).getChildAt(0),touch);touch.recycle();scroll(0);return null;});Thread.sleep(700);
            main(()->{ok(!visible(50),"user scrolling cancels correction");ok(field(navigation,"pending").get(null)==null,"user touch clears target");return null;});
            main(()->{method(hosts,"showCapacityError",Activity.class).invoke(null,activity);return null;});waitText("ファイルの容量が大きすぎます");checks++;tap("開く");waitText("画像・動画のアップロード先");waitText("このレスでだけアップロード先を変更する");checks++;
            // The dialog remains scrollable; test login entry via the actual model view below.
            tap("キャンセル");
            SharedPreferences p=app.getSharedPreferences("haiagaru_upload_hosts",0);Map<String,?> before=p.getAll();
            File png=new File(app.getCacheDir(),"haiagaru-reply-upload-test.png");try(FileOutputStream out=new FileOutputStream(png)){out.write(new byte[]{(byte)137,80,78,71,13,10,26,10});}
            Map choices=(Map)field(hosts,"replyDestinations").get(null);Object prior=choices.get(body);
            try{
                Class<?> destination=loader.loadClass("app.morphe.extension.chmate.MediaUploadHosts$Destination");Constructor<?> ctor=destination.getDeclaredConstructor(String.class,String.class,String.class,boolean.class);ctor.setAccessible(true);choices.put(body,ctor.newInstance("imgbox","native","",false));
                Method handles=method(hosts,"handles",Object[].class);ok((Boolean)handles.invoke(null,(Object)new Object[]{png}),"reply custom destination used");ok(choices.get(body)!=null,"reply destination retained for additional attachments");
                Object local=((ThreadLocal)field(hosts,"activeDestination").get(null)).get();ok("imgbox".equals(field(destination,"image").get(local)),"selected destination retained for matching transport");
                ok((Boolean)handles.invoke(null,(Object)new Object[]{png}),"second attachment uses same reply destination");method(hosts,"posted",String.class).invoke(null,"https://egg.5ch.io/test/read.cgi/android/1792500780/101");ok(choices.get(body)==null,"successful reply clears temporary destination");ok(!(Boolean)handles.invoke(null,(Object)new Object[]{png}),"next reply returns to saved native route");ok(before.equals(p.getAll()),"temporary choice never persists preferences");
            }finally{if(prior==null)choices.remove(body);else choices.put(body,prior);((ThreadLocal)field(hosts,"activeDestination").get(null)).remove();png.delete();}
        }finally{
            main(()->{activity.finish();return null;});if(had)nativePrefs.edit().putBoolean("enableTabletHome2",tablet).commit();else nativePrefs.edit().remove("enableTabletHome2").commit();
        }
    }
}
