import app.morphe.extension.pocketcasts.PocketSurfaces;
public final class PlayerChecks {
    public static final class Colors {
        public mtd a;
        public final long c=0L,d=0L;
        public Colors(mtd theme) {a=theme;}
    }
    public static void main(String[] args) throws Exception {
        for(mtd theme:new mtd[]{mtd.LIGHT,mtd.DARK,mtd.CATPPUCCIN_LATTE,mtd.CATPPUCCIN_MACCHIATO,mtd.RADIOACTIVITY}) {
            Colors colors=new Colors(theme);PocketSurfaces.player(colors);
            long actual=Colors.class.getDeclaredField("c").getLong(colors)>>>32;
            long expected=theme==mtd.CATPPUCCIN_LATTE?0xffeff1f5L:theme==mtd.CATPPUCCIN_MACCHIATO?0xff24273aL:theme==mtd.RADIOACTIVITY?0xff162f1eL:0L;
            if(actual!=expected) throw new AssertionError(theme+" "+Long.toHexString(actual));
        }
        System.out.println("PASS: player background scopes preserve stock themes and map each added theme");
    }
}
