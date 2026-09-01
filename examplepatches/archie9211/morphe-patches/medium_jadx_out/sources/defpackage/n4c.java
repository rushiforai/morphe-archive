package defpackage;

import android.graphics.Paint;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n4c {
    public static final n4c BUTT;
    public static final n4c ROUND;
    public static final n4c UNKNOWN;
    public static final /* synthetic */ n4c[] a;

    static {
        n4c n4cVar = new n4c("BUTT", 0);
        BUTT = n4cVar;
        n4c n4cVar2 = new n4c("ROUND", 1);
        ROUND = n4cVar2;
        n4c n4cVar3 = new n4c("UNKNOWN", 2);
        UNKNOWN = n4cVar3;
        a = new n4c[]{n4cVar, n4cVar2, n4cVar3};
    }

    public static n4c valueOf(String str) {
        return (n4c) Enum.valueOf(n4c.class, str);
    }

    public static n4c[] values() {
        return (n4c[]) a.clone();
    }

    public Paint.Cap toPaintCap() {
        int i = m4c.a[ordinal()];
        return i != 1 ? i != 2 ? Paint.Cap.SQUARE : Paint.Cap.ROUND : Paint.Cap.BUTT;
    }
}
