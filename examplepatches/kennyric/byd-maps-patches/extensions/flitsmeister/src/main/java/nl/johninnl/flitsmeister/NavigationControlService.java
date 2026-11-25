package nl.johninnl.flitsmeister;

import nl.johninnl.navigation.startup.ProviderControlService;
import nl.johninnl.navigation.startup.ProviderEngineService;

public final class NavigationControlService extends ProviderControlService {
    @Override protected void observeControlClient(int uid,boolean warningAware){if(NativeWarnings.supportsEventProtocol(this))NativeWarnings.init(this).controlClient(uid,warningAware);}
    @Override protected void appendWarningCapabilities(android.os.Bundle response,int uid) {
        if(!NativeWarnings.supportsEventProtocol(this))return;
        response.putBinder("warning_api",NativeWarnings.init(this).binder());
        response.putIntArray("warning_protocols",new int[]{1});
        response.putParcelable("warning_recovery",android.app.PendingIntent.getActivity(this,29173,new android.content.Intent(this,WarningRecoveryActivity.class),android.app.PendingIntent.FLAG_IMMUTABLE|android.app.PendingIntent.FLAG_UPDATE_CURRENT));
    }
    @Override protected boolean enabled() { return true; }
    @Override protected boolean engineRunning() { return NavigationBroadcasts.engineRunning(); }
    @Override protected String receiverPackage() { return NavigationBroadcasts.receiverPackage(); }
    @Override protected Class<? extends ProviderEngineService> engineService() { return NavigationEngineService.class; }
}
