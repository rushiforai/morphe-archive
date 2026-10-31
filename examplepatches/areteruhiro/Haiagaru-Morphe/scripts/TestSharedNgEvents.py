from pathlib import Path
root=Path.cwd();s=(root/'extensions/chmate/src/main/java/app/morphe/extension/chmate/PersonalNgSubmissions.java').read_text(encoding='utf-8');a=s.index('    private static synchronized void cancelRetry()');b=s.index('    static void addSettings',a);methods=s[a:b]
code=r'''import java.util.concurrent.*;import java.util.*;import java.util.concurrent.atomic.AtomicBoolean;
public class PersonalNgSubmissions {
 static Object context=new Object();static ScheduledFuture<?> retryTask;static long retryGeneration;static AtomicBoolean pending=new AtomicBoolean();static FakeIO IO=new FakeIO();static Prefs p=new Prefs();static int runs,checks;
 static Prefs prefs(){return p;}static void collect(){if(p.consent)runs++;}
 static class Prefs{boolean consent;boolean getBoolean(String k,boolean d){return consent;}}
 static class Job implements ScheduledFuture<Object>{Runnable task;long delay;boolean cancelled;Job(Runnable task,long delay){this.task=task;this.delay=delay;}public boolean cancel(boolean x){cancelled=true;return true;}public boolean isCancelled(){return cancelled;}public boolean isDone(){return cancelled;}public Object get(){return null;}public Object get(long t,TimeUnit u){return null;}public long getDelay(TimeUnit u){return u.convert(delay,TimeUnit.MILLISECONDS);}public int compareTo(Delayed x){return 0;}}
 static class FakeIO{List<Job> jobs=new ArrayList<>();Job schedule(Runnable task,long delay,TimeUnit unit){Job job=new Job(task,unit.toMillis(delay));jobs.add(job);return job;}}
 static void check(boolean ok,String label){if(!ok)throw new AssertionError(label);checks++;}
'''+methods+r'''
 public static void main(String[]args){
 changed();check(IO.jobs.isEmpty(),"no trigger before consent");scheduleRetry(100);check(IO.jobs.isEmpty(),"no retry before consent");
 p.consent=true;for(int i=0;i<20;i++)changed();check(IO.jobs.size()==1&&IO.jobs.get(0).delay==1000,"rapid saves debounce to one second");
 IO.jobs.get(0).task.run();check(runs==1&&!pending.get(),"save trigger collects once");changed();check(IO.jobs.size()==2,"later save creates another trigger");IO.jobs.get(1).task.run();check(runs==2,"second save collected");
 scheduleRetry(900000);Job first=(Job)retryTask;check(first.delay==900000,"failure retries once after fifteen minutes");scheduleRetry(1000);Job second=(Job)retryTask;check(first.cancelled&&second!=first,"new retry replaces old one");first.task.run();check(runs==2,"obsolete retry ignored even if delivered");
 second.task.run();check(runs==3&&retryTask==null,"one-shot retry has no periodic reschedule");
 scheduleRetry(0);check(((Job)retryTask).delay==1000,"batch drain has minimum one second spacing");Job third=(Job)retryTask;cancelRetry();third.task.run();check(third.cancelled&&runs==3&&retryTask==null,"cancel invalidates pending callback");
 scheduleRetry(1000);Job fourth=(Job)retryTask;p.consent=false;fourth.task.run();check(runs==3,"consent withdrawal blocks queued retry");cancelRetry();changed();check(!pending.get(),"consent OFF has no new event task");
 System.out.println("PASS "+checks+" event-trigger and one-shot retry checks");}}
'''
out=root/'build/shared-ng-events-host';out.mkdir(exist_ok=True);java=out/'PersonalNgSubmissions.java';java.write_text(code,encoding='utf-8')
assert 'scheduleWithFixedDelay' not in s and 'scheduleAtFixedRate' not in s
assert 'Switch periodic=' not in s and 'intervalSeconds(' not in s
jdk=Path('C:/Users/narum/jdk-21.0.9+10/bin')
import subprocess
subprocess.run([str(jdk/'javac.exe'),'-J-Xmx96m','-d',str(out),str(java)],check=True)
subprocess.run([str(jdk/'java.exe'),'-Xmx64m','-cp',str(out),'PersonalNgSubmissions'],check=True)
