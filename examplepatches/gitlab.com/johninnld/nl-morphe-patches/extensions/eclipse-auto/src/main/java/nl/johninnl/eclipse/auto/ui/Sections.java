package nl.johninnl.eclipse.auto.ui;

import androidx.car.app.model.Action;
import androidx.car.app.model.Banner;
import androidx.car.app.model.BannerSection;
import androidx.car.app.model.CarColor;
import androidx.car.app.model.CarIcon;
import androidx.car.app.model.Chip;
import androidx.car.app.model.ChipSection;
import androidx.car.app.model.ChipStyle;
import androidx.car.app.model.CondensedItem;
import androidx.car.app.model.CondensedSection;
import androidx.car.app.model.GridItem;
import androidx.car.app.model.GridSection;
import androidx.car.app.model.Row;
import androidx.car.app.model.RowSection;
import androidx.car.app.model.Section;
import androidx.car.app.model.SectionHeader;
import androidx.car.app.model.Shape;
import androidx.car.app.model.SpotlightSection;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.function.Consumer;
import java.util.function.IntConsumer;
import nl.johninnl.eclipse.auto.data.HomeView;
import nl.johninnl.eclipse.auto.data.Model;
import nl.johninnl.eclipse.auto.data.ProviderSearch;
import nl.johninnl.eclipse.auto.data.QueueView;

/**
 * Section builders. Every one that differs between API levels exists as a pair
 * ({@code name8} / {@code name9}) returning the same abstract content; API 9 types and setters
 * appear only inside the {@code ...9} methods, which {@link Env#api9()} guards. A format change is
 * made in {@link Presentation}, never here.
 */
public final class Sections {
    static final CarColor ACCENT = CarColor.createCustom(0xff06b6d4, 0xff06b6d4);
    private static final CarColor DARK = CarColor.createCustom(0xff1a1a1a, 0xff1a1a1a);
    private static final CarColor WHITE = CarColor.createCustom(0xffffffff, 0xffffffff);

    /** Receives the destination the driver tapped. */
    public interface Selection {
        void select(Destination destination);
    }

    // ---- destination selector ------------------------------------------------------------------

    /** The destination selector: chips on API 9, a titled "Browse" row list below. */
    public static Section<?> destinations(Env env, Destination selected, Selection onSelect) {
        return env.api9() ? destinations9(selected, onSelect) : destinations8(selected, onSelect);
    }

    static Section<?> destinations8(Destination selected, Selection onSelect) {
        RowSection.Builder section = new RowSection.Builder().setTitle("Browse");
        for (Destination destination : Destination.values()) {
            Row.Builder row = new Row.Builder().setTitle(destination.title)
                .setOnClickListener(() -> onSelect.select(destination));
            if (destination == selected) row.addText("Showing");
            section.addItem(row.build());
        }
        return section.build();
    }

    static Section<?> destinations9(Destination selected, Selection onSelect) {
        ChipSection.Builder section = new ChipSection.Builder();
        for (Destination destination : Destination.values()) {
            section.addItem(chip9(destination.title, destination == selected, () -> onSelect.select(destination)));
        }
        return section.build();
    }

    // ---- search filter -------------------------------------------------------------------------

    /** The search type filter: chips on API 9 (the selected one styled), a titled "Show" row list below. */
    public static Section<?> searchFilter(Env env, ProviderSearch.Filter selected, Consumer<ProviderSearch.Filter> onSelect) {
        return env.api9() ? searchFilter9(selected, onSelect) : searchFilter8(selected, onSelect);
    }

    static Section<?> searchFilter8(ProviderSearch.Filter selected, Consumer<ProviderSearch.Filter> onSelect) {
        RowSection.Builder section = new RowSection.Builder().setTitle("Show");
        for (final ProviderSearch.Filter filter : ProviderSearch.Filter.values()) {
            Row.Builder row = new Row.Builder().setTitle(filter.label).setOnClickListener(() -> onSelect.accept(filter));
            if (filter == selected) row.addText("Showing");
            section.addItem(row.build());
        }
        return section.build();
    }

    static Section<?> searchFilter9(ProviderSearch.Filter selected, Consumer<ProviderSearch.Filter> onSelect) {
        ChipSection.Builder section = new ChipSection.Builder();
        for (final ProviderSearch.Filter filter : ProviderSearch.Filter.values()) {
            section.addItem(chip9(filter.label, filter == selected, () -> onSelect.accept(filter)));
        }
        return section.build();
    }

    private static Chip chip9(String title, boolean active, Runnable onClick) {
        return new Chip.Builder().setTitle(title).setSelected(active)
            .setStyle(new ChipStyle.Builder().setShape(Shape.CORNER_FULL)
                .setBackgroundColor(active ? ACCENT : DARK)
                .setOutlineColor(active ? ACCENT : WHITE)
                .setContentColor(WHITE).build())
            .setOnClickListener(onClick::run).build();
    }

    // ---- headers -------------------------------------------------------------------------------

    /**
     * Titles a section. At API 9 a section header replaces the plain title when it carries a "See
     * all" target, a subtitle, or when {@code headerAtApi9} asks for a boundary header; below that,
     * a title.
     */
    private static void titled(Env env, Titling target, String title, String subtitle, Runnable seeAll, boolean headerAtApi9) {
        if (title == null || title.isEmpty()) return;
        if (env.api9() && (seeAll != null || subtitle != null || headerAtApi9)) target.header9(title, subtitle, seeAll);
        else target.title(title);
    }

    /** The ways a section builder can be titled; the builders share no public base type. */
    private interface Titling {
        void title(String title);

        /** API 9 only: a section header, with a "See all" target when {@code seeAll} is set. */
        void header9(String title, String subtitle, Runnable seeAll);
    }

    private static SectionHeader sectionHeader9(String title, String subtitle, Runnable seeAll) {
        SectionHeader.Builder header = new SectionHeader.Builder(title);
        if (seeAll != null) header.setSubtitle("See all").setOnClickListener(seeAll::run);
        else if (subtitle != null) header.setSubtitle(subtitle);
        return header.build();
    }

    private static Titling of(final RowSection.Builder section) {
        return new Titling() {
            @Override public void title(String title) { section.setTitle(title); }
            @Override public void header9(String title, String subtitle, Runnable seeAll) {
                section.setSectionHeader(sectionHeader9(title, subtitle, seeAll));
            }
        };
    }

    private static Titling of(final GridSection.Builder section) {
        return new Titling() {
            @Override public void title(String title) { section.setTitle(title); }
            @Override public void header9(String title, String subtitle, Runnable seeAll) {
                section.setSectionHeader(sectionHeader9(title, subtitle, seeAll));
            }
        };
    }

    private static Titling of(final CondensedSection.Builder section) {
        return new Titling() {
            @Override public void title(String title) { section.setTitle(title); }
            @Override public void header9(String title, String subtitle, Runnable seeAll) {
                section.setSectionHeader(sectionHeader9(title, subtitle, seeAll));
            }
        };
    }

    private static Titling of(final SpotlightSection.Builder section) {
        return new Titling() {
            @Override public void title(String title) { section.setTitle(title); }
            @Override public void header9(String title, String subtitle, Runnable seeAll) {
                section.setSectionHeader(sectionHeader9(title, subtitle, seeAll));
            }
        };
    }

    static String nonEmpty(String text, String fallback) { return text == null || text.isEmpty() ? fallback : text; }

    // ---- tiles ---------------------------------------------------------------------------------

    /** Tiles in the format {@code entry} names for the negotiated level, with no header subtitle. */
    public static Section<?> tiles(Env env, String title, List<Model.Tile> tiles, Presentation.Entry entry,
                                   Consumer<Model.Tile> onOpen, Runnable seeAll) {
        return tiles(env, title, null, tiles, entry, onOpen, seeAll);
    }

    /**
     * Tiles in the format {@code entry} names for the negotiated level, capped at the entry's cap.
     * {@code seeAll} (nullable; only the Library page passes one) is offered when the list is longer
     * than the cap; {@code subtitle} (nullable) is the API 9 section header's second line. A tile
     * that cannot be opened is drawn without a tap target.
     */
    public static Section<?> tiles(Env env, String title, String subtitle, List<Model.Tile> tiles, Presentation.Entry entry,
                                   Consumer<Model.Tile> onOpen, Runnable seeAll) {
        Presentation.Resolved resolved = Presentation.resolve(entry, env.api9());
        List<Model.Tile> shown = tiles.subList(0, Math.min(resolved.cap, tiles.size()));
        Runnable more = tiles.size() > resolved.cap ? seeAll : null;
        switch (resolved.format) {
            case CONDENSED: return condensed9(env, title, subtitle, shown, onOpen, more);
            case ROWS: return tileRows(env, title, shown, onOpen);
            default:
                // SPOTLIGHT and BANNER are drawn by spotlight() and notice(); anything else is large tiles.
                List<GridItem> items = new ArrayList<>(shown.size());
                for (Model.Tile tile : shown) items.add(gridItem(env, tile, onOpen));
                return env.api9() ? grid9(env, title, subtitle, items, resolved.format, more)
                    : grid8(env, title, items, resolved.format, more);
        }
    }

    private static GridItem gridItem(Env env, Model.Tile tile, Consumer<Model.Tile> onOpen) {
        GridItem.Builder item = new GridItem.Builder().setTitle(nonEmpty(tile.title, "Untitled"));
        if (!tile.subtitle.isEmpty()) item.setText(tile.subtitle);
        if (tile.icon != null) item.setImage(env.icon(tile.icon), GridItem.IMAGE_TYPE_ICON);
        else item.setImage(env.art(tile.artUrl), GridItem.IMAGE_TYPE_LARGE);
        if (tile.enabled()) item.setOnClickListener(() -> onOpen.accept(tile));
        return item.build();
    }

    private static int gridSize(Presentation.Format format) {
        switch (format) {
            case GRID_SMALL: return GridSection.ITEM_SIZE_SMALL;
            case GRID_XL: return GridSection.ITEM_SIZE_EXTRA_LARGE;
            default: return GridSection.ITEM_SIZE_LARGE;
        }
    }

    static Section<?> grid8(Env env, String title, List<GridItem> items, Presentation.Format format, Runnable seeAll) {
        GridSection.Builder section = new GridSection.Builder().setItemSize(gridSize(format));
        if (format == Presentation.Format.GRID_CIRCLE) section.setItemImageShape(GridSection.ITEM_IMAGE_SHAPE_CIRCLE);
        titled(env, of(section), title, null, null, false);
        for (GridItem item : items) section.addItem(item);
        if (seeAll != null) {
            section.addItem(new GridItem.Builder().setTitle("See all").setImage(env.icon("see_all"), GridItem.IMAGE_TYPE_ICON)
                .setOnClickListener(seeAll::run).build());
        }
        return section.build();
    }

    static Section<?> grid9(Env env, String title, String subtitle, List<GridItem> items, Presentation.Format format, Runnable seeAll) {
        GridSection.Builder section = new GridSection.Builder().setItemSize(gridSize(format))
            .setIncompleteLastRowStrategy(GridSection.INCOMPLETE_LAST_ROW_AS_IS);
        if (format == Presentation.Format.GRID_CIRCLE) section.setItemImageShape(GridSection.ITEM_IMAGE_SHAPE_CIRCLE);
        titled(env, of(section), title, subtitle, seeAll, false);
        for (GridItem item : items) section.addItem(item);
        return section.build();
    }

    /**
     * A row of songs as large tiles with the title and the artist, at both levels. The tapped tile's
     * index is its index in {@code tracks}, so the row plays from that song.
     */
    public static Section<?> trackTiles(Env env, String title, List<Model.Track> tracks, Presentation.Entry entry, IntConsumer onPlay) {
        Presentation.Resolved resolved = Presentation.resolve(entry, env.api9());
        int shown = Math.min(resolved.cap, tracks.size());
        List<GridItem> items = new ArrayList<>(shown);
        for (int i = 0; i < shown; i++) {
            final int index = i;
            Model.Track track = tracks.get(i);
            GridItem.Builder item = new GridItem.Builder().setTitle(nonEmpty(track.title, "Unknown title"))
                .setImage(env.art(track.artUrl), GridItem.IMAGE_TYPE_LARGE)
                .setOnClickListener(() -> onPlay.accept(index));
            if (!track.artist.isEmpty()) item.setText(track.artist);
            items.add(item.build());
        }
        return env.api9() ? grid9(env, title, null, items, resolved.format, null) : grid8(env, title, items, resolved.format, null);
    }

    static Section<?> condensed9(Env env, String title, String subtitle, List<Model.Tile> tiles, Consumer<Model.Tile> onOpen,
                                 Runnable seeAll) {
        CondensedSection.Builder section = new CondensedSection.Builder()
            .setIncompleteLastRowStrategy(CondensedSection.INCOMPLETE_LAST_ROW_AS_IS);
        titled(env, of(section), title, subtitle, seeAll, false);
        for (Model.Tile tile : tiles) {
            CarIcon image = tile.icon == null ? env.art(tile.artUrl) : tile.accent ? env.accentIcon(tile.icon) : env.icon(tile.icon);
            CondensedItem.Builder item = new CondensedItem.Builder().setTitle(nonEmpty(tile.title, "Untitled"))
                .setLeadingImage(image, CondensedItem.IMAGE_TYPE_MEDIUM);
            if (tile.enabled()) item.setOnClickListener(() -> onOpen.accept(tile));
            if (!tile.subtitle.isEmpty()) item.setText(tile.subtitle);
            section.addItem(item.build());
        }
        return section.build();
    }

    private static Section<?> tileRows(Env env, String title, List<Model.Tile> tiles, Consumer<Model.Tile> onOpen) {
        RowSection.Builder section = new RowSection.Builder();
        titled(env, of(section), title, null, null, false);
        for (Model.Tile tile : tiles) {
            Row.Builder row = new Row.Builder().setTitle(nonEmpty(tile.title, "Untitled")).setBrowsable(tile.enabled())
                .setImage(tile.icon != null ? env.icon(tile.icon) : env.art(tile.artUrl), Row.IMAGE_TYPE_LARGE);
            if (tile.enabled()) row.setOnClickListener(() -> onOpen.accept(tile));
            if (!tile.subtitle.isEmpty()) row.addText(tile.subtitle);
            section.addItem(row.build());
        }
        return section.build();
    }

    // ---- songs, stations and spotlights --------------------------------------------------------

    /**
     * Song rows: title, artist, large cover. At most {@code cap} rows are shown; {@code onPlay}
     * receives the tapped row's index, which is also its index in the full list. {@code seeAll}
     * (nullable) is an API 9 "See all" header target and, below that, a closing "See all" row when
     * the list is truncated.
     */
    public static Section<?> trackRows(Env env, String title, List<Model.Track> tracks, int cap, boolean indexed,
                                       IntConsumer onPlay, Runnable seeAll) {
        RowSection.Builder section = new RowSection.Builder();
        titled(env, of(section), title, null, seeAll, false);
        int shown = Math.min(cap, tracks.size());
        for (int i = 0; i < shown; i++) {
            final int index = i;
            Model.Track track = tracks.get(i);
            Row.Builder row = new Row.Builder().setTitle(nonEmpty(track.title, "Unknown title"))
                .setImage(env.art(track.artUrl), Row.IMAGE_TYPE_LARGE)
                .setOnClickListener(() -> onPlay.accept(index));
            if (!track.artist.isEmpty()) row.addText(track.artist);
            if (indexed) row.setIndexable(true);
            section.addItem(row.build());
        }
        if (seeAll != null && !env.api9() && tracks.size() > shown) {
            section.addItem(new Row.Builder().setTitle("See all").setBrowsable(true).setOnClickListener(seeAll::run).build());
        }
        return section.build();
    }

    public static Section<?> stationRows(Env env, String title, List<Model.Station> stations, Consumer<Model.Station> onTap) {
        RowSection.Builder section = new RowSection.Builder();
        titled(env, of(section), title, null, null, false);
        for (Model.Station station : stations) {
            Row.Builder row = new Row.Builder().setTitle(nonEmpty(station.name, "Station"))
                .setOnClickListener(() -> onTap.accept(station));
            if (!station.description.isEmpty()) row.addText(station.description);
            section.addItem(row.build());
        }
        return section.build();
    }

    /** Live stations as large tiles: the cover of the song on air, the station's name and "LIVE · title – artist". */
    public static Section<?> liveStations(Env env, String title, List<Model.LiveStation> stations, Presentation.Entry entry,
                                          Consumer<Model.LiveStation> onTap) {
        Presentation.Resolved resolved = Presentation.resolve(entry, env.api9());
        List<GridItem> items = new ArrayList<>();
        for (int i = 0; i < stations.size() && i < resolved.cap; i++) {
            final Model.LiveStation station = stations.get(i);
            items.add(new GridItem.Builder().setTitle(nonEmpty(station.name, "Station")).setText(station.nowPlaying())
                .setImage(env.art(station.coverUrl), GridItem.IMAGE_TYPE_LARGE)
                .setOnClickListener(() -> onTap.accept(station)).build());
        }
        return env.api9() ? grid9(env, title, null, items, resolved.format, null) : grid8(env, title, items, resolved.format, null);
    }

    // ---- the Umbra DJ --------------------------------------------------------------------------

    /** What the Umbra card does. */
    public interface DjActions {
        /** Start the DJ and show the player. */
        void start();
        /** Stop the DJ; only offered while it is running. */
        void stop();
        /** The DJ is already running: show the player. */
        void showPlayer();
    }

    /**
     * The Umbra DJ card: a banner on API 9 (leading icon, "Umbra", "Start the DJ" and a trailing "DJ"
     * action), one row below. While the DJ is running the card says so, opens the player and offers
     * Stop.
     */
    public static Section<?> dj(Env env, String title, boolean active, DjActions actions) {
        boolean banner = Presentation.resolve(Presentation.forKey("home.dj"), env.api9()).format == Presentation.Format.BANNER;
        return banner ? dj9(env, title, active, actions) : dj8(env, title, active, actions);
    }

    static Section<?> dj8(Env env, String title, boolean active, DjActions actions) {
        RowSection.Builder section = new RowSection.Builder();
        Row.Builder row = new Row.Builder().setTitle(nonEmpty(title, "Umbra")).addText(active ? "Playing" : "Start the DJ")
            .setImage(env.icon("dj"), Row.IMAGE_TYPE_ICON)
            .setOnClickListener(active ? actions::showPlayer : actions::start);
        section.addItem(row.build());
        if (active) section.addItem(new Row.Builder().setTitle("Stop the DJ").setOnClickListener(actions::stop).build());
        return section.build();
    }

    static Section<?> dj9(Env env, String title, boolean active, DjActions actions) {
        Banner.Builder banner = new Banner.Builder().setTitle(nonEmpty(title, "Umbra")).setSubtitle(active ? "Playing" : "Start the DJ")
            .setLeadingImage(env.accentIcon("dj"))
            .setOnClickListener(active ? actions::showPlayer : actions::start)
            .addTrailingAction(new Action.Builder().setTitle(active ? "Stop" : "DJ")
                .setOnClickListener(active ? actions::stop : actions::start).build());
        return new BannerSection.Builder().addItem(banner.build()).build();
    }

    /**
     * The featured artist: a spotlight of the artist's image with "Play top songs" and "Open
     * artist" on API 9, a one-tile circle grid below (the table entry's fallback).
     */
    public static Section<?> spotlight(Env env, String title, Model.Tile artist, Presentation.Entry entry,
                                       Consumer<Model.Tile> onOpen, Consumer<Model.Tile> onPlay) {
        if (Presentation.resolve(entry, env.api9()).format == Presentation.Format.SPOTLIGHT) {
            return spotlight9(env, title, artist, onOpen, onPlay);
        }
        return tiles(env, title, Collections.singletonList(artist), entry, onOpen, null);
    }

    static Section<?> spotlight9(Env env, String title, Model.Tile artist, Consumer<Model.Tile> onOpen, Consumer<Model.Tile> onPlay) {
        SpotlightSection.Builder section = new SpotlightSection.Builder(env.art(artist.artUrl))
            .setIncompleteLastColumnStrategy(SpotlightSection.INCOMPLETE_LAST_COLUMN_AS_IS);
        titled(env, of(section), title, null, null, false);
        if (artist.playLoader != null) {
            section.addItem(new CondensedItem.Builder().setTitle("Play top songs").setText(artist.title)
                .setOnClickListener(() -> onPlay.accept(artist)).build());
        }
        section.addItem(new CondensedItem.Builder().setTitle("Open artist").setText(artist.title)
            .setOnClickListener(() -> onOpen.accept(artist)).build());
        return section.build();
    }

    /**
     * Discover's hero: one card with its songs. A spotlight with Play, Shuffle and the first songs
     * on API 9; on API 8 one row with the card's art, title and subtitle, then the first songs.
     */
    public static Section<?> hero(Env env, String title, Model.Tile card, List<Model.Track> tracks, int cap,
                                  Consumer<Model.Tile> onOpen, IntConsumer onPlay, Runnable onPlayAll, Runnable onShuffle) {
        return env.api9() ? hero9(env, title, card, tracks, cap, onPlay, onPlayAll, onShuffle)
            : hero8(env, title, card, tracks, cap, onOpen, onPlay);
    }

    static Section<?> hero8(Env env, String title, Model.Tile card, List<Model.Track> tracks, int cap, Consumer<Model.Tile> onOpen,
                            IntConsumer onPlay) {
        RowSection.Builder section = new RowSection.Builder();
        titled(env, of(section), title, null, null, false);
        Row.Builder cardRow = new Row.Builder().setTitle(nonEmpty(card.title, "Today")).setBrowsable(true)
            .setImage(env.art(card.artUrl), Row.IMAGE_TYPE_LARGE)
            .setOnClickListener(() -> onOpen.accept(card));
        if (!card.subtitle.isEmpty()) cardRow.addText(card.subtitle);
        section.addItem(cardRow.build());
        for (int i = 0; i < Math.min(cap, tracks.size()); i++) {
            final int index = i;
            Model.Track track = tracks.get(i);
            Row.Builder row = new Row.Builder().setTitle(nonEmpty(track.title, "Unknown title"))
                .setImage(env.art(track.artUrl), Row.IMAGE_TYPE_LARGE)
                .setOnClickListener(() -> onPlay.accept(index));
            if (!track.artist.isEmpty()) row.addText(track.artist);
            section.addItem(row.build());
        }
        return section.build();
    }

    static Section<?> hero9(Env env, String title, Model.Tile card, List<Model.Track> tracks, int cap, IntConsumer onPlay,
                            Runnable onPlayAll, Runnable onShuffle) {
        SpotlightSection.Builder section = new SpotlightSection.Builder(env.art(card.artUrl))
            .setIncompleteLastColumnStrategy(SpotlightSection.INCOMPLETE_LAST_COLUMN_AS_IS);
        titled(env, of(section), title, null, null, false);
        section.addItem(new CondensedItem.Builder().setTitle("Play").setText(nonEmpty(card.title, "Today"))
            .setOnClickListener(onPlayAll::run).build());
        section.addItem(new CondensedItem.Builder().setTitle("Shuffle").setOnClickListener(onShuffle::run).build());
        for (int i = 0; i < Math.min(cap, tracks.size()); i++) {
            final int index = i;
            Model.Track track = tracks.get(i);
            CondensedItem.Builder item = new CondensedItem.Builder().setTitle(nonEmpty(track.title, "Unknown title"))
                .setLeadingImage(env.art(track.artUrl), CondensedItem.IMAGE_TYPE_SMALL)
                .setOnClickListener(() -> onPlay.accept(index));
            if (!track.artist.isEmpty()) item.setText(track.artist);
            section.addItem(item.build());
        }
        return section.build();
    }

    // ---- notices -------------------------------------------------------------------------------

    /**
     * The state banner of design section 4: a BannerSection on API 9, one tappable row below. The
     * "Offline" and "Couldn't refresh" banners carry a Retry; signed out only asks for the phone.
     */
    public static Section<?> notice(Env env, HomeView.Notice notice, Runnable retry) {
        String title;
        String detail = null;
        boolean retryable = false;
        switch (notice) {
            case SIGNED_OUT: title = "Sign in to Eclipse on your phone"; break;
            case REFRESH_FAILED: title = "Couldn't refresh"; retryable = true; break;
            case OFFLINE: title = "Offline"; detail = "Showing what is on this phone"; retryable = true; break;
            default: title = "Not available right now"; break;
        }
        return env.api9() ? notice9(title, detail, retryable ? retry : null, notice == HomeView.Notice.SIGNED_OUT)
            : messageRow(retryable ? title + " · Retry" : title, detail, retryable ? retry : null);
    }

    static Section<?> notice9(String title, String detail, Runnable retry, boolean withAppIcon) {
        Banner.Builder banner = new Banner.Builder().setTitle(title);
        if (detail != null) banner.setSubtitle(detail);
        if (withAppIcon) banner.setLeadingImage(CarIcon.APP_ICON);
        if (retry != null) banner.addTrailingAction(new Action.Builder().setTitle("Retry").setOnClickListener(retry::run).build());
        return new BannerSection.Builder().addItem(banner.build()).build();
    }

    /** A section holding one text row, optionally tappable (retry, shuffle all, state messages). */
    public static Section<?> messageRow(String text, String detail, Runnable onClick) {
        Row.Builder row = new Row.Builder().setTitle(nonEmpty(text, " "));
        if (detail != null && !detail.isEmpty()) row.addText(detail);
        if (onClick != null) row.setOnClickListener(onClick::run);
        return new RowSection.Builder().addItem(row.build()).build();
    }

    // ---- collection actions --------------------------------------------------------------------

    /**
     * The first section of a song collection: Play and Add to Up Next, as two rows on API 8 and as
     * two chips on API 9 (a collection has no navigation chips, so its one chip row is free).
     * {@code addEnabled} is false while a live station is tuned: the queue ignores additions then.
     */
    public static Section<?> collectionActions(Env env, Runnable play, Runnable addToUpNext, boolean addEnabled) {
        return env.api9() ? actions9(play, addToUpNext, addEnabled) : actions8(play, addToUpNext, addEnabled);
    }

    static Section<?> actions8(Runnable play, Runnable addToUpNext, boolean addEnabled) {
        RowSection.Builder section = new RowSection.Builder()
            .addItem(new Row.Builder().setTitle("Play").setOnClickListener(play::run).build());
        if (addEnabled) section.addItem(new Row.Builder().setTitle("Add to Up Next").setOnClickListener(addToUpNext::run).build());
        return section.build();
    }

    static Section<?> actions9(Runnable play, Runnable addToUpNext, boolean addEnabled) {
        ChipSection.Builder section = new ChipSection.Builder().addItem(chip9("Play", true, play));
        if (addEnabled) section.addItem(chip9("Add to Up Next", false, addToUpNext));
        return section.build();
    }

    // ---- queue ---------------------------------------------------------------------------------

    /** The one non-clickable "Now playing" row. */
    public static Section<?> nowPlaying(Env env, Model.Track track) {
        RowSection.Builder section = new RowSection.Builder();
        titled(env, of(section), "Now playing", null, null, true);
        Row.Builder row = new Row.Builder().setTitle(nonEmpty(track.title, "Unknown title"))
            .setImage(env.art(track.artUrl), Row.IMAGE_TYPE_LARGE);
        if (!track.artist.isEmpty()) row.addText(track.artist);
        return section.addItem(row.build()).build();
    }

    /** Queue rows under a boundary header (section title on API 8, section header on API 9). */
    public static Section<?> queueRows(Env env, String title, List<QueueView.Row> rows, Consumer<QueueView.Row> onTap) {
        RowSection.Builder section = new RowSection.Builder();
        titled(env, of(section), title, null, null, true);
        for (QueueView.Row queued : rows) {
            Row.Builder row = new Row.Builder().setTitle(nonEmpty(queued.track.title, "Unknown title"))
                .setImage(env.art(queued.track.artUrl), Row.IMAGE_TYPE_LARGE);
            if (!queued.track.artist.isEmpty()) row.addText(queued.track.artist);
            if (queued.index >= 0) row.setOnClickListener(() -> onTap.accept(queued));
            section.addItem(row.build());
        }
        return section.build();
    }

    private Sections() { }
}
