package w8;

import java.util.regex.Pattern;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;
import w20.h;
import x80.a0;
import x80.g;
import x80.z;

/* loaded from: classes2.dex */
public final class a extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f94095j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ b f94096k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ a(b bVar, int i5) {
        super(0);
        this.f94095j = i5;
        this.f94096k = bVar;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        int i5 = this.f94095j;
        b bVar = this.f94096k;
        switch (i5) {
            case 0:
                g gVar = g.n;
                return h.o(bVar.f94102f);
            default:
                String strB = bVar.f94102f.b("Content-Type");
                if (strB == null) {
                    return null;
                }
                Pattern pattern = a0.f95396e;
                return z.b(strB);
        }
    }
}
