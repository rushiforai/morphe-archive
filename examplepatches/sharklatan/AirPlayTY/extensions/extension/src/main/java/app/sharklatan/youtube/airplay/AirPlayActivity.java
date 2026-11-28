package app.sharklatan.youtube.airplay;

import android.app.*;
import android.content.Context;
import android.content.res.ColorStateList;
import android.os.*;
import android.util.TypedValue;
import android.view.*;
import android.widget.*;
import java.io.InputStream;
import java.net.Socket;

/** Sender hosted by YouTube's existing bottom-sheet class and Cast XML resources.
 * The historical class name is retained for saved pairing preferences only. */
public final class AirPlayActivity extends app.sharklatan.airplayprobe.SenderController {
    private static AirPlayActivity instance;
    private YouTubeRelay relay;
    private boolean audioOnly;
    private String lastVideo="";
    private View disconnectAction;
    private View pickerContent;
    private boolean loadingRemote,resumeAfterLoad,connecting;
    private double frozenPosition;
    private final PlaybackSession playback=new PlaybackSession();
    private boolean directSeekRejected,attemptingDirect,localTransportCommand;
    private long localAlignedSeek=-1,expectedEpoch;
    private final Runnable verifySeek=()->{
        if(!playback.seeking()||!attemptingDirect||!NativeRemote.active)return;
        attemptingDirect=false;directSeekRejected=true;
        log("La TV no confirmó la búsqueda directa; se usa la reapertura funcional.");
        expectedEpoch=remoteEpoch()+1;remoteSeek(playback.target()/1000.0);
    };
    private final Handler main=new Handler(Looper.getMainLooper());

    private AirPlayActivity(Activity host)throws Exception {
        super(host);
        TypedValue theme=new TypedValue();
        int style=host.getTheme().resolveAttribute(0x7f040119,theme,true)&&theme.resourceId!=0?theme.resourceId:0x7f15090f;
        sheet=(Dialog)host.getClassLoader().loadClass("avjw").getConstructor(Context.class,int.class).newInstance(host,style);
        onCreate(null);
    }
    public static void show(Activity host){
        try{
            if(instance==null||instance.host.isDestroyed())instance=new AirPlayActivity(host);
            instance.prewarm();
            instance.updateConnectionActions();
            instance.sheet.show();
            instance.applyPalette();
            instance.applyPickerGeometry();
        }catch(Exception e){android.util.Log.e("YouTubeAirPlay","Native Cast picker",e);Toast.makeText(host,"No se pudo abrir el selector AirPlay.",Toast.LENGTH_SHORT).show();}
    }
    private View inflate(String name,ViewGroup parent){
        int id=getResources().getIdentifier(name,"layout",getPackageName());
        if(id==0)throw new IllegalStateException("Missing native Cast layout: "+name);
        return LayoutInflater.from(sheet.getContext()).inflate(id,parent,false);
    }
    protected void createUi(){
        LinearLayout root=(LinearLayout)inflate("mdx_device_picker_main",null);
        root.setLayoutParams(new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.WRAP_CONTENT));
        // The Cast sheet's own dimensions: inset content and breathing room below its last action.
        int inset=getResources().getDimensionPixelSize(0x7f070199); // bottom_sheet_margins
        int top=getResources().getDimensionPixelSize(0x7f0701a0); // bottom_sheet_top_margin
        int bottom=getResources().getDimensionPixelSize(0x7f07019b); // bottom_sheet_padding_bottom
        root.setPadding(inset,top,inset,bottom);
        ImageView handle=new ImageView(sheet.getContext());
        handle.setImageResource(0x7f080bf4); // sheet_handle: native 40dp handle and themed colour
        handle.setTag("sharklatan.airplay.sheet.handle");
        handle.setContentDescription(getString(0x7f140218));
        LinearLayout.LayoutParams handleParams=new LinearLayout.LayoutParams(-2,-2);
        handleParams.gravity=Gravity.CENTER_HORIZONTAL;
        root.addView(handle,0,handleParams);
        ViewGroup scroll=(ViewGroup)root.getChildAt(1);
        View recycler=scroll.getChildAt(0);ViewGroup.LayoutParams params=recycler.getLayoutParams();scroll.removeView(recycler);
        LinearLayout cells=new LinearLayout(sheet.getContext());cells.setOrientation(LinearLayout.VERTICAL);scroll.addView(cells,params);
        View header=inflate("mdx_device_picker_section_header",cells);
        status=(TextView)header.findViewById(0x7f0b0622);status.setText(getString(0x7f140d26));
        header.findViewById(0x7f0b061f).setVisibility(View.GONE); // no divider above first section
        header.findViewById(0x7f0b0621).setVisibility(View.GONE); // loading indicator explicitly out of scope
        cells.addView(header);
        deviceList=new LinearLayout(sheet.getContext());deviceList.setOrientation(LinearLayout.VERTICAL);cells.addView(deviceList);
        disconnectAction=addAction(cells,"Desconectar",()->runTask("Desconectando…",()->{
            closeAuth();main.post(()->{updateConnectionActions();closePicker();});
        }));
        updateConnectionActions();
        // Networking uses these fields internally; they are never presented as a form.
        hostInput=new EditText(sheet.getContext());portInput=new EditText(sheet.getContext());
        hostInput.setText(getPreferences(MODE_PRIVATE).getString("last-host",""));portInput.setText(getPreferences(MODE_PRIVATE).getString("last-port","7000"));
        events=new TextView(sheet.getContext());pickerContent=root;sheet.setContentView(root);sheet.setCanceledOnTouchOutside(true);applyPalette();
    }
    private int activeColor(String method){
        try{return ((Number)getClassLoader().loadClass("app.morphe.extension.shared.theme.ThemeUtils").getMethod(method).invoke(null)).intValue();}
        catch(Exception e){throw new IllegalStateException("Cannot read YouTube's active palette",e);}
    }
    private void applyPickerGeometry(){
        int id=getResources().getIdentifier("design_bottom_sheet","id",getPackageName());
        View surface=sheet.findViewById(id);if(surface==null)return;
        int maxWidth=getResources().getDimensionPixelSize(0x7f070181); // bottom_sheet_default_max_width
        int inset=getResources().getDimensionPixelSize(0x7f070199);
        int available=sheet.getWindow().getDecorView().getWidth();
        if(available<=0)available=host.getWindow().getDecorView().getWidth();
        if(available<=0)available=getResources().getDisplayMetrics().widthPixels;
        int width=Math.min(maxWidth,Math.max(1,available-2*inset));
        ViewGroup.LayoutParams params=surface.getLayoutParams();
        // Preserve the native CoordinatorLayout gravity and BottomSheetBehavior.
        if(params.width!=width){params.width=width;surface.setLayoutParams(params);}
    }
    private void applyPalette(){
        int background=activeColor("getAppBackgroundColor"),foreground=activeColor("getAppForegroundColor");
        int id=getResources().getIdentifier("design_bottom_sheet","id",getPackageName());
        View surface=sheet.findViewById(id);
        if(surface!=null&&surface.getBackground()!=null)surface.getBackground().mutate().setTint(background);
        if(pickerContent!=null)applyForeground(pickerContent,foreground);
    }
    private void applyForeground(View view,int color){
        if(view.getBackground()!=null)view.setBackgroundTintList(ColorStateList.valueOf(activeColor("getAppBackgroundColor")));
        if(view instanceof TextView)((TextView)view).setTextColor(color);
        if(view instanceof ImageView&&!"sharklatan.airplay.sheet.handle".equals(view.getTag()))((ImageView)view).setImageTintList(ColorStateList.valueOf(color));
        if(view instanceof ViewGroup){ViewGroup parent=(ViewGroup)view;for(int i=0;i<parent.getChildCount();i++)applyForeground(parent.getChildAt(i),color);}
    }
    private View addAction(LinearLayout parent,String label,Runnable action){
        View row=inflate("mdx_device_picker_stop_casting_button",parent);
        TextView text=(TextView)row.findViewById(0x7f0b14e4);text.setVisibility(View.VISIBLE);text.setText(label);text.setOnClickListener(v->action.run());
        parent.addView(row,new LinearLayout.LayoutParams(-1,-2));
        return row;
    }
    private void updateConnectionActions(){if(disconnectAction!=null)disconnectAction.setVisibility(remoteConnected()?View.VISIBLE:View.GONE);}
    protected void button(LinearLayout parent,String label,Runnable action){
        View row=inflate("mdx_device_picker_route",parent);
        TextView name=(TextView)row.findViewById(0x7f0b061d);name.setText(label.split(" · ")[0]);
        row.findViewById(0x7f0b061b).setVisibility(View.GONE);
        ImageView icon=(ImageView)row.findViewById(0x7f0b061c);
        try(InputStream in=getAssets().open("sharklatan/airplay.png")){icon.setImageDrawable(android.graphics.drawable.Drawable.createFromStream(in,"AirPlay"));}catch(Exception e){throw new IllegalStateException(e);}
        row.setOnClickListener(v->action.run());
        row.setOnLongClickListener(v->{
            PopupMenu menu=new PopupMenu(sheet.getContext(),row);
            menu.getMenu().add("Vídeo y audio").setCheckable(true).setChecked(!audioOnly).setOnMenuItemClickListener(item->{audioOnly=false;if(relay!=null)relay.audioOnly=false;return true;});
            menu.getMenu().add("Solo audio").setCheckable(true).setChecked(audioOnly).setOnMenuItemClickListener(item->{audioOnly=true;if(relay!=null)relay.audioOnly=true;return true;});menu.show();return true;
        });
        parent.addView(row);
        applyForeground(row,activeColor("getAppForegroundColor"));
    }
    protected void log(String message){
        super.log(message);
        if(loadingRemote&&message.contains("notification · playbackLikelyToKeepUp"))main.post(()->{if(loadingRemote)onRemotePlaying();});
    }
    protected boolean compactUi(){return true;}
    protected void closePicker(){sheet.dismiss();}
    private String currentVideo(){try{return (String)getClassLoader().loadClass("app.morphe.extension.youtube.patches.VideoInformation").getMethod("getVideoId").invoke(null);}catch(Exception e){return "";}}
    protected double mediaPositionSeconds(){if(loadingRemote)return frozenPosition;try{return Math.max(0,((Number)getClassLoader().loadClass("app.morphe.extension.youtube.patches.VideoInformation").getMethod("getVideoTime").invoke(null)).longValue()/1000.0);}catch(Exception e){return 0;}}
    protected void onRemotePlaying(){
        LocalAudio.mute(true);NativeRemote.owner=this;NativeRemote.active=true;NativeRemote.audioOnly=audioOnly;
        updateConnectionActions();if(lastVideo.isEmpty())lastVideo=currentVideo();RemoteScreen.show(host,lastVideo);sheet.dismiss();LocalAudio.remoteVolume(true);remoteVolume(Double.NaN,LocalAudio.volumeRevision());remoteInfo();
        // Receiver readiness/position is confirmed by onRemoteProgress before resuming the local clock.

    }
    protected void onRemotePaused(){if(loadingRemote)onRemotePlaying();}
    protected void onRemoteProgress(long epoch,double position,double duration,double rate,boolean ready,boolean waiting){
        if(epoch<expectedEpoch)return;
        boolean completed=playback.report(Math.round(position*1000),rate>0,ready,waiting,SystemClock.elapsedRealtime());
        if(completed){attemptingDirect=false;main.removeCallbacks(verifySeek);log("Búsqueda confirmada por posición de TV: "+position+" s.");}
        if(ready&&!waiting&&!playback.seeking()&&loadingRemote){
            long actual=playback.position(SystemClock.elapsedRealtime());
            if(actual>=0&&localAlignedSeek!=playback.seekRevision()){
                localAlignedSeek=playback.seekRevision();synchronizeLocalPosition(actual);
            }
            loadingRemote=false;
            boolean playing=playback.desiredPlaying();
            localTransportCommand=true;
            try{mediaKey(playing?KeyEvent.KEYCODE_MEDIA_PLAY:KeyEvent.KEYCODE_MEDIA_PAUSE);}finally{localTransportCommand=false;}
            remoteRate(playing);
        }
        LocalAudio.publishRemoteState();
    }
    private void synchronizeLocalPosition(long milliseconds){
        NativeRemote.suppressSeek=true;
        try{getClassLoader().loadClass("app.morphe.extension.youtube.patches.VideoInformation").getMethod("seekTo",long.class).invoke(null,milliseconds);}
        catch(Exception e){log("No se pudo alinear la barra local: "+e.getClass().getSimpleName());}
        finally{NativeRemote.suppressSeek=false;}
    }
    android.media.session.PlaybackState projectedState(android.media.session.PlaybackState local){
        if(!NativeRemote.active||!playback.hasConfirmedPosition())return local;
        long now=SystemClock.elapsedRealtime();
        int state=playback.seeking()||loadingRemote?android.media.session.PlaybackState.STATE_BUFFERING:
            playback.effectivePlaying()?android.media.session.PlaybackState.STATE_PLAYING:android.media.session.PlaybackState.STATE_PAUSED;
        return new android.media.session.PlaybackState.Builder(local).setState(state,playback.position(now),playback.effectivePlaying()?1f:0f,now).build();
    }
    protected void onRemoteVolume(long revision,double ratio){LocalAudio.reportVolume(revision,ratio);}
    public void nativeVolume(double ratio){remoteVolume(ratio,LocalAudio.volumeRevision());}
    protected void onDisconnected(){
        if(connecting)return;
        boolean resume=NativeRemote.active&&playback.desiredPlaying();
        long position=playback.position(android.os.SystemClock.elapsedRealtime());
        playback.disconnect(true);attemptingDirect=false;loadingRemote=false;
        main.removeCallbacksAndMessages(null);
        main.post(()->{
            LocalAudio.remoteVolume(false);RemoteScreen.hide(host);NativeRemote.clear();
            if(position>=0)synchronizeLocalPosition(position);
            updateConnectionActions();
            if(resume)mediaKey(KeyEvent.KEYCODE_MEDIA_PLAY);
        });
    }
    private void mediaKey(int key){
        android.media.AudioManager audio=(android.media.AudioManager)getSystemService(Context.AUDIO_SERVICE);
        long now=SystemClock.uptimeMillis();
        audio.dispatchMediaKeyEvent(new KeyEvent(now,now,KeyEvent.ACTION_DOWN,key,0));
        audio.dispatchMediaKeyEvent(new KeyEvent(now,now,KeyEvent.ACTION_UP,key,0));
    }
    protected void connectAndPlay(boolean send)throws Exception{
        if(send&&!loadingRemote&&(!NativeRemote.active||!remoteConnected())){frozenPosition=mediaPositionSeconds();resumeAfterLoad=NativeRemote.playing();playback.connect(Math.round(frozenPosition*1000),resumeAfterLoad);loadingRemote=true;
            main.post(()->mediaKey(KeyEvent.KEYCODE_MEDIA_PAUSE));LocalAudio.mute(true);
        }
        try{connecting=true;super.connectAndPlay(send);}catch(Exception e){loadingRemote=false;LocalAudio.mute(false);if(resumeAfterLoad)main.post(()->mediaKey(KeyEvent.KEYCODE_MEDIA_PLAY));throw e;}finally{connecting=false;}
    }
    public void nativeRate(boolean playing){
        if(localTransportCommand||loadingRemote)return;
        playback.requestPlaying(playing);remoteRate(playing);
    }
    protected boolean nativePlaybackRunning(){return NativeRemote.active||loadingRemote?playback.desiredPlaying():NativeRemote.playing();}
    public void nativeSeek(long milliseconds){
        frozenPosition=Math.max(0,milliseconds/1000.0);resumeAfterLoad=NativeRemote.playing();playback.requestPlaying(resumeAfterLoad);playback.seek(milliseconds);loadingRemote=true;
        mediaKey(KeyEvent.KEYCODE_MEDIA_PAUSE);
        main.removeCallbacks(verifySeek);
        if(directSeekRejected){expectedEpoch=remoteEpoch()+1;remoteSeek(frozenPosition);}
        else{expectedEpoch=remoteEpoch();attemptingDirect=true;tryRemoteSeek(frozenPosition);main.postDelayed(this::remoteInfo,350);main.postDelayed(this::remoteInfo,1000);main.postDelayed(verifySeek,2200);}

    }
    public void nativeVideo(String id){
        if(id==null||id.isEmpty()||id.equals(lastVideo))return;
        main.post(new Runnable(){int attempts;public void run(){
            if(!NativeRemote.active||isDestroyed()||!id.equals(currentVideo())||id.equals(lastVideo))return;
            if(YouTubeRelay.ready(getClassLoader(),id)){lastVideo=id;RemoteScreen.show(host,id);
                frozenPosition=Math.max(0,mediaPositionSeconds());resumeAfterLoad=NativeRemote.playing();
                playback.connect(Math.round(frozenPosition*1000),resumeAfterLoad);playback.seek(Math.round(frozenPosition*1000));loadingRemote=true;
                attemptingDirect=false;main.removeCallbacks(verifySeek);expectedEpoch=remoteEpoch()+1;
                mediaKey(KeyEvent.KEYCODE_MEDIA_PAUSE);remoteSeek(frozenPosition);}else if(++attempts<40)main.postDelayed(this,250);
        }});
    }
    private void prewarm(){worker.execute(()->{try{prepareMedia();}catch(Exception e){log("Preparación anticipada no disponible: "+e.getMessage());}});}
    protected void prepareMedia()throws Exception{
        String id=currentVideo();
        if(relay!=null&&id.equals(relay.videoId)){relay.audioOnly=audioOnly;return;}
        YouTubeRelay prepared=new YouTubeRelay(getClassLoader(),this::log);prepared.audioOnly=audioOnly;prepared.prepare();relay=prepared;
    }
    protected String mediaUrl(String address){return relay.url(address,mediaServer.getLocalPort());}
    protected void serveVideo(Socket socket){relay.serve(socket);}
}
