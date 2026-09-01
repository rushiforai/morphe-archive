package androidx.credentials.playservices;

import android.app.Service;
import android.content.Intent;
import android.os.Binder;
import android.os.IBinder;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001:\u0001\nB\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tH\u0016R\u0012\u0010\u0004\u001a\u00060\u0005R\u00020\u0000X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u000b"}, d2 = {"Landroidx/credentials/playservices/CredentialProviderMetadataHolder;", "Landroid/app/Service;", "<init>", "()V", "binder", "Landroidx/credentials/playservices/CredentialProviderMetadataHolder$LocalBinder;", "onBind", "Landroid/os/IBinder;", "intent", "Landroid/content/Intent;", "LocalBinder", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class CredentialProviderMetadataHolder extends Service {
    private final LocalBinder binder = new LocalBinder();

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\b\u0086\u0004\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u0006\u0010\u0004\u001a\u00020\u0005¨\u0006\u0006"}, d2 = {"Landroidx/credentials/playservices/CredentialProviderMetadataHolder$LocalBinder;", "Landroid/os/Binder;", "<init>", "(Landroidx/credentials/playservices/CredentialProviderMetadataHolder;)V", "getService", "Landroidx/credentials/playservices/CredentialProviderMetadataHolder;", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public final class LocalBinder extends Binder {
        public LocalBinder() {
        }

        /* JADX INFO: renamed from: getService, reason: from getter */
        public final CredentialProviderMetadataHolder getThis$0() {
            return CredentialProviderMetadataHolder.this;
        }
    }

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        intent.getClass();
        return this.binder;
    }
}
