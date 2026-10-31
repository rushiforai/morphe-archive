package io.branch.search.internal;

import android.content.pm.LauncherActivityInfo;
import android.os.Process;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class D0 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final F4 f62329a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final C3477z0 f62330b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final H f62331c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final F2 f62332d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final R6 f62333e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final P1 f62334f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final InterfaceC3244l4 f62335g;

    public D0(@NotNull F4 context, @NotNull C3477z0 appStoreDataSource, @NotNull I analyticalBufferRepository, @NotNull G2 remoteConfigManager, @NotNull R6 getAppStoreUseCase, @NotNull P1 branchConfiguration, @NotNull C3261m4 clock) {
        Intrinsics.g(context, "context");
        Intrinsics.g(appStoreDataSource, "appStoreDataSource");
        Intrinsics.g(analyticalBufferRepository, "analyticalBufferRepository");
        Intrinsics.g(remoteConfigManager, "remoteConfigManager");
        Intrinsics.g(getAppStoreUseCase, "getAppStoreUseCase");
        Intrinsics.g(branchConfiguration, "branchConfiguration");
        Intrinsics.g(clock, "clock");
        this.f62329a = context;
        this.f62330b = appStoreDataSource;
        this.f62331c = analyticalBufferRepository;
        this.f62332d = remoteConfigManager;
        this.f62333e = getAppStoreUseCase;
        this.f62334f = branchConfiguration;
        this.f62335g = clock;
    }

    public static final ArrayList a(D0 d02) {
        List<LauncherActivityInfo> activityList = d02.f62329a.g().getActivityList(null, Process.myUserHandle());
        Intrinsics.f(activityList, "context\n            .lau…s.Process.myUserHandle())");
        ArrayList arrayList = new ArrayList(b70.c.u0(activityList, 10));
        Iterator<T> it = activityList.iterator();
        while (it.hasNext()) {
            arrayList.add(((LauncherActivityInfo) it.next()).getComponentName().getPackageName());
        }
        return arrayList;
    }
}
