package com.google.android.libraries.places.internal;

import b.c0;
import b.u4;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.logging.Level;
import java.util.logging.Logger;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class zznb {
    public static String zza(String str) {
        if (zzms.zza(str)) {
            return null;
        }
        return str;
    }

    public static String zzb(String str, Object... objArr) {
        int length;
        int length2;
        int iIndexOf;
        String strN;
        int i5 = 0;
        int i11 = 0;
        while (true) {
            length = objArr.length;
            if (i11 >= length) {
                break;
            }
            Object obj = objArr[i11];
            if (obj == null) {
                strN = AbstractJsonLexerKt.NULL;
            } else {
                try {
                    strN = obj.toString();
                } catch (Exception e3) {
                    String strM = u4.m(obj.getClass().getName(), "@", Integer.toHexString(System.identityHashCode(obj)));
                    Logger.getLogger("com.google.common.base.Strings").logp(Level.WARNING, "com.google.common.base.Strings", "lenientToString", "Exception during lenientFormat for ".concat(strM), (Throwable) e3);
                    strN = c0.n("<", strM, " threw ", e3.getClass().getName(), ">");
                }
            }
            objArr[i11] = strN;
            i11++;
        }
        StringBuilder sb2 = new StringBuilder(str.length() + (length * 16));
        int i12 = 0;
        while (true) {
            length2 = objArr.length;
            if (i5 >= length2 || (iIndexOf = str.indexOf("%s", i12)) == -1) {
                break;
            }
            sb2.append((CharSequence) str, i12, iIndexOf);
            sb2.append(objArr[i5]);
            i5++;
            i12 = iIndexOf + 2;
        }
        sb2.append((CharSequence) str, i12, str.length());
        if (i5 < length2) {
            sb2.append(" [");
            sb2.append(objArr[i5]);
            for (int i13 = i5 + 1; i13 < objArr.length; i13++) {
                sb2.append(", ");
                sb2.append(objArr[i13]);
            }
            sb2.append(AbstractJsonLexerKt.END_LIST);
        }
        return sb2.toString();
    }

    public static String zzc(String str) {
        return str == null ? b.f42142b : str;
    }

    public static boolean zzd(String str) {
        return zzms.zza(str);
    }
}
