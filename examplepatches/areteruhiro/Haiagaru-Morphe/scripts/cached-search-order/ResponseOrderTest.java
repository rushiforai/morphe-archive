package app.morphe.extension.chmate;
import java.util.*;import java.time.*;
public class ResponseOrderTest{
 static int checks;static void check(boolean ok,String reason){if(!ok)throw new AssertionError(reason);checks++;}
 public static void main(String[] args)throws Exception{
 for(String type:new String[]{"o.mg","o.createFromParcel","o.startResolutionForResult"}){
  java.lang.reflect.Constructor<?> ctor=Class.forName(type).getConstructor(String.class,String.class,CharSequence.class,int.class);
  String a="https://egg.5ch.io/test/read.cgi/android/1700000000/",b="https://mercury.bbspink.com/test/read.cgi/test/1800000000/",c="https://bbs.eddibb.cc/test/read.cgi/liveedge/1500000000/";
  Object ha=ctor.newInstance("A",a,null,11),hb=ctor.newInstance("B",b,null,12),hc=ctor.newInstance("C",c,null,13),orphan=ctor.newInstance("Title only","https://egg.5ch.io/test/read.cgi/a/1600000000/",null,14);
  CharSequence styled=new StringBuilder("1 name 2022/01/01(土) 00:00:00.200 ID:A\nbody with 2099/12/31 23:59:59");
  Object a1=ctor.newInstance(null,a+1,styled,4),a2=ctor.newInstance(null,a+2,"2 name 2020/09/05(土) 15:31:46 ID:A\nbody",4),b1=ctor.newInstance(null,b+8,"8 name 2021/01/01(金) 00:00:00.1 ID:B\nbody",8),c1=ctor.newInstance(null,c+27,"27 name 2022/01/01(土) 00:00:00.201 ID:C\nbody",8),unknown=ctor.newInstance(null,c+28,"28 no header date\n2030/01/01 12:00:00",8);
  List<?> original=Arrays.asList(ha,a1,a2,hb,b1,hc,c1,unknown,orphan);List<?> newest=CachedResponseOrder.sorted(original,true),oldest=CachedResponseOrder.sorted(original,false);
  check(newest.equals(Arrays.asList(hc,c1,ha,a1,hb,b1,ha,a2,hc,unknown,orphan)),"cross-thread interleave newest "+type);
  check(oldest.equals(Arrays.asList(ha,a2,hb,b1,ha,a1,hc,c1,unknown,orphan)),"oldest interleave "+type);
  check(original.equals(Arrays.asList(ha,a1,a2,hb,b1,hc,c1,unknown,orphan)),"source unchanged");
  String textField=type.equals("o.mg")?"d":type.equals("o.createFromParcel")?"b":"c";
  check(Class.forName(type).getField(textField).get(a1)==styled,"spans/text identity retained");
  Object same=ctor.newInstance(null,b+9,"9 name 2022/01/01(土) 00:00:00.200 ID:B\nbody",8);
  List<?> ties=CachedResponseOrder.sorted(Arrays.asList(ha,a1,hb,same),true);check(ties.indexOf(a1)<ties.indexOf(same),"equal time stable");
  check(CachedResponseOrder.sorted(Arrays.asList(orphan),true).equals(Arrays.asList(orphan)),"title-only preserved");
 }
 check(CachedResponseOrder.posted("1 date 2024/02/29(木) 12:00:00.12 ID:x\nbody")==LocalDateTime.of(2024,2,29,12,0,0,120000000).toInstant(ZoneOffset.ofHours(9)).toEpochMilli(),"JST fraction");
 for(String s:new String[]{"1 name 2026/02/30(月) 12:00:00","1 name 2026/01/01(木) 24:00:00","1 name\n2026/01/01(木) 12:00:00","1 name"})check(CachedResponseOrder.posted(s)==Long.MIN_VALUE,"invalid/body date ignored");
 check(CachedResponseOrder.posted("name 1999/01/01 00:00:00 2026/01/01(木) 12:00:00")>CachedResponseOrder.posted("name 2025/01/01 00:00:00"),"actual last header date preferred");
 check(CachedResponseOrder.thread("http://egg.5ch.io/test/read.cgi/android/1700000000/99").equals(CachedResponseOrder.thread("https://egg.5ch.io/test/read.cgi/android/1700000000/")),"thread URL ignores response and scheme");
 List<o.mg> many=new ArrayList<>();o.mg header=new o.mg("A","https://example.org/test/read.cgi/a/1700000000/",null,0);many.add(header);Random rand=new Random(8);for(int i=0;i<2000;i++)many.add(new o.mg(null,header.b+(i+1),String.format(Locale.ROOT,"%d name 2026/01/01(木) %02d:%02d:%02d.%03d ID:x\nbody",i+1,rand.nextInt(24),rand.nextInt(60),rand.nextInt(60),rand.nextInt(1000)),4));
 for(boolean newest:new boolean[]{true,false}){List<?> sorted=CachedResponseOrder.sorted(many,newest);check(sorted.size()==many.size(),"all responses retained");long last=newest?Long.MAX_VALUE:Long.MIN_VALUE;for(Object row:sorted){o.mg r=(o.mg)row;if(r.d==null)continue;long t=CachedResponseOrder.posted(r.d);check(newest?t<=last:t>=last,"entire result monotonic");last=t;}}
 System.out.println("PASS "+checks+" mixed response order checks");
 }
}