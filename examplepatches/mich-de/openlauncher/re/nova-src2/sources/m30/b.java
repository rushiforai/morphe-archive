package m30;

import android.text.TextUtils;
import java.text.Collator;

/* loaded from: classes4.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public static final Collator f75993a = Collator.getInstance();

    /* renamed from: b, reason: collision with root package name */
    public static final a f75994b = new a(0);

    /* renamed from: c, reason: collision with root package name */
    public static String f75995c = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    /* renamed from: d, reason: collision with root package name */
    public static final a f75996d = new a(1);

    /* renamed from: e, reason: collision with root package name */
    public static final a f75997e = new a(2);

    public static String a(CharSequence charSequence) {
        boolean zIsEmpty = TextUtils.isEmpty(charSequence);
        a aVar = f75996d;
        if (zIsEmpty) {
            aVar.getClass();
            return "…";
        }
        char cCharAt = charSequence.charAt(0);
        return f75994b.b0(cCharAt) ? "#" : (aVar.b0(cCharAt) || f75997e.b0(cCharAt)) ? "…" : String.valueOf(Character.toTitleCase(cCharAt));
    }
}
