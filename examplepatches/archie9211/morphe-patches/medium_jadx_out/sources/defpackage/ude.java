package defpackage;

import java.util.Calendar;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ude implements wde {
    public final Calendar a;

    public ude(Calendar calendar) {
        this.a = calendar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof ude) && this.a.equals(((ude) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "OnMonthSelected(calendar=" + this.a + ")";
    }
}
