/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.playlists;
import android.content.Context;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.*;
import android.preference.Preference;
import android.view.*;
import android.widget.*;
import android.text.SpannableString;
import android.text.style.ForegroundColorSpan;
import android.text.format.Formatter;
import java.io.File;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.theme.ThemeUtils;

/** Native Downloads storage card, with the same accessible segments/legends as Shaders. */
@SuppressWarnings("deprecation")
public final class AudioStoragePreference extends Preference {
    private static final int[] COLORS={0xff64b5f6,0xffb39ddb,0xff80cbc4,0xffffd28e,0xff9ba6b2};
    public AudioStoragePreference(Context c){super(c);setSelectable(false);}
    private int dp(float n){return Math.round(n*getContext().getResources().getDisplayMetrics().density);}
    private TextView text(String value){TextView t=new TextView(getContext());t.setText(value);t.setTextSize(14);t.setTextColor(ThemeUtils.getAppForegroundColor());return t;}
    private String size(long value){return Formatter.formatShortFileSize(getContext(),value);}
    @Override @android.annotation.SuppressLint("MissingSuperCall") protected View onCreateView(ViewGroup parent){
        Context c=getContext();LinearLayout card=new LinearLayout(c);card.setOrientation(LinearLayout.VERTICAL);
        TextView heading=text("Available storage");heading.setTextSize(18);heading.setTypeface(null,Typeface.BOLD);card.addView(heading);
        TextView summary=text("Calculating storage...");summary.setPadding(0,dp(8),0,dp(12));card.addView(summary);
        LinearLayout bar=new LinearLayout(c);bar.setOrientation(LinearLayout.HORIZONTAL);card.addView(bar,new LinearLayout.LayoutParams(-1,dp(24)));
        Utils.submitOnBackgroundThread(()->{
            File external=c.getExternalFilesDir(Environment.DIRECTORY_MUSIC),audio=external==null?null:new File(external,"Morphe");
            long free=-1;try{free=new StatFs(DownloadStorage.volumePath(audio,c.getFilesDir()).getAbsolutePath()).getAvailableBytes();}catch(Exception unavailable){app.bdcrusher.ytmusic.common.FeatureDiagnostics.record("Download-storage","Available space could not be read");}
            File prefs=new File(c.getFilesDir().getParentFile(),"shared_prefs/bdcrusher_audio_downloads.xml");
            DownloadStorage.Snapshot snapshot=DownloadStorage.scan(audio,c.getFilesDir(),prefs,free);
            new Handler(Looper.getMainLooper()).post(()->render(card,bar,summary,snapshot));return null;
        });
        app.bdcrusher.ytmusic.common.FeaturePreferences.card(card,false);return card;
    }
    private void render(LinearLayout card,LinearLayout bar,TextView summary,DownloadStorage.Snapshot snapshot){
        long free=snapshot.free(),total=Math.max(1,snapshot.owned()+Math.max(0,free));
        summary.setText(size(snapshot.owned())+" used"+(free>=0?" \u00b7 "+size(free)+" free":" \u00b7 Free space unavailable"));
        for(int i=0;i<5;i++){
            long amount=i==4?free:snapshot.bytes()[i];String name=i==4?"Free device storage":DownloadStorage.LABELS[i];
            String detail=name+": "+(amount<0?"Unavailable":size(amount))+(i==4?"":" \u00b7 "+snapshot.counts()[i]+" files");
            if(amount>0){View segment=new View(getContext());segment.setBackgroundColor(COLORS[i]);segment.setFocusable(true);segment.setContentDescription(detail);segment.setOnClickListener(v->callout(v,detail));bar.addView(segment,new LinearLayout.LayoutParams(0,-1,Math.max(.025f,(float)amount/total)));}
            TextView legend=text("\u25cf  "+detail);SpannableString label=new SpannableString(legend.getText());label.setSpan(new ForegroundColorSpan(COLORS[i]),0,1,0);legend.setText(label);legend.setMinHeight(dp(40));legend.setGravity(Gravity.CENTER_VERTICAL);legend.setFocusable(true);legend.setOnClickListener(v->callout(v,detail));card.addView(legend);
        }
        if(bar.getChildCount()==0){TextView empty=text(free<0?"Storage availability could not be read":"No storage available");bar.addView(empty);}
        TextView note=text("Your selected YTDLnis folder is read-only and is not included in app-owned storage.");note.setPadding(0,dp(10),0,0);card.addView(note);
    }
    private void callout(View anchor,String detail){
        TextView message=text(detail);message.setPadding(dp(16),dp(12),dp(16),dp(12));GradientDrawable background=new GradientDrawable();background.setColor(ThemeUtils.getAppBackgroundColor());background.setCornerRadius(dp(12));message.setBackground(background);
        PopupWindow popup=new PopupWindow(message,-2,-2,true);popup.setBackgroundDrawable(background);popup.setElevation(dp(12));popup.setOutsideTouchable(true);popup.showAsDropDown(anchor,0,dp(4));message.announceForAccessibility(detail);
    }
}
