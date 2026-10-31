package com.stripe.android.paymentsheet.paymentdatacollection.ach;

import com.stripe.android.model.Address;
import com.stripe.android.uicore.elements.IdentifierSpec;
import java.util.Map;
import kotlin.Pair;
import kotlin.collections.MapsKt;

/* loaded from: classes4.dex */
public abstract class h {
    public static final Map a(Address address) {
        IdentifierSpec.Companion.getClass();
        return MapsKt.j0(new Pair(IdentifierSpec.o, address.f43129c), new Pair(IdentifierSpec.f45373p, address.f43130d), new Pair(IdentifierSpec.f45374q, address.f43127a), new Pair(IdentifierSpec.f45378u, address.f43132f), new Pair(IdentifierSpec.f45379v, address.f43128b), new Pair(IdentifierSpec.f45376s, address.f43131e));
    }
}
