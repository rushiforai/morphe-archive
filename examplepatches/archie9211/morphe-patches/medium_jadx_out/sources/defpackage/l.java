package defpackage;

import java.util.concurrent.CancellationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l extends CancellationException {
    public final wq4 a;

    public l(wq4 wq4Var) {
        super("Flow was aborted, no more elements needed");
        this.a = wq4Var;
    }
}
