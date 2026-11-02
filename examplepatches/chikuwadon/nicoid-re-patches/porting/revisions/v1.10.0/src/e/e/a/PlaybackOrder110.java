package e.e.a;
import java.util.*;
public final class PlaybackOrder110 {
 public static <T> ArrayList<T> order(List<T> input,T current,boolean shuffle,Random random){ArrayList<T> out=new ArrayList<>(input);if(shuffle){out.remove(current);Collections.shuffle(out,random);out.add(0,current);}return out;}
 public static int next(int current,boolean forward,boolean[] disabled){if(disabled.length==0)return -1;int position=current;for(int n=0;n<disabled.length;n++){position=(position+(forward?1:-1)+disabled.length)%disabled.length;if(!disabled[position])return position;}return -1;}
}
