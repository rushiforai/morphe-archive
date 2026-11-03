package z3;

/** Compile-only stub: the real class is Vimu's track list row renderer (obfuscated z3.p); only the row model is needed. */
public class p {
    /** Which audio / subtitle row is currently selected (shared by every row of a dialog). */
    public static class b {
        public int a = -1;
        public int b = -1;
    }

    /** One dialog row: type 0 = audio, 1 = subtitle; d = engine track id; c = label; a = the shared selection. */
    public static class c {
        public b a;
        public int b;
        public String c;
        public int d;
    }
}
