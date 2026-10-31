package p6;

import android.os.Bundle;
import com.amplitude.android.migration.DatabaseConstants;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public final class r0 extends x0 {

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ int f82246l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ r0(boolean z11, int i5) {
        super(z11);
        this.f82246l = i5;
    }

    @Override // p6.x0
    public final Object a(String str, Bundle bundle) {
        switch (this.f82246l) {
            case 0:
                return (Boolean) fq.c.c(bundle, "bundle", str, DatabaseConstants.KEY_FIELD, str);
            case 1:
                Object objC = fq.c.c(bundle, "bundle", str, DatabaseConstants.KEY_FIELD, str);
                Intrinsics.e(objC, "null cannot be cast to non-null type kotlin.Float");
                return (Float) objC;
            case 2:
                Object objC2 = fq.c.c(bundle, "bundle", str, DatabaseConstants.KEY_FIELD, str);
                Intrinsics.e(objC2, "null cannot be cast to non-null type kotlin.Int");
                return (Integer) objC2;
            case 3:
                Object objC3 = fq.c.c(bundle, "bundle", str, DatabaseConstants.KEY_FIELD, str);
                Intrinsics.e(objC3, "null cannot be cast to non-null type kotlin.Long");
                return (Long) objC3;
            default:
                return (String) fq.c.c(bundle, "bundle", str, DatabaseConstants.KEY_FIELD, str);
        }
    }

    @Override // p6.x0
    public final String b() {
        switch (this.f82246l) {
            case 0:
                return "boolean";
            case 1:
                return "float";
            case 2:
                return "integer";
            case 3:
                return "long";
            default:
                return "string";
        }
    }

    @Override // p6.x0
    public final Object d(String str) throws NumberFormatException {
        boolean z11;
        int i5;
        String strSubstring;
        long j11;
        switch (this.f82246l) {
            case 0:
                if (str.equals(InneractiveMediationDefs.SHOW_HOUSE_AD_YES)) {
                    z11 = true;
                } else {
                    if (!str.equals("false")) {
                        throw new IllegalArgumentException("A boolean NavType only accepts \"true\" or \"false\" values.");
                    }
                    z11 = false;
                }
                return Boolean.valueOf(z11);
            case 1:
                return Float.valueOf(Float.parseFloat(str));
            case 2:
                if (r70.j.I0(str, "0x", false)) {
                    String strSubstring2 = str.substring(2);
                    Intrinsics.f(strSubstring2, "substring(...)");
                    kotlin.text.a.a(16);
                    i5 = Integer.parseInt(strSubstring2, 16);
                } else {
                    i5 = Integer.parseInt(str);
                }
                return Integer.valueOf(i5);
            case 3:
                if (r70.j.A0(str, "L", false)) {
                    strSubstring = str.substring(0, str.length() - 1);
                    Intrinsics.f(strSubstring, "substring(...)");
                } else {
                    strSubstring = str;
                }
                if (r70.j.I0(str, "0x", false)) {
                    String strSubstring3 = strSubstring.substring(2);
                    Intrinsics.f(strSubstring3, "substring(...)");
                    kotlin.text.a.a(16);
                    j11 = Long.parseLong(strSubstring3, 16);
                } else {
                    j11 = Long.parseLong(strSubstring);
                }
                return Long.valueOf(j11);
            default:
                if (str.equals(AbstractJsonLexerKt.NULL)) {
                    return null;
                }
                return str;
        }
    }

    @Override // p6.x0
    public final void e(Bundle bundle, String key, Object obj) {
        switch (this.f82246l) {
            case 0:
                boolean zBooleanValue = ((Boolean) obj).booleanValue();
                Intrinsics.g(key, "key");
                bundle.putBoolean(key, zBooleanValue);
                break;
            case 1:
                float fFloatValue = ((Number) obj).floatValue();
                Intrinsics.g(key, "key");
                bundle.putFloat(key, fFloatValue);
                break;
            case 2:
                int iIntValue = ((Number) obj).intValue();
                Intrinsics.g(key, "key");
                bundle.putInt(key, iIntValue);
                break;
            case 3:
                long jLongValue = ((Number) obj).longValue();
                Intrinsics.g(key, "key");
                bundle.putLong(key, jLongValue);
                break;
            default:
                Intrinsics.g(key, "key");
                bundle.putString(key, (String) obj);
                break;
        }
    }
}
