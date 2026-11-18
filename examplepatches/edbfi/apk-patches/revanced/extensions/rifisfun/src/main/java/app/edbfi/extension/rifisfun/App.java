// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.rifisfun;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;

/** The app's context, which the extension patch hands over first thing in {@code Application.onCreate}. */
public final class App {
    static final String TAG = "edbfi";

    private static volatile Context context;

    private App() {}

    public static void init(Application application) {
        context = application.getApplicationContext();
    }

    /** The extension's own preferences, apart from the app's; null before the app started. */
    static SharedPreferences preferences() {
        Context app = context;
        return app == null ? null : app.getSharedPreferences("app.edbfi.extension.rifisfun", Context.MODE_PRIVATE);
    }
}
