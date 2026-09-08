/**
 * Copyright 2026 Psylos
 * Private SoundCloud patch.
 */
package psylos.morphe.extension.soundcloud;

import androidx.compose.runtime.Composer;

import com.soundcloud.android.ui.components.R;
import com.soundcloud.android.ui.components.compose.actionlists.ActionListItemKt;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;

@SuppressWarnings({"unused", "rawtypes", "unchecked"})
public final class PsylosSettingsCompose {
    private PsylosSettingsCompose() {
    }

    public static void render(Composer composer) {
        ActionListItemKt.a(
                "Psylos SoundCloud Patches",
                new OpenClick(),
                null,
                false,
                false,
                null,
                Integer.valueOf(R.drawable.ic_actions_chevron_right),
                null,
                null,
                composer,
                0,
                0x1bc
        );
    }

    private static final class OpenClick implements Function0 {
        @Override
        public Object invoke() {
            PsylosSettingsUi.show();
            return Unit.INSTANCE;
        }
    }
}
