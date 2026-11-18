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
    public static void run(Instrumentation instrumentation,Context context)throws Exception{
        ActivityStore store=new ActivityStore(context);String ip="192.0.2.88",mac="02:01:02:03:04:08";
        PrinterRecord printer=store.resolveVerified(ip,mac,"Synthetic printer");long sequence=store.reserveSequences(1);
        ActivityBurst burst=new ActivityBurst(new ActivityBurst.Ref(printer.id,"ui-test-burst",sequence),1,1000,Collections.<RequestRecord>emptyList());
        if(!store.publish(burst,store.registerPrinter(printer.id)))throw new AssertionError("could not create history fixture");store.close();
        Intent intent=new Intent(context,ActivityHistoryActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        intent.putExtra("printer_ip",ip);intent.putExtra("printer_mac",mac);
        ActivityHistoryActivity activity=(ActivityHistoryActivity)instrumentation.startActivitySync(intent);
        boolean[] visible={false};
        for(int i=0;i<100&&!visible[0];i++){
            instrumentation.runOnMainSync(()->visible[0]=contains(activity.getWindow().getDecorView(),"Burst #"+sequence));
            if(!visible[0])Thread.sleep(50);
        }
        boolean[] exportVisible={false},timeVisible={false};String time=java.text.DateFormat.getDateTimeInstance(java.text.DateFormat.MEDIUM,java.text.DateFormat.MEDIUM).format(new java.util.Date(burst.startedWallMillis));
        instrumentation.runOnMainSync(()->{exportVisible[0]=contains(activity.getWindow().getDecorView(),"Export activity history");timeVisible[0]=contains(activity.getWindow().getDecorView(),time);});
        instrumentation.runOnMainSync(activity::finish);
        if(!visible[0]||!exportVisible[0]||!timeVisible[0])throw new AssertionError("history screen must show burst, export action and seconds");
    }
}
