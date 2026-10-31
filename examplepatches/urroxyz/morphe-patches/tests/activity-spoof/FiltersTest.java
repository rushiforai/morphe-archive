package xyz.urro.activityspoof;
import com.google.android.gms.location.*;
import java.util.*;
public final class FiltersTest {
 public static void main(String[] args)throws Exception {
  ActivityTransitionRequest request=new ActivityTransitionRequest(Arrays.asList(
   new ActivityTransition.Builder().setActivityType(0).setActivityTransition(0).build(),
   new ActivityTransition.Builder().setActivityType(0).setActivityTransition(1).build(),
   new ActivityTransition.Builder().setActivityType(7).setActivityTransition(0).build()));
  int[] got=Sdk.filters(request);
  if(!Arrays.equals(new int[]{0,0,0,1,7,0},got))throw new AssertionError(Arrays.toString(got));
  System.out.println("PASS: real Google location SDK transition request filters extracted exactly");
 }
}
