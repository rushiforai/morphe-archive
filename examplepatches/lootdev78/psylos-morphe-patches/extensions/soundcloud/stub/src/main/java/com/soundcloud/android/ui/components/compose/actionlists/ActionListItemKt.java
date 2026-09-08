package com.soundcloud.android.ui.components.compose.actionlists;

import androidx.compose.runtime.Composer;
import androidx.compose.ui.Modifier;
import com.soundcloud.android.ui.components.labels.icons.DownloadIcon;
import kotlin.jvm.functions.Function0;

public final class ActionListItemKt {
    private ActionListItemKt() {
    }

    public static void a(
            String title,
            Function0<?> onClick,
            Modifier modifier,
            boolean enabled,
            boolean selected,
            Integer leadingIcon,
            Integer trailingIcon,
            DownloadIcon.Step step,
            ActionListSelectableState selectableState,
            Composer composer,
            int changed,
            int defaults) {
    }
}
