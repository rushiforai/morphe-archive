package a;
import java.util.*;
import software.santodan.extension.monetcards.DisplayedCards;
public class ux2 {
    public static final List<Button> rendered=new ArrayList<>();
    public static boolean fail,failFooter;
    public static class Button {
        public String label; public boolean enabled,footer; public wp1 focus,left,right,up,down;
        public y95 style; public uu1 click; public int flags,defaults;
        public Object press() { if(!enabled)throw new AssertionError("Disabled action"); return click.b(); }
    }
    public static String text(wp1 focus,jw1 composer) {
        // Model distinct native composition instances, including a restart of the text child.
        composer.h0(System.identityHashCode(focus));
        try { return DisplayedCards.text("Apply",composer); } finally { composer.r(false); }
    }
    public static void B0(int flags,wp1 focus,wp1 up,uu1 click,jw1 composer) {
        if(failFooter)throw new IllegalStateException("Native footer failure");
        wu1 nativeProperties=value->{((qp1)value).up=up;return lo7.a;};
        wu1 configured=(wu1)DisplayedCards.properties(nativeProperties,focus);
        qp1 p=new qp1(); configured.a(p);
        Button b=new Button(); b.label=text(focus,composer); b.enabled=true; b.footer=true;
        b.focus=focus; b.click=click; b.style=composer.theme; b.flags=flags;
        b.up=p.up; b.left=p.left; b.right=p.right; b.down=p.down; rendered.add(b);
    }
    public static void C0(String label,boolean enabled,wp1 focus,y95 style,uu1 click,wp1 left,wp1 right,wp1 down,jw1 composer,int flags,int defaults) {
        if(fail)throw new IllegalStateException("Native button failure");
        Button b=new Button(); b.label=label; b.enabled=enabled; b.focus=focus; b.style=style; b.click=click;
        b.left=left; b.right=right; b.down=down; b.flags=flags; b.defaults=defaults; rendered.add(b);
    }
}
