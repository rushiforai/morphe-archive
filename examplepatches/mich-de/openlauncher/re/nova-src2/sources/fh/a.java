package fh;

import android.os.IInterface;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.identitycredentials.ClearCredentialStateResponse;
import com.google.android.gms.identitycredentials.CreateCredentialHandle;
import com.google.android.gms.identitycredentials.PendingGetCredentialHandle;
import com.google.android.gms.identitycredentials.SignalCredentialStateResponse;

/* loaded from: classes3.dex */
public interface a extends IInterface {
    void I(Status status, PendingGetCredentialHandle pendingGetCredentialHandle);

    void P(Status status, ClearCredentialStateResponse clearCredentialStateResponse);

    void s(Status status, CreateCredentialHandle createCredentialHandle);

    void x(Status status, SignalCredentialStateResponse signalCredentialStateResponse);
}
