package com.fyber.inneractive.sdk.model.vast;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.PriorityQueue;

/* loaded from: classes3.dex */
public final class b implements com.fyber.inneractive.sdk.response.i {

    /* renamed from: a, reason: collision with root package name */
    public String f28568a;

    /* renamed from: b, reason: collision with root package name */
    public String f28569b;

    /* renamed from: d, reason: collision with root package name */
    public final PriorityQueue f28571d;

    /* renamed from: f, reason: collision with root package name */
    public o f28573f;

    /* renamed from: g, reason: collision with root package name */
    public final PriorityQueue f28574g;

    /* renamed from: h, reason: collision with root package name */
    public final Comparator f28575h;
    public com.fyber.inneractive.sdk.flow.endcard.k o;

    /* renamed from: p, reason: collision with root package name */
    public v f28581p;

    /* renamed from: e, reason: collision with root package name */
    public final ArrayList f28572e = new ArrayList();

    /* renamed from: i, reason: collision with root package name */
    public int f28576i = 0;

    /* renamed from: j, reason: collision with root package name */
    public int f28577j = 0;

    /* renamed from: k, reason: collision with root package name */
    public final ArrayList f28578k = new ArrayList();

    /* renamed from: l, reason: collision with root package name */
    public final ArrayList f28579l = new ArrayList();

    /* renamed from: m, reason: collision with root package name */
    public final ArrayList f28580m = new ArrayList();
    public String n = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    /* renamed from: c, reason: collision with root package name */
    public final HashMap f28570c = new HashMap();

    public b(com.fyber.inneractive.sdk.flow.vast.g gVar, com.fyber.inneractive.sdk.flow.vast.d dVar) {
        this.f28571d = new PriorityQueue(1, gVar);
        this.f28575h = dVar;
        this.f28574g = new PriorityQueue(1, dVar);
    }

    @Override // com.fyber.inneractive.sdk.response.i
    public final List a(x xVar) {
        HashMap map;
        if (xVar == null || (map = this.f28570c) == null) {
            return null;
        }
        return (List) map.get(xVar);
    }

    public final void a(x xVar, String str) {
        List arrayList = (List) this.f28570c.get(xVar);
        if (arrayList == null) {
            arrayList = new ArrayList();
            this.f28570c.put(xVar, arrayList);
        }
        arrayList.add(str);
    }
}
