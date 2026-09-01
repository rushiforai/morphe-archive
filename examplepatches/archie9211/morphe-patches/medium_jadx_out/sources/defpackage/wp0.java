package defpackage;

import java.util.Arrays;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wp0 extends co6 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ xp0 b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ wp0(xp0 xp0Var, int i) {
        super(0);
        this.a = i;
        this.b = xp0Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        xp0 xp0Var = this.b;
        switch (i) {
            case 0:
                return String.format(Locale.US, "The provided root dir is not writable: %s", Arrays.copyOf(new Object[]{xp0Var.a.getPath()}, 1));
            case 1:
                return String.format(Locale.US, "The provided root file is not a directory: %s", Arrays.copyOf(new Object[]{xp0Var.a.getPath()}, 1));
            default:
                return String.format(Locale.US, "The provided root dir can't be created: %s", Arrays.copyOf(new Object[]{xp0Var.a.getPath()}, 1));
        }
    }
}
