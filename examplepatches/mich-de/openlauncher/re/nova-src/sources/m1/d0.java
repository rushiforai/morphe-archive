package m1;

import b.c9;
import java.util.Iterator;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class d0 {

    /* renamed from: a, reason: collision with root package name */
    public final Map f75679a;

    public d0(Map map) {
        this.f75679a = map;
    }

    public final Object a(float f11) {
        Object next;
        Iterator it = this.f75679a.entrySet().iterator();
        if (it.hasNext()) {
            next = it.next();
            if (it.hasNext()) {
                float fAbs = Math.abs(f11 - ((Number) ((Map.Entry) next).getValue()).floatValue());
                do {
                    Object next2 = it.next();
                    float fAbs2 = Math.abs(f11 - ((Number) ((Map.Entry) next2).getValue()).floatValue());
                    if (Float.compare(fAbs, fAbs2) > 0) {
                        next = next2;
                        fAbs = fAbs2;
                    }
                } while (it.hasNext());
            }
        } else {
            next = null;
        }
        Map.Entry entry = (Map.Entry) next;
        if (entry != null) {
            return entry.getKey();
        }
        return null;
    }

    public final Object b(float f11, boolean z11) {
        Object next;
        Iterator it = this.f75679a.entrySet().iterator();
        if (it.hasNext()) {
            next = it.next();
            if (it.hasNext()) {
                float fFloatValue = ((Number) ((Map.Entry) next).getValue()).floatValue();
                float f12 = z11 ? fFloatValue - f11 : f11 - fFloatValue;
                if (f12 < 0.0f) {
                    f12 = Float.POSITIVE_INFINITY;
                }
                do {
                    Object next2 = it.next();
                    float fFloatValue2 = ((Number) ((Map.Entry) next2).getValue()).floatValue();
                    float f13 = z11 ? fFloatValue2 - f11 : f11 - fFloatValue2;
                    if (f13 < 0.0f) {
                        f13 = Float.POSITIVE_INFINITY;
                    }
                    if (Float.compare(f12, f13) > 0) {
                        next = next2;
                        f12 = f13;
                    }
                } while (it.hasNext());
            }
        } else {
            next = null;
        }
        Map.Entry entry = (Map.Entry) next;
        if (entry != null) {
            return entry.getKey();
        }
        return null;
    }

    public final float c(Object obj) {
        Float f11 = (Float) this.f75679a.get(obj);
        if (f11 != null) {
            return f11.floatValue();
        }
        return Float.NaN;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d0)) {
            return false;
        }
        return Intrinsics.b(this.f75679a, ((d0) obj).f75679a);
    }

    public final int hashCode() {
        return this.f75679a.hashCode() * 31;
    }

    public final String toString() {
        return c9.l(new StringBuilder("MapDraggableAnchors("), this.f75679a, ')');
    }
}
