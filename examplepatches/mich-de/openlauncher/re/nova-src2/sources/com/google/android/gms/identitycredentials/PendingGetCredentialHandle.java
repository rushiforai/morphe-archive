package com.google.android.gms.identitycredentials;

import android.app.PendingIntent;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import eh.a;
import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/google/android/gms/identitycredentials/PendingGetCredentialHandle;", "Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;", "java.com.google.android.gmscore.integ.client.identity_credentials_identity_credentials"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class PendingGetCredentialHandle extends AbstractSafeParcelable {

    @JvmField
    @NotNull
    public static final Parcelable.Creator<PendingGetCredentialHandle> CREATOR = new a(4);

    /* renamed from: f, reason: collision with root package name */
    public final PendingIntent f31981f;

    public PendingGetCredentialHandle(PendingIntent pendingIntent) {
        Intrinsics.g(pendingIntent, "pendingIntent");
        this.f31981f = pendingIntent;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        int iJ0 = fg.a.j0(dest, 20293);
        fg.a.b0(dest, 1, this.f31981f, i5);
        fg.a.k0(dest, iJ0);
    }
}
