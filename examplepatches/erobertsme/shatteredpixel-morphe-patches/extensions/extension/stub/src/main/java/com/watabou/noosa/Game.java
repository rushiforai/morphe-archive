package com.watabou.noosa;

public class Game {
	public static float elapsed;
	public static com.watabou.utils.PlatformSupport platform;
	public static int width;
	public static int height;
	public static void runOnRenderThread(com.watabou.utils.Callback callback) { throw new RuntimeException("Stub"); }
	public static void switchScene(Class<? extends Scene> c) { throw new RuntimeException("Stub"); }
	public interface SceneChangeCallback {
		void beforeCreate();
		void afterCreate();
	}
	public static void switchScene(Class<? extends Scene> c, SceneChangeCallback callback) { throw new RuntimeException("Stub"); }
	public static void resetScene() { throw new RuntimeException("Stub"); }
	public static void vibrate(int millis) { throw new RuntimeException("Stub"); }
	public static Scene scene() { throw new RuntimeException("Stub"); }
}
