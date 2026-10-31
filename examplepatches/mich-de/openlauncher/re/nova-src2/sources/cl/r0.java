package cl;

import com.google.common.util.concurrent.ListenableFuture;

/* loaded from: classes.dex */
public abstract class r0 extends s {
    public static r0 r(ListenableFuture listenableFuture) {
        return listenableFuture instanceof r0 ? (r0) listenableFuture : new s0(listenableFuture);
    }
}
