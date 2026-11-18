package app.afterglow.extension.destinations;

import android.content.Context;
import java.io.File;

/** One writer per local library, shared by dashboard and destination screens. */
public final class DestinationStores {
    private static AiHomeLibrary aiHome;
    private DestinationStores() {}
    public static synchronized AiHomeLibrary aiHome(Context context) {
        if (aiHome == null) aiHome = new AiHomeLibrary(new File(context.getFilesDir(), "Afterglow/AIHome"));
        return aiHome;
    }
}
