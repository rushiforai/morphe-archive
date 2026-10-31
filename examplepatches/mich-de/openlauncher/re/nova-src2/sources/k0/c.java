package k0;

import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final /* synthetic */ class c implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f70574a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b2.i f70575b;

    public /* synthetic */ c(b2.i iVar, int i5) {
        this.f70574a = i5;
        this.f70575b = iVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f70574a) {
            case 0:
                return Integer.valueOf(this.f70575b.a(0, ((Integer) obj).intValue(), (y3.n) obj2));
            default:
                int i5 = (int) (((y3.m) obj).f96611a >> 32);
                return new y3.k((this.f70575b.a(0, i5, (y3.n) obj2) << 32) | (0 & 4294967295L));
        }
    }
}
