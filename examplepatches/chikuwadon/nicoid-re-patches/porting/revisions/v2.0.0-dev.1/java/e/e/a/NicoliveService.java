package e.e.a;

import android.app.*;import android.content.*;import android.graphics.Color;import android.media.session.*;import android.media.MediaMetadata;import android.net.Uri;import android.os.*;import android.preference.PreferenceManager;import android.text.TextUtils;import android.view.*;import android.widget.*;
import androidx.media3.common.*;import androidx.media3.datasource.*;import androidx.media3.exoplayer.*;import androidx.media3.exoplayer.hls.HlsMediaSource;import java.io.*;import java.net.URI;import java.util.*;import java.util.concurrent.*;import android.graphics.Bitmap;import org.json.*;

/** One process-local owner across the activity, popup and audio background modes. */
public class NicoliveService extends android.app.Service {
 public interface Observer {void changed();void posted(boolean success,String message);}
 public static volatile NicoliveService active;
 public class LocalBinder extends Binder {public NicoliveService service(){return NicoliveService.this;}}
 final Handler main=new Handler(Looper.getMainLooper());final Set<Observer> observers=Collections.newSetFromMap(new WeakHashMap<Observer,Boolean>());
 final ArrayDeque<NicoliveData.Chat> history=new ArrayDeque<NicoliveData.Chat>();final ArrayDeque<NicoliveData.Chat> incoming=new ArrayDeque<NicoliveData.Chat>();
 final PriorityQueue<NicoliveData.Chat> scheduled=new PriorityQueue<NicoliveData.Chat>(32,new Comparator<NicoliveData.Chat>(){public int compare(NicoliveData.Chat a,NicoliveData.Chat b){return Long.compare(a.vpos,b.vpos);}});
 final Timeline.Window window=new Timeline.Window();ExoPlayer player;NicoliveSession session;NicoliveNg ng;NicoliveData.Program program;
 String id="",status="",selected="abr";List<String> qualities=new ArrayList<String>();volatile JSONArray mediaCookies=new JSONArray();String activeStreamUri="",activeStreamQuality="";volatile int serial;volatile boolean stopped;boolean commentsConnected,commentVisible=true,audioOnly,terminal,userPaused,cryptoRecoveryPending;HlsKeyRefreshingPlaylistParser keyParser;int cryptoRecoveryCount;long cryptoRecoveryStart;float aspect=16f/9;long pausedAt,deliveredCount;
 NicolivePlayerFrame frame,popup;WindowManager manager;WindowManager.LayoutParams popupParams;android.media.session.MediaSession mediaSession;
 final ExecutorService artworkWork=Executors.newSingleThreadExecutor();
 Future<?> artworkTask;Bitmap mediaArtwork;int artworkToken;
 String artworkProgramId="";

 final Runnable tick=new Runnable(){public void run(){if(stopped)return;boolean changed=false;long now=playbackEpoch();synchronized(incoming){while(!incoming.isEmpty()){NicoliveData.Chat c=incoming.removeFirst();scheduled.add(c);while(scheduled.size()>2000)scheduled.poll();}}
  if(playing()&&now>0&&program!=null){while(!scheduled.isEmpty()){
   NicoliveData.Chat c=scheduled.peek();long target=program.vposBase*1000+c.vpos*10;if(target>now+150)break;scheduled.poll();if(target<now-15000||ng.blocked(c))continue;history.addLast(c);deliveredCount++;while(history.size()>2000)history.removeFirst();if(frame!=null&&commentVisible&&!audioOnly)frame.comments.add(c,target);changed=true;
  }}if(changed)notifyObservers();if(frame!=null)frame.updateControls();main.postDelayed(this,250);
 }};
 @Override public void onCreate(){super.onCreate();active=this;manager=(WindowManager)getSystemService(WINDOW_SERVICE);ng=new NicoliveNg(this);NicoliveDiagnostics.init(this);
  if(Build.VERSION.SDK_INT>=26){NotificationChannel channel=new NotificationChannel("nicoid_live", "生放送の再生",NotificationManager.IMPORTANCE_LOW);channel.setShowBadge(false);((NotificationManager)getSystemService(NOTIFICATION_SERVICE)).createNotificationChannel(channel);}
  mediaSession=new android.media.session.MediaSession(this,"nicoid-live");mediaSession.setCallback(new android.media.session.MediaSession.Callback(){public void onPlay(){resume();}public void onPause(){pause();}public void onStop(){stopPlayback();}},main);mediaSession.setActive(true);
  foreground();player=new ExoPlayer.Builder(this).build();player.setAudioAttributes(new AudioAttributes.Builder().setUsage(C.USAGE_MEDIA).setContentType(C.AUDIO_CONTENT_TYPE_MOVIE).build(),true);player.setHandleAudioBecomingNoisy(true);
  player.addListener(new Player.Listener(){public void onPlayerError(PlaybackException error){handlePlaybackError(error);}public void onIsPlayingChanged(boolean value){if(frame!=null){frame.updateControls();if(value)frame.comments.postInvalidateOnAnimation();}}public void onEvents(Player source,Player.Events events){
   if(events.containsAny(Player.EVENT_IS_PLAYING_CHANGED,Player.EVENT_PLAY_WHEN_READY_CHANGED,Player.EVENT_PLAYBACK_STATE_CHANGED))updateNotification();
  }public void onVideoSizeChanged(VideoSize size){if(size.height>0){aspect=size.width*size.pixelWidthHeightRatio/size.height;if(frame!=null)frame.aspect(aspect);if(popup!=null)resizePopup(popupParams.width);}}});main.post(tick);
 }
 @Override public int onStartCommand(Intent intent,int flags,int startId){if(intent!=null){String action=intent.getAction();if("stop".equals(action)){stopPlayback();return START_NOT_STICKY;}if("toggle".equals(action)){if(playRequested())pause();else resume();}else if("popup".equals(action))showPopup();else if("reconnect".equals(action)){if(!id.isEmpty())open(id);}else{String requested=NicoliveData.id(intent.getStringExtra("program"));if(requested!=null&&(terminal||!requested.equals(id)))open(requested);}}
  if(id.isEmpty())stopPlayback();
  return START_NOT_STICKY;
 }
 @Override public IBinder onBind(Intent intent){return new LocalBinder();}
 public void observe(Observer o){observers.add(o);o.changed();}public void unobserve(Observer o){observers.remove(o);}
 void notifyObservers(){for(Observer o:new ArrayList<Observer>(observers))o.changed();}
 /**
  * Refresh watch-session credentials, HLS playlists and AES keys after a
  * decryption failure. A single segment retry is insufficient when the server
  * has rotated its signed HLS URL or key. Never retry unrelated player errors.
  * Keep a bounded 5-minute retry window so a permanently invalid stream does
  * not spin through reconnects forever.
  */
 void handlePlaybackError(PlaybackException error){
  NicoliveDiagnostics.record("PLAYER_ERROR","code="+error.getErrorCodeName()
   +" cause="+(error.getCause()==null?"none":error.getCause().getClass().getSimpleName())
   +" aesManifest="+(keyParser!=null&&keyParser.sawAes128)
   +" blankGaps="+(keyParser==null?0:keyParser.blankGapTags.get())
   +" llPartsSuppressed="+(keyParser==null?0:keyParser.llPartsSuppressed.get()));
  long now=android.os.SystemClock.elapsedRealtime();
  if((LiveRecoveryPolicy.isAes128Failure(error)||(keyParser!=null&&keyParser.sawAes128&&LiveRecoveryPolicy.isCorruptedFmp4Failure(error)))&&session!=null&&!terminal&&!userPaused&&!stopped){
   if(cryptoRecoveryStart==0||now<cryptoRecoveryStart||now-cryptoRecoveryStart>LiveRecoveryPolicy.WINDOW_MS){
    cryptoRecoveryStart=now;cryptoRecoveryCount=0;
   }
   if(cryptoRecoveryCount<LiveRecoveryPolicy.MAX_ATTEMPTS&&!cryptoRecoveryPending){
    final int attempt=++cryptoRecoveryCount, token=serial;
    cryptoRecoveryPending=true;
    status="HLS配信データを再取得しています…";
    android.util.Log.w("nicoid-live","Encrypted HLS consistency error ("+error.getErrorCodeName()+"); blankGaps="+(keyParser==null?0:keyParser.blankGapTags.get())+"; refreshing watch session "+attempt+"/"+LiveRecoveryPolicy.MAX_ATTEMPTS);
    notifyObservers();updateNotification();
    main.postDelayed(()->{
     if(!stopped&&token==serial&&session!=null&&!terminal&&!userPaused&&cryptoRecoveryPending){
      cryptoRecoveryPending=false;session.reconnect();
     }
    },LiveRecoveryPolicy.retryDelayMs(attempt));
    return;
   }
  }
  cryptoRecoveryPending=false;
  android.util.Log.w("nicoid-live","Unrecoverable media playback error, code="+error.getErrorCodeName());
  status="映像を再生できませんでした。再接続をお試しください";
  notifyObservers();updateNotification();
 }
 void open(String newId){if(stopped||player==null)return;NicoliveDiagnostics.record("WATCH","begin-new-session");activeStreamUri="";activeStreamQuality="";mediaCookies=new JSONArray();keyParser=null;clearArtwork();cryptoRecoveryPending=false;cryptoRecoveryCount=0;cryptoRecoveryStart=0;final int token=++serial;main.removeCallbacks(tick);main.post(tick);NicoliveEntry.beforeLive(this);if(session!=null)session.close();id=newId;program=null;terminal=false;status="接続中…";qualities.clear();selected="abr";audioOnly=false;userPaused=false;deliveredCount=0;commentsConnected=false;pausedAt=0;player.setTrackSelectionParameters(player.getTrackSelectionParameters().buildUpon().setTrackTypeDisabled(C.TRACK_TYPE_VIDEO,false).build());history.clear();scheduled.clear();synchronized(incoming){incoming.clear();}if(frame!=null)frame.comments.clear();ng.reload();player.stop();
  String cookie="";try{cookie=SessionCookies194.cookie(this,null);}catch(Exception ignored){}
  session=new NicoliveSession(id,cookie,new NicoliveSession.Listener(){
   void dispatch(final Runnable r){main.post(new Runnable(){public void run(){if(!stopped&&token==serial)r.run();}});}
   public void program(final NicoliveData.Program p){dispatch(new Runnable(){public void run(){program=p;requestArtwork(p);saveHistory(p);notifyObservers();updateNotification();}});}
   public void stream(final JSONObject stream){dispatch(new Runnable(){public void run(){applyStream(stream);}});}
   public void status(final String text,final boolean end){dispatch(new Runnable(){public void run(){status=text;terminal=end;if(end){++serial;commentsConnected=false;if(session!=null){session.close();session=null;}player.pause();main.removeCallbacks(tick);stopForeground(true);stopSelf();}notifyObservers();updateNotification();}});}
   public void comment(NicoliveData.Chat chat){if(stopped||token!=serial||ng.blocked(chat))return;synchronized(incoming){if(stopped||token!=serial)return;incoming.addLast(chat);while(incoming.size()>2000)incoming.removeFirst();}}
   public void commentState(final boolean connected){dispatch(new Runnable(){public void run(){commentsConnected=connected;notifyObservers();}});}
   public void posted(final boolean success,final String message){dispatch(new Runnable(){public void run(){for(Observer o:new ArrayList<Observer>(observers))o.posted(success,message);}});}
  });foreground();session.start();notifyObservers();
 }
 void applyStream(JSONObject stream){try{cryptoRecoveryPending=false;JSONArray updatedCookies=stream.optJSONArray("cookies");if(updatedCookies!=null)mediaCookies=updatedCookies;qualities.clear();JSONArray q=stream.optJSONArray("availableQualities");if(q!=null)for(int i=0;i<q.length();i++)qualities.add(q.optString(i));
    String nextUri=stream.getString("uri");
    int state=player.getPlaybackState();
    boolean activeMedia=player.getCurrentMediaItem()!=null&&player.getPlayerError()==null
            &&(state==Player.STATE_READY||state==Player.STATE_BUFFERING);
    boolean retain=LiveStreamUpdatePolicy.reuse(activeStreamUri,nextUri,activeStreamQuality,selected,activeMedia);
    if(retain){
     NicoliveDiagnostics.record("STREAM","reused-source;cookieCount="+mediaCookies.length()+" state="+state);
     // A live watch socket can resend stream credentials. Keep the existing
     // playlist/chunks/decoder alive; subsequent HTTP opens read mediaCookies.
     android.util.Log.i("nicoid-live","Stream credentials updated without player reset");
     terminal=false;notifyObservers();return;
    }
    android.util.Log.i("nicoid-live","Stream source updated, sameUri="+nextUri.equals(activeStreamUri)+", qualityChanged="+!selected.equals(activeStreamQuality)+", active="+activeMedia);
    NicoliveDiagnostics.record("STREAM","new-source;cookieCount="+mediaCookies.length()+" state="+state+" qualityChanged="+!selected.equals(activeStreamQuality));
    Uri uri=Uri.parse(nextUri);
    DataSource.Factory factory=new DataSource.Factory(){public DataSource createDataSource(){return new CookieSource();}};
    MediaItem item=new MediaItem.Builder().setUri(uri).setMimeType(MimeTypes.APPLICATION_M3U8).setLiveConfiguration(new MediaItem.LiveConfiguration.Builder().setMaxPlaybackSpeed(1.0f).setMinPlaybackSpeed(1.0f).build()).build();
    keyParser=new HlsKeyRefreshingPlaylistParser();player.setMediaSource(new HlsMediaSource.Factory(factory).setPlaylistParserFactory(keyParser).createMediaSource(item));player.prepare();player.setPlayWhenReady(!userPaused);
    activeStreamUri=nextUri;activeStreamQuality=selected;terminal=false;notifyObservers();
  }catch(Exception e){status="配信情報を読み取れませんでした";notifyObservers();}}
 final class CookieSource implements DataSource {
  final DefaultHttpDataSource delegate=new DefaultHttpDataSource.Factory()
     .setUserAgent("nicoid Re live / Media3")
     .setConnectTimeoutMs(15000).setReadTimeoutMs(20000).createDataSource();
  String resourceKind="unknown";long received;int matchingCookies;boolean opened;
  public long open(DataSpec spec)throws IOException{
   resourceKind=NicoliveDiagnostics.kind(spec.uri);received=0;opened=false;
   String host=spec.uri.getHost();JSONArray current=mediaCookies;
   StringBuilder cookies=new StringBuilder();matchingCookies=0;
   for(int i=0;i<current.length();i++){
    JSONObject c=current.optJSONObject(i);
    if(c==null||host==null)continue;
    String domain=c.optString("domain");
    if(domain.startsWith("."))domain=domain.substring(1);
    String path=spec.uri.getPath();
    if(!(host.equals(domain)||host.endsWith("."+domain))||path==null||!path.startsWith(c.optString("path","/")))continue;
    String name=c.optString("name"),value=c.optString("value");
    if(!name.matches("[A-Za-z0-9_-]+")||value.indexOf('\r')>=0||value.indexOf('\n')>=0)continue;
    if(cookies.length()>0)cookies.append("; ");
    cookies.append(name).append('=').append(value);matchingCookies++;
   }
   if(!"https".equals(spec.uri.getScheme()))throw new IOException("Insecure media URI");
   delegate.clearRequestProperty("Cookie");
   if(cookies.length()>0)delegate.setRequestProperty("Cookie",cookies.toString());
   delegate.setRequestProperty("Referer","https://live.nicovideo.jp/");
   delegate.setRequestProperty("Origin","https://live.nicovideo.jp");
   // No URL, cookie name/value, query, stream token or encryption key is recorded.
   NicoliveDiagnostics.record("HTTP_OPEN","type="+resourceKind+" cookies="+matchingCookies+" offset="+spec.position+" requested="+spec.length);
   try{
    long length=delegate.open(spec);opened=true;
    Map<String,List<String>> headers=delegate.getResponseHeaders();
    List<String> contentTypes=headers==null?null:headers.get("Content-Type");
    String contentType=contentTypes==null||contentTypes.isEmpty()?"unknown":contentTypes.get(0);
    String bucket=contentType!=null&&contentType.toLowerCase(Locale.ROOT).contains("text/html")?"html":
          contentType!=null&&contentType.toLowerCase(Locale.ROOT).contains("mpegurl")?"m3u8":
          contentType!=null&&contentType.toLowerCase(Locale.ROOT).contains("octet-stream")?"binary":"other";
    NicoliveDiagnostics.record("HTTP_READY","type="+resourceKind+" bytes="+length+" content="+bucket);
    return length;
   }catch(IOException failure){
    int code=failure instanceof HttpDataSource.InvalidResponseCodeException?
      ((HttpDataSource.InvalidResponseCodeException)failure).responseCode:-1;
    NicoliveDiagnostics.record("HTTP_FAIL","type="+resourceKind+" status="+code+" error="+failure.getClass().getSimpleName());
    throw failure;
   }
  }
  public int read(byte[] buffer,int offset,int length)throws IOException{
   try{
    int n=delegate.read(buffer,offset,length);
    if(n>0)received+=n;
    return n;
   }catch(IOException failure){
    NicoliveDiagnostics.record("HTTP_READ_FAIL","type="+resourceKind+" got="+received+" error="+failure.getClass().getSimpleName());
    throw failure;
   }
  }
  public Uri getUri(){return delegate.getUri();}
  public Map<String,List<String>> getResponseHeaders(){return delegate.getResponseHeaders();}
  public void close()throws IOException{
   try{delegate.close();}
   finally{
    if(opened)NicoliveDiagnostics.record("HTTP_DONE","type="+resourceKind+" received="+received);
    opened=false;
   }
  }
  public void addTransferListener(TransferListener listener){delegate.addTransferListener(listener);}
 }
 boolean playing(){return player!=null&&player.isPlaying();}
 boolean playRequested(){return player!=null&&player.getPlayWhenReady();}
 long playbackEpoch(){if(player==null||player.getCurrentTimeline().isEmpty())return 0;try{player.getCurrentTimeline().getWindow(player.getCurrentMediaItemIndex(),window);return window.windowStartTimeMs==C.TIME_UNSET?0:window.windowStartTimeMs+player.getCurrentPosition();}catch(Exception e){return 0;}}
 void pause(){if(player==null)return;userPaused=true;pausedAt=System.currentTimeMillis();player.pause();notifyObservers();}
 void resume(){if(player==null)return;userPaused=false;if(pausedAt>0){player.seekToDefaultPosition();scheduled.clear();if(frame!=null)frame.comments.clear();pausedAt=0;}player.play();notifyObservers();}
 void goLive(){if(player==null)return;userPaused=false;player.seekToDefaultPosition();player.play();scheduled.clear();if(frame!=null)frame.comments.clear();notifyObservers();}
 void reconnect(){if(!id.isEmpty()&&!stopped)startForegroundService(new Intent(this,NicoliveService.class).setAction("reconnect"));}
 boolean send(String text,boolean anonymous){return playing()&&session!=null&&session.post(text,playbackEpoch(),anonymous);}
 void selectQuality(String quality){if(!qualities.contains(quality)||session==null)return;if(session.quality(quality)){selected=quality;audioOnly=quality.startsWith("audio_");player.setTrackSelectionParameters(player.getTrackSelectionParameters().buildUpon().setTrackTypeDisabled(C.TRACK_TYPE_VIDEO,audioOnly).build());if(frame!=null)frame.comments.clear();notifyObservers();}}
 void toggleComments(){commentVisible=!commentVisible;if(frame==null)return;frame.comments.enabled=commentVisible;frame.comments.clear();if(commentVisible&&program!=null&&!audioOnly){long now=playbackEpoch();for(NicoliveData.Chat c:history){long at=program.vposBase*1000+c.vpos*10;if(at>=now-frame.comments.duration()&&at<=now+150)frame.comments.add(c,at);}}frame.updateControls();}
 void attach(NicolivePlayerFrame newFrame){if(stopped||player==null||frame==newFrame)return;if(frame!=null){player.clearVideoTextureView(frame.video);frame.comments.clear();frame.comments.service=null;frame.owner=null;}frame=newFrame;if(newFrame!=null){newFrame.owner=this;newFrame.comments.service=this;newFrame.comments.enabled=commentVisible;newFrame.aspect(aspect);player.setVideoTextureView(newFrame.video);newFrame.updateControls();}}
 void detach(NicolivePlayerFrame old){if(frame==old&&old!=null){if(player!=null)player.clearVideoTextureView(old.video);old.owner=null;old.comments.clear();old.comments.service=null;frame=null;}}
 void showPopup(){if(popup!=null||player==null||id.isEmpty())return;if(!android.provider.Settings.canDrawOverlays(this)){status="ポップアップ表示の権限を許可してください";notifyObservers();return;}
  Context c=UiTheme191.context(this);popup=new NicolivePlayerFrame(c,true);popupParams=new WindowManager.LayoutParams(Math.min(NicoliveUi.dp(c,300),getResources().getDisplayMetrics().widthPixels),NicoliveUi.dp(c,210),WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE,android.graphics.PixelFormat.TRANSLUCENT);popupParams.gravity=Gravity.TOP|Gravity.LEFT;popupParams.x=0;popupParams.y=NicoliveUi.dp(c,80);resizePopup(popupParams.width);
  try{manager.addView(popup,popupParams);attach(popup);}catch(RuntimeException e){closePopup();status="ポップアップを表示できませんでした";notifyObservers();}
 }
 void resizePopup(int width){if(popupParams==null)return;android.util.DisplayMetrics dm=getResources().getDisplayMetrics();int maxWidth=Math.min(dm.widthPixels,Math.round(dm.heightPixels*aspect));popupParams.width=Math.max(Math.min(NicoliveUi.dp(this,192),maxWidth),Math.min(width,maxWidth));popupParams.height=Math.min(dm.heightPixels,Math.max(NicoliveUi.dp(this,44),Math.round(popupParams.width/aspect)));popupParams.x=Math.max(0,Math.min(popupParams.x,dm.widthPixels-popupParams.width));popupParams.y=Math.max(0,Math.min(popupParams.y,dm.heightPixels-popupParams.height));if(popup!=null&&popup.isAttachedToWindow())try{manager.updateViewLayout(popup,popupParams);}catch(Exception ignored){}}
 void scalePopup(float factor,float focusX,float focusY){if(popupParams==null||factor<=0||Float.isNaN(factor)||Float.isInfinite(factor))return;int oldWidth=popupParams.width,oldHeight=popupParams.height;android.util.DisplayMetrics dm=getResources().getDisplayMetrics();int maxWidth=Math.min(dm.widthPixels,Math.round(dm.heightPixels*aspect));int width=Math.max(Math.min(NicoliveUi.dp(this,192),maxWidth),Math.min(Math.round(oldWidth*factor),maxWidth));int height=Math.round(width/aspect);if(oldWidth>0&&oldHeight>0){popupParams.x+=Math.round(focusX*(1-width/(float)oldWidth));popupParams.y+=Math.round(focusY*(1-height/(float)oldHeight));}resizePopup(width);}
 void movePopup(int x,int y){if(popupParams==null)return;popupParams.x=x;popupParams.y=y;resizePopup(popupParams.width);}
 void closePopup(){if(popup==null)return;NicolivePlayerFrame old=popup;popup=null;detach(old);try{manager.removeView(old);}catch(Exception ignored){}popupParams=null;}
 void returnToFrame(NicolivePlayerFrame next){NicolivePlayerFrame old=popup;attach(next);if(old!=null){popup=null;try{manager.removeView(old);}catch(IllegalArgumentException ignored){}popupParams=null;}}
 void returnToActivity(){Intent intent=new Intent(this,NicoliveActivity.class).putExtra("program",id).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK|Intent.FLAG_ACTIVITY_CLEAR_TOP|Intent.FLAG_ACTIVITY_SINGLE_TOP);startActivity(intent);}
 void stopPlayback(){if(stopped)return;stopped=true;clearArtwork();artworkWork.shutdownNow();++serial;closePopup();if(frame!=null)detach(frame);if(session!=null){session.close();session=null;}main.removeCallbacksAndMessages(null);if(player!=null){player.release();player=null;}stopForeground(true);stopSelf();for(Observer o:new ArrayList<Observer>(observers))o.changed();}
 void foreground(){
  if(!stopped)startForeground(2000,notification());
 }
 void clearArtwork(){
  ++artworkToken;mediaArtwork=null;artworkProgramId="";
  if(artworkTask!=null){artworkTask.cancel(true);artworkTask=null;}
 }
 void requestArtwork(NicoliveData.Program p){
  clearArtwork();
  if(p==null||p.thumbnail==null||!NicoliveArtwork.isTrusted(p.thumbnail))return;
  final int token=artworkToken;
  final String programId=p.id,url=p.thumbnail;
  artworkProgramId=programId;
  artworkTask=artworkWork.submit(()->{
   final Bitmap bitmap=NicoliveArtwork.fetch(url);
   main.post(()->{
    if(stopped||token!=artworkToken||program==null||!programId.equals(program.id))return;
    mediaArtwork=bitmap;
    if(bitmap!=null)updateNotification();
   });
  });
 }
 PendingIntent action(String action,int code){
  return PendingIntent.getService(this,code,new Intent(this,NicoliveService.class).setAction(action),
          PendingIntent.FLAG_UPDATE_CURRENT|PendingIntent.FLAG_IMMUTABLE);
 }
 Notification notification(){
  Intent open=new Intent(this,NicoliveActivity.class).putExtra("program",id)
          .addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP|Intent.FLAG_ACTIVITY_SINGLE_TOP);
  PendingIntent content=PendingIntent.getActivity(this,2000,open,
          PendingIntent.FLAG_UPDATE_CURRENT|PendingIntent.FLAG_IMMUTABLE);
  String title=program==null||TextUtils.isEmpty(program.title)?"nicoid Re / 生放送":program.title;
  String subtitle=program==null||TextUtils.isEmpty(program.owner)?status:program.owner;
  boolean requested=playRequested();
  boolean error=player!=null&&player.getPlayerError()!=null&&!cryptoRecoveryPending;
  boolean loading=player==null||player.getPlaybackState()==Player.STATE_IDLE||player.getPlaybackState()==Player.STATE_BUFFERING||cryptoRecoveryPending;
  int icon=getApplicationInfo().icon!=0?getApplicationInfo().icon:android.R.drawable.ic_media_play;
  Notification.Builder builder=new Notification.Builder(this,"nicoid_live")
          .setSmallIcon(icon).setContentTitle(title).setContentText(subtitle)
          .setContentIntent(content).setOngoing(true).setOnlyAlertOnce(true)
          .setCategory(Notification.CATEGORY_TRANSPORT).setVisibility(Notification.VISIBILITY_PUBLIC)
          .addAction(error?android.R.drawable.ic_popup_sync:requested?android.R.drawable.ic_media_pause:android.R.drawable.ic_media_play,
                  error?"再接続":requested?"一時停止":"再生",action(error?"reconnect":"toggle",2001))
          .addAction(android.R.drawable.ic_menu_close_clear_cancel,"終了",action("stop",2002));
  if(mediaArtwork!=null)builder.setLargeIcon(mediaArtwork);
  if(mediaSession!=null){
   mediaSession.setSessionActivity(content);
   MediaMetadata.Builder metadata=new MediaMetadata.Builder().putString(MediaMetadata.METADATA_KEY_TITLE,title)
           .putString(MediaMetadata.METADATA_KEY_DISPLAY_TITLE,title)
           .putString(MediaMetadata.METADATA_KEY_ARTIST,subtitle)
           .putString(MediaMetadata.METADATA_KEY_DISPLAY_SUBTITLE,subtitle);
   if(mediaArtwork!=null){
    metadata.putBitmap(MediaMetadata.METADATA_KEY_ART,mediaArtwork);
    metadata.putBitmap(MediaMetadata.METADATA_KEY_ALBUM_ART,mediaArtwork);
    metadata.putBitmap(MediaMetadata.METADATA_KEY_DISPLAY_ICON,mediaArtwork);
   }
   mediaSession.setMetadata(metadata.build());
   int state=error?PlaybackState.STATE_ERROR:playing()?PlaybackState.STATE_PLAYING:
             requested&&loading?PlaybackState.STATE_BUFFERING:PlaybackState.STATE_PAUSED;
   mediaSession.setPlaybackState(new PlaybackState.Builder()
           .setActions(PlaybackState.ACTION_PLAY|PlaybackState.ACTION_PAUSE|PlaybackState.ACTION_PLAY_PAUSE|PlaybackState.ACTION_STOP)
           // Live HLS has no user-seekable duration; deliberately do not expose SEEK_TO.
           .setState(state,PlaybackState.PLAYBACK_POSITION_UNKNOWN,playing()?1f:0f).build());
   builder.setStyle(new Notification.MediaStyle().setMediaSession(mediaSession.getSessionToken())
           .setShowActionsInCompactView(0,1));
  }
  return builder.build();
 }
 void updateNotification(){
  if(stopped||terminal)return;
  ((NotificationManager)getSystemService(NOTIFICATION_SERVICE)).notify(2000,notification());
 }
 void saveHistory(NicoliveData.Program p){try{SharedPreferences prefs=PreferenceManager.getDefaultSharedPreferences(this);JSONArray all=new JSONArray(prefs.getString("nicolive_history","[]")),next=new JSONArray();next.put(p.stored());for(int i=0;i<all.length()&&next.length()<100;i++){JSONObject o=all.optJSONObject(i);if(o!=null&&!p.id.equals(o.optString("nicoliveProgramId")))next.put(o);}prefs.edit().putString("nicolive_history",next.toString()).apply();}catch(Exception ignored){}}
 @Override public void onDestroy(){stopPlayback();if(mediaSession!=null){mediaSession.release();mediaSession=null;}if(active==this)active=null;observers.clear();super.onDestroy();}
}
