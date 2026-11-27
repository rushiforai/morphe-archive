import java.util.*;
import android.view.*;
import android.content.Context;
import local.wazemaps.themes.*;
import local.wazemaps.alerts.AlertDistance;
public class ValidateSettingsRows {
 static int runs;
 static View decorate(View view,int patch){return patch==0?ThemeSelector.decorate(view):patch==1?IconPack.decorate(view):patch==2?AlertDistance.decorate(view):AndroidAutoSettings.decorate(view);}
 static void check(List<Integer> order){
  Context context=new Context(); View original=new View(context);original.setTag("map_mode"); View result=original;
  for(int patch:order) result=decorate(result,patch);
  for(int patch:order) result=decorate(result,patch);
  List<String> expected=new ArrayList<>(List.of("map_mode"));
  String[] names={"morphe_themes","morphe_icon_pack","morphe_alert_distance","morphe_aa_setup"};
  for(int i=0;i<4;i++)if(order.contains(i))expected.add(names[i]);
  List<String> actual=new ArrayList<>();
  if(result instanceof ViewGroup){ViewGroup group=(ViewGroup)result;if(group.getChildAt(0)!=original)throw new AssertionError("Dark mode replaced");for(int i=0;i<group.getChildCount();i++)actual.add((String)group.getChildAt(i).getTag());}else actual.add((String)result.getTag());
  if(!expected.equals(actual))throw new AssertionError(order+" -> "+actual);
  View unrelated=new View(context); unrelated.setTag("other");for(int patch:order)if(decorate(unrelated,patch)!=unrelated)throw new AssertionError("Unrelated row changed");
  runs++;
 }
 static void visit(List<Integer> order){check(order);for(int i=0;i<4;i++)if(!order.contains(i)){List<Integer> next=new ArrayList<>(order);next.add(i);visit(next);}}
 public static void main(String[] args){
  visit(List.of()); Context context=new Context();if(!IconPack.summary(context).equals("Google Maps"))throw new AssertionError("Default icon pack");
  context.saved="waze";if(!IconPack.summary(context).equals("Waze original"))throw new AssertionError("Saved stock choice lost");
  context.saved="google_maps";if(!IconPack.summary(context).equals("Google Maps"))throw new AssertionError("Saved Google choice lost");
  System.out.println("PASS: "+runs+" settings selections/orders, repeat decoration, original row preservation, Google default and saved icon choices (JVM view fixtures)");
 }
}