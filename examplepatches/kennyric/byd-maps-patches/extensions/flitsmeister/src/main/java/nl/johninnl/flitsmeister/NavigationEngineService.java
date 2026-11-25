package nl.johninnl.flitsmeister;

import android.content.Intent;
import nl.johninnl.navigation.startup.ProviderEngineService;

public final class NavigationEngineService extends ProviderEngineService {
    @Override protected boolean enabled() { return true; }
    @Override protected boolean engineRunning() { return NavigationBroadcasts.engineRunning(); }
    @Override protected String nativeServiceName() { return "nl.flitsmeister.services.base.FlitsmeisterBaseService"; }
    @Override protected String integrationStatus(){
        nl.johninnl.navigation.alerts.WarningEndpoint endpoint=NativeWarnings.endpoint();
        boolean dutch=getResources().getConfiguration().getLocales().get(0).getLanguage().equals("nl");
        return (engineRunning()?(dutch?"Motor actief":"Engine running"):(dutch?"Motor wordt gestart":"Engine starting"))+" · "+nl.johninnl.navigation.alerts.WarningStatus.label(endpoint==null?"UNOWNED":endpoint.audioStatus(),dutch);
    }
    @Override protected void startEngine() {
        startForegroundService(new Intent().setClassName(this, "nl.flitsmeister.services.base.FlitsmeisterBaseService")
            .putExtra("checkBackgroundPermission", false));
    }
    @Override protected void stopEngine(long ownership) {
        finishOwnedShutdown(ownership, () ->
            stopService(new Intent().setClassName(this, "nl.flitsmeister.services.base.FlitsmeisterBaseService")));
    }
}
