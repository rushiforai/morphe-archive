package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class dta extends o12 {
    public final /* synthetic */ int b;
    public final /* synthetic */ en6 c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ dta(en6 en6Var, int i) {
        super(1);
        this.b = i;
        this.c = en6Var;
    }

    @Override // defpackage.o12
    public final void h(String[] strArr) {
        int i = this.b;
        en6 en6Var = this.c;
        switch (i) {
            case 0:
                if (strArr == null) {
                    ay0.e("Argument for @NotNull parameter 'result' of kotlin/reflect/jvm/internal/impl/load/kotlin/header/ReadKotlinClassHeaderAnnotationVisitor$KotlinMetadataArgumentVisitor$1.visitEnd must not be null");
                } else {
                    ((eta) en6Var).b.d = strArr;
                }
                break;
            case 1:
                if (strArr == null) {
                    ay0.e("Argument for @NotNull parameter 'result' of kotlin/reflect/jvm/internal/impl/load/kotlin/header/ReadKotlinClassHeaderAnnotationVisitor$KotlinMetadataArgumentVisitor$2.visitEnd must not be null");
                } else {
                    ((eta) en6Var).b.e = strArr;
                }
                break;
            default:
                if (strArr == null) {
                    ay0.e("Argument for @NotNull parameter 'result' of kotlin/reflect/jvm/internal/impl/load/kotlin/header/ReadKotlinClassHeaderAnnotationVisitor$KotlinSerializedIrArgumentVisitor$1.visitEnd must not be null");
                } else {
                    ((gta) ((hha) en6Var).a).h = strArr;
                }
                break;
        }
    }
}
