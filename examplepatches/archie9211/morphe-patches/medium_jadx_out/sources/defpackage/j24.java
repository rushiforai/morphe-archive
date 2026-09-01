package defpackage;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class j24 implements zvd {
    public final k24 a;
    public final String[] b;
    public final String c;

    public j24(k24 k24Var, String... strArr) {
        k24Var.getClass();
        this.a = k24Var;
        this.b = strArr;
        String debugText = g14.ERROR_TYPE.getDebugText();
        String debugMessage = k24Var.getDebugMessage();
        Object[] objArrCopyOf = Arrays.copyOf(strArr, strArr.length);
        this.c = String.format(debugText, Arrays.copyOf(new Object[]{String.format(debugMessage, Arrays.copyOf(objArrCopyOf, objArrCopyOf.length))}, 1));
    }

    @Override // defpackage.zvd
    public final co1 a() {
        l24.a.getClass();
        return l24.c;
    }

    @Override // defpackage.zvd
    public final Collection b() {
        return ey3.a;
    }

    @Override // defpackage.zvd
    public final boolean c() {
        return false;
    }

    @Override // defpackage.zvd
    public final vm6 e() {
        return (zx2) zx2.f.getValue();
    }

    @Override // defpackage.zvd
    public final List getParameters() {
        return ey3.a;
    }

    public final String toString() {
        return this.c;
    }
}
