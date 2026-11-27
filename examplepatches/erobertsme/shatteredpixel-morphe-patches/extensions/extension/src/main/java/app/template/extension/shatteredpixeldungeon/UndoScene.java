package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.Actor;
import com.shatteredpixel.shatteredpixeldungeon.Statistics;
import com.shatteredpixel.shatteredpixeldungeon.actors.Char;
import com.shatteredpixel.shatteredpixeldungeon.actors.blobs.Blob;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.HeroClass;
import com.shatteredpixel.shatteredpixeldungeon.actors.mobs.Mob;
import com.shatteredpixel.shatteredpixeldungeon.items.Heap;
import com.shatteredpixel.shatteredpixeldungeon.levels.Level;
import com.shatteredpixel.shatteredpixeldungeon.levels.Terrain;
import com.shatteredpixel.shatteredpixeldungeon.sprites.HeroSprite;
import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSprite;
import com.shatteredpixel.shatteredpixeldungeon.utils.GLog;
import com.watabou.noosa.Camera;
import com.watabou.noosa.ColorBlock;
import com.watabou.noosa.Gizmo;
import com.watabou.noosa.Image;
import com.watabou.noosa.SkinnedBlock;
import com.watabou.noosa.TextureFilm;
import com.watabou.noosa.Tilemap;
import com.watabou.noosa.Visual;
import com.watabou.utils.RectF;
import com.watabou.utils.Signal;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

/**
 * What an undo step looked like, copied from the game when the step is taken: the dungeon tiles around the hero, the creatures and items in view, a
 * simple map of the floor and the game log lines from that action. It is drawn again with the game's own tiles and sprites.
 */
final class UndoScene {

	static final int AREA = 11;
	private static final int OLD_AREA = 9;
	private static final int WEB = 1;
	private static final int WEB_COLOR = 0x80CCCCCC;
	private static final int WEB_STRANDS = 3;
	private static final float WEB_LENGTH = 14f;
	private static final int TILE = 16;
	private static final String FEATURES_TEX = "environment/terrain_features.png";
	private static final int MAX_LINES = 4;
	private static final float SPRITE_RAISE = 6f / 16f;
	private static final int REMEMBERED_FOG = 0x99000000;
	private static final int UNKNOWN_FOG = 0xFF000000;

	private static final byte FOG_UNKNOWN = 0;
	private static final byte FOG_REMEMBERED = 1;
	private static final byte FOG_VISIBLE = 2;

	static final byte MAP_UNKNOWN = 0;
	static final byte MAP_WALL = 1;
	static final byte MAP_FLOOR = 2;
	static final byte MAP_WATER = 3;
	static final byte MAP_CHASM = 4;
	static final byte MAP_DOOR = 5;
	static final byte MAP_STAIRS = 6;
	private static final int[] MAP_COLORS = { 0, 0xFF4A443D, 0xFF8C826F, 0xFF3F6E9A, 0xFF16141A, 0xFF9A6A3A, 0xFFE0C050 };
	private static final int HERO_COLOR = 0xFFFFFFFF;
	private static final int ENEMY_COLOR = 0xFFE04040;
	private static final int ALLY_COLOR = 0xFF50D050;
	private static final int NEUTRAL_COLOR = 0xFFE0E040;
	private static final int ITEM_COLOR = 0xFFFFA020;
	private static final int OUTLINE_COLOR = 0xCCFFFFFF;
	private static final int DEFAULT_EFFECT_COLOR = 0x80808080;
	private static final java.util.Map<String, Integer> EFFECT_COLORS = new java.util.HashMap<>();

	static {
		EFFECT_COLORS.put("Fire", 0x99FF6020);
		EFFECT_COLORS.put("Inferno", 0x99FF4010);
		EFFECT_COLORS.put("VaultFlameTraps", 0x99FF6020);
		EFFECT_COLORS.put("SacrificialFire", 0x99FF4080);
		EFFECT_COLORS.put("ToxicGas", 0x8860B030);
		EFFECT_COLORS.put("ParalyticGas", 0x88E0E040);
		EFFECT_COLORS.put("ConfusionGas", 0x88A060C0);
		EFFECT_COLORS.put("CorrosiveGas", 0x88C06020);
		EFFECT_COLORS.put("StenchGas", 0x88707020);
		EFFECT_COLORS.put("SmokeScreen", 0x99505050);
		EFFECT_COLORS.put("StormCloud", 0x888090A0);
		EFFECT_COLORS.put("Electricity", 0x8860E0FF);
		EFFECT_COLORS.put("Freezing", 0x88A0D8FF);
		EFFECT_COLORS.put("Blizzard", 0x88C0E8FF);
		EFFECT_COLORS.put("Web", WEB);
		EFFECT_COLORS.put("Regrowth", 0x6640A040);
		EFFECT_COLORS.put("GooWarn", 0x88402040);
		EFFECT_COLORS.put("Foliage", 0);
		EFFECT_COLORS.put("Alchemy", 0);
		EFFECT_COLORS.put("WellWater", 0);
	}

	private static final class Figure {
		final String spriteClass;
		final RectF frame;
		final boolean flipped;
		final int cell;

		Figure(String spriteClass, RectF frame, boolean flipped, int cell) {
			this.spriteClass = spriteClass;
			this.frame = frame;
			this.flipped = flipped;
			this.cell = cell;
		}
	}

	private static final class Layer {
		static final int GROUND = 0;
		static final int TERRAIN = 1;
		static final int WALLS = 2;

		final int kind;
		final String texture;
		final int[] data;

		Layer(int kind, String texture, int[] data) {
			this.kind = kind;
			this.texture = texture;
			this.data = data;
		}
	}

	private static final class Marker {
		final int pos;
		final int color;

		Marker(int pos, int color) {
			this.pos = pos;
			this.color = color;
		}
	}

	private String tilesTex;
	private String waterTex;
	private int[] tiles;
	private int[] walls;
	private int[] features;
	private boolean[] water;
	private byte[] fog;
	private String heroClass;
	private int heroTier;
	private final List<Figure> figures = new ArrayList<>();
	private final List<Figure> heaps = new ArrayList<>();
	private final List<Layer> layers = new ArrayList<>();
	private int[] effects;
	private int area = AREA;
	int depth = -1;
	int turn = -1;
	private int mapWidth;
	private int mapHeight;
	private byte[] map;
	private int heroPos;
	private int areaLeft;
	private int areaTop;
	private final List<Marker> markers = new ArrayList<>();
	/**
	 * What the preview shows about the hero, or null for scenes kept before it was.
	 */
	HeroCard hero;
	final List<String> lines = new ArrayList<>();

	private static final List<String> pendingLines = new ArrayList<>();
	private static final Signal.Listener<String> logListener = text -> {
		if (text == null || text.equals(GLog.NEW_LINE) || text.trim().isEmpty()) return false;
		synchronized (pendingLines) {
			pendingLines.add(text);
			while (pendingLines.size() > MAX_LINES) pendingLines.remove(0);
		}
		return false;
	};

	private UndoScene() {
	}

	/**
	 * Starts listening to the game log. Called each time the game scene is made, after the game's own log has replaced the listeners.
	 */
	static void listen() {
		GLog.update.remove(logListener);
		GLog.update.add(logListener);
	}

	/**
	 * Forgets log lines that came from loading a step rather than from an action.
	 */
	static void discardLines() {
		synchronized (pendingLines) {
			pendingLines.clear();
		}
	}

	/**
	 * Copies what the game looks like now. Returns null if it can't be read.
	 */
	static UndoScene capture() {
		return capture(true);
	}

	/**
	 * Copies what the game looks like now. With [takeLines], the log lines gathered so far belong to this copy and the next copy starts afresh.
	 */
	static UndoScene capture(boolean takeLines) {
		UndoScene scene = new UndoScene();
		synchronized (pendingLines) {
			scene.lines.addAll(pendingLines);
			if (takeLines) pendingLines.clear();
		}
		try {
			Hero hero = Dungeon.hero;
			Level level = Dungeon.level;
			if (hero == null || level == null) return scene;
			scene.depth = Dungeon.depth;
			scene.turn = (int) (Statistics.duration + Actor.now());
			scene.captureArea(hero, level);
			scene.captureMap(hero, level);
			scene.hero = HeroCard.of(hero);
		} catch (Throwable e) {
			Log.e("UndoScene", "Could not copy the scene", e);
			scene.tiles = null;
			scene.map = null;
		}
		return scene;
	}

	private void captureArea(Hero hero, Level level) throws ReflectiveOperationException {
		int width = level.width();
		int height = level.height();
		areaLeft = hero.pos % width - area / 2;
		areaTop = hero.pos / width - area / 2;
		int[] levelTiles = tilemapData("tiles");
		int[] levelWalls = tilemapData("walls");
		int[] levelFeatures = tilemapData("terrainFeatures");
		tilesTex = level.tilesTex();
		waterTex = level.waterTex();
		tiles = new int[area * area];
		walls = new int[area * area];
		features = new int[area * area];
		water = new boolean[area * area];
		fog = new byte[area * area];
		for (int y = 0; y < area; y++) {
			for (int x = 0; x < area; x++) {
				int i = y * area + x;
				int cx = areaLeft + x;
				int cy = areaTop + y;
				tiles[i] = -1;
				walls[i] = -1;
				features[i] = -1;
				if (cx < 0 || cy < 0 || cx >= width || cy >= height) continue;
				int cell = cy * width + cx;
				if (levelTiles != null && cell < levelTiles.length) tiles[i] = levelTiles[cell];
				if (levelWalls != null && cell < levelWalls.length) walls[i] = levelWalls[cell];
				if (levelFeatures != null && cell < levelFeatures.length) features[i] = levelFeatures[cell];
				water[i] = level.water[cell];
				fog[i] = level.heroFOV[cell] ? FOG_VISIBLE : level.visited[cell] || level.mapped[cell] ? FOG_REMEMBERED : FOG_UNKNOWN;
			}
		}
		heroClass = hero.heroClass.name();
		heroTier = hero.tier();
		for (Mob mob : level.mobs.toArray(new Mob[0])) {
			int i = areaIndex(mob.pos, width);
			if (i < 0 || fog[i] != FOG_VISIBLE || mob.sprite == null || !mob.sprite.visible || mob.invisible > 0) continue;
			RectF frame = mob.sprite.frame();
			if (frame == null) continue;
			figures.add(new Figure(mob.sprite.getClass().getName(), new RectF(frame.left, frame.top, frame.right, frame.bottom), mob.sprite.flipHorizontal, i));
		}
		captureLayers(level, width, height);
		captureEffects(level, width, height);
		for (Heap heap : level.heaps.valueList()) {
			int i = areaIndex(heap.pos, width);
			if (i < 0 || fog[i] == FOG_UNKNOWN || !heap.seen || heap.sprite == null) continue;
			RectF frame = heap.sprite.frame();
			if (frame == null) continue;
			heaps.add(new Figure(null, new RectF(frame.left, frame.top, frame.right, frame.bottom), false, i));
		}
	}

	private void captureLayers(Level level, int width, int height) {
		addLayers(level, "customTiles", Layer.GROUND, width, height);
		addLayers(level, "customTerrain", Layer.TERRAIN, width, height);
		addLayers(level, "customWalls", Layer.WALLS, width, height);
	}

	/**
	 * Copies the part of each special tile picture in the level's [field] list that overlaps the area, such as the prison boss arena.
	 */
	private void addLayers(Level level, String field, int kind, int width, int height) {
		try {
			Field listField = Reflect.field(Level.class, field);
			Object list = listField.get(level);
			if (!(list instanceof Iterable)) return;
			for (Object custom : (Iterable<?>) list) {
				if (custom == null) continue;
				Class<?> type = Reflect.require("com.shatteredpixel.shatteredpixeldungeon.tiles.CustomTilemap");
				Object texture = readField(type, custom, "texture");
				Object vis = readField(type, custom, "vis");
				if (!(texture instanceof String) || vis == null) continue;
				Field dataField = Reflect.field(Tilemap.class, "data");
				int[] source = (int[]) dataField.get(vis);
				if (source == null) continue;
				int tileX = (int) readField(type, custom, "tileX");
				int tileY = (int) readField(type, custom, "tileY");
				int tileW = (int) readField(type, custom, "tileW");
				int[] data = new int[area * area];
				boolean any = false;
				for (int i = 0; i < data.length; i++) {
					data[i] = -1;
					int cx = areaLeft + i % area - tileX;
					int cy = areaTop + i / area - tileY;
					if (cx < 0 || cy < 0 || cx >= tileW) continue;
					int at = cy * tileW + cx;
					if (at >= source.length) continue;
					data[i] = source[at];
					if (data[i] >= 0) any = true;
				}
				if (any) layers.add(new Layer(kind, (String) texture, data));
			}
		} catch (Throwable e) {
			Log.e("UndoScene", "Could not copy " + field, e);
		}
	}

	private static Object readField(Class<?> type, Object target, String name) throws ReflectiveOperationException {
		Field field = Reflect.field(type, name);
		return field.get(target);
	}

	/**
	 * Notes the color of the area effect on each tile of the area that the hero could see, or that is always visible.
	 */
	private void captureEffects(Level level, int width, int height) {
		if (level.blobs == null) return;
		effects = new int[area * area];
		for (Blob blob : level.blobs.values()) {
			if (blob == null || blob.volume <= 0 || blob.cur == null) continue;
			int color = effectColor(blob);
			if (color == 0) continue;
			for (int i = 0; i < effects.length; i++) {
				int cx = areaLeft + i % area;
				int cy = areaTop + i / area;
				if (cx < 0 || cy < 0 || cx >= width || cy >= height) continue;
				int cell = cy * width + cx;
				if (blob.cur[cell] <= 0) continue;
				if (fog[i] != FOG_VISIBLE && !blob.alwaysVisible) continue;
				effects[i] = color;
			}
		}
	}

	private static int effectColor(Blob blob) {
		for (Class<?> type = blob.getClass(); type != null && type != Blob.class; type = type.getSuperclass()) {
			Integer color = EFFECT_COLORS.get(type.getSimpleName());
			if (color != null) return color;
		}
		return DEFAULT_EFFECT_COLOR;
	}

	private int areaIndex(int pos, int width) {
		int x = pos % width - areaLeft;
		int y = pos / width - areaTop;
		if (x < 0 || y < 0 || x >= area || y >= area) return -1;
		return y * area + x;
	}

	/**
	 * The tile numbers of one of the game scene's tile layers. Only read, never changed.
	 */
	private static int[] tilemapData(String name) throws ReflectiveOperationException {
		Object layer = Reflect.gameScenePart(name);
		return layer == null ? null : (int[]) Reflect.get(Tilemap.class, layer, "data");
	}

	private void captureMap(Hero hero, Level level) {
		mapWidth = level.width();
		mapHeight = level.height();
		heroPos = hero.pos;
		int length = level.length();
		map = new byte[length];
		for (int i = 0; i < length; i++) {
			if (!level.visited[i] && !level.mapped[i]) continue;
			int terrain = level.map[i];
			if (terrain == Terrain.ENTRANCE || terrain == Terrain.ENTRANCE_SP || terrain == Terrain.EXIT || terrain == Terrain.UNLOCKED_EXIT) {
				map[i] = MAP_STAIRS;
			} else if (terrain == Terrain.DOOR || terrain == Terrain.OPEN_DOOR || terrain == Terrain.LOCKED_DOOR || terrain == Terrain.CRYSTAL_DOOR) {
				map[i] = MAP_DOOR;
			} else if (level.solid[i]) {
				map[i] = MAP_WALL;
			} else if (level.pit[i]) {
				map[i] = MAP_CHASM;
			} else if (level.water[i]) {
				map[i] = MAP_WATER;
			} else {
				map[i] = MAP_FLOOR;
			}
		}
		for (Heap heap : level.heaps.valueList()) {
			if (heap.seen && map[heap.pos] != MAP_UNKNOWN) markers.add(new Marker(heap.pos, ITEM_COLOR));
		}
		for (Mob mob : level.mobs.toArray(new Mob[0])) {
			if (!level.heroFOV[mob.pos] || mob.invisible > 0) continue;
			int color = mob.alignment == Char.Alignment.ALLY ? ALLY_COLOR : mob.alignment == Char.Alignment.ENEMY ? ENEMY_COLOR : NEUTRAL_COLOR;
			markers.add(new Marker(mob.pos, color));
		}
		markers.add(new Marker(hero.pos, HERO_COLOR));
	}

	private static final int FORMAT = 6;

	/**
	 * Writes this scene to [out], to be read back with [read].
	 */
	void write(DataOutputStream out) throws IOException {
		out.writeInt(FORMAT);
		out.writeInt(area);
		out.writeInt(depth);
		out.writeInt(turn);
		out.writeBoolean(tiles != null);
		if (tiles != null) {
			out.writeUTF(tilesTex == null ? "" : tilesTex);
			out.writeUTF(waterTex == null ? "" : waterTex);
			writeInts(out, tiles);
			writeInts(out, walls);
			writeInts(out, features);
			for (boolean wet : water) out.writeBoolean(wet);
			out.write(fog);
			out.writeUTF(heroClass == null ? "" : heroClass);
			out.writeInt(heroTier);
			out.writeInt(areaLeft);
			out.writeInt(areaTop);
			writeFigures(out, figures);
			writeFigures(out, heaps);
			out.writeInt(layers.size());
			for (Layer layer : layers) {
				out.writeInt(layer.kind);
				out.writeUTF(layer.texture);
				writeInts(out, layer.data);
			}
			out.writeBoolean(effects != null);
			if (effects != null) writeInts(out, effects);
		}
		out.writeBoolean(map != null);
		if (map != null) {
			out.writeInt(mapWidth);
			out.writeInt(mapHeight);
			out.writeInt(heroPos);
			out.writeInt(map.length);
			out.write(map);
			out.writeInt(markers.size());
			for (Marker marker : markers) {
				out.writeInt(marker.pos);
				out.writeInt(marker.color);
			}
		}
		out.writeInt(lines.size());
		for (String line : lines) out.writeUTF(line);
		out.writeBoolean(hero != null);
		if (hero != null) hero.write(out);
	}

	/**
	 * Reads a scene written by [write], or returns null if it can't be read.
	 */
	static UndoScene read(DataInputStream in) {
		try {
			int format = in.readInt();
			if (format < 1 || format > FORMAT) return null;
			UndoScene scene = new UndoScene();
			scene.area = format >= 3 ? in.readInt() : OLD_AREA;
			if (format >= 4) {
				scene.depth = in.readInt();
				scene.turn = in.readInt();
			}
			if (in.readBoolean()) {
				scene.tilesTex = in.readUTF();
				String water = in.readUTF();
				scene.waterTex = water.isEmpty() ? null : water;
				scene.tiles = readInts(in, scene.area * scene.area);
				scene.walls = readInts(in, scene.area * scene.area);
				scene.features = readInts(in, scene.area * scene.area);
				scene.water = new boolean[scene.area * scene.area];
				for (int i = 0; i < scene.water.length; i++) scene.water[i] = in.readBoolean();
				scene.fog = new byte[scene.area * scene.area];
				in.readFully(scene.fog);
				scene.heroClass = in.readUTF();
				scene.heroTier = in.readInt();
				scene.areaLeft = in.readInt();
				scene.areaTop = in.readInt();
				readFigures(in, scene.figures);
				readFigures(in, scene.heaps);
				if (format >= 2) {
					int layers = in.readInt();
					for (int i = 0; i < layers; i++) scene.layers.add(new Layer(in.readInt(), in.readUTF(), readInts(in, scene.area * scene.area)));
					if (in.readBoolean()) scene.effects = readInts(in, scene.area * scene.area);
				}
			}
			if (in.readBoolean()) {
				scene.mapWidth = in.readInt();
				scene.mapHeight = in.readInt();
				scene.heroPos = in.readInt();
				scene.map = new byte[in.readInt()];
				in.readFully(scene.map);
				int markers = in.readInt();
				for (int i = 0; i < markers; i++) scene.markers.add(new Marker(in.readInt(), in.readInt()));
			}
			int lines = in.readInt();
			for (int i = 0; i < lines; i++) scene.lines.add(in.readUTF());
			if (format >= 5 && in.readBoolean()) scene.hero = HeroCard.read(in, format);
			return scene;
		} catch (Throwable e) {
			Log.e("UndoScene", "Could not read a scene", e);
			return null;
		}
	}

	private static void writeInts(DataOutputStream out, int[] values) throws IOException {
		for (int value : values) out.writeInt(value);
	}

	private static int[] readInts(DataInputStream in, int count) throws IOException {
		int[] values = new int[count];
		for (int i = 0; i < count; i++) values[i] = in.readInt();
		return values;
	}

	private static void writeFigures(DataOutputStream out, List<Figure> list) throws IOException {
		out.writeInt(list.size());
		for (Figure figure : list) {
			out.writeUTF(figure.spriteClass == null ? "" : figure.spriteClass);
			out.writeFloat(figure.frame.left);
			out.writeFloat(figure.frame.top);
			out.writeFloat(figure.frame.right);
			out.writeFloat(figure.frame.bottom);
			out.writeBoolean(figure.flipped);
			out.writeInt(figure.cell);
		}
	}

	private static void readFigures(DataInputStream in, List<Figure> list) throws IOException {
		int count = in.readInt();
		for (int i = 0; i < count; i++) {
			String spriteClass = in.readUTF();
			RectF frame = new RectF(in.readFloat(), in.readFloat(), in.readFloat(), in.readFloat());
			boolean flipped = in.readBoolean();
			int cell = in.readInt();
			list.add(new Figure(spriteClass.isEmpty() ? null : spriteClass, frame, flipped, cell));
		}
	}

	boolean hasArea() {
		return tiles != null;
	}

	boolean hasMap() {
		return map != null;
	}

	/**
	 * The first log line, without its color mark.
	 */
	String firstLine() {
		return lines.isEmpty() ? null : plain(lines.get(0));
	}

	static String plain(String line) {
		for (String prefix : new String[] { GLog.POSITIVE, GLog.NEGATIVE, GLog.WARNING, GLog.HIGHLIGHT }) {
			if (line.startsWith(prefix)) return line.substring(prefix.length());
		}
		return line;
	}

	static int lineColor(String line) {
		if (line.startsWith(GLog.POSITIVE)) return 0x44FF44;
		if (line.startsWith(GLog.NEGATIVE)) return 0xFF4444;
		if (line.startsWith(GLog.WARNING)) return 0xFF8800;
		if (line.startsWith(GLog.HIGHLIGHT)) return 0xFFFF44;
		return 0xFFFFFF;
	}

	/**
	 * Draws the area around the hero into [out], [size] wide, with its top left corner at [x], [y].
	 */
	void drawArea(List<Gizmo> out, Camera camera, float x, float y, float size) {
		float scale = size / (area * TILE);
		if (waterTex != null) {
			SkinnedBlock waterBlock = new SkinnedBlock(area * TILE, area * TILE, waterTex);
			place(out, waterBlock, camera, x, y, scale);
		}
		Tilemap ground = new Tilemap(tilesTex, new TextureFilm(tilesTex, TILE, TILE));
		ground.map(tiles.clone(), area);
		place(out, ground, camera, x, y, scale);
		drawLayers(out, camera, x, y, scale, Layer.GROUND);
		Tilemap grass = new Tilemap(FEATURES_TEX, new TextureFilm(FEATURES_TEX, TILE, TILE));
		grass.map(features.clone(), area);
		place(out, grass, camera, x, y, scale);
		drawLayers(out, camera, x, y, scale, Layer.TERRAIN);
		for (Figure heap : heaps) {
			try {
				Image image = new Image(new ItemSprite(0));
				image.frame(heap.frame);
				float px = (heap.cell % area) * TILE + (TILE - image.width()) / 2f;
				float py = (heap.cell / area) * TILE + (TILE - image.height()) / 2f;
				place(out, image, camera, x + px * scale, y + py * scale, scale);
			} catch (Throwable e) {
				Log.e("UndoScene", "Could not draw an item", e);
			}
		}
		for (Figure figure : figures) {
			Image image = figureImage(figure);
			if (image != null) placeFigure(out, image, camera, figure.cell, x, y, scale);
		}
		Image hero = heroImage();
		if (hero != null) placeFigure(out, hero, camera, (area / 2) * area + area / 2, x, y, scale);
		Tilemap raised = new Tilemap(tilesTex, new TextureFilm(tilesTex, TILE, TILE));
		raised.map(walls.clone(), area);
		place(out, raised, camera, x, y, scale);
		drawLayers(out, camera, x, y, scale, Layer.WALLS);
		if (effects != null) {
			for (int i = 0; i < effects.length; i++) {
				if (effects[i] == 0) continue;
				if (effects[i] == WEB) {
					drawWeb(out, camera, x, y, scale, i);
					continue;
				}
				ColorBlock cloud = new ColorBlock(TILE, TILE, effects[i]);
				place(out, cloud, camera, x + (i % area) * TILE * scale, y + (i / area) * TILE * scale, scale);
			}
		}
		for (int i = 0; i < fog.length; i++) {
			if (fog[i] == FOG_VISIBLE) continue;
			ColorBlock shade = new ColorBlock(TILE, TILE, fog[i] == FOG_UNKNOWN ? UNKNOWN_FOG : REMEMBERED_FOG);
			place(out, shade, camera, x + (i % area) * TILE * scale, y + (i / area) * TILE * scale, scale);
		}
	}

	/**
	 * A few faint strands across the tile, the way the game draws webs.
	 */
	private void drawWeb(List<Gizmo> out, Camera camera, float x, float y, float scale, int i) {
		float centerX = x + ((i % area) + 0.5f) * TILE * scale;
		float centerY = y + ((i / area) + 0.5f) * TILE * scale;
		for (int k = 0; k < WEB_STRANDS; k++) {
			ColorBlock strand = new ColorBlock(1, WEB_LENGTH, WEB_COLOR);
			strand.origin.set(0.5f, 0.5f);
			strand.angle = (i * 47 + k * 60) % 180;
			place(out, strand, camera, centerX - 0.5f, centerY - 0.5f, scale);
		}
	}

	private void drawLayers(List<Gizmo> out, Camera camera, float x, float y, float scale, int kind) {
		for (Layer layer : layers) {
			if (layer.kind != kind) continue;
			try {
				Tilemap map = new Tilemap(layer.texture, new TextureFilm(layer.texture, TILE, TILE));
				map.map(layer.data.clone(), area);
				place(out, map, camera, x, y, scale);
			} catch (Throwable e) {
				Log.e("UndoScene", "Could not draw " + layer.texture, e);
			}
		}
	}

	private Image figureImage(Figure figure) {
		try {
			Image sprite = (Image) Reflect.require(figure.spriteClass).getConstructor().newInstance();
			Image image = new Image(sprite);
			image.frame(figure.frame);
			image.flipHorizontal = figure.flipped;
			return image;
		} catch (Throwable e) {
			Log.e("UndoScene", "Could not draw " + figure.spriteClass, e);
			return null;
		}
	}

	private Image heroImage() {
		try {
			return HeroSprite.avatar(HeroClass.valueOf(heroClass), heroTier);
		} catch (Throwable e) {
			Log.e("UndoScene", "Could not draw the hero", e);
			return null;
		}
	}

	private void placeFigure(List<Gizmo> out, Image image, Camera camera, int cell, float x, float y, float scale) {
		float px = (cell % area + 0.5f) * TILE - image.width() / 2f;
		float py = (cell / area + 1f) * TILE - image.height() - SPRITE_RAISE * TILE;
		place(out, image, camera, x + px * scale, y + py * scale, scale);
	}

	/**
	 * Draws the explored floor as colored squares into [out], fitting a [size] square with its top left corner at [x], [y].
	 */
	void drawMap(List<Gizmo> out, Camera camera, float x, float y, float size) {
		float cell = size / Math.max(mapWidth, mapHeight);
		float offsetX = x + (size - cell * mapWidth) / 2f;
		float offsetY = y + (size - cell * mapHeight) / 2f;
		for (int row = 0; row < mapHeight; row++) {
			int start = 0;
			while (start < mapWidth) {
				byte kind = map[row * mapWidth + start];
				int end = start + 1;
				while (end < mapWidth && map[row * mapWidth + end] == kind) end++;
				if (kind != MAP_UNKNOWN) {
					ColorBlock block = new ColorBlock((end - start) * cell, cell, MAP_COLORS[kind]);
					place(out, block, camera, offsetX + start * cell, offsetY + row * cell, 1f);
				}
				start = end;
			}
		}
		if (tiles != null) {
			float left = offsetX + Math.max(0, areaLeft) * cell;
			float top = offsetY + Math.max(0, areaTop) * cell;
			float right = offsetX + Math.min(mapWidth, areaLeft + area) * cell;
			float bottom = offsetY + Math.min(mapHeight, areaTop + area) * cell;
			float line = Math.max(1f, cell / 3f);
			place(out, new ColorBlock(right - left, line, OUTLINE_COLOR), camera, left, top, 1f);
			place(out, new ColorBlock(right - left, line, OUTLINE_COLOR), camera, left, bottom - line, 1f);
			place(out, new ColorBlock(line, bottom - top, OUTLINE_COLOR), camera, left, top, 1f);
			place(out, new ColorBlock(line, bottom - top, OUTLINE_COLOR), camera, right - line, top, 1f);
		}
		float dot = Math.max(cell, 2f);
		for (Marker marker : markers) {
			float mx = offsetX + (marker.pos % mapWidth) * cell + (cell - dot) / 2f;
			float my = offsetY + (marker.pos / mapWidth) * cell + (cell - dot) / 2f;
			place(out, new ColorBlock(dot, dot, marker.color), camera, mx, my, 1f);
		}
	}

	private static void place(List<Gizmo> out, Visual visual, Camera camera, float x, float y, float scale) {
		visual.camera = camera;
		visual.x = x;
		visual.y = y;
		visual.scale.x *= scale;
		visual.scale.y *= scale;
		out.add(visual);
	}
}
