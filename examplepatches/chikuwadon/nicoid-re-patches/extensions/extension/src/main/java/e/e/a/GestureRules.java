package e.e.a;

public final class GestureRules {
    public static int target(boolean volume,boolean brightness,float x,float width) {
        if(volume&&brightness)return x>=width/2?1:2;
        return volume?1:brightness?2:0;
    }
    public static boolean vertical(float dx,float dy,float slop) {return Math.abs(dy)>slop&&Math.abs(dy)>Math.abs(dx)*2f;}
    public static boolean startArea(float x,float y,float width,float height,float density) {
        float side=Math.min(24*density,width*.08f),top=Math.min(48*density,height*.2f),bottom=Math.min(56*density,height*.23f);
        return x>=side&&x<=width-side&&y>=top&&y<=height-bottom;
    }
    public static float value(float start,float dy,float height,float min,float max) {
        return Math.max(min,Math.min(max,start-dy/Math.max(1,height)*(max-min)*1.5f));
    }
}
