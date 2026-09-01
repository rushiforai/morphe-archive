package sprig.e;

import com.userleap.internal.data.ReplayRequest;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0000\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0006\u0010\u0007J\u0010\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016¨\u0006\b"}, d2 = {"Lsprig/e/b;", "Lsprig/e/d;", "Lcom/userleap/internal/data/ReplayRequest;", "replayRequest", "Lsprig/d/c;", "createSession", "<init>", "()V", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class b implements d {
    @Override // sprig.e.d
    public sprig.view.c createSession(ReplayRequest replayRequest) {
        replayRequest.getClass();
        return new sprig.graphics.c(replayRequest);
    }
}
