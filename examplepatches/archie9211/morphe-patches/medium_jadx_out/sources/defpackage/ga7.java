package defpackage;

import java.util.Arrays;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ga7 extends co6 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ha7 b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ga7(ha7 ha7Var, int i) {
        super(0);
        this.a = i;
        this.b = ha7Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        ha7 ha7Var = this.b;
        switch (i) {
            case 0:
                return new ia7(ha7Var.a.e());
            default:
                return String.format(Locale.US, "Feature \"%s\" is being registered, but no SDK instance is available. Make sure the SDK is properly initialized.", Arrays.copyOf(new Object[]{ha7Var.h}, 1));
        }
    }
}
