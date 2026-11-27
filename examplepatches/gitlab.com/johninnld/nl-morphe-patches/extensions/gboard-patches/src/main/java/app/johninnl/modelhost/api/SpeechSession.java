package app.johninnl.modelhost.api;

import android.content.Context;
import android.os.ParcelFileDescriptor;
import org.json.JSONObject;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;

/** One caller-private speech stream. PCM files belong to this SDK and are removed after handoff. */
public final class SpeechSession implements AutoCloseable {
    private final ISpeechSession remote;
    private final ExecutorService worker;
    private final java.util.concurrent.Executor controls,callbacks;
    private final File cache;
    private final java.util.function.Consumer<SpeechSession> onClose;
    private final ConcurrentMap<String,RequestHandle> pending=new ConcurrentHashMap<>();
    private final AtomicBoolean closed=new AtomicBoolean();
    private final AtomicInteger sequence=new AtomicInteger();
    SpeechSession(ISpeechSession remote,ExecutorService worker,java.util.concurrent.Executor controls,java.util.concurrent.Executor callbacks,Context context,java.util.function.Consumer<SpeechSession> onClose){this(remote,worker,controls,callbacks,context.getCacheDir(),onClose);}
    SpeechSession(ISpeechSession remote,ExecutorService worker,java.util.concurrent.Executor controls,java.util.concurrent.Executor callbacks,File cache,java.util.function.Consumer<SpeechSession> onClose){this.remote=remote;this.worker=worker;this.controls=controls;this.callbacks=callbacks;this.onClose=onClose;this.cache=cache;}
    /** Feed <=1 second of 16 kHz mono PCM. Empty audio is allowed only to finish a stream. Cancelling a pending chunk ends this stream. */
    public synchronized RequestHandle feed(float[] samples,boolean end,ResultListener listener){
        if(closed.get())throw new IllegalStateException("Speech session closed");
        if(listener==null)throw new IllegalArgumentException("Missing listener");
        if(samples==null || samples.length>16000 || (samples.length==0&&!end))throw new IllegalArgumentException("Invalid audio length");
        if(pending.size()>=16)throw new IllegalStateException("Speech queue full");
        final float[] audio=samples.clone();for(float value:audio)if(Float.isNaN(value)||Float.isInfinite(value)||value < -1f||value>1f)throw new IllegalArgumentException("Invalid audio sample");
        RequestHandle handle=new RequestHandle(id->{},this::close);pending.put(handle.clientRequestId,handle);
        final int seq=sequence.getAndIncrement();
        try{worker.execute(()->{
            File file=null;
            try{
                if(closed.get() || handle.isCancelled()){pending.remove(handle.clientRequestId);close();return;}
                file=File.createTempFile("speech-pcm-",".bin",cache);
                try(FileOutputStream out=new FileOutputStream(file)){ByteBuffer bytes=ByteBuffer.allocate(audio.length*4).order(ByteOrder.LITTLE_ENDIAN);for(float value:audio)bytes.putFloat(value);out.write(bytes.array());}
                JSONObject request=new JSONObject().put("schema",1).put("clientRequestId",handle.clientRequestId).put("sequence",seq).put("samples",audio.length).put("end",end);
                try(ParcelFileDescriptor descriptor=ParcelFileDescriptor.open(file,ParcelFileDescriptor.MODE_READ_ONLY)){
                    handle.acknowledge(remote.feed(request.toString(),descriptor,new ITextResultCallback.Stub(){@Override public void onResult(String json){
                        try{JSONObject result=new JSONObject(json);if(!handle.clientRequestId.equals(result.getString("clientRequestId")))throw new IllegalArgumentException("Correlation mismatch");handle.acknowledge(result.getLong("requestId"));boolean terminal=result.optBoolean("terminal");if(terminal)pending.remove(handle.clientRequestId);if(handle.accept(terminal)){callbacks.execute(()->{if(!closed.get()&&!handle.isCancelled())listener.onResult(json);});}}
                        catch(Exception error){fail(handle,listener,"PROTOCOL_ERROR");close();}
                    }}));
                }
            }catch(Exception error){fail(handle,listener,"SPEECH_UNAVAILABLE");close();}
            finally{if(file!=null)file.delete();java.util.Arrays.fill(audio,0f);}
        });}catch(RejectedExecutionException error){pending.remove(handle.clientRequestId);java.util.Arrays.fill(audio,0f);handle.cancel();close();throw error;}
        return handle;
    }
    private void fail(RequestHandle handle,ResultListener listener,String code){pending.remove(handle.clientRequestId);if(!handle.accept(true))return;try{String json=new JSONObject().put("schema",1).put("clientRequestId",handle.clientRequestId).put("terminal",true).put("status","error").put("code",code).toString();callbacks.execute(()->{if(!handle.isCancelled())listener.onResult(json);});}catch(Exception ignored){}}
    /** Optional fixed 32 ms Silero window for the caller's existing endpointer. Call on the microphone worker. */
    public float voiceProbability(float[] window) throws HostException {if(closed.get())throw new HostException("SPEECH_SESSION_CLOSED");if(window==null||window.length!=512)throw new IllegalArgumentException("VAD needs 512 samples");try{return remote.voiceProbability(window);}catch(Exception error){throw new HostException("SPEECH_VAD_UNAVAILABLE",error);}}
    void disconnected(){close();}
    @Override public synchronized void close(){if(!closed.compareAndSet(false,true))return;onClose.accept(this);for(RequestHandle handle:pending.values())handle.cancel();pending.clear();try{controls.execute(()->{try{remote.close();}catch(Exception ignored){}});}catch(RejectedExecutionException ignored){}}
}
