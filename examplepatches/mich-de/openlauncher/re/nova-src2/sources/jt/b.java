package jt;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class b {

    /* renamed from: b, reason: collision with root package name */
    public static final b f69756b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ b[] f69757c;

    /* renamed from: a, reason: collision with root package name */
    public final String f69758a;

    static {
        b bVar = new b("PaymentElement", 0, "android_payment_element");
        f69756b = bVar;
        b[] bVarArr = {bVar, new b("CryptoOnramp", 1, "android_crypto_onramp")};
        f69757c = bVarArr;
        EnumEntriesKt.a(bVarArr);
    }

    public b(String str, int i5, String str2) {
        this.f69758a = str2;
    }

    public static b valueOf(String str) {
        return (b) Enum.valueOf(b.class, str);
    }

    public static b[] values() {
        return (b[]) f69757c.clone();
    }

    @Override // java.lang.Enum
    public final String toString() {
        return this.f69758a;
    }
}
