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
            if ("hissi.org".equalsIgnoreCase(uri.getHost())
                    && uri.getPath()!=null && uri.getPath().startsWith("/read.php/")) {
                target.setClass(this,HissiMenuActivity.class);
            } else {
                String local=SiteNativeBoards.localUrl(uri.toString());
                String host=uri.getHost().toLowerCase(java.util.Locale.ROOT);
                boolean addedSite=host.equals("bbs.animanch.com")||host.equals("bakusai.com")||host.endsWith(".2chan.net");
                if(local==null&&host.equals("bbs.animanch.com")&&AnimanchProtocol.threadId(uri.toString())!=null){
                    resolvingAnimanch=true;
                    final Uri original=uri;final boolean returnFromArchive=incoming.getBooleanExtra("haiagaru.archive.return",false);
                    new Thread(()->{
                        String resolved=SiteNativeBoards.resolveUnclassifiedAnimanch(original.toString());
                        runOnUiThread(()->{
                            if(isFinishing()||isDestroyed())return;
                            if(resolved==null){android.widget.Toast.makeText(this,"スレの所属板を確認できません。該当する板を追加し、有効化してください。",android.widget.Toast.LENGTH_LONG).show();finish();return;}
                            try{Intent open=new Intent(Intent.ACTION_VIEW,normalizeEdge(Uri.parse(resolved))).setClassName(this,THREAD_ACTIVITY);
                                if(returnFromArchive)open.putExtra("forwardTabletHome",false);
                                startActivity(open);
                            }catch(RuntimeException error){Log.e(TAG,"Could not open resolved Animanch URL",error);}finally{finish();}
                        });
                    },"Haiagaru-animanch-category").start();
                    return;
                }
                if(local!=null)uri=Uri.parse(local);
                else if(addedSite){android.widget.Toast.makeText(this,"対応する板を板一覧へ追加し、「使用する」をオンにしてください。対応していない形式のURLは開けません。",android.widget.Toast.LENGTH_LONG).show();return;}
                uri=normalizeEdge(uri);
                target.setData(uri);
                target.setClassName(this, isThreadUrl(uri) ? THREAD_ACTIVITY : BOARD_ACTIVITY);
            }
            if (incoming.getBooleanExtra("haiagaru.archive.return", false)) {
                target.putExtra("forwardTabletHome", false);
            }
            startActivity(target);
        } catch (RuntimeException error) {
            Log.e(TAG, "Could not open URL in ChMate", error);
        } finally {
            // Asynchronous Animanch resolution completes and closes the activity itself.
            if(!resolvingAnimanch)finish();
        }
    }
    private boolean resolvingAnimanch;

    private static boolean isWebScheme(String scheme) {
        return "http".equalsIgnoreCase(scheme) || "https".equalsIgnoreCase(scheme);
    }

    static Uri normalizeEdge(Uri uri) {
        return Uri.parse(ExternalCheckerLinks.normalizeEdge(uri.toString()));
    }

    private static boolean isThreadUrl(Uri uri) {
        List<String> path = uri.getPathSegments();
        if (path.size() >= 4 && "test".equals(path.get(0))
                && "read.cgi".equals(path.get(1))) {
            return true;
        }
        if (path.size() >= 3 && "bbs".equals(path.get(0))
                && "read.cgi".equals(path.get(1))) {
            int threadIndex = "jbbs.shitaraba.net".equalsIgnoreCase(uri.getHost()) ? 4 : 3;
            return path.size() > threadIndex && isThreadId(path.get(threadIndex));
        }
        if ("itest.5ch.io".equalsIgnoreCase(uri.getHost()) && path.size() >= 5
                && "test".equals(path.get(1)) && "read.cgi".equals(path.get(2))
                && isThreadId(path.get(4))) {
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
