package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.actors.mobs.Mob;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

final class CreatureCatalog {

	static final int FAVORITES = 0;
	static final int ENEMIES = 1;
	static final int NPCS = 2;
	static final int OTHER = 3;

	static final String[] AREA_LABELS = { "Sewers", "Prison", "Caves", "City", "Vault", "Halls" };
	private static final int UNKNOWN_AREA = AREA_LABELS.length;

	private static final String[][] AREA_MOBS = {
		{ "Rat", "Albino", "Snake", "Gnoll", "GnollExile", "Swarm", "Crab", "HermitCrab", "GreatCrab", "Slime", "CausticSlime", "FetidRat", "GnollTrickster", "Goo",
			"Mimic", "GoldenMimic", "CrystalMimic", "EbonyMimic", "Statue", "ArmoredStatue", "Wraith", "TormentedSpirit", "Bee", "Piranha", "PhantomPiranha" },
		{ "Skeleton", "Thief", "Bandit", "DM100", "Guard", "Necromancer", "SpectralNecromancer", "Necromancer$NecroSkeleton", "RotHeart", "RotLasher",
			"Elemental$NewbornFireElemental", "Elemental$AllyNewBornElemental", "Tengu" },
		{ "Bat", "Brute", "ArmoredBrute", "Shaman$RedShaman", "Shaman$BlueShaman", "Shaman$PurpleShaman", "Spinner", "DM200", "DM201", "GnollGuard",
			"GnollSapper", "GnollGeomancer", "CrystalWisp", "CrystalGuardian", "CrystalSpire", "FungalSpinner", "FungalSentry", "FungalCore", "Pylon", "DM300" },
		{ "Ghoul", "Elemental$FireElemental", "Elemental$FrostElemental", "Elemental$ShockElemental", "Elemental$ChaosElemental", "Warlock", "Monk", "Senior",
			"Golem", "DwarfKing", "DwarfKing$DKGhoul", "DwarfKing$DKMonk", "DwarfKing$DKWarlock", "DwarfKing$DKGolem" },
		{ "quest.vault.VaultRat", "quest.vault.VaultSkeleton", "quest.vault.VaultDM100", "quest.vault.VaultShaman", "quest.vault.VaultDM200",
			"quest.vault.VaultGhoul", "quest.vault.VaultGolem", "quest.vault.VaultElemental$Fire", "quest.vault.VaultElemental$Frost",
			"quest.vault.VaultElemental$Shock", "quest.vault.VaultBossElemental" },
		{ "Succubus", "Eye", "Scorpio", "Acidic", "RipperDemon", "DemonSpawner", "YogDzewa", "YogDzewa$Larva", "YogDzewa$YogEye", "YogDzewa$YogRipper",
			"YogDzewa$YogScorpio", "YogFist$BrightFist", "YogFist$BurningFist", "YogFist$DarkFist", "YogFist$RottingFist", "YogFist$RustedFist", "YogFist$SoiledFist" },
	};
	private static final String MOBS_PACKAGE = "com.shatteredpixel.shatteredpixeldungeon.actors.mobs.";

	static final class Entry {
		final Class<? extends Mob> type;
		final String name;
		final int kind;
		final int area;

		Entry(Class<? extends Mob> type, String name, int kind) {
			this.type = type;
			this.name = name;
			this.kind = kind;
			this.area = areaOf(type.getName());
		}
	}

	/**
	 * The first area of the dungeon a creature can appear in, as an index into [AREA_LABELS], so the list follows the order you meet them.
	 */
	static int areaOf(String className) {
		if (!className.startsWith(MOBS_PACKAGE)) return UNKNOWN_AREA;
		String name = className.substring(MOBS_PACKAGE.length());
		for (int area = 0; area < AREA_MOBS.length; area++) {
			for (String mob : AREA_MOBS[area]) if (mob.equals(name)) return area;
		}
		return UNKNOWN_AREA;
	}

	/**
	 * Where the first of [entries] from [area] sits in the list, or -1 when there are none.
	 */
	static int firstInArea(List<Entry> entries, int area) {
		for (int i = 0; i < entries.size(); i++) if (entries.get(i).area == area) return i;
		return -1;
	}

	private static List<Entry> catalog;
	private static final CatalogTabs<Entry> tabs = new CatalogTabs<>();

	private CreatureCatalog() {
	}

	static synchronized List<Entry> catalog() {
		if (catalog != null) return catalog;
		Map<String, Entry> byName = new LinkedHashMap<>();
		for (String className : MobClasses.NAMES) {
			Entry entry = load(className);
			if (entry == null) continue;
			String key = entry.name.toLowerCase(Locale.ENGLISH) + "#" + entry.kind + "#" + entry.area;
			Entry existing = byName.get(key);
			if (existing == null || entry.type.getName().length() < existing.type.getName().length()) byName.put(key, entry);
		}
		List<Entry> entries = new ArrayList<>(byName.values());
		Collections.sort(entries, (a, b) -> a.area != b.area ? Integer.compare(a.area, b.area) : a.name.compareToIgnoreCase(b.name));
		catalog = entries;
		return catalog;
	}

	static List<Entry> catalog(int kind) {
		if (kind == FAVORITES) return CatalogTabs.live(catalog(), entry -> Favorites.isCreature(entry.type.getName()));
		return tabs.tab(kind, catalog(), entry -> entry.kind == kind);
	}

	@SuppressWarnings("unchecked")
	private static Entry load(String className) {
		try {
			Class<?> type = Reflect.require(className);
			if (!Mob.class.isAssignableFrom(type)) return null;
			Mob sample = (Mob) type.getConstructor().newInstance();
			String name = sample.name();
			if (name == null || name.isEmpty() || name.startsWith("!!!")) return null;
			int kind = className.contains(".actors.mobs.npcs.") ? NPCS : className.startsWith("com.shatteredpixel.shatteredpixeldungeon.actors.mobs.") ? ENEMIES : OTHER;
			return new Entry((Class<? extends Mob>) type, InventoryEditor.capitalize(name), kind);
		} catch (Throwable e) {
			return null;
		}
	}
}
