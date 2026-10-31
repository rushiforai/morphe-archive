package com.google.android.gms.internal.measurement;

import com.google.android.gms.common.Feature;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public abstract class h {

    /* renamed from: a, reason: collision with root package name */
    public static final Feature f32582a;

    /* renamed from: b, reason: collision with root package name */
    public static final Feature f32583b;

    /* renamed from: c, reason: collision with root package name */
    public static final Feature f32584c;

    /* renamed from: d, reason: collision with root package name */
    public static final Feature[] f32585d;

    static {
        Feature feature = new Feature(-1, 1L, "commit_to_configuration_v2_api", true);
        f32582a = feature;
        Feature feature2 = new Feature(-1, 1L, "get_serving_version_api", true);
        Feature feature3 = new Feature(-1, 1L, "get_experiment_tokens_api", true);
        Feature feature4 = new Feature(-1, 2L, "register_flag_update_listener_api", true);
        f32583b = feature4;
        Feature feature5 = new Feature(-1, 1L, "sync_after_api", true);
        Feature feature6 = new Feature(-1, 1L, "sync_after_for_application_api", true);
        Feature feature7 = new Feature(-1, 1L, "set_app_wide_properties_api", true);
        Feature feature8 = new Feature(-1, 1L, "set_runtime_properties_api", true);
        Feature feature9 = new Feature(-1, 1L, "get_storage_info_api", true);
        f32584c = feature9;
        f32585d = new Feature[]{feature, feature2, feature3, feature4, feature5, feature6, feature7, feature8, feature9};
    }

    public static f6 b(Object obj) {
        if (obj == null) {
            return f6.Ro;
        }
        if (obj instanceof String) {
            return new i6((String) obj);
        }
        if (obj instanceof Double) {
            return new s3((Double) obj);
        }
        if (obj instanceof Long) {
            return new s3(Double.valueOf(((Long) obj).doubleValue()));
        }
        if (obj instanceof Integer) {
            return new s3(Double.valueOf(((Integer) obj).doubleValue()));
        }
        if (obj instanceof Boolean) {
            return new h2((Boolean) obj);
        }
        if (!(obj instanceof Map)) {
            if (!(obj instanceof List)) {
                throw new IllegalArgumentException("Invalid value type");
            }
            s1 s1Var = new s1();
            Iterator it = ((List) obj).iterator();
            while (it.hasNext()) {
                s1Var.l(s1Var.j(), b(it.next()));
            }
            return s1Var;
        }
        c6 c6Var = new c6();
        Map map = (Map) obj;
        for (Object string : map.keySet()) {
            f6 f6VarB = b(map.get(string));
            if (string != null) {
                if (!(string instanceof String)) {
                    string = string.toString();
                }
                c6Var.c((String) string, f6VarB);
            }
        }
        return c6Var;
    }

    public static String c(String str) {
        if (str.length() > 23) {
            int i5 = -1;
            for (int length = str.length() - 1; length >= 0; length--) {
                char cCharAt = str.charAt(length);
                if (cCharAt == '.' || cCharAt == '$') {
                    i5 = length;
                    break;
                }
            }
            str = str.substring(i5 + 1);
        }
        String strConcat = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b.concat(String.valueOf(str));
        return strConcat.substring(0, Math.min(strConcat.length(), 23));
    }

    public static String d(byte[] bArr) {
        StringBuilder sb2 = new StringBuilder(bArr.length);
        for (byte b11 : bArr) {
            if (b11 == 34) {
                sb2.append("\\\"");
            } else if (b11 == 39) {
                sb2.append("\\'");
            } else if (b11 != 92) {
                switch (b11) {
                    case 7:
                        sb2.append("\\a");
                        break;
                    case 8:
                        sb2.append("\\b");
                        break;
                    case 9:
                        sb2.append("\\t");
                        break;
                    case 10:
                        sb2.append("\\n");
                        break;
                    case 11:
                        sb2.append("\\v");
                        break;
                    case 12:
                        sb2.append("\\f");
                        break;
                    case 13:
                        sb2.append("\\r");
                        break;
                    default:
                        if (b11 < 32 || b11 > 126) {
                            sb2.append(AbstractJsonLexerKt.STRING_ESC);
                            sb2.append((char) (((b11 >>> 6) & 3) + 48));
                            sb2.append((char) (((b11 >>> 3) & 7) + 48));
                            sb2.append((char) ((b11 & 7) + 48));
                            break;
                        } else {
                            sb2.append((char) b11);
                            break;
                        }
                }
            } else {
                sb2.append("\\\\");
            }
        }
        return sb2.toString();
    }

    public static void e(String str, Object[] objArr, boolean z11) {
        if (!z11) {
            throw new IllegalArgumentException(String.format(str, objArr));
        }
    }

    public static int f(Level level) {
        int iIntValue = level.intValue();
        if (iIntValue >= Level.SEVERE.intValue()) {
            return 6;
        }
        if (iIntValue >= Level.WARNING.intValue()) {
            return 5;
        }
        if (iIntValue >= Level.INFO.intValue()) {
            return 4;
        }
        return iIntValue >= Level.FINE.intValue() ? 3 : 2;
    }

    public static f6 g(xa xaVar) {
        if (xaVar == null) {
            return f6.Qo;
        }
        int iF = xaVar.F() - 1;
        if (iF == 1) {
            return xaVar.z() ? new i6(xaVar.A()) : f6.Xo;
        }
        if (iF == 2) {
            return xaVar.D() ? new s3(Double.valueOf(xaVar.E())) : new s3(null);
        }
        if (iF == 3) {
            return xaVar.B() ? new h2(Boolean.valueOf(xaVar.C())) : new h2(null);
        }
        if (iF != 4) {
            throw new IllegalArgumentException("Unknown type found. Cannot convert entity");
        }
        List listX = xaVar.x();
        ArrayList arrayList = new ArrayList();
        Iterator it = listX.iterator();
        while (it.hasNext()) {
            arrayList.add(g((xa) it.next()));
        }
        return new g6(xaVar.y(), arrayList);
    }

    public abstract int a();

    public abstract th h(int i5);

    public abstract Object i(int i5);

    public abstract Object j(th thVar);
}
