package a;
import java.util.*;
import software.santodan.extension.monetcards.DisplayedCards;
public class b33 {
    public static final List<Button> rendered=new ArrayList<>();
    public static boolean fail,failFooter;
    public static class Button {
        public String label; public boolean enabled,footer; public ur1 focus,left,right,up,down;
        public og5 style; public tw1 click; public int flags,defaults;
        public Object press() { if(!enabled)throw new AssertionError("Disabled action"); return click.b(); }
    }
    public static String text(ur1 focus,iy1 composer) {
        // Model distinct native composition instances, including a restart of the text child.
        composer.h0(System.identityHashCode(focus));
        try { return DisplayedCards.text("Apply",composer); } finally { composer.r(false); }
    }
    public static void E0(int flags,ur1 focus,ur1 up,tw1 click,iy1 composer) {
        if(failFooter)throw new IllegalStateException("Native footer failure");
        vw1 nativeProperties=value->{((or1)value).up=up;return u08.a;};
        vw1 configured=(vw1)DisplayedCards.properties(nativeProperties,focus);
        or1 p=new or1(); configured.a(p);
        Button b=new Button(); b.label=text(focus,composer); b.enabled=true; b.footer=true;
        b.focus=focus; b.click=click; b.style=composer.theme; b.flags=flags;
        b.up=p.up; b.left=p.left; b.right=p.right; b.down=p.down; rendered.add(b);
    }
    public static void F0(String label,boolean enabled,ur1 focus,og5 style,tw1 click,ur1 left,ur1 right,ur1 down,iy1 composer,int flags,int defaults) {
        if(fail)throw new IllegalStateException("Native button failure");
        Button b=new Button(); b.label=label; b.enabled=enabled; b.focus=focus; b.style=style; b.click=click;
        b.left=left; b.right=right; b.down=down; b.flags=flags; b.defaults=defaults; rendered.add(b);
    }
}
