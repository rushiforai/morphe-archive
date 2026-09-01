package defpackage;

import java.util.Arrays;
import java.util.Locale;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fa7 extends co6 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ fa7(int i, Object obj) {
        super(0);
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                return String.format(Locale.US, "Logs feature receive an event of unsupported type=%s.", Arrays.copyOf(new Object[]{obj.getClass().getCanonicalName()}, 1));
            default:
                return String.format(Locale.US, "Logs feature received an event with unknown value of \"type\" property=%s.", Arrays.copyOf(new Object[]{((Map) obj).get("type")}, 1));
        }
    }
}
