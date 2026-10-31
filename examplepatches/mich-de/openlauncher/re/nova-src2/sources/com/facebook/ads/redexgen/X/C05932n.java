package com.facebook.ads.redexgen.X;

import java.util.ArrayList;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.2n, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C05932n<ModelType, StateType> {
    public final ModelType A03;
    public final StateType A04;
    public final String A05;
    public final String A06;
    public List<InterfaceC05992t<ModelType, StateType>> A01 = null;
    public C05912l<?, ?> A00 = C05912l.A0C;
    public boolean A02 = false;

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.2n != com.instagram.common.viewpoint.core.ViewpointData$Builder<ModelType, StateType> */
    public C05932n(ModelType model, StateType state, String str) {
        this.A03 = model;
        this.A04 = state;
        this.A06 = str;
        this.A05 = str;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.2n != com.instagram.common.viewpoint.core.ViewpointData$Builder<ModelType, StateType> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.2t != com.instagram.common.viewpoint.core.ViewpointAction<ModelType, StateType> */
    public final C05932n<ModelType, StateType> A06(InterfaceC05992t<ModelType, StateType> interfaceC05992t) {
        if (this.A01 == null) {
            this.A01 = new ArrayList();
        }
        this.A01.add(interfaceC05992t);
        return this;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.2n != com.instagram.common.viewpoint.core.ViewpointData$Builder<ModelType, StateType> */
    public final C05912l<ModelType, StateType> A07() {
        return new C05912l<>(this);
    }
}
