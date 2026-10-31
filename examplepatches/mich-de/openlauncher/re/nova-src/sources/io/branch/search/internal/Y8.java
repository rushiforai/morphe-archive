package io.branch.search.internal;

import android.util.Log;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class Y8 implements InterfaceC3148f9 {

    public /* synthetic */ class a {

        /* renamed from: a, reason: collision with root package name */
        public static final /* synthetic */ int[] f63749a;

        static {
            int[] iArr = new int[a50.b.values().length];
            iArr[0] = 1;
            iArr[1] = 2;
            iArr[2] = 3;
            iArr[3] = 4;
            f63749a = iArr;
        }
    }

    @Override // io.branch.search.internal.InterfaceC3148f9
    public final void a(@NotNull AbstractC3080b9 message) {
        Intrinsics.g(message, "message");
        int i5 = a.f63749a[message.f64019a.ordinal()];
        if (i5 == 1) {
            Z8.a(message);
            message.a();
            return;
        }
        String str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (i5 == 2) {
            String strA = Z8.a(message);
            String strA2 = message.a();
            Throwable th2 = message.f64021c;
            if (th2 != null) {
                Log.i(strA, strA2, th2);
                return;
            }
            if (strA2 != null) {
                str = strA2;
            }
            Log.i(strA, str);
            return;
        }
        if (i5 == 3) {
            String strA3 = Z8.a(message);
            String strA4 = message.a();
            Throwable th3 = message.f64021c;
            if (th3 != null) {
                Log.w(strA3, strA4, th3);
                return;
            }
            if (strA4 != null) {
                str = strA4;
            }
            Log.w(strA3, str);
            return;
        }
        if (i5 != 4) {
            return;
        }
        String strA5 = Z8.a(message);
        String strA6 = message.a();
        Throwable th4 = message.f64021c;
        if (th4 != null) {
            Log.e(strA5, strA6, th4);
            return;
        }
        if (strA6 != null) {
            str = strA6;
        }
        Log.e(strA5, str);
    }
}
