package com.google.android.gms.internal.play_billing;

import androidx.compose.ui.node.LayoutNode;
import java.util.Arrays;

/* loaded from: classes3.dex */
public enum y {
    RESPONSE_CODE_UNSPECIFIED(-999),
    /* JADX INFO: Fake field, exist only in values array */
    SERVICE_TIMEOUT(-3),
    /* JADX INFO: Fake field, exist only in values array */
    FEATURE_NOT_SUPPORTED(-2),
    /* JADX INFO: Fake field, exist only in values array */
    SERVICE_DISCONNECTED(-1),
    /* JADX INFO: Fake field, exist only in values array */
    OK(0),
    /* JADX INFO: Fake field, exist only in values array */
    USER_CANCELED(1),
    /* JADX INFO: Fake field, exist only in values array */
    SERVICE_UNAVAILABLE(2),
    /* JADX INFO: Fake field, exist only in values array */
    BILLING_UNAVAILABLE(3),
    /* JADX INFO: Fake field, exist only in values array */
    ITEM_UNAVAILABLE(4),
    /* JADX INFO: Fake field, exist only in values array */
    DEVELOPER_ERROR(5),
    /* JADX INFO: Fake field, exist only in values array */
    ERROR(6),
    /* JADX INFO: Fake field, exist only in values array */
    ITEM_ALREADY_OWNED(7),
    /* JADX INFO: Fake field, exist only in values array */
    ITEM_NOT_OWNED(8),
    /* JADX INFO: Fake field, exist only in values array */
    EXPIRED_OFFER_TOKEN(11),
    /* JADX INFO: Fake field, exist only in values array */
    NETWORK_ERROR(12);


    /* renamed from: c, reason: collision with root package name */
    public static final t0 f33652c;

    /* renamed from: a, reason: collision with root package name */
    public final int f33654a;

    static {
        c00.d dVar = new c00.d(3, false);
        dVar.f19045c = new Object[8];
        dVar.f19044b = 0;
        for (y yVar : values()) {
            Integer numValueOf = Integer.valueOf(yVar.f33654a);
            int i5 = dVar.f19044b + 1;
            Object[] objArr = (Object[]) dVar.f19045c;
            int length = objArr.length;
            int i11 = i5 + i5;
            if (i11 > length) {
                if (i11 > length) {
                    length = length + (length >> 1) + 1;
                    if (length < i11) {
                        int iHighestOneBit = Integer.highestOneBit(i11 - 1);
                        length = iHighestOneBit + iHighestOneBit;
                    }
                    if (length < 0) {
                        length = LayoutNode.NotPlacedPlaceOrder;
                    }
                }
                dVar.f19045c = Arrays.copyOf(objArr, length);
            }
            Object[] objArr2 = (Object[]) dVar.f19045c;
            int i12 = dVar.f19044b;
            int i13 = i12 + i12;
            objArr2[i13] = numValueOf;
            objArr2[i13 + 1] = yVar;
            dVar.f19044b = i12 + 1;
        }
        l0 l0Var = (l0) dVar.f19046d;
        if (l0Var != null) {
            throw l0Var.a();
        }
        t0 t0VarA = t0.a(dVar.f19044b, (Object[]) dVar.f19045c, dVar);
        l0 l0Var2 = (l0) dVar.f19046d;
        if (l0Var2 != null) {
            throw l0Var2.a();
        }
        f33652c = t0VarA;
    }

    y(int i5) {
        this.f33654a = i5;
    }
}
