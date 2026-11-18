package app.afterglow.extension.ui;

import android.app.AlertDialog;
import android.widget.LinearLayout;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import app.afterglow.extension.destinations.ExperimentRuntime;
import app.afterglow.extension.destinations.ExperimentStore;

/** Observed native flags, typed local profiles, and recovery controls. */
final class ExperimentLabScreen extends DestinationScreen {
    private final ExperimentStore store;
    private final boolean safety;
    private String query = "";
    private int type = -1, source, shown = 50;
    ExperimentLabScreen(AfterglowActivity activity, boolean safety) {
        super(activity); this.safety = safety; store = ExperimentRuntime.store(activity);
    }
    @Override String title() { return safety ? "Experiment Safety" : "AB Lab"; }
    @Override void build(LinearLayout content) {
        if (safety) { safety(content); return; }
        RowViews views = activity.views();
        content.addView(views.caption("Local overrides are applied to verified native Boolean, Integer, Double, and String reads. YouTube's server configuration is kept unchanged. Other native value types are not editable on this Android version."));
        if (!ExperimentRuntime.nativeHooksInstalled()) content.addView(views.caption("The native experiment bridge is not installed in this build. Profiles can be managed, but they will not change YouTube."));
        if (store.recoveryMessage() != null) content.addView(views.caption(store.recoveryMessage()));
        row(content, "Active Profile", store.overrides().size() + " overrides", store.activeProfile(), this::profiles);
        row(content, "Experiment Safety", status(), null, () -> activity.push(new ExperimentLabScreen(activity, true)));
        content.addView(views.sectionTitle("Native Catalog"));
        row(content, "Search Flags", query.isEmpty() ? "Find a native flag ID or observed value." : query, null,
                () -> input("Search Flags", query, 200, false, value -> { query = value.trim().toLowerCase(Locale.ROOT); shown = 50; }));
        String[] types = {"All Types", "Boolean", "Integer", "Double", "String"};
        row(content, "Type", null, types[type + 1], () -> new AlertDialog.Builder(activity).setTitle("Type")
                .setSingleChoiceItems(types, type + 1, (d, w) -> { type = w - 1; shown = 50; d.dismiss(); activity.refresh(); }).setNegativeButton("Cancel", null).show());
        String[] sources = {"All Observed", "Overridden", "Not Overridden", "Favorites", "Recent Server Changes"};
        row(content, "Source", "Native configuration packages", sources[source], () -> new AlertDialog.Builder(activity).setTitle("Source")
                .setSingleChoiceItems(sources, source, (d, w) -> { source = w; shown = 50; d.dismiss(); activity.refresh(); }).setNegativeButton("Cancel", null).show());
        row(content, "Refresh Catalog", "Only flags actually read by this running app are listed.", null, activity::refresh);
        List<ExperimentRuntime.Observation> observed = source == 4 ? ExperimentRuntime.recentChanges() : ExperimentRuntime.catalog();
        List<Map<String, Object>> overrides = store.overrides(); List<String> favorites = store.favorites();
        int matches = 0;
        for (ExperimentRuntime.Observation flag : observed) {
            Map<String, Object> override = override(overrides, flag.namespace, flag.flag);
            if (type >= 0 && type != flag.type || source == 1 && override == null || source == 2 && override != null
                    || source == 3 && !favorites.contains(flag.namespace + ":" + flag.flag)) continue;
            String description = description(flag.flag);
            if (!query.isEmpty() && !(flag.flag + " " + description + " " + flag.serverValue).toLowerCase(Locale.ROOT).contains(query)) continue;
            if (++matches > shown) continue;
            String detail = flag.namespace + "\n" + ExperimentStore.TYPES[flag.type] + " · Server: " + preview(flag.serverValue);
            if (!description.isEmpty()) detail = description + "\n" + detail;
            if (override != null) detail += "\nLocal: " + preview(override.get("value")) + (Boolean.TRUE.equals(override.get("enabled")) ? " (enabled)" : " (disabled)");
            row(content, (favorites.contains(flag.namespace + ":" + flag.flag) ? "★ " : "") + flag.flag, detail, "Edit", () -> edit(flag));
        }
        if (matches == 0) content.addView(views.caption(observed.isEmpty() ? "No native reads have been observed yet. Browse YouTube, then refresh this catalog." : "No flags match these filters."));
        if (matches > shown) row(content, "Show More", "Showing " + shown + " of " + matches + " flags", null, () -> { shown += 50; activity.refresh(); });
        content.addView(views.sectionTitle("Profiles & Files"));
        row(content, "Create Profile", "Start without overrides.", null, () -> input("Create Profile", "", 80, false, value -> store.create(value, false)));
        row(content, "Duplicate Active Profile", "Copy current overrides into a separate profile.", null, () -> input("Duplicate Profile", store.activeProfile() + " Copy", 80, false, value -> store.create(value, true)));
        row(content, "Import Profile", "Import an Android Afterglow profile. Existing names must be unique.", null, () -> AfterglowDestinations.importDocument(activity, store::importProfile));
        row(content, "Export Active Profile", "Save a portable property list of this profile's overrides.", null, () -> {
            try { AfterglowDestinations.export(activity, "Afterglow-Experiments.plist", store.exportProfile(store.activeProfile())); }
            catch (Exception e) { activity.alert(title(), e.getMessage()); }
        });
        content.addView(views.caption("Changes apply to subsequent native reads. Cached features may need a restart after the 30-second foreground verification period. Dedicated Afterglow feature switches can take precedence over an experiment override."));
    }
    private void safety(LinearLayout content) {
        RowViews views = activity.views();
        content.addView(views.sectionTitle("Current State")); content.addView(views.caption(status()));
        content.addView(views.caption("A changed active profile must run for 30 uninterrupted foreground seconds before it becomes known good. Background time does not count. An interrupted pending revision is bypassed at the next launch."));
        content.addView(views.switchRow("Bypass All Experiment Overrides", "Use native server values while keeping profiles.", store.bypass(), true,
                (button, checked) -> mutate(() -> store.setBypass(checked))));
        if (store.recoveryRequired()) row(content, "Retry Current Profile", "Apply this profile again and start a new foreground verification period.", null,
                () -> confirm("Retry Current Profile", "Re-enable this profile's native overrides?", "Retry", () -> { store.retryPending(); ExperimentRuntime.changed(); }));
        row(content, "Restore Last Known Good", "Restore the last profile that completed foreground verification.", null,
                () -> confirm("Restore Last Known Good", "Replace the known-good profile's overrides with its last verified snapshot? Other profiles are kept.", "Restore", () -> { store.restoreKnownGood(); ExperimentRuntime.changed(); }));
        row(content, "Discard Pending Overrides", "Clear overrides in the active profile and keep other profiles.", null,
                () -> confirm("Discard Pending Overrides", "Remove every override in " + store.activeProfile() + "?", "Discard", () -> { store.resetActive(); store.retryPending(); ExperimentRuntime.changed(); }));
        row(content, "Keep Overrides Disabled", "Leave profiles untouched and keep using native values.", null, () -> mutate(() -> store.setBypass(true)));
        row(content, "Reset Active Profile", "Favorites, other profiles, and YouTube's server values are kept.", null,
                () -> confirm("Reset Active Profile", "Remove all active overrides?", "Reset", () -> { store.resetActive(); ExperimentRuntime.changed(); }));
    }
    private String status() {
        if (store.recoveryRequired()) return "Recovery required. Local overrides are bypassed because a pending revision did not complete verification.";
        if (store.bypass()) return "Local overrides are bypassed.";
        if (store.pending()) return "Pending revision " + store.revision() + ". Keep YouTube in the foreground for 30 seconds to verify it.";
        return "No unverified experiment changes.";
    }
    private void mutate(Task mutation) { run(() -> { mutation.run(); ExperimentRuntime.changed(); }); }
    private void profiles() {
        List<String> profiles = store.profiles();
        new AlertDialog.Builder(activity).setTitle("Profiles").setItems(profiles.toArray(new String[0]), (d, which) -> {
            String name = profiles.get(which);
            List<String> options = new ArrayList<>(); if (!name.equals(store.activeProfile())) options.add("Activate");
            options.add("Rename"); if (!name.equals(store.activeProfile())) options.add("Delete"); options.add("Export");
            new AlertDialog.Builder(activity).setTitle(name).setItems(options.toArray(new String[0]), (dialog, action) -> {
                switch (options.get(action)) {
                    case "Activate": mutate(() -> store.activate(name)); break;
                    case "Rename": input("Rename Profile", name, 80, false, value -> store.rename(name, value)); break;
                    case "Delete": confirm("Delete Profile", "Delete " + name + " and its overrides?", "Delete", () -> store.delete(name)); break;
                    case "Export": try { AfterglowDestinations.export(activity, "Afterglow-Experiments.plist", store.exportProfile(name)); } catch (Exception e) { activity.alert(title(), e.getMessage()); } break;
                }
            }).setNegativeButton("Cancel", null).show();
        }).setNegativeButton("Close", null).show();
    }
    private void edit(ExperimentRuntime.Observation flag) {
        Map<String, Object> override = override(store.overrides(), flag.namespace, flag.flag);
        Object current = override == null ? flag.serverValue : override.get("value");
        boolean favorite = store.favorites().contains(flag.namespace + ":" + flag.flag);
        List<String> options = new ArrayList<>(); options.add("Edit Value");
        if (override != null) { options.add(Boolean.TRUE.equals(override.get("enabled")) ? "Disable Override" : "Enable Override"); options.add("Reset to Server Value"); }
        options.add(favorite ? "Remove Favorite" : "Favorite"); options.add("Copy Flag ID");
        new AlertDialog.Builder(activity).setTitle(String.valueOf(flag.flag)).setItems(options.toArray(new String[0]), (dialog, which) -> {
            switch (options.get(which)) {
                case "Edit Value":
                    if (flag.type == 0) new AlertDialog.Builder(activity).setTitle("Boolean Value").setSingleChoiceItems(new String[]{"False", "True"}, Boolean.TRUE.equals(current) ? 1 : 0,
                            (d, value) -> { d.dismiss(); mutate(() -> store.setOverride(flag.namespace, flag.flag, flag.type, value == 1, true)); }).setNegativeButton("Cancel", null).show();
                    else input(ExperimentStore.TYPES[flag.type] + " Value", String.valueOf(current), 16384, flag.type == 3,
                            value -> { store.setOverride(flag.namespace, flag.flag, flag.type, ExperimentStore.parseValue(flag.type, value), true); ExperimentRuntime.changed(); });
                    break;
                case "Disable Override": mutate(() -> store.setOverride(flag.namespace, flag.flag, flag.type, current, false)); break;
                case "Enable Override": mutate(() -> store.setOverride(flag.namespace, flag.flag, flag.type, current, true)); break;
                case "Reset to Server Value": mutate(() -> store.resetFlag(flag.namespace, flag.flag)); break;
                case "Favorite": case "Remove Favorite": run(() -> store.favorite(flag.namespace, flag.flag, !favorite)); break;
                case "Copy Flag ID": copy("Native flag", String.valueOf(flag.flag)); break;
            }
        }).setNegativeButton("Close", null).show();
    }
    private static Map<String, Object> override(List<Map<String, Object>> entries, String namespace, long flag) {
        for (Map<String, Object> entry : entries) if (namespace.equals(entry.get("package")) && String.valueOf(flag).equals(entry.get("flag"))) return entry; return null;
    }
    private static String preview(Object value) { String text = String.valueOf(value); return text.length() <= 180 ? text : text.substring(0, 180) + "…"; }
    private static String description(long flag) {
        return flag == 45798642L ? "Floating playlist minibar layout. The dedicated Original playlist minibar preference takes precedence." : "";
    }
}
