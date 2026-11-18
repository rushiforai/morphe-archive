import app.canada.walmart.*;
import com.walmart.glass.lists.domain.*;
public class AdHistoryTest {
 static int checks;
 static void check(boolean b){checks++;if(!b)throw new AssertionError("Ad/history check "+checks);}
 public static class Section {public String a="";public boolean b;}
 public static class Price {public String a="$5.00";public Double b=5.0;public boolean o,B;}
 public static class Data {public String j="product",i="item",g="offer",k="seller",z="EACH",t="PICKUP";}
 public static class Model {public Price price=new Price();public Data data=new Data();public Price U(){return price;}public Data getData(){return data;}}
 public static void main(String[]a)throws Exception {
  Section s=new Section();check(!AdRules.sponsored(s));check(!AdRules.sponsored(null));s.a="Sponsored";check(AdRules.sponsored(s));s.a="Commandité";check(AdRules.sponsored(s));s.a="";s.b=true;check(AdRules.sponsored(s));s.b=false;s.a="  ";check(!AdRules.sponsored(s));
  check(HistoryValue.exactDisplay("$5.00",500));check(HistoryValue.exactDisplay("5,00 $",500));check(HistoryValue.exactDisplay("CA$1,234.50",123450));check(HistoryValue.exactDisplay("1\u202f234,50 $",123450));
  for(String value:new String[]{"From $5.00","$5–$8","$5 - $8","$5+","See price in cart","$50.00"})check(!HistoryValue.exactDisplay(value,500));
  Model m=new Model();check(HistoryValue.browse(m).cents==500);m.price.o=true;check(HistoryValue.browse(m)==null);m.price.o=false;m.price.a="$5–$8";check(HistoryValue.browse(m)==null);m.price.a="$5.00";m.data.j="";m.data.i="";check(HistoryValue.browse(m)==null);
  ListItemProduct p=new ListItemProduct("A2");ListItem.ListDetailItem d=new ListItem.ListDetailItem(p);check(HistoryValue.list(d).cents==500);p.h=true;check(HistoryValue.list(d)==null);p.h=false;p.i=true;check(HistoryValue.list(d)==null);p.i=false;p.A.f=null;check(HistoryValue.list(d)==null);
  System.out.println(checks+" ad classification, price extraction and exact-display checks passed");
 }
}
