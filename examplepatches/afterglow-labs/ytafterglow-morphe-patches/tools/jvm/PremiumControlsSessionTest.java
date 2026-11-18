package app.afterglow.extension.playback;
import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.view.View;
import android.os.SystemClock;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.video.*;
import app.afterglow.extension.settings.*;
import app.afterglow.extension.diagnostics.DebugLog;
import app.afterglow.extension.ui.PremiumControlsSheet;
public final class PremiumControlsSessionTest {
 static int checks; static Activity activity;static View window;static Transport transport;static Volume volume;static Overlay overlay;
 static void check(boolean value,String name){checks++;if(!value)throw new AssertionError(name);}
 static PremiumControls.Session fresh(){
  activity=new Activity();Afterglow.activity=activity;VideoState.player=new PlayerController(){};VideoState.id="abcdefghijk";
  VideoState.type=PlayerType.WATCH_WHILE_MAXIMIZED;VideoState.shorts=false;VideoState.ad=false;VideoState.state=PlaybackState.PLAYING;VideoState.speed=1;
  Fullscreen.allowed=true;Fullscreen.immediate=true;SystemClock.now=0;Afterglow.queue.clear();AfterglowPrefs.lite=false;AfterglowPrefs.writes=0;InstalledTweaks.lite=true;
  transport=new Transport();volume=new Volume();overlay=new Overlay();OverlayButtons.value=overlay;
  PremiumControls.bindTransport(transport);PremiumControls.bindStableVolume(volume);
  PremiumControls.Session session=new PremiumControls.Session(activity);window=new View(activity);session.attachWindow(window);return session;
 }
 static final class Transport implements PremiumControls.Transport {
  View root=new View(new ContextWrapper(activity)),next=new View(activity);String id=VideoState.id;int changes,speedChoices,preparations;boolean ready=true;float selectedSpeed=1;Integer nativePlaying,preparedPlaying;
  public Object afterglow_transportPlayer(){return VideoState.player;}public View afterglow_overlayRoot(){return root;}public View afterglow_nextButton(){return next;}public String afterglow_transportVideoId(){return id;}
  public int afterglow_transportPlaying(){return nativePlaying!=null?nativePlaying:VideoState.state==PlaybackState.PLAYING?1:VideoState.state==PlaybackState.PAUSED?0:-1;}
  public void afterglow_prepareTransport(){preparations++;if(preparedPlaying!=null)nativePlaying=preparedPlaying;}
  public void afterglow_selectPlaybackSpeed(float value){speedChoices++;selectedSpeed=value;VideoState.speed=value;}
  public boolean afterglow_overlayVisible(){return true;}public boolean afterglow_overlaySetPlaying(boolean playing){if(!ready)return false;changes++;VideoState.state=playing?PlaybackState.PLAYING:PlaybackState.PAUSED;if(nativePlaying!=null)nativePlaying=playing?1:0;if(playing)VideoState.speed=selectedSpeed;return true;}
 }
 static final class Volume implements PremiumControls.StableVolume {
  Object facade=VideoState.player;String id=VideoState.id;int state;int changes;boolean throwsError;
  public Object afterglow_stablePlayer(){return facade;}public String afterglow_stableVideoId(){return id;}
  public int afterglow_stableState(){if(throwsError)throw new IllegalStateException("https://signed.example/secret");return state;}
  public void afterglow_toggleStableVolume(){state=1-state;changes++;}
 }
 static final class VolumeProvider implements PremiumControls.StableVolumeProvider {
  Object facade=VideoState.player;int creates;Volume created;
  public Object afterglow_stableProviderPlayer(){return facade;}
  public PremiumControls.StableVolume afterglow_createStableVolume(){creates++;created=new Volume();return created;}
 }
 static final class Overlay implements OverlayActionController {
  Activity owner=activity;String id=VideoState.id;boolean muted;int lock=1,writes;
  public Activity afterglow_overlayActivity(){return owner;}public String afterglow_overlayVideoId(){return id;}
  public boolean afterglow_isMuted(){return muted;}public void afterglow_setMuted(boolean value){muted=value;}
  public int afterglow_lockState(){return lock;}public void afterglow_setLocked(boolean value){lock=value?2:1;writes++;}
 }
 public static void main(String[] args){
  PremiumControls.Session s=fresh();check(s.active(),"Current watch active");check(s.title().isEmpty()&&s.channel().isEmpty(),"Unhooked metadata does not invent a title");
  check(s.canPlay()&&s.togglePlaying()&&!s.playing(),"Pause through actual transport");check(s.togglePlaying()&&s.playing(),"Play through same transport");
  transport.ready=false;check(!s.togglePlaying()&&transport.changes==2,"Native readiness refusal retained");transport.ready=true;
  VideoState.state=PlaybackState.ENDED;check(!s.canPlay()&&!s.togglePlaying(),"Ended play control not treated as pause");VideoState.state=PlaybackState.PAUSED;
  check(s.restart()&&VideoState.seek==0,"Restart seeks zero");check(s.skip(-10000)&&VideoState.relative==-10000,"Back ten");check(s.skip(10000)&&VideoState.relative==10000,"Forward ten");check(!s.skip(1),"No unintended skip interval");
  check(s.speed(.25f)&&VideoState.speed==.25f,"Quarter speed");check(s.speed(5)&&VideoState.speed==5,"Five times speed");check(!s.speed(Float.NaN)&&!s.speed(Float.POSITIVE_INFINITY)&&!s.speed(0)&&!s.speed(5.1f),"Invalid speed rejected");
  check(s.speed(2)&&transport.speedChoices==3,"Explicit speed uses native menu-selection command on first use");check(s.togglePlaying()&&VideoState.speed==2,"Paused selection persists through native resume");
  check(s.canNext()&&s.next()&&transport.next.clicks==1,"Next invokes native click owner");transport.next.enabled=false;check(!s.canNext()&&!s.next(),"Disabled native Next retained");transport.next.enabled=true;transport.next.listener=false;check(!s.next(),"No fake Next without native listener");transport.next.listener=true;transport.next.attached=false;check(!s.next(),"Detached Next refused");transport.next.attached=true;
  check(s.stableVolume()==0&&s.toggleStableVolume()&&s.stableVolume()==1,"Stable volume reads actual native state");volume.state=-1;check(!s.toggleStableVolume()&&volume.changes==1,"Unsupported native audio cannot toggle");volume.state=0;volume.id="otherVideo1";check(s.stableVolume()==-1&&!s.toggleStableVolume(),"Preloaded audio owner rejected");volume.id=VideoState.id;
  Object activeFacade=volume.facade;volume.facade=new Object();check(s.stableVolume()==-1&&!s.toggleStableVolume(),"Same-ID foreign audio facade rejected");volume.facade=activeFacade;
  check(s.toggleMuted()&&s.muted()==1&&overlay.muted,"Native mute");check(s.toggleMuted()&&s.muted()==0,"Native unmute");check(s.toggleLite()&&s.lite(),"Lite is persisted");check(s.toggleLite()&&!s.lite(),"Lite restores previous policies");
  window.focus=false;check(s.active()&&!s.restart()&&!s.speed(1)&&!s.toggleMuted()&&!s.toggleStableVolume()&&!s.next()&&!s.toggleLite()&&!s.toggleLocked(),"Unfocused sheet cannot mutate playback");window.focus=true;
  transport.id="oldVideo123";check(!s.canPlay()&&!s.canNext()&&!s.speed(1)&&transport.speedChoices==3,"Attached old transport rejected");transport.id=VideoState.id;
  volume.throwsError=true;check(s.stableVolume()==-1&&!DebugLog.last.contains("secret"),"Native errors fail open without raw exception data");volume.throwsError=false;
  check(s.toggleLocked()&&overlay.lock==2&&!s.lockPending(),"Lock enters fullscreen then locks");s.close();check(overlay.lock==1&&overlay.writes==2,"Closing releases sheet-owned lock");s.close();check(overlay.writes==2,"Closing twice is harmless");check(!s.active()&&!s.restart(),"Closed session cannot act");
  s=fresh();overlay.lock=2;s.close();check(overlay.lock==2&&overlay.writes==0,"Preexisting lock survives closing");
  s=fresh();overlay.lock=2;check(s.toggleLocked()&&overlay.lock==1,"Explicit preexisting unlock remains possible");s.close();check(overlay.writes==1,"Explicit unlock does not gain later ownership");
  s=fresh();Fullscreen.allowed=false;check(!s.toggleLocked()&&!s.lockPending()&&overlay.writes==0,"Fullscreen refusal never creates a lock");
  s=fresh();Fullscreen.immediate=false;check(s.toggleLocked()&&s.lockPending()&&overlay.writes==0,"Async fullscreen waits");VideoState.type=PlayerType.WATCH_WHILE_FULLSCREEN;Afterglow.flush();check(overlay.lock==2&&!s.lockPending(),"Async lock completes for same video");s.close();check(overlay.lock==1,"Async owned lock cleaned up");
  s=fresh();Fullscreen.immediate=false;s.toggleLocked();s.close();VideoState.type=PlayerType.WATCH_WHILE_FULLSCREEN;Afterglow.flush();check(overlay.writes==0,"Close cancels queued lock");
  s=fresh();Fullscreen.immediate=false;s.toggleLocked();VideoState.id="newVideo123";VideoState.type=PlayerType.WATCH_WHILE_FULLSCREEN;Afterglow.flush();check(overlay.writes==0&&!s.lockPending(),"Video switch cancels queued lock");
  s=fresh();Fullscreen.immediate=false;s.toggleLocked();Overlay replacement=new Overlay();OverlayButtons.value=replacement;VideoState.type=PlayerType.WATCH_WHILE_FULLSCREEN;Afterglow.flush();check(overlay.writes==0&&replacement.writes==0,"Native owner replacement cancels queued lock");
  s=fresh();Fullscreen.immediate=false;s.toggleLocked();SystemClock.now=2001;VideoState.type=PlayerType.WATCH_WHILE_FULLSCREEN;Afterglow.flush();check(overlay.writes==0&&!s.lockPending(),"Late fullscreen does not lock unexpectedly");
  s=fresh();Fullscreen.immediate=false;s.toggleLocked();overlay.lock=2;VideoState.type=PlayerType.WATCH_WHILE_FULLSCREEN;Afterglow.flush();s.close();check(overlay.writes==0&&overlay.lock==2,"Other owner's lock during fullscreen is preserved");
  s=fresh();PlayerController old=VideoState.player;VideoState.player=new PlayerController(){};check(!s.active()&&!s.next()&&!s.speed(2)&&!s.toggleMuted(),"Director replacement invalidates same-ID session");VideoState.player=old;
  s=fresh();check(transport.speedChoices==0&&VideoState.speed==1,"New video has no automatic Premium speed reapplication");
  check(s.canLite()&&!s.lite(),"Installed Lite owner exposes the current off state");
  InstalledTweaks.lite=false;
  check(!s.canLite()&&!s.lite()&&!s.toggleLite()&&!AfterglowPrefs.lite&&AfterglowPrefs.writes==0,"Omitted Lite owner cannot enable or write the stored off preference");
  AfterglowPrefs.lite=true;
  check(!s.canLite()&&!s.lite()&&!s.toggleLite()&&AfterglowPrefs.lite&&AfterglowPrefs.writes==0,"Omitted Lite owner reports unavailable and off while preserving a saved on preference");
  InstalledTweaks.lite=true;
  check(s.canLite()&&s.lite()&&AfterglowPrefs.writes==0,"Restoring the owner reveals its saved preference without a write");
  check(s.toggleLite()&&!s.lite()&&!AfterglowPrefs.lite&&AfterglowPrefs.writes==1,"Installed Lite owner still permits an explicit preference change");
  s=fresh();transport.nativePlaying=1;VideoState.state=PlaybackState.NEW;
  check(s.playing()&&s.canPlay(),"First-open label reads current native button despite an uninitialized global observer");
  check(s.togglePlaying()&&transport.nativePlaying==0,"First-open Pause uses native playing direction");
  VideoState.state=PlaybackState.PLAYING;
  check(!s.playing()&&s.togglePlaying()&&transport.nativePlaying==1,"Native paused state wins over stale global playing state");
  transport.nativePlaying=-1;check(!s.canPlay()&&!s.togglePlaying(),"Unknown native button state never guesses a transport action");
  s=fresh();transport.nativePlaying=-1;transport.preparedPlaying=1;
  int previousOpens=PremiumControlsSheet.opens;PremiumControls.open(activity);
  check(PremiumControlsSheet.opens==previousOpens+1&&transport.preparations==1&&transport.nativePlaying==1,"Explicit cold sheet open initializes the exact native controls before presentation");
  check(transport.changes==0&&volume.changes==0&&transport.speedChoices==0,"Cold initialization does not invoke playback, volume or speed actions");
  transport.id="foreign1234";PremiumControls.open(activity);
  check(transport.preparations==1,"Foreign transport cannot be initialized by this sheet");
  PremiumControlsSheet.opens=0;
  s=fresh();volume.facade=new Object();VolumeProvider lazy=new VolumeProvider();PremiumControls.bindStableVolumeProvider(lazy);
  check(lazy.creates==0,"Capturing native provider does not create or toggle a command");
  check(s.stableVolume()==0&&lazy.creates==1&&lazy.created.changes==0,"First sheet use resolves native command without requiring native menu or toggling audio");
  for(int i=0;i<20;i++)s.stableVolume();check(lazy.creates==1,"Session strongly retains lazy native command across refreshes");
  check(s.toggleStableVolume()&&lazy.created.changes==1&&s.stableVolume()==1,"Explicit toggle uses the retained native command");
  s.close();check(s.stableVolume()==-1&&lazy.creates==1,"Closed session cannot resolve another command");
  s=fresh();volume.facade=new Object();VolumeProvider foreign=new VolumeProvider();foreign.facade=new Object();PremiumControls.bindStableVolumeProvider(foreign);
  check(s.stableVolume()==-1&&foreign.creates==0,"Foreign native provider is rejected before constructing its handler");
  s=fresh();
  VideoState.ad=true;check(!s.active()&&!s.togglePlaying(),"Ads cannot be controlled");VideoState.ad=false;VideoState.shorts=true;check(!s.active(),"Shorts cannot reuse standard controls");VideoState.shorts=false;VideoState.type=PlayerType.NONE;check(!s.active(),"Closed player cannot be controlled");VideoState.type=PlayerType.WATCH_WHILE_MAXIMIZED;
  activity.destroyed=true;check(!s.active(),"Destroyed activity rejected");activity.destroyed=false;Afterglow.activity=new Activity();check(!s.active(),"Different foreground activity rejected");
  s=fresh();InstalledTweaks.overlay=false;PremiumControls.open(activity);check(PremiumControlsSheet.opens==0,"Absent owner cannot open sheet");InstalledTweaks.overlay=true;LiteMode.controls=false;PremiumControls.open(activity);check(PremiumControlsSheet.opens==0,"Disabled preference cannot open sheet");LiteMode.controls=true;PremiumControls.open(activity);check(PremiumControlsSheet.opens==1,"Installed enabled owner opens sheet");
  System.out.println(checks+" Premium Controls session checks passed");
 }
}
