package wf;

import android.os.Message;
import java.util.ArrayList;

/* loaded from: classes3.dex */
public final class r {

    /* renamed from: a, reason: collision with root package name */
    public Message f94368a;

    public final void a() {
        this.f94368a = null;
        ArrayList arrayList = s.f94369b;
        synchronized (arrayList) {
            try {
                if (arrayList.size() < 50) {
                    arrayList.add(this);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void b() {
        Message message = this.f94368a;
        message.getClass();
        message.sendToTarget();
        a();
    }
}
