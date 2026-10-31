package ex;

import android.os.Handler;
import android.os.HandlerThread;
import android.os.Process;
import android.text.TextUtils;
import android.util.Log;
import b.c0;
import b.u4;
import h6.c1;
import java.io.IOException;
import java.util.IllegalFormatException;
import java.util.Iterator;
import java.util.Locale;
import java.util.Objects;
import kotlin.jvm.internal.Intrinsics;
import ni.g0;
import org.json.JSONObject;
import sp.h0;
import sp.r0;

/* loaded from: classes4.dex */
public final class a implements ni.z, qh.b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f53056a;

    /* renamed from: b, reason: collision with root package name */
    public String f53057b;

    public /* synthetic */ a(String str, int i5, boolean z11) {
        this.f53056a = i5;
        this.f53057b = str;
    }

    public static a d() {
        return new a(", ", 9, false);
    }

    public static a f(com.google.android.gms.internal.consent_sdk.a aVar) {
        String str;
        aVar.Z(2);
        int iN = aVar.N();
        int i5 = iN >> 1;
        int iN2 = ((aVar.N() >> 3) & 31) | ((iN & 1) << 5);
        if (i5 == 4 || i5 == 5 || i5 == 7) {
            str = "dvhe";
        } else if (i5 == 8) {
            str = "hev1";
        } else {
            if (i5 != 9) {
                return null;
            }
            str = "avc3";
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(str);
        sb2.append(".0");
        sb2.append(i5);
        return new a(c0.p(sb2, iN2 >= 10 ? "." : ".0", iN2), 10, false);
    }

    public static String l(String str, String str2, Object... objArr) {
        if (objArr.length > 0) {
            try {
                str2 = String.format(Locale.US, str2, objArr);
            } catch (IllegalFormatException e3) {
                Log.e("PlayCore", "Unable to format ".concat(String.valueOf(str2)), e3);
                str2 = a80.m.h(str2, " [", TextUtils.join(", ", objArr), "]");
            }
        }
        return u4.m(str, " : ", str2);
    }

    public static String m(String str, String str2, Object... objArr) {
        if (objArr.length > 0) {
            try {
                str2 = String.format(Locale.US, str2, objArr);
            } catch (IllegalFormatException e3) {
                Log.e("PlayCore", "Unable to format ".concat(str2), e3);
                str2 = a80.m.h(str2, " [", TextUtils.join(", ", objArr), "]");
            }
        }
        return u4.m(str, " : ", str2);
    }

    public void a(StringBuilder sb2, Iterator it) {
        try {
            if (it.hasNext()) {
                Object next = it.next();
                Objects.requireNonNull(next);
                sb2.append(next instanceof CharSequence ? (CharSequence) next : next.toString());
                while (it.hasNext()) {
                    sb2.append((CharSequence) this.f53057b);
                    Object next2 = it.next();
                    Objects.requireNonNull(next2);
                    sb2.append(next2 instanceof CharSequence ? (CharSequence) next2 : next2.toString());
                }
            }
        } catch (IOException e3) {
            throw new AssertionError(e3);
        }
    }

    public void b(StringBuilder sb2, vk.r rVar) {
        a(sb2, rVar.iterator());
    }

    public String c(Object obj) {
        String string = obj.toString();
        if (string != null && string.length() != 0) {
            int length = string.length();
            int iCharCount = 0;
            while (iCharCount < length) {
                int iCodePointAt = string.codePointAt(iCharCount);
                if (Character.isLetterOrDigit(iCodePointAt)) {
                    iCharCount += Character.charCount(iCodePointAt);
                }
            }
            return this.f53057b + obj;
        }
        throw new IllegalArgumentException(c0.k("Invalid key: ", string));
    }

    @Override // ni.z
    public void e(String preloadId) {
        Intrinsics.g(preloadId, "preloadId");
    }

    public void g(String str) {
        if (Log.isLoggable("PlayCore", 5)) {
            Log.w("PlayCore", this.f53057b + " : " + str);
        }
    }

    public void h(String str, Object... objArr) {
        if (Log.isLoggable("PlayCore", 4)) {
            Log.i("PlayCore", l(this.f53057b, str, objArr));
        }
    }

    public void i(String str, Object... objArr) {
        switch (this.f53056a) {
            case 2:
                if (Log.isLoggable("PlayCore", 4)) {
                    Log.i("PlayCore", m(this.f53057b, str, objArr));
                    break;
                }
                break;
            default:
                if (Log.isLoggable("PlayCore", 5)) {
                    Log.w("PlayCore", l(this.f53057b, str, objArr));
                    break;
                }
                break;
        }
    }

    @Override // ni.z
    public void j(String preloadId, ni.v vVar) {
        Intrinsics.g(preloadId, "preloadId");
        Log.w("NovaAds", "Banner preload failed: " + this.f53057b + " code=" + vVar.getCode() + " msg=" + vVar.getMessage());
    }

    @Override // ni.z
    public void k(String preloadId, g0 responseInfo) {
        Intrinsics.g(preloadId, "preloadId");
        Intrinsics.g(responseInfo, "responseInfo");
    }

    @Override // qh.b
    public Object zza() {
        HandlerThread handlerThread = new HandlerThread(this.f53057b, 10);
        handlerThread.start();
        return new Handler(handlerThread.getLooper());
    }

    public a(int i5) {
        this.f53056a = i5;
        switch (i5) {
            case 7:
                break;
            default:
                this.f53057b = c1.n(Process.myUid(), "UID: [", "]  PID: [", Process.myPid(), "] ").concat("PhoneskyVerificationUtils");
                break;
        }
    }

    public a(String adUnitId, int i5) {
        this.f53056a = i5;
        switch (i5) {
            case 1:
                this.f53057b = adUnitId.concat("_");
                break;
            case 2:
                this.f53057b = c1.n(Process.myUid(), "UID: [", "]  PID: [", Process.myPid(), "] ").concat(adUnitId);
                break;
            case 3:
            case 4:
            default:
                Intrinsics.g(adUnitId, "adUnitId");
                this.f53057b = adUnitId;
                break;
            case 5:
                this.f53057b = c1.n(Process.myUid(), "UID: [", "]  PID: [", Process.myPid(), "] ").concat(adUnitId);
                break;
        }
    }

    public a(JSONObject jSONObject) {
        this.f53056a = 6;
        try {
            if (jSONObject.has("sdid")) {
                this.f53057b = jSONObject.getString("sdid");
            }
        } catch (Throwable th2) {
            int i5 = h0.f87584e;
            r0.c(th2);
        }
    }
}
