package app.morphe.extension.chmate;
import java.util.*;
class Haiagaru { static android.content.Context applicationContextForExtension(){return new android.content.Context();} }
class WacchoiSearchOptions {static String PREFS="fixture";}
class PopularReplies {static boolean directFor(android.content.Context c){return false;}}
class ResponseArchiveEntry {static Object field(Object o,String n)throws Exception{var f=o.getClass().getDeclaredField(n);f.setAccessible(true);return f.get(o);}}
class ExtraQuickFilters {static int reads;static Object rowResponse(Object o){reads++;return ((PopularMembershipTest.Row)o).r;} static int number(Object o){return ((PopularMembershipTest.Res)o).n;}static void nativeRowsReady(){} }
public class PopularMembershipTest {
 static class Res {int s=3,n;Res(int n){this.n=n;}public boolean equals(Object v){return v instanceof Res&&((Res)v).n==n;}public int hashCode(){return n;}}
 static class Row {int j;Res r;Row(Res r){this.r=r;}}
 static class Adapter {int M=0,D=3;}
 public static void main(String[] args)throws Exception{
  var rows=new ArrayList<Row>();var responses=new ArrayList<Res>();for(int i=1;i<=10000;i++){Res r=new Res(i);rows.add(new Row(r));responses.add(r);}
  PopularNativeRows.captureLegacy(new Adapter(),rows);var original=PopularNativeRows.find(responses);if(original==null)throw new AssertionError("full capture");
  ExtraQuickFilters.reads=0;for(int i=0;i<100;i++)PopularNativeRows.captureLegacy(new Adapter(),List.of(new Row(responses.get(9999))));
  if(ExtraQuickFilters.reads!=100)throw new AssertionError("popup traversed parent rows: "+ExtraQuickFilters.reads);
  if(PopularNativeRows.find(responses)!=original)throw new AssertionError("popup replaced parent");
  Res foreign=new Res(1);PopularNativeRows.captureLegacy(new Adapter(),List.of(new Row(foreign)));if(PopularNativeRows.find(List.of(foreign))==null)throw new AssertionError("value equality mistaken for identity");
  if(original.selected(3).size()!=10000)throw new AssertionError("popularity selection changed");
  System.out.println("PASS: 100 popups over 10000 responses use 100 row reads; full capture and identity ownership preserved");
 }
}