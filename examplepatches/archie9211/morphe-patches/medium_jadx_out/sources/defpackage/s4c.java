package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s4c {
    public static final s4c INDIVIDUALLY;
    public static final s4c SIMULTANEOUSLY;
    public static final /* synthetic */ s4c[] a;

    static {
        s4c s4cVar = new s4c("SIMULTANEOUSLY", 0);
        SIMULTANEOUSLY = s4cVar;
        s4c s4cVar2 = new s4c("INDIVIDUALLY", 1);
        INDIVIDUALLY = s4cVar2;
        a = new s4c[]{s4cVar, s4cVar2};
    }

    public static s4c forId(int i) {
        if (i == 1) {
            return SIMULTANEOUSLY;
        }
        if (i == 2) {
            return INDIVIDUALLY;
        }
        ay0.e(b09.w(i, "Unknown trim path type "));
        return null;
    }

    public static s4c valueOf(String str) {
        return (s4c) Enum.valueOf(s4c.class, str);
    }

    public static s4c[] values() {
        return (s4c[]) a.clone();
    }
}
