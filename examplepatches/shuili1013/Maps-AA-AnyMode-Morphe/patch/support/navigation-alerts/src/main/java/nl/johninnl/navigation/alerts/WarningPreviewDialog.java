package nl.johninnl.navigation.alerts;

import android.app.Activity;
import android.app.AlertDialog;
import android.widget.Toast;
import java.util.concurrent.CompletableFuture;
import java.util.function.Supplier;

/** Explicit phone-only parked action. No detector, public report, account or network API. */
public final class WarningPreviewDialog {
    private WarningPreviewDialog(){}
    public static void show(Activity activity,boolean parked,boolean dutch,Supplier<CompletableFuture<String>> play){
        if(activity==null||activity.isFinishing())return;
        if(!parked){Toast.makeText(activity,dutch?"Stop de navigatie en parkeer voor een audiovoorbeeld":"Stop navigation and park before an audio preview",Toast.LENGTH_LONG).show();return;}
        new AlertDialog.Builder(activity).setTitle(dutch?"Audiovoorbeeld terwijl u geparkeerd staat":"Parked audio preview")
            .setMessage(dutch?"Alleen gebruiken terwijl u geparkeerd staat. Dit speelt een duidelijk synthetisch voorbeeld, volgt uw dempstand en maakt geen verkeersmelding.":"Use only while parked. This plays a clearly labelled synthetic example, respects native mute and creates no road report.")
            .setNegativeButton(dutch?"Annuleren":"Cancel",null)
            .setPositiveButton(dutch?"Ik sta geparkeerd — afspelen":"I'm parked — play",(dialog,which)->play.get().whenComplete((result,error)->activity.runOnUiThread(()->{
                if(activity.isFinishing()||activity.isDestroyed())return;
                Toast.makeText(activity,(dutch?"Voorbeeld · ":"Preview · ")+WarningStatus.label(error==null?result:"DELIVERY_INTERRUPTED",dutch),Toast.LENGTH_LONG).show();
            }))).show();
    }
}
