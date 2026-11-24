package android.os;
import java.util.PriorityQueue;
public class Handler {
 private static long now, seq;
 private static final class Task implements Comparable<Task>{
  final long time, order;final Runnable job;
  Task(long time,Runnable job){this.time=time;this.job=job;order=seq++;}
  public int compareTo(Task t){int c=Long.compare(time,t.time);return c==0?Long.compare(order,t.order):c;}
 }
 private static final PriorityQueue<Task> queue=new PriorityQueue<>();
 public Handler(Looper l){}
 public boolean post(Runnable r){return postDelayed(r,0);}
 public boolean postDelayed(Runnable r,long delay){queue.add(new Task(now+Math.max(0,delay),r));return true;}
 public static long now(){return now;}
 public static void advance(long ms){long target=now+ms;while(!queue.isEmpty()&&queue.peek().time<=target){Task t=queue.remove();now=t.time;t.job.run();}now=target;}
 public static void drain(){int n=0;while(!queue.isEmpty()){if(++n>1000)throw new IllegalStateException("unbounded tasks");advance(queue.peek().time-now);}}
}
