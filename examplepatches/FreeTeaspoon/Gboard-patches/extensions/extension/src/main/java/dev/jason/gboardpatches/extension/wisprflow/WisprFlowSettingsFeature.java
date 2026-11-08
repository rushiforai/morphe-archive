package dev.jason.gboardpatches.extension.wisprflow;

import android.content.Context;
import java.util.List;
import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;
import static dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract.*;

public final class WisprFlowSettingsFeature implements Feature {
    private final Context context;
    public WisprFlowSettingsFeature(Context context) { this.context = context; }
    @Override public String getEntryTitle() { return text(R.string.gboard_wispr_flow_title); }
    @Override public String getEntrySummary() { return text(R.string.gboard_wispr_flow_summary); }
    @Override public boolean isAvailable(Context context) {
        return GboardPatchesFeatureAvailability.hasFeature(context,
                GboardPatchesFeatureAvailability.FEATURE_WISPR_FLOW);
    }
    @Override public Screen buildScreen(FeatureHost host) {
        return new Screen(getEntryTitle(), text(R.string.gboard_patches_header_badge),
                getEntryTitle(), getEntrySummary(), List.of(),
                List.of(new Section(getEntryTitle(), List.of(
                        new ActionRow(text(R.string.gboard_wispr_flow_keyboard_mode),
                                text(R.string.gboard_wispr_flow_keyboard_mode_summary), true,
                                () -> WisprFlowRuntime.send(host.getContext(), "keyboard")),
                        new ActionRow(text(R.string.gboard_wispr_flow_floating_mode),
                                text(R.string.gboard_wispr_flow_floating_mode_summary), true,
                                () -> WisprFlowRuntime.send(host.getContext(), "floating"))))));
    }
    private String text(int id) { return GboardSettingsText.get(context, id); }
}
