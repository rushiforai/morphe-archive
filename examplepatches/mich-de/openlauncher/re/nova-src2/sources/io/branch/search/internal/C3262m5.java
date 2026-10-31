package io.branch.search.internal;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.m5, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3262m5 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    public final long f65080a;

    /* renamed from: io.branch.search.internal.m5$a */
    public static final class a {
    }

    public C3262m5(long j11) {
        this.f65080a = j11;
    }

    @NotNull
    public final String a(int i5) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        simpleDateFormat.setTimeZone(TimeZone.getDefault());
        String str = simpleDateFormat.format(new Date((System.currentTimeMillis() - (Math.abs(i5) * 86400000)) + this.f65080a));
        Intrinsics.f(str, "getSimpleDateFormat().fo…getNdaysAgoMillis(days)))");
        return str;
    }
}
