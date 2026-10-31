package androidx.datastore.preferences.protobuf;

/* loaded from: classes.dex */
public final class h1 extends f1 {
    @Override // androidx.datastore.preferences.protobuf.f1
    public final g1 a(Object obj) {
        y yVar = (y) obj;
        g1 g1Var = yVar.unknownFields;
        if (g1Var != g1.f14318f) {
            return g1Var;
        }
        g1 g1Var2 = new g1(0, new int[8], new Object[8], true);
        yVar.unknownFields = g1Var2;
        return g1Var2;
    }
}
