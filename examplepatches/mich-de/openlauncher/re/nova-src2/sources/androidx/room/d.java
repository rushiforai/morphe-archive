package androidx.room;

import android.content.Context;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Executor;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final Context f15204a;

    /* renamed from: b, reason: collision with root package name */
    public final String f15205b;

    /* renamed from: c, reason: collision with root package name */
    public final d7.c f15206c;

    /* renamed from: d, reason: collision with root package name */
    public final a0.b f15207d;

    /* renamed from: e, reason: collision with root package name */
    public final List f15208e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f15209f;

    /* renamed from: g, reason: collision with root package name */
    public final int f15210g;

    /* renamed from: h, reason: collision with root package name */
    public final Executor f15211h;

    /* renamed from: i, reason: collision with root package name */
    public final Executor f15212i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f15213j;

    /* renamed from: k, reason: collision with root package name */
    public final boolean f15214k;

    /* renamed from: l, reason: collision with root package name */
    public final Set f15215l;

    /* renamed from: m, reason: collision with root package name */
    public final List f15216m;
    public final List n;

    public d(Context context, String str, d7.c cVar, a0.b migrationContainer, ArrayList arrayList, boolean z11, int i5, Executor queryExecutor, Executor transactionExecutor, boolean z12, boolean z13, LinkedHashSet linkedHashSet, ArrayList typeConverters, ArrayList autoMigrationSpecs) {
        Intrinsics.g(context, "context");
        Intrinsics.g(migrationContainer, "migrationContainer");
        fq.c.o(i5, "journalMode");
        Intrinsics.g(queryExecutor, "queryExecutor");
        Intrinsics.g(transactionExecutor, "transactionExecutor");
        Intrinsics.g(typeConverters, "typeConverters");
        Intrinsics.g(autoMigrationSpecs, "autoMigrationSpecs");
        this.f15204a = context;
        this.f15205b = str;
        this.f15206c = cVar;
        this.f15207d = migrationContainer;
        this.f15208e = arrayList;
        this.f15209f = z11;
        this.f15210g = i5;
        this.f15211h = queryExecutor;
        this.f15212i = transactionExecutor;
        this.f15213j = z12;
        this.f15214k = z13;
        this.f15215l = linkedHashSet;
        this.f15216m = typeConverters;
        this.n = autoMigrationSpecs;
    }
}
