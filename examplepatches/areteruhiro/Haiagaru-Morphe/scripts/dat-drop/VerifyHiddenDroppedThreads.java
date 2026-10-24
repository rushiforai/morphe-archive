package app.morphe.extension.chmate;
import java.util.*;
public class VerifyHiddenDroppedThreads {
 static int checks;static void check(boolean ok,String label){if(!ok)throw new AssertionError(label);checks++;}
 public static void main(String[]args)throws Exception{
  Object header=new Object();
  for(Object dropped:new Object[]{new o.onAdDisplayed.setIcon(1),new o.Yy2.open(3),new o.getAvailabilityStatus.r8lambdawJ5MHcSJed_CjC7r4OWD0UxyJsQ(1)}){
   Object live=new o.onAdDisplayed.setIcon(2);List<Object> source=Arrays.asList(header,live,dropped);
   check(HiddenDroppedThreads.dropped(dropped),"native drop bit");check(!HiddenDroppedThreads.dropped(live),"other state bit preserved");
   for(int mode:new int[]{101,102,103,-101}){List<?> out=HiddenDroppedThreads.filter(source,mode,true);check(out.equals(Arrays.asList(header,live)),"target mode "+mode);check(source.size()==3,"source unchanged");}
   check(HiddenDroppedThreads.filter(source,104,true)==source,"posted untouched");if(!HiddenDroppedThreads.historyMode(100))check(HiddenDroppedThreads.filter(source,100,true)==source,"mode 100 outside DAT targets for 242+");check(HiddenDroppedThreads.filter(source,103,false)==source,"OFF restores original");
  }
  System.out.println("PASS: "+checks+" DAT-drop display checks");
 }
}
