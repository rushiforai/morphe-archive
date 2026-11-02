package e.e.a;
/** Selection policy shared by persisted tab insertion and removal. */
public final class TabOrder113 {
 public static int insertAfter(int selected,int count){return selected<0||selected>=count?count:selected+1;}
 public static int afterRemoval(int removed,int remaining){return remaining==0?-1:Math.max(0,Math.min(removed-1,remaining-1));}
}
