package v2;

import java.io.IOException;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import z.a1;
import z.u0;
import z.w0;

/* loaded from: classes2.dex */
public final class k0 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f91961j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Object f91962k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ k0(Object obj, int i5) {
        super(1);
        this.f91961j = i5;
        this.f91962k = obj;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        int i5 = this.f91961j;
        Object obj2 = this.f91962k;
        switch (i5) {
            case 0:
                Throwable th2 = (Throwable) obj;
                j0 j0Var = (j0) obj2;
                t70.m mVar = j0Var.f91949c;
                if (mVar != null) {
                    mVar.a(th2);
                }
                j0Var.f91949c = null;
                return Unit.f71706a;
            case 1:
                return obj == ((u0) obj2) ? "(this)" : String.valueOf(obj);
            case 2:
                return obj == ((w0) obj2) ? "(this)" : String.valueOf(obj);
            case 3:
                return obj == ((a1) obj2) ? "(this)" : String.valueOf(obj);
            default:
                IOException it = (IOException) obj;
                Intrinsics.g(it, "it");
                byte[] bArr = y80.c.f96853a;
                ((z80.f) obj2).f98339j = true;
                return Unit.f71706a;
        }
    }
}
