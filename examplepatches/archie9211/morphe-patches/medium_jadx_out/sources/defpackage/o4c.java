package defpackage;

import android.graphics.Paint;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o4c {
    public static final o4c BEVEL;
    public static final o4c MITER;
    public static final o4c ROUND;
    public static final /* synthetic */ o4c[] a;

    static {
        o4c o4cVar = new o4c("MITER", 0);
        MITER = o4cVar;
        o4c o4cVar2 = new o4c("ROUND", 1);
        ROUND = o4cVar2;
        o4c o4cVar3 = new o4c("BEVEL", 2);
        BEVEL = o4cVar3;
        a = new o4c[]{o4cVar, o4cVar2, o4cVar3};
    }

    public static o4c valueOf(String str) {
        return (o4c) Enum.valueOf(o4c.class, str);
    }

    public static o4c[] values() {
        return (o4c[]) a.clone();
    }

    public Paint.Join toPaintJoin() {
        int i = m4c.b[ordinal()];
        if (i == 1) {
            return Paint.Join.BEVEL;
        }
        if (i == 2) {
            return Paint.Join.MITER;
        }
        if (i != 3) {
            return null;
        }
        return Paint.Join.ROUND;
    }
}
