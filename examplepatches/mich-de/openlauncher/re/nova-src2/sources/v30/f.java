package v30;

import android.app.Activity;
import android.content.Context;
import android.os.Handler;
import android.os.Message;
import b.u4;
import java.lang.ref.WeakReference;

/* loaded from: classes.dex */
public final class f implements Handler.Callback {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f92053a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final Object f92054b;

    public f(Handler.Callback callback) {
        this.f92054b = new WeakReference(callback);
    }

    @Override // android.os.Handler.Callback
    public final boolean handleMessage(Message message) {
        switch (this.f92053a) {
            case 0:
                Handler.Callback callback = (Handler.Callback) ((WeakReference) this.f92054b).get();
                if (callback != null) {
                    return callback.handleMessage(message);
                }
                return false;
            default:
                int i5 = message.what;
                if (i5 == 2) {
                    ((Activity) message.obj).setRequestedOrientation(message.arg1);
                    return true;
                }
                if (i5 != 3) {
                    return false;
                }
                throw u4.d(message.obj);
        }
    }

    public f(Context context) {
        this.f92054b = context;
    }
}
