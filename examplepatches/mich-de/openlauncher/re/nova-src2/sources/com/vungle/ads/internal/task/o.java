package com.vungle.ads.internal.task;

import android.content.Context;
import com.vungle.ads.internal.util.PathProvider;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class o implements d {

    /* renamed from: a, reason: collision with root package name */
    public final Context f47543a;

    /* renamed from: b, reason: collision with root package name */
    public final PathProvider f47544b;

    public o(Context context, PathProvider pathProvider) {
        Intrinsics.g(context, "context");
        Intrinsics.g(pathProvider, "pathProvider");
        this.f47543a = context;
        this.f47544b = pathProvider;
    }

    public final c a(String tag) throws n {
        Intrinsics.g(tag, "tag");
        if (tag.length() == 0) {
            throw new n("Job tag is null");
        }
        if (tag.equals("CleanupJob")) {
            return new b(this.f47543a, this.f47544b);
        }
        if (tag.equals("ResendTpatJob")) {
            return new l(this.f47543a, this.f47544b);
        }
        throw new n(com.iab.omid.library.vungle.d.a("Unknown Job Type ", tag));
    }
}
