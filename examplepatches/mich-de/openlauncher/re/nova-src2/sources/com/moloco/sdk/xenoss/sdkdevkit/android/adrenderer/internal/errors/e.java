package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors;

import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class e {

    public /* synthetic */ class a {

        /* renamed from: a, reason: collision with root package name */
        public static final /* synthetic */ int[] f38749a;

        static {
            int[] iArr = new int[d.values().length];
            try {
                iArr[d.f38735a.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                iArr[d.f38736b.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                iArr[d.f38737c.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                iArr[d.f38738d.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                iArr[d.f38739e.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                iArr[d.f38740f.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                iArr[d.f38741g.ordinal()] = 7;
            } catch (NoSuchFieldError unused7) {
            }
            try {
                iArr[d.f38742h.ordinal()] = 8;
            } catch (NoSuchFieldError unused8) {
            }
            try {
                iArr[d.f38743i.ordinal()] = 9;
            } catch (NoSuchFieldError unused9) {
            }
            try {
                iArr[d.f38744j.ordinal()] = 10;
            } catch (NoSuchFieldError unused10) {
            }
            try {
                iArr[d.f38745k.ordinal()] = 11;
            } catch (NoSuchFieldError unused11) {
            }
            try {
                iArr[d.f38746l.ordinal()] = 12;
            } catch (NoSuchFieldError unused12) {
            }
            try {
                iArr[d.f38747m.ordinal()] = 13;
            } catch (NoSuchFieldError unused13) {
            }
            try {
                iArr[d.n.ordinal()] = 14;
            } catch (NoSuchFieldError unused14) {
            }
            f38749a = iArr;
        }
    }

    @NotNull
    public static final d a(@NotNull d dVar) {
        Intrinsics.g(dVar, "<this>");
        switch (a.f38749a[dVar.ordinal()]) {
            case 1:
                return d.f38745k;
            case 2:
                return d.f38746l;
            case 3:
                return d.f38747m;
            case 4:
                return d.n;
            case 5:
                return d.f38739e;
            case 6:
                return d.f38745k;
            case 7:
                return d.f38746l;
            case 8:
                return d.f38747m;
            case 9:
                return d.n;
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
                return dVar;
            default:
                throw new NoWhenBranchMatchedException();
        }
    }

    @NotNull
    public static final d b(@NotNull d dVar) {
        Intrinsics.g(dVar, "<this>");
        switch (a.f38749a[dVar.ordinal()]) {
            case 1:
                return d.f38740f;
            case 2:
                return d.f38741g;
            case 3:
                return d.f38742h;
            case 4:
                return d.f38743i;
            case 5:
                return d.f38739e;
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
                return dVar;
            case 11:
                return d.f38740f;
            case 12:
                return d.f38741g;
            case 13:
                return d.f38742h;
            case 14:
                return d.f38743i;
            default:
                throw new NoWhenBranchMatchedException();
        }
    }
}
