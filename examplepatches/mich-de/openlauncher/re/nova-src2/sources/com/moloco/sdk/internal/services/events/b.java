package com.moloco.sdk.internal.services.events;

import com.google.protobuf.n0;
import com.moloco.sdk.UserIntent;
import com.moloco.sdk.internal.services.E;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final String f37980a = "CustomUserEventBuilderServiceImpl";

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public static final String f37981b = "user_ad_interaction_ext";

    public /* synthetic */ class a {

        /* renamed from: a, reason: collision with root package name */
        public static final /* synthetic */ int[] f37982a;

        static {
            int[] iArr = new int[a.AbstractC0299a.c.EnumC0301a.values().length];
            try {
                iArr[a.AbstractC0299a.c.EnumC0301a.f42155a.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                iArr[a.AbstractC0299a.c.EnumC0301a.f42156b.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                iArr[a.AbstractC0299a.c.EnumC0301a.f42157c.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                iArr[a.AbstractC0299a.c.EnumC0301a.f42158d.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                iArr[a.AbstractC0299a.c.EnumC0301a.f42159e.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                iArr[a.AbstractC0299a.c.EnumC0301a.f42160f.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                iArr[a.AbstractC0299a.c.EnumC0301a.f42161g.ordinal()] = 7;
            } catch (NoSuchFieldError unused7) {
            }
            try {
                iArr[a.AbstractC0299a.c.EnumC0301a.f42162h.ordinal()] = 8;
            } catch (NoSuchFieldError unused8) {
            }
            try {
                iArr[a.AbstractC0299a.c.EnumC0301a.f42163i.ordinal()] = 9;
            } catch (NoSuchFieldError unused9) {
            }
            f37982a = iArr;
        }
    }

    @NotNull
    public static final UserIntent.UserAdInteractionExt.Button.Type a(@NotNull a.AbstractC0299a.c.EnumC0301a enumC0301a) {
        Intrinsics.g(enumC0301a, "<this>");
        switch (a.f37982a[enumC0301a.ordinal()]) {
            case 1:
                return UserIntent.UserAdInteractionExt.Button.Type.NONE;
            case 2:
                return UserIntent.UserAdInteractionExt.Button.Type.CLOSE;
            case 3:
                return UserIntent.UserAdInteractionExt.Button.Type.SKIP;
            case 4:
                return UserIntent.UserAdInteractionExt.Button.Type.DEC_SKIP;
            case 5:
                return UserIntent.UserAdInteractionExt.Button.Type.MUTE;
            case 6:
                return UserIntent.UserAdInteractionExt.Button.Type.UNMUTE;
            case 7:
                return UserIntent.UserAdInteractionExt.Button.Type.CTA;
            case 8:
                return UserIntent.UserAdInteractionExt.Button.Type.REPLAY;
            case 9:
                return UserIntent.UserAdInteractionExt.Button.Type.AD_BADGE;
            default:
                throw new NoWhenBranchMatchedException();
        }
    }

    @NotNull
    public static final UserIntent.UserAdInteractionExt.Position a(@NotNull a.AbstractC0299a.f fVar) {
        Intrinsics.g(fVar, "<this>");
        UserIntent.UserAdInteractionExt.Position.Builder builderNewBuilder = UserIntent.UserAdInteractionExt.Position.newBuilder();
        builderNewBuilder.setX(fVar.c());
        builderNewBuilder.setY(fVar.d());
        n0 n0VarBuild = builderNewBuilder.build();
        Intrinsics.f(n0VarBuild, "build(...)");
        return (UserIntent.UserAdInteractionExt.Position) n0VarBuild;
    }

    @NotNull
    public static final UserIntent.UserAdInteractionExt.Size a(@NotNull a.AbstractC0299a.g gVar) {
        Intrinsics.g(gVar, "<this>");
        UserIntent.UserAdInteractionExt.Size.Builder builderNewBuilder = UserIntent.UserAdInteractionExt.Size.newBuilder();
        builderNewBuilder.setW(gVar.d());
        builderNewBuilder.setH(gVar.c());
        n0 n0VarBuild = builderNewBuilder.build();
        Intrinsics.f(n0VarBuild, "build(...)");
        return (UserIntent.UserAdInteractionExt.Size) n0VarBuild;
    }

    @NotNull
    public static final UserIntent.UserAdInteractionExt.Size a(@NotNull E e3) {
        Intrinsics.g(e3, "<this>");
        UserIntent.UserAdInteractionExt.Size.Builder builderNewBuilder = UserIntent.UserAdInteractionExt.Size.newBuilder();
        builderNewBuilder.setW(e3.m());
        builderNewBuilder.setH(e3.k());
        n0 n0VarBuild = builderNewBuilder.build();
        Intrinsics.f(n0VarBuild, "build(...)");
        return (UserIntent.UserAdInteractionExt.Size) n0VarBuild;
    }
}
