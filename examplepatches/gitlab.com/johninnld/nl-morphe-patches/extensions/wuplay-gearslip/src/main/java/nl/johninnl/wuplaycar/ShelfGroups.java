package nl.johninnl.wuplaycar;
import java.util.*;
import java.util.function.ToIntFunction;
/** Stable shelf ordering and page identity, independent of host rendering. */
public final class ShelfGroups {
 private ShelfGroups(){}
 public static <T> Map<Integer,List<T>> seasons(List<T> items,ToIntFunction<T> season,Comparator<T> episodes){
  Map<Integer,List<T>> sorted=new TreeMap<>(Comparator.comparingInt(n->n>0?n:n==0?Integer.MAX_VALUE-1:Integer.MAX_VALUE));
  for(T item:items)sorted.computeIfAbsent(Math.max(-1,season.applyAsInt(item)),n->new ArrayList<>()).add(item);
  for(List<T> group:sorted.values())group.sort(episodes);return sorted;
 }
 public static <T> List<T> window(List<T> items,int offset,int count){if(offset<0||count<1)throw new IllegalArgumentException("Invalid shelf window");return new ArrayList<>(items.subList(Math.min(offset,items.size()),Math.min(items.size(),offset+count)));}
 public static String identity(String session,int revision,String tab){return session+"/"+revision+"/"+tab;}
}
