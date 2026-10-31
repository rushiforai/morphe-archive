package c3;

import android.view.View;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class y extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f19471j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ int f19472k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ y(int i5, int i11) {
        super(1);
        this.f19471j = i11;
        this.f19472k = i5;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f19471j) {
            case 0:
                return Boolean.valueOf(((g2.z) obj).H(this.f19472k));
            case 1:
                return Boolean.valueOf(((View) obj).getId() == this.f19472k);
            default:
                return Boolean.valueOf(((g2.z) obj).H(this.f19472k));
        }
    }
}
