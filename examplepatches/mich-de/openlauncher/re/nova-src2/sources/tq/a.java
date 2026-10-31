package tq;

import com.stripe.android.core.strings.IdentifierResolvableString;
import kotlin.collections.EmptyList;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.Intrinsics;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class a {

    /* renamed from: b, reason: collision with root package name */
    public static final a f89560b;

    /* renamed from: c, reason: collision with root package name */
    public static final a f89561c;

    /* renamed from: d, reason: collision with root package name */
    public static final a f89562d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ a[] f89563e;

    /* renamed from: a, reason: collision with root package name */
    public final Integer f89564a;

    static {
        a aVar = new a("Full", 0, null);
        f89560b = aVar;
        a aVar2 = new a("Partial", 1, 2132019974);
        f89561c = aVar2;
        a aVar3 = new a("None", 2, null);
        f89562d = aVar3;
        a[] aVarArr = {aVar, aVar2, aVar3};
        f89563e = aVarArr;
        EnumEntriesKt.a(aVarArr);
    }

    public a(String str, int i5, Integer num) {
        this.f89564a = num;
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f89563e.clone();
    }

    public final IdentifierResolvableString a(String merchantDisplayName) {
        Intrinsics.g(merchantDisplayName, "merchantDisplayName");
        Integer num = this.f89564a;
        if (num != null) {
            return zg.a.U(num.intValue(), new Object[]{merchantDisplayName}, EmptyList.f71733a);
        }
        return null;
    }
}
