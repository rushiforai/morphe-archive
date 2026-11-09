package e.e.a;
public final class PopupTouchPolicy125Test {
    private static int tests;
    private static void yes(boolean value,String description) {
        tests++;
        if(!value) throw new AssertionError(description);
    }
    public static void main(String[] args) {
        PopupTouchPolicy125.State s=new PopupTouchPolicy125.State();
        yes(s.begin(100,100,100,false,false,96,300),"start hidden");
        s.move(102,103,12);
        yes(s.end(160,500)==PopupTouchPolicy125.SINGLE_TAP,"small jitter remains tap");
        yes(s.begin(260,104,103,true,true,96,300),"recent second tap bypasses newly visible control");
        yes(s.markDoubleTap(),"double callback registered");
        yes(s.end(307,500)==PopupTouchPolicy125.DOUBLE_TAP,"close only on second release");
        yes(!s.dragging(),"no dragging");
        yes(s.begin(1000,100,100,false,false,96,300),"drag start");
        s.move(150,100,12);
        yes(s.dragging(),"drag threshold");
        yes(s.end(1110,500)==PopupTouchPolicy125.NONE,"drag never toggles controls");
        yes(s.begin(2000,100,100,false,false,96,300),"first tap before drag");
        yes(s.end(2050,500)==PopupTouchPolicy125.SINGLE_TAP,"normal");
        yes(s.begin(2100,101,101,true,true,96,300),"second down");
        yes(s.markDoubleTap(),"second double pending");
        s.move(150,170,12);
        yes(s.end(2210,500)==PopupTouchPolicy125.NONE,"double tap plus drag does not close");
        yes(!s.begin(3000,400,400,true,true,96,300),"controls handle click");
        yes(s.end(3040,500)==PopupTouchPolicy125.NONE,"interactive UP handled by child");
        yes(s.begin(4000,100,100,false,false,96,300),"pinch start");
        s.cancel();
        yes(s.end(4030,500)==PopupTouchPolicy125.NONE,"pinch cancels tap");
        yes(s.begin(5000,100,100,false,false,96,300),"long press start");
        yes(s.end(5650,500)==PopupTouchPolicy125.NONE,"long press not a tap");
        yes(s.begin(6000,100,100,false,false,96,300),"first tap");
        yes(s.end(6060,500)==PopupTouchPolicy125.SINGLE_TAP,"first up");
        yes(s.begin(6170,500,500,true,false,96,300),"far second tap still routed as single");
        yes(!s.markDoubleTap(),"distance gating for double");
        yes(s.end(6230,500)==PopupTouchPolicy125.SINGLE_TAP,"far tap not close");
        // Regression: dev.3/dev.4 never closed because ACTION_UP depended
        // on a separate GestureDetector callback that can be missing.
        PopupTouchPolicy125.State fallback = new PopupTouchPolicy125.State();
        yes(fallback.begin(10000,120,80,false,false,96,300),"first popup tap routed");
        yes(fallback.end(10050,500)==PopupTouchPolicy125.SINGLE_TAP,"first release");
        yes(fallback.begin(10185,123,83,true,true,96,300),"second tap routed over freshly displayed controls");
        yes(fallback.end(10240,500)==PopupTouchPolicy125.DOUBLE_TAP,
                "double tap closes without native onDoubleTap callback");
        PopupTouchPolicy125.State dragAfterSecond = new PopupTouchPolicy125.State();
        yes(dragAfterSecond.begin(20000,120,80,false,false,96,300),"gesture one");
        yes(dragAfterSecond.end(20055,500)==PopupTouchPolicy125.SINGLE_TAP,"gesture one release");
        yes(dragAfterSecond.begin(20150,121,80,true,true,96,300),"gesture second");
        dragAfterSecond.move(175,127,12);
        yes(dragAfterSecond.end(20230,500)==PopupTouchPolicy125.NONE,
                "second tap drag never closes without detector");
        System.out.println("PASS: "+tests+" popup tap/drag/double/pinch/hold/control assertions");
    }
}
