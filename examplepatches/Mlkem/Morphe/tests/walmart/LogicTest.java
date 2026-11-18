import app.canada.walmart.CanadaHooks;
import app.canada.walmart.PriceLedger;
import app.canada.walmart.ListMath;
import java.util.*;
public class LogicTest {
  enum Tab {TAB_1,TAB_2,TAB_3}
  static int checks;
  static void check(boolean value) { checks++; if(!value)throw new AssertionError("Check "+checks); }
  public static void main(String[] args) {
    check(CanadaHooks.defaultTab(Tab.TAB_1)==Tab.TAB_2);
    check(CanadaHooks.defaultTab(Tab.TAB_3)==Tab.TAB_3);
    check(CanadaHooks.defaultTab(null)==null);
    Map<Tab,String> m=new LinkedHashMap<>();m.put(Tab.TAB_1,"Shop");m.put(Tab.TAB_2,"My Items");m.put(Tab.TAB_3,"Account");
    Map result=CanadaHooks.filterNav(Collections.unmodifiableMap(m));
    check(m.size()==3 && result.size()==2);
    check(!result.containsKey(Tab.TAB_1) && result.containsKey(Tab.TAB_3));
    check(CanadaHooks.filterNav(Collections.singletonMap(Tab.TAB_1,"Shop")).size()==1);
    check(CanadaHooks.statusLabel(null,null,false).equals("Availability unknown"));
    check(CanadaHooks.statusLabel("UNKNOWN__","",false).equals("Availability unknown"));
    check(CanadaHooks.statusLabel("OUT_OF_STOCK",null,false).equals("Out of stock"));
    check(CanadaHooks.statusLabel("NOT_AVAILABLE",null,true).equals("Indisponible"));
    check(CanadaHooks.statusLabel("IN_STOCK","Only 3 left",false).equals("In stock — Only 3 left"));
    check(CanadaHooks.statusLabel("IN_STOCK",null,false).equals("In stock"));
    check(CanadaHooks.statusLabel("UNKNOWN__","Limit 5",false).startsWith("Availability unknown"));
    check(PriceLedger.cents(null)==null);
    check(PriceLedger.cents(Double.NaN)==null);
    check(PriceLedger.cents(Double.POSITIVE_INFINITY)==null);
    check(PriceLedger.cents(-.01)==null);
    check(PriceLedger.cents(0.0)==0L);
    check(PriceLedger.cents(1.005)==101L);
    check(PriceLedger.cents(4.99)==499L);
    Calendar cal=Calendar.getInstance();cal.set(2026,Calendar.NOVEMBER,1,12,0,0);long day=cal.getTimeInMillis();
    List<PriceLedger.Point> first=PriceLedger.observe(Collections.emptyList(),day,499);
    check(first.size()==1);
    check(PriceLedger.observe(first,day+1000,499).size()==1);
    List<PriceLedger.Point> drop=PriceLedger.observe(first,day+2000,399);
    check(drop.size()==2 && first.size()==1);
    check(PriceLedger.previousDifferent(drop)==499L);
    check(PriceLedger.observe(drop,day-1000,299).size()==2);
    List<PriceLedger.Point> tomorrow=PriceLedger.observe(drop,day+86400000,399);
    check(tomorrow.size()==3 && PriceLedger.previousDifferent(tomorrow)==499L);
    check(PriceLedger.previousDifferent(first)==null);
    String encoded=PriceLedger.encode(tomorrow);
    check(PriceLedger.encode(PriceLedger.decode(encoded)).equals(encoded));
    check(PriceLedger.decode("garbage;1,-99;1,abc;2,3;").size()==1);
    List<PriceLedger.Point> many=Collections.emptyList();
    for(int i=0;i<45;i++)many=PriceLedger.observe(many,day+i*1000,i);
    check(many.size()==30 && many.get(0).cents==15 && many.get(29).cents==44);
    check(PriceLedger.previousDifferent(many)==43);
    check(ListMath.natural("A2","A10")<0);
    check(ListMath.natural("A10","A2")>0);
    check(ListMath.natural(" A02 ","a2")==0);
    check(ListMath.natural("A2-2","A2-11")<0);
    check(ListMath.natural("A99999999999999999999","A100000000000000000000")<0);
    check(ListMath.natural("A2","B1")<0);
    check(ListMath.natural("A2","A2A")<0);
    check(ListMath.line(8.0,5.0,2,false,true)==800); // server line already includes quantity
    check(ListMath.line(null,5.0,2,false,true)==1000);
    check(ListMath.line(null,1.005,2,false,true)==201); // round extended price once
    check(ListMath.line(null,5.0,null,false,true)==null);
    check(ListMath.line(null,5.0,0,false,true)==null);
    check(ListMath.line(null,5.0,-1,false,true)==null);
    check(ListMath.line(null,5.0,100001,false,true)==null);
    check(ListMath.line(null,5.0,2,false,false)==null); // unknown weight is not guessed
    check(ListMath.line(7.3,5.0,2,false,false)==730); // supplied weight line is usable
    check(ListMath.line(7.3,5.0,2,true,true)==null); // price range excluded
    check(ListMath.line(null,Double.NaN,2,false,true)==null);
    check(ListMath.line(null,Double.POSITIVE_INFINITY,2,false,true)==null);
    check(ListMath.line(null,-1.0,2,false,true)==null);
    check(ListMath.line(0.0,5.0,2,false,true)==0); // free line is not replaced with unit price
    ListMath.Total total=new ListMath.Total();total.add(800L,false);total.add(250L,true);total.add(null,false);total.add(-1L,true);total.add(0L,false);
    check(total.remaining==800 && total.collected==250);
    check(total.known==3 && total.unknown==2);
    System.out.println(checks+" navigation, stock, history, aisle-order and subtotal checks passed");
  }
}
