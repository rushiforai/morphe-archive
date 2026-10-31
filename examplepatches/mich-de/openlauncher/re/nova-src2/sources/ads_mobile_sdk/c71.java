package ads_mobile_sdk;

import b.o2;
import com.google.gson.Gson;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class c71 {

    /* renamed from: a, reason: collision with root package name */
    public final w81 f1702a;

    /* renamed from: b, reason: collision with root package name */
    public final o2 f1703b;

    /* renamed from: c, reason: collision with root package name */
    public final Gson f1704c;

    /* renamed from: d, reason: collision with root package name */
    public final jr0 f1705d;

    public c71(w81 inspectorManager, o2 clock, Gson gson, jr0 flags) {
        Intrinsics.g(inspectorManager, "inspectorManager");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(flags, "flags");
        this.f1702a = inspectorManager;
        this.f1703b = clock;
        this.f1704c = gson;
        this.f1705d = flags;
    }
}
