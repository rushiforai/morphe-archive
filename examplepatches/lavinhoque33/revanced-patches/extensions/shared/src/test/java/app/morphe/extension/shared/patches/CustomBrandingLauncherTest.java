/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-20.
 */
package app.morphe.extension.shared.patches;

import static android.content.pm.PackageManager.COMPONENT_ENABLED_STATE_DEFAULT;
import static android.content.pm.PackageManager.COMPONENT_ENABLED_STATE_DISABLED;
import static android.content.pm.PackageManager.COMPONENT_ENABLED_STATE_ENABLED;
import static android.content.pm.PackageManager.DONT_KILL_APP;
import static android.content.pm.PackageManager.MATCH_DISABLED_COMPONENTS;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import android.content.ComponentName;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.res.Resources;
import android.os.Build;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadow.api.Shadow;
import org.robolectric.shadows.ShadowApplicationPackageManager;

import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.settings.SharedYouTubeSettings;
import app.morphe.extension.shared.utils.Utils;

@SuppressWarnings("deprecation")
@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = {28, 34}, shadows = CustomBrandingLauncherTest.CountingPackageManager.class)
public class CustomBrandingLauncherTest {
    private static final String STOCK_ALIAS = ".morphe_original_1";
    private static final String PRESET_ALIAS = ".morphe_preset_2";
    private static final String SYSTEM_ALIAS = PRESET_ALIAS + "_system";
    private static final String CUSTOM_ALIAS = ".morphe_custom_5_system";
    private static final String HOST_ACTIVITY = ".HostActivity";
    private static final String STOCK_LAUNCHER = ".StockLauncher";
    private static final int ICONS_ID = 0x7f010001;
    private static final int NAMES_ID = 0x7f010002;

    private Context context;
    private PackageManager manager;
    private CountingPackageManager resolver;
    private boolean customAssets;

    @Before
    public void setUp() {
        var application = RuntimeEnvironment.getApplication();
        manager = application.getPackageManager();
        resolver = Shadow.extract(manager);
        var resources = application.getResources();
        var brandingResources = new Resources(resources.getAssets(), resources.getDisplayMetrics(),
                resources.getConfiguration()) {
            @Override
            public int getIdentifier(String name, String type, String packageName) {
                return switch (name) {
                    case "morphe_custom_branding_icon_entry_values" -> ICONS_ID;
                    case "morphe_custom_branding_name_entries" -> NAMES_ID;
                    case "morphe_custom_branding_splash_preset" -> android.R.drawable.ic_media_play;
                    case "morphe_custom_branding_system_splash_preset" -> android.R.style.Theme_Material;
                    default -> super.getIdentifier(name, type, packageName);
                };
            }

            @Override
            public String[] getStringArray(int id) {
                return switch (id) {
                    case ICONS_ID -> customAssets ? new String[]{"original", "preset", "custom"}
                            : new String[]{"original", "preset"};
                    case NAMES_ID -> customAssets ? new String[]{"Stock", "Preset", "RVX", "Alt", "Custom"}
                            : new String[]{"Stock", "Preset", "RVX", "Alt"};
                    default -> super.getStringArray(id);
                };
            }
        };
        context = new ContextWrapper(application) {
            @Override
            public Resources getResources() {
                return brandingResources;
            }
        };
        Utils.setContext(context);
        SharedYouTubeSettings.CUSTOM_BRANDING_ICON.resetToDefault();
        SharedYouTubeSettings.CUSTOM_BRANDING_NAME.resetToDefault();
        SharedYouTubeSettings.CUSTOM_BRANDING_USE_AS_SYSTEM_SPLASH.resetToDefault();
        install(HOST_ACTIVITY, null, true, false);
    }

    @Test
    public void manifestDefaultIsAlreadyEffectiveOnColdAndRepeatedStartup() {
        install(STOCK_ALIAS, HOST_ACTIVITY, true, true);
        install(PRESET_ALIAS, HOST_ACTIVITY, false, true);
        install(CUSTOM_ALIAS, HOST_ACTIVITY, false, true);

        for (int launch = 0; launch < 2; launch++) {
            startBranding();
            assertOperations(List.of("enabled launchers"));
            assertLaunchers(STOCK_ALIAS);
        }
        assertEquals(COMPONENT_ENABLED_STATE_DEFAULT, manager.getComponentEnabledSetting(component(STOCK_ALIAS)));
        assertEquals(COMPONENT_ENABLED_STATE_DEFAULT, manager.getComponentEnabledSetting(component(CUSTOM_ALIAS)));
    }

    @Test
    public void importedIconNameAndSplashSelectBeforeTheRestartIntentIsResolved() {
        install(STOCK_ALIAS, HOST_ACTIVITY, true, true);
        install(PRESET_ALIAS, HOST_ACTIVITY, false, true);
        install(SYSTEM_ALIAS, HOST_ACTIVITY, false, true);
        assertLaunchers(STOCK_ALIAS);

        assertTrue(Setting.importFromJSON(context, """
                "morphe_custom_branding_icon":"preset", "morphe_custom_branding_name":2,
                "morphe_custom_branding_use_as_system_splash":true
                """));
        recordPackageManagerCalls(() -> CustomBrandingPatch.prepareLauncherRestart(context));
        String selected = Build.VERSION.SDK_INT >= Build.VERSION_CODES.S ? SYSTEM_ALIAS : PRESET_ALIAS;
        assertSwitch(selected, STOCK_ALIAS);
        assertLaunchers(selected);
        assertEquals(component(selected), manager.getLaunchIntentForPackage(context.getPackageName()).getComponent());
        assertEquals("Preset", context.getApplicationInfo().nonLocalizedLabel);

        startBranding();
        assertOperations(List.of("enabled launchers"));
        assertLaunchers(selected);

        assertTrue(Setting.importFromJSON(context, ""));
        recordPackageManagerCalls(() -> CustomBrandingPatch.prepareLauncherRestart(context));
        assertSwitch(STOCK_ALIAS, selected);
        assertLaunchers(STOCK_ALIAS);
        assertEquals(component(STOCK_ALIAS), manager.getLaunchIntentForPackage(context.getPackageName()).getComponent());
    }

    @Test
    public void replacementAtTheSameVersionRechecksNewManifestDefaults() throws Exception {
        install(STOCK_ALIAS, HOST_ACTIVITY, true, true);
        resolver.getInternalMutablePackageInfo(context.getPackageName()).setLongVersionCode(1234L);
        long version = manager.getPackageInfo(context.getPackageName(), 0).getLongVersionCode();
        startBranding();
        assertLaunchers(STOCK_ALIAS);

        // The resolver sees the updated manifest, while the selected settings and version stay unchanged.
        install(STOCK_ALIAS, HOST_ACTIVITY, false, true);
        install(PRESET_ALIAS, HOST_ACTIVITY, true, true);
        assertEquals(version, manager.getPackageInfo(context.getPackageName(), 0).getLongVersionCode());
        assertLaunchers(PRESET_ALIAS);
        startBranding();
        assertSwitch(STOCK_ALIAS, PRESET_ALIAS);
        assertLaunchers(STOCK_ALIAS);
    }

    @Test
    public void repairsAnExternalDisableWithoutASelectionOrPackageChange() {
        install(STOCK_ALIAS, HOST_ACTIVITY, true, true);
        startBranding();
        assertLaunchers(STOCK_ALIAS);

        manager.setComponentEnabledSetting(component(STOCK_ALIAS), COMPONENT_ENABLED_STATE_DISABLED, DONT_KILL_APP);
        assertLaunchers();
        startBranding();
        assertOperations(batchOrSingles(List.of("enabled launchers", "installed launchers"), "enable " + STOCK_ALIAS));
        assertLaunchers(STOCK_ALIAS);
    }

    @Test
    public void dropsAnEffectiveHiddenAliasWhenCustomAssetsDisappear() {
        customAssets = true;
        install(STOCK_ALIAS, HOST_ACTIVITY, true, true);
        install(CUSTOM_ALIAS, HOST_ACTIVITY, false, true);
        manager.setComponentEnabledSetting(component(CUSTOM_ALIAS), COMPONENT_ENABLED_STATE_ENABLED, DONT_KILL_APP);
        SharedYouTubeSettings.CUSTOM_BRANDING_ICON.save("custom");
        SharedYouTubeSettings.CUSTOM_BRANDING_NAME.save(5);
        assertLaunchers(CUSTOM_ALIAS, STOCK_ALIAS);

        // Hidden custom alias still exists and has an override from the previous build.
        customAssets = false;
        startBranding();
        assertOperations(batchOrSingles(List.of("enabled launchers"), "disable " + CUSTOM_ALIAS));
        assertLaunchers(STOCK_ALIAS);
        assertEquals("original", SharedYouTubeSettings.CUSTOM_BRANDING_ICON.get());
        assertEquals(1, (int) SharedYouTubeSettings.CUSTOM_BRANDING_NAME.get());
    }

    @Test
    public void missingOriginalAliasLeavesTheCurrentLauncherEnabled() {
        install(PRESET_ALIAS, HOST_ACTIVITY, true, true);
        // Same-named activity without a MAIN/LAUNCHER filter is not a replacement.
        install(STOCK_ALIAS, HOST_ACTIVITY, false, false);
        startBranding();
        assertOperations(List.of("enabled launchers", "installed launchers"));
        assertLaunchers(PRESET_ALIAS);
    }

    @Test
    public void noPatchedManifestLeavesStockLauncherAndWritesNothing() {
        install(STOCK_LAUNCHER, null, true, true);
        startBranding();
        assertOperations(List.of("enabled launchers", "installed launchers"));
        assertLaunchers(STOCK_LAUNCHER);
    }

    @Test
    public void enableOrBatchFailureNeverRetiresTheExistingLauncher() {
        install(STOCK_ALIAS, HOST_ACTIVITY, true, true);
        install(PRESET_ALIAS, HOST_ACTIVITY, false, true);
        SharedYouTubeSettings.CUSTOM_BRANDING_ICON.save("preset");
        SharedYouTubeSettings.CUSTOM_BRANDING_NAME.save(2);
        resolver.rejectWrite = true;
        startBranding();
        assertOperations(Build.VERSION.SDK_INT >= 33
                ? List.of("enabled launchers", "installed launchers", "batch", "enable " + PRESET_ALIAS,
                        "disable " + STOCK_ALIAS)
                : List.of("enabled launchers", "installed launchers", "enable " + PRESET_ALIAS));
        assertLaunchers(STOCK_ALIAS);

        resolver.rejectWrite = false;
        startBranding();
        assertSwitch(PRESET_ALIAS, STOCK_ALIAS);
        assertLaunchers(PRESET_ALIAS);
    }

    @Test
    @Config(sdk = 28)
    public void legacyDoesNotRetireOldLauncherAfterAnIneffectiveEnable() {
        install(STOCK_ALIAS, HOST_ACTIVITY, true, true);
        install(PRESET_ALIAS, HOST_ACTIVITY, false, true);
        SharedYouTubeSettings.CUSTOM_BRANDING_ICON.save("preset");
        SharedYouTubeSettings.CUSTOM_BRANDING_NAME.save(2);
        resolver.ignoreSingleEnable = true;

        startBranding();
        assertOperations(List.of("enabled launchers", "installed launchers", "enable " + PRESET_ALIAS,
                "enabled launchers"));
        assertLaunchers(STOCK_ALIAS);
    }

    private void startBranding() {
        recordPackageManagerCalls(() -> CustomBrandingPatch.setBranding(null));
    }

    private void recordPackageManagerCalls(Runnable action) {
        resolver.calls.clear();
        resolver.recording = true;
        try {
            action.run();
        } finally {
            resolver.recording = false;
        }
    }

    private void install(String name, String target, boolean enabled, boolean launcher) {
        ComponentName component = component(name);
        ActivityInfo info = new ActivityInfo();
        info.name = component.getClassName();
        info.packageName = context.getPackageName();
        info.applicationInfo = context.getApplicationInfo();
        info.targetActivity = target == null ? null : component(target).getClassName();
        info.enabled = enabled;
        info.exported = true;
        resolver.addOrUpdateActivity(info);
        resolver.clearIntentFilterForActivity(component);
        if (launcher) {
            IntentFilter filter = new IntentFilter(Intent.ACTION_MAIN);
            filter.addCategory(Intent.CATEGORY_LAUNCHER);
            resolver.addIntentFilterForActivity(component, filter);
        }
    }

    private ComponentName component(String suffix) {
        return new ComponentName(context, context.getPackageName() + suffix);
    }

    private void assertLaunchers(String... names) {
        Intent launcher = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER)
                .setPackage(context.getPackageName());
        List<String> actual = manager.queryIntentActivities(launcher, 0).stream()
                .map(result -> result.activityInfo.name).sorted().toList();
        List<String> expected = List.of(names).stream().map(name -> component(name).getClassName()).sorted().toList();
        assertEquals(expected, actual);
    }

    private void assertSwitch(String enable, String disable) {
        if (Build.VERSION.SDK_INT >= 33) {
            assertOperations(batchOrSingles(List.of("enabled launchers", "installed launchers"),
                    "enable " + enable, "disable " + disable));
        } else {
            assertOperations(List.of("enabled launchers", "installed launchers", "enable " + enable,
                    "enabled launchers", "disable " + disable));
        }
    }

    private static List<String> batchOrSingles(List<String> reads, String... changes) {
        List<String> operations = new ArrayList<>(reads);
        if (Build.VERSION.SDK_INT >= 33) operations.add("batch");
        operations.addAll(List.of(changes));
        return operations;
    }

    private void assertOperations(List<String> expected) {
        assertEquals(expected, resolver.calls);
    }

    /** Counts calls at the public PM boundary; successful writes and all queries use Robolectric's resolver. */
    @Implements(className = "android.app.ApplicationPackageManager", isInAndroidSdk = false)
    public static class CountingPackageManager extends ShadowApplicationPackageManager {
        final List<String> calls = new ArrayList<>();
        boolean recording;
        boolean rejectWrite;
        boolean ignoreSingleEnable;

        @Implementation
        @Override
        protected List<ResolveInfo> queryIntentActivities(Intent intent, int flags) {
            if (recording) {
                calls.add((flags & MATCH_DISABLED_COMPONENTS) == 0 ? "enabled launchers" : "installed launchers");
            }
            return super.queryIntentActivities(intent, flags);
        }

        @Implementation
        @Override
        protected int getComponentEnabledSetting(ComponentName component) {
            if (recording) calls.add("component state");
            return super.getComponentEnabledSetting(component);
        }

        @Implementation
        @Override
        protected PackageInfo getPackageInfo(String packageName, int flags) throws PackageManager.NameNotFoundException {
            if (recording) calls.add("package info");
            return super.getPackageInfo(packageName, flags);
        }

        @Implementation
        @Override
        protected void setComponentEnabledSetting(ComponentName component, int state, int flags) {
            if (recording) {
                recordChange(component, state, flags);
                if (rejectWrite) throw new SecurityException("rejected by test");
                if (ignoreSingleEnable && state == COMPONENT_ENABLED_STATE_ENABLED) return;
            }
            super.setComponentEnabledSetting(component, state, flags);
        }

        @Implementation(minSdk = 33)
        @Override
        protected void setComponentEnabledSettings(List<PackageManager.ComponentEnabledSetting> changes) {
            if (recording) {
                calls.add("batch");
                for (var change : changes) {
                    recordChange(change.getComponentName(), change.getEnabledState(), change.getEnabledFlags());
                }
                if (rejectWrite) throw new SecurityException("rejected by test");
            }
            super.setComponentEnabledSettings(changes);
        }

        private void recordChange(ComponentName component, int state, int flags) {
            assertEquals(DONT_KILL_APP, flags);
            String suffix = component.getClassName().substring(component.getPackageName().length());
            if (state == COMPONENT_ENABLED_STATE_ENABLED) {
                calls.add("enable " + suffix);
            } else {
                assertEquals(COMPONENT_ENABLED_STATE_DISABLED, state);
                calls.add("disable " + suffix);
            }
        }
    }
}
