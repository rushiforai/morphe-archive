package defpackage;

import android.content.Context;
import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qd2 {
    public static final HashMap f;
    public static final String g;
    public final Context a;
    public final sv5 b;
    public final g40 c;
    public final gg5 d;
    public final iv2 e;

    static {
        HashMap map = new HashMap();
        f = map;
        ho2.M(5, map, "armeabi", 6, "armeabi-v7a");
        ho2.M(9, map, "arm64-v8a", 0, "x86");
        map.put("x86_64", 1);
        Locale locale = Locale.US;
        g = "Crashlytics Android SDK/20.0.6";
    }

    public qd2(Context context, sv5 sv5Var, g40 g40Var, gg5 gg5Var, iv2 iv2Var) {
        this.a = context;
        this.b = sv5Var;
        this.c = g40Var;
        this.d = gg5Var;
        this.e = iv2Var;
    }

    public static oi0 c(o2b o2bVar, int i) {
        String str = (String) o2bVar.c;
        String str2 = (String) o2bVar.b;
        StackTraceElement[] stackTraceElementArr = (StackTraceElement[]) o2bVar.d;
        int i2 = 0;
        if (stackTraceElementArr == null) {
            stackTraceElementArr = new StackTraceElement[0];
        }
        o2b o2bVar2 = (o2b) o2bVar.e;
        if (i >= 8) {
            o2b o2bVar3 = o2bVar2;
            while (o2bVar3 != null) {
                o2bVar3 = (o2b) o2bVar3.e;
                i2++;
            }
        }
        int i3 = i2;
        List listD = d(stackTraceElementArr, 4);
        if (listD == null) {
            z72.c("Null frames");
            return null;
        }
        byte b = (byte) (0 | 1);
        oi0 oi0VarC = (o2bVar2 == null || i3 != 0) ? null : c(o2bVar2, i + 1);
        if (b == 1) {
            return new oi0(str, str2, listD, oi0VarC, i3);
        }
        StringBuilder sb = new StringBuilder();
        if ((b & 1) == 0) {
            sb.append(" overflowCount");
        }
        ygf.f(ka1.u("Missing required properties:", sb));
        return null;
    }

    public static List d(StackTraceElement[] stackTraceElementArr, int i) {
        ArrayList arrayList = new ArrayList();
        for (StackTraceElement stackTraceElement : stackTraceElementArr) {
            ri0 ri0Var = new ri0();
            ri0Var.e = i;
            ri0Var.f = (byte) (ri0Var.f | 4);
            long lineNumber = 0;
            long jMax = stackTraceElement.isNativeMethod() ? Math.max(stackTraceElement.getLineNumber(), 0L) : 0L;
            String str = stackTraceElement.getClassName() + "." + stackTraceElement.getMethodName();
            String fileName = stackTraceElement.getFileName();
            if (!stackTraceElement.isNativeMethod() && stackTraceElement.getLineNumber() > 0) {
                lineNumber = stackTraceElement.getLineNumber();
            }
            ri0Var.a = jMax;
            byte b = (byte) (ri0Var.f | 1);
            ri0Var.b = str;
            ri0Var.c = fileName;
            ri0Var.d = lineNumber;
            ri0Var.f = (byte) (b | 2);
            arrayList.add(ri0Var.a());
        }
        return DesugarCollections.unmodifiableList(arrayList);
    }

    public static pi0 e() {
        return new pi0("0", "0", 0L);
    }

    public final List a() {
        byte b = (byte) (((byte) (0 | 1)) | 2);
        g40 g40Var = this.c;
        String str = g40Var.e;
        if (str == null) {
            z72.c("Null name");
            return null;
        }
        String str2 = g40Var.b;
        if (b == 3) {
            return Collections.singletonList(new ni0(0L, 0L, str, str2));
        }
        StringBuilder sb = new StringBuilder();
        if ((b & 1) == 0) {
            sb.append(" baseAddress");
        }
        if ((b & 2) == 0) {
            sb.append(" size");
        }
        ygf.f(ka1.u("Missing required properties:", sb));
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x0051  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0070  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00a7  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.wi0 b(int r17) {
        /*
            Method dump skipped, instruction units count: 239
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qd2.b(int):wi0");
    }
}
