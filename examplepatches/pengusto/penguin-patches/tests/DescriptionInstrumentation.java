package io.github.pengusto.patches.extension.calendar;

import android.app.Instrumentation;
import android.os.Bundle;

/** Install with the same test certificate as the patched target APK. */
public final class DescriptionInstrumentation extends Instrumentation {
    @Override public void onCreate(Bundle arguments) { super.onCreate(arguments); start(); }
    @Override public void onStart() {
        Bundle result = new Bundle();
        try {
            DescriptionRegression.main(new String[0]);
            result.putString("stream", "PASS: 13 native Android description regression cases\n");
            finish(-1, result);
        } catch (Throwable failure) {
            result.putString("stream", failure.toString());
            finish(0, result);
        }
    }
}
