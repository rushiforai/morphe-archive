package io.github.sabopura.morphe.extension.twitch.ui;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.view.View;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Toast;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.app.ClassicHome;
import io.github.sabopura.morphe.extension.twitch.app.NewHomeFeed;
import io.github.sabopura.morphe.extension.twitch.app.Recaps;
import io.github.sabopura.morphe.extension.twitch.chat.ChatHistory;
import io.github.sabopura.morphe.extension.twitch.chat.FeedFilters;
import io.github.sabopura.morphe.extension.twitch.chat.UserSearch;
import io.github.sabopura.morphe.extension.twitch.chat.ViewCustomization;
import io.github.sabopura.morphe.extension.twitch.danmaku.DanmakuSettings;
import io.github.sabopura.morphe.extension.twitch.danmaku.TwitchDanmaku;
import io.github.sabopura.morphe.extension.twitch.ads.AdBlock;
import io.github.sabopura.morphe.extension.twitch.player.LayoutTools;
import io.github.sabopura.morphe.extension.twitch.player.LiveProxy;
import io.github.sabopura.morphe.extension.twitch.player.PlayerClose;
import io.github.sabopura.morphe.extension.twitch.player.PlayerTools;
import io.github.sabopura.morphe.extension.twitch.player.VodEnd;

import java.util.ArrayList;
import java.util.Collections;
import java.util.EnumMap;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.function.IntFunction;

import static io.github.sabopura.morphe.extension.twitch.ui.Text.label;

/** Every setting, grouped by category. The screen, search and reset all read this list. */
final class Catalog {
    static final String DANMAKU = "danmaku";
    static final String CHAT = "chat";
    static final String ABOUT = "about";
    private static final String PROJECT_URL = "https://github.com/sabopura/sabopura-morphe-patches";

    enum Store { CHAT, DANMAKU, ADS }

    static final class Category {
        final String id;
        final String title;
        final String summary;
        final List<Group> groups = new ArrayList<>();
        Section section;

        Category(String id, String title, String summary) {
            this.id = id;
            this.title = title;
            this.summary = summary;
        }

        Group group(String title) {
            Group group = new Group(this, title);
            groups.add(group);
            return group;
        }

        /** Where a search result came from: the section, and the tab when the section has several. */
        String path() {
            return section == null || section.tabs.size() == 1 ? title : section.title + " › " + title;
        }
    }

    /** A top-level entry; its categories become pill tabs when there is more than one. */
    static final class Section {
        final String id;
        final String title;
        final Icons.Kind icon;
        final int tint;
        final List<Category> tabs = new ArrayList<>();
        /** The switch that turns the whole section on or off, when it has one. */
        SwitchItem master;

        Section(String id, String title, Icons.Kind icon, int tint) {
            this.id = id;
            this.title = title;
            this.icon = icon;
            this.tint = tint;
        }

        /** Built from what is really inside, so it cannot disagree with the applied patches. */
        String summary() {
            StringBuilder out = new StringBuilder();
            for (Category tab : tabs) {
                if (out.length() > 0) out.append(Text.label("・", " · "));
                out.append(tabs.size() == 1 ? tab.summary : tab.title);
            }
            return out.toString();
        }
    }

    static final class Group {
        final Category category;
        final String title;
        final List<Item> items = new ArrayList<>();
        Feature[] needs = {};
        String note;

        Group(Category category, String title) {
            this.category = category;
            this.title = title;
        }

        Group note(String value) {
            note = value;
            return this;
        }

        Group needs(Feature... features) {
            needs = features;
            return this;
        }

        Group add(Item item) {
            item.group = this;
            items.add(item);
            return this;
        }
    }

    /** What an item needs while it is on screen. */
    interface Env {
        Context context();

        Ui ui();

        SharedPreferences prefs(Store store);

        /** Saves are already applied; this reloads caches and notifies the features. */
        void changed(Store store);

        /** Runs after every change so dependent rows can enable or disable themselves. */
        void onRefresh(Runnable refresher);

        /** Rebuilds the visible page, for example after a reset. */
        void rebuild();

        /** A slider is being dragged through this value. */
        void preview(Store store, String key, int value);

        /** Records a change that can still be undone, for {@code key}'s inline pill to offer. */
        ConfirmPill.Pending beginUndo(String key, Runnable undo);

        ConfirmPill.Pending pending(String key);

        void clearPending();
    }

    abstract static class Item {
        final String title;
        String summary;
        Store store = Store.CHAT;
        String key;
        String dependsOn;
        Feature[] needs = {};
        Group group;

        Item(String title) {
            this.title = title;
        }

        Item summary(String value) {
            summary = value;
            return this;
        }

        Item store(Store value) {
            store = value;
            return this;
        }

        /** {@code switchKey} is a switch in this item's own store. */
        Item dependsOn(String switchKey) {
            dependsOn = switchKey;
            return this;
        }

        /** The key with its store: the same key name can exist in several stores. */
        String id() {
            return store + ":" + key;
        }

        String parentId() {
            return store + ":" + dependsOn;
        }

        /** Whether this is a switch that is on; null for anything that is not a switch. */
        Boolean on(SharedPreferences prefs) {
            return null;
        }

        Item needs(Feature... features) {
            needs = features;
            return this;
        }

        boolean matches(List<String> tokens) {
            return SearchText.matches(title + " " + (summary == null ? "" : summary) + " "
                    + group.title + " " + group.category.path(), tokens);
        }

        /** Whether the stored value differs from the default; items that store nothing never do. */
        boolean changed(SharedPreferences prefs) {
            return false;
        }

        abstract View build(Env env);

        /** Removes this item's stored value; returns false for items that store nothing. */
        boolean reset(SharedPreferences.Editor editor) {
            if (key == null) return false;
            editor.remove(key);
            return true;
        }
    }

    static final class SwitchItem extends Item {
        final boolean fallback;
        private Consumer<Env> after;

        SwitchItem(String key, String title, boolean fallback) {
            super(title);
            this.key = key;
            this.fallback = fallback;
        }

        @Override
        View build(Env env) {
            SharedPreferences prefs = env.prefs(store);
            return env.ui().switchRow(env.context(), title, summary,
                    prefs.getBoolean(key, fallback), checked -> {
                        prefs.edit().putBoolean(key, checked).apply();
                        env.changed(store);
                        if (after != null) after.accept(env);
                    });
        }

        /** Runs after the viewer flips the switch and the value is saved. */
        SwitchItem then(Consumer<Env> after) {
            this.after = after;
            return this;
        }

        @Override
        boolean changed(SharedPreferences prefs) {
            return prefs.getBoolean(key, fallback) != fallback;
        }

        @Override
        Boolean on(SharedPreferences prefs) {
            return prefs.getBoolean(key, fallback);
        }
    }

    static final class SliderItem extends Item {
        final int min;
        final int max;
        final int fallback;
        final IntFunction<String> format;

        SliderItem(String key, String title, int min, int max, int fallback, IntFunction<String> format) {
            super(title);
            this.key = key;
            this.min = min;
            this.max = max;
            this.fallback = fallback;
            this.format = format;
        }

        @Override
        View build(Env env) {
            SharedPreferences prefs = env.prefs(store);
            int value = Math.max(min, Math.min(max, prefs.getInt(key, fallback)));
            return env.ui().sliderRow(env.context(), title, summary, min, max, value, fallback, format,
                    dragged -> env.preview(store, key, dragged),
                    committed -> {
                        prefs.edit().putInt(key, committed).apply();
                        env.changed(store);
                    });
        }

        @Override
        boolean changed(SharedPreferences prefs) {
            return Math.max(min, Math.min(max, prefs.getInt(key, fallback))) != fallback;
        }
    }

    /** One of several values, picked from a list. */
    abstract static class Choice<T> extends Item {
        final String[] labels;
        final T fallback;
        private final T[] values;

        Choice(String key, String title, String[] labels, T[] values, T fallback) {
            super(title);
            this.key = key;
            this.labels = labels;
            this.values = values;
            this.fallback = fallback;
        }

        abstract T read(SharedPreferences prefs);

        abstract void write(SharedPreferences prefs, T value);

        int index(SharedPreferences prefs) {
            T value = read(prefs);
            for (int i = 0; i < values.length; i++) if (values[i].equals(value)) return i;
            return -1;
        }

        void picked(Env env, SharedPreferences prefs, int picked) {
            write(prefs, values[picked]);
            env.changed(store);
            env.rebuild();
        }

        @Override
        View build(Env env) {
            SharedPreferences prefs = env.prefs(store);
            int index = index(prefs);
            return env.ui().choiceRow(env.context(), title, summary, index >= 0 ? labels[index] : null,
                    () -> env.ui().choose(env.context(), title, labels, index(prefs),
                            picked -> picked(env, prefs, picked)));
        }

        @Override
        boolean changed(SharedPreferences prefs) {
            return !fallback.equals(read(prefs));
        }
    }

    /** Choice stored as a string. */
    static final class ChoiceItem extends Choice<String> {
        /** Value whose choice offers an inline undo; a hidden navigation bar is hard to come back from. */
        private String undoable;
        private String undoLabel;

        ChoiceItem(String key, String title, String[] labels, String[] values, String fallback) {
            super(key, title, labels, values, fallback);
        }

        ChoiceItem undoable(String value, String label) {
            undoable = value;
            undoLabel = label;
            return this;
        }

        String undoLabel() {
            return undoLabel;
        }

        @Override
        String read(SharedPreferences prefs) {
            return prefs.getString(key, fallback);
        }

        @Override
        void write(SharedPreferences prefs, String value) {
            prefs.edit().putString(key, value).apply();
        }

        @Override
        void picked(Env env, SharedPreferences prefs, int picked) {
            String before = read(prefs);
            super.picked(env, prefs, picked);
            if (undoable != null && undoable.equals(read(prefs))) {
                env.beginUndo(key, () -> {
                    write(prefs, before);
                    env.changed(store);
                    env.rebuild();
                });
                env.rebuild();
            }
        }
    }

    /** Choice stored as an int; shown as colour circles. */
    static final class IntChoiceItem extends Choice<Integer> {
        private final int[] colors;

        IntChoiceItem(String key, String title, String[] labels, int[] values, int fallback) {
            super(key, title, labels, box(values), fallback);
            colors = values;
        }

        private static Integer[] box(int[] values) {
            Integer[] boxed = new Integer[values.length];
            for (int i = 0; i < values.length; i++) boxed[i] = values[i];
            return boxed;
        }

        @Override
        Integer read(SharedPreferences prefs) {
            return prefs.getInt(key, fallback);
        }

        @Override
        void write(SharedPreferences prefs, Integer value) {
            prefs.edit().putInt(key, value).apply();
        }

        @Override
        View build(Env env) {
            SharedPreferences prefs = env.prefs(store);
            return env.ui().swatchRow(env.context(), title, summary, labels, colors, index(prefs),
                    picked -> picked(env, prefs, picked));
        }
    }

    /** One rule per line. */
    static final class LinesItem extends Item {
        final String help;
        private boolean commas;
        private Function<String, List<String>> refused;

        LinesItem(String key, String title, String help) {
            super(title);
            this.key = key;
            this.help = help;
        }

        /** Rules may also be separated by commas, as the danmaku filter allows. */
        LinesItem commas() {
            commas = true;
            return this;
        }

        /** Names the rules in the saved text that are not applied, so the row can say so. */
        LinesItem refuses(Function<String, List<String>> refused) {
            this.refused = refused;
            return this;
        }

        @Override
        boolean changed(SharedPreferences prefs) {
            return !prefs.getString(key, "").trim().isEmpty();
        }

        @Override
        View build(Env env) {
            SharedPreferences prefs = env.prefs(store);
            String value = prefs.getString(key, "");
            int count = 0;
            for (String line : value.split(commas ? "[\\n,]" : "\\n")) if (!line.trim().isEmpty()) count++;
            String shown = count == 0 ? label("なし", "None") : label(count + " 件", count + "");
            List<String> unused = refused == null ? Collections.emptyList() : refused.apply(value);
            String note = summary;
            if (!unused.isEmpty()) {
                int more = unused.size() - 1;
                note = label("使えない式を無視しています: ", "Ignored, cannot be used: ") + unused.get(0)
                        + (more > 0 ? label(" ほか " + more + " 件", " and " + more + " more") : "");
            }
            return env.ui().linkRow(env.context(), title, note, shown,
                    () -> env.ui().editLines(env.context(), title, help,
                            prefs.getString(key, ""), text -> {
                                prefs.edit().putString(key, text).apply();
                                env.changed(store);
                                env.rebuild();
                            }));
        }
    }

    /** Which patch bundle patched which Twitch: the first thing a bug report or an update check needs. */
    static final class VersionItem extends Item {
        VersionItem() {
            super(label("バージョン", "Version"));
        }

        @Override
        View build(Env env) {
            String bundle = Features.patchVersion();
            return env.ui().infoRow(env.context(), title, (bundle.isEmpty() ? "" : label("パッチ ", "Patches ") + bundle + " · ")
                    + "Twitch " + Diagnostics.twitchVersion(env.context()));
        }
    }

    interface Action {
        void run(Env env);
    }

    static final class ActionItem extends Item {
        final Action action;

        ActionItem(String title, Action action) {
            super(title);
            this.action = action;
        }

        @Override
        View build(Env env) {
            return env.ui().linkRow(env.context(), title, summary, null, () -> action.run(env));
        }
    }

    // ---- the catalog ----

    static List<Category> build() {
        List<Category> categories = new ArrayList<>();
        categories.add(ads());
        categories.add(chat());
        categories.add(emotes());
        categories.add(filters());
        categories.add(new Category("voice", label("読み上げと定型文", "Voice and phrases"), ""));
        categories.add(history());
        categories.add(danmaku());
        categories.add(playback());
        categories.add(controls());
        categories.add(layout());
        categories.add(home());
        categories.add(hide());
        categories.add(new Category("account", label("アカウントとプライバシー", "Account and privacy"),
                label("自動受け取り・解析・共有リンク", "Automatic claims · Analytics · Share links")));
        AppExtras.addTo(categories);
        ChatExtras.addTo(categories);
        OriginalExtras.addTo(categories);
        if (PlayerMenu.sectionCount() > 1)
            find(categories, "controls").group(label("プレイヤーメニュー", "Player menu"))
                    .note(label("次にメニューを開くと反映します。", "Applies the next time the menu opens."))
                    .add(new MenuLayoutItem());
        keepApplied(categories);
        categories.add(about(categories));
        return categories;
    }

    /** The top-level entries, each named for where a viewer would look. */
    static List<Section> sections(List<Category> categories) {
        Map<String, Section> sections = new LinkedHashMap<>();
        for (Section section : new Section[]{
                new Section("safety", label("安全のための一時停止", "Paused for safety"), Icons.Kind.WARNING, 0xFFE8940C),
                new Section("ads", label("広告", "Ads"), Icons.Kind.SHIELD, 0xFFE5486B),
                new Section("chat", label("チャット", "Chat"), Icons.Kind.CHAT, 0xFF9146FF),
                new Section(DANMAKU, label("弾幕", "Danmaku"), Icons.Kind.DANMAKU, 0xFF0FA89C),
                new Section("player", label("プレイヤー", "Player"), Icons.Kind.PLAY, 0xFFF0752B),
                new Section("home", label("ホームと表示", "Home and display"), Icons.Kind.HOME, 0xFF2A9D5C),
                new Section("account", label("アカウントとプライバシー", "Account and privacy"), Icons.Kind.LOCK, 0xFF4775E8),
                new Section(ABOUT, label("このパッチについて", "About"), Icons.Kind.INFO, 0xFF777783)})
            sections.put(section.id, section);
        for (Category category : categories) {
            category.section = sections.get(sectionOf(category.id));
            category.section.tabs.add(category);
        }
        sections.get("ads").master = master(sections.get("ads"), Store.ADS, AdBlock.KEY_ENABLED);
        sections.get("chat").master = master(sections.get("chat"), Store.CHAT, "enabled");
        sections.get(DANMAKU).master = master(sections.get(DANMAKU), Store.DANMAKU, DanmakuSettings.KEY_ENABLED);
        List<Section> result = new ArrayList<>();
        for (Section section : sections.values()) if (!section.tabs.isEmpty()) result.add(section);
        return result;
    }

    /** The section's own on/off switch, or null when its patch was not applied. */
    private static SwitchItem master(Section section, Store store, String key) {
        for (Category category : section.tabs)
            for (Group group : category.groups)
                for (Item item : group.items)
                    if (item instanceof SwitchItem && item.store == store && key.equals(item.key)) return (SwitchItem) item;
        return null;
    }

    private static String sectionOf(String categoryId) {
        switch (categoryId) {
            case "safety":
            case "ads":
            case DANMAKU:
            case "account":
                return categoryId;
            case "chat":
            case "emotes":
            case "filters":
            case "voice":
            case "history":
                return "chat";
            case "playback":
            case "controls":
            case "layout":
                return "player";
            case "home":
            case "hide":
                return "home";
            default:
                return ABOUT;
        }
    }

    static int changedCount(Env env, Category category) {
        int count = 0;
        for (Group group : category.groups)
            for (Item item : group.items)
                if (item.changed(env.prefs(item.store))) count++;
        return count;
    }

    /** The category with this id; every id above always exists until {@link #keepApplied} runs. */
    static Category find(List<Category> categories, String id) {
        for (Category category : categories) if (category.id.equals(id)) return category;
        throw new IllegalArgumentException(id);
    }

    /** Drops every option of a patch that was not selected, then whatever that leaves empty. */
    private static void keepApplied(List<Category> categories) {
        List<String> keys = new ArrayList<>();
        for (Category category : categories) {
            category.groups.removeIf(group -> group.needs.length > 0 && !Features.any(group.needs));
            for (Group group : category.groups) {
                group.items.removeIf(item -> item.needs.length > 0 && !Features.any(item.needs));
                for (Item item : group.items) if (item.key != null) keys.add(item.id());
            }
        }
        // An option whose parent switch went with another patch stays usable.
        for (Category category : categories)
            for (Group group : category.groups)
                for (Item item : group.items)
                    if (item.dependsOn != null && !keys.contains(item.parentId())) item.dependsOn = null;
        for (Category category : categories) category.groups.removeIf(group -> group.items.isEmpty());
        categories.removeIf(category -> category.groups.isEmpty());
    }

    private static IntFunction<String> suffix(String unit) {
        return value -> value + unit;
    }

    /** The proxy lives in the ad blocking settings when stitched-ad replacement is applied. */
    private static void addProxy(Category c, boolean inAds) {
        c.group(label("配信プロキシ", "Stream proxy")).needs(inAds ? Feature.ADS_REPLACE : Feature.STREAM_PROXY)
                .note(proxyNote(inAds))
                .add(new ProxyItem());
    }

    private static String proxyNote(boolean inAds) {
        if (inAds && !Features.has(Feature.STREAM_PROXY))
            return label("広告のない再生リストを Twitch から取得できなかったときの予備に使います。プロキシには視聴チャンネルと IP アドレスが伝わります。",
                    "The backup when no ad-free playlist is available from Twitch. The proxy sees the channel and your IP address.");
        if (inAds)
            return label("ライブ配信の再生リストを取得する先を変えます。広告のない再生リストを Twitch から取得できなかったときの予備にも使います。プロキシには視聴チャンネルと IP アドレスが伝わります。再読み込み後に反映します。",
                    "Changes where live playlists are fetched, and is the backup when no ad-free playlist is available from Twitch. The proxy sees the channel and your IP address. Applies after reloading.");
        return label("ライブ配信の再生リストを取得する先を変えます。広告が必ず消えるとは限りません。プロキシには視聴チャンネルと IP アドレスが伝わります。再読み込み後に反映します。",
                "Changes where live playlists are fetched. Ads are not always removed. The proxy sees the channel and your IP address. Applies after reloading.");
    }

    private static Category ads() {
        Category c = new Category("ads", label("広告ブロック", "Ad blocking"),
                label("動画・配信・表示の広告", "Video ads · Stream ads · Display ads"));
        Feature[] any = {Feature.ADS_CLIENT, Feature.ADS_SERVER, Feature.ADS_REPLACE, Feature.ADS_COVER, Feature.ADS_PBYP};
        c.group(label("広告ブロック", "Ad blocking")).needs(any)
                .note(label("広告が配信に入ったときだけ、Twitch から広告のない再生リストを取り直して差し替えます。下の配信プロキシを設定しない限り、外部のサーバーは使いません。",
                        "When an ad is stitched into a stream, the same stream is fetched again from Twitch without it. No third-party server is used unless you set the stream proxy below."))
                .add(new SwitchItem(AdBlock.KEY_ENABLED, label("広告をブロック", "Block ads"), true).store(Store.ADS)
                        .summary(label("再生前・途中・VOD の広告、配信に入る広告、バナーなどの表示広告を止めます。新しく開いた画面から反映します",
                                "Blocks pre-rolls, mid-rolls, VOD ads, stream ads and banners. Applies to screens opened after this.")))
                .add(new ChoiceItem(AdBlock.KEY_FALLBACK, label("差し替えられなかった広告", "Ads that cannot be replaced"),
                        new String[]{label("黒い画面で隠して消音", "Cover and mute"), label("そのまま表示", "Show them")},
                        new String[]{AdBlock.FALLBACK_COVER, AdBlock.FALLBACK_SHOW}, AdBlock.FALLBACK_COVER)
                        .store(Store.ADS).dependsOn(AdBlock.KEY_ENABLED)
                        .summary(label("サブスク限定の配信などで、広告のない再生リストを取得できなかったとき",
                                "For example on subscriber-only streams, when no ad-free playlist is available"))
                        .needs(Feature.ADS_COVER));
        if (Features.has(Feature.ADS_REPLACE)) addProxy(c, true);
        c.group(label("この起動中の記録", "Since the app started")).needs(any).add(new AdCountsItem());
        return c;
    }

    /** This run's ad counts, named and laid out like the totals on the About page. */
    static final class AdCountsItem extends Item {
        AdCountsItem() {
            super(label("止めた広告の要求・差し替えた広告・隠した広告", "Ad requests stopped · Ads replaced · Ads covered"));
        }

        @Override
        View build(Env env) {
            Context context = env.context();
            Ui ui = env.ui();
            LinearLayout column = new LinearLayout(context);
            column.setOrientation(LinearLayout.VERTICAL);
            OriginalExtras.countRow(column, ui, context, label("止めた広告の要求", "Ad requests stopped"),
                    AdBlock.count(AdBlock.REQUESTS, true));
            OriginalExtras.countRow(column, ui, context, label("差し替えた広告", "Ads replaced"),
                    AdBlock.count(AdBlock.REPLACED, true));
            OriginalExtras.countRow(column, ui, context, label("隠した広告", "Ads covered"),
                    AdBlock.count(AdBlock.COVERED, true));
            String issue = AdBlock.lastIssue();
            if (!issue.isEmpty())
                column.addView(ui.infoRow(context, label("最後に差し替えられなかった理由", "Last reason an ad was not replaced"),
                        issue), Ui.matchWidth());
            return column;
        }
    }

    private static Category danmaku() {
        Category c = new Category(DANMAKU, label("弾幕", "Danmaku"),
                label("表示・大きさ・速さ・NGワード", "Display · Size · Speed · Blocked words"));
        String sec = label(" 秒", " s");
        c.group(label("表示", "Display")).needs(Feature.DANMAKU)
                .add(new SwitchItem(DanmakuSettings.KEY_ENABLED, label("弾幕を表示", "Show danmaku"), true)
                        .summary(label("プレイヤーのボタンを長押ししても切り替えられます",
                                "You can also long-press the player button"))
                        .store(Store.DANMAKU))
                .add(new SwitchItem(DanmakuSettings.KEY_VOD, label("VOD でも流す", "Also on VODs"), true)
                        .summary(label("チャットのリプレイを動画の再生位置に合わせて流します",
                                "Flows the chat replay in step with the video"))
                        .needs(Feature.VOD_DANMAKU).store(Store.DANMAKU))
                .add(new SwitchItem(DanmakuSettings.KEY_MATCH_DELAY, label("配信の遅れに合わせる", "Match the stream delay"), true)
                        .summary(label("ライブの映像が大きく遅れているとき、遅れのうち約 3 秒を超える分だけコメントを待たせます。まだ見ていない場面への反応が先に流れません",
                                "When live video runs far behind, comments wait for the part of the delay beyond about 3 s, so reactions do not flow ahead of the moment."))
                        .store(Store.DANMAKU))
                .add(new SwitchItem(DanmakuSettings.KEY_SHOW_EMOTES,
                        label("エモートを画像で表示", "Show emote images"), true).store(Store.DANMAKU))
                .add(new SwitchItem(DanmakuSettings.KEY_CHAT_COLORS,
                        label("チャットの名前の色を使う", "Use chat name colours"), false).store(Store.DANMAKU))
                .add(new SwitchItem(DanmakuSettings.KEY_SHOW_NAMES,
                        label("ユーザー名を表示", "Show user names"), false).store(Store.DANMAKU))
                .add(new SwitchItem(DanmakuSettings.KEY_BOLD, label("太字", "Bold text"), true)
                        .store(Store.DANMAKU));
        c.group(label("大きさと動き", "Size and motion")).needs(Feature.DANMAKU)
                .add(new SliderItem(DanmakuSettings.KEY_FONT_SIZE, label("文字サイズ", "Text size"),
                        DanmakuSettings.MIN_FONT_SIZE, DanmakuSettings.MAX_FONT_SIZE,
                        TwitchDanmaku.configFontSizeSp(), String::valueOf)
                        .summary(label("全画面のときの大きさ。小さいプレイヤーでは縮小します",
                                "Size at full screen; smaller players scale it down"))
                        .store(Store.DANMAKU))
                .add(new SliderItem(DanmakuSettings.KEY_OPACITY, label("不透明度", "Opacity"),
                        DanmakuSettings.MIN_OPACITY, 100, TwitchDanmaku.configOpacityPercent(),
                        suffix(" %")).store(Store.DANMAKU))
                .add(new SliderItem(DanmakuSettings.KEY_DURATION, label("画面を横切る時間", "Time to cross the screen"),
                        DanmakuSettings.MIN_DURATION, DanmakuSettings.MAX_DURATION,
                        TwitchDanmaku.configDurationSeconds(), suffix(sec))
                        .summary(label("短いほど速く流れます", "Shorter is faster"))
                        .store(Store.DANMAKU))
                .add(new SliderItem(DanmakuSettings.KEY_COVERAGE, label("表示する範囲（上から）", "Area used (from the top)"),
                        DanmakuSettings.MIN_COVERAGE, 100, TwitchDanmaku.configCoveragePercent(),
                        suffix(" %")).store(Store.DANMAKU))
                .add(new SliderItem(DanmakuSettings.KEY_MAX_ON_SCREEN, label("同時に表示する最大数", "Maximum on screen"),
                        DanmakuSettings.MIN_ON_SCREEN, DanmakuSettings.MAX_ON_SCREEN, 80,
                        String::valueOf).store(Store.DANMAKU));
        c.group(label("除外", "Exclude")).needs(Feature.DANMAKU)
                .add(new SliderItem(DanmakuSettings.KEY_MAX_LENGTH, label("長いコメントを除外", "Skip long messages"),
                        DanmakuSettings.MIN_MAX_LENGTH, DanmakuSettings.MAX_MAX_LENGTH,
                        TwitchDanmaku.configMaxLength(), suffix(label(" 文字", " chars")))
                        .summary(label("この文字数より長いコメントは流しません",
                                "Messages longer than this are not shown"))
                        .store(Store.DANMAKU))
                .add(new LinesItem(DanmakuSettings.KEY_NG_WORDS, label("弾幕のNGワード", "Danmaku blocked words"),
                        label("1行に1件、またはカンマで区切ります。/正規表現/ も使えます。弾幕だけに適用します。",
                                "One per line, or separate with commas. /regex/ is allowed. Applies to danmaku only."))
                        .commas().refuses(DanmakuSettings::refusedRules).store(Store.DANMAKU));
        return c;
    }

    private static Category chat() {
        Category c = new Category(CHAT, label("表示", "Appearance"),
                label("文字サイズ・時刻・背景・大きさ", "Text size · Timestamps · Backgrounds · Sizes"));
        c.group(label("全般", "General"))
                .needs(Feature.CHAT_EMOTES, Feature.CHAT_BADGES, Feature.CHAT_FILTERS, Feature.CHAT_APPEARANCE, Feature.CHAT_HISTORY)
                .add(new SwitchItem("enabled", label("チャット拡張を使う", "Use chat enhancements"), true)
                        .summary(label("オフにすると、エモート・フィルター・表示の変更をすべて止めます",
                                "Turning this off stops emotes, filters and display changes")));
        c.group(label("文字と時刻", "Text and time")).needs(Feature.CHAT_APPEARANCE)
                .add(new SliderItem("font_percent", label("文字サイズ", "Text size"), 70, 160, 100,
                        suffix(" %")).dependsOn("enabled"))
                .add(new SwitchItem("timestamps", label("送信時刻を表示", "Show timestamps"), false)
                        .dependsOn("enabled"))
                .add(new SwitchItem("timestamp_seconds", label("時刻に秒を含める", "Include seconds"), false)
                        .dependsOn("timestamps"))
                .add(new SwitchItem("alternating", label("1行ごとに背景を交互に変える", "Alternate row backgrounds"), false)
                        .dependsOn("enabled"))
                .add(new SwitchItem("show_login", label("ログイン名も表示", "Also show login names"), false)
                        .summary(label("表示名とログイン名が違う場合に併記します",
                                "Shown when it differs from the display name"))
                        .dependsOn("enabled"));
        return c;
    }

    private static Category emotes() {
        Category c = new Category("emotes", label("エモートとバッジ", "Emotes and badges"),
                label("7TV・BTTV・FFZ・バッジ・代名詞", "7TV · BTTV · FFZ · Badges · Pronouns"));
        c.group(label("エモート", "Emotes")).needs(Feature.CHAT_EMOTES)
                .add(new SwitchItem("7tv", "7TV", true).dependsOn("enabled"))
                .add(new SwitchItem("bttv", "BetterTTV", true).dependsOn("enabled"))
                .add(new SwitchItem("ffz", "FrankerFaceZ", true).dependsOn("enabled"))
                .add(new SwitchItem("emote_completion", label("「:」でエモートを補完", "Suggest emotes after ':'"), true)
                        .summary(label("入力欄で :名前 と打つと候補を表示します",
                                "Type :name in the message box to see suggestions"))
                        .dependsOn("enabled").needs(Feature.CHAT_PICKER));
        Group badges = c.group(label("バッジ", "Badges")).needs(Feature.CHAT_BADGES)
                .add(new SwitchItem("badges", label("追加バッジを表示", "Show third-party badges"), false)
                        .dependsOn("enabled"));
        String[][] providers = {{"7tv", "7TV"}, {"ffz", "FrankerFaceZ"}, {"chatterino", "Chatterino"},
                {"bttv", "BetterTTV"}, {"dankchat", "DankChat"}, {"chatsen", "Chatsen"}};
        for (String[] p : providers)
            badges.add(new SwitchItem("badge_" + p[0], p[1], true).dependsOn("badges"));
        c.group(label("名前のペイント", "Name paints")).needs(Feature.CHAT_BADGES)
                .add(new SwitchItem("7tv_paints", label("7TV の名前のペイントを表示", "Show 7TV name paints"), false)
                        .summary(label("7TV で名前にグラデーションや画像を付けている人の名前を、チャットでその見た目のまま表示します",
                                "Shows the gradient or image that chatters set for their name on 7TV, in chat"))
                        .dependsOn("enabled"));
        c.group(label("代名詞", "Pronouns")).needs(Feature.CHAT_BADGES)
                .add(new SwitchItem("pronouns", label("代名詞を表示", "Show pronouns"), false)
                        .summary(label("pronouns.alejo.io に登録された代名詞だけを表示します",
                                "Only pronouns set on pronouns.alejo.io"))
                        .dependsOn("enabled"));
        return c;
    }

    private static Category filters() {
        Category c = new Category("filters", label("フィルター", "Filters"),
                label("NGワード・非表示ユーザー・連投・強調", "Blocked words · Hidden users · Repeats · Highlights"));
        String rule = label("1行に1件。英字の大小と全角・半角は区別しません。正規表現は使えません。",
                "One rule per line. Case and character width are ignored. No regex.");
        c.group(label("非表示", "Hide")).needs(Feature.CHAT_FILTERS)
                .add(new LinesItem("words", label("NGワード", "Blocked words"), rule).dependsOn("enabled"))
                .add(new LinesItem("users", label("非表示にするユーザー", "Hidden users"),
                        label("ログイン名または数値 ID を1行に1件。", "One login name or numeric ID per line."))
                        .dependsOn("enabled"))
                .add(new SwitchItem("repeats", label("同じユーザーの連投を隠す", "Hide repeated messages"), false)
                        .summary(label("同じ人が8秒以内に送った同じ文を隠します",
                                "Same text from the same user within 8 seconds"))
                        .dependsOn("enabled"));
        c.group(label("ハイライト", "Highlights")).needs(Feature.CHAT_FILTERS)
                .add(new LinesItem("highlights", label("ハイライトする語句", "Highlighted phrases"), rule)
                        .dependsOn("enabled"))
                .add(new LinesItem("highlight_users", label("ハイライトするユーザー", "Highlighted users"),
                        label("ログイン名または数値 ID を1行に1件。その人の発言すべてに色が付きます。",
                                "One login name or numeric ID per line. Every message from them gets the colour."))
                        .dependsOn("enabled"))
                .add(new IntChoiceItem("highlight_color", label("ハイライトの色", "Highlight colour"),
                        new String[]{label("紫", "Violet"), label("黄", "Yellow"), label("緑", "Green"),
                                label("青", "Blue"), label("赤", "Red")},
                        new int[]{0x649146ff, 0x64efc94c, 0x645cc98b, 0x644c9bef, 0x64ee5c5c},
                        0x649146ff).dependsOn("enabled"))
                .add(new SwitchItem("vibrate_highlight", label("ハイライトで振動", "Vibrate on highlights"), false)
                        .dependsOn("enabled"))
                .add(new SliderItem("vibration_ms", label("振動の長さ", "Vibration length"), 10, 1000, 100,
                        suffix(label(" ミリ秒", " ms"))).dependsOn("vibrate_highlight"));
        return c;
    }

    private static Category history() {
        Category c = new Category("history", label("履歴", "History"),
                label("過去チャット・表示したメッセージの履歴・ユーザー検索", "Recent chat · Viewed message history · Find user"));
        c.group(label("履歴", "History")).needs(Feature.CHAT_HISTORY)
                .add(new ActionItem(label("過去チャットを取得", "Load recent chat"),
                        env -> ChatHistory.show(env.context(), true))
                        .summary(label("robotty.de が収集した公開ログから最大 500 件", "Up to 500 public messages from robotty.de")))
                .add(new ActionItem(label("履歴を検索", "Search history"),
                        env -> ChatHistory.show(env.context(), false))
                        .summary(label("この端末で表示したメッセージから探します", "Searches the messages shown on this device")))
                .add(new SwitchItem("save_history", label("表示したメッセージの履歴を保存", "Save viewed message history"), false)
                        .summary(label("最大 1,000 件。この端末の、アプリの非公開領域に保存します", "Up to 1,000, stored privately in the app on this device")));
        c.group(label("ユーザー", "Users")).needs(Feature.CHAT_HISTORY)
                .add(new ActionItem(label("ユーザー検索", "Find user"), env -> UserSearch.show(env.context()))
                        .summary(label("ログイン名または数値 ID で公開プロフィールを開きます",
                                "Open a public profile by login name or numeric ID")));
        return c;
    }

    private static Category playback() {
        Category c = new Category("playback", label("再生", "Playback"),
                label("シーク幅・画質・遅延", "Seek steps · Quality · Latency"));
        String sec = label(" 秒", " s");
        c.group(label("シーク", "Seek")).needs(Feature.PLAY_SEEK)
                .add(new SliderItem("forward_seek", label("進む秒数", "Seek forward"), 5, 120, PlayerTools.DEFAULT_FORWARD_SEEK, suffix(sec)))
                .add(new SliderItem("rewind_seek", label("戻る秒数", "Seek back"), 5, 120, PlayerTools.DEFAULT_REWIND_SEEK, suffix(sec)));
        c.group(label("動画の終わり", "When a video ends")).needs(Feature.NO_AUTOPLAY)
                .add(new SwitchItem(VodEnd.KEY, label("動画が終わったら次を自動再生しない", "Do not autoplay the next video"), false)
                        .summary(label("VOD やクリップが終わっても、次の動画のカウントダウンを出さず、何も再生しません。ライブ配信とホームのプレビューは変わりません。次に動画が終わるときから反映します",
                                "When a VOD or clip ends, no countdown to the next video appears and nothing else plays. Live streams and home previews are unchanged. Applies the next time a video ends.")));
        if (!Features.has(Feature.ADS_REPLACE)) addProxy(c, false);
        return c;
    }

    private static Category controls() {
        Category c = new Category("controls", label("画面と操作", "Screen and controls"),
                label("ジェスチャー・プレイヤーの表示・メニュー", "Gestures · Player overlays · Menu"));
        c.group(label("ジェスチャー", "Gestures")).needs(Feature.GESTURES)
                .add(new SwitchItem("brightness_gesture", label("左端の上下スワイプで明るさ", "Swipe left edge for brightness"), false))
                .add(new SwitchItem("volume_gesture", label("右端の上下スワイプで音量", "Swipe right edge for volume"), false));
        return c;
    }

    /** Proxy presets plus a validated custom HTTPS address. */
    static final class ProxyItem extends Item {
        private static final String[] URLS = {
                "",
                "https://lb-as.cdn-perfprod.com/live/",
                "https://lb-eu.cdn-perfprod.com/live/",
                "https://lb-na.cdn-perfprod.com/live/",
                "https://as.luminous.dev/live/",
                "https://eu.luminous.dev/live/",
        };

        static final String KEY = "live_proxy";

        ProxyItem() {
            super(label("プロキシ", "Proxy"));
            key = KEY;
        }

        /** Off, or one of the proxies offered by name. */
        static boolean preset(String url) {
            for (String known : URLS) if (known.equals(url)) return true;
            return false;
        }

        @Override
        boolean changed(SharedPreferences prefs) {
            return !prefs.getString(key, "").isEmpty();
        }

        private static String[] labels() {
            return new String[]{label("使わない（Twitch へ直接接続）", "Off (connect directly)"),
                    "PerfProd Asia", "PerfProd Europe", "PerfProd North America",
                    "Luminous Asia", "Luminous Europe", label("カスタム URL…", "Custom URL…")};
        }

        @Override
        View build(Env env) {
            SharedPreferences prefs = env.prefs(Store.CHAT);
            String current = prefs.getString(key, "");
            String[] labels = labels();
            int index = labels.length - 1;
            for (int i = 0; i < URLS.length; i++) if (URLS[i].equals(current)) index = i;
            String shown = index == labels.length - 1 ? current : labels[index];
            final int selected = index;
            return env.ui().choiceRow(env.context(), title, null, shown, () ->
                    env.ui().choose(env.context(), title, labels, selected, picked -> {
                        if (picked < URLS.length) {
                            prefs.edit().putString(key, URLS[picked]).apply();
                            env.changed(Store.CHAT);
                            env.rebuild();
                        } else {
                            custom(env, prefs);
                        }
                    }));
        }

        private void custom(Env env, SharedPreferences prefs) {
            Context context = env.context();
            Ui ui = env.ui();
            EditText input = new EditText(context);
            input.setSingleLine(true);
            input.setHint("https://example.com/live/");
            input.setText(prefs.getString(key, ""));
            input.setTextColor(ui.text);
            input.setHintTextColor(ui.secondary);
            input.setBackground(ui.field(context));
            int inset = Ui.dp(context, 12);
            input.setPadding(inset, inset, inset, inset);
            android.app.Dialog dialog = ui.modal(context, label("カスタム URL", "Custom URL"),
                    label("末尾が / の HTTPS URL。Twitch の認証情報は URL に含めません。",
                            "An HTTPS URL ending in /. Twitch credentials are never added."),
                    input, label("保存", "Save"), () -> {
                        String url = input.getText().toString().trim();
                        if (!LiveProxy.validBase(url)) {
                            input.setError(label("有効な HTTPS URL を入力してください",
                                    "Enter a valid HTTPS URL"));
                            return false;
                        }
                        prefs.edit().putString(key, url).apply();
                        env.changed(Store.CHAT);
                        env.rebuild();
                        return true;
                    }, label("キャンセル", "Cancel"));
            Ui.show(dialog, context);
        }
    }

    private static Category layout() {
        Category c = new Category("layout", label("レイアウト", "Layout"),
                label("横画面のチャット・ミニプレイヤー", "Landscape chat · Mini player"));
        String pct = " %";
        c.group(label("横画面のチャット", "Landscape chat")).needs(Feature.LANDSCAPE_CHAT)
                .note(label("幅と大きさは動画を開き直すと反映します。", "Reopen the video to apply width and size."))
                .add(new SwitchItem("landscape_width_enabled", label("チャットの幅を変える", "Change chat width"), false))
                .add(new SliderItem("landscape_width", label("通常表示の幅", "Chat width"), 10, 70, LayoutTools.DEFAULT_CHAT_WIDTH, suffix(pct))
                        .dependsOn("landscape_width_enabled"))
                .add(new SliderItem("landscape_split_width", label("分割表示の幅", "Split layout width"), 10, 70, LayoutTools.DEFAULT_SPLIT_WIDTH,
                        suffix(pct)).dependsOn("landscape_width_enabled"))
                .add(new SwitchItem("landscape_opacity_enabled", label("背景の濃さを変える", "Change background opacity"), false))
                .add(new SliderItem("landscape_opacity", label("背景の濃さ", "Background opacity"), 0, 100, LayoutTools.DEFAULT_CHAT_OPACITY,
                        suffix(pct)).dependsOn("landscape_opacity_enabled"));
        c.group(label("ミニプレイヤー", "Mini player")).needs(Feature.MINI_PLAYER, Feature.BACK_CLOSES_PLAYER)
                .add(new SwitchItem("mini_player_scale_enabled", label("大きさを変える", "Change size"), false)
                        .needs(Feature.MINI_PLAYER))
                .add(new SliderItem("mini_player_scale", label("大きさ", "Size"), 50, 200, LayoutTools.DEFAULT_MINI_SCALE, suffix(pct))
                        .summary(label("画面内に収まる範囲に制限します", "Limited to fit on screen"))
                        .dependsOn("mini_player_scale_enabled").needs(Feature.MINI_PLAYER))
                .add(new SwitchItem(PlayerClose.KEY, label("戻るでプレイヤーを閉じる（ミニプレイヤーにしない）",
                        "Back closes the player (no mini player)"), false)
                        .summary(label("戻る操作で、再生を止めてプレイヤーを閉じます。最小化ボタンと下へのスワイプでは、これまでどおりミニプレイヤーになります。次の戻る操作から反映します",
                                "Back stops playback and closes the player. The minimise button and a swipe down still shrink it to the mini player. Applies from the next back"))
                        .needs(Feature.BACK_CLOSES_PLAYER));
        return c;
    }

    private static Category home() {
        Category c = new Category("home", label("ホーム", "Home"),
                label("起動時の画面・フォロー中の欄・ナビゲーション", "Start screen · Following sections · Navigation"));
        // Twitch 31.9.0 and later show signed-in phones a home drawn by React Native. Where the patch reaches
        // that home's data, the sections it hides there come first and the rest follow the switch they need.
        boolean reached = Features.has(Feature.NEW_HOME_FEED), sectioned = Features.has(Feature.FOLLOWING_FEED);
        // The note is about the options of Following; the switch alone applies when the app restarts.
        String refresh = sectioned ? label("フォロー中を更新するか開き直すと反映します。", "Refresh or reopen Following to apply.") : null;
        Group sections = c.group(label("フォロー中に表示する欄", "Following sections")).note(refresh);
        // The classic home switch also serves the Hide elements and Hide recaps patches, which may be applied alone.
        Group classic = reached ? c.group(label("従来のホーム画面", "Classic home screen")).note(refresh) : sections;
        sections.needs(reached ? new Feature[]{Feature.FOLLOWING_FEED} : new Feature[]{Feature.FOLLOWING_FEED, Feature.CLASSIC_HOME});
        classic.needs(Feature.FOLLOWING_FEED, Feature.CLASSIC_HOME);
        String only = reached ? label("従来のホーム画面でだけ効きます", "Works on the classic home screen only") : null;
        classic.add(new SwitchItem(ClassicHome.KEY, label("従来のホーム画面を使う", "Use the classic home screen"), false)
                .then(env -> {
                    if (ClassicHome.waitsForRestart()) AppRestart.offer(env);
                })
                .summary(reached || !sectioned
                        ? label("Twitch がタブレットなどで今も使っている、以前の作りのホームに切り替えます。アプリを再起動すると反映します",
                                "Switches to the earlier home that Twitch still uses on tablets and elsewhere. Applies after the app restarts.")
                        : label("31.9.0 以降のスマホの新しいホームでは、下の項目は効きません。オンにすると、Twitch がタブレットなどで使っている従来のホームに切り替わり、下の項目が効くようになります。アプリを再起動すると反映します",
                                "On phones with Twitch 31.9.0 or later, the new home ignores the options below. Turning this on switches to the classic home that Twitch still uses on tablets and elsewhere, where they work. Applies after the app restarts."))
                .needs(Feature.CLASSIC_HOME));
        classic.add(new SwitchItem("full_channel_cards", label("配信を大きなカードで表示", "Large stream cards"), false)
                .summary(only).needs(Feature.FOLLOWING_FEED));
        for (String[] option : FeedFilters.OPTIONS) {
            Item item = new SwitchItem(option[0], label(option[1] + "を隠す", "Hide " + option[2]), false).needs(Feature.FOLLOWING_FEED);
            if (NewHomeFeed.reaches(option[0])) sections.add(item);
            else classic.add(item.summary(only));
        }
        c.group(label("ナビゲーション", "Navigation")).needs(Feature.NAV_POSITION)
                .add(new ChoiceItem("navigation_position", label("ナビゲーションバーの位置", "Navigation bar position"),
                        new String[]{label("標準", "Default"), label("上部", "Top"), label("非表示", "Hidden")},
                        new String[]{"default", "top", "hidden"}, "default")
                        .undoable("hidden", label("ナビゲーションを隠しました", "Navigation hidden"))
                        .summary(label("横レール表示の広い画面では「上部」は効きません",
                                "'Top' has no effect on a wide screen's side rail")));
        return c;
    }

    /** Where each hide option shows on screen; the order here is the order of the groups. */
    private static final String[][] HIDE_AREAS = {
            {"プレイヤーのボタン", "Player buttons", "hide_cast", "hide_clips", "hide_share", "hide_stream_extensions"},
            {"配信の下のボタン", "Buttons under the stream", "hide_unfollow", "hide_subscribe", "hide_gift_sub"},
            {"チャット", "Chat", "hide_chat_header", "hide_vod_header", "hide_leaderboards", "hide_hype_train", "hide_pinned",
                    "hide_bits", "hide_input", "hide_landscape_input", "hide_one_chat_popup"},
            {"ホームとナビゲーション", "Home and navigation", "hide_stories", "hide_create", "hide_discover", "hide_go_ad_free"},
    };

    private static Category hide() {
        Category c = new Category("hide", label("表示の整理", "Declutter"),
                label("使わないボタンや欄を隠す", "Hide buttons and panels you do not use"));
        List<String> placed = new ArrayList<>();
        for (String[] area : HIDE_AREAS) {
            Group group = c.group(label(area[0], area[1])).needs(Feature.DECLUTTER, Feature.CHAT_HIDE_HIGHLIGHTS);
            for (int i = 2; i < area.length; i++) {
                String[] option = hideOption(area[i]);
                if (option == null) continue;
                group.add(hideItem(option));
                placed.add(area[i]);
            }
        }
        // Twitch 30.7.2 has neither the channel shelf nor the React Native home the classic home switch is for.
        boolean newHome = Features.has(Feature.CLASSIC_HOME);
        c.group(label("リキャップ", "Recaps")).needs(Feature.HIDE_RECAPS)
                .add(new SwitchItem(Recaps.KEY, label("配信のリキャップを隠す", "Hide stream recaps"), false)
                        .summary(newHome
                                ? label("チャンネルページと従来のホームから、リキャップ（配信のクリップ集）を隠します。新しいホームの棚は隠せません。ページを開き直すと反映します",
                                        "Hides recaps (reels of a stream's clips) on channel pages and the classic home. The shelf on the new home stays. Applies when a page is opened again.")
                                : label("リキャップ（配信のクリップをまとめたもの）を、ホームのフィードに出しません。フィードを読み込み直すと反映します",
                                        "Recaps (reels of a stream's clips) no longer show in the home feed. Applies when the feed loads again.")));
        // An option added to ViewCustomization later still shows, until it is given an area above.
        Group other = c.group(label("そのほか", "Other")).needs(Feature.DECLUTTER, Feature.CHAT_HIDE_HIGHLIGHTS);
        for (String[] option : ViewCustomization.OPTIONS) if (!placed.contains(option[0])) other.add(hideItem(option));
        return c;
    }

    private static String[] hideOption(String key) {
        for (String[] option : ViewCustomization.OPTIONS) if (option[0].equals(key)) return option;
        return null;
    }

    private static Item hideItem(String[] option) {
        Item item = new SwitchItem(option[0], label(option[1] + "を隠す", "Hide " + option[2]), false);
        item.needs(option[0].equals("hide_hype_train") || option[0].equals("hide_pinned")
                ? new Feature[]{Feature.DECLUTTER, Feature.CHAT_HIDE_HIGHLIGHTS}
                : new Feature[]{Feature.DECLUTTER});
        if (option[0].equals("hide_unfollow"))
            item.summary(label("フォロー中のチャンネルでは、配信画面のハート（押すとフォロー解除）を出しません。検索結果とストーリーの解除ボタンも隠します。開いている配信や動画には、開き直すと反映します",
                    "On followed channels the heart under the player (one tap unfollows) is not shown, nor the unfollow buttons in search and stories. A stream or video that is open shows the change once it is reopened."));
        if (option[0].equals("hide_go_ad_free")) {
            // The new home asks Twitch about the button once, when it starts.
            if (NewHomeFeed.reaches(option[0]))
                item.summary(label("フォロー中のタブのボタンは、アプリを開き直すと反映します",
                        "The button in the Following tab changes once the app is reopened"));
            else if (Features.has(Feature.CLASSIC_HOME))
                item.summary(label("フォロー中のタブのボタンは、従来のホーム画面でだけ隠せます（ホーム › 従来のホーム画面を使う）",
                        "The button in the Following tab can only be hidden on the classic home screen (Home › Use the classic home screen)"));
        }
        return item;
    }

    private static Category about(List<Category> others) {
        Category c = new Category(ABOUT, label("このパッチについて", "About"),
                label("記録・初期化・情報", "Totals · Reset · Information"));
        if (Features.has(Feature.PATCH_STATS)) c.groups.add(OriginalExtras.stats(c));
        c.group(label("設定", "Settings"))
                // The two languages go by their own names, so either can be found from the other.
                .add(new ChoiceItem(Text.KEY, label("表示言語", "Display language"),
                        new String[]{label("自動（アプリの言語）", "Automatic (the app's language)"), "日本語", "English"},
                        new String[]{Text.AUTO, Text.JAPANESE, Text.ENGLISH}, Text.AUTO)
                        .summary(label("パッチの設定・メニュー・通知の言語です。Twitch 自体の言語は変わりません",
                                "The language of the patch's settings, menus and notices. Twitch's own language stays as it is.")))
                .add(new ResetItem("reset:all", label("すべて初期値に戻す", "Reset everything"), others)
                        .summary(label("パッチの設定をすべて初期値に戻します。NGワードと非表示ユーザーの一覧も消えます。履歴・VOD の同期・記録は残ります",
                                "Resets every setting of the patch, including your word and user lists. History, VOD offsets and totals stay.")));
        c.group(label("設定の引っ越し", "Move settings"))
                .note(label("設定はこの端末にだけ保存されます。入れ直したあとや別の端末へは、ここから持っていけます。カスタム URL のプロキシだけは運ばれないので、入れ直してください。",
                        "Settings are stored on this device only; this takes them to a reinstall or another device. A custom proxy URL is the one thing not carried; enter it again."))
                .add(new ActionItem(label("設定を書き出す", "Export settings"), SettingsTransfer::showExport)
                        .summary(label("設定を文字にして、共有またはコピーします", "Turns the settings into text to share or copy")))
                .add(new ActionItem(label("設定を読み込む", "Import settings"), SettingsTransfer::showImport)
                        .summary(label("書き出した文字を貼り付けて、設定を置き換えます", "Paste exported text to replace the settings")));
        c.group(label("情報", "Information"))
                .add(new VersionItem())
                .add(new ActionItem(label("パッチの公開ページ", "Project page"), env -> {
                    try {
                        env.context().startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(PROJECT_URL))
                                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
                    } catch (RuntimeException e) {
                        Toast.makeText(env.context(), PROJECT_URL, Toast.LENGTH_LONG).show();
                    }
                }).summary(label("ソースと更新情報（GitHub）", "Source and updates on GitHub")))
                .add(new DiagnosticsRow());
        return c;
    }

    /** Reset goes through at once; an inline undo stands in for a confirmation dialog. */
    static void resetWithUndo(Env env, String key, List<Category> scope) {
        Map<Store, Map<String, Object>> before = new EnumMap<>(Store.class);
        Map<Store, SharedPreferences.Editor> editors = new EnumMap<>(Store.class);
        for (Store store : Store.values()) {
            SharedPreferences prefs = env.prefs(store);
            before.put(store, new HashMap<>(prefs.getAll()));
            editors.put(store, prefs.edit());
        }
        for (Category category : scope)
            for (Group group : category.groups)
                for (Item item : group.items)
                    item.reset(editors.get(item.store));
        for (SharedPreferences.Editor editor : editors.values()) editor.apply();
        for (Store store : Store.values()) env.changed(store);
        env.beginUndo(key, () -> restore(env, before, scope));
        env.rebuild();
    }

    private static void restore(Env env, Map<Store, Map<String, Object>> before, List<Category> scope) {
        for (Store store : Store.values()) {
            SharedPreferences.Editor editor = env.prefs(store).edit();
            for (Category category : scope)
                for (Group group : category.groups)
                    for (Item item : group.items)
                        if (item.store == store && item.key != null)
                            put(editor, item.key, before.get(store).get(item.key));
            editor.apply();
        }
        for (Store store : Store.values()) env.changed(store);
        env.rebuild();
    }

    private static void put(SharedPreferences.Editor editor, String key, Object value) {
        if (value == null) editor.remove(key);
        else if (value instanceof Boolean) editor.putBoolean(key, (Boolean) value);
        else if (value instanceof Integer) editor.putInt(key, (Integer) value);
        else if (value instanceof Long) editor.putLong(key, (Long) value);
        else if (value instanceof Float) editor.putFloat(key, (Float) value);
        else editor.putString(key, String.valueOf(value));
    }

    /** One tap resets the scope, and the same pill offers undo for five seconds. */
    static final class ResetItem extends Item {
        private final List<Category> scope;
        private final String undoKey;

        ResetItem(String undoKey, String title, List<Category> scope) {
            super(title);
            this.undoKey = undoKey;
            this.scope = scope;
        }

        @Override
        View build(Env env) {
            return env.ui().confirmRow(env.context(), title, summary, label("初期値に戻す", "Reset"),
                    label("初期値に戻しました", "Reset done"), env.pending(undoKey),
                    () -> resetWithUndo(env, undoKey, scope),
                    () -> {
                        ConfirmPill.Pending pending = env.pending(undoKey);
                        env.clearPending();
                        if (pending != null) pending.undo.run();
                    },
                    env::clearPending);
        }
    }

    /** Opens the editor for the order and visibility of the player menu's sections. */
    static final class MenuLayoutItem extends Item {
        MenuLayoutItem() {
            super(label("メニューの順番と表示", "Menu order and visibility"));
            key = MenuLayout.KEY;
        }

        @Override
        boolean changed(SharedPreferences prefs) {
            return !MenuLayout.parse(null).serialize().equals(MenuLayout.parse(prefs.getString(key, null)).serialize());
        }

        @Override
        View build(Env env) {
            return env.ui().linkRow(env.context(), title,
                    label("ドラッグで並べ替え、スイッチで表示を切り替えます",
                            "Drag to reorder; the switch shows or hides a section"),
                    null, () -> PlayerMenu.editLayout(env));
        }
    }
}
