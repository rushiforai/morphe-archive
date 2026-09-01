package defpackage;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class p01 extends zi5 {
    @Override // defpackage.zi5
    public final List g(Executor executor) {
        return Arrays.asList(new yx1(), new cy2(executor));
    }

    @Override // defpackage.zi5
    public final List j() {
        return Collections.singletonList(new o01(1));
    }
}
