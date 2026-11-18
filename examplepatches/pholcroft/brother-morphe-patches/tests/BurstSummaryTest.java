import app.template.extension.extension.*;
import java.util.Arrays;

public class BurstSummaryTest {
    public static void main(String[] args){
        RequestRecord.Details live=new RequestRecord.Details("192.0.2.1",161,1,1,1000,2,"id","encoded","success",-1);
        RequestRecord.Details hit=new RequestRecord.Details("192.0.2.1",161,1,2,1000,2,"id","encoded","success",1000000000L);
        RequestRecord a=new RequestRecord("a",0,"1.2.3",0,500000000L,false,null,live);
        RequestRecord b=new RequestRecord("b",1,"1.2.4",500000000L,600000000L,true,null,hit);
        ActivityBurst burst=new ActivityBurst(new ActivityBurst.Ref("p","b",7),1,600000000L,Arrays.asList(a,b),"192.0.2.1",new ActivityBurst.Coverage(true,false,1,1));
        BurstSummary.Metrics m=BurstSummary.calculate(burst);
        if(m.hits!=1||m.misses!=1||m.savedNanos!=900000000L||m.actualRequestNanos!=600000000L||m.withoutCacheNanos!=1500000000L||!m.complete)throw new AssertionError("compare the same burst's summed request times");
        if(!m.headline().contains("0.90")||!m.comparison().contains("60% faster"))throw new AssertionError("show estimated saving and correct request-time percentage");
        if(!m.comparison().startsWith("1.50s"))throw new AssertionError("crossed-out value must not have a tilde");
        if(m.cachePercent()!=50)throw new AssertionError("cache percentage must reflect the request count");
        ActivityBurst empty=new ActivityBurst(burst.ref,1,0,java.util.Collections.emptyList(),"192.0.2.1",new ActivityBurst.Coverage(true,true,0,0));
        if(BurstSummary.calculate(empty).cachePercent()!=-1)throw new AssertionError("zero requests have no cache percentage");
        RequestRecord.Details unknown=new RequestRecord.Details("192.0.2.1",161,1,2,1000,2,"id","encoded","success",-1);
        ActivityBurst partial=new ActivityBurst(burst.ref,1,600000000L,Arrays.asList(a,new RequestRecord("b",1,"1.2.4",500000000L,600000000L,true,null,unknown)),"192.0.2.1",new ActivityBurst.Coverage(true,false,0,1));
        BurstSummary.Metrics p=BurstSummary.calculate(partial);
        if(p.complete||p.comparison().contains("%")||!p.headline().contains("unavailable"))throw new AssertionError("missing samples must not yield a fabricated estimate");
    }
}
