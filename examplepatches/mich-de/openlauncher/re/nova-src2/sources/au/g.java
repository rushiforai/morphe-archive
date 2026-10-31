package au;

import es.n;
import h6.u0;
import hq.m;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public final n f15683a;

    /* renamed from: b, reason: collision with root package name */
    public final i f15684b;

    /* renamed from: c, reason: collision with root package name */
    public final m f15685c;

    /* renamed from: d, reason: collision with root package name */
    public final u0 f15686d;

    /* renamed from: e, reason: collision with root package name */
    public final String f15687e;

    /* renamed from: f, reason: collision with root package name */
    public final b6.b f15688f;

    public g(n linkConfigurationCoordinator, i embeddedSelectionHolder, m cardAccountRangeRepositoryFactory, u0 savedStateHandle, String selectedPaymentMethodCode, b6.b tapToAddCollectionHandler) {
        Intrinsics.g(linkConfigurationCoordinator, "linkConfigurationCoordinator");
        Intrinsics.g(embeddedSelectionHolder, "embeddedSelectionHolder");
        Intrinsics.g(cardAccountRangeRepositoryFactory, "cardAccountRangeRepositoryFactory");
        Intrinsics.g(savedStateHandle, "savedStateHandle");
        Intrinsics.g(selectedPaymentMethodCode, "selectedPaymentMethodCode");
        Intrinsics.g(tapToAddCollectionHandler, "tapToAddCollectionHandler");
        this.f15683a = linkConfigurationCoordinator;
        this.f15684b = embeddedSelectionHolder;
        this.f15685c = cardAccountRangeRepositoryFactory;
        this.f15686d = savedStateHandle;
        this.f15687e = selectedPaymentMethodCode;
        this.f15688f = tapToAddCollectionHandler;
    }
}
