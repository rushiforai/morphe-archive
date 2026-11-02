package e.e.a;
/** Coordinates are density-independent. Straight strokes remain native scrolling. */
public final class GestureRules110 {
 public String pattern="";public float x,y,startX,startY;public boolean invalid;public float distance=28;
 public static float threshold(int sensitivity){return Math.max(12f,56f-Math.max(1,Math.min(100,sensitivity))*.56f);}
 public void down(float x,float y){this.x=startX=x;this.y=startY=y;pattern="";invalid=false;}
 public void move(float nx,float ny){float dx=nx-x,dy=ny-y;if(Math.hypot(dx,dy)<distance)return;if(Math.max(Math.abs(dx),Math.abs(dy))<Math.min(Math.abs(dx),Math.abs(dy))*1.3)return;char d=Math.abs(dx)>Math.abs(dy)?dx>0?'R':'L':dy>0?'D':'U';if(pattern.isEmpty()||pattern.charAt(pattern.length()-1)!=d){pattern+=d;if(pattern.length()>3)invalid=true;}x=nx;y=ny;}
 public boolean valid(){return !invalid&&pattern.length()>=2&&pattern.length()<=3;}
 public boolean cancelled(float x,float y){return pattern.length()>=2&&Math.hypot(x-startX,y-startY)<distance*(20f/28f);}
 public static String arrows(String p){return p.replace("U","↑ ").replace("D","↓ ").replace("L","← ").replace("R","→ ").trim();}
}
