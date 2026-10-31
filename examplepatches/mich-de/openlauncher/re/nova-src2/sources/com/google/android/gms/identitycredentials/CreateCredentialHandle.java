package com.google.android.gms.identitycredentials;

import android.app.PendingIntent;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import di.b;
import fg.a;
import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/google/android/gms/identitycredentials/CreateCredentialHandle;", "Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;", "java.com.google.android.gmscore.integ.client.identity_credentials_identity_credentials"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class CreateCredentialHandle extends AbstractSafeParcelable {

    @JvmField
    @NotNull
    public static final Parcelable.Creator<CreateCredentialHandle> CREATOR = new b(27);

    /* renamed from: f, reason: collision with root package name */
    public final PendingIntent f31964f;

    /* renamed from: g, reason: collision with root package name */
    public final CreateCredentialResponse f31965g;

    public CreateCredentialHandle(PendingIntent pendingIntent, CreateCredentialResponse createCredentialResponse) {
        this.f31964f = pendingIntent;
        this.f31965g = createCredentialResponse;
        if (pendingIntent == null && createCredentialResponse == null) {
            throw new IllegalArgumentException("pendingIntent or createCredentialResponse must be specified.");
        }
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        int iJ0 = a.j0(dest, 20293);
        a.b0(dest, 1, this.f31964f, i5);
        a.b0(dest, 2, this.f31965g, i5);
        a.k0(dest, iJ0);
    }
}
