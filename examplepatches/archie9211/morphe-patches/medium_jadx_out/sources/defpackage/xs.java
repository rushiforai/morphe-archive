package defpackage;

import java.io.IOException;
import java.net.SocketTimeoutException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class xs implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ long b;
    public final /* synthetic */ Object c;

    public /* synthetic */ xs(int i, long j, Object obj) {
        this.a = i;
        this.c = obj;
        this.b = j;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        v1f v1fVar;
        switch (this.a) {
            case 0:
                return ((g3c) ((ez0) this.c)).b(this.b);
            default:
                zva zvaVar = (zva) this.c;
                long j = this.b;
                synchronized (zvaVar) {
                    try {
                        if (!zvaVar.u && (v1fVar = zvaVar.k) != null) {
                            int i = zvaVar.w ? zvaVar.v : -1;
                            zvaVar.v++;
                            zvaVar.w = true;
                            if (i != -1) {
                                StringBuilder sb = new StringBuilder("sent ping but didn't receive pong within ");
                                sb.append(zvaVar.c);
                                sb.append("ms (after ");
                                zva.c(zvaVar, new SocketTimeoutException(ho2.H(sb, i - 1, " successful ping/pongs)")), 2);
                            } else {
                                try {
                                    h21 h21Var = h21.d;
                                    h21Var.getClass();
                                    v1fVar.f(9, h21Var);
                                } catch (IOException e) {
                                    zva.c(zvaVar, e, 2);
                                }
                            }
                            break;
                        }
                    } catch (Throwable th) {
                        throw th;
                    }
                }
                return Long.valueOf(j);
        }
    }
}
