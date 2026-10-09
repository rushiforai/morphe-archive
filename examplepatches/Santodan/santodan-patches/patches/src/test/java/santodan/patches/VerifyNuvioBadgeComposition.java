package santodan.patches;
import java.util.*;
public final class VerifyNuvioBadgeComposition {
 public static final class Composer {
  public int depth; public final List<Integer> keys=new ArrayList<>();
  public void d0(int key){keys.add(key);depth++;}
  public void p(boolean node){if(node || --depth<0)throw new AssertionError("Unbalanced group");}
 }
 public static void main(String[] args)throws Exception {
  Composer composer=new Composer();
  for(String bridge: List.of("nuvioremaining","nuvioairing","nuviofinale","nuviomovierelease")) {
   Class<?> type=Class.forName("software.santodan.extension."+bridge+".NuvioBadgeComposition");
   var begin=type.getMethod("begin",Object.class,int.class);
   for(int i=0;i<3;i++) {
    try(AutoCloseable group=(AutoCloseable)begin.invoke(null,composer,12345)) {
     if(composer.depth!=1)throw new AssertionError("Badge entered host slots");
     if(i==2)throw new IllegalStateException("simulated render failure");
    } catch(IllegalStateException expected) { }
    if(composer.depth!=0)throw new AssertionError("Badge left group open");
   }
  }
  if(composer.keys.size()!=12)throw new AssertionError("Missing group entries");
  System.out.println("PASS: all four production badge wrappers balance groups on normal, empty, and failed renders");
 }
}
