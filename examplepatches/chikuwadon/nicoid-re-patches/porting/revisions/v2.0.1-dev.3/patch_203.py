"""Source-scoped v2.0.1-dev.3 overlays.

Uses immutable v2.0.0 and v1.11.1 inputs plus the v2.0.1-dev.2 deltas.
Fails closed on any unexpected upstream source change.
"""
import importlib.util
from pathlib import Path
ROOT = Path(__file__).resolve().parent
REVISIONS = ROOT.parent
REPOSITORY = ROOT.parents[2]
BASE = REVISIONS / "v2.0.0-dev.1"
PREVIOUS = REVISIONS / "v2.0.1-dev.2"
spec = importlib.util.spec_from_file_location("_live_dev2_patch", PREVIOUS / "patch_sources.py")
previous = importlib.util.module_from_spec(spec)
spec.loader.exec_module(previous)
OVERRIDES = frozenset(previous.OVERRIDES | {
    "NicoliveEntry.java", "NicoliveService.java",
    "RetainedPlayback137.java", "PlayerIcons.java", "PlayerTheme.java"
})

def replace_once(source, old, new, file):
    count = source.count(old)
    if count != 1:
        raise ValueError(f"{file}: unexpected replacement anchor count {count}: {old[:85]}")
    return source.replace(old, new)

def entry(s):
    return replace_once(s, 'japanese ? "ニコ生の視聴" : "Watch Niconico Live"',
                           'japanese ? "ニコニコ生放送の視聴" : "Watch Niconico Live"',
                           "NicoliveEntry.java")

def live_service(s):
    filename = "NicoliveService.java"
    s = replace_once(s,
        'void stopPlayback(){if(stopped)return;stopped=true;clearArtwork();artworkWork.shutdownNow();++serial;closePopup();if(frame!=null)detach(frame);if(session!=null){session.close();session=null;}main.removeCallbacksAndMessages(null);if(player!=null){player.release();player=null;}stopForeground(true);stopSelf();for(Observer o:new ArrayList<Observer>(observers))o.changed();}',
        '''void stopPlayback(){
      if(stopped){clearMediaSessionAndNotification();return;}
      stopped=true;
      clearArtwork();
      artworkWork.shutdownNow();
      ++serial;
      closePopup();
      if(frame!=null)detach(frame);
      if(session!=null){session.close();session=null;}
      main.removeCallbacksAndMessages(null);
      if(player!=null){player.release();player=null;}
      clearMediaSession();
      try{stopForeground(true);}catch(RuntimeException exception){
        android.util.Log.w("nicoid-live","Unable to remove foreground state",exception);
      }
      cancelNotification();
      stopSelf();
      for(Observer o:new ArrayList<Observer>(observers))o.changed();
    }
    private void clearMediaSession(){
      if(mediaSession!=null){
        android.media.session.MediaSession old=mediaSession;
        mediaSession=null;
        try{
          old.setPlaybackState(new PlaybackState.Builder()
            .setState(PlaybackState.STATE_STOPPED,PlaybackState.PLAYBACK_POSITION_UNKNOWN,0f)
            .build());
          old.setActive(false);
        }finally{old.release();}
      }
    }
    private void cancelNotification(){
      NotificationManager manager=(NotificationManager)getSystemService(NOTIFICATION_SERVICE);
      if(manager!=null)manager.cancel(2000);
    }
    private void clearMediaSessionAndNotification(){
      clearMediaSession();
      cancelNotification();
    }''',filename)
    s = replace_once(s,
        '''if(end){++serial;commentsConnected=false;if(session!=null){session.close();session=null;}player.pause();main.removeCallbacks(tick);stopForeground(true);stopSelf();}notifyObservers();updateNotification();''',
        '''if(end){stopPlayback();return;}notifyObservers();updateNotification();''', filename)
    s = replace_once(s,
        '''@Override public void onDestroy(){stopPlayback();if(mediaSession!=null){mediaSession.release();mediaSession=null;}if(active==this)active=null;observers.clear();super.onDestroy();}''',
        '''@Override public void onDestroy(){stopPlayback();if(active==this)active=null;observers.clear();super.onDestroy();}''', filename)
    return s

def retained(s):
    filename = "RetainedPlayback137.java"
    s = replace_once(s,
        'if(usable(current))return current.source==a?()->{}:null;',
        '''if(usable(current))return current.source==a?()->{}:null;
    if(current!=null)finish(current,false);''', filename)
    s = replace_once(s,
        '''if(!usable(s)||intent.getLongExtra("nicoid_retained_token_137",-1)!=s.token){
   service.stopSelf();return true;
  }''',
        '''if(!usable(s)){
   // No active playback owns this keeper. Remove any orphaned MediaSession.
   clearKeeperNotification(service);
   try{service.stopForeground(true);}catch(RuntimeException ignored){}
   service.stopSelf();return true;
  }
  if(intent.getLongExtra("nicoid_retained_token_137",-1)!=s.token){
   // Delayed controls from an older session must NOT stop a new session.
   return true;
  }''', filename)
    s = replace_once(s,
        '''public static synchronized void serviceDestroyed(Service service){
  Session s=current;
  if(s!=null&&s.service==service){
   s.service=null;
   if(s.media!=null){s.media.setActive(false);s.media.release();s.media=null;}
   Log.i(TAG,"Keeper destroyed; no decoder released");
  }
 }''',
        '''public static synchronized void serviceDestroyed(Service service){
  Session s=current;
  if(s!=null&&s.service==service){
   // The keeper unexpectedly disappeared. Do not retain an orphaned Activity.
   finish(s,false);
   Log.i(TAG,"Keeper destroyed; stale playback session retired");
  }
  clearKeeperNotification(service);
 }''', filename)
    s = replace_once(s,
        '''private static synchronized void finish(Session s,boolean stop) {''',
        '''private static void clearKeeperNotification(Context context){
  if(context==null)return;
  NotificationManager manager=(NotificationManager)
      context.getSystemService(Context.NOTIFICATION_SERVICE);
  if(manager!=null)manager.cancel(NOTIFICATION);
 }
 private static synchronized void finish(Session s,boolean stop) {''', filename)
    s = replace_once(s,
        '''  if(s.media!=null){s.media.setActive(false);s.media.release();s.media=null;}
  Service keeper=s.service;s.service=null;
  if(keeper!=null){keeper.stopForeground(true);keeper.stopSelf();}''',
        '''if(s.media!=null){
    try{s.media.setPlaybackState(new PlaybackState.Builder()
      .setState(PlaybackState.STATE_STOPPED,PlaybackState.PLAYBACK_POSITION_UNKNOWN,0f)
      .build());s.media.setActive(false);}
    finally{s.media.release();s.media=null;}
   }
   Service keeper=s.service;s.service=null;
   if(keeper!=null){
    try{keeper.stopForeground(true);}catch(RuntimeException ignored){}
    clearKeeperNotification(keeper);
    keeper.stopSelf();
   }else{
    clearKeeperNotification(s.source);
   }''', filename)
    return s

def icons(s):
    return replace_once(s,'case "play":Path p=new Path();p.moveTo(6,3);p.lineTo(20,12);p.lineTo(6,21);p.close();paint.setColor(0xaa000000);paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(.75f);',
        'case "play":Path p=new Path();p.moveTo(6,3);p.lineTo(20,12);p.lineTo(6,21);p.close();paint.setColor(0xaa000000);paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(.50f);',
        "PlayerIcons.java")

def theme(s):
    file = "PlayerTheme.java"
    s = replace_once(s,
        '''private static final java.util.WeakHashMap<View,android.graphics.drawable.Drawable> DETAILS=new java.util.WeakHashMap<>();''',
        '''private static final java.util.WeakHashMap<View,java.lang.ref.WeakReference<android.graphics.drawable.Drawable>> DETAILS=new java.util.WeakHashMap<>();
    private static final java.util.WeakHashMap<View,Boolean> DETAIL_MODE=new java.util.WeakHashMap<>();
    private static android.graphics.drawable.Drawable tracked(View view){
      java.lang.ref.WeakReference<android.graphics.drawable.Drawable> ref=DETAILS.get(view);
      return ref==null?null:ref.get();
    }
    private static void remember(View view,android.graphics.drawable.Drawable drawable){
      DETAILS.put(view,new java.lang.ref.WeakReference<>(drawable));
    }''', file)
    old='''static void detailItem(View view){if(view==null||!ThemeChoice.isNight(view.getContext()))return;if(DETAILS.get(view)==view.getBackground()&&view.getBackground()!=null)return;android.content.Context c=view.getContext();int id=c.getResources().getIdentifier("nicoid_detail_item_dark","color",c.getPackageName());int color=id==0?0xff292b31:c.getResources().getColor(id);android.graphics.drawable.Drawable bg=new android.graphics.drawable.RippleDrawable(android.content.res.ColorStateList.valueOf((UiDialogs.accent(c)&0xffffff)|0x22000000),new android.graphics.drawable.ColorDrawable(color),null);view.setBackgroundTintList(null);view.setBackground(bg);DETAILS.put(view,bg);}'''
    new='''static void detailItem(View view){
      if(view==null)return;
      android.content.Context c=view.getContext();
      boolean dark=ThemeChoice.isNight(c);
      if(tracked(view)==view.getBackground()&&view.getBackground()!=null
          &&Boolean.valueOf(dark).equals(DETAIL_MODE.get(view)))return;
      String name=dark?"nicoid_detail_item_dark":"nicoid_detail_item_light";
      int id=c.getResources().getIdentifier(name,"color",c.getPackageName());
      int color=id==0?(dark?0xff292b31:0xfff0f1f3):c.getResources().getColor(id);
      android.graphics.drawable.Drawable bg=new android.graphics.drawable.RippleDrawable(
          android.content.res.ColorStateList.valueOf((UiDialogs.accent(c)&0xffffff)|0x22000000),
          new android.graphics.drawable.ColorDrawable(color),null);
      view.setBackgroundTintList(null);
      view.setBackground(bg);
      remember(view,bg);
      DETAIL_MODE.put(view,dark);
    }'''
    s = replace_once(s,old,new,file)
    s = replace_once(s,'DETAILS.get(item)!=item.getBackground()','tracked(item)!=item.getBackground()',file)
    s = replace_once(s,'DETAILS.put(item,bg);TAG_MODE.put(item,dark)','remember(item,bg);TAG_MODE.put(item,dark)',file)
    return s

def stage(original, destination):
    original=Path(original);destination=Path(destination)
    previous.stage(original,destination)
    inputs={
      "NicoliveEntry.java":(original/"NicoliveEntry.java",entry),
      "NicoliveService.java":(original/"NicoliveService.java",live_service),
      "RetainedPlayback137.java":(REVISIONS/"v1.11.1/java/e/e/a/RetainedPlayback137.java",retained),
      "PlayerIcons.java":(REVISIONS/"v1.10.0/src/e/e/a/PlayerIcons.java",icons),
      "PlayerTheme.java":(REVISIONS/"v1.10.0/src/e/e/a/PlayerTheme.java",theme),
    }
    for name,(source,transform) in inputs.items():
      if not source.is_file():raise FileNotFoundError(source)
      (destination/name).write_text(transform(source.read_text(encoding="utf-8")),encoding="utf-8")
    return tuple(sorted(destination.glob("*.java")))
