package defpackage;

import com.medium.android.common.ui.Ezz.Plbho;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class k1c {
    public static final k1c CRASHLYTICS;
    public static final k1c MATT_SAYS_HI;
    public static final k1c PERFORMANCE;
    public static final /* synthetic */ k1c[] a;
    public static final /* synthetic */ i04 b;

    public static g04 getEntries() {
        return b;
    }

    public static k1c valueOf(String str) {
        return (k1c) Enum.valueOf(k1c.class, str);
    }

    public static k1c[] values() {
        return (k1c[]) a.clone();
    }

    static {
        k1c k1cVar = new k1c("CRASHLYTICS", 0);
        CRASHLYTICS = k1cVar;
        k1c k1cVar2 = new k1c(Plbho.blSYMoDo, 1);
        PERFORMANCE = k1cVar2;
        k1c k1cVar3 = new k1c("MATT_SAYS_HI", 2);
        MATT_SAYS_HI = k1cVar3;
        k1c[] k1cVarArr = {k1cVar, k1cVar2, k1cVar3};
        a = k1cVarArr;
        b = new i04(k1cVarArr);
    }
}
