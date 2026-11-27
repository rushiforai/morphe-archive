package app.template.extension.shatteredpixeldungeon;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Tags the player adds as many of as they like, each tied to a target: a kind of item for item tags, an action for quick tags. Keeps the
 * list, each tag's target and its screen tag. Only what a target is called, shows, looks like and does differs between kinds.
 */
final class TagList {

	interface Kind {
		String name(String target);

		String icon(String target);

		boolean shows(String target);

		void use(String target, IconTag tag);
	}

	interface TargetCheck {
		boolean isTrue(String target);
	}

	private static final class Changer {
		final String label;
		final IntAction change;
		final TargetCheck shows;

		Changer(String label, IntAction change, TargetCheck shows) {
			this.label = label;
			this.change = change;
			this.shows = shows;
		}
	}

	private final String prefix;
	private final String targetSuffix;
	private final TagPlacement.Side side;
	private final Kind kind;
	private final Map<Integer, ScreenTag> tags = new HashMap<>();
	private final List<Changer> changers = new ArrayList<>();

	/**
	 * [prefix] names the saved settings: its list, each tag's target under [targetSuffix], and its placement. New tags start on [side].
	 */
	TagList(String prefix, String targetSuffix, TagPlacement.Side side, Kind kind) {
		this.prefix = prefix;
		this.targetSuffix = targetSuffix;
		this.side = side;
		this.kind = kind;
	}

	/**
	 * Lets each tag's target be changed with [change], given the tag's id, from a button labeled [label] that shows while [shows] passes
	 * for the tag's target.
	 */
	TagList changeable(String label, IntAction change, TargetCheck shows) {
		changers.add(new Changer(label, change, shows));
		return this;
	}

	/**
	 * Makes the tag [id] stand for [target] instead, keeping its place and look.
	 */
	void setTarget(int id, String target) {
		CloverlordSettings.setString(targetKey(id), target);
		ScreenTag old = tags.remove(id);
		if (old != null) old.remove();
		ScreenTags.rebuild();
	}

	List<Integer> ids() {
		List<Integer> ids = new ArrayList<>();
		String stored = CloverlordSettings.getString(prefix + "_list");
		if (stored == null || stored.isEmpty()) return ids;
		for (String part : stored.split(",")) {
			try {
				ids.add(Integer.parseInt(part.trim()));
			} catch (NumberFormatException ignored) {
			}
		}
		return ids;
	}

	private void saveIds(List<Integer> ids) {
		StringBuilder text = new StringBuilder();
		for (int id : ids) {
			if (text.length() > 0) text.append(',');
			text.append(id);
		}
		CloverlordSettings.setString(prefix + "_list", text.toString());
		ScreenTags.rebuild();
	}

	/**
	 * Adds a tag for [target] and returns its id.
	 */
	int add(String target) {
		int id = Math.max(1, CloverlordSettings.getInt(prefix + "_next"));
		CloverlordSettings.setInt(prefix + "_next", id + 1);
		CloverlordSettings.setString(targetKey(id), target);
		List<Integer> ids = ids();
		ids.add(id);
		saveIds(ids);
		return id;
	}

	void delete(int id) {
		ScreenTag tag = tags.remove(id);
		if (tag != null) tag.remove();
		List<Integer> ids = ids();
		ids.remove(Integer.valueOf(id));
		saveIds(ids);
	}

	String target(int id) {
		String stored = CloverlordSettings.getString(targetKey(id));
		return stored == null ? "" : stored;
	}

	private String targetKey(int id) {
		return prefix + "_" + id + targetSuffix;
	}

	String name(int id) {
		return kind.name(target(id));
	}

	TagPlacement placement(int id) {
		return tag(id).placement;
	}

	/**
	 * The screen tag of [id], made the first time it is asked for. New tags start further along their edge than the ones before them.
	 */
	synchronized ScreenTag tag(int id) {
		ScreenTag tag = tags.get(id);
		if (tag != null) return tag;
		int position = Math.max(0, ids().indexOf(id));
		float share = Math.min(0.9f, 0.15f + 0.1f * position);
		TagPlacement placement = new TagPlacement(prefix + "_" + id, side, share, 1, kind.icon(target(id)), 0);
		tag = new ScreenTag(() -> name(id), placement, () -> kind.shows(target(id)), view -> kind.use(target(id), view))
			.removable("Remove this tag?", () -> delete(id));
		for (Changer changer : changers) tag.changeable(changer.label, () -> changer.change.run(id), () -> changer.shows.isTrue(target(id)));
		tags.put(id, tag);
		return tag;
	}

	/**
	 * Every tag in the list, in order.
	 */
	List<ScreenTag> tags() {
		List<ScreenTag> list = new ArrayList<>();
		for (int id : ids()) list.add(tag(id));
		return list;
	}

	/**
	 * Shows the tags whose check passes and hides the rest.
	 */
	void refresh() {
		for (ScreenTag tag : tags.values()) tag.refresh();
	}
}
