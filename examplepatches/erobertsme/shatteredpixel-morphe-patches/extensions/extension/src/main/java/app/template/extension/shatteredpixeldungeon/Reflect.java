package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.scenes.GameScene;
import com.shatteredpixel.shatteredpixeldungeon.ui.Window;
import com.shatteredpixel.shatteredpixeldungeon.windows.WndBag;
import com.watabou.noosa.Gizmo;
import com.watabou.noosa.Group;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/**
 * Cached access to the game's private fields and methods. Each lookup walks the class hierarchy once, then is remembered.
 */
final class Reflect {

	private static final Map<String, Field> fields = new HashMap<>();
	private static final Map<String, Method> methods = new HashMap<>();
	private static final Map<String, Class<?>> types = new HashMap<>();
	private static final Class<?> MISSING = Void.class;

	private Reflect() {
	}

	/**
	 * The field [name] declared on [type] or one of its superclasses, made accessible.
	 */
	static synchronized Field field(Class<?> type, String name) throws NoSuchFieldException {
		String key = type.getName() + '#' + name;
		Field cached = fields.get(key);
		if (cached != null) return cached;
		for (Class<?> current = type; current != null; current = current.getSuperclass()) {
			try {
				Field field = current.getDeclaredField(name);
				field.setAccessible(true);
				fields.put(key, field);
				return field;
			} catch (NoSuchFieldException ignored) {
			}
		}
		throw new NoSuchFieldException(type.getName() + "." + name);
	}

	/**
	 * The method [name] with [types] declared on [type] or one of its superclasses, made accessible.
	 */
	static synchronized Method method(Class<?> type, String name, Class<?>... types) throws NoSuchMethodException {
		String key = type.getName() + '#' + name + Arrays.toString(types);
		Method cached = methods.get(key);
		if (cached != null) return cached;
		for (Class<?> current = type; current != null; current = current.getSuperclass()) {
			try {
				Method method = current.getDeclaredMethod(name, types);
				method.setAccessible(true);
				methods.put(key, method);
				return method;
			} catch (NoSuchMethodException ignored) {
			}
		}
		throw new NoSuchMethodException(type.getName() + "." + name);
	}

	/**
	 * The field [name] declared on [type] itself, not a superclass, made accessible.
	 */
	static synchronized Field declaredField(Class<?> type, String name) throws NoSuchFieldException {
		String key = type.getName() + '!' + name;
		Field cached = fields.get(key);
		if (cached != null) return cached;
		Field field = type.getDeclaredField(name);
		field.setAccessible(true);
		fields.put(key, field);
		return field;
	}

	/**
	 * The method [name] with [types] declared on [type] itself, not a superclass, made accessible.
	 */
	static synchronized Method declaredMethod(Class<?> type, String name, Class<?>... types) throws NoSuchMethodException {
		String key = type.getName() + '!' + name + Arrays.toString(types);
		Method cached = methods.get(key);
		if (cached != null) return cached;
		Method method = type.getDeclaredMethod(name, types);
		method.setAccessible(true);
		methods.put(key, method);
		return method;
	}

	static Object get(Object target, String name) throws ReflectiveOperationException {
		return field(target.getClass(), name).get(target);
	}

	static Object get(Class<?> type, Object target, String name) throws ReflectiveOperationException {
		return field(type, name).get(target);
	}

	static Object getStatic(Class<?> type, String name) throws ReflectiveOperationException {
		return field(type, name).get(null);
	}

	static void set(Object target, String name, Object value) throws ReflectiveOperationException {
		field(target.getClass(), name).set(target, value);
	}

	static void set(Class<?> type, Object target, String name, Object value) throws ReflectiveOperationException {
		field(type, name).set(target, value);
	}

	static Object call(Object target, String name, Class<?>[] types, Object... args) throws ReflectiveOperationException {
		return method(target.getClass(), name, types).invoke(target, args);
	}

	static Object callStatic(Class<?> type, String name, Class<?>[] types, Object... args) throws ReflectiveOperationException {
		return method(type, name, types).invoke(null, args);
	}

	/**
	 * A window's width, as set by its last resize.
	 */
	static int width(Object window) throws ReflectiveOperationException {
		return field(Window.class, "width").getInt(window);
	}

	/**
	 * A window's height, as set by its last resize.
	 */
	static int height(Object window) throws ReflectiveOperationException {
		return field(Window.class, "height").getInt(window);
	}

	/**
	 * The live list of things in [group], such as the buttons and text of a window.
	 */
	@SuppressWarnings("unchecked")
	static ArrayList<Gizmo> members(Object group) throws ReflectiveOperationException {
		return (ArrayList<Gizmo>) field(Group.class, "members").get(group);
	}

	/**
	 * What a bag window was opened to pick an item for, such as a scroll choosing its target, or null when it was opened just to look.
	 */
	static WndBag.ItemSelector bagSelector(Object window) throws ReflectiveOperationException {
		return (WndBag.ItemSelector) field(WndBag.class, "selector").get(window);
	}

	/**
	 * The game scene's own [name] field, such as its toolbar or status pane, or null when no game scene is showing.
	 */
	static Object gameScenePart(String name) {
		try {
			Object scene = getStatic(GameScene.class, "scene");
			return scene == null ? null : field(GameScene.class, name).get(scene);
		} catch (ReflectiveOperationException e) {
			return null;
		}
	}

	/**
	 * The listener waiting for a tile to be tapped, such as a throw or zap waiting for its target, or null.
	 */
	static Object cellListener() {
		try {
			Object selector = getStatic(GameScene.class, "cellSelector");
			return selector == null ? null : get(selector, "listener");
		} catch (ReflectiveOperationException e) {
			return null;
		}
	}

	/**
	 * The class named [name], or null when this version of the game doesn't have it. Each name is looked up once, then remembered.
	 */
	static synchronized Class<?> type(String name) {
		Class<?> cached = types.get(name);
		if (cached != null) return cached == MISSING ? null : cached;
		Class<?> found;
		try {
			found = Class.forName(name);
		} catch (ClassNotFoundException | LinkageError e) {
			found = null;
		}
		types.put(name, found == null ? MISSING : found);
		return found;
	}

	/**
	 * Like [type], for code that treats a missing class as an error.
	 */
	static Class<?> require(String name) throws ClassNotFoundException {
		Class<?> found = type(name);
		if (found == null) throw new ClassNotFoundException(name);
		return found;
	}
}
