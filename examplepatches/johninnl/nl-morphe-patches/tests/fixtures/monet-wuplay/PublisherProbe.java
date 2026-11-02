package nl.johninnl.monetwuplay.test;

import android.app.Instrumentation;
import android.content.Context;
import android.os.Bundle;
import java.lang.reflect.*;
import java.util.*;

/** Test-only publisher boundary fixture. No account/preferences are copied to the emulator. */
public final class PublisherProbe extends Instrumentation {
    public static final class Definition {
        public int id, homeOrder = 0;
        public boolean showHome = true;
        public String name, source = "preset";
        Definition(int id, String name) { this.id = id; this.name = name; }
    }
    public static final class Tile {
        public String type = "movie", id, imdbId, name, description = "Integration test", poster, background;
        Tile(String id, String name, String image) { this.id = id; imdbId = id; this.name = name; poster = background = image; }
    }
    public void onCreate(Bundle arguments) { start(); }
    public void onStart() {
        waitForIdleSync(); Bundle result = new Bundle();
        try {
            Context context = getTargetContext(); ClassLoader loader = context.getClassLoader();
            Class<?> definitionClass = loader.loadClass("nl.johninnl.wuplay.NativeCatalogs$Definition");
            Constructor<?> definition = definitionClass.getDeclaredConstructor(String.class, Object.class); definition.setAccessible(true);
            Class<?> publisherClass = loader.loadClass("nl.johninnl.wuplay.CatalogPublisher");
            Constructor<?> ctor = publisherClass.getDeclaredConstructor(Context.class); ctor.setAccessible(true);
            Object publisher = ctor.newInstance(context);
            Method publish = publisherClass.getDeclaredMethod("publish", definitionClass, List.class); publish.setAccessible(true);
            Tile shared = new Tile("tt37522541", "Apocalypse Z: New World", "https://image.tmdb.org/t/p/w1280/w6Jfwtn82wGMfo0ejgRvCM9w2xE.jpg");
            Tile second = new Tile("tt21285562", "The Dog Stars", "https://image.tmdb.org/t/p/w1280/3k7GzxOdLZkN3eZsuhLi2eRzkXO.jpg");
            Tile third = new Tile("tt34890576", "Clayface", "https://image.tmdb.org/t/p/w1280/VnT9D7NogVWrmN2UuT30exIYPh.jpg");
            publish.invoke(publisher, definition.newInstance("integration-default", new Definition(1, "Wuplay Action")), Arrays.asList(shared, second));
            publish.invoke(publisher, definition.newInstance("integration-default", new Definition(2, "Wuplay Drama")), Arrays.asList(shared, third));
            result.putString("result", "Published two channels, four programs, one shared title through the production Wuplay publisher"); finish(-1, result);
        } catch (Throwable failure) { result.putString("failure", android.util.Log.getStackTraceString(failure)); finish(0, result); }
    }
}
