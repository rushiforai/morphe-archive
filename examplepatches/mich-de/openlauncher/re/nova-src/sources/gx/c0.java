package gx;

import java.util.UUID;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c0 {

    /* renamed from: a, reason: collision with root package name */
    public final f0 f58052a;

    /* renamed from: b, reason: collision with root package name */
    public final String f58053b;

    /* renamed from: c, reason: collision with root package name */
    public final String f58054c;

    /* renamed from: d, reason: collision with root package name */
    public volatile boolean f58055d;

    /* renamed from: e, reason: collision with root package name */
    public volatile Long f58056e;

    /* renamed from: f, reason: collision with root package name */
    public volatile int f58057f;

    public c0(f0 f0Var, String str, String str2) {
        String leaseId = UUID.randomUUID().toString();
        Intrinsics.g(leaseId, "leaseId");
        this.f58052a = f0Var;
        this.f58053b = str;
        this.f58054c = str2;
        this.f58055d = false;
        this.f58056e = null;
        this.f58057f = 0;
    }
}
