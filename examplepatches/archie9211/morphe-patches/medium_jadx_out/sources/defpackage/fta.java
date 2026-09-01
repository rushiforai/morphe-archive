package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class fta extends o12 {
    public final /* synthetic */ int b;
    public final /* synthetic */ eta c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ fta(eta etaVar, int i) {
        super(1);
        this.b = i;
        this.c = etaVar;
    }

    @Override // defpackage.o12
    public final void h(String[] strArr) {
        int i = this.b;
        eta etaVar = this.c;
        switch (i) {
            case 0:
                if (strArr == null) {
                    ay0.e("Argument for @NotNull parameter 'data' of kotlin/reflect/jvm/internal/impl/load/kotlin/header/ReadKotlinClassHeaderAnnotationVisitor$OldDeprecatedAnnotationArgumentVisitor$1.visitEnd must not be null");
                } else {
                    etaVar.b.d = strArr;
                }
                break;
            default:
                if (strArr == null) {
                    ay0.e("Argument for @NotNull parameter 'data' of kotlin/reflect/jvm/internal/impl/load/kotlin/header/ReadKotlinClassHeaderAnnotationVisitor$OldDeprecatedAnnotationArgumentVisitor$2.visitEnd must not be null");
                } else {
                    etaVar.b.e = strArr;
                }
                break;
        }
    }
}
