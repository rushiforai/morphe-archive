package app.afterglow.extension.ui;

import android.app.AlertDialog;
import android.text.Editable;
import android.text.InputFilter;
import android.text.InputType;
import android.text.TextWatcher;
import android.widget.EditText;
import android.widget.LinearLayout;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import app.afterglow.extension.destinations.AiHomeLibrary;
import app.afterglow.extension.destinations.AiHomeRouter;
import app.afterglow.extension.destinations.DestinationStores;

/** AI Home's local prompt library and honest native YouTube handoff state. */
final class AiHomeScreen extends DestinationScreen {
    private final AfterglowDestinations.Navigator navigator;
    private final AiHomeLibrary library;
    private String draft = "";
    AiHomeScreen(AfterglowActivity activity, AfterglowDestinations.Navigator navigator) {
        super(activity); this.navigator = navigator;
        library = DestinationStores.aiHome(activity);
    }
    @Override String title() { return "AI Home Studio"; }
    @Override void build(LinearLayout content) {
        RowViews views = activity.views();
        content.addView(views.sectionTitle("Describe your ideal feed"));
        content.addView(views.caption("Afterglow stores prompts only on this device. YouTube's native AI chooses and displays the videos."));
        EditText composer = new EditText(activity);
        composer.setHint("What would you like to watch?"); composer.setText(draft);
        composer.setTextColor(views.palette.text); composer.setHintTextColor(views.palette.secondaryText);
        composer.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE);
        composer.setMinLines(3); composer.setMaxLines(10);
        composer.setFilters(new InputFilter[]{new InputFilter.LengthFilter(AiHomeLibrary.MAX_TEXT)});
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -2);
        params.setMargins(views.dp(16), views.dp(8), views.dp(16), views.dp(8)); content.addView(composer, params);
        composer.addTextChangedListener(new TextWatcher() {
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
            public void onTextChanged(CharSequence s, int start, int before, int count) { draft = s.toString(); }
            public void afterTextChanged(Editable e) {}
        });
        AiHomeRouter.Capability capability = AiHomeRouter.capability();
        content.addView(views.caption(capability.message));
        if (capability.runPrompt) row(content, "Run with YouTube AI", null, null, () -> handoff(draft, true));
        else if (capability.nativeEntry) row(content, "Copy & Open Custom Feed", "Paste your prompt into YouTube's native prompt editor.", null, () -> handoff(draft, false));
        else row(content, "Copy Prompt", "Keep the text ready for YouTube's custom-feed control.", null, () -> {
            try { copy("AI Home prompt", AiHomeLibrary.normalize(draft)); } catch (Exception e) { activity.alert(title(), e.getMessage()); }
        });
        if (capability.nativeEntry) row(content, "Open Native AI Home", null, null, () -> {
            if (AiHomeRouter.openNativeEntry()) navigator.closeToNativeHome(); else activity.alert(title(), "The native control is no longer available. Open Home and try again.");
        });
        row(content, "Save Prompt", "Save it on this device.", null, () -> save(null, draft, "", false));
        if (library.recoveryMessage() != null) content.addView(views.caption(library.recoveryMessage()));
        content.addView(views.sectionTitle("Quick Ideas"));
        for (String idea : library.ideas()) row(content, idea, null, "Use", () -> { draft = idea; activity.refresh(); });
        List<Map<String, Object>> saved = library.saved();
        content.addView(views.sectionTitle("Favorites"));
        int favorites = 0;
        for (Map<String, Object> row : saved) if (Boolean.TRUE.equals(row.get("favorite"))) { prompt(content, row, true); favorites++; }
        if (favorites == 0) content.addView(views.caption("Favorite a saved prompt to keep it here."));
        content.addView(views.sectionTitle("Saved Prompts"));
        if (saved.isEmpty()) content.addView(views.caption("Your saved prompts will appear here."));
        for (Map<String, Object> row : saved) prompt(content, row, true);
        content.addView(views.sectionTitle("Recent Prompts"));
        List<Map<String, Object>> recent = library.recent();
        if (recent.isEmpty()) content.addView(views.caption("Prompts appear here after a successful native handoff."));
        for (Map<String, Object> row : recent) prompt(content, row, false);
        content.addView(views.sectionTitle("Tools"));
        row(content, "Edit Quick Ideas", "Choose up to 12 local prompt ideas.", null, this::editIdeas);
        row(content, "Clear Recent History", "Saved prompts and favorites are kept.", null,
                () -> confirm("Clear Recent History", "Remove the recent prompt history from this device?", "Clear", library::clearRecent));
        row(content, "Export Prompt Library", "Export saved and recent prompts as an Afterglow property list.", null,
                () -> { try { AfterglowDestinations.export(activity, "Afterglow-AI-Home.plist", library.exportLibrary()); } catch (Exception e) { activity.alert(title(), e.getMessage()); } });
        row(content, "Import Prompt Library", "Replace this device's saved and recent prompts with an exported library.", null,
                () -> new AlertDialog.Builder(activity).setTitle("Import Prompt Library").setMessage("The imported library will replace saved prompts and recent history.")
                        .setNegativeButton("Cancel", null).setPositiveButton("Choose File", (d, w) -> AfterglowDestinations.importDocument(activity, library::importLibrary)).show());
        row(content, "Back to Normal Home", null, null, () -> {
            if (AiHomeRouter.openNormalHome()) navigator.closeToNativeHome(); else activity.alert(title(), "The native Home control is not available yet. Return to YouTube and select Home.");
        });
    }
    private void handoff(String text, boolean direct) {
        try {
            String prompt = AiHomeLibrary.normalize(text);
            if (!direct) copy("AI Home prompt", prompt);
            boolean accepted = direct ? AiHomeRouter.runPrompt(prompt) : AiHomeRouter.openNativeEntry();
            if (!accepted) { activity.alert(title(), "The native custom-feed control is no longer available. Your prompt was kept."); return; }
            run(() -> library.recordRun(prompt, System.currentTimeMillis()));
            navigator.closeToNativeHome();
        } catch (Exception error) { activity.alert(title(), error.getMessage()); }
    }
    private void prompt(LinearLayout content, Map<String, Object> entry, boolean saved) {
        String name = (String) entry.get("name"), text = (String) entry.get("text");
        row(content, name.isEmpty() ? text : name, name.isEmpty() ? null : text,
                Boolean.TRUE.equals(entry.get("favorite")) ? "★" : null, () -> promptActions(entry, saved));
    }
    private void save(String id, String text, String name, boolean favorite) {
        try { String normalized = AiHomeLibrary.normalize(text);
            input("Save Prompt", name, 200, false, value -> library.save(id, normalized, value, favorite, System.currentTimeMillis()));
        } catch (Exception error) { activity.alert(title(), error.getMessage()); }
    }
    private void promptActions(Map<String, Object> entry, boolean saved) {
        String text = (String) entry.get("text"), id = (String) entry.get("identifier"), name = (String) entry.get("name");
        boolean favorite = Boolean.TRUE.equals(entry.get("favorite"));
        List<String> actions = new ArrayList<>();
        if (AiHomeRouter.capability().nativeEntry) actions.add("Run Again");
        actions.add("Refine"); actions.add("Copy Prompt");
        if (saved) { actions.add("Rename"); actions.add(favorite ? "Remove Favorite" : "Favorite"); actions.add("Delete"); }
        else actions.add("Save Prompt");
        new AlertDialog.Builder(activity).setTitle(name.isEmpty() ? "Prompt" : name).setItems(actions.toArray(new String[0]), (dialog, which) -> {
            switch (actions.get(which)) {
                case "Run Again": handoff(text, AiHomeRouter.capability().runPrompt); break;
                case "Refine": draft = text; activity.refresh(); break;
                case "Copy Prompt": copy("AI Home prompt", text); break;
                case "Rename": save(id, text, name, favorite); break;
                case "Favorite": case "Remove Favorite": run(() -> library.save(id, text, name, !favorite, System.currentTimeMillis())); break;
                case "Delete": confirm("Delete Prompt", "Remove this saved prompt? Recent history will be kept.", "Delete", () -> library.delete(id)); break;
                case "Save Prompt": save(null, text, name, favorite); break;
            }
        }).setNegativeButton("Cancel", null).show();
    }
    private void editIdeas() {
        List<String> ideas = library.ideas(), labels = new ArrayList<>(ideas);
        if (ideas.size() < 12) labels.add("Add Idea"); labels.add("Reset Quick Ideas");
        new AlertDialog.Builder(activity).setTitle("Quick Ideas").setItems(labels.toArray(new String[0]), (dialog, which) -> {
            if (which < ideas.size()) {
                new AlertDialog.Builder(activity).setTitle("Quick Idea").setItems(new String[]{"Edit", "Delete"}, (d, action) -> {
                    if (action == 0) input("Edit Quick Idea", ideas.get(which), 4000, true, value -> { ideas.set(which, value); library.setIdeas(ideas); });
                    else run(() -> { ideas.remove(which); library.setIdeas(ideas); });
                }).show();
            } else if (labels.get(which).equals("Add Idea")) input("Add Quick Idea", "", 4000, true, value -> { ideas.add(value); library.setIdeas(ideas); });
            else confirm("Reset Quick Ideas", "Restore the four default ideas?", "Reset", () -> library.setIdeas(Arrays.asList(AiHomeLibrary.DEFAULT_IDEAS)));
        }).setNegativeButton("Close", null).show();
    }
}
