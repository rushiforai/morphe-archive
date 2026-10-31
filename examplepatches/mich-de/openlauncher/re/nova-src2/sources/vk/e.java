package vk;

import java.nio.charset.Charset;

/* loaded from: classes3.dex */
public abstract class e {

    /* renamed from: a, reason: collision with root package name */
    public static final Charset f92807a = Charset.forName("US-ASCII");

    /* renamed from: b, reason: collision with root package name */
    public static final Charset f92808b = Charset.forName("ISO-8859-1");

    /* renamed from: c, reason: collision with root package name */
    public static final Charset f92809c = Charset.forName("UTF-8");

    /* renamed from: d, reason: collision with root package name */
    public static final Charset f92810d;

    static {
        Charset.forName("UTF-16BE");
        Charset.forName("UTF-16LE");
        f92810d = Charset.forName("UTF-16");
    }
}
