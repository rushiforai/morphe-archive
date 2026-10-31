package kotlin.text;

import java.nio.charset.Charset;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/text/Charsets;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class Charsets {

    /* renamed from: a, reason: collision with root package name */
    public static final Charsets f71999a = new Charsets();

    /* renamed from: b, reason: collision with root package name */
    public static final Charset f72000b;

    /* renamed from: c, reason: collision with root package name */
    public static final Charset f72001c;

    /* renamed from: d, reason: collision with root package name */
    public static volatile Charset f72002d;

    /* renamed from: e, reason: collision with root package name */
    public static volatile Charset f72003e;

    static {
        Charset charsetForName = Charset.forName("UTF-8");
        Intrinsics.f(charsetForName, "forName(...)");
        f72000b = charsetForName;
        Intrinsics.f(Charset.forName("UTF-16"), "forName(...)");
        Intrinsics.f(Charset.forName("UTF-16BE"), "forName(...)");
        Intrinsics.f(Charset.forName("UTF-16LE"), "forName(...)");
        Intrinsics.f(Charset.forName("US-ASCII"), "forName(...)");
        Charset charsetForName2 = Charset.forName("ISO-8859-1");
        Intrinsics.f(charsetForName2, "forName(...)");
        f72001c = charsetForName2;
    }

    private Charsets() {
    }
}
