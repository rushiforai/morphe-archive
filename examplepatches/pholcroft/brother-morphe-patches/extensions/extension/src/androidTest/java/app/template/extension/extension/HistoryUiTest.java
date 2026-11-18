package app.template.extension.extension;

import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import java.util.Collections;

public final class HistoryUiTest {
    private static boolean contains(View view,String text){
        if(view instanceof TextView && ((TextView)view).getText().toString().contains(text))return true;
        if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++)if(contains(group.getChildAt(i),text))return true;}
        return false;
    }
    private static View findDescription(View view,String description){
        if(description.contentEquals(view.getContentDescription()==null?"":view.getContentDescription()))return view;
        if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++){View found=findDescription(group.getChildAt(i),description);if(found!=null)return found;}}return null;
    }
    private static View find(View view,String text){
        if(view instanceof TextView&&((TextView)view).getText().toString().contains(text))return view;
        if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++){View found=find(group.getChildAt(i),text);if(found!=null)return found;}}return null;
    }
    private static View findExact(View view,String text){
        if(view instanceof TextView&&text.contentEquals(((TextView)view).getText()))return view;
        if(view instanceof ViewGroup){ViewGroup group=(ViewGroup)view;for(int i=0;i<group.getChildCount();i++){View match=findExact(group.getChildAt(i),text);if(match!=null)return match;}}
        return null;
    }
    public static void run(Instrumentation instrumentation,Context context)throws Exception{
        ActivityStore store=new ActivityStore(context);String ip="192.0.2.88",mac="02:01:02:03:04:08";
        PrinterRecord printer=store.resolveVerified(ip,mac,"Synthetic printer");long sequence=store.reserveSequences(1);
        RequestRecord.Details details=new RequestRecord.Details("192.0.2.88",161,0,1,1000,1,"context","encoded","success",75000000L);
        RequestRecord request=new RequestRecord("row",0,"1.3.6.1.2.1.1.1.0",0,1000000L,true,"octets:QnJvdGhlcg==".getBytes(java.nio.charset.StandardCharsets.UTF_8),details);
        RequestRecord language=new RequestRecord("language",1,"1.3.6.1.2.1.43.15.1.1.2.1.1",1000001L,2000000L,true,"integer:6".getBytes(java.nio.charset.StandardCharsets.UTF_8),details);
        ActivityBurst burst=new ActivityBurst(new ActivityBurst.Ref(printer.id,"ui-test-burst",sequence),1,2000000L,java.util.Arrays.asList(request,language),ip,new ActivityBurst.Coverage(true,true,2,2));
        if(!store.publish(burst,store.registerPrinter(printer.id)))throw new AssertionError("could not create history fixture");store.close();
        CacheSettingsActivity settings=(CacheSettingsActivity)instrumentation.startActivitySync(new Intent(context,CacheSettingsActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        java.lang.reflect.Method cardMethod=CacheSettingsActivity.class.getDeclaredMethod("printerCard",String.class);cardMethod.setAccessible(true);
        View[] card={null};instrumentation.runOnMainSync(()->{try{card[0]=(View)cardMethod.invoke(settings,ip);}catch(Exception e){throw new RuntimeException(e);}});
        if(findDescription(card[0],"Printer options for "+ip)!=null)throw new AssertionError("printer card must not show a separate options menu");
        Instrumentation.ActivityMonitor monitor=instrumentation.addMonitor(ActivityHistoryActivity.class.getName(),null,false);
        instrumentation.runOnMainSync(()->card[0].performClick());
        android.app.Activity opened=instrumentation.waitForMonitorWithTimeout(monitor,3000);instrumentation.removeMonitor(monitor);
        if(opened==null)throw new AssertionError("tapping the printer card must open activity history");
        if(!ip.equals(opened.getIntent().getStringExtra("printer_ip")))throw new AssertionError("activity history must open for the selected printer");
        instrumentation.runOnMainSync(()->{opened.finish();settings.finish();});
        Intent intent=new Intent(context,ActivityHistoryActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        intent.putExtra("printer_ip",ip);intent.putExtra("printer_mac",mac);
        ActivityHistoryActivity activity=(ActivityHistoryActivity)instrumentation.startActivitySync(intent);
        boolean[] visible={false};
        for(int i=0;i<100&&!visible[0];i++){
            instrumentation.runOnMainSync(()->visible[0]=contains(activity.getWindow().getDecorView(),"Burst #"+sequence));
            if(!visible[0])Thread.sleep(50);
        }
        boolean[] exportVisible={false},timeVisible={false},menuVisible={false},hasSummary={false};String time=java.text.DateFormat.getDateTimeInstance(java.text.DateFormat.MEDIUM,java.text.DateFormat.MEDIUM).format(new java.util.Date(burst.startedWallMillis));
        instrumentation.runOnMainSync(()->{exportVisible[0]=contains(activity.getWindow().getDecorView(),"Export activity history");timeVisible[0]=contains(activity.getWindow().getDecorView(),time);menuVisible[0]=findDescription(activity.getWindow().getDecorView(),"History options")!=null;hasSummary[0]=contains(activity.getWindow().getDecorView(),"2 requests");});
        if(exportVisible[0]||!menuVisible[0]||!hasSummary[0])throw new AssertionError("history must use a compact row and put actions in the overflow menu");
        android.accessibilityservice.AccessibilityServiceInfo initialAccess=instrumentation.getUiAutomation().getServiceInfo();initialAccess.flags|=android.accessibilityservice.AccessibilityServiceInfo.FLAG_RETRIEVE_INTERACTIVE_WINDOWS;instrumentation.getUiAutomation().setServiceInfo(initialAccess);
        View[] historyMenu={null};instrumentation.runOnMainSync(()->historyMenu[0]=findDescription(activity.getWindow().getDecorView(),"History options"));instrumentation.runOnMainSync(()->historyMenu[0].performClick());instrumentation.waitForIdleSync();
        boolean historyClear=false,printerClear=false;for(int attempt=0;attempt<20&&!(historyClear&&printerClear);attempt++){for(android.view.accessibility.AccessibilityWindowInfo window:instrumentation.getUiAutomation().getWindows()){android.view.accessibility.AccessibilityNodeInfo root=window.getRoot();if(root!=null){if(!root.findAccessibilityNodeInfosByText("Delete all activity").isEmpty())historyClear=true;if(!root.findAccessibilityNodeInfosByText("Clear saved printer data").isEmpty())printerClear=true;}}if(!(historyClear&&printerClear))Thread.sleep(100);}if(!historyClear||!printerClear)throw new AssertionError("history menu must offer distinct activity and printer clearing actions");instrumentation.sendKeyDownUpSync(android.view.KeyEvent.KEYCODE_BACK);instrumentation.waitForIdleSync();
        View[] selected={null};instrumentation.runOnMainSync(()->selected[0]=find(activity.getWindow().getDecorView(),"Burst #"+sequence));
        if(selected[0]==null)throw new AssertionError("burst row missing");instrumentation.runOnMainSync(()->{View target=selected[0];while(!target.isClickable()&&target.getParent() instanceof View)target=(View)target.getParent();target.performClick();});instrumentation.waitForIdleSync();
        boolean[] screen={false};instrumentation.runOnMainSync(()->screen[0]=contains(activity.getWindow().getDecorView(),"Request activity")&&contains(activity.getWindow().getDecorView(),"System description")&&contains(activity.getWindow().getDecorView(),"Brother")&&contains(activity.getWindow().getDecorView(),"0.000 s")&&contains(activity.getWindow().getDecorView(),"~75 ms")&&contains(activity.getWindow().getDecorView(),"0.075 s")&&contains(activity.getWindow().getDecorView(),"6 (PostScript)"));
        if(!screen[0])throw new AssertionError("clicking a burst should show the full request screen with names, values and timings");
        instrumentation.runOnMainSync(()->{
            View number=findExact(activity.getWindow().getDecorView(),"#1");
            if(number==null || !(number.getParent().getParent().getParent().getParent().getParent() instanceof RequestListView))
                throw new AssertionError("request activity must show numbered rows in the shared list");
            android.widget.ListView list=(android.widget.ListView)number.getParent().getParent().getParent();
            list.performItemClick(list.getChildAt(0),0,list.getAdapter().getItemId(0));
            android.content.ClipboardManager clipboard=activity.getSystemService(android.content.ClipboardManager.class);
            if(!"Brother".contentEquals(clipboard.getPrimaryClip().getItemAt(0).getText()))
                throw new AssertionError("tapping a short saved response must copy it");
        });
        android.accessibilityservice.AccessibilityServiceInfo accessibility=instrumentation.getUiAutomation().getServiceInfo();accessibility.flags|=android.accessibilityservice.AccessibilityServiceInfo.FLAG_RETRIEVE_INTERACTIVE_WINDOWS;instrumentation.getUiAutomation().setServiceInfo(accessibility);
        View[] activityMenu={null};instrumentation.runOnMainSync(()->activityMenu[0]=findDescription(activity.getWindow().getDecorView(),"Activity options"));
        if(activityMenu[0]==null)throw new AssertionError("request activity menu is missing");
        instrumentation.runOnMainSync(()->activityMenu[0].performClick());instrumentation.waitForIdleSync();
        android.view.accessibility.AccessibilityNodeInfo exportNode=null;boolean replayFound=false;
        for(int attempt=0;attempt<20&&exportNode==null;attempt++){for(android.view.accessibility.AccessibilityWindowInfo window:instrumentation.getUiAutomation().getWindows()){android.view.accessibility.AccessibilityNodeInfo root=window.getRoot();if(root!=null){java.util.List<android.view.accessibility.AccessibilityNodeInfo> exportNodes=root.findAccessibilityNodeInfosByText("Export activity");if(!exportNodes.isEmpty())exportNode=exportNodes.get(0);if(!root.findAccessibilityNodeInfosByText("Measure without cache").isEmpty())replayFound=true;}}if(exportNode==null)Thread.sleep(100);}
        if(exportNode==null||replayFound)throw new AssertionError("request menu must offer export and not replay");
        instrumentation.sendKeyDownUpSync(android.view.KeyEvent.KEYCODE_BACK);instrumentation.waitForIdleSync();
        android.os.Bundle saved=new android.os.Bundle();instrumentation.runOnMainSync(()->instrumentation.callActivityOnSaveInstanceState(activity,saved));
        if(!"ui-test-burst".equals(saved.getString("burst_id"))||saved.getLong("burst_sequence")!=sequence)throw new AssertionError("screen state must retain the exact selected burst");
        instrumentation.runOnMainSync(activity::onBackPressed);instrumentation.waitForIdleSync();
        instrumentation.runOnMainSync(activity::finish);
        if(!visible[0]||!timeVisible[0])throw new AssertionError("history screen must show burst and seconds");
    }
}
