package sprig.view;

import com.userleap.internal.data.ReplayRequest;
import kotlin.Metadata;
import sprig.graphics.EnumC0050b;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\b`\u0018\u00002\u00020\u0001J\u000f\u0010\u0003\u001a\u00020\u0002H&¢\u0006\u0004\b\u0003\u0010\u0004J\u0017\u0010\u0007\u001a\u00020\u00022\u0006\u0010\u0006\u001a\u00020\u0005H&¢\u0006\u0004\b\u0007\u0010\bR\u0014\u0010\f\u001a\u00020\t8&X¦\u0004¢\u0006\u0006\u001a\u0004\b\n\u0010\u000bR\u0016\u0010\u0010\u001a\u0004\u0018\u00010\r8&X¦\u0004¢\u0006\u0006\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u0011"}, d2 = {"Lsprig/d/c;", "", "Lc1e;", "record", "()V", "Lsprig/h/b;", "reason", "stopRecording", "(Lsprig/h/b;)V", "Lcom/userleap/internal/data/ReplayRequest;", "getReplayRequest", "()Lcom/userleap/internal/data/ReplayRequest;", "replayRequest", "Lsprig/d/b;", "getSessionRecorder", "()Lsprig/d/b;", "sessionRecorder", "userleap_release"}, k = 1, mv = {1, 8, 0})
public interface c {
    ReplayRequest getReplayRequest();

    b getSessionRecorder();

    void record();

    void stopRecording(EnumC0050b reason);
}
