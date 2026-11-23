package nl.johninnl.deezer.auto;

import androidx.car.app.CarAppService;
import androidx.car.app.Session;
import androidx.car.app.validation.HostValidator;
import androidx.car.app.versioning.CarAppApiLevels;

/** Native car presentation of Deezer's authenticated catalogue and real player. */
public final class DeezerCarAppService extends CarAppService {
    @Override public void onCreate() {
        PinnedCarApi.assertPresent(getApplicationInfo().sourceDir,CarAppApiLevels.class.getClassLoader());
        super.onCreate();
    }
    @Override public HostValidator createHostValidator(){return HostValidator.ALLOW_ALL_HOSTS_VALIDATOR;}
    @Override public int getCarAppThemeSource(){return THEME_SOURCE_APP;}
    @Override public Session onCreateSession(){return new DeezerCarSession();}
}
