package h;

import java.util.UUID;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class c extends Lambda implements Function0 {

    /* renamed from: k, reason: collision with root package name */
    public static final c f58692k;

    /* renamed from: l, reason: collision with root package name */
    public static final c f58693l;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f58694j;

    static {
        int i5 = 0;
        f58692k = new c(i5, 0);
        f58693l = new c(i5, 1);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ c(int i5, int i11) {
        super(i5);
        this.f58694j = i11;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f58694j) {
            case 0:
                return UUID.randomUUID().toString();
            default:
                return null;
        }
    }
}
