package z2;

import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class p {

    /* renamed from: a, reason: collision with root package name */
    public final Function2 f98126a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f98127b;

    public p(Function2 function2, int i5) {
        this.f98127b = i5;
        this.f98126a = function2;
    }

    public final float a(float f11, y yVar, y yVar2) {
        switch (this.f98127b) {
            case 0:
                return Float.intBitsToFloat((int) (yVar2.m(yVar, (Float.floatToRawIntBits(((int) (yVar.g() >> 32)) / 2.0f) << 32) | (Float.floatToRawIntBits(f11) & 4294967295L)) & 4294967295L));
            default:
                float fG = ((int) (yVar.g() & 4294967295L)) / 2.0f;
                return Float.intBitsToFloat((int) (yVar2.m(yVar, (Float.floatToRawIntBits(fG) & 4294967295L) | (Float.floatToRawIntBits(f11) << 32)) >> 32));
        }
    }

    public final Function2 b() {
        return this.f98126a;
    }
}
