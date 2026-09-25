package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;

import java.util.List;

/** Routes external board and thread links to ChMate's existing URL-aware activities. */
public final class OpenUrlActivity extends Activity {
    private static final String TAG = "HaiagaruOpenUrl";
    private static final String THREAD_ACTIVITY = "jp.syoboi.a2chMate.activity.ResListActivity";
    private static final String BOARD_ACTIVITY = "jp.syoboi.a2chMate.activity.ThreadListActivity";

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        try {
            Intent incoming = getIntent();
            Uri uri = incoming == null ? null : incoming.getData();
            if (uri == null || !Intent.ACTION_VIEW.equals(incoming.getAction())
                    || !isWebScheme(uri.getScheme()) || uri.getHost() == null) {
                return;
            }

            Intent target = new Intent(Intent.ACTION_VIEW, uri);
            target.setClassName(this, isThreadUrl(uri) ? THREAD_ACTIVITY : BOARD_ACTIVITY);
            startActivity(target);
        } catch (RuntimeException error) {
            Log.e(TAG, "Could not open URL in ChMate", error);
        } finally {
            finish();
        }
    }

    private static boolean isWebScheme(String scheme) {
        return "http".equalsIgnoreCase(scheme) || "https".equalsIgnoreCase(scheme);
    }

    private static boolean isThreadUrl(Uri uri) {
        List<String> path = uri.getPathSegments();
        if (path.size() >= 4 && "test".equals(path.get(0))
                && "read.cgi".equals(path.get(1))) {
            return true;
        }
        if (path.size() >= 3 && "boards".equals(path.get(0))
                && isThreadId(path.get(2))) {
            return true;
        }
        return path.size() >= 2 && isThreadId(path.get(path.size() - 1));
    }

    private static boolean isThreadId(String value) {
        if (value.length() < 9) return false;
        for (int index = 0; index < value.length(); index++) {
            char character = value.charAt(index);
            if (character < '0' || character > '9') return false;
        }
        return true;
    }
}
