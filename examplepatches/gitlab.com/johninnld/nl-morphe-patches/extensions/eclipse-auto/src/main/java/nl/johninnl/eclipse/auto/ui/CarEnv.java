package nl.johninnl.eclipse.auto.ui;

import androidx.car.app.CarContext;
import androidx.car.app.model.CarIcon;
import androidx.core.graphics.drawable.IconCompat;
import java.util.HashMap;
import java.util.Map;
import nl.johninnl.eclipse.auto.data.AppPort;

/** The real {@link Env}: level from the car context, images from the app's provider and resources. */
public final class CarEnv implements Env {
    /** The patch prefixes the extension's drawables with this when it links them into the app. */
    static final String RESOURCE_PREFIX = "morphe_eclipse_auto_ic_";

    private final CarContext context;
    private final AppPort app;
    private final Map<String, CarIcon> icons = new HashMap<>();
    private final Map<String, CarIcon> artwork = new HashMap<>();

    public CarEnv(CarContext context, AppPort app) {
        this.context = context;
        this.app = app;
    }

    @Override public boolean api9() { return Level.api9(context); }

    @Override public CarIcon icon(String name) {
        CarIcon cached = icons.get(name);
        if (cached != null) return cached;
        CarIcon icon = CarIcon.ALERT;
        try {
            int id = context.getResources().getIdentifier(RESOURCE_PREFIX + name, "drawable", context.getPackageName());
            if (id != 0) {
                IconCompat vector = IconCompat.createWithResource(context, id);
                // The placeholder is already coloured artwork; every other icon takes the host's tint.
                icon = "placeholder".equals(name) ? CarIcon.createOriginalIcon(vector) : CarIcon.createTintedIcon(vector);
            }
        } catch (RuntimeException unavailable) {
            // The fallback icon keeps the row usable.
        }
        icons.put(name, icon);
        return icon;
    }

    @Override public CarIcon accentIcon(String name) {
        CarIcon base = icon(name);
        try {
            IconCompat vector = base.getIcon();
            return vector == null ? base : CarIcon.createTintedIcon(vector, Sections.ACCENT);
        } catch (RuntimeException unavailable) {
            return base;
        }
    }

    @Override public CarIcon art(String url) {
        if (url == null || url.isEmpty()) return icon("placeholder");
        CarIcon cached = artwork.get(url);
        if (cached != null) return cached;
        CarIcon result = null;
        try {
            String uri = app.artUri(url);
            if (uri != null) result = new CarIcon.Builder(IconCompat.createWithContentUri(uri)).build();
        } catch (RuntimeException unavailable) {
            // Falls back to the placeholder below.
        }
        if (result == null) return icon("placeholder");
        if (artwork.size() > 512) artwork.clear();
        artwork.put(url, result);
        return result;
    }
}
