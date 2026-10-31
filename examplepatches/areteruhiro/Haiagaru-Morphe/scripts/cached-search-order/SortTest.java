package app.morphe.extension.chmate;
import java.util.*;
public class SortTest {
 static int checks;
 static void check(boolean ok){if(!ok)throw new AssertionError();checks++;}
 public static void main(String[] args)throws Exception{
  o.mg unknown=new o.mg("invalid"),old=new o.mg("https://egg.5ch.io/test/read.cgi/android/1500000000/99"),recent=new o.mg("https://egg.5ch.io/test/read.cgi/android/1700000000/1"),equal=new o.mg(recent.b);
  List<?> source=Arrays.asList(unknown,old,recent,equal);
  check(CachedSearchOrder.sorted(source,0)==source);
  check(CachedSearchOrder.sorted(source,1).equals(Arrays.asList(recent,equal,old,unknown)));
  check(CachedSearchOrder.sorted(source,2).equals(Arrays.asList(old,recent,equal,unknown)));
  check(source.get(0)==unknown&&source.get(1)==old);
  check(CachedSearchOrder.created(old.b)==1500000000L);
  check(CachedSearchOrder.created("https://bbs.eddibb.cc/test/read.cgi/liveedge/1700000000/")==1700000000L);
  check(CachedSearchOrder.created(null)==0);check(CachedSearchOrder.created("invalid")==0);
  check(CachedSearchOrder.sorted(Collections.emptyList(),1).isEmpty());
  o.mg pink=new o.mg("https://mercury.bbspink.com/test/read.cgi/example/1600000000/"),edge=new o.mg("https://bbs.eddibb.cc/test/read.cgi/liveedge/1800000000/");
  List<?> mixed=Arrays.asList(old,recent,pink,edge);
  check(CachedSearchOrder.sorted(mixed,1).equals(Arrays.asList(edge,recent,pink,old)));
  check(CachedSearchOrder.sorted(mixed,2).equals(Arrays.asList(old,pink,recent,edge)));
  check(mixed.get(0)==old&&mixed.get(3)==edge);
  Random random=new Random(22);List<o.mg> many=new ArrayList<>();for(int i=0;i<1000;i++)many.add(new o.mg("https://example.org/test/read.cgi/a/"+(1500000000L+random.nextInt(10000))+"/"));
  for(int mode:new int[]{1,2}){List<?> result=CachedSearchOrder.sorted(many,mode);check(result.size()==many.size());check(new HashSet<>(result).size()==many.size());
   for(int i=1;i<result.size();i++){long a=CachedSearchOrder.created(((o.mg)result.get(i-1)).b),b=CachedSearchOrder.created(((o.mg)result.get(i)).b);check(mode==1?a>=b:a<=b);}}
  System.out.println("PASS "+checks+" cached search stable chronological sorting checks");
 }
}
