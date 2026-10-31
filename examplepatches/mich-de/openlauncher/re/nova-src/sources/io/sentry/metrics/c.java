package io.sentry.metrics;

import io.sentry.util.f;
import java.util.regex.Pattern;

/* loaded from: classes4.dex */
public abstract class c {

    /* renamed from: a, reason: collision with root package name */
    public static final long f67399a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ int f67400b = 0;

    static {
        Pattern.compile("\\W+");
        Pattern.compile("[^\\w\\-.]+");
        Pattern.compile("[^\\w\\-./]+");
        f67399a = (long) ((new f().a(24) / 1.6777216E7f) * 10000.0f);
    }
}
