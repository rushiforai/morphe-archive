package defpackage;

import java.util.Calendar;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hp9 implements jp9 {
    public final Calendar a;

    public hp9(Calendar calendar) {
        this.a = calendar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof hp9) && this.a.equals(((hp9) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "OnMonthSelected(calendar=" + this.a + ")";
    }
}
