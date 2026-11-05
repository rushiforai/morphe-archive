#!/usr/bin/env python3
"""Drive actual SleepTimer, KickPlayer and TwitchPlayer on a deterministic JVM scheduler.

No APK, Android SDK or network required. Runtime callbacks and entire production classes
are compiled unchanged. Only Android/platform boundaries are doubled.
"""
import sys
from pathlib import Path

sys.dont_write_bytecode = True
from host_java import run

PROBE = '''
import android.os.Handler;
import java.lang.reflect.*;
import io.github.jordanwoodson.extension.shared.SleepTimer;
import io.github.jordanwoodson.extension.shared.settings.Settings;
public class SleepTimerProbe {
  public static class Player {
    int pauses;
    public void pause(){pauses++;SleepTimer.onStop(this);}
  }
  static Method play,stop;
  static int checks;
  static void check(boolean b,String m){if(!b)throw new AssertionError(m);checks++;}
  static void start(Player p)throws Exception{play.invoke(null,p);Handler.advance(0);}
  static void end(Player p)throws Exception{stop.invoke(null,p);}
  static void expire(){Handler.advance(60_000);}
  public static void main(String[] args)throws Exception{
    Settings.values.put("sleep_timer","1");
    if(args[0].startsWith("concurrency:")){
      SleepTimerConcurrencyProbe.run(args[0].substring("concurrency:".length()));return;
    }
    String[] test=args[0].split(":");
    Class<?> type=Class.forName("io.github.jordanwoodson.extension.shared."+test[0]);
    play=type.getMethod("onPlay",Object.class);stop=type.getMethod("onStop",Object.class);
    // At expiry the platform pause bridges miss old. A different player starts during the grace period.
    if(test[1].equals("new")){
    Player old=new Player(),fresh=new Player();start(old);expire();start(fresh);Handler.advance(3000);
    check(fresh.pauses==0,"new player started after expiry was paused");
    check(old.pauses==1,"genuinely missed eligible old player was not paused");end(fresh);}
    // The same Java player can resume; object membership alone is insufficient.
    if(test[1].equals("resume")){
    Player resumed=new Player();start(resumed);expire();end(resumed);start(resumed);Handler.advance(3000);
    check(resumed.pauses==0,"resumed same player was paused by stale expiry");end(resumed);}
    // Even a redundant play callback without stop is a newer playback generation.
    if(test[1].equals("replay")){
    Player replay=new Player();start(replay);expire();start(replay);Handler.advance(3000);
    check(replay.pauses==0,"play on same instance did not invalidate expiry");end(replay);}
    if(test[1].equals("stop")){
    Player stopped=new Player();start(stopped);expire();end(stopped);Handler.advance(3000);
    check(stopped.pauses==0,"stopped/released player was paused");}
    // Repeated timer cycles each pause once, and no longer own a resumed generation.
    if(test[1].equals("repeat")){
    Player repeated=new Player();start(repeated);expire();Handler.advance(3000);
    check(repeated.pauses==1,"first expiry did not pause once");start(repeated);expire();Handler.advance(3000);
    check(repeated.pauses==2,"second expiry did not pause once");Handler.advance(60_000);
    check(repeated.pauses==2,"old expiry paused again");}
    // The chosen time changed mid-playback (the player's Sleep timer row): re-armed from now; Off cancels.
    if(test[1].equals("change")){
    Player changed=new Player();start(changed);Handler.advance(30_000);
    Settings.values.put("sleep_timer","2");SleepTimer.settingChanged();Handler.advance(0);Handler.advance(90_000);
    check(changed.pauses==0,"the old one-minute expiry still fired after the change");Handler.advance(30_000+3000);
    check(changed.pauses==1,"re-armed timer did not pause two minutes after the change");
    Player off=new Player();Settings.values.put("sleep_timer","1");start(off);Handler.advance(30_000);
    Settings.values.put("sleep_timer","0");SleepTimer.settingChanged();Handler.advance(120_000);
    check(off.pauses==0,"Off from the row still paused");Settings.values.put("sleep_timer","1");end(off);end(changed);}
    // Timer-off before fallback must suppress the outstanding pause.
    if(test[1].equals("disable")){
    Player disabled=new Player();start(disabled);expire();Settings.values.put("sleep_timer","0");Handler.advance(3000);
    check(disabled.pauses==0,"disabled timer still paused a player");end(disabled);}
    System.out.println("PASS: "+args[0]+" "+checks+" deterministic sleep checks");
  }
}
'''

if __name__ == '__main__':
    run('SleepTimerProbe', ['SleepTimer.java', 'kick/KickPlayer.java', 'twitch/TwitchPlayer.java'],
        PROBE, [helper + ':' + scenario for helper in ['kick.KickPlayer', 'twitch.TwitchPlayer']
                for scenario in ['new', 'resume', 'replay', 'stop', 'repeat', 'change', 'disable']]
        + ['concurrency:' + boundary for boundary in ['initial-expiry', 'initial-runnable', 'fallback', 'executor',
            'queued-new', 'queued-resume', 'queued-current', 'queued-stock', 'queued-failure', 'queued-disabled',
            'lockfree-stop', 'lockfree-play']],
        extra={'SleepTimerConcurrencyProbe.java': Path(__file__).with_name('SleepTimerConcurrencyProbe.java').read_text()})
