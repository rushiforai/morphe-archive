package app.morphe.extension.chmate;
import java.util.*;
public class VerifyNativeDrawDates {
 static int checks;
 static void check(boolean value,String label){if(!value)throw new AssertionError(label);checks++;}
 static class Parser {
  GregorianCalendar d=new GregorianCalendar(TimeZone.getTimeZone("Asia/Tokyo"));
  int calls;
  public long haiagaruNativeDrawDate(String value){calls++;if("error".equals(value))throw new IllegalArgumentException("native");return value==null?-1:100L+value.hashCode();}
 }
 public static void main(String[]args){
  Parser a=new Parser();long value=NativeDrawDates.parse(a,"2026/10/21 01:02:03.000");
  check(value==100L+"2026/10/21 01:02:03.000".hashCode(),"native value preserved");
  for(int i=0;i<10000;i++)check(NativeDrawDates.parse(a,"2026/10/21 01:02:03.000")==value,"repeat value");
  check(a.calls==1,"one native parse for repeated redraw");
  Parser b=new Parser();check(NativeDrawDates.parse(b,"2026/10/21 01:02:03.000")==value&&b.calls==0,"new redraw parser shares equivalent calendar scope");
  Parser c=new Parser();c.d.setTimeZone(TimeZone.getTimeZone("UTC"));NativeDrawDates.parse(c,"2026/10/21 01:02:03.000");
  check(c.calls==1,"different timezone never reuses value");
  check(NativeDrawDates.parse(a,null)==-1,"null preserves native behavior");
  boolean thrown=false;try{NativeDrawDates.parse(a,"error");}catch(IllegalArgumentException e){thrown=true;}check(thrown,"native exception preserved");
  for(int i=0;i<2200;i++)NativeDrawDates.parse(a,String.format(Locale.ROOT,"2026/10/21 01:%02d:%02d.%03d",i/60%60,i%60,i%1000));
  int before=a.calls;NativeDrawDates.parse(a,"2026/10/21 01:00:00.000");check(a.calls==before+1,"LRU bound evicts oldest");
  before=a.calls;NativeDrawDates.parse(a,"partial");NativeDrawDates.parse(a,"partial");check(a.calls==before+2,"partial date always native");
  before=a.calls;NativeDrawDates.parse(a,"2026/10/21(水) 01:02:03.68");NativeDrawDates.parse(a,"2026/10/21(水) 01:02:03.68");check(a.calls==before+1,"native two-digit fractional date cached");
  System.out.println("PASS "+checks+" native draw date cache checks");
 }
}
