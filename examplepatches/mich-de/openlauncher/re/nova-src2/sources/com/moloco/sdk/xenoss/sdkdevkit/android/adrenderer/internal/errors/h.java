package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors;

import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class h {

    public /* synthetic */ class a {

        /* renamed from: a, reason: collision with root package name */
        public static final /* synthetic */ int[] f38765a;

        static {
            int[] iArr = new int[g.values().length];
            try {
                iArr[g.f38758a.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                iArr[g.f38759b.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                iArr[g.f38760c.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                iArr[g.f38761d.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                iArr[g.f38762e.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            f38765a = iArr;
        }
    }

    @NotNull
    public static final i a(@NotNull g gVar) {
        Intrinsics.g(gVar, "<this>");
        int i5 = a.f38765a[gVar.ordinal()];
        if (i5 == 1) {
            return i.f38766a;
        }
        if (i5 == 2) {
            return i.f38767b;
        }
        if (i5 == 3) {
            return i.f38768c;
        }
        if (i5 == 4) {
            return i.f38769d;
        }
        if (i5 == 5) {
            return i.f38770e;
        }
        throw new NoWhenBranchMatchedException();
    }

    @NotNull
    public static final j b(@NotNull g gVar) {
        Intrinsics.g(gVar, "<this>");
        int i5 = a.f38765a[gVar.ordinal()];
        if (i5 == 1) {
            return j.f38773a;
        }
        if (i5 == 2) {
            return j.f38774b;
        }
        if (i5 == 3) {
            return j.f38775c;
        }
        if (i5 == 4) {
            return j.f38776d;
        }
        if (i5 == 5) {
            return j.f38777e;
        }
        throw new NoWhenBranchMatchedException();
    }
}
