package defpackage;

import java.util.Arrays;
import java.util.Locale;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class av2 extends co6 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Map.Entry b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ av2(Map.Entry entry, int i) {
        super(0);
        this.a = i;
        this.b = entry;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        Map.Entry entry = this.b;
        switch (i) {
            case 0:
                return "\"" + entry + "\" is an invalid attribute, and was ignored.";
            default:
                return String.format(Locale.US, "Error serializing value for key %s, value was dropped.", Arrays.copyOf(new Object[]{entry.getKey()}, 1));
        }
    }
}
