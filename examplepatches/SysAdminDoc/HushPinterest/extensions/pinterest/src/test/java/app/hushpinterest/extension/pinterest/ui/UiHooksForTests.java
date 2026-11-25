/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.media.MediaPlayer;
import android.net.Uri;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.Toast;

import java.util.Locale;

import org.robolectric.RuntimeEnvironment;
import org.robolectric.shadows.ShadowMediaPlayer;
import org.robolectric.shadows.ShadowToast;
import org.robolectric.shadows.util.DataSource;

/**
 * Lets tests in other packages name the class the save toast hook treats as a save toast, and hand
 * over closeup rows wearing ids Pinterest's resources would give them.
 */
public final class UiHooksForTests {
    private UiHooksForTests() {}

    private static Resources naming(Context context, String name) {
        Resources original = context.getResources();
        return new Resources(context.getAssets(), original.getDisplayMetrics(), original.getConfiguration()) {
            @Override public String getResourceEntryName(int id) { return name; }
        };
    }

    /** A view wearing the id Pinterest's layouts give it. */
    public static View named(String name) {
        Context context = RuntimeEnvironment.getApplication();
        Resources resources = naming(context, name);
        View view = new View(context) {
            @Override public Resources getResources() { return resources; }
        };
        view.setId(View.generateViewId());
        return view;
    }

    /** A frame wearing the id Pinterest's layouts give it. */
    public static FrameLayout namedFrame(String name) {
        Context context = RuntimeEnvironment.getApplication();
        Resources resources = naming(context, name);
        FrameLayout frame = new FrameLayout(context) {
            @Override public Resources getResources() { return resources; }
        };
        frame.setId(View.generateViewId());
        return frame;
    }

    /** Screens the bottom bar's navigation can report, by the names the hook goes by. */
    public enum Screen { SEARCH_LANDING, HOME_FEED }

    private enum NavigationTab { SEARCH, HOME }

    /** A window with the bottom bar's tabs and the Search page's header holding its search bar. */
    public static final class SearchWindow {
        public final FrameLayout root = namedFrame("content");
        public final View bar = named("bottom_bar");
        public final View searchTab = named("search_tab");
        public final View homeTab = named("home_tab");
        public final View field = named("header_static_search_bar");
        public final FrameLayout holder = namedFrame("header_content");
        public final FrameLayout header;
        public boolean takesTouches = true;
        public int downs;
        public int ups;
        public float x;
        public float y;

        public SearchWindow() {
            Context context = RuntimeEnvironment.getApplication();
            Resources resources = naming(context, "header_bar");
            header = new FrameLayout(context) {
                @Override public Resources getResources() { return resources; }
                @Override public boolean dispatchTouchEvent(MotionEvent event) {
                    x = event.getX();
                    y = event.getY();
                    if (event.getActionMasked() == MotionEvent.ACTION_DOWN) downs++;
                    if (event.getActionMasked() == MotionEvent.ACTION_UP) ups++;
                    return takesTouches;
                }
            };
            header.setId(View.generateViewId());
            holder.addView(field);
            header.addView(holder);
            root.addView(header);
            root.addView(bar);
            root.addView(searchTab);
            root.addView(homeTab);
            InterfaceControls.bindNavigation(searchTab, NavigationTab.SEARCH);
            InterfaceControls.bindNavigation(homeTab, NavigationTab.HOME);
            holder.layout(10, 20, 410, 120);
            field.layout(30, 40, 230, 80);
        }

        /** Presses [tab] while the bottom bar's navigation reports [screen]. */
        public int press(View tab, Object screen) {
            InterfaceControls.searchLocationForTests = screen;
            try {
                return InterfaceControls.searchTabPress(bar, tab);
            } finally {
                InterfaceControls.searchLocationForTests = null;
            }
        }
    }

    /** Whether a picked Hush row folds out of a pin's menu as the menu measures. */
    public static boolean foldsPinMenuRow() {
        Context context = RuntimeEnvironment.getApplication();
        String before = PinMenuRows.PICKED.get();
        PinMenuRows.PICKED.save("download_pin");
        try {
            LinearLayout menu = new LinearLayout(context);
            LinearLayout row = new LinearLayout(context);
            row.setContentDescription(app.hushpinterest.extension.shared.L10n.t("Download pin"));
            menu.addView(row);
            InterfaceControls.pinMenuRows(menu);
            return row.getVisibility() == View.GONE;
        } finally {
            PinMenuRows.PICKED.save(before);
        }
    }

    private static FrameLayout boardTab(View... children) {
        Context context = RuntimeEnvironment.getApplication();
        FrameLayout tab = new FrameLayout(context);
        FrameLayout header = new FrameLayout(context);
        for (View child : children) header.addView(child);
        tab.addView(header);
        return tab;
    }

    /** Whether a board tab's header loses its See board button. */
    public static boolean foldsBoardTabButton() {
        android.widget.Button button = new android.widget.Button(RuntimeEnvironment.getApplication());
        BoardTabs.bind(boardTab(button), null);
        return button.getVisibility() == View.GONE;
    }

    /** Whether a board tab's header loses the text smaller than the board's name. */
    public static boolean foldsBoardTabSubtitle() {
        Context context = RuntimeEnvironment.getApplication();
        android.widget.TextView name = new android.widget.TextView(context);
        name.setText("Calm");
        name.setTextSize(30);
        android.widget.TextView subtitle = new android.widget.TextView(context);
        subtitle.setText("More ideas for");
        subtitle.setTextSize(12);
        BoardTabs.bind(boardTab(name, subtitle), null);
        return subtitle.getVisibility() == View.GONE;
    }

    /** Whether a board tab's header gives way to the black cover stored for its board. */
    public static boolean coversBoardTab() {
        android.widget.ImageView image = new android.widget.ImageView(RuntimeEnvironment.getApplication());
        FrameLayout tab = boardTab(image);
        BoardTabs.remember(tab, "probe");
        BoardTabCovers.store("probe", BoardTabCovers.BLACK, null);
        try {
            return BoardTabCovers.coverUrl(image, "stock") == null;
        } finally {
            BoardTabCovers.COVERS.resetToDefault();
        }
    }

    /** Names the class the save toast hook treats as Pinterest's downloaded toast. */
    public static void downloadToast(Class<?> type) {
        UiHooks.downloadToastForTests = type;
    }

    /** Like, comment, share and more, in the order the row under a pin's picture shows them. */
    public static final int LIKE = 0, COMMENTS = 1, SHARE = 2, MORE = 3;

    /**
     * A sound file picked for Custom save sound, and Pinterest making the player for its save
     * chime: true when the picked file got the player.
     */
    public static boolean playsPickedSaveSound() {
        Context context = RuntimeEnvironment.getApplication();
        Uri sound = Uri.parse("content://com.android.providers.media.documents/document/audio%3A7");
        ShadowMediaPlayer.addMediaInfo(DataSource.toDataSource(context, sound), new ShadowMediaPlayer.MediaInfo(500, 0));
        String before = SaveSound.PICKED.get();
        SaveSound.PICKED.save(sound.toString());
        try {
            MediaPlayer player = UiHooks.pickedSaveSound(context);
            if (player == null) return false;
            player.release();
            return true;
        } finally {
            SaveSound.PICKED.save(before);
        }
    }

    /** Custom splash logo's answer for the next start: true when Android would be handed the picked logo. */
    public static boolean nextStartShowsPickedLogo() {
        return SplashLogo.wanted(RuntimeEnvironment.getApplication());
    }

    /** The kinds of pin page section the pause probes stand in for. */
    public enum ProbeSection { PIN_CLOSEUP_SOURCE_DESCRIPTION, PIN_CLOSEUP_LINK }

    /** A pin page section telling what it is the way Pinterest's modules do. */
    public static class ProbeModule extends LinearLayout {
        private final ProbeSection section;

        ProbeModule(Context context, ProbeSection section) {
            super(context);
            this.section = section;
        }

        public ProbeSection getComponentType() {
            return section;
        }
    }

    /** Named like the row that shows who made a pin. */
    public static final class PinCloseupCreatorAttributionView {}

    public static final class CreatorModule extends ProbeModule {
        @SuppressWarnings("unused") PinCloseupCreatorAttributionView row;

        CreatorModule(Context context) {
            super(context, ProbeSection.PIN_CLOSEUP_LINK);
        }
    }

    /** True when a pin's description section is told not to show. */
    public static boolean hidesPinDescription() {
        Context context = RuntimeEnvironment.getApplication();
        return PinPageSections.description(new ProbeModule(context, ProbeSection.PIN_CLOSEUP_SOURCE_DESCRIPTION), 1) == 0;
    }

    /** True when the section holding a pin's creator row is told not to show. */
    public static boolean hidesPinAuthor() {
        return PinPageSections.author(new CreatorModule(RuntimeEnvironment.getApplication()), 1) == 0;
    }

    /** True when a video view's ask to hold the screen on went through as off. */
    public static boolean letsScreenSleep() {
        View video = new View(RuntimeEnvironment.getApplication());
        UiHooks.keepScreenOn(video, true);
        return !video.getKeepScreenOn();
    }

    /** True when Fold related pins counts as on, whatever the arrow was last left at. */
    public static boolean foldSwitchedOn() {
        return RelatedPinsFold.switchedOn();
    }

    public static void saveToast(Class<?> type) {
        UiHooks.saveToastForTests = type;
    }

    /**
     * An English "Saved!" from a screen that saves pins, made through the stand-in for
     * Toast.makeText and shown the way Pinterest shows it: true when it never showed.
     */
    public static boolean quietsSavedToast() {
        int shown = ShadowToast.shownToastCount();
        UiHooks.androidToast(SaveStrings.context(Locale.ENGLISH, SaveStrings.english()), "Saved!", Toast.LENGTH_SHORT).show();
        return ShadowToast.shownToastCount() == shown;
    }

    /**
     * The row under a pin's picture handed over with each button wearing its id: true when the
     * button at [which] was hidden, or with [held], when Pinterest showing it again was kept GONE.
     */
    public static boolean hidesActionButton(int which, boolean held) {
        Context context = RuntimeEnvironment.getApplication();
        FrameLayout bar = new FrameLayout(context);
        LinearLayout row = new LinearLayout(context);
        bar.addView(row);
        View[] buttons = new View[4];
        for (int i = 0; i < buttons.length; i++) {
            buttons[i] = new View(context);
            buttons[i].setId(View.generateViewId());
            row.addView(buttons[i]);
        }
        CloseupButtons.likeId = buttons[LIKE].getId();
        CloseupButtons.commentsId = buttons[COMMENTS].getId();
        CloseupButtons.shareId = buttons[SHARE].getId();
        CloseupButtons.moreId = buttons[MORE].getId();
        try {
            CloseupButtons.actionBar(bar);
            return hidden(buttons[which], held);
        } finally {
            CloseupButtons.likeId = CloseupButtons.commentsId = CloseupButtons.shareId = CloseupButtons.moreId = -1;
        }
    }

    /** A row holding the Visit site button, handed over: true when it was hidden, or with [held], kept GONE. */
    public static boolean hidesVisitSite(boolean held) {
        Context context = RuntimeEnvironment.getApplication();
        FrameLayout bar = new FrameLayout(context);
        View visit = new View(context);
        visit.setId(View.generateViewId());
        bar.addView(visit);
        CloseupButtons.visitSiteId = visit.getId();
        try {
            CloseupButtons.visitSite(bar);
            return hidden(bar, held);
        } finally {
            CloseupButtons.visitSiteId = -1;
        }
    }

    /** A Save button wearing its id, handed over after Pinterest styles it: true when it was made smaller. */
    public static boolean shrinksSaveButton() {
        View save = new View(RuntimeEnvironment.getApplication());
        save.setId(View.generateViewId());
        CloseupButtons.saveId = save.getId();
        try {
            CloseupButtons.saveButton(save);
            return save.getScaleX() != 1f;
        } finally {
            CloseupButtons.saveId = -1;
        }
    }

    /**
     * A button for a probe that hands it to a styling hook and then lets it go. A stock Button
     * starts its press animator on the hook's refreshDrawableState, and once the button is collected
     * that animator cancels and re-arms on every frame, so the main looper never goes idle.
     */
    private static Button probeButton(Context context) {
        Button button = new Button(context);
        button.setStateListAnimator(null);
        return button;
    }

    /** A red Gestalt button other than Save, with a color saved for Save: true when it took that color. */
    public static boolean paintsRedButton() {
        Button button = probeButton(RuntimeEnvironment.getApplication());
        button.setBackgroundTintList(ColorStateList.valueOf(0xFFE60023));
        app.hushpinterest.extension.pinterest.settings.SaveButtonColorSetting.SAVE_BUTTON_COLOR.save("#3366FF");
        CloseupButtons.saveId = 0;
        try {
            CloseupButtons.saveButton(button);
            return button.getBackgroundTintList().getDefaultColor() != 0xFFE60023;
        } finally {
            CloseupButtons.saveId = -1;
            app.hushpinterest.extension.pinterest.settings.SaveButtonColorSetting.SAVE_BUTTON_COLOR.resetToDefault();
        }
    }

    /** A dark-mode Gestalt button in Pinterest's night gray: true when its fill went black. */
    public static boolean tintsButtonBlack() {
        Context context = RuntimeEnvironment.getApplication();
        Configuration night = new Configuration(context.getResources().getConfiguration());
        night.uiMode = Configuration.UI_MODE_NIGHT_YES | (night.uiMode & ~Configuration.UI_MODE_NIGHT_MASK);
        Button button = probeButton(context.createConfigurationContext(night));
        button.setBackgroundTintList(ColorStateList.valueOf(0x4D72727E));
        AmoledBlack.gestaltButton(button);
        return button.getBackgroundTintList().getDefaultColor() == 0xFF000000;
    }

    private static boolean hidden(View view, boolean held) {
        return held ? CloseupButtons.visibility(view, View.VISIBLE) != View.VISIBLE : view.getVisibility() == View.GONE;
    }
}
