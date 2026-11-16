package app.spicetify.extension.spotify.extensions;

import android.content.Context;
import android.util.Log;

/**
 * Hook C1, in the place where Spotify's player sends a "set shuffle" command: every shuffle toggle that
 * reaches the player passes it, whether it came from the phone, the Android Auto screen, or another control.
 * With the patch's "commandShuffles" option on, turning shuffle on runs Shuffle+ instead, and the command
 * is sent as "off", so Spotify's own shuffle stays off.
 */
public final class CommandShuffle {
    private CommandShuffle() {}

    /** Replaced by the patch with {@code return true} when its "commandShuffles" option is on. */
    private static boolean commandShuffles() {
        return false;
    }

    /**
     * @param on the shuffle value Spotify is about to send
     * @return the value to send instead. Never throws into Spotify.
     */
    public static boolean onShuffleCommand(boolean on) {
        try {
            if (!on || !commandShuffles()) return on;
            Context context = PlayerBridge.applicationContext();
            if (context == null) return on; // can't run without a Context: let Spotify shuffle as it would
            Log.i("ShufflePlus", "Shuffle command intercepted, from " + caller());
            ShufflePlus.shuffleWhatsPlaying(context);
            return false;
        } catch (Throwable e) {
            Log.w("ShufflePlus", "Couldn't take over the shuffle command", e);
            return on;
        }
    }

    private static final String PLAYER = "spotify.player.esperanto.proto.ContextPlayer";
    /** {@code SetOptions}' field for "shuffling context", an OptionalBoolean whose only field, 1, is the value. */
    private static final int SHUFFLING_CONTEXT = 3;

    /**
     * Hook C2, at the start of Spotify's Esperanto sender: the shuffle button, the car and other controls all end
     * up as a ContextPlayer {@code SetOptions} request. One that turns shuffling on is sent as "off" and runs
     * Shuffle+ instead. Returns the request to send. Never throws into Spotify.
     */
    public static Object onCall(String service, String method, Object request) {
        try {
            if (!commandShuffles() || !PLAYER.equals(service) || !"SetOptions".equals(method)) return request;
            byte[] bytes = (byte[]) request.getClass().getMethod("toByteArray").invoke(request);
            byte[] off = shufflingOff(bytes);
            if (off == null) return request;
            Context context = PlayerBridge.applicationContext();
            if (context == null) return request;
            Object parser = request.getClass().getMethod("parser").invoke(null);
            Object replaced = parse(parser, request.getClass(), off);
            if (replaced == null) return request;
            Log.i("ShufflePlus", "Shuffle option intercepted, from " + caller());
            ShufflePlus.shuffleWhatsPlaying(context);
            return replaced;
        } catch (Throwable e) {
            Log.w("ShufflePlus", "Couldn't take over the shuffle option", e);
            return request;
        }
    }

    /** The parser's byte[] reader. Its name is obfuscated, so it's the one public method that takes a byte[] and returns a message. */
    private static Object parse(Object parser, Class<?> messageType, byte[] bytes) throws Exception {
        for (java.lang.reflect.Method m : parser.getClass().getMethods()) {
            if (m.getParameterTypes().length == 1 && m.getParameterTypes()[0] == byte[].class
                    && m.getReturnType().isAssignableFrom(messageType) && m.getReturnType() != Object.class) {
                m.setAccessible(true);
                Object parsed = m.invoke(parser, (Object) bytes);
                if (messageType.isInstance(parsed)) return parsed;
            }
        }
        Log.w("ShufflePlus", "No byte[] reader on " + parser.getClass().getName());
        return null;
    }

    /** The request with its shuffling-context value turned off, or null when it doesn't turn shuffling on. */
    static byte[] shufflingOff(byte[] in) {
        java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream();
        boolean changed = false;
        int i = 0;
        while (i < in.length) {
            int tagStart = i;
            long tag = 0;
            int shift = 0;
            int b;
            do {
                b = in[i++] & 0xff;
                tag |= (long) (b & 0x7f) << shift;
                shift += 7;
            } while ((b & 0x80) != 0);
            int field = (int) (tag >>> 3);
            int wire = (int) (tag & 7);
            int end;
            if (wire == 0) {
                while ((in[i++] & 0x80) != 0) { }
                end = i;
            } else if (wire == 1) {
                end = i + 8;
            } else if (wire == 5) {
                end = i + 4;
            } else if (wire == 2) {
                long length = 0;
                shift = 0;
                do {
                    b = in[i++] & 0xff;
                    length |= (long) (b & 0x7f) << shift;
                    shift += 7;
                } while ((b & 0x80) != 0);
                end = i + (int) length;
                if (field == SHUFFLING_CONTEXT && length == 2 && in[i] == 0x08 && in[i + 1] == 0x01) {
                    out.write(in, tagStart, i - 1 - tagStart); // the tag
                    out.write(0); // an empty OptionalBoolean is false
                    changed = true;
                    i = end;
                    continue;
                }
            } else {
                return null; // groups: not in this message
            }
            out.write(in, tagStart, end - tagStart);
            i = end;
        }
        return changed ? out.toByteArray() : null;
    }

    private static String hex(Object message) {
        try {
            byte[] bytes = (byte[]) message.getClass().getMethod("toByteArray").invoke(message);
            StringBuilder out = new StringBuilder();
            for (byte b : bytes) out.append(String.format("%02x", b));
            return out.toString();
        } catch (Throwable e) {
            return "(no bytes: " + e + ")";
        }
    }

    /** The first few frames above this one, to tell afterwards which surface sent the command. */
    private static String caller() {
        StackTraceElement[] frames = new Throwable().getStackTrace();
        StringBuilder out = new StringBuilder();
        for (int i = 2; i < Math.min(frames.length, 12); i++) {
            if (out.length() > 0) out.append(" < ");
            out.append(frames[i].getClassName()).append('.').append(frames[i].getMethodName());
        }
        return out.toString();
    }
}
