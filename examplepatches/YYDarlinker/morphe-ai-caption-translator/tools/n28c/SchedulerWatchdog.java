import java.lang.instrument.Instrumentation;
import java.lang.management.*;
import java.nio.file.*;

/** Test-only JVM agent: full lock-owner stacks on deadlock, assertion, or a runner timeout request. */
public final class SchedulerWatchdog {
  public static void premain(String argument, Instrumentation ignored) throws Exception {
    Path output=Path.of(System.getProperty("scheduler.output"));Files.createDirectories(output);
    Files.writeString(output.resolve("worker.pid"),Long.toString(ProcessHandle.current().pid()));
    Thread watcher=new Thread(()->{
      try {
        ThreadMXBean mx=ManagementFactory.getThreadMXBean();boolean captured=false;
        while(true) {
          boolean deadlock=mx.findDeadlockedThreads()!=null;
          if(!captured && (deadlock || Files.exists(output.resolve("failure.request")))) {
            StringBuilder dump=new StringBuilder("test="+System.getProperty("scheduler.tests")
                +"\ninput_sha="+System.getProperty("scheduler.inputSha")+"\npid="+ProcessHandle.current().pid()
                +"\nlock_graph=C alone; S alone; connections alone; Publication CAS reserve/revoke\n");
            if(Files.exists(output.resolve("failure.request")))dump.append(Files.readString(output.resolve("failure.request"))).append('\n');
            for(ThreadInfo t:mx.getThreadInfo(mx.getAllThreadIds(),true,true)) {
              if(t==null)continue;
              dump.append(t.getThreadName()).append(" id=").append(t.getThreadId()).append(' ').append(t.getThreadState())
                  .append(" lock=").append(t.getLockInfo()).append(" owner=").append(t.getLockOwnerName()).append(" owner_id=").append(t.getLockOwnerId()).append('\n');
              for(StackTraceElement frame:t.getStackTrace())dump.append("  at ").append(frame).append('\n');
              for(MonitorInfo monitor:t.getLockedMonitors())dump.append("  locked ").append(monitor).append(" depth=").append(monitor.getLockedStackDepth()).append('\n');
              for(LockInfo lock:t.getLockedSynchronizers())dump.append("  synchronizer ").append(lock).append('\n');
            }
            Files.writeString(output.resolve("failure-full-threads.txt"),dump.toString());
            if(deadlock)Files.writeString(output.resolve("deadlock.detected"),"MXBEAN_DEADLOCK\n");
            captured=true;
          }
          Thread.sleep(25);
        }
      }catch(Exception failure){failure.printStackTrace();}
    },"Scheduler-Regression-LockWatchdog");watcher.setDaemon(true);watcher.start();
  }
}
