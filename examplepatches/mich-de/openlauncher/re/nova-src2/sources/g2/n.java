package g2;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class n extends Lambda implements Function1 {

    /* renamed from: k, reason: collision with root package name */
    public static final n f56882k;

    /* renamed from: l, reason: collision with root package name */
    public static final n f56883l;

    /* renamed from: m, reason: collision with root package name */
    public static final n f56884m;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f56885j;

    static {
        int i5 = 1;
        f56882k = new n(i5, 0);
        f56883l = new n(i5, 1);
        f56884m = new n(i5, 2);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n() {
        super(1);
        this.f56885j = 3;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f56885j) {
            case 0:
                break;
            case 1:
                break;
        }
        return Boolean.valueOf(((z) obj).H(7));
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ n(int i5, int i11) {
        super(i5);
        this.f56885j = i11;
    }
}
