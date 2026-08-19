package io.github.liongalahad.nuviotv.extension.settings;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.net.Uri;
import android.widget.Toast;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/** Opens the Morphe patch-suite repository from the About section. */
public final class MorpheOpenRepositoryAction implements Function0<Unit> {
    private MorpheOpenRepositoryAction() {}

    static Function0<Unit> create() {
        return new MorpheOpenRepositoryAction();
    }

    @Override
    public Unit invoke() {
        Activity activity = MorpheSettingsUi.resumedActivity();
        if (activity == null) return Unit.INSTANCE;
        try {
            activity.startActivity(repositoryIntent());
        } catch (ActivityNotFoundException error) {
            Toast.makeText(
                    activity,
                    "No app is available to open the GitHub repository",
                    Toast.LENGTH_LONG
            ).show();
        }
        return Unit.INSTANCE;
    }

    static Intent repositoryIntent() {
        return new Intent(
                Intent.ACTION_VIEW,
                Uri.parse(MorpheBuildInfo.repositoryUrl())
        );
    }
}
