package com.google.gson;

import java.util.Objects;

/* loaded from: classes.dex */
public final class j {

    /* renamed from: d, reason: collision with root package name */
    public static final j f34785d = new j(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, false);

    /* renamed from: e, reason: collision with root package name */
    public static final j f34786e = new j("\n", "  ", true);

    /* renamed from: a, reason: collision with root package name */
    public final String f34787a;

    /* renamed from: b, reason: collision with root package name */
    public final String f34788b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f34789c;

    public j(String str, String str2, boolean z11) {
        Objects.requireNonNull(str, "newline == null");
        if (!str.matches("[\r\n]*")) {
            throw new IllegalArgumentException("Only combinations of \\n and \\r are allowed in newline.");
        }
        if (!str2.matches("[ \t]*")) {
            throw new IllegalArgumentException("Only combinations of spaces and tabs are allowed in indent.");
        }
        this.f34787a = str;
        this.f34788b = str2;
        this.f34789c = z11;
    }
}
