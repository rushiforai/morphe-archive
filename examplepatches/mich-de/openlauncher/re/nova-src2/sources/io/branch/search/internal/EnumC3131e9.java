package io.branch.search.internal;

import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.e9, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public enum EnumC3131e9 {
    InternalDebug("Internal-DEBUG"),
    ProcessLifecycle("process-lifecycle"),
    Init("branch-init"),
    PackageSync("package-sync"),
    UserAgentFetch("UserAgentFetch"),
    BundleUpdates("BundleUpdates"),
    /* JADX INFO: Fake field, exist only in values array */
    NetworkRequests("network-requests"),
    ContentProviderRequests("content-provider-request"),
    ScheduledJobRuns("scheduled-job-runs"),
    UnhandledCoroutineException("unhandled-coroutine-exception"),
    UncaughtExceptionHandler("uncaught-exception-handler"),
    WorkflowExecution("workflow"),
    Database("database"),
    AppUsage("app-usage"),
    Others("BranchSearchSDK"),
    Latency("latency"),
    SesameLite("SesameLite"),
    Cache("sdk-cache"),
    BranchResult("Bresult");


    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f64390a;

    EnumC3131e9(String str) {
        this.f64390a = str;
    }
}
