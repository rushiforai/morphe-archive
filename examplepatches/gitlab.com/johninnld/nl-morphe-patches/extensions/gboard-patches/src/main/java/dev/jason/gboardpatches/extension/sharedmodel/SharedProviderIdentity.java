package dev.jason.gboardpatches.extension.sharedmodel;
import android.content.*;
import app.johninnl.modelhost.api.*;
/** Authenticating the chosen provider is separate from the server accepting every client signing identity. */
public final class SharedProviderIdentity {
    private SharedProviderIdentity(){}
    public static final String RELEASE_SIGNER="1c45e972f387160e6994391954d0f1ebd983a2b0ab506e444645f4ca9f47bdc4";
    public static void verify(Context context)throws HostException{ProviderDiscovery.verifySigner(context,new ComponentName(ModelHostClient.DEFAULT_PACKAGE,ModelHostClient.SERVICE_CLASS),RELEASE_SIGNER);}
}