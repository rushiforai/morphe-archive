package a;
import java.util.*;
public class mq2 {
 public static final List<Button> rendered=new ArrayList<>();public static boolean fail;
 public static class Button {
  public String label;public boolean enabled;public cm1 focus,left,right,up,down;public boolean footer;public zz4 style;public iq1 click;public int flags,defaults;
  public Object press(){if(!enabled)throw new AssertionError("disabled action");return click.b();}
 }
 public static void L0(String label,iq1 click,cm1 focus,cm1 up,yr1 composer,int flags){
  if(fail)throw new IllegalStateException("fixture footer failure");
  kq1 nativeProperties=value->{wl1 p=(wl1)value;p.up=up;return s67.a;};
  kq1 configured=(kq1)software.santodan.extension.monetcards.DisplayedCards.properties(nativeProperties,focus);
  wl1 p=new wl1();configured.a(p);
  Button b=new Button();b.label=label;b.enabled=true;b.focus=focus;b.style=composer.theme;b.click=click;b.left=p.left;b.right=p.right;b.up=p.up;b.down=p.down;b.footer=true;b.flags=flags;rendered.add(b);
 }
 public static void M0(String label,boolean enabled,cm1 focus,zz4 style,iq1 click,cm1 left,cm1 right,cm1 down,yr1 composer,int flags,int defaults){
  if(fail)throw new IllegalStateException("fixture renderer failure");
  Button b=new Button();b.label=label;b.enabled=enabled;b.focus=focus;b.style=style;b.click=click;b.left=left;b.right=right;b.down=down;b.flags=flags;b.defaults=defaults;rendered.add(b);
 }
}
