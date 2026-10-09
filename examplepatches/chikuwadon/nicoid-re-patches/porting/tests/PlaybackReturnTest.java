package e.e.a;
import android.app.*;

/** Stub-host intent and lifecycle checks; device behavior is checked separately. */
public final class PlaybackReturnTest {
    public static class Player { public long position=67000; public long getCurrentPosition(){return position;} }
    public static class Popup extends Service {
        public String f="sm9";public Player e=new Player();public Object O;
        public int P;public static String q0="sm9";public static boolean o0=true,p0=true;
    }
    static void check(boolean value,String message){if(!value)throw new AssertionError(message);}
    public static void main(String[] args){
        Popup popup=new Popup();PlaybackReturn.open(popup);
        check(popup.intent!=null&&popup.stopped,"handoff launches before stopping service");
        check(popup.intent.extras.get("playposition").equals(67000),"copy current seek rather than stale static position");
        check(Boolean.TRUE.equals(popup.intent.extras.get("intentselect")),"explicit foreground playback");
        check(!popup.intent.extras.containsKey("infodata"),"metadata bundle stays out of Binder intent");
        check(Popup.q0.isEmpty(),"new player acquires a fresh stream session");
        Popup failed=new Popup();failed.fail=true;Popup.q0="sm9";PlaybackReturn.open(failed);
        check(!failed.stopped&&Popup.q0.equals("sm9"),"failed launch keeps service and restores native marker");
        Popup automatic=new Popup();PlaybackReturn.bind(automatic);PlaybackReturn.arm("sm9");PlaybackReturn.foreground(new Activity());
        check(automatic.intent!=null&&automatic.stopped,"return to app restores automatic background playback");
        Popup stopped=new Popup();Popup.o0=false;PlaybackReturn.bind(stopped);PlaybackReturn.arm("sm9");PlaybackReturn.foreground(new Activity());
        check(stopped.intent==null,"stopped session does not reopen");Popup.o0=true;
        Popup changed=new Popup();changed.f="sm10";PlaybackReturn.bind(changed);PlaybackReturn.arm("sm9");PlaybackReturn.foreground(new Activity());
        check(changed.intent==null,"a different session is not captured by old handoff");
        System.out.println("Foreground playback regression checks passed");
    }
}
