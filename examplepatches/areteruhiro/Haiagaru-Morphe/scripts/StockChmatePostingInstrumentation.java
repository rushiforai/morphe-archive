package app.haiagaru.tests.stockposting;

import android.app.*;
import android.content.*;
import android.graphics.Bitmap;
import android.os.*;
import android.view.*;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.*;
import java.io.*;
import java.lang.ref.WeakReference;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;

/** Dedicated test app + stock ChMate on an isolated emulator. Never clicks a send button. */
public final class StockChmatePostingInstrumentation extends Instrumentation {
    private static final String REPLY = "https://bbs.eddibb.cc/test/read.cgi/liveedge/9999999999/";
    private static final String BOARD = "https://bbs.eddibb.cc/liveedge/";
    private static final String BODY = "連携確認専用・送信しない\n>>1\n改行と絵文字😀\n\nhttps://example.invalid/\n"+Long.toHexString(System.nanoTime());
    private static final String TITLE = "連携確認専用スレタイ・送信しない";
    private String mode;
    private int checks;
    private Class<?> type;
    private Activity editor;
    private Object owner;
    private EditText body;

    private void ok(boolean value, String label) { if (!value) throw new AssertionError(label); checks++; }
    private Field field(Class<?> type, String name) throws Exception { Field f=type.getDeclaredField(name); f.setAccessible(true); return f; }
    private Method method(String name, Class<?>... args) throws Exception { Method m=type.getDeclaredMethod(name,args); m.setAccessible(true); return m; }
    private <T> T main(Callable<T> action) throws Exception { FutureTask<T> task=new FutureTask<>(action); runOnMainSync(task); return task.get(15,TimeUnit.SECONDS); }
    private AccessibilityNodeInfo find(AccessibilityNodeInfo node, String text, boolean editable) {
        if (node==null) return null;
        if (node.getText()!=null && (text.equals(node.getText().toString())
                ||editable&&text.equals(BODY)&&node.getText().toString().endsWith(BODY)) && (!editable || node.isEditable())) return node;
        for(int i=0;i<node.getChildCount();i++){AccessibilityNodeInfo match=find(node.getChild(i),text,editable); if(match!=null)return match;}
        return null;
    }
    private void waitText(String text, boolean editable) throws Exception {
        for(int i=0;i<60;i++){if(find(getUiAutomation().getRootInActiveWindow(),text,editable)!=null){checks++;return;}Thread.sleep(200);}
        throw new AssertionError("Missing visible text: "+text+"; visible="+describe(getUiAutomation().getRootInActiveWindow()));
    }
    private String describe(AccessibilityNodeInfo node) {
        if(node==null)return "<no window>";
        StringBuilder out=new StringBuilder();
        if(node.getText()!=null)out.append('[').append(node.getText()).append(']');
        if(node.getPackageName()!=null)out.append('{').append(node.getPackageName()).append('}');
        for(int i=0;i<node.getChildCount() && out.length()<3000;i++)out.append(describe(node.getChild(i)));
        return out.toString();
    }
    private void click(String text) throws Exception {
        AccessibilityNodeInfo node=find(getUiAutomation().getRootInActiveWindow(),text,false);
        while(node!=null && !node.isClickable())node=node.getParent();
        ok(node!=null && node.performAction(AccessibilityNodeInfo.ACTION_CLICK),"click "+text);
        Thread.sleep(350);
    }
    private void waitStock() throws Exception {
        for(int i=0;i<60;i++){
            AccessibilityNodeInfo root=getUiAutomation().getRootInActiveWindow();
            if(root!=null && "jp.co.airfront.android.a2chMate".contentEquals(root.getPackageName()) && find(root,BODY,true)!=null){checks++;return;}
            Thread.sleep(200);
        }
        throw new AssertionError("Stock editor did not receive draft; visible="+describe(getUiAutomation().getRootInActiveWindow()));
    }
    private void checkIntent() throws Exception {
        Method factory=method("intent",String.class,String.class,String.class);
        for(boolean thread:new boolean[]{false,true}){
            Intent intent=(Intent)factory.invoke(null,thread?BOARD:REPLY,BODY,thread?TITLE:null);
            ok(Intent.ACTION_SENDTO.equals(intent.getAction()),"editor SENDTO action");
            ok(new ComponentName("jp.co.airfront.android.a2chMate","jp.syoboi.a2chMate.activity.ResEditActivity").equals(intent.getComponent()),"stock component is explicit");
            ok((thread?BOARD:REPLY).equals(intent.getDataString()),"exact native destination");
            ok(BODY.equals(intent.getStringExtra(Intent.EXTRA_TEXT)),"Unicode and newlines preserved");
            ok(thread?TITLE.equals(intent.getStringExtra(Intent.EXTRA_SUBJECT)):!intent.hasExtra(Intent.EXTRA_SUBJECT),"subject only for new threads");
            ok(intent.getFlags()==0 && intent.getExtras().size()==(thread?3:2),"only draft fields and handoff marker, no auto-submit or cookies");
            Method retarget=getTargetContext().getClassLoader().loadClass("app.morphe.extension.chmate.Haiagaru").getMethod("retargetSelfIntent",Intent.class);
            Intent preserved=(Intent)retarget.invoke(null,new Intent(intent));
            ok(intent.getComponent().equals(preserved.getComponent()),"handoff survives native self-navigation retargeting");
            Intent ordinary=new Intent(intent);ordinary.removeExtra("app.morphe.extension.chmate.STOCK_POST_DRAFT");
            ordinary=(Intent)retarget.invoke(null,ordinary);
            ok(getTargetContext().getPackageName().equals(ordinary.getComponent().getPackageName()),"ordinary self-navigation still targets renamed app");
            Intent unrelated=new Intent(intent).setData(android.net.Uri.parse("https://example.invalid/"));
            unrelated=(Intent)retarget.invoke(null,unrelated);
            ok(getTargetContext().getPackageName().equals(unrelated.getComponent().getPackageName()),"marker does not exempt unrelated destinations");
        }
    }
    @SuppressWarnings("unchecked")
    private void open(boolean thread) throws Exception {
        Context app=getTargetContext();
        ActivityMonitor monitor=addMonitor("jp.syoboi.a2chMate.activity.ResEditActivity",null,false);
        try {
            Intent source = new Intent(Intent.ACTION_SENDTO,android.net.Uri.parse(thread?BOARD:REPLY))
                .setClassName(app.getPackageName(),"jp.syoboi.a2chMate.activity.ResEditActivity")
                .putExtra(Intent.EXTRA_TEXT,BODY).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            if(thread)source.putExtra(Intent.EXTRA_SUBJECT,TITLE);
            app.startActivity(source);
            editor=waitForMonitorWithTimeout(monitor,20000);
        } finally {removeMonitor(monitor);}
        ok(editor!=null,"native source editor opens");
        Map<Activity,Object> drafts=(Map<Activity,Object>)field(type,"DRAFTS").get(null);
        Object draft=null;
        for(int i=0;i<50 && draft==null;i++){draft=main(()->drafts.get(editor));if(draft==null)Thread.sleep(200);}
        ok(draft!=null,"real native editor registered by production hook");
        owner=((WeakReference<?>)field(draft.getClass(),"owner").get(draft)).get();
        body=(EditText)((WeakReference<?>)field(draft.getClass(),"body").get(draft)).get();
        Object actualTarget=field(draft.getClass(),"target").get(draft);
        ok((thread?BOARD:REPLY).equals(actualTarget),"hook uses correct reply/board target: "+actualTarget);
        main(()->{body.setText(BODY);return null;});
        if(thread)ok(TITLE.equals(main(()->owner.getClass().getMethod("haiagaruStockPostTitle").invoke(owner))),"native title getter reads visible source title");
        main(()->{
            Menu menu=new PopupMenu(editor,new View(editor)).getMenu();
            menu.add(0,0x7f0a018f,0,"native version");menu.add(0,0x7f0a02f7,0,"native uploads");
            method("addPostingMenu",Object.class,Menu.class).invoke(null,owner,menu);
            method("addPostingMenu",Object.class,Menu.class).invoke(null,owner,menu);
            ok(menu.size()==3,"one native-overflow handoff item, no duplicates");
            ok("通常版ChMateで書き込む".contentEquals(menu.getItem(2).getTitle()),"handoff label");
            method("handlePostingMenu",Object.class,MenuItem.class).invoke(null,owner,menu.getItem(2));
            return null;
        });
        waitText("通常版へ渡す",false);click("戻る");
        ok(main(()->BODY.equals(body.getText().toString()) && !editor.isFinishing()),"cancel retains source draft/editor");
    }
    private void handoff(boolean thread) throws Exception {
        main(()->{method("confirm",Activity.class).invoke(null,editor);return null;});
        waitText("通常版へ渡す",false);click("通常版へ渡す");
        if(mode.equals("missing")){
            waitText("通常版ChMateを開けません",false);
            ok(main(()->BODY.equals(body.getText().toString()) && !editor.isFinishing()),"missing stock retains draft");
            click("閉じる");return;
        }
        waitStock();
        AccessibilityNodeInfo receiver=getUiAutomation().getRootInActiveWindow();
        ok(receiver!=null && "jp.co.airfront.android.a2chMate".contentEquals(receiver.getPackageName()),"stock app receives draft");
        if(thread)waitText(TITLE,true);
        ok(main(()->BODY.equals(body.getText().toString()) && !editor.isFinishing()),"handoff retains source draft without claiming success");
        Bitmap screenshot=getUiAutomation().takeScreenshot();
        if(screenshot!=null)try(FileOutputStream out=new FileOutputStream(new File(getTargetContext().getExternalFilesDir(null),"stock-posting-"+(thread?"thread":"reply")+".png"))){screenshot.compress(Bitmap.CompressFormat.PNG,100,out);}
    }
    private void receiverOnly(boolean thread) throws Exception {
        Intent intent=(Intent)method("intent",String.class,String.class,String.class).invoke(null,thread?BOARD:REPLY,BODY,thread?TITLE:null);
        getTargetContext().startActivity(intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        waitStock();
        AccessibilityNodeInfo root=getUiAutomation().getRootInActiveWindow();
        ok(root!=null && "jp.co.airfront.android.a2chMate".contentEquals(root.getPackageName()),"unmodified stock editor receives explicit draft");
        if(thread)waitText(TITLE,true);
    }
    @Override public void onCreate(Bundle args){super.onCreate(args);mode=args==null?"success":args.getString("mode","success");start();}
    @Override public void onStart(){
        Bundle result=new Bundle();int status=Activity.RESULT_CANCELED;
        try {
            ok(getTargetContext().getPackageName().endsWith(".cookietransfer191")
                    ||getTargetContext().getPackageName().endsWith(".haiagaru.reporter191"),"dedicated test package only");
            type=getTargetContext().getClassLoader().loadClass("app.morphe.extension.chmate.StockChmatePosting");
            checkIntent();
            if(mode.equals("receiver")){receiverOnly(false);receiverOnly(true);}
            else {open(false);handoff(false);
                if(!mode.equals("missing")){main(()->{editor.finish();return null;});open(true);handoff(true);}}
            result.putString("result","PASS "+checks+" native draft/Intent/confirmation checks; mode="+mode+"; public posts=0; root=0");status=Activity.RESULT_OK;
        } catch(Throwable error){result.putString("error",android.util.Log.getStackTraceString(error));}
        finally{if(editor!=null)try{main(()->{editor.finish();return null;});}catch(Exception ignored){}}
        finish(status,result);
    }
}
