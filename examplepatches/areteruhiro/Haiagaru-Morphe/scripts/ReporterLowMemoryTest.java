package app.morphe.extension.chmate;

import android.content.SharedPreferences;
import java.lang.reflect.*;
import java.util.*;

/** Run with -Xmx32m: optional history metadata must avoid allocations/reads under pressure. */
public final class ReporterLowMemoryTest {
    public static void main(String[] args)throws Exception {
        String title="履歴の元タイトル",full="履歴 [id★]",board="bbs.eddibb.cc%2Fliveedge";
        SharedPreferences prefs=(SharedPreferences)Proxy.newProxyInstance(ReporterLowMemoryTest.class.getClassLoader(),new Class[]{SharedPreferences.class},(p,m,a)->{throw new AssertionError("Low-memory metadata accessed preferences: "+m.getName());});
        Field cache=EdgeReporterHistory.class.getDeclaredField("cache");cache.setAccessible(true);cache.set(null,prefs);
        // Load paths before holding the synthetic memory pressure.
        EdgeReporterId.isBoard(board);EdgeReporterId.suffix(full);ReporterMetadataWrites.headroom();
        List<byte[]> held=new ArrayList<>();while(ReporterMetadataWrites.headroom())held.add(new byte[256*1024]);
        if(EdgeReporterHistory.historyTitle(1234567890L,board,title)!=title)throw new AssertionError("History original not preserved");
        if(EdgeReporterHistory.displayTitle(1234567890L,title)!=title)throw new AssertionError("Display original not preserved");
        if(EdgeReporterHistory.resolveTitle(board,title)!=title)throw new AssertionError("Menu original not preserved");
        if(EdgeReporterHistory.copyTitle(full)!=full)throw new AssertionError("Copy original not preserved");
        EdgeReporterHistory.capture(board,Collections.singletonList(full));
        held.clear();System.out.println("PASS 5 low-heap reporter fallback checks; existing preferences untouched");
    }
}
