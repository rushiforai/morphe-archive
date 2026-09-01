package defpackage;

import com.squareup.wire.Message;
import com.squareup.wire.internal.RuntimeMessageAdapter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hz7 extends jud {
    public final RuntimeMessageAdapter a;
    public final ArrayList b;
    public final LinkedHashMap c;

    public hz7(RuntimeMessageAdapter runtimeMessageAdapter, ArrayList arrayList) throws IOException {
        this.a = runtimeMessageAdapter;
        this.b = arrayList;
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            gz7 gz7Var = new gz7((jud) this.b.get(i), this.a.getFieldBindingsArray()[i]);
            String str = this.a.getJsonNames().get(i);
            String strR0 = gsa.r0(str);
            linkedHashMap.put(str, gz7Var);
            linkedHashMap.put(strR0, gz7Var);
            String str2 = this.a.getJsonAlternateNames().get(i);
            if (str2 != null) {
                linkedHashMap.put(str2, gz7Var);
            }
        }
        this.c = linkedHashMap;
    }

    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) throws IOException {
        gd6Var.getClass();
        Message.Builder builder = (Message.Builder) this.a.newBuilder();
        gd6Var.m();
        while (gd6Var.hasNext()) {
            gz7 gz7Var = (gz7) this.c.get(gd6Var.X());
            if (gz7Var == null) {
                gd6Var.v();
            } else {
                Object objB = gz7Var.a.b(gd6Var);
                if (objB != null) {
                    gz7Var.b.set(builder, objB);
                }
            }
        }
        gd6Var.I();
        return builder.build();
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) throws IOException {
        yd6Var.getClass();
        yd6Var.p();
        so1 so1Var = new so1(20, yd6Var);
        this.a.writeAllFields((Message) obj, this.b, null, so1Var);
        yd6Var.I();
    }
}
