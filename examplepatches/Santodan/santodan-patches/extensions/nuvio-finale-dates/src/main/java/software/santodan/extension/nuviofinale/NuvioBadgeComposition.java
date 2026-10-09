package software.santodan.extension.nuviofinale;
import java.lang.reflect.Method;
import java.util.concurrent.ConcurrentHashMap;
/** Give each injected badge its own remembered slots inside the host card. */
public final class NuvioBadgeComposition implements AutoCloseable {
    private static final ConcurrentHashMap<Class<?>, Method[]> METHODS = new ConcurrentHashMap<>();
    private final Object composer;
    private final Method end;
    private NuvioBadgeComposition(Object composer, Method end) { this.composer = composer; this.end = end; }
    public static NuvioBadgeComposition begin(Object composer, int key) throws ReflectiveOperationException {
        Class<?> type = composer.getClass();
        Method[] methods = METHODS.get(type);
        if (methods == null) {
            methods = new Method[]{type.getMethod("d0", int.class), type.getMethod("p", boolean.class)};
            METHODS.put(type, methods);
        }
        methods[0].invoke(composer, key);
        return new NuvioBadgeComposition(composer, methods[1]);
    }
    @Override public void close() throws ReflectiveOperationException { end.invoke(composer, false); }
}
