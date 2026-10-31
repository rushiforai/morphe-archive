package iy;

import com.vungle.ads.internal.protos.Sdk;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class j implements Function2 {

    /* renamed from: b, reason: collision with root package name */
    public static final j f68285b = new j(0);

    /* renamed from: c, reason: collision with root package name */
    public static final j f68286c = new j(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f68287a;

    public /* synthetic */ j(int i5) {
        this.f68287a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0021  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0053  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f68287a) {
            case 0:
                p1.o oVar = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        ky.l.i(6, 6, null, "When low contrast", null, oVar);
                    }
                }
                break;
            default:
                p1.o oVar2 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar2 = (p1.t) oVar2;
                    if (tVar2.E()) {
                        tVar2.V();
                    } else {
                        ky.l.a(2132020120, null, false, 2132017637, null, oVar2, 0, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
