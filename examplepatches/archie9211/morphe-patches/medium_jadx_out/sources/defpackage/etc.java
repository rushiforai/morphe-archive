package defpackage;

import java.util.LinkedHashMap;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class etc extends co6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ hl7 b;
    public final /* synthetic */ List c;
    public final /* synthetic */ LinkedHashMap d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ etc(hl7 hl7Var, List list, LinkedHashMap linkedHashMap, int i) {
        super(1);
        this.a = i;
        this.b = hl7Var;
        this.c = list;
        this.d = linkedHashMap;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        LinkedHashMap linkedHashMap = this.d;
        List list = this.c;
        hl7 hl7Var = this.b;
        switch (i) {
            case 0:
                hl7Var.e((s99) obj, list, linkedHashMap);
                break;
            case 1:
                hl7Var.e((s99) obj, list, linkedHashMap);
                break;
            case 2:
                hl7Var.e((s99) obj, list, linkedHashMap);
                break;
            case 3:
                hl7Var.e((s99) obj, list, linkedHashMap);
                break;
            case 4:
                hl7Var.e((s99) obj, list, linkedHashMap);
                break;
            case 5:
                hl7Var.e((s99) obj, list, linkedHashMap);
                break;
            case 6:
                hl7Var.e((s99) obj, list, linkedHashMap);
                break;
            default:
                hl7Var.e((s99) obj, list, linkedHashMap);
                break;
        }
        return c1eVar;
    }
}
