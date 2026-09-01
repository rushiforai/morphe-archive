package defpackage;

import java.util.Arrays;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lg4 extends co6 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ mg4 b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public lg4(int i, mg4 mg4Var) {
        super(0);
        this.a = i;
        this.b = mg4Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        return String.format(Locale.US, "Can't write data with size %d (max item size is %d)", Arrays.copyOf(new Object[]{Integer.valueOf(this.a), Long.valueOf(this.b.c.c)}, 2));
    }
}
