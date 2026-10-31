package pg;

import android.content.Context;
import android.content.Intent;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import com.google.android.gms.internal.measurement.z6;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes3.dex */
public final class g extends z6 {

    /* renamed from: b, reason: collision with root package name */
    public final Context f82571b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ b f82572c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(b bVar, Context context) {
        super(Looper.myLooper() == null ? Looper.getMainLooper() : Looper.myLooper(), 1);
        this.f82572c = bVar;
        this.f82571b = context.getApplicationContext();
    }

    @Override // com.google.android.gms.internal.measurement.z6, android.os.Handler
    public final void handleMessage(Message message) {
        int i5 = message.what;
        if (i5 != 1) {
            StringBuilder sb2 = new StringBuilder(String.valueOf(i5).length() + 39);
            sb2.append("Don't know how to handle this message: ");
            sb2.append(i5);
            Log.w("GoogleApiAvailability", sb2.toString());
            return;
        }
        int i11 = c.f82561a;
        b bVar = this.f82572c;
        Context context = this.f82571b;
        int iB = bVar.b(context, i11);
        AtomicBoolean atomicBoolean = e.f82564a;
        if (iB == 1 || iB == 2 || iB == 3 || iB == 9) {
            Intent intentA = bVar.a(context, iB, "n");
            bVar.g(context, iB, intentA == null ? null : n4.f.a(context, intentA));
        }
    }
}
