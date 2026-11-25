package org.ungoogled.waze;

import nl.johninnl.navigation.startup.ProviderEngineService;

public final class NavigationEngineService extends ProviderEngineService {
    @Override protected boolean enabled() { return NavigationBroadcasts.isEnabled(); }
    @Override protected boolean engineRunning() { return NavigationStartup.running(); }
    @Override protected String nativeServiceName() { return "com.waze.WazeAppService"; }
    @Override protected void startEngine() throws ReflectiveOperationException { NavigationStartup.initialize(getApplication());NativeWarnings.prepareControllers(); }
    @Override protected void stopEngine(long ownership) throws ReflectiveOperationException {
        Class<?> manager = Class.forName("com.waze.NativeManager");
        manager.getMethod("runOnNativeManagerReady", Runnable.class).invoke(null, (Runnable) () ->
            finishOwnedShutdown(ownership, () -> {
                try { manager.getMethod("shutDown").invoke(manager.getMethod("getInstance").invoke(null)); }
                catch (ReflectiveOperationException error) { throw new nl.johninnl.navigation.startup.ProviderControlService.ReflectiveOperationExceptionWrapper(error); }
            }));
    }
    @Override protected String integrationStatus(){
        nl.johninnl.navigation.alerts.WarningEndpoint endpoint=NativeWarnings.endpoint();
        boolean dutch=getResources().getConfiguration().getLocales().get(0).getLanguage().equals("nl");
        return (engineRunning()?(dutch?"Motor actief":"Engine running"):(dutch?"Motor wordt gestart":"Engine starting"))+" · "+nl.johninnl.navigation.alerts.WarningStatus.label(endpoint==null?"UNOWNED":endpoint.audioStatus(),dutch);
    }
}
