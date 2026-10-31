package t80;

import android.content.Context;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Regex;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public final class g {

    @NotNull
    public static final e Companion = new e();

    /* renamed from: b, reason: collision with root package name */
    public static final Regex f88910b = new Regex("https://meet\\.google\\.com/[a-z\\-]+");

    /* renamed from: c, reason: collision with root package name */
    public static final Regex f88911c = new Regex("https://[\\w-]*\\.?zoom.us/(j|my)/[\\d\\w?=-]+");

    /* renamed from: a, reason: collision with root package name */
    public final Context f88912a;

    public g(Context context) {
        Intrinsics.g(context, "context");
        this.f88912a = context;
    }
}
