package ir;

import com.tiktok.appevents.contents.TTContentsEventConstants;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public static final b f67995a;

    /* renamed from: b, reason: collision with root package name */
    public static final b f67996b;

    /* renamed from: c, reason: collision with root package name */
    public static final b f67997c;

    /* renamed from: d, reason: collision with root package name */
    public static final b f67998d;

    /* renamed from: e, reason: collision with root package name */
    public static final b f67999e;

    /* renamed from: f, reason: collision with root package name */
    public static final b f68000f;

    /* renamed from: g, reason: collision with root package name */
    public static final b f68001g;

    /* renamed from: h, reason: collision with root package name */
    public static final b f68002h;

    /* renamed from: i, reason: collision with root package name */
    public static final b f68003i;

    /* renamed from: j, reason: collision with root package name */
    public static final b f68004j;

    /* renamed from: k, reason: collision with root package name */
    public static final /* synthetic */ b[] f68005k;

    static {
        b bVar = new b("Loading", 0);
        f67995a = bVar;
        b bVar2 = new b(TTContentsEventConstants.ContentsEventName.EVENT_NAME_CHECK_OUT, 1);
        f67996b = bVar2;
        b bVar3 = new b("LinkSignup", 2);
        f67997c = bVar3;
        b bVar4 = new b("ConfirmButtonClicked", 3);
        f67998d = bVar4;
        b bVar5 = new b("CardScan", 4);
        f67999e = bVar5;
        b bVar6 = new b("Captcha", 5);
        f68000f = bVar6;
        b bVar7 = new b("CaptchaAttach", 6);
        f68001g = bVar7;
        b bVar8 = new b("PaymentLauncher", 7);
        f68002h = bVar8;
        b bVar9 = new b("PrepareAttestation", 8);
        f68003i = bVar9;
        b bVar10 = new b("Attest", 9);
        f68004j = bVar10;
        b[] bVarArr = {bVar, bVar2, bVar3, bVar4, bVar5, bVar6, bVar7, bVar8, bVar9, bVar10};
        f68005k = bVarArr;
        EnumEntriesKt.a(bVarArr);
    }

    public static b valueOf(String str) {
        return (b) Enum.valueOf(b.class, str);
    }

    public static b[] values() {
        return (b[]) f68005k.clone();
    }
}
