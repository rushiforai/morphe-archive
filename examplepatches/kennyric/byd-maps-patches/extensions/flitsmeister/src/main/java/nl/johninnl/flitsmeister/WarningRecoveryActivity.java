package nl.johninnl.flitsmeister;

import android.app.Activity;
import android.os.Bundle;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

/** Private source-owned parked confirmation; receivers receive only a PendingIntent to this UI. */
public final class WarningRecoveryActivity extends Activity {
    @Override public void onCreate(Bundle state){
        // Keep platform confirmation controls legible independently of the host map's theme.
        boolean dark=(getResources().getConfiguration().uiMode&android.content.res.Configuration.UI_MODE_NIGHT_MASK)==android.content.res.Configuration.UI_MODE_NIGHT_YES;
        setTheme(dark?android.R.style.Theme_DeviceDefault_NoActionBar:android.R.style.Theme_DeviceDefault_Light_NoActionBar);
        super.onCreate(state);boolean nl=getResources().getConfiguration().getLocales().get(0).getLanguage().equals("nl");
        LinearLayout content=new LinearLayout(this);content.setOrientation(LinearLayout.VERTICAL);int pad=(int)(24*getResources().getDisplayMetrics().density);content.setPadding(pad,pad,pad,pad);
        TextView title=new TextView(this);title.setText(nl?"Waarschuwingsaudio herstellen":"Recover warning audio");title.setTextSize(22);content.addView(title);
        TextView detail=new TextView(this);detail.setText(nl?"Gebruik dit alleen terwijl u geparkeerd staat. Stop beide ontvangende kaartapps en hun spraakengine. Controleer dat er geen oude waarschuwing meer speelt of in de wachtrij staat. Eerdere waarschuwingen worden niet opnieuw afgespeeld.":"Use only while parked. Stop both receiving maps and their speech engine. Verify that no previous warning is playing or queued. Earlier warnings will not be replayed.");content.addView(detail);
        CheckBox parked=new CheckBox(this);parked.setText(nl?"Ik sta geparkeerd":"I am parked");content.addView(parked);
        CheckBox stopped=new CheckBox(this);stopped.setText(nl?"Ontvangers en spraak zijn gestopt; geen audio speelt of wacht":"Receivers and speech are stopped; no audio is playing or queued");content.addView(stopped);
        Button reset=new Button(this);reset.setText(nl?"Audiostatus herstellen":"Reset audio state");reset.setEnabled(false);content.addView(reset);
        android.widget.CompoundButton.OnCheckedChangeListener checked=(button,value)->reset.setEnabled(parked.isChecked()&&stopped.isChecked());parked.setOnCheckedChangeListener(checked);stopped.setOnCheckedChangeListener(checked);
        reset.setOnClickListener(view->{reset.setEnabled(false);NativeWarnings.init(this).recoverAfterParkedStop().whenComplete((result,error)->runOnUiThread(()->{
            if(isFinishing()||isDestroyed())return;
            String code=error==null?result:"STORAGE_FAILED";
            String text=code.equals("OK")?(nl?"Audiostatus hersteld. Open de ontvangende kaart opnieuw.":"Audio state reset. Reopen the receiving map."):code.equals("OUTPUT_ACTIVE")?(nl?"Een ontvanger is nog actief. Stop deze eerst.":"A receiver is still active. Stop it first."):(nl?"Herstellen mislukt; audiostatus blijft geblokkeerd.":"Recovery failed; audio remains fenced.");
            Toast.makeText(this,text,Toast.LENGTH_LONG).show();if(code.equals("OK"))finish();else reset.setEnabled(parked.isChecked()&&stopped.isChecked());
        }));});
        setContentView(content);
    }
}
