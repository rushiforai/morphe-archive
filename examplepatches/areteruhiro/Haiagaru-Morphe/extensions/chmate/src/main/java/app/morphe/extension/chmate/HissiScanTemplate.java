package app.morphe.extension.chmate;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.Intent;
import java.util.Calendar;
import java.util.Locale;
import java.text.SimpleDateFormat;

/** Relative dates are evaluated for each new long-press request. */
final class HissiScanTemplate {
    static final String DAYS="hissiScanDaysAgo", PAGES="hissiScanPages", REQUESTS="hissiScanRequests";
    static final String AUTO="haiagaru.hissi.template.auto", POSTS="haiagaru.hissi.postsOnly";
    static final String ENABLED="hissiScanTemplateEnabled", BOARDS="hissiScanTemplateBoards", PROVIDER="wacchoiFullSearchProvider";
    static String date(int daysAgo) {
        Calendar day=Calendar.getInstance(java.util.TimeZone.getTimeZone("Asia/Tokyo"));
        day.add(Calendar.DATE,-Math.max(0,Math.min(36524,daysAgo)));
        SimpleDateFormat format=new SimpleDateFormat("yyyyMMdd",Locale.US);
        format.setTimeZone(day.getTimeZone());
        return format.format(day.getTime());
    }
    static Intent apply(Context context, Intent launch) {
        return apply(context,launch,true);
    }
    static Intent applyPartial(Context context, Intent launch) {
        return apply(context,launch,false);
    }
    private static Intent apply(Context context,Intent launch,boolean postsOnly) {
        SharedPreferences p=SettingsProfiles.prefs(context);
        if(!p.getBoolean(ENABLED,true))return launch.putExtra(AUTO,false).putExtra(POSTS,false);
        return launch.putExtra(AUTO,true).putExtra(POSTS,postsOnly)
                .putExtra("haiagaru.hissi.template.boards",p.getString(BOARDS,""))
                .putExtra("haiagaru.hissi.daysAgo",Math.max(0,Math.min(36524,p.getInt(DAYS,0))))
                .putExtra("haiagaru.hissi.pages",Math.max(1,Math.min(10000,p.getInt(PAGES,100))))
                .putExtra("haiagaru.hissi.requests",Math.max(0,p.getInt(REQUESTS,0)));
    }
    private HissiScanTemplate() { }
}
