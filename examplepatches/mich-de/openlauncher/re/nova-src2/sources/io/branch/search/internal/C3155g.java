package io.branch.search.internal;

import io.branch.search.internal.requesthandler.model.Link;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.g, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3155g {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f64529a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f64530b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final String f64531c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final String f64532d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final String f64533e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final List<Link> f64534f;

    /* renamed from: g, reason: collision with root package name */
    @Nullable
    public final C7 f64535g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final String f64536h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final List<Long> f64537i;

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public final List<Long> f64538j;

    public C3155g(@NotNull String type, @NotNull String groupId, @NotNull String id2, @NotNull String title, @NotNull List linking, @Nullable C7 c72, @NotNull String packageValue, @NotNull List searchTimes, @NotNull List usageTimes) {
        Intrinsics.g(type, "type");
        Intrinsics.g(groupId, "groupId");
        Intrinsics.g(id2, "id");
        Intrinsics.g(title, "title");
        Intrinsics.g(linking, "linking");
        Intrinsics.g(packageValue, "packageValue");
        Intrinsics.g(searchTimes, "searchTimes");
        Intrinsics.g(usageTimes, "usageTimes");
        this.f64529a = type;
        this.f64530b = groupId;
        this.f64531c = id2;
        this.f64532d = title;
        this.f64533e = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f64534f = linking;
        this.f64535g = c72;
        this.f64536h = packageValue;
        this.f64537i = searchTimes;
        this.f64538j = usageTimes;
    }

    @NotNull
    public final String a() {
        return this.f64531c;
    }

    @NotNull
    public final String b() {
        return this.f64536h;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3155g)) {
            return false;
        }
        C3155g c3155g = (C3155g) obj;
        return Intrinsics.b(this.f64529a, c3155g.f64529a) && Intrinsics.b(this.f64530b, c3155g.f64530b) && Intrinsics.b(this.f64531c, c3155g.f64531c) && Intrinsics.b(this.f64532d, c3155g.f64532d) && Intrinsics.b(this.f64533e, c3155g.f64533e) && Intrinsics.b(this.f64534f, c3155g.f64534f) && Intrinsics.b(this.f64535g, c3155g.f64535g) && Intrinsics.b(this.f64536h, c3155g.f64536h) && Intrinsics.b(this.f64537i, c3155g.f64537i) && Intrinsics.b(this.f64538j, c3155g.f64538j);
    }

    public final int hashCode() {
        int iA = C3265m8.a(this.f64534f, C3248l8.a(this.f64533e, C3248l8.a(this.f64532d, C3248l8.a(this.f64531c, C3248l8.a(this.f64530b, this.f64529a.hashCode() * 31, 31), 31), 31), 31), 31);
        C7 c72 = this.f64535g;
        return this.f64538j.hashCode() + C3265m8.a(this.f64537i, C3248l8.a(this.f64536h, (iA + (c72 == null ? 0 : c72.hashCode())) * 31, 31), 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Action(type=");
        sb2.append(this.f64529a);
        sb2.append(", groupId=");
        sb2.append(this.f64530b);
        sb2.append(", id=");
        sb2.append(this.f64531c);
        sb2.append(", title=");
        sb2.append(this.f64532d);
        sb2.append(", description=");
        sb2.append(this.f64533e);
        sb2.append(", linking=");
        sb2.append(this.f64534f);
        sb2.append(", primaryImage=");
        sb2.append(this.f64535g);
        sb2.append(", packageValue=");
        sb2.append(this.f64536h);
        sb2.append(", searchTimes=");
        sb2.append(this.f64537i);
        sb2.append(", usageTimes=");
        return Ob.a(sb2, this.f64538j, ')');
    }
}
