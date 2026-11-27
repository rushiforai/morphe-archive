package app.johninnl.modelhost.api;

import android.os.ParcelFileDescriptor;
import android.os.RemoteException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONObject;

public final class HostSession implements AutoCloseable {
    private final IModelSession remote;
    private final Executor worker, controls, callbacks;
    private final java.util.function.Consumer<HostSession> onClosed;
    private final Map<String,Pending> requests=new ConcurrentHashMap<>();
    private final AtomicBoolean closed=new AtomicBoolean();
    private final class Pending {
        final ResultListener listener;
        final RequestHandle handle=new RequestHandle(id -> {
            try { controls.execute(() -> { try { remote.cancel(id); } catch(Exception e) { fail(this,"PROVIDER_UNAVAILABLE"); } }); }
            catch(RuntimeException e) { fail(this,"CLIENT_BUSY"); }
        });
        Pending(ResultListener listener) { this.listener=listener; }
    }
    HostSession(IModelSession remote, Executor worker, Executor callbacks, java.util.function.Consumer<HostSession> onClosed) { this(remote,worker,worker,callbacks,onClosed); }
    HostSession(IModelSession remote, Executor worker,Executor controls,Executor callbacks,java.util.function.Consumer<HostSession> onClosed) { this.remote=remote;this.worker=worker;this.controls=controls;this.callbacks=callbacks;this.onClosed=onClosed; }
    public RequestHandle submitText(TextRequest request, ResultListener listener) { return submit(request,null,null,listener); }
    /** The SDK duplicates the supplied descriptor; ownership of the original remains with the caller. */
    public RequestHandle submitImage(ImageRequest request, ParcelFileDescriptor image, ResultListener listener) { return submit(request.request,image,null,listener); }
    public RequestHandle preparePrefix(PrefixRequest request, ResultListener listener) { return submit(null,null,request,listener); }
    private RequestHandle submit(TextRequest text, ParcelFileDescriptor image, PrefixRequest prefix, ResultListener listener) {
        if(listener==null)throw new IllegalArgumentException("Missing listener");
        Pending p=new Pending(listener); requests.put(p.handle.clientRequestId,p);
        ParcelFileDescriptor copied=null;
        try { if(image!=null)copied=ParcelFileDescriptor.dup(image.getFileDescriptor()); }
        catch(Exception e) { fail(p,"INVALID_IMAGE");return p.handle; }
        final ParcelFileDescriptor fd=copied;
        try { worker.execute(() -> {
            try {
                if(closed.get()){fail(p,"SESSION_CLOSED");return;}
                ITextResultCallback cb=new ITextResultCallback.Stub() { @Override public void onResult(String json) { receive(p,json); } };
                long id=prefix!=null ? remote.preparePrefix(prefix.toJson(p.handle.clientRequestId),cb) : fd!=null ? remote.submitImage(text.toJson(p.handle.clientRequestId),fd,cb) : remote.submitText(text.toJson(p.handle.clientRequestId),cb);
                p.handle.acknowledge(id);
            } catch(Exception e) { fail(p,"PROVIDER_UNAVAILABLE"); }
            finally { if(fd!=null)try{fd.close();}catch(Exception ignored){} }
        }); } catch(RuntimeException e) { if(fd!=null)try{fd.close();}catch(Exception ignored){}fail(p,"CLIENT_BUSY"); }
        return p.handle;
    }
    private void receive(Pending p,String json) {
        try {
            JSONObject o=Protocol.object(json); if(!p.handle.clientRequestId.equals(o.optString("clientRequestId")))return;
            p.handle.acknowledge(o.getLong("requestId"));
            boolean terminal=o.optBoolean("terminal",false);
            if(terminal)requests.remove(p.handle.clientRequestId);
            if(p.handle.accept(terminal))callbacks.execute(() -> p.listener.onResult(json));
        } catch(Exception e) { fail(p,"PROTOCOL_ERROR"); }
    }
    private void fail(Pending p,String code) {
        requests.remove(p.handle.clientRequestId);
        if(!p.handle.accept(true))return;
        JSONObject o=Protocol.envelope();Protocol.put(o,"clientRequestId",p.handle.clientRequestId);Protocol.put(o,"requestId",p.handle.serverRequestId());Protocol.put(o,"terminal",true);Protocol.put(o,"status","error");Protocol.put(o,"code",code);
        callbacks.execute(() -> p.listener.onResult(o.toString()));
    }
    void disconnected() { closed.set(true);for(Pending p:requests.values())fail(p,"PROVIDER_UNAVAILABLE"); }
    @Override public void close() { if(!closed.compareAndSet(false,true))return;onClosed.accept(this);for(Pending p:requests.values())fail(p,"SESSION_CLOSED");try { controls.execute(() -> { try{remote.close();}catch(Exception ignored){} }); }catch(RuntimeException ignored){} }
}
