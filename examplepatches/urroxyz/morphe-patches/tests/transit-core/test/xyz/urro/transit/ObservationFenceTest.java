package xyz.urro.transit;
import java.util.List;
public class ObservationFenceTest {
 public static void main(String[] args){
  ObservationFence f=new ObservationFence(2,100,20000,List.of("old-start"));
  if(f.accept(2,99,"before-fence"))throw new AssertionError("backwards clock");
  if(f.accept(2,101,"old-start"))throw new AssertionError("stale event");
  if(f.accept(1,101,"new-start"))throw new AssertionError("old command");
  if(!f.accept(2,102,"new-start"))throw new AssertionError("new event missing");
  if(f.accept(2,103,"new-start"))throw new AssertionError("duplicate event");
  if(f.accept(2,20101,"late-stop"))throw new AssertionError("expired command");
  System.out.println("ObservationFence PASS: baseline cursor, generations, duplicate rejection, bounded lifetime");
 }
}
