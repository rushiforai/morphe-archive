package org.ungoogled.car;

import android.content.Intent;

import androidx.annotation.NonNull;
import androidx.car.app.CarAppService;
import androidx.car.app.Screen;
import androidx.car.app.Session;
import androidx.car.app.validation.HostValidator;

/**
 * Experimental: Maps as a Car App Library navigation app, so Android Auto lists it (it does not list
 * a re-signed Maps through Maps' own projection service). Step 1: show that the host accepts the app
 * and hands over a Surface.
 */
public final class MapsCarAppService extends CarAppService {
    @NonNull
    @Override
    public HostValidator createHostValidator() {
        // The host of a sideloaded app is Android Auto itself; accept any host while this is a probe.
        return HostValidator.ALLOW_ALL_HOSTS_VALIDATOR;
    }

    @NonNull
    @Override
    public Session onCreateSession() {
        return new Session() {
            @NonNull
            @Override
            public Screen onCreateScreen(@NonNull Intent intent) {
                return new MapsCarScreen(getCarContext());
            }
        };
    }
}
