package dev.twitchpatches.extension.settings;

import android.app.DialogFragment;
import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Toolbar;
import android.widget.SearchView;
import android.view.inputmethod.InputMethodManager;

@SuppressWarnings("deprecation") // Platform fragment avoids depending on Twitch's obfuscated AndroidX router.
public final class PatchSettingsPage extends DialogFragment {
    static final String TAG = "twitch_patches_settings";
    private SettingsNavigation navigation;
    private LinearLayout contents;
    private ScrollView scroll;
    private Toolbar toolbar;
    private SearchView search;
    private boolean restoringSearch;
    private AutoCloseable windowSubscription;

    static PatchSettingsPage forGroup(String key) {
        PatchSettingsPage page = new PatchSettingsPage();
        Bundle arguments = new Bundle();
        arguments.putString("group", key);
        page.setArguments(arguments);
        return page;
    }

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        setStyle(STYLE_NO_TITLE, 0);
        if (state != null && state.containsKey("routes") && state.containsKey("offsets")) {
            navigation = new SettingsNavigation(state.getStringArrayList("routes"), state.getIntegerArrayList("offsets"),
                    state.getStringArrayList("queries"), state.getIntegerArrayList("browse_offsets"));
        } else navigation = new SettingsNavigation(getArguments() == null ? null : getArguments().getString("group"));
    }

    @Override public Dialog onCreateDialog(Bundle state) {
        return new Dialog(getActivity(), getTheme()) {
            @Override public void onBackPressed() { back(); }
        };
    }

    @Override public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle state) {
        Context context = getActivity();
        LinearLayout page = new LinearLayout(context);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setBackgroundColor(TwitchSettingsResources.color(context, "background_body"));
        toolbar = TwitchSettingsToolbar.create(context, this::back);
        page.addView(toolbar,
                new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        search = SettingsSearchBar.create(context);
        page.addView(search, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        syncSearch();
        search.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
            @Override public boolean onQueryTextSubmit(String query) { hideKeyboard(); return true; }
            @Override public boolean onQueryTextChange(String query) {
                if (restoringSearch || contents == null || query.equals(navigation.query())) return true;
                navigation.search(query, scroll.getScrollY());
                renderPage();
                restoreScroll();
                return true;
            }
        });
        page.setFocusableInTouchMode(true);
        page.requestFocus();

        scroll = new ScrollView(context);
        scroll.setFillViewport(true);
        contents = new LinearLayout(context);
        contents.setOrientation(LinearLayout.VERTICAL);
        int padding = TwitchSettingsResources.spacing(context, "space_16");
        contents.setPadding(0, 0, 0, padding);
        renderPage();
        scroll.addView(contents, new ScrollView.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        page.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        restoreScroll();
        return page;
    }

    private void open(SettingGroup group) {
        navigation.open(group.key(), scroll.getScrollY());
        hideKeyboard();
        syncSearch();
        renderPage();
        scroll.scrollTo(0, 0);
    }

    private void renderPage() {
        SettingGroup group = PatchSettings.group(navigation.current());
        toolbar.setTitle(group == null ? "Patch settings" : group.title());
        contents.removeAllViews();
        if (!navigation.query().trim().isEmpty()) {
            TwitchSettingsRows.results(contents, SettingsSearch.find(PatchSettings.options(), navigation.query(), ""), this::open);
            return;
        }
        java.util.List<? extends SettingEntry> options = group == null ? PatchSettings.options() : group.children();
        boolean headers = group == null || options.stream().map(SettingEntry::section).distinct().count() > 1;
        TwitchSettingsRows.populate(contents, options, this::open, headers);
        if (group != null && group.children().isEmpty() && !group.emptyMessage().isEmpty())
            TwitchSettingsRows.empty(contents, group.emptyMessage());
    }

    private void back() {
        if (!navigation.query().isEmpty()) {
            search.setQuery("", false);
            hideKeyboard();
            return;
        }
        if (!navigation.back()) { closePage(); return; }
        syncSearch();
        renderPage();
        restoreScroll();
    }

    private void restoreScroll() {
        int offset = navigation.scroll();
        String route = navigation.current();
        String query = navigation.query();
        ScrollView target = scroll;
        target.post(() -> {
            if (scroll == target && java.util.Objects.equals(route, navigation.current()) &&
                    query.equals(navigation.query())) target.scrollTo(0, offset);
        });
    }

    @Override public void onSaveInstanceState(Bundle state) {
        super.onSaveInstanceState(state);
        if (scroll != null) navigation.saveScroll(scroll.getScrollY());
        state.putStringArrayList("routes", navigation.routes());
        state.putIntegerArrayList("offsets", navigation.offsets());
        state.putStringArrayList("queries", navigation.queries());
        state.putIntegerArrayList("browse_offsets", navigation.browseOffsets());
    }

    @Override public void onDestroyView() {
        super.onDestroyView();
        contents = null;
        scroll = null;
        toolbar = null;
        if (search != null) search.setOnQueryTextListener(null);
        search = null;
    }

    @Override public void onStart() {
        super.onStart();
        android.app.Dialog dialog = getDialog();
        if (dialog == null || getActivity() == null) return;
        Window window = dialog.getWindow();
        if (window == null) return;
        windowSubscription = SettingsWindow.bind(window, TwitchSettingsResources.color(getActivity(), "background_body"));
    }

    @Override public void onStop() {
        if (windowSubscription != null) {
            try { windowSubscription.close(); }
            catch (Exception error) { android.util.Log.w("TwitchPatchesSettings", "Window subscription cleanup failed"); }
            windowSubscription = null;
        }
        super.onStop();
    }

    private void syncSearch() {
        restoringSearch = true;
        try { search.setQuery(navigation.query(), false); }
        finally { restoringSearch = false; }
    }

    private void hideKeyboard() {
        search.clearFocus();
        InputMethodManager keyboard = (InputMethodManager) search.getContext().getSystemService(Context.INPUT_METHOD_SERVICE);
        if (keyboard != null) keyboard.hideSoftInputFromWindow(search.getWindowToken(), 0);
    }

    private void closePage() {
        android.app.FragmentManager manager = getFragmentManager();
        if (manager == null || manager.isStateSaved()) dismissAllowingStateLoss();
        else dismiss();
    }
}
