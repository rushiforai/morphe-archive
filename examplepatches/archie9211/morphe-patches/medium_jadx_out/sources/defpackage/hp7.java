package defpackage;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.os.Build;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.FujifilmMakernoteDirectory;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.google.android.gms.common.api.Status;
import com.medium.android.graphql.fragment.TagData;
import com.medium.reader.R;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class hp7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;
    public static final /* synthetic */ int c = 0;
    public static final /* synthetic */ int d = 0;
    public static final /* synthetic */ int e = 0;

    public static Intent A(i10 i10Var) {
        Intent parentActivityIntent = i10Var.getParentActivityIntent();
        if (parentActivityIntent != null) {
            return parentActivityIntent;
        }
        try {
            String strC = C(i10Var, i10Var.getComponentName());
            if (strC == null) {
                return null;
            }
            ComponentName componentName = new ComponentName(i10Var, strC);
            try {
                return C(i10Var, componentName) == null ? Intent.makeMainActivity(componentName) : new Intent().setComponent(componentName);
            } catch (PackageManager.NameNotFoundException unused) {
                Log.e("NavUtils", "getParentActivityIntent: bad parentActivityName '" + strC + "' in manifest");
                return null;
            }
        } catch (PackageManager.NameNotFoundException e2) {
            throw new IllegalArgumentException(e2);
        }
    }

    public static Intent B(Context context, ComponentName componentName) throws PackageManager.NameNotFoundException {
        String strC = C(context, componentName);
        if (strC == null) {
            return null;
        }
        ComponentName componentName2 = new ComponentName(componentName.getPackageName(), strC);
        return C(context, componentName2) == null ? Intent.makeMainActivity(componentName2) : new Intent().setComponent(componentName2);
    }

    public static String C(Context context, ComponentName componentName) throws PackageManager.NameNotFoundException {
        String string;
        PackageManager packageManager = context.getPackageManager();
        int i = Build.VERSION.SDK_INT;
        ActivityInfo activityInfo = packageManager.getActivityInfo(componentName, i >= 29 ? 269222528 : i >= 24 ? 787072 : OlympusMakernoteDirectory.TAG_PREVIEW_IMAGE);
        String str = activityInfo.parentActivityName;
        if (str != null) {
            return str;
        }
        Bundle bundle = activityInfo.metaData;
        if (bundle == null || (string = bundle.getString("android.support.PARENT_ACTIVITY")) == null) {
            return null;
        }
        if (string.charAt(0) != '.') {
            return string;
        }
        return context.getPackageName() + string;
    }

    /* JADX WARN: Failed to find 'out' block for switch in B:44:0x00f7. Please report as an issue. */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:95:0x01d5  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x01db  */
    /* JADX WARN: Type inference failed for: r0v20 */
    /* JADX WARN: Type inference failed for: r0v21, types: [java.util.Map] */
    /* JADX WARN: Type inference failed for: r0v24 */
    /* JADX WARN: Type inference failed for: r13v0 */
    /* JADX WARN: Type inference failed for: r13v1, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r13v10 */
    /* JADX WARN: Type inference failed for: r13v11 */
    /* JADX WARN: Type inference failed for: r13v12 */
    /* JADX WARN: Type inference failed for: r13v13 */
    /* JADX WARN: Type inference failed for: r13v14 */
    /* JADX WARN: Type inference failed for: r13v15 */
    /* JADX WARN: Type inference failed for: r13v16 */
    /* JADX WARN: Type inference failed for: r13v17 */
    /* JADX WARN: Type inference failed for: r13v2 */
    /* JADX WARN: Type inference failed for: r13v3 */
    /* JADX WARN: Type inference failed for: r13v8 */
    /* JADX WARN: Type inference failed for: r13v9 */
    /* JADX WARN: Type inference failed for: r14v0 */
    /* JADX WARN: Type inference failed for: r14v1, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r14v10 */
    /* JADX WARN: Type inference failed for: r14v2 */
    /* JADX WARN: Type inference failed for: r14v5 */
    /* JADX WARN: Type inference failed for: r14v6 */
    /* JADX WARN: Type inference failed for: r14v7 */
    /* JADX WARN: Type inference failed for: r14v8 */
    /* JADX WARN: Type inference failed for: r14v9 */
    /* JADX WARN: Type inference failed for: r15v0 */
    /* JADX WARN: Type inference failed for: r15v1, types: [java.util.Map] */
    /* JADX WARN: Type inference failed for: r15v10 */
    /* JADX WARN: Type inference failed for: r15v11 */
    /* JADX WARN: Type inference failed for: r15v12 */
    /* JADX WARN: Type inference failed for: r15v13 */
    /* JADX WARN: Type inference failed for: r15v2 */
    /* JADX WARN: Type inference failed for: r15v3 */
    /* JADX WARN: Type inference failed for: r15v4 */
    /* JADX WARN: Type inference failed for: r15v5 */
    /* JADX WARN: Type inference failed for: r15v6 */
    /* JADX WARN: Type inference failed for: r15v7 */
    /* JADX WARN: Type inference failed for: r15v8 */
    /* JADX WARN: Type inference failed for: r15v9 */
    /* JADX WARN: Type inference failed for: r16v0 */
    /* JADX WARN: Type inference failed for: r16v1, types: [java.util.LinkedHashMap] */
    /* JADX WARN: Type inference failed for: r16v2 */
    /* JADX WARN: Type inference failed for: r16v3 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static defpackage.j00 D(defpackage.fd6 r18, defpackage.hv8 r19, java.util.UUID r20, defpackage.yl2 r21, java.util.Set r22) {
        /*
            Method dump skipped, instruction units count: 614
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hp7.D(fd6, hv8, java.util.UUID, yl2, java.util.Set):j00");
    }

    public static final Object E(Object[] objArr, m45 m45Var, x12 x12Var, int i) {
        return G(Arrays.copyOf(objArr, objArr.length), o7f.p, m45Var, x12Var, ((i << 6) & 7168) | 384, 0);
    }

    public static final Object F(Object[] objArr, kpb kpbVar, m45 m45Var, x12 x12Var, int i) {
        return G(Arrays.copyOf(objArr, objArr.length), kpbVar, m45Var, x12Var, 384 | ((i << 3) & 7168), 0);
    }

    public static final Object G(Object[] objArr, kpb kpbVar, m45 m45Var, x12 x12Var, int i, int i2) {
        Object[] objArr2;
        kpb kpbVar2;
        Object obj;
        Object objD;
        p65 p65Var = (p65) x12Var;
        long j = p65Var.T;
        kyd.I(36);
        String string = Long.toString(j, 36);
        string.getClass();
        kpbVar.getClass();
        qob qobVar = (qob) p65Var.j(sob.a);
        Object objM = p65Var.M();
        uob uobVar = w12.a;
        if (objM == uobVar) {
            Object objA = (qobVar == null || (objD = qobVar.d(string)) == null) ? null : kpbVar.a(objD);
            if (objA == null) {
                objA = m45Var.invoke();
            }
            objArr2 = objArr;
            kpbVar2 = kpbVar;
            mob mobVar = new mob(kpbVar2, qobVar, string, objA, objArr2);
            p65Var.j0(mobVar);
            objM = mobVar;
        } else {
            objArr2 = objArr;
            kpbVar2 = kpbVar;
        }
        mob mobVar2 = (mob) objM;
        Object objInvoke = Arrays.equals(objArr2, mobVar2.e) ? mobVar2.d : null;
        if (objInvoke == null) {
            objInvoke = m45Var.invoke();
        }
        boolean zH = p65Var.h(mobVar2) | ((((i & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) ^ 48) > 32 && p65Var.h(kpbVar2)) || (i & 48) == 32) | p65Var.h(qobVar) | p65Var.f(string) | p65Var.h(objInvoke) | p65Var.h(objArr2);
        Object objM2 = p65Var.M();
        if (zH || objM2 == uobVar) {
            Object[] objArr3 = objArr2;
            obj = objInvoke;
            k84 k84Var = new k84(mobVar2, kpbVar2, qobVar, string, obj, objArr3);
            p65Var.j0(k84Var);
            objM2 = k84Var;
        } else {
            obj = objInvoke;
        }
        kyd.v((m45) objM2, p65Var);
        return obj;
    }

    public static final long H(long j, long j2) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j2 >> 32)) * Float.intBitsToFloat((int) (j >> 32));
        return (((long) Float.floatToRawIntBits(Float.intBitsToFloat((int) (j2 & 4294967295L)) * Float.intBitsToFloat((int) (j & 4294967295L)))) & 4294967295L) | (Float.floatToRawIntBits(fIntBitsToFloat) << 32);
    }

    public static final mn1 I(String str) {
        boolean zN = tuc.N(str, ".", false);
        if (zN) {
            str = str.substring(1);
        }
        int iD0 = muc.d0(str, '/', 0, 6);
        String strReplace = (iD0 == -1 ? "" : str.substring(0, iD0)).replace('/', '.');
        strReplace.getClass();
        return new mn1(new y05(strReplace), new y05(muc.t0('/', str, str)), zN);
    }

    public static final yod J(TagData tagData) {
        String id = tagData.getId();
        String normalizedTagSlug = tagData.getNormalizedTagSlug();
        String displayTitle = tagData.getDisplayTitle();
        if (displayTitle == null) {
            displayTitle = "";
        }
        Integer followerCount = tagData.getFollowerCount();
        int iIntValue = followerCount != null ? followerCount.intValue() : 0;
        Long postCount = tagData.getPostCount();
        return new yod(id, normalizedTagSlug, displayTitle, iIntValue, postCount != null ? postCount.longValue() : 0L);
    }

    public static Status K(String str) {
        String str2;
        if (TextUtils.isEmpty(str)) {
            return new Status(17499, null, null, null);
        }
        String[] strArrSplit = str.split(":", 2);
        strArrSplit[0] = strArrSplit[0].trim();
        if (strArrSplit.length > 1 && (str2 = strArrSplit[1]) != null) {
            strArrSplit[1] = str2.trim();
        }
        List listAsList = Arrays.asList(strArrSplit);
        return listAsList.size() > 1 ? L((String) listAsList.get(0), (String) listAsList.get(1)) : L((String) listAsList.get(0), null);
    }

    public static Status L(String str, String str2) {
        int i;
        str.getClass();
        switch (str) {
            case "USER_CANCELLED":
                i = 18001;
                break;
            case "INVALID_RECIPIENT_EMAIL":
                i = 17033;
                break;
            case "WEB_CONTEXT_ALREADY_PRESENTED":
                i = 17057;
                break;
            case "INTERNAL_SUCCESS_SIGN_OUT":
                i = 17091;
                break;
            case "INVALID_IDP_RESPONSE":
            case "INVALID_LOGIN_CREDENTIALS":
            case "INVALID_PENDING_TOKEN":
                i = 17004;
                break;
            case "DYNAMIC_LINK_NOT_ACTIVATED":
                i = 17068;
                break;
            case "QUOTA_EXCEEDED":
                i = 17052;
                break;
            case "WEB_NETWORK_REQUEST_FAILED":
                i = 17061;
                break;
            case "INVALID_RECAPTCHA_VERSION":
                i = 17206;
                break;
            case "RECAPTCHA_NOT_ENABLED":
                i = 17200;
                break;
            case "EXPIRED_OOB_CODE":
                i = 17029;
                break;
            case "UNAUTHORIZED_DOMAIN":
                i = 17038;
                break;
            case "INVALID_OOB_CODE":
                i = 17030;
                break;
            case "MISSING_EMAIL":
                i = 17034;
                break;
            case "INVALID_CODE":
                i = 17044;
                break;
            case "INVALID_HOSTING_LINK_DOMAIN":
                i = 17214;
                break;
            case "TOKEN_EXPIRED":
                i = 17021;
                break;
            case "INVALID_TENANT_ID":
                i = 17079;
                break;
            case "ALTERNATE_CLIENT_IDENTIFIER_REQUIRED":
                i = 18002;
                break;
            case "INVALID_SESSION_INFO":
                i = 17046;
                break;
            case "SECOND_FACTOR_EXISTS":
                i = 17087;
                break;
            case "INVALID_EMAIL":
            case "INVALID_IDENTIFIER":
                i = 17008;
                break;
            case "ADMIN_ONLY_OPERATION":
                i = 17085;
                break;
            case "MISSING_OR_INVALID_NONCE":
                i = 17094;
                break;
            case "INVALID_CERT_HASH":
                i = 17064;
                break;
            case "NO_SUCH_PROVIDER":
                i = 17016;
                break;
            case "MFA_ENROLLMENT_NOT_FOUND":
                i = 17084;
                break;
            case "MISSING_PASSWORD":
                i = 17035;
                break;
            case "CREDENTIAL_TOO_OLD_LOGIN_AGAIN":
                i = 17014;
                break;
            case "TIMEOUT":
            case "<<Network Error>>":
                i = 17020;
                break;
            case "INVALID_REQ_TYPE":
                i = 17207;
                break;
            case "INVALID_RECAPTCHA_ACTION":
                i = 17203;
                break;
            case "OPERATION_NOT_ALLOWED":
            case "PASSWORD_LOGIN_DISABLED":
                i = 17006;
                break;
            case "WEB_INTERNAL_ERROR":
                i = 17062;
                break;
            case "SECOND_FACTOR_LIMIT_EXCEEDED":
                i = 17088;
                break;
            case "MISSING_MFA_ENROLLMENT_ID":
                i = 17082;
                break;
            case "USER_NOT_FOUND":
            case "EMAIL_NOT_FOUND":
                i = 17011;
                break;
            case "CAPTCHA_CHECK_FAILED":
                i = 17056;
                break;
            case "WEAK_PASSWORD":
                i = FujifilmMakernoteDirectory.TAG_FACE_REC_INFO;
                break;
            case "UNSUPPORTED_FIRST_FACTOR":
                i = 17089;
                break;
            case "INVALID_SENDER":
                i = 17032;
                break;
            case "MISSING_PHONE_NUMBER":
                i = 17041;
                break;
            case "INVALID_DYNAMIC_LINK_DOMAIN":
                i = 17074;
                break;
            case "MISSING_MFA_PENDING_CREDENTIAL":
                i = 17081;
                break;
            case "UNSUPPORTED_PASSTHROUGH_OPERATION":
                i = 17095;
                break;
            case "EMAIL_EXISTS":
                i = 17007;
                break;
            case "INVALID_ID_TOKEN":
                i = 17017;
                break;
            case "WEB_STORAGE_UNSUPPORTED":
                i = 17065;
                break;
            case "MISSING_CLIENT_TYPE":
                i = 17204;
                break;
            case "MISSING_RECAPTCHA_VERSION":
                i = 17205;
                break;
            case "UNVERIFIED_EMAIL":
                i = 17086;
                break;
            case "REJECTED_CREDENTIAL":
                i = 17075;
                break;
            case "INVALID_MFA_PENDING_CREDENTIAL":
                i = 17083;
                break;
            case "INVALID_VERIFICATION_PROOF":
                i = 17049;
                break;
            case "INVALID_PROVIDER_ID":
                i = 17071;
                break;
            case "CREDENTIAL_MISMATCH":
                i = 17002;
                break;
            case "WEB_CONTEXT_CANCELED":
                i = 17058;
                break;
            case "REQUIRES_SECOND_FACTOR_AUTH":
                i = 17078;
                break;
            case "MISSING_CLIENT_IDENTIFIER":
                i = 17093;
                break;
            case "INVALID_MESSAGE_PAYLOAD":
                i = 17031;
                break;
            case "RESET_PASSWORD_EXCEED_LIMIT":
            case "TOO_MANY_ATTEMPTS_TRY_LATER":
                i = 17010;
                break;
            case "INVALID_CUSTOM_TOKEN":
                i = 17000;
                break;
            case "INVALID_PASSWORD":
                i = 17009;
                break;
            case "INVALID_RECAPTCHA_TOKEN":
                i = 17202;
                break;
            case "SESSION_EXPIRED":
                i = 17051;
                break;
            case "MISSING_CODE":
                i = 17043;
                break;
            case "FEDERATED_USER_ID_ALREADY_LINKED":
                i = 17025;
                break;
            case "MISSING_RECAPTCHA_TOKEN":
                i = 17201;
                break;
            case "USER_DISABLED":
                i = 17005;
                break;
            case "INVALID_PHONE_NUMBER":
                i = 17042;
                break;
            case "INVALID_APP_CREDENTIAL":
                i = 17028;
                break;
            case "MISSING_CONTINUE_URI":
                i = 17040;
                break;
            case "MISSING_SESSION_INFO":
                i = 17045;
                break;
            case "EMAIL_CHANGE_NEEDS_VERIFICATION":
                i = 17090;
                break;
            case "UNSUPPORTED_TENANT_OPERATION":
                i = 17073;
                break;
            default:
                i = 17499;
                break;
        }
        return i == 17499 ? str2 != null ? new Status(i, ev6.x(str, ":", str2), null, null) : new Status(i, str, null, null) : new Status(i, str2, null, null);
    }

    public static String M(byte[] bArr) {
        StringBuilder sb = new StringBuilder(bArr.length);
        for (byte b2 : bArr) {
            if (b2 == 34) {
                sb.append("\\\"");
            } else if (b2 == 39) {
                sb.append("\\'");
            } else if (b2 != 92) {
                switch (b2) {
                    case 7:
                        sb.append("\\a");
                        break;
                    case 8:
                        sb.append("\\b");
                        break;
                    case 9:
                        sb.append("\\t");
                        break;
                    case 10:
                        sb.append("\\n");
                        break;
                    case 11:
                        sb.append("\\v");
                        break;
                    case 12:
                        sb.append("\\f");
                        break;
                    case 13:
                        sb.append("\\r");
                        break;
                    default:
                        if (b2 < 32 || b2 > 126) {
                            sb.append('\\');
                            sb.append((char) (((b2 >>> 6) & 3) + 48));
                            sb.append((char) (((b2 >>> 3) & 7) + 48));
                            sb.append((char) ((b2 & 7) + 48));
                        } else {
                            sb.append((char) b2);
                        }
                        break;
                }
            } else {
                sb.append("\\\\");
            }
        }
        return sb.toString();
    }

    public static final void a(x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(568570418);
        if (p65Var.P(i & 1, i != 0)) {
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var.j0(objM);
            }
            l78 l78Var = (l78) objM;
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i2 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, o28.b);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i2));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new ei4(l78Var, 16);
                p65Var.j0(objM2);
            }
            mo7.t((m45) objM2, "Show dialog", yn7.M, null, false, p65Var, 438, 24);
            p65Var.p(true);
            if (((Boolean) l78Var.getValue()).booleanValue()) {
                p65Var.Y(-1069372771);
                Object objM3 = p65Var.M();
                if (objM3 == uobVar) {
                    objM3 = new ei4(l78Var, 17);
                    p65Var.j0(objM3);
                }
                m((m45) objM3, p65Var, 54);
            } else {
                p65Var.Y(-1070540944);
            }
            p65Var.p(false);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wn7(i, 10);
        }
    }

    public static final void b(on3 on3Var, r28 r28Var, x12 x12Var, int i) {
        boolean z;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-539317246);
        int i2 = i | (p65Var.f(on3Var) ? 4 : 2) | (p65Var.f(r28Var) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            m73 m73Var = (m73) p65Var.j(z22.h);
            sn3 sn3Var = jt7.c;
            mkd mkdVar = ((bu7) p65Var.j(sn3Var)).o;
            sn3 sn3Var2 = kt7.b;
            mkd mkdVarA = mkd.a(mkdVar, ((zo7) p65Var.j(sn3Var2)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
            float fZ = m73Var.z(mkdVarA.b.c);
            o28 o28Var = o28.b;
            r28 r28VarF = jfc.f(o28Var, fZ, 0.0f, 2);
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var, 48);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            d46.a(on3Var.d, hl0.L, w2g.G(o28Var, 0.0f, 0.0f, 0.0f, 8.0f, 7), null, null, null, null, 0.0f, 0, null, null, p65Var, 432, 0, 4088);
            jjd.b(on3Var.a, jfc.f(o28Var, m73Var.z(((bu7) p65Var.j(sn3Var)).n.b.c), 0.0f, 2), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(sn3Var)).n, ((zo7) p65Var.j(sn3Var2)).n, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 0, 130044);
            jjd.b(on3Var.b, r28VarF, 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, mkdVarA, p65Var, 0, 0, 130044);
            p65Var = p65Var;
            if (on3Var.c != null) {
                p65Var.Y(-683350798);
                jjd.b(on3Var.c, r28VarF, 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, mkdVarA, p65Var, 0, 0, 130044);
                p65Var = p65Var;
                z = false;
            } else {
                z = false;
                p65Var.Y(-700821220);
            }
            p65Var.p(z);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sn8(on3Var, r28Var, i, 5);
        }
    }

    public static final void c(final rn3 rn3Var, jy8 jy8Var, r28 r28Var, x12 x12Var, int i) {
        int i2;
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-124504292);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(rn3Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(jy8Var) ? 32 : 16;
        }
        int i3 = i2 | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            ((jp7) p65Var.j(kt7.a)).getClass();
            Context context = (Context) p65Var.j(eo.b);
            context.getClass();
            float f = r12.heightPixels / context.getResources().getDisplayMetrics().density;
            ip7 ip7Var = vj3.a(f, 480.0f) < 0 ? ip7.COMPACT : vj3.a(f, 900.0f) < 0 ? ip7.MEDIUM : ip7.EXPANDED;
            final boolean z = ip7Var == ip7.COMPACT || ip7Var == ip7.MEDIUM;
            final float f2 = jy8Var.d;
            o28 o28Var = o28.b;
            r40.h(jfc.d(w2g.G(o28Var, 0.0f, f2, 0.0f, 0.0f, 13), 1.0f), null, pxf.E(465278598, new c55() { // from class: l79
                @Override // defpackage.c55
                public final Object f(Object obj, Object obj2, Object obj3) {
                    jy0 jy0Var = (jy0) obj;
                    x12 x12Var2 = (x12) obj2;
                    int iIntValue = ((Integer) obj3).intValue();
                    jy0Var.getClass();
                    if ((iIntValue & 6) == 0) {
                        iIntValue |= ((p65) x12Var2).f(jy0Var) ? 4 : 2;
                    }
                    boolean z2 = true;
                    p65 p65Var2 = (p65) x12Var2;
                    if (p65Var2.P(iIntValue & 1, (iIntValue & 19) != 18)) {
                        float fQ = ((m73) p65Var2.j(z22.h)).Q(f72.h(jy0Var.b)) / 3.0f;
                        o28 o28Var2 = o28.b;
                        float f3 = 1.0f;
                        r28 r28VarD = jfc.d(o28Var2, 1.0f);
                        wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
                        long j = p65Var2.T;
                        char c2 = ' ';
                        int i4 = (int) (j ^ (j >>> 32));
                        i89 i89VarL = p65Var2.l();
                        r28 r28VarR = gx1.R(p65Var2, r28VarD);
                        r12.W.getClass();
                        ot2 ot2Var = q12.b;
                        p65Var2.c0();
                        if (p65Var2.S) {
                            p65Var2.k(ot2Var);
                        } else {
                            p65Var2.m0();
                        }
                        tp7.B(p65Var2, q12.f, wv1VarA);
                        tp7.B(p65Var2, q12.e, i89VarL);
                        tp7.B(p65Var2, q12.g, Integer.valueOf(i4));
                        tp7.y(p65Var2, q12.h);
                        tp7.B(p65Var2, q12.d, r28VarR);
                        p65Var2.Y(-150342702);
                        List list = rn3Var.i;
                        ArrayList arrayList = new ArrayList();
                        for (Object obj4 : list) {
                            on3 on3Var = (on3) obj4;
                            if (!z || !on3Var.e) {
                                arrayList.add(obj4);
                            }
                        }
                        int i5 = 0;
                        for (Object obj5 : bu1.r1(arrayList, 3, 3)) {
                            int i6 = i5 + 1;
                            if (i5 < 0) {
                                d46.i0();
                                throw null;
                            }
                            List list2 = (List) obj5;
                            r28 r28VarD2 = jfc.d(o28Var2, f3);
                            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var2, 0);
                            long j2 = p65Var2.T;
                            int i7 = (int) (j2 ^ (j2 >>> c2));
                            i89 i89VarL2 = p65Var2.l();
                            r28 r28VarR2 = gx1.R(p65Var2, r28VarD2);
                            r12.W.getClass();
                            ot2 ot2Var2 = q12.b;
                            p65Var2.c0();
                            if (p65Var2.S) {
                                p65Var2.k(ot2Var2);
                            } else {
                                p65Var2.m0();
                            }
                            tp7.B(p65Var2, q12.f, ombVarA);
                            tp7.B(p65Var2, q12.e, i89VarL2);
                            tp7.B(p65Var2, q12.g, Integer.valueOf(i7));
                            tp7.y(p65Var2, q12.h);
                            tp7.B(p65Var2, q12.d, r28VarR2);
                            p65Var2.Y(-1637020687);
                            int i8 = 0;
                            for (Object obj6 : list2) {
                                int i9 = i8 + 1;
                                if (i8 < 0) {
                                    d46.i0();
                                    throw null;
                                }
                                hp7.b((on3) obj6, bgf.N(jfc.p(w2g.G(o28Var2, 0.0f, 0.0f, 0.0f, f2, 7), fQ), "creator_" + i5 + "_" + i8), p65Var2, 0);
                                i8 = i9;
                            }
                            p65Var2.p(false);
                            p65Var2.p(true);
                            z2 = true;
                            i5 = i6;
                            f3 = 1.0f;
                            c2 = ' ';
                        }
                        p65Var2.p(false);
                        p65Var2.p(z2);
                    } else {
                        p65Var2.S();
                    }
                    return c1e.a;
                }
            }, p65Var), p65Var, 3072, 6);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new vt6(i, 9, rn3Var, jy8Var, r28Var2);
        }
    }

    public static final void d(String str, int i, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-514096709);
        int i3 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.d(i) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarO = jfc.o(w2g.E(o28Var, 0.0f, 4.0f, 1), 0.0f, 0.0f, 410.0f, 0.0f, 11);
            fa4 fa4Var = qb8.a;
            zq0 zq0Var = z46.m;
            omb ombVarA = nmb.a(fa4Var, zq0Var, p65Var, 0);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarO);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            w2g.e(vn7.J(R.drawable.ic_member_16, 0, p65Var), vo7.R(p65Var, R.string.cd_member_only), bgf.N(o28Var, "selling_point_icon_" + i).b(new qse(zq0Var)), null, null, 0.0f, null, p65Var, 8, 120);
            t(p65Var, jfc.l(o28Var, 8.0f));
            jjd.b(str, jfc.d(bgf.N(o28Var, "selling_point_text_" + i), 1.0f).b(new qse(z46.n)), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(jt7.c)).m, ((zo7) p65Var.j(kt7.b)).n, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, i3 & 14, 0, 131068);
            p65Var = p65Var;
            p65Var.p(true);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ee(str, i, r28Var2, i2, 2);
        }
    }

    public static final void e(rn3 rn3Var, x12 x12Var, int i) {
        List listR;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1673683370);
        int i2 = (i & 6) == 0 ? (p65Var.f(rn3Var) ? 4 : 2) | i : i;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            int i3 = q79.a[rn3Var.h.ordinal()];
            if (i3 == 1) {
                p65Var.Y(2091955381);
                listR = d46.R(vo7.R(p65Var, R.string.paywall_programming_first_selling_point), vo7.R(p65Var, R.string.paywall_programming_second_selling_point), vo7.R(p65Var, R.string.paywall_programming_third_selling_point), vo7.R(p65Var, R.string.paywall_programming_fourth_selling_point));
                p65Var.p(false);
            } else {
                if (i3 != 2) {
                    throw ho2.L(p65Var, 2091953463, false);
                }
                p65Var.Y(2091967593);
                listR = d46.R(vo7.R(p65Var, R.string.paywall_aspirational_first_selling_point), vo7.R(p65Var, R.string.paywall_aspirational_second_selling_point), vo7.R(p65Var, R.string.paywall_aspirational_third_selling_point));
                p65Var.p(false);
            }
            int i4 = 0;
            for (Object obj : listR) {
                int i5 = i4 + 1;
                if (i4 < 0) {
                    d46.i0();
                    throw null;
                }
                d((String) obj, i4, null, p65Var, 0);
                i4 = i5;
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new s8(i, 7, rn3Var);
        }
    }

    public static final void f(rn3 rn3Var, pkf pkfVar, r28 r28Var, x12 x12Var, int i) {
        String strQ;
        String strQ2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-610502037);
        int i2 = i | (p65Var.f(rn3Var) ? 4 : 2) | (p65Var.f(pkfVar) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 9363) != 9362)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            String str = rn3Var.c;
            if (str == null) {
                p65Var.Y(-180264027);
                p65Var.p(false);
                strQ = null;
            } else {
                p65Var.Y(-180264026);
                strQ = vo7.Q(R.string.paywall_title_username, new Object[]{str}, p65Var);
                p65Var.p(false);
            }
            if (strQ == null) {
                strQ = km4.w(p65Var, 686924199, R.string.paywall_title, p65Var, false);
            } else {
                p65Var.Y(686920975);
                p65Var.p(false);
            }
            sn3 sn3Var = jt7.c;
            mkd mkdVar = ((bu7) p65Var.j(sn3Var)).E;
            o28 o28Var = o28.b;
            jjd.b(strQ, w2g.G(jfc.d(bgf.N(o28Var, "title"), 1.0f), 0.0f, 0.0f, 0.0f, 16.0f, 7), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, mkdVar, p65Var, 0, 0, 130044);
            String str2 = rn3Var.g;
            if (str2 == null) {
                p65Var.Y(-179837653);
                p65Var.p(false);
                strQ2 = null;
            } else {
                p65Var.Y(-179837652);
                strQ2 = vo7.Q(R.string.paywall_subtitle, new Object[]{str2}, p65Var);
                p65Var.p(false);
            }
            if (strQ2 == null) {
                strQ2 = km4.w(p65Var, 686937780, R.string.paywall_subtitle_no_author, p65Var, false);
            } else {
                p65Var.Y(686934897);
                p65Var.p(false);
            }
            jjd.b(strQ2, w2g.G(bgf.N(jfc.d(o28Var, 1.0f), "subtitle"), 0.0f, 16.0f, 0.0f, 32.0f, 5), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).m, p65Var, 0, 0, 130044);
            p65Var = p65Var;
            int i4 = i2 & 14;
            e(rn3Var, p65Var, i4);
            c(rn3Var, new jy8(22.0f, 32.0f, 22.0f, 32.0f), null, p65Var, i4);
            r28 r28VarI = ka1.i(z46.q, bgf.N(o28Var, "call_to_action"));
            String strX = x(rn3Var.f, p65Var);
            xn7 xn7Var = xn7.M;
            boolean z = ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | (i4 == 4);
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new ps5(pkfVar, 25, rn3Var);
                p65Var.j0(objM);
            }
            fo7.r((m45) objM, strX, xn7Var, r28VarI, false, p65Var, 384, 16);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ho5(i, 27, rn3Var, pkfVar, r28Var);
        }
    }

    public static final void g(rn3 rn3Var, pkf pkfVar, float f, r28 r28Var, x12 x12Var, int i) {
        int i2;
        Object fr0Var;
        m62 m62Var;
        l78 l78Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(175600630);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(rn3Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(pkfVar) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.c(f) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            wgd.w(-1003410150, 212064437, p65Var, false);
            m73 m73Var = (m73) p65Var.j(z22.h);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = b09.t(m73Var, p65Var);
            }
            hl7 hl7Var = (hl7) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = b09.r(p65Var);
            }
            z52 z52Var = (z52) objM2;
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = qo7.u(Boolean.FALSE);
                p65Var.j0(objM3);
            }
            l78 l78Var2 = (l78) objM3;
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = b09.s(z52Var, p65Var);
            }
            m62 m62Var2 = (m62) objM4;
            Object objM5 = p65Var.M();
            if (objM5 == uobVar) {
                objM5 = b09.v(c1e.a, y3b.h, p65Var);
            }
            l78 l78Var3 = (l78) objM5;
            boolean zH = p65Var.h(hl7Var) | p65Var.d(257);
            Object objM6 = p65Var.M();
            if (zH || objM6 == uobVar) {
                fr0Var = new fr0(l78Var3, hl7Var, m62Var2, l78Var2, 18);
                m62Var = m62Var2;
                l78Var = l78Var2;
                p65Var.j0(fr0Var);
            } else {
                fr0Var = objM6;
                m62Var = m62Var2;
                l78Var = l78Var2;
            }
            zk7 zk7Var = (zk7) fr0Var;
            Object objM7 = p65Var.M();
            int i3 = 18;
            if (objM7 == uobVar) {
                objM7 = new gr0(l78Var, m62Var, i3);
                p65Var.j0(objM7);
            }
            m45 m45Var = (m45) objM7;
            boolean zH2 = p65Var.h(hl7Var);
            Object objM8 = p65Var.M();
            if (zH2 || objM8 == uobVar) {
                objM8 = new hr0(hl7Var, i3);
                p65Var.j0(objM8);
            }
            hlg.j(wxb.a(r28Var, false, (x45) objM8), pxf.E(1200550679, new o79(l78Var3, z52Var, m45Var, f, pkfVar, rn3Var, 0), p65Var), zk7Var, p65Var, 48);
            p65Var.p(false);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new fs7(rn3Var, f, pkfVar, r28Var, i, 5);
        }
    }

    public static final void h(r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1981131453);
        int i2 = (p65Var.f(r28Var) ? 4 : 2) | i;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            r28 r28VarN = bgf.N(r28Var, "gradient_background");
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = ka1.k(p65Var);
            }
            m68 m68Var = (m68) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new oo7(28);
                p65Var.j0(objM2);
            }
            r28 r28VarZ = flb.Z(hlg.p(r28VarN, m68Var, null, false, null, (m45) objM2, 28), hpe.y(d46.R(new uu1(uu1.g), new uu1(((zo7) p65Var.j(kt7.b)).c))));
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarZ);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ow4(r28Var, i, 26);
        }
    }

    public static final void i(n76 n76Var, pkf pkfVar, r28 r28Var, x12 x12Var, int i) {
        int i2;
        String str;
        cu cuVar;
        o76 o76Var;
        cu cuVar2;
        int i3;
        cu cuVar3;
        o28 o28Var;
        fn fnVar;
        boolean z;
        cu cuVar4;
        cu cuVar5;
        ot2 ot2Var;
        boolean z2;
        long j;
        pkf pkfVar2 = pkfVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1385447357);
        int i4 = i | (p65Var.f(n76Var) ? 4 : 2) | (p65Var.f(pkfVar2) ? 32 : 16);
        if (p65Var.P(i4 & 1, (i4 & 147) != 146)) {
            yq0 yq0Var = z46.q;
            wv1 wv1VarA = uv1.a(new h70(24.0f, true, new z10(21)), yq0Var, p65Var, 54);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28Var);
            r12.W.getClass();
            ot2 ot2Var2 = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var2);
            } else {
                p65Var.m0();
            }
            cu cuVar6 = q12.f;
            tp7.B(p65Var, cuVar6, wv1VarA);
            cu cuVar7 = q12.e;
            tp7.B(p65Var, cuVar7, i89VarL);
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar8 = q12.g;
            tp7.B(p65Var, cuVar8, numValueOf);
            fn fnVar2 = q12.h;
            tp7.y(p65Var, fnVar2);
            cu cuVar9 = q12.d;
            tp7.B(p65Var, cuVar9, r28VarR);
            String str2 = n76Var.f;
            o28 o28Var2 = o28.b;
            if (str2 == null) {
                p65Var.Y(1017375321);
                p65Var.p(false);
                i2 = i4;
                cuVar2 = cuVar9;
                cuVar3 = cuVar7;
                z = false;
                o28Var = o28Var2;
                cuVar5 = cuVar8;
                i3 = 32;
                ot2Var = ot2Var2;
                cuVar4 = cuVar6;
                fnVar = fnVar2;
            } else {
                p65Var.Y(1017375322);
                aw7 aw7Var = n76Var.g;
                if ((aw7Var == null ? -1 : q79.b[aw7Var.ordinal()]) == 1) {
                    p65Var.Y(1140433943);
                    long j3 = xo7.B;
                    if (yi2.N(p65Var)) {
                        i2 = i4;
                        p65Var.Y(1091114609);
                        str = str2;
                        cuVar = cuVar7;
                        j = ((zo7) p65Var.j(kt7.b)).p;
                        z2 = false;
                        p65Var.p(false);
                    } else {
                        i2 = i4;
                        str = str2;
                        cuVar = cuVar7;
                        z2 = false;
                        p65Var.Y(1091176082);
                        j = ((zo7) p65Var.j(kt7.b)).n;
                        p65Var.p(false);
                    }
                    o76Var = new o76(j3, j);
                    p65Var.p(z2);
                } else {
                    i2 = i4;
                    str = str2;
                    cuVar = cuVar7;
                    p65Var.Y(1140439626);
                    sn3 sn3Var = kt7.b;
                    o76Var = new o76(((zo7) p65Var.j(sn3Var)).b, ((zo7) p65Var.j(sn3Var)).n);
                    p65Var.p(false);
                }
                cuVar2 = cuVar9;
                i3 = 32;
                cuVar3 = cuVar;
                o28Var = o28Var2;
                fnVar = fnVar2;
                z = false;
                cuVar4 = cuVar6;
                cuVar5 = cuVar8;
                ot2Var = ot2Var2;
                jjd.b(str, w2g.D(flb.a0(bgf.N(o28Var2, "pill"), o76Var.a, bmb.a(8.0f)), 8.0f, 4.0f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(jt7.c)).m, o76Var.b, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 0, 131068);
                p65Var = p65Var;
                p65Var.p(false);
            }
            wv1 wv1VarA2 = uv1.a(qb8.c, yq0Var, p65Var, 48);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> i3));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar4, wv1VarA2);
            tp7.B(p65Var, cuVar3, i89VarL2);
            ka1.z(i6, p65Var, cuVar5, p65Var, fnVar);
            tp7.B(p65Var, cuVar2, r28VarR2);
            String str3 = n76Var.h;
            if (str3 == null) {
                p65Var.Y(-166033821);
            } else {
                p65Var.Y(-166033820);
                p65 p65Var2 = p65Var;
                jjd.b(str3, jfc.d(bgf.N(o28Var, "title"), 1.0f), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).E, p65Var2, 48, 0, 130044);
                p65Var = p65Var2;
            }
            p65Var.p(z);
            String str4 = n76Var.i;
            if (str4 == null) {
                p65Var.Y(-165669447);
            } else {
                p65Var.Y(-165669446);
                p65 p65Var3 = p65Var;
                jjd.b(str4, jfc.d(bgf.N(o28Var, "subtitle"), 1.0f), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).G, p65Var3, 48, 0, 130044);
                p65Var = p65Var3;
            }
            p65Var.p(z);
            p65Var.p(true);
            l(jfc.q(o28Var, 0.0f, 264.0f, 1), p65Var, 6);
            r28 r28VarN = bgf.N(o28Var, "call_to_action");
            String strW = n76Var.j;
            if (strW == null) {
                strW = km4.w(p65Var, 1418344072, R.string.paywall_call_to_action, p65Var, z);
            } else {
                p65Var.Y(1418343328);
                p65Var.p(z);
            }
            String str5 = strW;
            xn7 xn7Var = xn7.M;
            boolean z3 = (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == i3 ? true : z;
            if ((i2 & 14) == 4) {
                z = true;
            }
            boolean z4 = z3 | z;
            Object objM = p65Var.M();
            if (z4 || objM == w12.a) {
                pkfVar2 = pkfVar;
                objM = new ps5(pkfVar2, 26, n76Var);
                p65Var.j0(objM);
            } else {
                pkfVar2 = pkfVar;
            }
            fo7.i((m45) objM, str5, xn7Var, r28VarN, false, p65Var, 3456, 16);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ho5(i, 28, n76Var, pkfVar2, r28Var);
        }
    }

    public static final void j(n76 n76Var, pkf pkfVar, float f, r28 r28Var, x12 x12Var, int i) {
        int i2;
        Object fr0Var;
        m62 m62Var;
        l78 l78Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1955834006);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(n76Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(pkfVar) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.c(f) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            wgd.w(-1003410150, 212064437, p65Var, false);
            m73 m73Var = (m73) p65Var.j(z22.h);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = b09.t(m73Var, p65Var);
            }
            hl7 hl7Var = (hl7) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = b09.r(p65Var);
            }
            z52 z52Var = (z52) objM2;
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = qo7.u(Boolean.FALSE);
                p65Var.j0(objM3);
            }
            l78 l78Var2 = (l78) objM3;
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = b09.s(z52Var, p65Var);
            }
            m62 m62Var2 = (m62) objM4;
            Object objM5 = p65Var.M();
            if (objM5 == uobVar) {
                objM5 = b09.v(c1e.a, y3b.h, p65Var);
            }
            l78 l78Var3 = (l78) objM5;
            boolean zH = p65Var.h(hl7Var) | p65Var.d(257);
            Object objM6 = p65Var.M();
            if (zH || objM6 == uobVar) {
                fr0Var = new fr0(l78Var3, hl7Var, m62Var2, l78Var2, 19);
                m62Var = m62Var2;
                l78Var = l78Var2;
                p65Var.j0(fr0Var);
            } else {
                fr0Var = objM6;
                m62Var = m62Var2;
                l78Var = l78Var2;
            }
            zk7 zk7Var = (zk7) fr0Var;
            Object objM7 = p65Var.M();
            int i3 = 19;
            if (objM7 == uobVar) {
                objM7 = new gr0(l78Var, m62Var, i3);
                p65Var.j0(objM7);
            }
            m45 m45Var = (m45) objM7;
            boolean zH2 = p65Var.h(hl7Var);
            Object objM8 = p65Var.M();
            if (zH2 || objM8 == uobVar) {
                objM8 = new hr0(hl7Var, i3);
                p65Var.j0(objM8);
            }
            hlg.j(wxb.a(r28Var, false, (x45) objM8), pxf.E(1200550679, new o79(l78Var3, z52Var, m45Var, f, pkfVar, n76Var, 1), p65Var), zk7Var, p65Var, 48);
            p65Var.p(false);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new fs7(n76Var, f, pkfVar, r28Var, i, 3);
        }
    }

    public static final void k(String str, int i, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1329905958);
        int i3 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.d(i) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            omb ombVarA = nmb.a(new h70(8.0f, true, new z10(21)), z46.n, p65Var, 54);
            long j = p65Var.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            c09 c09VarJ = vn7.J(R.drawable.ic_check_mark_16, 0, p65Var);
            sn3 sn3Var = kt7.b;
            qv5.b(c09VarJ, null, jfc.l(bgf.N(o28Var, "value_prop_icon_" + i), 16.0f), ((zo7) p65Var.j(sn3Var)).n, p65Var, 56, 0);
            jjd.b(str, km4.u(1.0f, bgf.N(o28Var, "value_prop_text_" + i), true), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(jt7.c)).m, ((zo7) p65Var.j(sn3Var)).n, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, i3 & 14, 0, 131068);
            p65Var = p65Var;
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ee(str, i, r28Var2, i2, 1);
        }
    }

    public static final void l(r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-613920332);
        if (p65Var.P(i & 1, (i & 3) != 2)) {
            List listR = d46.R(Integer.valueOf(R.string.paywall_intro_offer_value_prop_1), Integer.valueOf(R.string.paywall_intro_offer_value_prop_2), Integer.valueOf(R.string.paywall_intro_offer_value_prop_3), Integer.valueOf(R.string.paywall_intro_offer_value_prop_4));
            r28 r28VarD = jfc.d(r28Var, 1.0f);
            wv1 wv1VarA = uv1.a(new h70(4.0f, true, new z10(21)), z46.p, p65Var, 6);
            long j = p65Var.T;
            int i2 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i2));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            p65Var.Y(-1846624688);
            int i3 = 0;
            for (Object obj : listR) {
                int i4 = i3 + 1;
                if (i3 < 0) {
                    d46.i0();
                    throw null;
                }
                k(vo7.R(p65Var, ((Number) obj).intValue()), i3, null, p65Var, 0);
                i3 = i4;
            }
            p65Var.p(false);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ow4(r28Var, i, 24);
        }
    }

    public static final void m(m45 m45Var, x12 x12Var, int i) {
        m45 m45Var2;
        m45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-963201219);
        if (p65Var.P(i & 1, (i & 19) != 18)) {
            m45Var2 = m45Var;
            m40.h(m45Var2, null, pxf.E(733951814, new wn7(9), p65Var), p65Var, 390, 2);
        } else {
            m45Var2 = m45Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new c60(i, 12, m45Var2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x0058  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x005a  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0063  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x00a0  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00b4  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00cd  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x0111  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x011c  */
    /* JADX WARN: Removed duplicated region for block: B:71:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void n(defpackage.s79 r13, defpackage.pkf r14, defpackage.r28 r15, float r16, defpackage.x12 r17, int r18, int r19) {
        /*
            Method dump skipped, instruction units count: 296
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hp7.n(s79, pkf, r28, float, x12, int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x0065  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x006c  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0087  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x008f  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0096  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x009a  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00ae  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00b5  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x00be  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x0161  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x0174  */
    /* JADX WARN: Removed duplicated region for block: B:87:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void o(java.lang.String r16, defpackage.hl0 r17, defpackage.r28 r18, defpackage.xd r19, defpackage.w82 r20, float r21, int r22, defpackage.m3c r23, defpackage.m45 r24, defpackage.x12 r25, int r26, int r27) {
        /*
            Method dump skipped, instruction units count: 384
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hp7.o(java.lang.String, hl0, r28, xd, w82, float, int, m3c, m45, x12, int, int):void");
    }

    public static final void p(vpc vpcVar, bo4 bo4Var, i5c i5cVar, x12 x12Var, int i) {
        vpcVar.getClass();
        bo4Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(698565161);
        int i2 = i | (p65Var.h(vpcVar) ? 4 : 2) | (p65Var.h(bo4Var) ? 32 : 16) | (p65Var.f(i5cVar) ? 256 : 128);
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            l78 l78VarZ = guc.z(vpcVar, p65Var, i2 & 14);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new dsb(9);
                p65Var.j0(objM);
            }
            r28 r28VarN = bgf.N(new l60((x45) objM, false), "share_post_friend_link_screen");
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarN);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            q5c q5cVar = (q5c) l78VarZ.getValue();
            if (q5cVar instanceof o5c) {
                p65Var.Y(-1290893576);
                q5c q5cVar2 = (q5c) l78VarZ.getValue();
                q5cVar2.getClass();
                q((o5c) q5cVar2, i5cVar, p65Var, (i2 >> 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
                p65Var.p(false);
            } else {
                if (!(q5cVar instanceof p5c)) {
                    throw ho2.L(p65Var, -1842759644, false);
                }
                p65Var.Y(-1290584382);
                r(i5cVar, p65Var, (i2 >> 6) & 14);
                p65Var.p(false);
            }
            p65Var.p(true);
            Context context = (Context) p65Var.j(eo.b);
            Resources resources = context.getResources();
            boolean zH = p65Var.h(bo4Var) | p65Var.h(context) | p65Var.h(resources) | ((i2 & 896) == 256);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                rna rnaVar = new rna(bo4Var, context, resources, i5cVar, null, 17);
                p65Var.j0(rnaVar);
                objM2 = rnaVar;
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new q6b(i, 18, vpcVar, bo4Var, i5cVar);
        }
    }

    public static final void q(o5c o5cVar, i5c i5cVar, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(612543478);
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(o5cVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.f(i5cVar) ? 32 : 16;
        }
        int i3 = 1;
        if (p65Var2.P(i2 & 1, (i2 & 19) != 18)) {
            String strW = o5cVar.a ? km4.w(p65Var2, -1033062172, R.string.share_post_friend_link_shareable_description_author_friend_link, p65Var2, false) : km4.w(p65Var2, -1032953641, R.string.share_post_friend_link_shareable_description, p65Var2, false);
            String strR = vo7.R(p65Var2, R.string.share_post_friend_link_title);
            boolean z = (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new xib(0, i5cVar, i5c.class, "onCloseSelected", "onCloseSelected()V", 0, 29);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            ek7.g(strR, (m45) ((qh6) objM), o28.b, strW, pxf.E(1562013728, new qg9(o5cVar, 21, i5cVar), p65Var2), p65Var, 24960, 0);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new meb(o5cVar, i5cVar, i, i3);
        }
    }

    public static final void r(i5c i5cVar, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        i5c i5cVar2 = i5cVar;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-2001032694);
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(i5cVar2) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if (p65Var2.P(i2 & 1, (i2 & 3) != 2)) {
            String strR = vo7.R(p65Var2, R.string.share_post_friend_link_title);
            int i3 = i2 & 14;
            boolean z = i3 == 4;
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                j5c j5cVar = new j5c(0, i5cVar2, i5c.class, "onCloseSelected", "onCloseSelected()V", 0, 3);
                p65Var2.j0(j5cVar);
                objM = j5cVar;
            }
            m45 m45Var = (m45) ((qh6) objM);
            String strR2 = vo7.R(p65Var2, R.string.share_post_friend_link_upgrade_membership_description);
            String strR3 = vo7.R(p65Var2, R.string.share_post_friend_link_upgrade_membership);
            boolean z2 = i3 == 4;
            Object objM2 = p65Var2.M();
            if (z2 || objM2 == uobVar) {
                j5c j5cVar2 = new j5c(0, i5cVar, i5c.class, "onUpgradeMembershipSelected", "onUpgradeMembershipSelected()V", 0, 4);
                p65Var2.j0(j5cVar2);
                objM2 = j5cVar2;
            }
            m45 m45Var2 = (m45) ((qh6) objM2);
            String strR4 = vo7.R(p65Var2, R.string.share_post_friend_link_learn_more);
            boolean z3 = i3 == 4;
            Object objM3 = p65Var2.M();
            if (z3 || objM3 == uobVar) {
                i5cVar2 = i5cVar;
                objM3 = new j5c(0, i5cVar2, i5c.class, "onLearnMoreSelected", "onLearnMoreSelected()V", 0, 5);
                p65Var2.j0(objM3);
            } else {
                i5cVar2 = i5cVar;
            }
            p65Var = p65Var2;
            ek7.h(strR, m45Var, null, strR2, strR3, m45Var2, strR4, (m45) ((qh6) objM3), p65Var, 0, 4);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new s8(i, 10, i5cVar2);
        }
    }

    public static final void s(r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2047756514);
        int i2 = (p65Var.f(r28Var) ? 4 : 2) | i;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            r28 r28VarN = bgf.N(r28Var, "solid_background");
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = ka1.k(p65Var);
            }
            m68 m68Var = (m68) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new oo7(27);
                p65Var.j0(objM2);
            }
            g3d.a(flb.a0(hlg.p(r28VarN, m68Var, null, false, null, (m45) objM2, 28), ((zo7) p65Var.j(kt7.b)).c, rv8.r), null, 0L, 0L, 0.0f, 0.0f, null, flb.e, p65Var, 12582912, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ow4(r28Var, i, 25);
        }
    }

    public static final void t(x12 x12Var, r28 r28Var) {
        id idVar = id.m;
        p65 p65Var = (p65) x12Var;
        long j = p65Var.T;
        int i = (int) (j ^ (j >>> 32));
        r28 r28VarR = gx1.R(x12Var, r28Var);
        i89 i89VarL = p65Var.l();
        r12.W.getClass();
        ot2 ot2Var = q12.b;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.c0();
        if (p65Var2.S) {
            p65Var2.k(ot2Var);
        } else {
            p65Var2.m0();
        }
        tp7.B(x12Var, q12.f, idVar);
        tp7.B(x12Var, q12.e, i89VarL);
        tp7.y(x12Var, q12.h);
        tp7.B(x12Var, q12.d, r28VarR);
        tp7.B(x12Var, q12.g, Integer.valueOf(i));
        p65Var2.p(true);
    }

    public static final void u(kqc kqcVar, pkf pkfVar, float f, r28 r28Var, x12 x12Var, int i) {
        int i2;
        m62 m62Var;
        l78 l78Var;
        kqc kqcVar2 = kqcVar;
        pkf pkfVar2 = pkfVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1446844430);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(kqcVar2) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(pkfVar2) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.c(f) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        int i3 = i2;
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            wgd.w(-1003410150, 212064437, p65Var, false);
            m73 m73Var = (m73) p65Var.j(z22.h);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = b09.t(m73Var, p65Var);
            }
            hl7 hl7Var = (hl7) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = b09.r(p65Var);
            }
            z52 z52Var = (z52) objM2;
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = qo7.u(Boolean.FALSE);
                p65Var.j0(objM3);
            }
            l78 l78Var2 = (l78) objM3;
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = b09.s(z52Var, p65Var);
            }
            m62 m62Var2 = (m62) objM4;
            Object objM5 = p65Var.M();
            c1e c1eVar = c1e.a;
            if (objM5 == uobVar) {
                objM5 = b09.v(c1eVar, y3b.h, p65Var);
            }
            l78 l78Var3 = (l78) objM5;
            boolean zH = p65Var.h(hl7Var) | p65Var.d(257);
            Object objM6 = p65Var.M();
            if (zH || objM6 == uobVar) {
                objM6 = new fr0(l78Var3, hl7Var, m62Var2, l78Var2, 20);
                m62Var = m62Var2;
                l78Var = l78Var2;
                p65Var.j0(objM6);
            } else {
                m62Var = m62Var2;
                l78Var = l78Var2;
            }
            zk7 zk7Var = (zk7) objM6;
            Object objM7 = p65Var.M();
            int i4 = 20;
            if (objM7 == uobVar) {
                objM7 = new gr0(l78Var, m62Var, i4);
                p65Var.j0(objM7);
            }
            m45 m45Var = (m45) objM7;
            boolean zH2 = p65Var.h(hl7Var);
            Object objM8 = p65Var.M();
            if (zH2 || objM8 == uobVar) {
                objM8 = new hr0(hl7Var, i4);
                p65Var.j0(objM8);
            }
            r28 r28VarA = wxb.a(r28Var, false, (x45) objM8);
            o79 o79Var = new o79(l78Var3, z52Var, m45Var, f, kqcVar2, pkfVar2);
            kqcVar2 = kqcVar2;
            pkfVar2 = pkfVar2;
            hlg.j(r28VarA, pxf.E(1200550679, o79Var, p65Var), zk7Var, p65Var, 48);
            p65Var.p(false);
            boolean z = ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i3 & 14) == 4);
            Object objM9 = p65Var.M();
            if (z || objM9 == uobVar) {
                objM9 = new n79(pkfVar2, kqcVar2, null, 2);
                p65Var.j0(objM9);
            }
            kyd.k(p65Var, (b55) objM9, c1eVar);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new fs7(kqcVar2, f, pkfVar2, r28Var, i, 4);
        }
    }

    public static final void v(kqc kqcVar, pkf pkfVar, r28 r28Var, x12 x12Var, int i) {
        Object fr0Var;
        m62 m62Var;
        l78 l78Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1704124534);
        int i2 = i | (p65Var.f(kqcVar) ? 4 : 2) | (p65Var.f(pkfVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            wgd.w(-1003410150, 212064437, p65Var, false);
            m73 m73Var = (m73) p65Var.j(z22.h);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = b09.t(m73Var, p65Var);
            }
            hl7 hl7Var = (hl7) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = b09.r(p65Var);
            }
            z52 z52Var = (z52) objM2;
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = qo7.u(Boolean.FALSE);
                p65Var.j0(objM3);
            }
            l78 l78Var2 = (l78) objM3;
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = b09.s(z52Var, p65Var);
            }
            m62 m62Var2 = (m62) objM4;
            Object objM5 = p65Var.M();
            if (objM5 == uobVar) {
                objM5 = b09.v(c1e.a, y3b.h, p65Var);
            }
            l78 l78Var3 = (l78) objM5;
            boolean zH = p65Var.h(hl7Var) | p65Var.d(257);
            Object objM6 = p65Var.M();
            if (zH || objM6 == uobVar) {
                fr0Var = new fr0(l78Var3, hl7Var, m62Var2, l78Var2, 21);
                m62Var = m62Var2;
                l78Var = l78Var2;
                p65Var.j0(fr0Var);
            } else {
                fr0Var = objM6;
                m62Var = m62Var2;
                l78Var = l78Var2;
            }
            zk7 zk7Var = (zk7) fr0Var;
            Object objM7 = p65Var.M();
            int i3 = 21;
            if (objM7 == uobVar) {
                objM7 = new gr0(l78Var, m62Var, i3);
                p65Var.j0(objM7);
            }
            m45 m45Var = (m45) objM7;
            boolean zH2 = p65Var.h(hl7Var);
            Object objM8 = p65Var.M();
            if (zH2 || objM8 == uobVar) {
                objM8 = new hr0(hl7Var, i3);
                p65Var.j0(objM8);
            }
            hlg.j(wxb.a(r28Var, false, (x45) objM8), pxf.E(1200550679, new je2(l78Var3, z52Var, m45Var, kqcVar, pkfVar, 3), p65Var), zk7Var, p65Var, 48);
            p65Var.p(false);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ho5(i, 26, kqcVar, pkfVar, r28Var);
        }
    }

    public static final void w(boolean z, m45 m45Var, m45 m45Var2, r28 r28Var, boolean z2, x12 x12Var, int i) {
        boolean z3;
        m45Var.getClass();
        m45Var2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1478717099);
        int i2 = (p65Var.g(z) ? 4 : 2) | i | (p65Var.h(m45Var) ? 32 : 16) | (p65Var.h(m45Var2) ? 256 : 128) | 1794048;
        if (p65Var.P(i2 & 1, (599187 & i2) != 599186)) {
            k40.c(g56.c.a(new vj3(Float.NaN)), pxf.E(-97865237, new ap8(r28Var, z, m45Var2, m45Var), p65Var), p65Var, 56);
            z3 = true;
        } else {
            p65Var.S();
            z3 = z2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new al1(z, m45Var, m45Var2, r28Var, z3, i, 4);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final String x(az5 az5Var, x12 x12Var) {
        if (((t0) az5Var).isEmpty()) {
            p65 p65Var = (p65) x12Var;
            return km4.w(p65Var, -1156393968, R.string.paywall_call_to_action, p65Var, false);
        }
        if (bu1.m1(bu1.p1(az5Var)).size() != 1) {
            p65 p65Var2 = (p65) x12Var;
            return km4.w(p65Var2, -1156384477, R.string.paywall_free_trial_call_to_action_control, p65Var2, false);
        }
        p65 p65Var3 = (p65) x12Var;
        p65Var3.Y(-1488377980);
        String strQ = vo7.Q(R.string.paywall_free_trial_call_to_action_with_duration, new Object[]{huc.e((String) bu1.x0(az5Var), p65Var3)}, p65Var3);
        p65Var3.p(false);
        return strQ;
    }

    public static final String y(Object obj) {
        return obj + " cannot be saved using the current SaveableStateRegistry. The default implementation only supports types which can be stored inside the Bundle. Please consider implementing a custom Saver for this class and pass it to rememberSaveable().";
    }

    public static final wue z(View view) {
        view.getClass();
        while (view != null) {
            Object tag = view.getTag(R.id.view_tree_view_model_store_owner);
            wue wueVar = tag instanceof wue ? (wue) tag : null;
            if (wueVar != null) {
                return wueVar;
            }
            Object objU = ep7.u(view);
            view = objU instanceof View ? (View) objU : null;
        }
        return null;
    }
}
