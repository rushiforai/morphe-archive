package e.e.a;
import java.lang.management.*;import java.util.*;import java.text.*;
public final class AuditHostBenchmark {
 public static void main(String[] args)throws Exception{SimpleDateFormat f=new SimpleDateFormat("yyyy年MM月dd日 HH時mm分",Locale.ROOT);f.setTimeZone(TimeZone.getTimeZone("Asia/Tokyo"));String[] inputs=new String[4096];for(int i=0;i<inputs.length;i++)inputs[i]=f.format(new Date(1700000000000L+i*60000L));long sum=0;for(int k=0;k<2;k++)for(String input:inputs)sum+=RowDates194.millis(input);
 com.sun.management.ThreadMXBean bean=(com.sun.management.ThreadMXBean)ManagementFactory.getThreadMXBean();long id=Thread.currentThread().getId(),allocated=bean.getThreadAllocatedBytes(id),cpu=bean.getCurrentThreadCpuTime(),start=System.nanoTime();for(int k=0;k<10;k++)for(String input:inputs)sum+=RowDates194.millis(input);long elapsed=System.nanoTime()-start;cpu=bean.getCurrentThreadCpuTime()-cpu;allocated=bean.getThreadAllocatedBytes(id)-allocated;System.out.println("{\"elapsed_ms\":"+elapsed/1e6+",\"cpu_ms\":"+cpu/1e6+",\"allocated_bytes\":"+allocated+",\"checksum\":"+sum+"}");}
}
