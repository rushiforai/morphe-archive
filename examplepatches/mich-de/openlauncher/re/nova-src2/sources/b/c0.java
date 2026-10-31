package b;

import ads_mobile_sdk.mu0;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.UUID;
import kotlin.ResultKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract /* synthetic */ class c0 {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int[] f15786a = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE, 120, Sdk.SDKError.Reason.TPAT_ERROR_VALUE, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE};

    public static void A(StringBuilder sb2, int i5, String str, int i11, String str2) {
        sb2.append(i5);
        sb2.append(str);
        sb2.append(i11);
        sb2.append(str2);
    }

    public static void B(StringBuilder sb2, String str, long j11, String str2) {
        sb2.append(str);
        sb2.append(j11);
        sb2.append(str2);
    }

    public static void C(StringBuilder sb2, String str, String str2, String str3) {
        sb2.append(str);
        sb2.append(str2);
        sb2.append(str3);
    }

    public static void D(StringBuilder sb2, String str, String str2, String str3, String str4) {
        sb2.append(str);
        sb2.append(str2);
        sb2.append(str3);
        sb2.append(str4);
    }

    public static String E(String str, String str2) {
        return str + str2;
    }

    public static /* synthetic */ int F(int i5) {
        if (i5 != 0) {
            return i5 - 1;
        }
        throw null;
    }

    public static /* synthetic */ int[] G(int i5) {
        int[] iArr = new int[i5];
        System.arraycopy(f15786a, 0, iArr, 0, i5);
        return iArr;
    }

    public static /* synthetic */ void a(int i5) {
        if (i5 == 0) {
            throw null;
        }
    }

    public static /* synthetic */ boolean b(int i5, int i11) {
        if (i5 != 0) {
            return i5 == i11;
        }
        throw null;
    }

    public static int c(int i5, int i11, int i12, int i13) {
        return ((i5 - i11) / i12) + i13;
    }

    public static int d(int i5, int i11, long j11) {
        return (Long.hashCode(j11) + i5) * i11;
    }

    public static int e(int i5, int i11, String str) {
        return (str.hashCode() + i5) * i11;
    }

    public static b70.a f(i70.a aVar, i70.a aVar2) {
        aVar.getClass();
        return new b70.a(aVar2);
    }

    public static String g(int i5, int i11, String str, String str2) {
        return str + i5 + str2 + i11;
    }

    public static String h(int i5, String str) {
        return str + i5;
    }

    public static String i(int i5, String str, String str2) {
        return str + i5 + str2;
    }

    public static String j(String str) {
        String string = UUID.randomUUID().toString();
        Intrinsics.f(string, str);
        return string;
    }

    public static String k(String str, String str2) {
        return str + str2;
    }

    public static String l(String str, String str2, String str3) {
        return str + str2 + str3;
    }

    public static String m(String str, String str2, String str3, String str4) {
        return str + str2 + str3 + str4;
    }

    public static String n(String str, String str2, String str3, String str4, String str5) {
        return str + str2 + str3 + str4 + str5;
    }

    public static String o(StringBuilder sb2, int i5, String str) {
        sb2.append(i5);
        sb2.append(str);
        return sb2.toString();
    }

    public static String p(StringBuilder sb2, String str, int i5) {
        sb2.append(str);
        sb2.append(i5);
        return sb2.toString();
    }

    public static String q(StringBuilder sb2, String str, String str2) {
        sb2.append(str);
        sb2.append(str2);
        return sb2.toString();
    }

    public static String r(StringBuilder sb2, String str, String str2, String str3) {
        sb2.append(str);
        sb2.append(str2);
        sb2.append(str3);
        return sb2.toString();
    }

    public static String s(StringBuilder sb2, String str, String str2, String str3, String str4) {
        sb2.append(str);
        sb2.append(str2);
        sb2.append(str3);
        sb2.append(str4);
        return sb2.toString();
    }

    public static StringBuilder t(int i5, String str, String str2, int i11, String str3) {
        StringBuilder sb2 = new StringBuilder(str);
        sb2.append(i5);
        sb2.append(str2);
        sb2.append(i11);
        sb2.append(str3);
        return sb2;
    }

    public static StringBuilder u(long j11, String str, String str2) {
        StringBuilder sb2 = new StringBuilder(str);
        sb2.append(j11);
        sb2.append(str2);
        return sb2;
    }

    public static StringBuilder v(String str, int i5, String str2, String str3, String str4) {
        StringBuilder sb2 = new StringBuilder(str);
        sb2.append(str2);
        sb2.append(str3);
        sb2.append(i5);
        sb2.append(str4);
        return sb2;
    }

    public static StringBuilder w(String str, String str2, String str3, String str4, String str5) {
        StringBuilder sb2 = new StringBuilder(str);
        sb2.append(str2);
        sb2.append(str3);
        sb2.append(str4);
        sb2.append(str5);
        return sb2;
    }

    public static ArrayList x(Object obj) {
        ResultKt.b(obj);
        return new ArrayList();
    }

    public static /* synthetic */ void y(Object obj) {
        if (obj != null) {
            throw new ClassCastException();
        }
    }

    public static void z(String str, String str2, String str3) {
        mu0.b(str + str2 + str3, null);
    }
}
