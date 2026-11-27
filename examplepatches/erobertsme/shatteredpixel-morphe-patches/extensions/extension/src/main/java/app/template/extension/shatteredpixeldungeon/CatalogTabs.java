package app.template.extension.shatteredpixeldungeon;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * A fixed catalog's entries split into the tabs a picker shows, each tab worked out the first time it is opened and kept. Favorites change,
 * so they are picked out every time with [live].
 */
final class CatalogTabs<E> {

	interface Matcher<E> {
		boolean matches(E entry);
	}

	private final Map<Object, List<E>> tabs = new HashMap<>();

	/**
	 * The entries of [all] in the tab [key], the ones [matcher] picks, kept after the first time.
	 */
	synchronized List<E> tab(Object key, List<E> all, Matcher<E> matcher) {
		List<E> cached = tabs.get(key);
		if (cached != null) return cached;
		List<E> found = Collections.unmodifiableList(live(all, matcher));
		tabs.put(key, found);
		return found;
	}

	/**
	 * The entries of [all] that [matcher] picks right now.
	 */
	static <E> List<E> live(List<E> all, Matcher<E> matcher) {
		List<E> found = new ArrayList<>();
		for (E entry : all) {
			if (matcher.matches(entry)) found.add(entry);
		}
		return found;
	}
}
