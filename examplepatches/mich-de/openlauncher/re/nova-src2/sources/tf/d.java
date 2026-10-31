package tf;

import ai.y0;
import android.media.Spatializer;
import fe.k0;

/* loaded from: classes3.dex */
public final /* synthetic */ class d implements vk.m {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ o f89067a;

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:16:0x0027  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0062 A[Catch: all -> 0x008f, FALL_THROUGH, TryCatch #0 {all -> 0x008f, blocks: (B:4:0x0007, B:6:0x000e, B:8:0x0012, B:10:0x0017, B:34:0x0056, B:36:0x005a, B:38:0x005e, B:40:0x0062, B:42:0x0066, B:44:0x006a, B:46:0x006e, B:48:0x0078, B:50:0x0084, B:56:0x0092), top: B:60:0x0007 }] */
    @Override // vk.m
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean apply(Object obj) {
        boolean z11;
        y0 y0Var;
        y0 y0Var2;
        o oVar = this.f89067a;
        k0 k0Var = (k0) obj;
        synchronized (oVar.f89112g) {
            try {
                z11 = true;
                if (oVar.f89116k.J && !oVar.f89115j) {
                    char c11 = 2;
                    if (k0Var.f54894y > 2) {
                        String str = k0Var.f54883l;
                        if (str != null) {
                            switch (str.hashCode()) {
                                case -2123537834:
                                    if (!str.equals("audio/eac3-joc")) {
                                        c11 = 65535;
                                        break;
                                    } else {
                                        c11 = 0;
                                        break;
                                    }
                                case 187078296:
                                    if (str.equals("audio/ac3")) {
                                        c11 = 1;
                                        break;
                                    }
                                    break;
                                case 187078297:
                                    if (!str.equals("audio/ac4")) {
                                    }
                                    break;
                                case 1504578661:
                                    if (str.equals("audio/eac3")) {
                                        c11 = 3;
                                        break;
                                    }
                                    break;
                            }
                            switch (c11) {
                                case 0:
                                case 1:
                                case 2:
                                case 3:
                                    if (wf.v.f94376a >= 32 && (y0Var2 = oVar.f89117l) != null && y0Var2.f13474b) {
                                    }
                                    break;
                            }
                        } else if (wf.v.f94376a < 32 || (y0Var = oVar.f89117l) == null || !y0Var.f13474b || !((Spatializer) y0Var.f13475c).isAvailable() || !((Spatializer) oVar.f89117l.f13475c).isEnabled() || !oVar.f89117l.e(k0Var, oVar.f89118m)) {
                            z11 = false;
                        }
                    }
                }
            } finally {
            }
        }
        return z11;
    }
}
