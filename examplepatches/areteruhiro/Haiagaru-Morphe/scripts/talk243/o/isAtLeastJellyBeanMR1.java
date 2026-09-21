package o;

import app.morphe.extension.chmate.TalkPostCompatibility;

public final class isAtLeastJellyBeanMR1 {
    public static Object c(Object client, String id, String password, long timestamp) {
        if (setExtras.e != Long.MIN_VALUE) {
            throw new AssertionError("generated cache was not invalidated");
        }
        Object[] state = {
            new int[]{222},
            new int[]{213},
            new int[]{-752051324},
            new String[0],
        };
        TalkPostCompatibility.normalizeIntegrityState(state);
        if (((int[]) state[1])[0] != 222) {
            throw new AssertionError("integrity comparison was not normalized");
        }
        if (((int[]) state[2])[0] != -1531869433) {
            throw new AssertionError("arithmetic seed was not normalized");
        }
        return "generated-result";
    }
}
