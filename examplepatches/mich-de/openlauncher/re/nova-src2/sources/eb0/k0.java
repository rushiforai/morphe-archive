package eb0;

import java.lang.reflect.Method;
import java.lang.reflect.Parameter;

/* loaded from: classes5.dex */
public final class k0 extends a {

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ int f52573h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ k0(int i5) {
        super(false, 7);
        this.f52573h = i5;
    }

    @Override // eb0.a
    public String c(Method method, int i5) {
        switch (this.f52573h) {
            case 1:
                Parameter parameter = method.getParameters()[i5];
                if (!parameter.isNamePresent()) {
                    break;
                } else {
                    break;
                }
        }
        return super.c(method, i5);
    }

    @Override // eb0.a
    public final Object d(Method method, Class cls, Object obj, Object[] objArr) {
        switch (this.f52573h) {
        }
        return w0.k(method, cls, obj, objArr);
    }

    @Override // eb0.a
    public final boolean e(Method method) {
        switch (this.f52573h) {
        }
        return method.isDefault();
    }
}
