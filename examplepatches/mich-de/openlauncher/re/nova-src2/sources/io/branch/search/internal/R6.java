package io.branch.search.internal;

import java.util.ArrayList;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntProgressionIterator;
import kotlin.ranges.IntRange;
import org.jetbrains.annotations.NotNull;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class R6 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final F4 f63261a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final P1 f63262b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final C3282n8 f63263c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final Z1 f63264d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final A9 f63265e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final C3454xb f63266f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final t70.c0 f63267g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final C3424vf f63268h;

    public static final class a {
        @JvmStatic
        @NotNull
        public static List a(@NotNull JSONObject jsonObject) {
            ArrayList arrayList;
            Intrinsics.g(jsonObject, "jsonObject");
            JSONArray jSONArrayOptJSONArray = jsonObject.optJSONArray("values");
            if (jSONArrayOptJSONArray == null) {
                arrayList = null;
            } else {
                IntRange intRange = new IntRange(0, jSONArrayOptJSONArray.length() - 1, 1);
                ArrayList arrayList2 = new ArrayList(b70.c.u0(intRange, 10));
                IntProgressionIterator it = intRange.iterator();
                while (it.f71911c) {
                    arrayList2.add(jSONArrayOptJSONArray.getJSONObject(it.nextInt()));
                }
                arrayList = arrayList2;
            }
            return arrayList == null ? EmptyList.f71733a : arrayList;
        }
    }

    public R6(@NotNull F4 contextDelegate, @NotNull P1 branchConfiguration, @NotNull C3282n8 remoteConfiguration, @NotNull Z1 branchDeviceInfo, @NotNull I analyticalBufferRepository, @NotNull B9 networkRepository, @NotNull C3454xb state, @NotNull t70.c0 ioDispatcher, @NotNull C3424vf validateLinksUseCase) {
        Intrinsics.g(contextDelegate, "contextDelegate");
        Intrinsics.g(branchConfiguration, "branchConfiguration");
        Intrinsics.g(remoteConfiguration, "remoteConfiguration");
        Intrinsics.g(branchDeviceInfo, "branchDeviceInfo");
        Intrinsics.g(analyticalBufferRepository, "analyticalBufferRepository");
        Intrinsics.g(networkRepository, "networkRepository");
        Intrinsics.g(state, "state");
        Intrinsics.g(ioDispatcher, "ioDispatcher");
        Intrinsics.g(validateLinksUseCase, "validateLinksUseCase");
        this.f63261a = contextDelegate;
        this.f63262b = branchConfiguration;
        this.f63263c = remoteConfiguration;
        this.f63264d = branchDeviceInfo;
        this.f63265e = networkRepository;
        this.f63266f = state;
        this.f63267g = ioDispatcher;
        this.f63268h = validateLinksUseCase;
    }
}
