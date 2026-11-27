package dev.jason.gboardpatches.extension.sharedmodel;

import android.content.*;
import android.os.*;
import app.johninnl.modelhost.api.*;
import org.json.JSONObject;
import java.util.Arrays;
import java.util.List;
import java.util.function.BooleanSupplier;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;

/** Public host speech only. No local model load, downloader or cloud fallback. */
public final class SharedSpeechController {
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final ScheduledExecutorService POLL=Executors.newSingleThreadScheduledExecutor(r->new Thread(r,"gboard-shared-speech"));
    private static volatile ModelHostClient client;
    private static volatile boolean connected;
    private static volatile JSONObject status;
    private static volatile String error="PROVIDER_MISSING";
    private static volatile boolean polling;
    private SharedSpeechController(){}
    public static synchronized void connect(Context context){
        if(client!=null)return;Context app=context.getApplicationContext();
        try{SharedProviderIdentity.verify(app);}catch(Exception failure){error="PROVIDER_UNAVAILABLE";return;}
        ModelHostClient connecting=new ModelHostClient(new ComponentName(ModelHostClient.DEFAULT_PACKAGE,ModelHostClient.SERVICE_CLASS),Runnable::run);client=connecting;
        MAIN.post(()->{if(client!=connecting)return;connecting.connect(app,new ConnectionListener(){
            @Override public void onConnected(HostStatus value,HostCapabilities capabilities){if(client!=connecting)return;connected=true;accept(value);}
            @Override public void onDisconnected(HostException failure){if(client!=connecting)return;connected=false;status=null;error=failure.code;client=null;connecting.close();}
        });});
        if(!polling){polling=true;POLL.scheduleWithFixedDelay(()->{ModelHostClient current=client;if(current==null||!connected)return;try{accept(current.status());}catch(Exception failure){status=null;error="PROVIDER_UNAVAILABLE";}},1,2,TimeUnit.SECONDS);}
    }
    private static void accept(HostStatus value){try{JSONObject json=new JSONObject(value.toJson());status=json.optJSONObject("speech");error=status==null?"HOST_UPDATE_REQUIRED":status.optString("state","SPEECH_UNAVAILABLE");}catch(Exception failure){status=null;error="PROTOCOL_ERROR";}}
    public static boolean ready(Context context){connect(context);return connected&&readyStatus(status);}
    static boolean readyStatus(JSONObject speech){return speech!=null&&speech.optBoolean("enabled")&&speech.optBoolean("engineLoaded")&&!speech.optBoolean("reconfiguring")&&("READY".equals(speech.optString("state"))||"BUSY".equals(speech.optString("state")));}
    public static String summary(Context context){connect(context);if(SharedProviderSetup.busy())return SharedProviderSetup.message();JSONObject speech=status;if(speech==null)return "Shared speech: "+error+". Open Local AI to set it up.";return speech.optString("modelLabel","Shared speech")+" · "+speech.optString("state")+(speech.optBoolean("enabled")?"":" · off");}
    public static void openSettings(Context context){if(!ProviderDiscovery.inspect(context).installed || SharedProviderSetup.needsBundledUpdate(context) || SharedProviderSetup.pending()!=null){SharedProviderSetup.download(context);return;}try{context.startActivity(new Intent().setClassName(ModelHostClient.DEFAULT_PACKAGE,"app.johninnl.modelhost.setup.HostSettingsActivity").putExtra("section","speech").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));}catch(ActivityNotFoundException failure){android.widget.Toast.makeText(context,"Install or update Local Model Host first.",android.widget.Toast.LENGTH_LONG).show();}}
    /** Reflection entry used by the standalone Gboard extension. Call on its microphone worker. */
    public static Object open(Context context) throws Exception {
        return open(context, () -> false);
    }
    public static Object open(Context context, BooleanSupplier allowContactNames) throws Exception {
        connect(context);long deadline=SystemClock.elapsedRealtime()+8000;
        while(!connected&&SystemClock.elapsedRealtime()<deadline){Thread.sleep(25);}
        if(!connected||status==null||!status.optBoolean("enabled"))throw new HostException("SHARED_SPEECH_NOT_READY");
        ModelHostClient connection = client;
        if (connection == null) throw new HostException("SHARED_SPEECH_NOT_READY");
        SpeechSession vad=connection.openSpeechSession("auto");
        try{deadline=SystemClock.elapsedRealtime()+30000;while(!ready(context)&&SystemClock.elapsedRealtime()<deadline){
            accept(connection.status());if(status==null||!status.optBoolean("enabled"))throw new HostException("SPEECH_DISABLED");String state=error;if("MEMORY_PAUSED".equals(state)||"FAILED".equals(state)||"MODEL_MISSING".equals(state))throw new HostException("SHARED_SPEECH_"+state);Thread.sleep(100);
        }if(!ready(context))throw new HostException("SHARED_SPEECH_NOT_READY");return new CaptureSession(() -> openDecoder(connection, context, allowContactNames), vad);}catch(Exception failure){vad.close();throw failure;}
    }
    private static SpeechSession openDecoder(ModelHostClient connection, Context context,
            BooleanSupplier allowContactNames) throws HostException {
        if (allowContactNames.getAsBoolean() && SharedSpeechContactNames.canRead(context)
                && supportsContactHints(connection)) {
            List<String> names = SharedSpeechContactNames.read(context);
            if (Thread.currentThread().isInterrupted()) throw new HostException("SPEECH_SESSION_CLOSED");
            if (!names.isEmpty() && allowContactNames.getAsBoolean() && SharedSpeechContactNames.canRead(context)) {
                try {
                    return connection.openSpeechSession("auto", names);
                } catch (HostException error) {
                    if (!"CONTEXT_BIAS_UNSUPPORTED".equals(error.code) && !"INVALID_REQUEST".equals(error.code)) throw error;
                }
            }
        }
        return connection.openSpeechSession("auto");
    }

    private static boolean supportsContactHints(ModelHostClient connection) {
        try { return connection.supportsSpeechContactHints(); }
        catch (HostException unavailable) { return false; }
    }

    public static final class CaptureSession implements AutoCloseable {
        interface DecoderOpener { SpeechSession open() throws HostException; }
        private final DecoderOpener openDecoder;
        private final SpeechSession vad;
        private final Object lifecycle=new Object();
        private SpeechSession decoder;
        private volatile boolean closed;
        private int sent;
        private boolean lastFeedEnded;
        CaptureSession(DecoderOpener openDecoder,SpeechSession vad){this.openDecoder=openDecoder;this.vad=vad;}
        public float probability(float[] window)throws HostException{requireOpen();return vad.voiceProbability(window);}
        public void reset(){
            SpeechSession current;
            synchronized(lifecycle){current=decoder;decoder=null;}
            if(current!=null)current.close();
            sent=0;
            lastFeedEnded=false;
        }
        public void releaseVad(){vad.close();}
        /** Decoder worker only: delta feeds preserve Nemotron caches and the other backend's stream merger. */
        public String transcribe(float[] all,int count,boolean end)throws Exception {
            requireOpen();
            if(count<sent)throw new IllegalArgumentException("Audio went backwards");
            SpeechSession current=decoder();
            String text="";
            while(sent<count){int next=Math.min(count,sent+16000);boolean finish=end&&next==count;text=feed(current,Arrays.copyOfRange(all,sent,next),finish);sent=next;}
            // An utterance may end with no new samples after its last partial.
            if(end && !lastFeedEnded)text=feed(current,new float[0],true);
            if(end)reset();
            return text;
        }
        private SpeechSession decoder()throws HostException {
            synchronized(lifecycle){
                requireOpen();
                if(decoder!=null)return decoder;
            }
            SpeechSession candidate=openDecoder.open();
            synchronized(lifecycle){
                if(!closed){decoder=candidate;return candidate;}
            }
            candidate.close();
            throw new HostException("SPEECH_SESSION_CLOSED");
        }
        private void requireOpen()throws HostException {
            if(closed)throw new HostException("SPEECH_SESSION_CLOSED");
        }
        private String feed(SpeechSession current,float[] samples,boolean end)throws Exception {
            requireOpen();
            CountDownLatch done=new CountDownLatch(1);AtomicReference<String> result=new AtomicReference<>();AtomicReference<String> failure=new AtomicReference<>();
            RequestHandle handle=current.feed(samples,end,json->{try{JSONObject value=new JSONObject(json);if(!value.optBoolean("terminal"))return;if("ok".equals(value.optString("status")))result.set(value.optString("text",""));else failure.set(value.optString("code","SPEECH_FAILED"));}catch(Exception error){failure.set("PROTOCOL_ERROR");}done.countDown();});
            try{if(!done.await(30,TimeUnit.SECONDS)){handle.cancel();throw new HostException("SPEECH_TIMEOUT");}}catch(InterruptedException error){handle.cancel();Thread.currentThread().interrupt();throw error;}
            requireOpen();if(failure.get()!=null)throw new HostException(failure.get());lastFeedEnded=end;return result.get()==null?"":result.get();
        }
        @Override public void close(){
            SpeechSession current;
            synchronized(lifecycle){
                if(closed)return;
                closed=true;
                current=decoder;
                decoder=null;
            }
            try{vad.close();}finally{if(current!=null)current.close();}
        }
    }
}
