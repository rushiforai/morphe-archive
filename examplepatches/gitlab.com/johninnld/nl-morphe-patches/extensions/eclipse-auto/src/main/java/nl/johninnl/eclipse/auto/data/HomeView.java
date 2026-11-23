package nl.johninnl.eclipse.auto.data;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * What Home or Discover shows right now: a notice for the feed's state (signed out, offline, a
 * refresh that failed), the content blocks in the phone's order (the live stations sit where the
 * feed puts them), and for Home the Radio block that ends the page.
 */
public final class HomeView {
    /** The state banner, which is always first when present. */
    public enum Notice { NONE, SIGNED_OUT, REFRESH_FAILED, OFFLINE, UNAVAILABLE }

    /** True on the very first load: the template shows its loading state and nothing else. */
    public final boolean loading;
    public final Notice notice;
    public final List<Model.Section> sections;
    /** Radio category tiles; empty for Discover. */
    public final List<Model.Tile> categories;

    HomeView(boolean loading, Notice notice, List<Model.Section> sections, List<Model.Tile> categories) {
        this.loading = loading;
        this.notice = notice;
        this.sections = Collections.unmodifiableList(new ArrayList<>(sections));
        this.categories = Collections.unmodifiableList(new ArrayList<>(categories));
    }

    /** True when the page has nothing to draw below the destination selector. */
    public boolean empty() { return notice == Notice.NONE && sections.isEmpty() && categories.isEmpty(); }
}
