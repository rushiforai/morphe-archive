package defpackage;

import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ih7 implements Map.Entry, th6 {
    public final /* synthetic */ int a;
    public final Object b;
    public final Object c;

    public /* synthetic */ ih7(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    @Override // java.util.Map.Entry
    public boolean equals(Object obj) {
        switch (this.a) {
            case 0:
                Map.Entry entry = obj instanceof Map.Entry ? (Map.Entry) obj : null;
                return entry != null && g76.L(entry.getKey(), this.b) && g76.L(entry.getValue(), getValue());
            default:
                return super.equals(obj);
        }
    }

    @Override // java.util.Map.Entry
    public final Object getKey() {
        switch (this.a) {
        }
        return this.b;
    }

    @Override // java.util.Map.Entry
    public Object getValue() {
        switch (this.a) {
        }
        return this.c;
    }

    @Override // java.util.Map.Entry
    public int hashCode() {
        switch (this.a) {
            case 0:
                Object obj = this.b;
                int iHashCode = obj != null ? obj.hashCode() : 0;
                Object value = getValue();
                return iHashCode ^ (value != null ? value.hashCode() : 0);
            default:
                return super.hashCode();
        }
    }

    @Override // java.util.Map.Entry
    public Object setValue(Object obj) {
        switch (this.a) {
            case 0:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            default:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
        }
    }

    public String toString() {
        switch (this.a) {
            case 0:
                StringBuilder sb = new StringBuilder();
                sb.append(this.b);
                sb.append('=');
                sb.append(getValue());
                return sb.toString();
            default:
                return super.toString();
        }
    }
}
