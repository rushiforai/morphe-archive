package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import java.util.Collections;
import java.util.List;

/** Notification trampoline: commit the new DAT and retain the exact response target. */
public final class ThreadWatchOpenActivity extends Activity {
    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        try {
            Intent incoming=getIntent();
            Uri uri=incoming==null?null:incoming.getData();
            if(uri==null||!Intent.ACTION_VIEW.equals(incoming.getAction()))return;
            ThreadWatchRules.Target target=ThreadWatchRules.target(uri.toString());
            if(target==null)return;
            List<String> segments=uri.getPathSegments();
            int response=1;
            if(!segments.isEmpty())try {
                int value=Integer.parseInt(segments.get(segments.size()-1));
                if(value>0&&value<10000000&&!target.id.equals(segments.get(segments.size()-1)))response=value;
            }catch(NumberFormatException ignored) { }
            ThreadWatchNavigation.expect(this,target.url,response);
            // The native scheduler commits the DAT to ChMate's database. Its worker
            // may still be running when the reader opens; navigation retries below.
            new Thread(()->OpenTabsRefresh.downloadWatched(getApplicationContext(),
                    Collections.singleton(target.url)),"Haiagaru-watch-download").start();
            startActivity(new Intent(Intent.ACTION_VIEW,Uri.parse(target.url+response))
                    .setClassName(this,"jp.syoboi.a2chMate.activity.ResListActivity"));
        }catch(Exception error){Log.w("Haiagaru","Unable to open watched reply",error);}
        finally{finish();}
    }
}
