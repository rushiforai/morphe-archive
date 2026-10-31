package dk;

import android.os.Handler;
import android.os.Message;
import b.u4;

/* loaded from: classes3.dex */
public final class a implements Handler.Callback {
    @Override // android.os.Handler.Callback
    public final boolean handleMessage(Message message) {
        int i5 = message.what;
        if (i5 == 0) {
            throw u4.d(message.obj);
        }
        if (i5 != 1) {
            return false;
        }
        throw u4.d(message.obj);
    }
}
