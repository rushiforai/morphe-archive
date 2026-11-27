package app.johninnl.modelhost.api;

import java.util.UUID;
/** Cancellation is independent of the submit worker. Handles also absorb callbacks arriving before submit returns. */
public final class RequestHandle {
    interface CancelSender { void cancel(long serverId); }
    public final String clientRequestId=UUID.randomUUID().toString();
    private long serverId;
    private boolean cancelled, terminal, cancelSent;
    private final CancelSender sender;
    private final Runnable onCancel;
    RequestHandle(CancelSender sender) { this(sender,()->{}); }
    RequestHandle(CancelSender sender,Runnable onCancel) { this.sender=sender;this.onCancel=onCancel; }
    public synchronized long serverRequestId() { return serverId; }
    public synchronized boolean isComplete() { return terminal; }
    public synchronized boolean isCancelled() { return cancelled; }
    public void cancel() { long id=0; synchronized(this) { if(terminal || cancelled)return;cancelled=true;if(serverId>0 && !cancelSent){cancelSent=true;id=serverId;} } onCancel.run();if(id>0)sender.cancel(id); }
    void acknowledge(long id) { boolean send=false; synchronized(this) { if(id<=0 || (serverId!=0 && serverId!=id))throw new IllegalStateException("Mismatched acknowledgement");serverId=id;if(cancelled && !cancelSent && !terminal){cancelSent=true;send=true;} }if(send)sender.cancel(id); }
    synchronized boolean accept(boolean isTerminal) { if(terminal)return false;if(isTerminal)terminal=true;return !cancelled; }
    synchronized boolean finishCancelled() { if(terminal)return false;terminal=true;return true; }
}
