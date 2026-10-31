package xv;

import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class c {

    /* renamed from: c, reason: collision with root package name */
    public static final c f96423c;

    /* renamed from: d, reason: collision with root package name */
    public static final c f96424d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ c[] f96425e;

    /* renamed from: a, reason: collision with root package name */
    public final int f96426a;

    /* renamed from: b, reason: collision with root package name */
    public final String f96427b;

    static {
        c cVar = new c("InvalidMessageReceived", 0, 101, "Message is not AReq, ARes, CReq, CRes, PReq, PRes, RReq, or RRes");
        c cVar2 = new c("UnsupportedMessageVersion", 1, 102, "Message Version Number received is not valid for the receiving component.");
        c cVar3 = new c("RequiredDataElementMissing", 2, 201, "A message element required as defined in Table A.1 is missing from the message.");
        c cVar4 = new c("UnrecognizedCriticalMessageExtensions", 3, Sdk.SDKError.Reason.AD_CONSUMED_VALUE, "Critical message extension not recognised.");
        f96423c = cVar4;
        c cVar5 = new c("InvalidDataElementFormat", 4, Sdk.SDKError.Reason.AD_IS_LOADING_VALUE, "Data element not in the required format or value is invalid as defined in Table A.1");
        c cVar6 = new c("InvalidTransactionId", 5, 301, "Transaction ID received is not valid for the receiving component.");
        c cVar7 = new c("DataDecryptionFailure", 6, 302, "Data could not be decrypted by the receiving system due to technical or other reason.");
        f96424d = cVar7;
        c[] cVarArr = {cVar, cVar2, cVar3, cVar4, cVar5, cVar6, cVar7, new c("TransactionTimedout", 7, TTAdConstant.AD_ID_IS_NULL_CODE, "Transaction timed-out.")};
        f96425e = cVarArr;
        EnumEntriesKt.a(cVarArr);
    }

    public c(String str, int i5, int i11, String str2) {
        this.f96426a = i11;
        this.f96427b = str2;
    }

    public static c valueOf(String str) {
        return (c) Enum.valueOf(c.class, str);
    }

    public static c[] values() {
        return (c[]) f96425e.clone();
    }
}
