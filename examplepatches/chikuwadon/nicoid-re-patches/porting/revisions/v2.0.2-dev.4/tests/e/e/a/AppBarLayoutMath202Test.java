package e.e.a;

/** Pure-Java screen-space regression: all six placements remain visible. */
public final class AppBarLayoutMath202Test {
    private static void verify(boolean ok, String message) {
        if (!ok) throw new AssertionError(message);
    }
    public static void main(String[] args) {
        final int h = 56, f = 740;
        for (int t : new int[]{28,32,46,64}) {
            for (int mode=0; mode<6; mode++) {
                int[] p=AppBarLayoutMath202.calculate(mode,h,f,t);
                int appStart=p[0], appEnd=appStart+h;
                int tabStart=p[2], tabEnd=tabStart+t;
                int frameStart=h+p[1], frameEnd=frameStart+f;
                verify(appStart>=0 && appEnd<=h+f,"Offscreen app "+mode);
                verify(tabStart>=0 && tabEnd<=h+f,"Offscreen tab "+mode);
                verify(appEnd<=tabStart || tabEnd<=appStart,"Overlapping app/tab "+mode);
                verify(frameStart>=0 && frameEnd<=h+f,"Offscreen content frame "+mode);
                if (mode==1 || mode==5)
                    verify(tabEnd==appStart,"tab/app adjacency "+mode);
                if (mode==0 || mode==4)
                    verify(appEnd==tabStart,"app/tab adjacency "+mode);
                if (mode==1 || mode==3)
                    verify(tabStart==0,"top-tab visibility "+mode);
                if (mode==4)
                    verify(tabEnd==h+f,"bottom-tab visibility "+mode);
                if (mode>=3) verify(frameStart==0,"bottom-app content must fill top");
            }
        }
        System.out.println("PASS: all six app/tab arrangements are in bounds and non-overlapping");
    }
}
