package io.branch.search.internal;

import java.util.List;
import java.util.Map;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.g3, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3159g3 {

    /* renamed from: a, reason: collision with root package name */
    @gn.a
    @gn.c("action")
    @Nullable
    public final String f64551a;

    /* renamed from: b, reason: collision with root package name */
    @gn.a
    @gn.c("db")
    @Nullable
    public final String f64552b;

    /* renamed from: c, reason: collision with root package name */
    @gn.a
    @gn.c("delete_db")
    @Nullable
    public final String f64553c;

    /* renamed from: d, reason: collision with root package name */
    @gn.a
    @gn.c("stmts")
    @Nullable
    public final List<Ae> f64554d;

    /* renamed from: e, reason: collision with root package name */
    @gn.a
    @gn.c("set_queries")
    @Nullable
    public final Map<String, Map<String, Object>> f64555e;

    /* renamed from: f, reason: collision with root package name */
    @gn.a
    @gn.c("set_setup_teardown_queries")
    @Nullable
    public final Map<String, W3> f64556f;

    /* renamed from: g, reason: collision with root package name */
    @gn.a
    @gn.c("bucket_size")
    @Nullable
    public final Integer f64557g;

    /* renamed from: h, reason: collision with root package name */
    @gn.a
    @gn.c("image_queries")
    @Nullable
    public final Map<String, C3150fb> f64558h;

    /* renamed from: i, reason: collision with root package name */
    @gn.a
    @gn.c("ssml_queries")
    @Nullable
    public final Map<String, C3150fb> f64559i;

    /* renamed from: j, reason: collision with root package name */
    @gn.a
    @gn.c("set_versions")
    @Nullable
    public final Map<String, String> f64560j;

    /* renamed from: k, reason: collision with root package name */
    @gn.a
    @gn.c("local_replicas_whitelist")
    @NotNull
    public final List<String> f64561k;

    public C3159g3() {
        this(0);
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3159g3)) {
            return false;
        }
        C3159g3 c3159g3 = (C3159g3) obj;
        return Intrinsics.b(this.f64551a, c3159g3.f64551a) && Intrinsics.b(this.f64552b, c3159g3.f64552b) && Intrinsics.b(this.f64553c, c3159g3.f64553c) && Intrinsics.b(this.f64554d, c3159g3.f64554d) && Intrinsics.b(this.f64555e, c3159g3.f64555e) && Intrinsics.b(this.f64556f, c3159g3.f64556f) && Intrinsics.b(this.f64557g, c3159g3.f64557g) && Intrinsics.b(this.f64558h, c3159g3.f64558h) && Intrinsics.b(this.f64559i, c3159g3.f64559i) && Intrinsics.b(this.f64560j, c3159g3.f64560j) && Intrinsics.b(this.f64561k, c3159g3.f64561k);
    }

    public final int hashCode() {
        String str = this.f64551a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f64552b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f64553c;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        List<Ae> list = this.f64554d;
        int iHashCode4 = (iHashCode3 + (list == null ? 0 : list.hashCode())) * 31;
        Map<String, Map<String, Object>> map = this.f64555e;
        int iHashCode5 = (iHashCode4 + (map == null ? 0 : map.hashCode())) * 31;
        Map<String, W3> map2 = this.f64556f;
        int iHashCode6 = (iHashCode5 + (map2 == null ? 0 : map2.hashCode())) * 31;
        Integer num = this.f64557g;
        int iHashCode7 = (iHashCode6 + (num == null ? 0 : num.hashCode())) * 31;
        Map<String, C3150fb> map3 = this.f64558h;
        int iHashCode8 = (iHashCode7 + (map3 == null ? 0 : map3.hashCode())) * 31;
        Map<String, C3150fb> map4 = this.f64559i;
        int iHashCode9 = (iHashCode8 + (map4 == null ? 0 : map4.hashCode())) * 31;
        Map<String, String> map5 = this.f64560j;
        return this.f64561k.hashCode() + ((iHashCode9 + (map5 != null ? map5.hashCode() : 0)) * 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("BundleAction(action=");
        sb2.append(this.f64551a);
        sb2.append(", db=");
        sb2.append(this.f64552b);
        sb2.append(", deleteDb=");
        sb2.append(this.f64553c);
        sb2.append(", stmts=");
        sb2.append(this.f64554d);
        sb2.append(", setQueries=");
        sb2.append(this.f64555e);
        sb2.append(", setSetupTeardownQueries=");
        sb2.append(this.f64556f);
        sb2.append(", bucketSize=");
        sb2.append(this.f64557g);
        sb2.append(", imageQueries=");
        sb2.append(this.f64558h);
        sb2.append(", ssmlQueries=");
        sb2.append(this.f64559i);
        sb2.append(", setVersions=");
        sb2.append(this.f64560j);
        sb2.append(", localReplicasWhitelist=");
        return fq.c.e(sb2, this.f64561k, ')');
    }

    /* JADX WARN: Multi-variable type inference failed */
    public C3159g3(@Nullable String str, @Nullable String str2, @Nullable String str3, @Nullable List<Ae> list, @Nullable Map<String, ? extends Map<String, ? extends Object>> map, @Nullable Map<String, W3> map2, @Nullable Integer num, @Nullable Map<String, C3150fb> map3, @Nullable Map<String, C3150fb> map4, @Nullable Map<String, String> map5, @NotNull List<String> localReplicasWhitelist) {
        Intrinsics.g(localReplicasWhitelist, "localReplicasWhitelist");
        this.f64551a = str;
        this.f64552b = str2;
        this.f64553c = str3;
        this.f64554d = list;
        this.f64555e = map;
        this.f64556f = map2;
        this.f64557g = num;
        this.f64558h = map3;
        this.f64559i = map4;
        this.f64560j = map5;
        this.f64561k = localReplicasWhitelist;
    }

    public C3159g3(int i5) {
        this(null, null, null, null, null, null, null, null, null, null, EmptyList.f71733a);
    }
}
