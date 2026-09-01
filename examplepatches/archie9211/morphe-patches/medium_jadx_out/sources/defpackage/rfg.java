package defpackage;

import j$.util.Objects;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rfg implements Map.Entry {
    public final Object a;
    public int b;
    public final /* synthetic */ tfg c;

    public rfg(tfg tfgVar, int i) {
        this.c = tfgVar;
        this.a = tfgVar.a()[i];
        this.b = i;
    }

    public final void a() {
        int i = this.b;
        Object obj = this.a;
        tfg tfgVar = this.c;
        if (i != -1 && i < tfgVar.size()) {
            if (Objects.equals(obj, tfgVar.a()[this.b])) {
                return;
            }
        }
        this.b = tfgVar.i(obj);
    }

    @Override // java.util.Map.Entry
    public final boolean equals(Object obj) {
        if (obj instanceof Map.Entry) {
            Map.Entry entry = (Map.Entry) obj;
            if (Objects.equals(getKey(), entry.getKey()) && Objects.equals(getValue(), entry.getValue())) {
                return true;
            }
        }
        return false;
    }

    @Override // java.util.Map.Entry
    public final Object getKey() {
        return this.a;
    }

    @Override // java.util.Map.Entry
    public final Object getValue() {
        tfg tfgVar = this.c;
        Map mapD = tfgVar.d();
        if (mapD != null) {
            return mapD.get(this.a);
        }
        a();
        int i = this.b;
        if (i == -1) {
            return null;
        }
        return tfgVar.b()[i];
    }

    @Override // java.util.Map.Entry
    public final int hashCode() {
        Object key = getKey();
        Object value = getValue();
        return (key == null ? 0 : key.hashCode()) ^ (value != null ? value.hashCode() : 0);
    }

    @Override // java.util.Map.Entry
    public final Object setValue(Object obj) {
        tfg tfgVar = this.c;
        Map mapD = tfgVar.d();
        Object obj2 = this.a;
        if (mapD != null) {
            return mapD.put(obj2, obj);
        }
        a();
        int i = this.b;
        if (i == -1) {
            tfgVar.put(obj2, obj);
            return null;
        }
        Object obj3 = tfgVar.b()[i];
        tfgVar.b()[this.b] = obj;
        return obj3;
    }

    public final String toString() {
        String strValueOf = String.valueOf(getKey());
        String strValueOf2 = String.valueOf(getValue());
        return y30.s(new StringBuilder(strValueOf.length() + 1 + strValueOf2.length()), strValueOf, "=", strValueOf2);
    }
}
