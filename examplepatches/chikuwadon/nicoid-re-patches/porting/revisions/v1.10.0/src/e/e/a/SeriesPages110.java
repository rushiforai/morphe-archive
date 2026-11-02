package e.e.a;
public final class SeriesPages110 {
 public static boolean finished(int page,int count,int added,boolean explicit,boolean hasNext,long total){return count==0||added==0||explicit&&!hasNext||page*100L>=total;}
}
