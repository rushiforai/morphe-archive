// SPDX-License-Identifier: GPL-3.0-or-later
// Radioactivity colors derived from Automattic/pocket-casts-android 8.3.
package app.morphe.extension.pocketcasts;

import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.util.HashMap;
import java.util.Map;

/** Additional theme identities and Compose palettes; stock palettes are never mutated. */
public final class PocketThemes {
    private static final Map<String,Object> themes = new HashMap<>();
    private static final Map<String,Object> palettes = new HashMap<>();
    private static final long[][] COLORS = {
        { 0xffeff1f5L, 0xffccd0daL, 0xffeff1f5L, 0xffccd0daL, 0xffccd0daL, 0xffe6e9efL, 0xffe6e9efL, 0xffccd0daL, 0xffccd0daL, 0xffe6e9efL, 0xff4c4f69L, 0xff8839efL, 0xff6c6f85L, 0xff8839efL, 0xff8839efL, 0xff8839efL, 0xff4c4f69L, 0xff4c4f69L, 0xff6c6f85L, 0xff8839efL, 0xffccd0daL, 0xffccd0daL, 0xffccd0daL, 0xffccd0daL, 0xffccd0daL, 0xffccd0daL, 0xff8839efL, 0xff8839efL, 0xff8839efL, 0x668839efL, 0xffeff1f5L, 0xffeff1f5L, 0xffeff1f5L, 0xff8839efL, 0xffeff1f5L, 0xffeff1f5L, 0xff4c4f69L, 0xff6c6f85L, 0xff4c4f69L, 0xff6c6f85L, 0xffccd0daL, 0xffccd0daL, 0xff8839efL, 0xff8839efL, 0xff8839efL, 0xff8839efL, 0xff40a02bL, 0xff1e66f5L, 0xff1e66f5L, 0xffd20f39L, 0xff6c6f85L, 0xff4c4f69L, 0xfffe640bL, 0xffeff1f5L, 0xffdf8e1dL, 0xff4c4f69L, 0xff6c6f85L, 0xff4c4f69L, 0xff6c6f85L, 0xff6c6f85L, 0xff6c6f85L, 0xff4c4f69L, 0xff6c6f85L, 0xff4c4f69L, 0xff6c6f85L, 0xff1e66f5L, 0xffd20f39L, 0xff40a02bL, 0xffdf8e1dL, 0xff8839efL, 0xfffe640bL, 0xff179299L, 0xffea76cbL, 0xff7287fdL, 0xff1e66f5L, 0xffd20f39L, 0xff40a02bL, 0x99e6e9efL, 0xffe6e9efL, 0xffe6e9efL, 0xffe6e9efL, 0xffe6e9efL, 0xffe6e9efL, 0xffe6e9efL, 0xffe6e9efL, 0xffe6e9efL, 0xffe6e9efL, 0xffe6e9efL, 0xff1e66f5L, 0xffd20f39L, 0xff40a02bL, 0xffdf8e1dL, 0xff8839efL, 0xfffe640bL, 0xff179299L, 0xffea76cbL, 0xff7287fdL, 0xff1e66f5L, 0xffd20f39L, 0xff40a02bL, 0xffdf8e1dL, 0xff8839efL, 0xfffe640bL, 0xff179299L, 0xffea76cbL, 0xff7287fdL, 0xff1e66f5L },
        { 0xff24273aL, 0xff363a4fL, 0xff24273aL, 0xff363a4fL, 0xff363a4fL, 0xff1e2030L, 0xff1e2030L, 0xff363a4fL, 0xff363a4fL, 0xff1e2030L, 0xffcad3f5L, 0xffc6a0f6L, 0xffa5adcbL, 0xffc6a0f6L, 0xffc6a0f6L, 0xffc6a0f6L, 0xffcad3f5L, 0xffcad3f5L, 0xffa5adcbL, 0xffc6a0f6L, 0xff363a4fL, 0xff363a4fL, 0xff363a4fL, 0xff363a4fL, 0xff363a4fL, 0xff363a4fL, 0xffc6a0f6L, 0xffc6a0f6L, 0xffc6a0f6L, 0x66c6a0f6L, 0xff24273aL, 0xff24273aL, 0xff24273aL, 0xffc6a0f6L, 0xff24273aL, 0xff24273aL, 0xffcad3f5L, 0xffa5adcbL, 0xffcad3f5L, 0xffa5adcbL, 0xff363a4fL, 0xff363a4fL, 0xffc6a0f6L, 0xffc6a0f6L, 0xffc6a0f6L, 0xffc6a0f6L, 0xffa6da95L, 0xff8aadf4L, 0xff8aadf4L, 0xffed8796L, 0xffa5adcbL, 0xffcad3f5L, 0xfff5a97fL, 0xff24273aL, 0xffeed49fL, 0xffcad3f5L, 0xffa5adcbL, 0xffcad3f5L, 0xffa5adcbL, 0xffa5adcbL, 0xffa5adcbL, 0xffcad3f5L, 0xffa5adcbL, 0xffcad3f5L, 0xffa5adcbL, 0xff8aadf4L, 0xffed8796L, 0xffa6da95L, 0xffeed49fL, 0xffc6a0f6L, 0xfff5a97fL, 0xff8bd5caL, 0xfff5bde6L, 0xffb7bdf8L, 0xff8aadf4L, 0xffed8796L, 0xffa6da95L, 0x991e2030L, 0xff1e2030L, 0xff1e2030L, 0xff1e2030L, 0xff1e2030L, 0xff1e2030L, 0xff1e2030L, 0xff1e2030L, 0xff1e2030L, 0xff1e2030L, 0xff1e2030L, 0xff8aadf4L, 0xffed8796L, 0xffa6da95L, 0xffeed49fL, 0xffc6a0f6L, 0xfff5a97fL, 0xff8bd5caL, 0xfff5bde6L, 0xffb7bdf8L, 0xff8aadf4L, 0xffed8796L, 0xffa6da95L, 0xffeed49fL, 0xffc6a0f6L, 0xfff5a97fL, 0xff8bd5caL, 0xfff5bde6L, 0xffb7bdf8L, 0xff8aadf4L },
        { 0xFF162F1EL, 0xFF193D25L, 0xFF0d1b11L, 0xFF173119L, 0xFF0d1b11L, 0xFF162f1eL, 0xFF111419L, 0xFF27591aL, 0xFF70e84eL, 0xFF1a3e11L, 0xFF74f864L, 0xFF70e84eL, 0xFF59bc3dL, 0xFF9FF2B1L, 0xFF70e84eL, 0xFF70e84eL, 0xFF70e84eL, 0xFF74f864L, 0xFF469431L, 0xFF9FF2B1L, 0xFF1a3e11L, 0xFF27591aL, 0xFF1a3e11L, 0xFF27591aL, 0xFF257111L, 0xFF70e84eL, 0xFF88FF66L, 0xFF87ED7FL, 0xFF9FF2B1L, 0xFF59bc3dL, 0xFF131711L, 0x1A59BC3DL, 0x339FF2B1L, 0xFF1F5014L, 0xFF162f1eL, 0xFF162f1eL, 0xFF70e84eL, 0xFF70e84eL, 0xFF70e84eL, 0xFF70e84eL, 0xFF1a3e11L, 0xFF27591aL, 0xFF88FF66L, 0xFF70e84eL, 0xFF59bc3dL, 0xFF74f864L, 0xFF70e84eL, 0xFF27591aL, 0xFF162f1eL, 0xFF489848L, 0xFF162f1eL, 0xFF70e84eL, 0xFF70e84eL, 0xFF111419L, 0xFF8DFF80L, 0xFF70e84eL, 0xCC70e84eL, 0xB370e84eL, 0x5256E52EL, 0x3D56E52EL, 0x2E56E52EL, 0xFF70E84EL, 0xCC70e84eL, 0xB370E84EL, 0x4070E84EL, 0xFF74f864L, 0xFF74f864L, 0xFF74f864L, 0xFF74f864L, 0xFF74f864L, 0xFF74f864L, 0xFF74f864L, 0xFF74f864L, 0xFF74f864L, 0xFF74f864L, 0xFF74f864L, 0xFF74f864L, 0xBF173d17L, 0xFF948a00L, 0xFFeeff00L, 0xFF3dbd4cL, 0xFFa4f864L, 0xFF538a11L, 0xFFf8e963L, 0xFF579986L, 0xFF0ecc77L, 0xFF53a26aL, 0xFFb0c073L, 0xFF74f864L, 0xFF74f864L, 0xFF74f864L, 0xFF74f864L, 0xFF74f864L, 0xFF74f864L, 0xFF74f864L, 0xFF74f864L, 0xFF74f864L, 0xFF74f864L, 0xFF74f864L, 0xFF74f864L, 0xFF74f864L, 0xFF74f864L, 0xFF74f864L, 0xFF74f864L, 0xFF74f864L, 0xFF74f864L, 0xFF74f864L }
    };
    public static Object append(Object original, Object latte, Object macchiato, Object radioactivity) {
        int size = Array.getLength(original);
        Object array = Array.newInstance(original.getClass().getComponentType(), size + 3);
        System.arraycopy(original, 0, array, 0, size);
        Object[] additions = {latte, macchiato, radioactivity};
        for (int i=0;i<3;i++) {
            Array.set(array, size+i, additions[i]);
            if (additions[i].getClass().getName().equals("mtd")) themes.put(((Enum<?>)additions[i]).name(), additions[i]);
        }
        return array;
    }
    @SuppressWarnings({"unchecked", "rawtypes"})
    public static Object theme(Enum<?> setting) {
        Object custom=themes.get(setting.name());
        if (custom!=null) return custom;
        try { return Enum.valueOf((Class)Class.forName("mtd"),setting.name()); }
        catch (ClassNotFoundException error) { throw new IllegalStateException(error); }
    }
    // New identities retain unique ordinals. Existing exhaustive theme switches use
    // the corresponding light/dark behavior; EnumEntries itself keeps real ordinals.
    public static int ordinal(Enum<?> value) {
        String name=value.name();
        if ((value.getClass().getName().equals("mtd") || value.getClass().getName().equals("utd"))) {
            if (name.equals("CATPPUCCIN_LATTE")) return 0;
            if (name.equals("CATPPUCCIN_MACCHIATO") || name.equals("RADIOACTIVITY")) return 1;
        }
        return value.ordinal();
    }
    public static synchronized Object palette(Object original, Enum<?> theme) {
        String name=theme.name();
        int index=name.equals("CATPPUCCIN_LATTE")?0:name.equals("CATPPUCCIN_MACCHIATO")?1:name.equals("RADIOACTIVITY")?2:-1;
        if (index<0) return original;
        Object cached=palettes.get(name);
        if (cached!=null) return cached;
        try {
            Constructor<?> constructor=original.getClass().getDeclaredConstructors()[0];
            if (constructor.getParameterTypes().length!=COLORS[index].length) throw new IllegalStateException("Pocket Casts palette changed");
            Object[] args=new Object[COLORS[index].length];
            for (int i=0;i<args.length;i++) args[i]=COLORS[index][i]<<32;
            constructor.setAccessible(true);
            cached=constructor.newInstance(args);
            palettes.put(name,cached);
            return cached;
        } catch (ReflectiveOperationException error) { throw new IllegalStateException("Cannot construct Pocket Casts palette",error); }
    }
}
