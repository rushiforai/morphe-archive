package sprig.view;

import com.userleap.internal.data.ReplayRequest;
import defpackage.x45;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\b`\u0018\u00002\u00020\u0001J#\u0010\u0006\u001a\u00020\u00042\u0012\u0010\u0005\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00040\u0002H&¢\u0006\u0004\b\u0006\u0010\u0007R\u0014\u0010\u000b\u001a\u00020\b8&X¦\u0004¢\u0006\u0006\u001a\u0004\b\t\u0010\n¨\u0006\f"}, d2 = {"Lsprig/d/d;", "", "Lkotlin/Function1;", "Lsprig/g/c;", "Lc1e;", "completionHandler", "upload", "(Lx45;)V", "Lcom/userleap/internal/data/ReplayRequest;", "getReplayRequest", "()Lcom/userleap/internal/data/ReplayRequest;", "replayRequest", "userleap_release"}, k = 1, mv = {1, 8, 0})
public interface d {
    ReplayRequest getReplayRequest();

    void upload(x45 completionHandler);
}
