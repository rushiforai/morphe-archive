package nl.johninnl.eclipse.auto;

import androidx.car.app.CarAppService;
import androidx.car.app.Session;
import androidx.car.app.validation.HostValidator;
import androidx.car.app.versioning.CarAppApiLevels;

/** Templated Android Auto presentation of Eclipse Music; the app's own player stays authoritative. */
public final class EclipseCarAppService extends CarAppService {
    @Override public void onCreate() {
        PinnedCarApi.assertPresent(getApplicationInfo().sourceDir, CarAppApiLevels.class.getClassLoader());
        super.onCreate();
    }

    /** Standing owner rule: no host allowlists. */
    @Override public HostValidator createHostValidator() { return HostValidator.ALLOW_ALL_HOSTS_VALIDATOR; }

    /** At API 9 the manifest theme is ignored unless the app asks for it here. */
    @Override public int getCarAppThemeSource() { return THEME_SOURCE_APP; }

    @Override public Session onCreateSession() { return new EclipseCarSession(); }
}
