import android.app.*;
import android.content.Context;
import android.media.MediaMetadata;
import android.media.session.*;
import android.service.notification.*;
import android.util.Log;
import io.github.kljjh.flymelyrics.FlymeLyrics;

public class BridgeTest {
  static void check(boolean value,String message){if(!value)throw new AssertionError(message);}
  public static void main(String[] args){
    if(args.length>0){Notification.FLAG_ALWAYS_SHOW_TICKER=0;Notification.FLAG_ONLY_UPDATE_TICKER=0;}
    Context context=new Context(); NotificationManager manager=context.manager;
    MediaSession session=new MediaSession(),other=new MediaSession();
    MediaMetadata first=new MediaMetadata("song","artist"),second=new MediaMetadata("next","artist");
    PlaybackState playing=new PlaybackState(3),paused=new PlaybackState(2);
    Notification original=new Notification(); original.flags=0x4000;
    original.actions=new Object();original.icon=new Object();original.artwork=new Object();
    original.extras.put(Notification.EXTRA_MEDIA_SESSION,session.getSessionToken());
    StatusBarNotification entry=new StatusBarNotification("media",17,original);
    Notification foreignNotification=new Notification();
    foreignNotification.extras.put(Notification.EXTRA_MEDIA_SESSION,other.getSessionToken());
    StatusBarNotification foreign=new StatusBarNotification(null,18,foreignNotification);
    manager.entries.add(entry);manager.entries.add(foreign);
    String line="Chinese lyric / translation\nsecond line";
    FlymeLyrics.onLine(context,session,line);
    check(manager.posts==0,"must wait for official metadata and playback events");
    FlymeLyrics.onMetadata(context,session,first);
    FlymeLyrics.onPlaybackState(context,playing);
    FlymeLyrics.onLine(context,session,line);
    if(args.length>0){check(manager.posts==0&&entry.n==original,"unsupported device unchanged");System.out.println("PASS: unsupported device");return;}
    int flags=Notification.FLAG_ALWAYS_SHOW_TICKER|Notification.FLAG_ONLY_UPDATE_TICKER|Notification.FLAG_NO_CLEAR;
    check(entry.n.tickerText.equals(line),"preserve exact text and newline");
    check((entry.n.flags&flags)==flags&&(entry.n.flags&0x4000)!=0,"add Flyme flags; preserve others");
    check(entry.n.actions==original.actions&&entry.n.icon==original.icon&&entry.n.artwork==original.artwork,"preserve media UI");
    check(entry.n.channel.equals("media")&&foreign.n==foreignNotification,"preserve channel; isolate sessions");
    check(original.tickerText==null,"clone before mutation");
    int count=manager.posts;FlymeLyrics.onLine(context,session,line);
    check(count==manager.posts,"deduplicate unchanged lyric");
    FlymeLyrics.onMetadata(context,session,first);
    check(count==manager.posts,"repeated metadata does not flicker");
    entry.n=original;FlymeLyrics.onLine(context,session,line);
    check(manager.posts==count+1,"repair native notification replacement");
    FlymeLyrics.onPlaybackState(context,paused);
    check(entry.n.tickerText==null&&(entry.n.flags&flags)==0,"pause clears immediately");
    FlymeLyrics.onLine(context,session,line);
    check(entry.n.tickerText==null,"paused ticker cannot restore lyrics");
    FlymeLyrics.onPlaybackState(context,playing);FlymeLyrics.onLine(context,session,line);
    check(entry.n.tickerText.equals(line),"resume restores");
    FlymeLyrics.onMetadata(context,session,second);
    check(entry.n.tickerText==null,"track change clears immediately");
    FlymeLyrics.onLine(context,session,"next line");
    FlymeLyrics.onMetadata(context,session,null);FlymeLyrics.onLine(context,session,"stale");
    check(entry.n.tickerText==null,"null metadata cannot republish stale line");
    FlymeLyrics.onMetadata(context,session,first);FlymeLyrics.onLine(context,session,line);
    FlymeLyrics.onPlaybackState(context,null);FlymeLyrics.onLine(context,session,"stale");
    check(entry.n.tickerText==null,"null playback cannot republish stale line");
    FlymeLyrics.onPlaybackState(context,playing);FlymeLyrics.onLine(context,session,line);
    FlymeLyrics.onMetadata(context,other,second);
    check(entry.n.tickerText==null,"new session clears previous ticker");
    FlymeLyrics.onLine(context,session,"stale session");
    check(entry.n.tickerText==null,"old session cannot replace current lyric");
    FlymeLyrics.onLine(context,other,"new session");
    check(foreign.n.tickerText.equals("new session"),"current session works");
    FlymeLyrics.onLine(context,other,"  ");check(foreign.n.tickerText==null,"blank text clears");
    FlymeLyrics.onMetadata(context,session,first);
    original.flags|=Notification.FLAG_NO_CLEAR;entry.n=original;
    FlymeLyrics.onLine(context,session,line);FlymeLyrics.clear(context);
    check((entry.n.flags&Notification.FLAG_NO_CLEAR)!=0,"preserve original no-clear flag");
    count=manager.posts;FlymeLyrics.clear(context);
    check(count==manager.posts,"repeated cleanup is quiet");
    manager.fail=true;FlymeLyrics.onLine(context,session,line);FlymeLyrics.onLine(context,session,line);
    check(Log.errors==1,"failures isolated and logged once");
    manager.fail=false;FlymeLyrics.onLine(context,session,line);
    check(entry.n.tickerText.equals(line),"next official tick retries failed notification");
    FlymeLyrics.clear(context);manager.entries.clear();FlymeLyrics.onLine(context,session,line);
    manager.entries.add(entry);FlymeLyrics.onLine(context,session,line);
    check(entry.n.tickerText.equals(line),"late media notification works");
    FlymeLyrics.clear(null);
    System.out.println("PASS: exact text, lifecycle, notification preservation, deduplication, retry and cleanup");
  }
}
