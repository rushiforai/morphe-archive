package a;
import java.util.*;
import software.santodan.extension.monetcards.DisplayedCards;
public class w33 {
    public static final List<Button> rendered=new ArrayList<>();
    public static boolean fail,failFooter;
    public static class Button {
        public String label; public boolean enabled,footer; public gs1 focus,left,right,up,down;
        public ek5 style; public fx1 click; public int flags,defaults;
        public Object press() { if(!enabled)throw new AssertionError("Disabled action"); return click.b(); }
    }
    public static String text(gs1 focus,ty1 composer) {
        // Model distinct native composition instances, including a restart of the text child.
        composer.h0(System.identityHashCode(focus));
        try { return DisplayedCards.text("Apply",composer); } finally { composer.r(false); }
    }
    public static void E0(int flags,gs1 focus,gs1 up,fx1 click,ty1 composer) {
        if(failFooter)throw new IllegalStateException("Native footer failure");
        hx1 nativeProperties=value->{((as1)value).up=up;return qf8.a;};
        hx1 configured=(hx1)DisplayedCards.properties(nativeProperties,focus);
        as1 p=new as1(); configured.a(p);
        Button b=new Button(); b.label=text(focus,composer); b.enabled=true; b.footer=true;
        b.focus=focus; b.click=click; b.style=composer.theme; b.flags=flags;
        b.up=p.up; b.left=p.left; b.right=p.right; b.down=p.down; rendered.add(b);
    }
    public static void F0(String label,boolean enabled,gs1 focus,ek5 style,fx1 click,gs1 left,gs1 right,gs1 down,ty1 composer,int flags,int defaults) {
        if(fail)throw new IllegalStateException("Native button failure");
        Button b=new Button(); b.label=label; b.enabled=enabled; b.focus=focus; b.style=style; b.click=click;
        b.left=left; b.right=right; b.down=down; b.flags=flags; b.defaults=defaults; rendered.add(b);
    }
}
