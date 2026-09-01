package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public enum f96 {
    NON_STABLE_DECLARED(false, false),
    STABLE_DECLARED(true, false),
    NON_STABLE_SYNTHESIZED(false, true),
    STABLE_SYNTHESIZED(true, true);

    public final boolean isStable;
    public final boolean isSynthesized;

    f96(boolean z, boolean z2) {
        this.isStable = z;
        this.isSynthesized = z2;
    }

    public static f96 get(boolean z, boolean z2) {
        f96 f96Var = z ? z2 ? STABLE_SYNTHESIZED : STABLE_DECLARED : z2 ? NON_STABLE_SYNTHESIZED : NON_STABLE_DECLARED;
        if (f96Var != null) {
            return f96Var;
        }
        ygf.f("@NotNull method kotlin/reflect/jvm/internal/impl/load/java/descriptors/JavaMethodDescriptor$ParameterNamesStatus.get must not return null");
        return null;
    }
}
