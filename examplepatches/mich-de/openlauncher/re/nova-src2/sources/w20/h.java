package w20;

import android.content.Context;
import android.content.Intent;
import android.content.pm.LauncherApps;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.pm.ShortcutInfo;
import android.database.Cursor;
import android.os.Process;
import android.os.UserHandle;
import android.os.UserManager;
import androidx.compose.ui.node.LayoutNode;
import androidx.work.impl.WorkDatabase;
import androidx.work.impl.WorkDatabase_Impl;
import cl.k0;
import com.android.launcher3.shortcuts.ShortcutKey;
import com.teslacoilsw.launcher.BulkAddAppActivity;
import com.teslacoilsw.launcher.util.NamedIntent;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import x80.h0;
import x80.m0;

/* loaded from: classes.dex */
public abstract class h {
    public static int a(int i5, int i11, int[] iArr) {
        int i12 = i5 - 1;
        int i13 = 0;
        while (i13 <= i12) {
            int i14 = (i13 + i12) >>> 1;
            int i15 = iArr[i14];
            if (i15 < i11) {
                i13 = i14 + 1;
            } else {
                if (i15 <= i11) {
                    return i14;
                }
                i12 = i14 - 1;
            }
        }
        return ~i13;
    }

    public static final void b(long j11) {
        y3.q[] qVarArr = y3.p.f96616b;
        if ((j11 & 1095216660480L) == 0) {
            y3.j.a("Cannot perform operation for Unspecified type.");
        }
    }

    public static final void c(long j11, long j12) {
        y3.q[] qVarArr = y3.p.f96616b;
        if ((j11 & 1095216660480L) == 0 || (1095216660480L & j12) == 0) {
            y3.j.a("Cannot perform operation for Unspecified type.");
        }
        if (y3.q.a(y3.p.b(j11), y3.p.b(j12))) {
            return;
        }
        y3.j.a("Cannot perform operation for " + ((Object) y3.q.b(y3.p.b(j11))) + " and " + ((Object) y3.q.b(y3.p.b(j12))));
    }

    public static final void d(WorkDatabase workDatabase, o7.c configuration, p7.n nVar) throws IOException {
        int i5;
        Intrinsics.g(workDatabase, "workDatabase");
        Intrinsics.g(configuration, "configuration");
        ArrayList arrayListT = ul.b.T(nVar);
        int i11 = 0;
        while (!arrayListT.isEmpty()) {
            List list = ((p7.n) b70.d.H0(arrayListT)).f82359e;
            Intrinsics.f(list, "current.work");
            List list2 = list;
            if ((list2 instanceof Collection) && list2.isEmpty()) {
                i5 = 0;
            } else {
                Iterator it = list2.iterator();
                i5 = 0;
                while (it.hasNext()) {
                    if (((o7.f0) it.next()).f79662b.f95180j.a() && (i5 = i5 + 1) < 0) {
                        ul.b.d0();
                        throw null;
                    }
                }
            }
            i11 += i5;
        }
        if (i11 == 0) {
            return;
        }
        x7.s sVarI = workDatabase.i();
        sVarI.getClass();
        androidx.room.t tVarC = androidx.room.t.c(0, "Select COUNT(*) FROM workspec WHERE LENGTH(content_uri_triggers)<>0 AND state NOT IN (2, 3, 5)");
        WorkDatabase_Impl workDatabase_Impl = sVarI.f95193a;
        workDatabase_Impl.assertNotSuspendingTransaction();
        Cursor cursorL = vm.d.l(workDatabase_Impl, tVarC, false);
        try {
            int i12 = cursorL.moveToFirst() ? cursorL.getInt(0) : 0;
            cursorL.close();
            tVarC.d();
            int i13 = configuration.f79630i;
            if (i12 + i11 > i13) {
                throw new IllegalArgumentException(b.c0.o(b.c0.t(i13, "Too many workers with contentUriTriggers are enqueued:\ncontentUriTrigger workers limit: ", ";\nalready enqueued count: ", i12, ";\ncurrent enqueue operation count: "), i11, ".\nTo address this issue you can: \n1. enqueue less workers or batch some of workers with content uri triggers together;\n2. increase limit via Configuration.Builder.setContentUriTriggerWorkersLimit;\nPlease beware that workers with content uri triggers immediately occupy slots in JobScheduler so no updates to content uris are missed."));
            }
        } catch (Throwable th2) {
            cursorL.close();
            tVarC.d();
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x008f A[PHI: r0
      0x008f: PHI (r0v5 android.os.UserHandle) = 
      (r0v0 android.os.UserHandle)
      (r0v0 android.os.UserHandle)
      (r0v0 android.os.UserHandle)
      (r0v0 android.os.UserHandle)
      (r0v7 android.os.UserHandle)
      (r0v7 android.os.UserHandle)
     binds: [B:5:0x001b, B:7:0x0022, B:9:0x0028, B:11:0x002e, B:21:0x006f, B:22:0x0071] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static NamedIntent e(Context context, Intent intent) {
        Intent intentE;
        UserHandle userHandleMyUserHandle = Process.myUserHandle();
        boolean zHasExtra = intent.hasExtra("android.content.pm.extra.PIN_ITEM_REQUEST");
        String strE0 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (zHasExtra) {
            LauncherApps.PinItemRequest pinItemRequest = (LauncherApps.PinItemRequest) intent.getParcelableExtra("android.content.pm.extra.PIN_ITEM_REQUEST");
            if (pinItemRequest != null) {
                boolean z11 = true;
                if (pinItemRequest.getRequestType() == 1 && pinItemRequest.isValid() && pinItemRequest.accept()) {
                    ShortcutInfo shortcutInfo = pinItemRequest.getShortcutInfo();
                    if (shortcutInfo != null) {
                        userHandleMyUserHandle = shortcutInfo.getUserHandle();
                        androidx.room.h hVar = new androidx.room.h(context, shortcutInfo.getUserHandle());
                        hVar.a(shortcutInfo.getPackage(), null);
                        Iterator<E> it = hVar.c(2).iterator();
                        while (it.hasNext()) {
                            if (Intrinsics.b(((ShortcutInfo) it.next()).getId(), shortcutInfo.getId())) {
                                break;
                            }
                        }
                        z11 = false;
                        if (!z11 && shortcutInfo != null) {
                            String string = k0.D(shortcutInfo).toString();
                            if (string != null) {
                                strE0 = r70.k.R0('$', 0, 6, string) >= 0 ? r70.j.E0(string, '$', '_') : string;
                            }
                            intentE = ShortcutKey.e(shortcutInfo);
                        }
                    } else {
                        z11 = false;
                        if (!z11) {
                            intentE = null;
                        }
                    }
                } else {
                    intentE = null;
                }
            }
        } else {
            String stringExtra = intent.getStringExtra("android.intent.extra.shortcut.NAME");
            if (stringExtra != null) {
                strE0 = r70.k.R0('$', 0, 6, stringExtra) >= 0 ? r70.j.E0(stringExtra, '$', '_') : stringExtra;
            }
            intentE = (Intent) intent.getParcelableExtra("android.intent.extra.shortcut.INTENT");
            if (m.b(intentE)) {
                Intent intent2 = new Intent("android.intent.action.CALL", intentE.getData());
                intent2.setFlags(intentE.getFlags() | 67108864);
                intentE = intent2;
            }
            if (intent.hasExtra("profile") && (userHandleMyUserHandle = (UserHandle) intent.getParcelableExtra("profile")) == null) {
                userHandleMyUserHandle = Process.myUserHandle();
            }
        }
        if (intentE == null) {
            return null;
        }
        return new NamedIntent(strE0, intentE, userHandleMyUserHandle);
    }

    public static final List f(Context context) {
        Intrinsics.d(context);
        PackageManager packageManager = context.getApplicationContext().getPackageManager();
        Intent intent = new Intent("android.intent.action.CREATE_SHORTCUT");
        intent.setClassName("com.teslacoilsw.launcher", BulkAddAppActivity.class.getName());
        ResolveInfo resolveInfoResolveActivity = packageManager.resolveActivity(intent, 0);
        Intrinsics.d(resolveInfoResolveActivity);
        return ul.b.P(new ja.e(resolveInfoResolveActivity.activityInfo));
    }

    public static final long g(double d5) {
        return m((float) d5, 8589934592L);
    }

    public static NamedIntent h() {
        return NamedIntent.f46367d;
    }

    public static final long i(double d5) {
        return m((float) d5, 4294967296L);
    }

    public static final long j(int i5) {
        return m(i5, 4294967296L);
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x0033  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean k(m0 m0Var, h0 request) {
        Intrinsics.g(request, "request");
        int i5 = m0Var.f95556d;
        if (i5 != 200 && i5 != 410 && i5 != 414 && i5 != 501 && i5 != 203 && i5 != 204) {
            if (i5 == 307) {
                String strB = m0Var.f95558f.b("Expires");
                if (strB == null) {
                    strB = null;
                }
                if (strB == null && m0Var.a().f95493c == -1 && !m0Var.a().f95496f && !m0Var.a().f95495e) {
                    return false;
                }
            } else if (i5 != 308 && i5 != 404 && i5 != 405) {
                switch (i5) {
                    case 300:
                    case 301:
                        break;
                    case 302:
                        break;
                    default:
                        return false;
                }
            }
        }
        return (m0Var.a().f95492b || request.a().f95492b) ? false : true;
    }

    public static boolean l(Context context) {
        return ((UserManager) context.getSystemService(UserManager.class)).isUserUnlocked();
    }

    public static final long m(float f11, long j11) {
        long jFloatToRawIntBits = j11 | (Float.floatToRawIntBits(f11) & 4294967295L);
        y3.q[] qVarArr = y3.p.f96616b;
        return jFloatToRawIntBits;
    }

    public static NamedIntent n(Context context, String str) throws URISyntaxException {
        int iR0 = r70.k.R0('$', 0, 6, str);
        if (iR0 < 0 || iR0 == str.length() - 1) {
            throw new URISyntaxException(str, "NamedIntents must contain $ separator followed by an intent Uri");
        }
        String strSubstring = str.substring(0, iR0);
        Intrinsics.f(strSubstring, "substring(...)");
        String strSubstring2 = str.substring(iR0 + 1);
        Intrinsics.f(strSubstring2, "substring(...)");
        Intent uri = Intent.parseUri(strSubstring2, 0);
        Long lV0 = r70.i.v0(r70.k.o1(str, ";end ", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b));
        UserHandle userHandleE = ((ja.h) ja.h.f69294h.h(context)).e(lV0 != null ? lV0.longValue() : -1L);
        if (userHandleE == null) {
            userHandleE = Process.myUserHandle();
        }
        return new NamedIntent(strSubstring, uri, userHandleE);
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0048  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static x80.g o(x80.u uVar) {
        int i5;
        int i11;
        String strSubstring;
        int length;
        x80.u headers = uVar;
        Intrinsics.g(headers, "headers");
        int size = headers.size();
        boolean z11 = true;
        boolean z12 = true;
        int i12 = 0;
        String str = null;
        boolean z13 = false;
        boolean z14 = false;
        int iW = -1;
        int iW2 = -1;
        boolean z15 = false;
        boolean z16 = false;
        boolean z17 = false;
        int iW3 = -1;
        int iW4 = -1;
        boolean z18 = false;
        boolean z19 = false;
        boolean z21 = false;
        while (i12 < size) {
            String strC = headers.c(i12);
            String strE = headers.e(i12);
            if (r70.j.B0(strC, "Cache-Control", z11)) {
                if (str == null) {
                    str = strE;
                }
                i5 = 0;
                while (i5 < strE.length()) {
                    int length2 = strE.length();
                    boolean z22 = z11;
                    int length3 = i5;
                    while (true) {
                        if (length3 >= length2) {
                            i11 = size;
                            length3 = strE.length();
                            break;
                        }
                        i11 = size;
                        if (r70.k.L0("=,;", strE.charAt(length3))) {
                            break;
                        }
                        length3++;
                        size = i11;
                    }
                    String strSubstring2 = strE.substring(i5, length3);
                    Intrinsics.f(strSubstring2, "this as java.lang.String…ing(startIndex, endIndex)");
                    String string = r70.k.u1(strSubstring2).toString();
                    if (length3 == strE.length() || strE.charAt(length3) == ',' || strE.charAt(length3) == ';') {
                        i5 = length3 + 1;
                        strSubstring = null;
                    } else {
                        int length4 = length3 + 1;
                        byte[] bArr = y80.c.f96853a;
                        int length5 = strE.length();
                        while (true) {
                            if (length4 >= length5) {
                                length4 = strE.length();
                                break;
                            }
                            char cCharAt = strE.charAt(length4);
                            int i13 = length5;
                            if (cCharAt != ' ' && cCharAt != '\t') {
                                break;
                            }
                            length4++;
                            length5 = i13;
                        }
                        if (length4 >= strE.length() || strE.charAt(length4) != '\"') {
                            int length6 = strE.length();
                            int i14 = length4;
                            while (true) {
                                if (i14 >= length6) {
                                    length = strE.length();
                                    break;
                                }
                                int i15 = length6;
                                int i16 = i14;
                                if (r70.k.L0(",;", strE.charAt(i14))) {
                                    length = i16;
                                    break;
                                }
                                i14 = i16 + 1;
                                length6 = i15;
                            }
                            String strSubstring3 = strE.substring(length4, length);
                            Intrinsics.f(strSubstring3, "this as java.lang.String…ing(startIndex, endIndex)");
                            String string2 = r70.k.u1(strSubstring3).toString();
                            i5 = length;
                            strSubstring = string2;
                        } else {
                            int i17 = length4 + 1;
                            int iR0 = r70.k.R0(AbstractJsonLexerKt.STRING, i17, 4, strE);
                            strSubstring = strE.substring(i17, iR0);
                            Intrinsics.f(strSubstring, "this as java.lang.String…ing(startIndex, endIndex)");
                            i5 = iR0 + 1;
                        }
                    }
                    if ("no-cache".equalsIgnoreCase(string)) {
                        z11 = z22;
                        z13 = z11;
                    } else if ("no-store".equalsIgnoreCase(string)) {
                        z11 = z22;
                        z14 = z11;
                    } else {
                        if ("max-age".equalsIgnoreCase(string)) {
                            iW = y80.c.w(-1, strSubstring);
                        } else if ("s-maxage".equalsIgnoreCase(string)) {
                            iW2 = y80.c.w(-1, strSubstring);
                        } else if ("private".equalsIgnoreCase(string)) {
                            z11 = z22;
                            z15 = z11;
                        } else if ("public".equalsIgnoreCase(string)) {
                            z11 = z22;
                            z16 = z11;
                        } else if ("must-revalidate".equalsIgnoreCase(string)) {
                            z11 = z22;
                            z17 = z11;
                        } else if ("max-stale".equalsIgnoreCase(string)) {
                            iW3 = y80.c.w(LayoutNode.NotPlacedPlaceOrder, strSubstring);
                        } else if ("min-fresh".equalsIgnoreCase(string)) {
                            iW4 = y80.c.w(-1, strSubstring);
                        } else if ("only-if-cached".equalsIgnoreCase(string)) {
                            z11 = z22;
                            z18 = z11;
                        } else if ("no-transform".equalsIgnoreCase(string)) {
                            z11 = z22;
                            z19 = z11;
                        } else if ("immutable".equalsIgnoreCase(string)) {
                            z11 = z22;
                            z21 = z11;
                        }
                        z11 = z22;
                    }
                    size = i11;
                }
                i12++;
                headers = uVar;
                z11 = z11;
                size = size;
            } else if (!r70.j.B0(strC, "Pragma", z11)) {
                i12++;
                headers = uVar;
                z11 = z11;
                size = size;
            }
            z12 = false;
            i5 = 0;
            while (i5 < strE.length()) {
            }
            i12++;
            headers = uVar;
            z11 = z11;
            size = size;
        }
        return new x80.g(z13, z14, iW, iW2, z15, z16, z17, iW3, iW4, z18, z19, z21, !z12 ? null : str);
    }

    public static int p(int i5) {
        return (int) (Integer.rotateLeft((int) (i5 * (-862048943)), 15) * 461845907);
    }

    public static int q(Object obj) {
        return p(obj == null ? 0 : obj.hashCode());
    }
}
