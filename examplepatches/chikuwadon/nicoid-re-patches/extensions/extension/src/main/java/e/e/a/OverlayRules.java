package e.e.a;
/** Popup controls use the video viewport, with enough room for the entire top row. */
public final class OverlayRules {
 public static int toolbar(int width,int height,float density){return Math.max(1,Math.round(Math.min(Math.min(36*density,height*.16f),width/8.5f)));}
 public static int slot(int height){return Math.max(1,Math.round(height*1.25f));}
 public static int central(int height,float density){return Math.max(1,Math.round(Math.min(64*density,height*.27f)));}
}
