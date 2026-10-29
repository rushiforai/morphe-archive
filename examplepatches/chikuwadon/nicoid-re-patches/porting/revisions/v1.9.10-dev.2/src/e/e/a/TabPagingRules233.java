package e.e.a;
public final class TabPagingRules233 {
 private TabPagingRules233(){}
 public static boolean claim(float dx,float dy,int slop){return Math.abs(dx)>slop*2&&Math.abs(dx)>Math.abs(dy)*1.8f;}
 public static boolean commit(float offset,int width,float speed){if(width<=0||offset==0)return false;return Math.abs(offset)>width*.3f||Math.abs(speed)>600&&speed*offset>0;}
}
