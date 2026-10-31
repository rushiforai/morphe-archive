package kw;

import com.stripe.android.uicore.elements.IdentifierSpec;
import com.stripe.android.uicore.elements.ParameterDestination;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class z0 {
    public static IdentifierSpec a(String _value) {
        Intrinsics.g(_value, "_value");
        return new IdentifierSpec(_value, (ParameterDestination) null, 6);
    }

    public static IdentifierSpec b(String value) {
        Intrinsics.g(value, "value");
        IdentifierSpec identifierSpec = IdentifierSpec.f45365f;
        if (value.equals(identifierSpec.f45384a)) {
            return identifierSpec;
        }
        IdentifierSpec identifierSpec2 = IdentifierSpec.f45367h;
        if (value.equals(identifierSpec2.f45384a)) {
            return identifierSpec2;
        }
        IdentifierSpec identifierSpec3 = IdentifierSpec.f45368i;
        if (value.equals(identifierSpec3.f45384a)) {
            return identifierSpec3;
        }
        IdentifierSpec identifierSpec4 = IdentifierSpec.f45374q;
        if (value.equals(identifierSpec4.f45384a)) {
            return identifierSpec4;
        }
        IdentifierSpec identifierSpec5 = IdentifierSpec.f45379v;
        if (value.equals(identifierSpec5.f45384a)) {
            return identifierSpec5;
        }
        IdentifierSpec identifierSpec6 = IdentifierSpec.f45372m;
        if (value.equals(identifierSpec6.f45384a)) {
            return identifierSpec6;
        }
        IdentifierSpec identifierSpec7 = IdentifierSpec.o;
        if (value.equals(identifierSpec7.f45384a)) {
            return identifierSpec7;
        }
        IdentifierSpec identifierSpec8 = IdentifierSpec.f45373p;
        if (value.equals(identifierSpec8.f45384a)) {
            return identifierSpec8;
        }
        IdentifierSpec identifierSpec9 = IdentifierSpec.f45364e;
        if (value.equals(identifierSpec9.f45384a)) {
            return identifierSpec9;
        }
        IdentifierSpec identifierSpec10 = IdentifierSpec.n;
        if (value.equals(identifierSpec10.f45384a)) {
            return identifierSpec10;
        }
        IdentifierSpec identifierSpec11 = IdentifierSpec.f45376s;
        if (value.equals(identifierSpec11.f45384a)) {
            return identifierSpec11;
        }
        IdentifierSpec identifierSpec12 = IdentifierSpec.f45380w;
        if (value.equals(identifierSpec12.f45384a)) {
            return identifierSpec12;
        }
        IdentifierSpec identifierSpec13 = IdentifierSpec.f45378u;
        if (value.equals(identifierSpec13.f45384a)) {
            return identifierSpec13;
        }
        IdentifierSpec identifierSpec14 = IdentifierSpec.f45381x;
        return value.equals(identifierSpec14.f45384a) ? identifierSpec14 : a(value);
    }

    @NotNull
    public final KSerializer<IdentifierSpec> serializer() {
        return y0.f72733a;
    }
}
