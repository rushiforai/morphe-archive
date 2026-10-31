package com.stripe.android.ui.core.elements;

import a80.m;
import android.os.Parcel;
import android.os.Parcelable;
import b.u4;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.stripe.android.core.strings.IdentifierResolvableString;
import com.stripe.android.uicore.elements.IdentifierSpec;
import cw.a3;
import cw.c;
import cw.i0;
import cw.m4;
import cw.n4;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kw.i2;
import kw.o0;
import kw.q2;
import kw.r2;
import kw.t2;
import kw.z0;
import org.jetbrains.annotations.NotNull;
import zg.a;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/ui/core/elements/SimpleTextSpec;", "Lcom/stripe/android/ui/core/elements/FormItemSpec;", k.O, "cw/m4", "cw/n4", "payments-ui-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class SimpleTextSpec extends FormItemSpec {

    /* renamed from: f, reason: collision with root package name */
    public static final KSerializer[] f45340f;

    /* renamed from: a, reason: collision with root package name */
    public final IdentifierSpec f45341a;

    /* renamed from: b, reason: collision with root package name */
    public final int f45342b;

    /* renamed from: c, reason: collision with root package name */
    public final i0 f45343c;

    /* renamed from: d, reason: collision with root package name */
    public final a3 f45344d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f45345e;

    @NotNull
    public static final n4 Companion = new n4();

    @NotNull
    public static final Parcelable.Creator<SimpleTextSpec> CREATOR = new c(26);

    static {
        z0 z0Var = IdentifierSpec.Companion;
        f45340f = new KSerializer[]{null, null, i0.Companion.serializer(), a3.Companion.serializer(), null};
    }

    public SimpleTextSpec(IdentifierSpec apiPath, int i5, i0 capitalization, a3 keyboardType, boolean z11) {
        Intrinsics.g(apiPath, "apiPath");
        Intrinsics.g(capitalization, "capitalization");
        Intrinsics.g(keyboardType, "keyboardType");
        this.f45341a = apiPath;
        this.f45342b = i5;
        this.f45343c = capitalization;
        this.f45344d = keyboardType;
        this.f45345e = z11;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public final i2 a(Map map) {
        int i5;
        int i11 = 0;
        IdentifierResolvableString identifierResolvableStringU = a.U(this.f45342b, new Object[0], EmptyList.f71733a);
        int iOrdinal = this.f45343c.ordinal();
        int i12 = 3;
        if (iOrdinal != 0) {
            if (iOrdinal == 1) {
                i11 = 1;
            } else if (iOrdinal == 2) {
                i11 = 2;
            } else {
                if (iOrdinal != 3) {
                    throw new NoWhenBranchMatchedException();
                }
                i11 = 3;
            }
        }
        int i13 = 4;
        switch (this.f45344d.ordinal()) {
            case 0:
                i5 = 1;
                r2 r2Var = new r2(identifierResolvableStringU, i11, i5, null, this.f45345e, 40);
                IdentifierSpec identifierSpec = this.f45341a;
                return o0.c(new q2(identifierSpec, new t2(r2Var, (String) ((LinkedHashMap) map).get(identifierSpec), null, i13)), null);
            case 1:
                i5 = 2;
                r2 r2Var2 = new r2(identifierResolvableStringU, i11, i5, null, this.f45345e, 40);
                IdentifierSpec identifierSpec2 = this.f45341a;
                return o0.c(new q2(identifierSpec2, new t2(r2Var2, (String) ((LinkedHashMap) map).get(identifierSpec2), null, i13)), null);
            case 2:
                i5 = i12;
                r2 r2Var22 = new r2(identifierResolvableStringU, i11, i5, null, this.f45345e, 40);
                IdentifierSpec identifierSpec22 = this.f45341a;
                return o0.c(new q2(identifierSpec22, new t2(r2Var22, (String) ((LinkedHashMap) map).get(identifierSpec22), null, i13)), null);
            case 3:
                i5 = 4;
                r2 r2Var222 = new r2(identifierResolvableStringU, i11, i5, null, this.f45345e, 40);
                IdentifierSpec identifierSpec222 = this.f45341a;
                return o0.c(new q2(identifierSpec222, new t2(r2Var222, (String) ((LinkedHashMap) map).get(identifierSpec222), null, i13)), null);
            case 4:
                i12 = 5;
                i5 = i12;
                r2 r2Var2222 = new r2(identifierResolvableStringU, i11, i5, null, this.f45345e, 40);
                IdentifierSpec identifierSpec2222 = this.f45341a;
                return o0.c(new q2(identifierSpec2222, new t2(r2Var2222, (String) ((LinkedHashMap) map).get(identifierSpec2222), null, i13)), null);
            case 5:
                i12 = 6;
                i5 = i12;
                r2 r2Var22222 = new r2(identifierResolvableStringU, i11, i5, null, this.f45345e, 40);
                IdentifierSpec identifierSpec22222 = this.f45341a;
                return o0.c(new q2(identifierSpec22222, new t2(r2Var22222, (String) ((LinkedHashMap) map).get(identifierSpec22222), null, i13)), null);
            case 6:
                i12 = 7;
                i5 = i12;
                r2 r2Var222222 = new r2(identifierResolvableStringU, i11, i5, null, this.f45345e, 40);
                IdentifierSpec identifierSpec222222 = this.f45341a;
                return o0.c(new q2(identifierSpec222222, new t2(r2Var222222, (String) ((LinkedHashMap) map).get(identifierSpec222222), null, i13)), null);
            case 7:
                i12 = 8;
                i5 = i12;
                r2 r2Var2222222 = new r2(identifierResolvableStringU, i11, i5, null, this.f45345e, 40);
                IdentifierSpec identifierSpec2222222 = this.f45341a;
                return o0.c(new q2(identifierSpec2222222, new t2(r2Var2222222, (String) ((LinkedHashMap) map).get(identifierSpec2222222), null, i13)), null);
            default:
                throw new NoWhenBranchMatchedException();
        }
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof SimpleTextSpec)) {
            return false;
        }
        SimpleTextSpec simpleTextSpec = (SimpleTextSpec) obj;
        return Intrinsics.b(this.f45341a, simpleTextSpec.f45341a) && this.f45342b == simpleTextSpec.f45342b && this.f45343c == simpleTextSpec.f45343c && this.f45344d == simpleTextSpec.f45344d && this.f45345e == simpleTextSpec.f45345e;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f45345e) + ((this.f45344d.hashCode() + ((this.f45343c.hashCode() + u4.a(this.f45342b, this.f45341a.hashCode() * 31, 31)) * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SimpleTextSpec(apiPath=");
        sb2.append(this.f45341a);
        sb2.append(", label=");
        sb2.append(this.f45342b);
        sb2.append(", capitalization=");
        sb2.append(this.f45343c);
        sb2.append(", keyboardType=");
        sb2.append(this.f45344d);
        sb2.append(", showOptionalLabel=");
        return m.k(sb2, this.f45345e, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f45341a, i5);
        dest.writeInt(this.f45342b);
        dest.writeString(this.f45343c.name());
        dest.writeString(this.f45344d.name());
        dest.writeInt(this.f45345e ? 1 : 0);
    }

    public SimpleTextSpec(int i5, IdentifierSpec identifierSpec, int i11, i0 i0Var, a3 a3Var, boolean z11) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, m4.f48217a.getDescriptor());
        }
        this.f45341a = identifierSpec;
        this.f45342b = i11;
        if ((i5 & 4) == 0) {
            this.f45343c = i0.f48165b;
        } else {
            this.f45343c = i0Var;
        }
        if ((i5 & 8) == 0) {
            this.f45344d = a3.f48067c;
        } else {
            this.f45344d = a3Var;
        }
        if ((i5 & 16) == 0) {
            this.f45345e = false;
        } else {
            this.f45345e = z11;
        }
    }

    public /* synthetic */ SimpleTextSpec(int i5, IdentifierSpec identifierSpec) {
        this(identifierSpec, i5, i0.f48166c, a3.f48066b, false);
    }
}
