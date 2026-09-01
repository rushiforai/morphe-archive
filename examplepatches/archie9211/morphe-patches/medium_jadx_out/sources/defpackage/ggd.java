package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ggd {
    public static final ggd MethodCalled;
    public static final /* synthetic */ ggd[] a;

    static {
        ggd ggdVar = new ggd("MethodCalled", 0);
        MethodCalled = ggdVar;
        a = new ggd[]{ggdVar};
    }

    public static ggd valueOf(String str) {
        return (ggd) Enum.valueOf(ggd.class, str);
    }

    public static ggd[] values() {
        return (ggd[]) a.clone();
    }
}
