package og;

import android.content.Intent;
import android.os.Bundle;
import android.os.Looper;
import android.os.Message;
import android.os.Messenger;
import android.os.Parcelable;
import android.util.Log;
import com.google.android.gms.cloudmessaging.zzd;
import com.google.android.gms.internal.measurement.z6;
import java.util.Objects;
import java.util.regex.Matcher;
import z.c1;

/* loaded from: classes3.dex */
public final class h extends z6 {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ a f80410b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h(a aVar, Looper looper) {
        super(looper, 2, false);
        this.f80410b = aVar;
        Looper.getMainLooper();
    }

    @Override // com.google.android.gms.internal.measurement.z6, android.os.Handler
    public final void handleMessage(Message message) {
        a aVar = this.f80410b;
        aVar.getClass();
        if (message != null) {
            Object obj = message.obj;
            if (obj instanceof Intent) {
                Intent intent = (Intent) obj;
                intent.setExtrasClassLoader(new b());
                if (intent.hasExtra("google.messenger")) {
                    Parcelable parcelableExtra = intent.getParcelableExtra("google.messenger");
                    if (parcelableExtra instanceof zzd) {
                        aVar.f80387g = (zzd) parcelableExtra;
                    }
                    if (parcelableExtra instanceof Messenger) {
                        aVar.f80386f = (Messenger) parcelableExtra;
                    }
                }
                Intent intent2 = (Intent) message.obj;
                if (Objects.equals(intent2.getAction(), "com.google.android.c2dm.intent.REGISTRATION")) {
                    String stringExtra = intent2.getStringExtra("registration_id");
                    if (stringExtra == null) {
                        stringExtra = intent2.getStringExtra("unregistered");
                    }
                    if (stringExtra != null) {
                        Matcher matcher = a.f80380j.matcher(stringExtra);
                        if (matcher.matches()) {
                            String strGroup = matcher.group(1);
                            String strGroup2 = matcher.group(2);
                            if (strGroup != null) {
                                Bundle extras = intent2.getExtras();
                                extras.putString("registration_id", strGroup2);
                                aVar.a(strGroup, extras);
                                return;
                            }
                            return;
                        }
                        return;
                    }
                    String stringExtra2 = intent2.getStringExtra("error");
                    if (stringExtra2 == null) {
                        Log.w("Rpc", "Unexpected response, no error or registration id ".concat(String.valueOf(intent2.getExtras())));
                        return;
                    }
                    if (!stringExtra2.startsWith("|")) {
                        c1 c1Var = aVar.f80381a;
                        synchronized (c1Var) {
                            for (int i5 = 0; i5 < c1Var.f97753c; i5++) {
                                try {
                                    aVar.a((String) c1Var.f(i5), intent2.getExtras());
                                } catch (Throwable th2) {
                                    throw th2;
                                }
                            }
                        }
                        return;
                    }
                    String[] strArrSplit = stringExtra2.split("\\|");
                    if (strArrSplit.length <= 2 || !Objects.equals(strArrSplit[1], "ID")) {
                        Log.w("Rpc", "Unexpected structured response ".concat(stringExtra2));
                        return;
                    }
                    String str = strArrSplit[2];
                    String strSubstring = strArrSplit[3];
                    if (strSubstring.startsWith(":")) {
                        strSubstring = strSubstring.substring(1);
                    }
                    aVar.a(str, intent2.putExtra("error", strSubstring).getExtras());
                    return;
                }
                return;
            }
        }
        Log.w("Rpc", "Dropping invalid message");
    }
}
