package kotlin.io.path;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.SinceKotlin;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@SinceKotlin
@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\b\u0087\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001¨\u0006\u0002"}, d2 = {"Lkotlin/io/path/CopyActionResult;", b.f42142b, "kotlin-stdlib-jdk7"}, k = 1, mv = {2, 1, 0}, xi = 48)
@ExperimentalPathApi
/* loaded from: classes4.dex */
public final class CopyActionResult {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ CopyActionResult[] f71841a;

    static {
        CopyActionResult[] copyActionResultArr = {new CopyActionResult("CONTINUE", 0), new CopyActionResult("SKIP_SUBTREE", 1), new CopyActionResult("TERMINATE", 2)};
        f71841a = copyActionResultArr;
        EnumEntriesKt.a(copyActionResultArr);
    }

    public static CopyActionResult valueOf(String str) {
        return (CopyActionResult) Enum.valueOf(CopyActionResult.class, str);
    }

    public static CopyActionResult[] values() {
        return (CopyActionResult[]) f71841a.clone();
    }
}
