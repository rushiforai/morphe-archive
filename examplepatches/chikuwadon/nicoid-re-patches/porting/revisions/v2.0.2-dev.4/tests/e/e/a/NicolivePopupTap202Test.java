package e.e.a;

public final class NicolivePopupTap202Test {
    private static void check(boolean ok,String what) {
        if(!ok)throw new AssertionError(what);
    }

    public static void main(String[] args) {
        PopupTouchPolicy125.State tap=new PopupTouchPolicy125.State();
        check(tap.begin(100,110,60,false,false,60,300),"first video down");
        check(tap.end(135,500)==PopupTouchPolicy125.SINGLE_TAP,"first up single");
        check(tap.begin(240,112,61,false,false,60,300),"second video down");
        check(tap.end(260,500)==PopupTouchPolicy125.DOUBLE_TAP,
                "double only after second finger up");

        tap.reset();
        check(tap.begin(400,110,60,false,false,60,300),"move begin");
        tap.move(160,105,10);
        check(tap.end(430,500)==PopupTouchPolicy125.NONE,"drag is not tap");

        tap.reset();
        check(tap.begin(500,110,60,false,false,60,300),"cancel begin");
        tap.cancel();
        check(tap.end(520,500)==PopupTouchPolicy125.NONE,"cancel is not close");

        tap.reset();
        check(!tap.begin(600,110,60,true,true,60,300),
                "interactive control must not be hijacked");
        check(tap.end(620,500)==PopupTouchPolicy125.NONE,"buttons stay interactive");

        tap.reset();
        check(tap.begin(700,110,60,false,false,60,300),"long start");
        check(tap.end(1700,500)==PopupTouchPolicy125.NONE,
                "long hold is not close");
        System.out.println("PASS: popup double-tap is confirmed on release; drag, cancel, controls and hold are safe");
    }
}
