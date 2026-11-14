package app.haiagaru.tests.stockreturn;
import android.app.*;import android.content.*;import android.os.*;import android.view.*;import android.widget.*;
import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;

/** Framework Activity results are intercepted fixtures, never real submissions. */
public final class StockPostingReturnInstrumentation extends Instrumentation {
 Class<?> posting;Activity host;Owner owner;int checks;volatile Intent captured;volatile int result=Activity.RESULT_CANCELED;
 void ok(boolean b,String label){if(!b)throw new AssertionError(label);checks++;}
 Method method(Class<?> c,String name,Class<?>...p)throws Exception{Method m=c.getDeclaredMethod(name,p);m.setAccessible(true);return m;}
 <T>T main(Callable<T> action)throws Exception{FutureTask<T> task=new FutureTask<>(action);runOnMainSync(task);return task.get(10,TimeUnit.SECONDS);}
 public static final class Owner {
  final Activity activity;final LinearLayout root;final EditText body,title;public Object W;int saves;
  Owner(Activity a){activity=a;root=new LinearLayout(a);root.setOrientation(1);body=new EditText(a);title=new EditText(a);root.addView(title);root.addView(body);title.setText("result fixture title");body.setText("result fixture draft");}
  public Activity getActivity(){return activity;}public View getView(){return root;}
  public String haiagaruStockPostTitle(){return title.getText().toString();}public void haiagaruSetStockPostTitle(String text){title.setText(text);}public void haiagaruSaveExternalDraft(){saves++;}
 }
 @Override public void onCreate(Bundle b){super.onCreate(b);start();}
 @Override public void onStart(){Bundle out=new Bundle();try{test();out.putString("result","PASS "+checks+" stock posting relay/return checks; stock results simulated; public posts=0");finish(Activity.RESULT_OK,out);}catch(Throwable error){out.putString("error",android.util.Log.getStackTraceString(error));finish(Activity.RESULT_CANCELED,out);}}
 void test()throws Exception{
  Context app=getTargetContext();ok(app.getPackageName().endsWith("haiagaru.reporter191"),"isolated 191");ClassLoader loader=app.getClassLoader();posting=loader.loadClass("app.morphe.extension.chmate.StockChmatePosting");
  SharedPreferences prefs=app.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0);Map<String,?> saved=prefs.getAll();SharedPreferences nativePrefs=android.preference.PreferenceManager.getDefaultSharedPreferences(app);boolean hadTablet=nativePrefs.contains("enableTabletHome2"),tablet=nativePrefs.getBoolean("enableTabletHome2",false);nativePrefs.edit().putBoolean("enableTabletHome2",false).commit();
  ActivityMonitor stock=new ActivityMonitor(){@Override public ActivityResult onStartActivity(Intent intent){if(intent.getComponent()!=null&&intent.getComponent().getPackageName().equals("jp.co.airfront.android.a2chMate")&&intent.getComponent().getClassName().endsWith("ResEditActivity")){captured=new Intent(intent);return new ActivityResult(result,null);}return null;}};
  addMonitor(stock);
  try{
   host=startActivitySync(new Intent().setClassName(app.getPackageName(),"app.morphe.extension.chmate.ToolbarIconsActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));Thread.sleep(800);
   main(()->{owner=new Owner(host);owner.W=loader.loadClass("jp.syoboi.a2chMate.client.BBSUrlInfo").getConstructor(String.class,String.class,Long.class,int.class,Integer.class,String.class).newInstance("bbs.eddibb.cc","liveedge",9999999999L,0,null,null);host.setContentView(owner.root);return null;});Thread.sleep(600);
   String board="https://bbs.eddibb.cc/liveedge/",reply="https://bbs.eddibb.cc/test/read.cgi/liveedge/9999999999/";
   main(()->{Intent empty=(Intent)method(posting,"editorIntent",String.class).invoke(null,reply);ok(!empty.hasExtra(Intent.EXTRA_TEXT)&&!empty.hasExtra(Intent.EXTRA_SUBJECT),"toolbar leaves stock draft intact");ok((Boolean)method(posting,"isHandoff",Intent.class).invoke(null,empty),"toolbar uses explicit handoff marker");return null;});
   main(()->{
    method(posting,"target",Object.class,String.class,EditText.class).invoke(null,owner,reply,owner.body);
    Menu menu=new PopupMenu(host,owner.body).getMenu();menu.add(0,0x7f0a018f,0,"version");menu.add(0,0x7f0a02f7,0,"history");
    Field menuId=posting.getDeclaredField("MENU");menuId.setAccessible(true);int id=menuId.getInt(null);
    prefs.edit().remove("stockPostingShowMenu").commit();method(posting,"addPostingMenu",Object.class,Menu.class).invoke(null,owner,menu);
    ok(menu.findItem(id)!=null&&menu.findItem(id).isVisible(),"stock posting overflow menu initially ON");
    prefs.edit().putBoolean("stockPostingShowMenu",false).commit();method(posting,"addPostingMenu",Object.class,Menu.class).invoke(null,owner,menu);
    ok(!menu.findItem(id).isVisible(),"OFF hides an existing overflow entry");
    method(posting,"handlePostingMenu",Object.class,MenuItem.class).invoke(null,owner,menu.findItem(id));ok(captured==null,"disabled stale menu does not launch stock editor");
    prefs.edit().putBoolean("stockPostingShowMenu",true).commit();method(posting,"addPostingMenu",Object.class,Menu.class).invoke(null,owner,menu);ok(menu.findItem(id).isVisible(),"ON restores the same overflow entry");
    prefs.edit().putBoolean("stockPostingShowMenu",false).commit();return null;
   });
   // Explicit toolbar and long press both use the real relay, with an intercepted stock editor.
   prefs.edit().putBoolean("stockPostingOnWriteLongPress",false).commit();
   main(()->{View pencil=new View(host);pencil.setId(2);ok(!(Boolean)posting.getMethod("longClick",Object.class,View.class).invoke(null,owner,pencil),"OFF keeps native web long press");return null;});
   prefs.edit().putBoolean("stockPostingOnWriteLongPress",true).commit();
   main(()->{View other=new View(host);other.setId(5);ok(!(Boolean)posting.getMethod("longClick",Object.class,View.class).invoke(null,owner,other),"other buttons retain native long press");View pencil=new View(host);pencil.setId(2);ok((Boolean)posting.getMethod("longClick",Object.class,View.class).invoke(null,owner,pencil),"ON handles write long press");return null;});Thread.sleep(900);
   main(()->{ok(captured!=null&&reply.equals(captured.getDataString()),"long press opens stock editor for exact thread");ok(!host.isFinishing()&&owner.body.length()>0,"back result returns without deleting draft");return null;});captured=null;
   main(()->{method(posting,"openFromToolbar",Object.class).invoke(null,owner);return null;});Thread.sleep(900);main(()->{ok(captured!=null&&!captured.hasExtra(Intent.EXTRA_TEXT),"toolbar opens existing stock draft without adding text");return null;});captured=null;
   main(()->{method(posting,"target",Object.class,String.class,EditText.class).invoke(null,owner,board,owner.body);return null;});
   prefs.edit().putBoolean("stockPostingSkipConfirmation",true).commit();
   main(()->{method(posting,"confirm",Activity.class).invoke(null,host);return null;});Thread.sleep(900);
   main(()->{ok(captured!=null&&"result fixture draft".equals(captured.getStringExtra(Intent.EXTRA_TEXT)),"skip-confirmation launches draft handoff");ok(!host.isFinishing()&&owner.body.length()>0&&owner.title.length()>0,"cancelled stock editor preserves body/title");return null;});captured=null;
   result=Activity.RESULT_OK;
   main(()->{method(posting,"confirm",Activity.class).invoke(null,host);return null;});Thread.sleep(900);
   main(()->{ok(captured!=null,"successful result received through framework relay");ok(owner.body.length()==0&&owner.title.length()==0,"only confirmed success clears body and title");ok(owner.saves>=3,"native draft save called before handoff and after cleanup");ok(host.isFinishing()||host.isDestroyed(),"success closes source editor and returns to Haiagaru reader");return null;});
  }finally{
   removeMonitor(stock);if(host!=null)main(()->{if(!host.isFinishing())host.finish();return null;});
   SharedPreferences.Editor restore=prefs.edit();for(String key:new String[]{"stockPostingSkipConfirmation","stockPostingOnWriteLongPress","stockPostingShowMenu"})if(saved.containsKey(key))restore.putBoolean(key,(Boolean)saved.get(key));else restore.remove(key);restore.commit();if(hadTablet)nativePrefs.edit().putBoolean("enableTabletHome2",tablet).commit();else nativePrefs.edit().remove("enableTabletHome2").commit();
  }
 }
}
