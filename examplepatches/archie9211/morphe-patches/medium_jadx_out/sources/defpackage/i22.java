package defpackage;

import java.io.PrintStream;
import java.io.PrintWriter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class i22 extends dm2 {
    public final /* synthetic */ int l;
    public final Object m;

    public /* synthetic */ i22(int i, Object obj) {
        this.l = i;
        this.m = obj;
    }

    @Override // defpackage.dm2
    public final void R(String str) {
        int i = this.l;
        Object obj = this.m;
        switch (i) {
            case 0:
                ((PrintStream) obj).println((Object) str);
                break;
            default:
                ((PrintWriter) obj).println((Object) str);
                break;
        }
    }
}
