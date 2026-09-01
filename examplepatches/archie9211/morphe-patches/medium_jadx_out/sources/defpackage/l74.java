package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l74 extends b2 {
    public final c41 c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l74(c41 c41Var, mn6 mn6Var) {
        super(mn6Var);
        if (mn6Var == null) {
            throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", "receiverType", "kotlin/reflect/jvm/internal/impl/resolve/scopes/receivers/ExtensionReceiver", "<init>"));
        }
        this.c = c41Var;
    }

    @Override // defpackage.b2
    public final String toString() {
        return getType() + ": Ext {" + this.c + "}";
    }
}
