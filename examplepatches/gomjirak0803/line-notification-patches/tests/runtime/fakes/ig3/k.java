package ig3;

public final class k {
    public static final class d {
        public int c;

        public d(int c) {
            this.c = c;
        }
    }

    public String b;
    public String m;
    public d n;

    public k(String name, String readUp, int unread) {
        this.b = name;
        this.m = readUp;
        this.n = new d(unread);
    }
}
