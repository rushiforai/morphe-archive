package e.e.a;
import java.lang.management.ManagementFactory;
public final class FilterBenchmark {
 public static void main(String[] args){String[] words=new String[128],rows=new String[128];for(int i=0;i<128;i++){words[i]="missing-keyword-"+i;rows[i]="Video title ＡＢＣ 実況 テスト "+i;}int checksum=0;for(int i=0;i<20000;i++)if(ContentFilterRules.blocked(rows[i%128],words))checksum++;
 com.sun.management.ThreadMXBean bean=(com.sun.management.ThreadMXBean)ManagementFactory.getThreadMXBean();long id=Thread.currentThread().getId(),allocated=bean.getThreadAllocatedBytes(id),cpu=bean.getCurrentThreadCpuTime(),started=System.nanoTime();for(int i=0;i<100000;i++)if(ContentFilterRules.blocked(rows[i%128],words))checksum++;long elapsed=System.nanoTime()-started;cpu=bean.getCurrentThreadCpuTime()-cpu;allocated=bean.getThreadAllocatedBytes(id)-allocated;System.out.println("{\"elapsed_ms\":"+elapsed/1e6+",\"cpu_ms\":"+cpu/1e6+",\"allocated_bytes\":"+allocated+",\"checksum\":"+checksum+"}");}
}
