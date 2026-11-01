package nl.johninnl.medium.reader;

import android.content.Context;
import java.io.File;
import java.net.URI;

public final class ReaderBootstrap {
    private static boolean initialized;
    private ReaderBootstrap() {}
    public static synchronized void initialize(Context context) {
        if (initialized) return;
        Context app = context.getApplicationContext();
        if (app == null) app = context;
        File directory = new File(app.getCacheDir(), "medium-native-reader/bodies");
        ReaderImages.configure(new File(app.getCacheDir(), "medium-native-reader/images"));
        BodyCache cache = new BodyCache(directory, 64L * 1024 * 1024, 128, 24L * 60 * 60 * 1000, System::currentTimeMillis);
        ReaderRuntime.configure(new CachedArticleLoader(new MirrorClient(URI.create("https://freedium-mirror.cfd/")), cache));
        initialized = true;
    }
}
