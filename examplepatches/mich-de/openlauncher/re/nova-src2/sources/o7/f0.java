package o7;

import java.util.Set;
import java.util.UUID;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class f0 {

    /* renamed from: a, reason: collision with root package name */
    public final UUID f79661a;

    /* renamed from: b, reason: collision with root package name */
    public final x7.q f79662b;

    /* renamed from: c, reason: collision with root package name */
    public final Set f79663c;

    public f0(UUID id2, x7.q workSpec, Set tags) {
        Intrinsics.g(id2, "id");
        Intrinsics.g(workSpec, "workSpec");
        Intrinsics.g(tags, "tags");
        this.f79661a = id2;
        this.f79662b = workSpec;
        this.f79663c = tags;
    }
}
