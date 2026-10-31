package ads_mobile_sdk;

import android.content.Context;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class ma2 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ pa2 f7063a;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f7064j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ma2(pa2 pa2Var, int i5) {
        super(0);
        this.f7064j = i5;
        this.f7063a = pa2Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        sa2 sa2Var;
        ua2 ua2Var;
        switch (this.f7064j) {
            case 0:
                return yy0.a(this.f7063a.f8144b);
            case 1:
                Context context = this.f7063a.f8144b;
                sa2 sa2Var2 = sa2.f9474h;
                synchronized (sa2.class) {
                    try {
                        if (sa2.f9474h == null) {
                            sa2.f9474h = new sa2(context);
                        }
                        sa2Var = sa2.f9474h;
                    } finally {
                    }
                }
                return sa2Var;
            default:
                Context context2 = this.f7063a.f8144b;
                ua2 ua2Var2 = ua2.f10258h;
                synchronized (ua2.class) {
                    try {
                        if (ua2.f10258h == null) {
                            ua2.f10258h = new ua2(context2, "paidv2_id", "paidv2_creation_time", "PaidV2LifecycleImpl");
                        }
                        ua2Var = ua2.f10258h;
                    } finally {
                    }
                }
                return ua2Var;
        }
    }
}
