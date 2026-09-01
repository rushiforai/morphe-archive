package defpackage;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xu2 extends co6 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ysb b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ xu2(ysb ysbVar, int i) {
        super(0);
        this.a = i;
        this.b = ysbVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        ysb ysbVar = this.b;
        switch (i) {
            case 0:
                return new HashMap(ysbVar.m);
            default:
                return String.format(Locale.US, "Feature \"%s\" has no event receiver registered, ignoring event.", Arrays.copyOf(new Object[]{ysbVar.c.getName()}, 1));
        }
    }
}
