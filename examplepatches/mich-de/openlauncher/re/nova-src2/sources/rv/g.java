package rv;

import android.os.Debug;
import com.stripe.android.stripe3ds2.init.Warning;

/* loaded from: classes4.dex */
public final class g extends l {

    /* renamed from: c, reason: collision with root package name */
    public static final Warning f86438c = new Warning("SW04", "A debugger is attached to the App.", m.f86446a);

    /* renamed from: b, reason: collision with root package name */
    public final boolean f86439b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g() {
        super(f86438c);
        boolean zIsDebuggerConnected = Debug.isDebuggerConnected();
        this.f86439b = zIsDebuggerConnected;
    }

    @Override // rv.l
    public final boolean a() {
        return this.f86439b;
    }
}
