package app.haiagaru.tests.editordialog;
import android.app.*;import android.content.*;import android.os.*;import android.view.*;import android.widget.*;
import android.graphics.Rect;
import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;

/** Native 242 editor comparison. Own test packages, no send actions or agreement acceptance. */
public final class EditorDialogInstrumentation extends Instrumentation {
 private Context app;private ClassLoader loader;private int checks;private final StringBuilder report=new StringBuilder();
 private volatile Activity resumedEditor;private boolean faults,fixture;
 @Override public void callActivityOnResume(Activity a){super.callActivityOnResume(a);if(a.getClass().getName().endsWith("ResEditActivity$Dialog"))resumedEditor=a;}
 private Method method(Class<?> c,String name,Class<?>...p)throws Exception{Method m=c.getDeclaredMethod(name,p);m.setAccessible(true);return m;}
 private void ok(boolean b,String text){if(!b)throw new AssertionError(text+"\n"+report);checks++;}
 private <T>T main(Callable<T> action)throws Exception{FutureTask<T> task=new FutureTask<>(action);runOnMainSync(task);return task.get(10,TimeUnit.SECONDS);}
 @Override public void onCreate(Bundle args){super.onCreate(args);faults=args!=null&&"true".equals(args.getString("faults"));fixture=args!=null&&"true".equals(args.getString("fixture"));start();}
 @Override public void onStart(){Bundle out=new Bundle();try{test();out.putString("result","PASS "+checks+" editor checks\n"+report);finish(Activity.RESULT_OK,out);}catch(Throwable t){out.putString("error",android.util.Log.getStackTraceString(t));out.putString("diagnostics",report.toString());finish(Activity.RESULT_CANCELED,out);}}
 private void test()throws Exception{
  app=getTargetContext();loader=app.getClassLoader();ok(app.getPackageName().endsWith("nativeeditor242")||app.getPackageName().endsWith("sitefix242")||app.getPackageName().endsWith("haiagaru.reporter242"),"isolated target only");
  if(fixture){fixture();return;}
  SharedPreferences p=android.preference.PreferenceManager.getDefaultSharedPreferences(app);Map<String,?> old=p.getAll();
  try{p.edit().putInt("postEditorType",2).putBoolean("enableTabletHome2",true).commit();
   direct(false);direct(true);
   ActivityMonitor tabletMonitor=addMonitor("jp.syoboi.a2chMate.activity.TabletHomeActivity",null,false);Activity tablet=null;
   try{
    app.startActivity(new Intent().setClassName(app.getPackageName(),"jp.syoboi.a2chMate.activity.TabletHomeActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
    tablet=waitForMonitorWithTimeout(tabletMonitor,10000);ok(tablet!=null,"tablet host starts");final Activity host=tablet;Thread.sleep(1000);
    // Match the native reply command used by the tablet's thread toolbar.
    ActivityMonitor editorMonitor=addMonitor("jp.syoboi.a2chMate.activity.ResEditActivity$Dialog",null,false);Activity editor=null;
    try{
     main(()->{method(loader.loadClass("o.TTRewardVideoActivity1"),"b",loader.loadClass("androidx.fragment.app.FragmentActivity"),loader.loadClass("jp.syoboi.a2chMate.fragment.RoidonListFragment"),int.class,String.class,String.class,Bundle.class)
      .invoke(null,host,null,71,"https://egg.5ch.io/test/read.cgi/android/1792500780/",null,null);return null;});
     editor=waitForMonitorWithTimeout(editorMonitor,10000);ok(editor!=null,"native tablet command launches dialog");measure(editor,"tablet-command");
    }finally{finish(editor);removeMonitor(editorMonitor);}
   }finally{finish(tablet);removeMonitor(tabletMonitor);}
  }finally{SharedPreferences.Editor e=p.edit();for(String key:new String[]{"postEditorType","enableTabletHome2"}){Object v=old.get(key);if(v instanceof Boolean)e.putBoolean(key,(Boolean)v);else if(v instanceof Integer)e.putInt(key,(Integer)v);else e.remove(key);}e.commit();}
 }
 // Native root and real Android measurement, without onboarding or a public thread.
 private void fixture()throws Exception{
  main(()->{
   android.content.pm.ActivityInfo info=new android.content.pm.ActivityInfo();info.applicationInfo=app.getApplicationInfo();info.name="jp.syoboi.a2chMate.activity.ResEditActivity$Dialog";
   Activity editor=newActivity(loader.loadClass(info.name),app,null,(Application)app.getApplicationContext(),new Intent().setClassName(app.getPackageName(),info.name),info,"Editor layout fixture",null,null,null);
   ViewGroup root=(ViewGroup)loader.loadClass("o.zzbgc").getConstructor(Context.class,android.util.AttributeSet.class).newInstance(editor,null);
   LinearLayout panel=new LinearLayout(editor);panel.setOrientation(LinearLayout.VERTICAL);
   EditText body=new EditText(editor);body.setId(2131296421);body.setMinLines(4);body.setText("retained draft");panel.addView(body,new LinearLayout.LayoutParams(-1,-2));
   Button send=new Button(editor);send.setText("send (never clicked)");panel.addView(send);root.addView(panel,new ViewGroup.LayoutParams(650,-2));
   for(int padding:new int[]{0,400,1000,1100,-100}){
    root.setPadding(0,0,0,padding);root.measure(View.MeasureSpec.makeMeasureSpec(800,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(1000,View.MeasureSpec.EXACTLY));
    root.layout(0,0,800,1000);method(root.getClass(),"onLayout",boolean.class,int.class,int.class,int.class,int.class).invoke(root,false,0,0,800,1000);
    report.append("fixture padding=").append(padding).append(" corrected=").append(root.getPaddingBottom()).append(" body=").append(body.getWidth()).append('x').append(body.getHeight()).append(" panel=").append(panel.getTop()).append(".. ").append(panel.getBottom()).append('\n');
    ok(root.getHeight()-root.getPaddingBottom()>0&&panel.getTop()>=0&&panel.getBottom()<=root.getHeight()-root.getPaddingBottom()&&body.getWidth()>50&&body.getHeight()>50,"fixture remains usable: "+padding);
    ok("retained draft".contentEquals(body.getText()),"fixture draft retained");
   }
   root.setPadding(0,0,0,0);panel.measure(View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.EXACTLY));
   method(root.getClass(),"onLayout",boolean.class,int.class,int.class,int.class,int.class).invoke(root,false,0,0,800,1000);
   ok(body.getWidth()>50&&body.getHeight()>50,"collapsed measurement recovered");return null;
  });
 }
 private void finish(Activity a){if(a!=null)runOnMainSync(a::finish);}
 private void direct(boolean landscape)throws Exception{
  ActivityMonitor monitor=addMonitor("jp.syoboi.a2chMate.activity.ResEditActivity$Dialog",null,false);Activity editor=null;
  try{app.startActivity(new Intent(Intent.ACTION_SENDTO,android.net.Uri.parse("https://egg.5ch.io/test/read.cgi/android/1792500780/")).setClassName(app.getPackageName(),"jp.syoboi.a2chMate.activity.ResEditActivity$Dialog").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
   editor=waitForMonitorWithTimeout(monitor,10000);ok(editor!=null,"direct dialog starts");
   if(landscape){final Activity target=editor;main(()->{target.setRequestedOrientation(android.content.pm.ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);return null;});Thread.sleep(1000);}
   if(landscape&&resumedEditor!=null)editor=resumedEditor;
   measure(editor,landscape?"direct-landscape":"direct-portrait");
   if(faults&&!landscape)faults(editor);
  }finally{finish(editor);removeMonitor(monitor);}
 }
 private void faults(Activity a)throws Exception{
  final ViewGroup root=main(()->{View v=a.findViewById(2131296421);while(v!=null&&!v.getClass().getName().equals("o.zzbgc"))v=v.getParent() instanceof View?(View)v.getParent():null;return (ViewGroup)v;});
  ok(root!=null,"native floating root found");
  final String draft="layout regression draft (never sent)";
  main(()->{((EditText)a.findViewById(2131296421)).setText(draft);return null;});
  for(String fault:new String[]{"zero-keyboard-height","negative-keyboard-height","collapsed-panel"}){
   main(()->{View panel=root.getChildAt(0);
    if(fault.equals("collapsed-panel")){root.setPadding(0,0,0,0);panel.measure(View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.EXACTLY));}
    else root.setPadding(0,0,0,root.getHeight()+(fault.startsWith("negative")?100:0));
    method(root.getClass(),"onLayout",boolean.class,int.class,int.class,int.class,int.class).invoke(root,false,0,0,root.getWidth(),root.getHeight());
    Rect rect=new Rect();View body=a.findViewById(2131296421);boolean visible=body.getGlobalVisibleRect(rect);
    report.append(fault).append(" padding=").append(root.getPaddingBottom()).append(" body=").append(rect).append('\n');
    ok(visible&&rect.width()>50&&rect.height()>50,"recovered "+fault);
    ok(draft.contentEquals(((EditText)body).getText()),"draft retained "+fault);return null;});
  }
 }
 private void measure(Activity a,String mode)throws Exception{
  Thread.sleep(1000);
  String description=main(()->{
   View root=a.getWindow().getDecorView(),body=root.findViewById(2131296421);Rect rect=new Rect();boolean shown=body!=null&&body.getGlobalVisibleRect(rect);
   report.append(mode).append(" activity=").append(a.getClass().getName()).append(" focus=").append(a.hasWindowFocus()).append(" orientation=").append(a.getResources().getConfiguration().orientation)
    .append(" root=").append(root.getWidth()).append('x').append(root.getHeight()).append(" body=").append(body==null?"null":body.getClass().getName()+"/"+body.getWidth()+"x"+body.getHeight()).append(" visible=").append(shown).append('/').append(rect).append('\n');
   if(body!=null){View v=body;for(int n=0;v!=null&&n<9;n++){report.append(" ancestor ").append(v.getClass().getName()).append(" id=").append(v.getId()).append(" vis=").append(v.getVisibility()).append(" bounds=").append(v.getLeft()).append(',').append(v.getTop()).append(',').append(v.getRight()).append(',').append(v.getBottom()).append(" padding=").append(v.getPaddingTop()).append('/').append(v.getPaddingBottom()).append('\n');v=v.getParent() instanceof View?(View)v.getParent():null;}}
   return shown&&rect.height()>50&&rect.width()>50?"visible":"hidden";
  });ok(description.equals("visible"),"actual native body is visible: "+mode);
 }
}
