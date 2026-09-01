package sprig.e;

import com.userleap.internal.data.ReplayRequest;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\bà\u0080\u0001\u0018\u0000 \u00062\u00020\u0001:\u0001\u0007J\u0010\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H&¨\u0006\b"}, d2 = {"Lsprig/e/c;", "", "Lcom/userleap/internal/data/ReplayRequest;", "replayRequest", "Lsprig/d/b;", "createRecorder", "Companion", "a", "userleap_release"}, k = 1, mv = {1, 8, 0})
public interface c {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = Companion.$$INSTANCE;

    /* JADX INFO: renamed from: sprig.e.c$a, reason: from kotlin metadata */
    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\t\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u000f\u0010\u0007\u001a\u00020\u0004H\u0000¢\u0006\u0004\b\u0005\u0010\u0006J\u0017\u0010\f\u001a\u00020\t2\u0006\u0010\b\u001a\u00020\u0004H\u0000¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\u000e\u001a\u00020\tH\u0000¢\u0006\u0004\b\r\u0010\u0003R\u0016\u0010\u0011\u001a\u00020\u00048\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u000f\u0010\u0010¨\u0006\u0012"}, d2 = {"Lsprig/e/c$a;", "", "<init>", "()V", "Lsprig/e/c;", "get$userleap_release", "()Lsprig/e/c;", "get", "override", "Lc1e;", "set$userleap_release", "(Lsprig/e/c;)V", "set", "reset$userleap_release", "reset", "a", "Lsprig/e/c;", "instance", "userleap_release"}, k = 1, mv = {1, 8, 0})
    public static final class Companion {
        static final /* synthetic */ Companion $$INSTANCE = new Companion();

        /* JADX INFO: renamed from: a, reason: from kotlin metadata */
        public static c instance = new a();

        private Companion() {
        }

        public final c get$userleap_release() {
            return instance;
        }

        public final void reset$userleap_release() {
            instance = new a();
        }

        public final void set$userleap_release(c override) {
            override.getClass();
            instance = override;
        }
    }

    sprig.view.b createRecorder(ReplayRequest replayRequest);
}
