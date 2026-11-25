package com.akshaykadam.pixelboard.extension.settings;

import android.app.Activity;
import android.content.Context;

import com.akshaykadam.pixelboard.extension.updater.GboardBetaManager;
import com.akshaykadam.pixelboard.extension.updater.GboardNotificationHelper;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * Additional hub containing Notification, Permissions, Reset, and Beta Program sub-sections.
 */
public final class GboardAdditionalFeature implements GboardPatchesSettingsContract.Feature {

    private final Context context;

    public GboardAdditionalFeature(Context context) {
        this.context = context;
    }

    @Override
    public String getEntryTitle() {
        return "Additional";
    }

    @Override
    public String getEntrySummary() {
        return "Notification, Permissions, Reset & Beta Program";
    }

    @Override
    public boolean isAvailable(Context context) {
        return true;
    }

    @Override
    public List<GboardPatchesSettingsContract.Feature> getNavigationChildren() {
        return Arrays.asList(
                new ChooseUiFeature(context),
                new NotificationSettingsFeature(context),
                new TestingModeFeature(context, "Permissions", "Review runtime & system permissions"),
                new TestingModeFeature(context, "Reset", "Reset Gboard Pro settings & caches"),
                new GboardBetaProgramFeature(context)
        );
    }

    @Override
    public void onVisible(GboardPatchesSettingsContract.FeatureHost host) {
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(GboardPatchesSettingsContract.FeatureHost host) {
        final Context ctx = host != null && host.getContext() != null ? host.getContext() : context;
        final String currentUiSummary = GboardM3Helper.isLiquidGlassUiEnabled(ctx)
                ? "3D Liquid Glass UI (Active)"
                : "Classic Material UI (Default) (Active)";

        List<GboardPatchesSettingsContract.Row> rows = new ArrayList<>();
        rows.add(new GboardPatchesSettingsContract.NavigationRow(
                "Choose UI",
                currentUiSummary,
                true,
                () -> GboardPatchesSettingsContract.openFeature(host, new ChooseUiFeature(ctx))
        ));
        rows.add(new GboardPatchesSettingsContract.NavigationRow(
                "Notification",
                "App updates, beta APK & beta feature alert settings",
                true,
                () -> GboardPatchesSettingsContract.openFeature(host, new NotificationSettingsFeature(ctx))
        ));
        rows.add(new GboardPatchesSettingsContract.NavigationRow(
                "Permissions",
                "Review runtime & system permissions",
                true,
                () -> GboardPatchesSettingsContract.openFeature(
                        host, new TestingModeFeature(ctx, "Permissions",
                                "Review runtime & system permissions"))
        ));
        rows.add(new GboardPatchesSettingsContract.NavigationRow(
                "Reset",
                "Reset Gboard Pro settings & caches",
                true,
                () -> GboardPatchesSettingsContract.openFeature(
                        host, new TestingModeFeature(ctx, "Reset",
                                "Reset Gboard Pro settings & caches"))
        ));
        rows.add(new GboardPatchesSettingsContract.NavigationRow(
                "Beta Program",
                "Beta version testing & experimental features",
                true,
                () -> GboardPatchesSettingsContract.openFeature(host, new GboardBetaProgramFeature(ctx))
        ));

        List<GboardPatchesSettingsContract.Section> sections = new ArrayList<>();
        sections.add(new GboardPatchesSettingsContract.Section("ADDITIONAL", rows));

        return new GboardPatchesSettingsContract.Screen(
                "Additional",
                null,
                "Additional",
                "Additional tools, preferences & testing modules",
                Collections.emptyList(),
                sections,
                GboardPatchesSettingsContract.RefreshPolicy.none(),
                GboardPatchesSettingsContract.PanelStyle.FLAT,
                null,
                false
        );
    }

    /**
     * Child placeholder screen shown for Additional items currently under testing mode.
     */
    public static final class TestingModeFeature implements GboardPatchesSettingsContract.Feature {

        private final Context context;
        private final String sectionTitle;
        private final String entrySummary;

        public TestingModeFeature(Context context, String sectionTitle, String entrySummary) {
            this.context = context;
            this.sectionTitle = sectionTitle;
            this.entrySummary = entrySummary;
        }

        @Override
        public String getEntryTitle() {
            return sectionTitle;
        }

        @Override
        public String getEntrySummary() {
            return entrySummary;
        }

        @Override
        public boolean isAvailable(Context context) {
            return true;
        }

        @Override
        public void onVisible(GboardPatchesSettingsContract.FeatureHost host) {
        }

        @Override
        public GboardPatchesSettingsContract.Screen buildScreen(
                GboardPatchesSettingsContract.FeatureHost host) {
            List<GboardPatchesSettingsContract.Row> rows = new ArrayList<>();
            rows.add(new GboardPatchesSettingsContract.DetailRow(
                    "Functions under testing mode",
                    sectionTitle + " controls are currently under testing and will be activated in a future Gboard Pro release.",
                    true
            ));

            List<GboardPatchesSettingsContract.Section> sections = new ArrayList<>();
            sections.add(new GboardPatchesSettingsContract.Section("STATUS", rows));

            return new GboardPatchesSettingsContract.Screen(
                    sectionTitle,
                    null,
                    sectionTitle,
                    entrySummary,
                    Collections.emptyList(),
                    sections,
                    GboardPatchesSettingsContract.RefreshPolicy.none(),
                    GboardPatchesSettingsContract.PanelStyle.FLAT,
                    null,
                    false
            );
        }
    }

    /**
     * Manages alert vs silent notification behavior for stable app updates,
     * beta testing APKs, and experimental beta features.
     */
    public static final class NotificationSettingsFeature implements GboardPatchesSettingsContract.Feature {

        private final Context context;

        public NotificationSettingsFeature(Context context) {
            this.context = context;
        }

        @Override
        public String getEntryTitle() {
            return "Notification";
        }

        @Override
        public String getEntrySummary() {
            return "App updates, beta APK & beta feature alert settings";
        }

        @Override
        public boolean isAvailable(Context context) {
            return true;
        }

        @Override
        public void onVisible(GboardPatchesSettingsContract.FeatureHost host) {
        }

        @Override
        public GboardPatchesSettingsContract.Screen buildScreen(GboardPatchesSettingsContract.FeatureHost host) {
            final Context ctx = host != null && host.getContext() != null ? host.getContext() : context;
            boolean updateAlert = GboardNotificationHelper.isUpdateNotifyAlertEnabled(ctx);
            boolean betaApkAlert = GboardNotificationHelper.isBetaApkNotifyAlertEnabled(ctx);
            boolean betaFeatNotify = GboardNotificationHelper.isBetaFeaturesNotifyEnabled(ctx);

            List<GboardPatchesSettingsContract.Row> rows = new ArrayList<>();
            rows.add(new GboardPatchesSettingsContract.ToggleRow(
                    "App Update Notifications",
                    updateAlert
                            ? "ON: Standard alert notification when a new app update releases"
                            : "OFF: Silent notification arrives quietly without sound or popup",
                    true,
                    updateAlert,
                    value -> {
                        GboardNotificationHelper.setUpdateNotifyAlertEnabled(ctx, value);
                        if (value && ctx instanceof Activity act) {
                            GboardNotificationHelper.requestNotificationPermission(act);
                        }
                        GboardPatchesSettingsContract.refresh(host);
                    }
            ));
            rows.add(new GboardPatchesSettingsContract.ToggleRow(
                    "Beta Testing APK Notifications",
                    betaApkAlert
                            ? "ON: Standard alert notification when a new beta testing APK releases"
                            : "OFF: Silent notification arrives quietly for new beta testing APKs",
                    true,
                    betaApkAlert,
                    value -> {
                        GboardNotificationHelper.setBetaApkNotifyAlertEnabled(ctx, value);
                        if (value && ctx instanceof Activity act) {
                            GboardNotificationHelper.requestNotificationPermission(act);
                        }
                        GboardPatchesSettingsContract.refresh(host);
                    }
            ));
            rows.add(new GboardPatchesSettingsContract.ToggleRow(
                    "Beta Features Notifications",
                    betaFeatNotify
                            ? "ON: Notify when new features are added to New features (Beta)"
                            : "OFF: Do not notify about new experimental beta features",
                    true,
                    betaFeatNotify,
                    value -> {
                        GboardNotificationHelper.setBetaFeaturesNotifyEnabled(ctx, value);
                        if (value && ctx instanceof Activity act) {
                            GboardNotificationHelper.requestNotificationPermission(act);
                        }
                        GboardPatchesSettingsContract.refresh(host);
                    }
            ));

            List<GboardPatchesSettingsContract.Section> sections = new ArrayList<>();
            sections.add(new GboardPatchesSettingsContract.Section("NOTIFICATION PREFERENCES", rows));

            return new GboardPatchesSettingsContract.Screen(
                    "Notification",
                    null,
                    "Notification",
                    "Configure alerts and silent delivery for updates and beta releases",
                    Collections.emptyList(),
                    sections,
                    GboardPatchesSettingsContract.RefreshPolicy.none(),
                    GboardPatchesSettingsContract.PanelStyle.FLAT,
                    null,
                    false
            );
        }
    }

    /**
     * Allows switching seamlessly between the 3D water-drop Liquid Glass UI and the previous
     * clean Material 3 Classic UI across app settings and keyboard surfaces.
     */
    public static final class ChooseUiFeature implements GboardPatchesSettingsContract.Feature {

        private final Context context;

        public ChooseUiFeature(Context context) {
            this.context = context;
        }

        @Override
        public String getEntryTitle() {
            return "Choose UI";
        }

        @Override
        public String getEntrySummary() {
            return GboardM3Helper.isLiquidGlassUiEnabled(context)
                    ? "3D Liquid Glass UI"
                    : "Classic Material UI (Default)";
        }

        @Override
        public boolean isAvailable(Context context) {
            return true;
        }

        @Override
        public void onVisible(GboardPatchesSettingsContract.FeatureHost host) {
        }

        @Override
        public GboardPatchesSettingsContract.Screen buildScreen(
                final GboardPatchesSettingsContract.FeatureHost host) {
            final Context ctx = host != null && host.getContext() != null ? host.getContext() : context;
            final boolean isLiquidGlass = GboardM3Helper.isLiquidGlassUiEnabled(ctx);

            Runnable selectLiquidGlass = () -> applyUiSelection(ctx, host, true);
            Runnable selectClassic = () -> applyUiSelection(ctx, host, false);

            List<GboardPatchesSettingsContract.Row> rows = new ArrayList<>();
            rows.add(new GboardPatchesSettingsContract.RadioRow(
                    "Classic Material UI (Default)",
                    "Clean Material You / Material 3 UI across app settings & keyboard",
                    true,
                    !isLiquidGlass,
                    selectClassic
            ));
            rows.add(new GboardPatchesSettingsContract.RadioRow(
                    "3D Liquid Glass UI",
                    "3D water-drop Liquid Glass cards, orbs, pills, switches & keyboard",
                    true,
                    isLiquidGlass,
                    selectLiquidGlass
            ));

            List<GboardPatchesSettingsContract.Section> sections = new ArrayList<>();
            sections.add(new GboardPatchesSettingsContract.Section("CHOOSE UI STYLE", rows));

            return new GboardPatchesSettingsContract.Screen(
                    "Choose UI",
                    null,
                    "Choose UI",
                    "Switch between 3D Liquid Glass UI and Classic Material UI",
                    Collections.emptyList(),
                    sections,
                    GboardPatchesSettingsContract.RefreshPolicy.none(),
                    GboardPatchesSettingsContract.PanelStyle.FLAT,
                    null,
                    false
            );
        }

        private void applyUiSelection(
                Context ctx,
                GboardPatchesSettingsContract.FeatureHost host,
                boolean enableLiquidGlass) {
            if (GboardM3Helper.isLiquidGlassUiEnabled(ctx) == enableLiquidGlass) {
                return;
            }
            GboardM3Helper.setLiquidGlassUiEnabled(ctx, enableLiquidGlass);
            if (ctx instanceof GboardPatchesSettingsActivity act) {
                act.animateThemeChangeTransition();
            } else if (host != null) {
                host.submit(GboardPatchesSettingsContract.Host::refresh);
            }
        }
    }
}
