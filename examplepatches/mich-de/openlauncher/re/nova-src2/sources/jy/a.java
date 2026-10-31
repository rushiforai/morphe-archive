package jy;

import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import l1.g9;
import p1.o;
import p1.t;

/* loaded from: classes4.dex */
public final class a implements Function3 {

    /* renamed from: b, reason: collision with root package name */
    public static final a f70432b = new a(0);

    /* renamed from: c, reason: collision with root package name */
    public static final a f70433c = new a(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f70434a;

    public /* synthetic */ a(int i5) {
        this.f70434a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x002b  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x007e  */
    @Override // kotlin.jvm.functions.Function3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        switch (this.f70434a) {
            case 0:
                o oVar = (o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    t tVar = (t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        g9.b(x7.f.Y(oVar, 17039370), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar, 0, 0, 131070);
                    }
                }
                break;
            default:
                o oVar2 = (o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    t tVar2 = (t) oVar2;
                    if (tVar2.E()) {
                        tVar2.V();
                    } else {
                        g9.b(x7.f.Y(oVar2, 17039360), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar2, 0, 0, 131070);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
