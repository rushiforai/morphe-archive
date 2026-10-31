package lh;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;

/* loaded from: classes.dex */
public class i extends Handler {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f74950a;

    @Override // android.os.Handler
    public void handleMessage(Message message) {
        switch (this.f74950a) {
            case 1:
                if (message.what != 1) {
                    super.handleMessage(message);
                    break;
                } else {
                    py.c.f83128b.getClass();
                    py.c.a();
                    break;
                }
            default:
                super.handleMessage(message);
                break;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ i(Looper looper, int i5) {
        super(looper);
        this.f74950a = i5;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ i(Looper looper, Handler.Callback callback) {
        super(looper, callback);
        this.f74950a = 0;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(Looper looper) {
        super(looper);
        this.f74950a = 0;
        Looper.getMainLooper();
    }
}
