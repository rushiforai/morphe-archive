package c4;

import java.util.UUID;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class f extends Lambda implements Function0 {

    /* renamed from: k, reason: collision with root package name */
    public static final f f19593k;

    /* renamed from: l, reason: collision with root package name */
    public static final f f19594l;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f19595j;

    static {
        int i5 = 0;
        f19593k = new f(i5, 0);
        f19594l = new f(i5, 1);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ f(int i5, int i11) {
        super(i5);
        this.f19595j = i11;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f19595j) {
        }
        return UUID.randomUUID();
    }
}
