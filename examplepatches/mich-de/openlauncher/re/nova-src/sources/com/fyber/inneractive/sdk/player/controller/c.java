package com.fyber.inneractive.sdk.player.controller;

import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;

/* loaded from: classes3.dex */
public abstract /* synthetic */ class c {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int[] f28887a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ int[] f28888b;

    static {
        int[] iArr = new int[com.fyber.inneractive.sdk.model.vast.i.values().length];
        f28888b = iArr;
        try {
            iArr[com.fyber.inneractive.sdk.model.vast.i.Static.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            f28888b[com.fyber.inneractive.sdk.model.vast.i.Html.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            f28888b[com.fyber.inneractive.sdk.model.vast.i.FMP_End_Card.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            f28888b[com.fyber.inneractive.sdk.model.vast.i.Iframe.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        int[] iArr2 = new int[UnitDisplayType.values().length];
        f28887a = iArr2;
        try {
            iArr2[UnitDisplayType.INTERSTITIAL.ordinal()] = 1;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            f28887a[UnitDisplayType.REWARDED.ordinal()] = 2;
        } catch (NoSuchFieldError unused6) {
        }
    }
}
