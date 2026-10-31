package f1;

import android.graphics.Matrix;
import android.graphics.Path;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.math.MathKt;

/* loaded from: classes2.dex */
public final /* synthetic */ class o2 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f53816a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f53817b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f53818c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f53819d;

    public /* synthetic */ o2(int i5, int i11, int i12, z2.i1 i1Var) {
        this.f53816a = i12;
        this.f53817b = i5;
        this.f53818c = i1Var;
        this.f53819d = i11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f53816a) {
            case 0:
                ((z2.h1) obj).i((z2.i1) this.f53818c, MathKt.b((this.f53817b - r0.f98081a) / 2.0f), MathKt.b((this.f53819d - r0.f98082b) / 2.0f), 0.0f);
                break;
            case 1:
                ((z2.h1) obj).i((z2.i1) this.f53818c, MathKt.b((this.f53817b - r0.f98081a) / 2.0f), MathKt.b((this.f53819d - r0.f98082b) / 2.0f), 0.0f);
                break;
            default:
                i2.h hVar = (i2.h) this.f53818c;
                m3.r rVar = (m3.r) obj;
                m3.a aVar = rVar.f75962a;
                int iD = rVar.d(this.f53817b);
                int iD2 = rVar.d(this.f53819d);
                CharSequence charSequence = aVar.f75838e;
                if (iD < 0 || iD > iD2 || iD2 > charSequence.length()) {
                    StringBuilder sbT = b.c0.t(iD, "start(", ") or end(", iD2, ") is out of range [0..");
                    sbT.append(charSequence.length());
                    sbT.append("], or start > end!");
                    s3.a.a(sbT.toString());
                }
                Path path = new Path();
                n3.k kVar = aVar.f75837d;
                kVar.f77764f.getSelectionPath(iD, iD2, path);
                int i5 = kVar.f77766h;
                if (i5 != 0 && !path.isEmpty()) {
                    path.offset(0.0f, i5);
                }
                float f11 = rVar.f75967f;
                long jFloatToRawIntBits = (Float.floatToRawIntBits(0.0f) << 32) | (Float.floatToRawIntBits(f11) & 4294967295L);
                Matrix matrix = new Matrix();
                matrix.setTranslate(Float.intBitsToFloat((int) (jFloatToRawIntBits >> 32)), Float.intBitsToFloat((int) (jFloatToRawIntBits & 4294967295L)));
                path.transform(matrix);
                Path path2 = hVar.f61117a;
                int i11 = (int) 0;
                path2.addPath(path, Float.intBitsToFloat(i11), Float.intBitsToFloat(i11));
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ o2(i2.h hVar, int i5, int i11) {
        this.f53816a = 2;
        this.f53818c = hVar;
        this.f53817b = i5;
        this.f53819d = i11;
    }
}
