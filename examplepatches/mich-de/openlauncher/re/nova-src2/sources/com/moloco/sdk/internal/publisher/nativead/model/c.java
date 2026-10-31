package com.moloco.sdk.internal.publisher.nativead.model;

import android.net.Uri;
import com.moloco.sdk.internal.publisher.nativead.model.b;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public abstract class c {

    /* renamed from: d, reason: collision with root package name */
    public static final int f37341d = 0;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final b.a f37342a;

    /* renamed from: b, reason: collision with root package name */
    public final int f37343b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f37344c;

    public static final class a extends c {

        /* renamed from: f, reason: collision with root package name */
        public static final int f37345f = 0;

        /* renamed from: e, reason: collision with root package name */
        @NotNull
        public final String f37346e;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(@NotNull b.a.C0166a originAsset) {
            super(originAsset, null);
            Intrinsics.g(originAsset, "originAsset");
            this.f37346e = originAsset.e();
        }

        @NotNull
        public final String d() {
            return this.f37346e;
        }
    }

    public static final class b extends c {

        /* renamed from: f, reason: collision with root package name */
        public static final int f37347f = 8;

        /* renamed from: e, reason: collision with root package name */
        @NotNull
        public final Uri f37348e;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(@NotNull b.a.C0167b originAsset, @NotNull Uri precachedAssetUri) {
            super(originAsset, null);
            Intrinsics.g(originAsset, "originAsset");
            Intrinsics.g(precachedAssetUri, "precachedAssetUri");
            this.f37348e = precachedAssetUri;
        }

        @NotNull
        public final Uri d() {
            return this.f37348e;
        }
    }

    /* renamed from: com.moloco.sdk.internal.publisher.nativead.model.c$c, reason: collision with other inner class name */
    public static final class C0169c extends c {

        /* renamed from: f, reason: collision with root package name */
        public static final int f37349f = 0;

        /* renamed from: e, reason: collision with root package name */
        @NotNull
        public final String f37350e;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C0169c(@NotNull b.a.c originAsset) {
            super(originAsset, null);
            Intrinsics.g(originAsset, "originAsset");
            this.f37350e = originAsset.d();
        }

        @NotNull
        public final String d() {
            return this.f37350e;
        }
    }

    public static final class d extends c {

        /* renamed from: f, reason: collision with root package name */
        public static final int f37351f = 8;

        /* renamed from: e, reason: collision with root package name */
        @NotNull
        public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.a f37352e;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public d(@NotNull b.a.d originAsset, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.a vastAd) {
            super(originAsset, null);
            Intrinsics.g(originAsset, "originAsset");
            Intrinsics.g(vastAd, "vastAd");
            this.f37352e = vastAd;
        }

        @NotNull
        public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.a d() {
            return this.f37352e;
        }
    }

    public /* synthetic */ c(b.a aVar, DefaultConstructorMarker defaultConstructorMarker) {
        this(aVar);
    }

    public final int a() {
        return this.f37343b;
    }

    @NotNull
    public final b.a b() {
        return this.f37342a;
    }

    public final boolean c() {
        return this.f37344c;
    }

    public c(b.a aVar) {
        this.f37342a = aVar;
        this.f37343b = aVar.a();
        this.f37344c = aVar.b();
    }
}
