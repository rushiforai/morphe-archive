package c3;

import android.os.Build;
import android.view.View;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.FunctionReferenceImpl;

/* loaded from: classes.dex */
public final /* synthetic */ class s extends FunctionReferenceImpl implements Function0 {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f19418d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ s(int i5, Object obj, Class cls, String str, String str2, int i11, int i12) {
        super(i5, i11, cls, obj, str, str2);
        this.f19418d = i12;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f19418d) {
            case 0:
                View view = (View) this.receiver;
                int i5 = Build.VERSION.SDK_INT;
                if (i5 >= 30) {
                    a5.m.b(view);
                }
                if (i5 >= 29 && (r1 = f3.a.a(view)) != null) {
                    break;
                }
                break;
            case 1:
                break;
            case 2:
                ((g.a0) this.receiver).f();
                break;
            default:
                ((g.a0) this.receiver).f();
                break;
        }
        return Unit.f71706a;
    }
}
