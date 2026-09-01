package defpackage;

import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r89 extends l2 {
    public final /* synthetic */ int a;
    public final k89 b;

    public /* synthetic */ r89(k89 k89Var, int i) {
        this.a = i;
        this.b = k89Var;
    }

    @Override // defpackage.t0, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        int i = this.a;
        k89 k89Var = this.b;
        switch (i) {
            case 0:
                if (obj instanceof Map.Entry) {
                    Map.Entry entry = (Map.Entry) obj;
                    Object obj2 = k89Var.get(entry.getKey());
                    if (obj2 != null) {
                        return obj2.equals(entry.getValue());
                    }
                    if (entry.getValue() == null && k89Var.containsKey(entry.getKey())) {
                        return true;
                    }
                }
                return false;
            default:
                return k89Var.containsKey(obj);
        }
    }

    @Override // defpackage.t0
    public final int getSize() {
        int i = this.a;
        k89 k89Var = this.b;
        switch (i) {
        }
        return k89Var.b;
    }

    @Override // java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator iterator() {
        int i = this.a;
        k89 k89Var = this.b;
        switch (i) {
            case 0:
                zsd zsdVar = k89Var.a;
                atd[] atdVarArr = new atd[8];
                for (int i2 = 0; i2 < 8; i2++) {
                    atdVarArr[i2] = new btd(0);
                }
                return new s89(zsdVar, atdVarArr);
            default:
                zsd zsdVar2 = k89Var.a;
                atd[] atdVarArr2 = new atd[8];
                for (int i3 = 0; i3 < 8; i3++) {
                    atdVarArr2[i3] = new btd(1);
                }
                return new s89(zsdVar2, atdVarArr2);
        }
    }
}
