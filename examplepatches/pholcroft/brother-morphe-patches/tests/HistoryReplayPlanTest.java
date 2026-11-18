import app.template.extension.extension.*;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;

public class HistoryReplayPlanTest {
    public static void main(String[] args){
        RequestRecord.Details d=new RequestRecord.Details("192.0.2.1",161,1,7,1000,2,"opaque","encoded","success",-1);
        RequestRecord a=new RequestRecord("a",0,"1.2.3",0,1,false,"integer:1".getBytes(StandardCharsets.UTF_8),d);
        RequestRecord b=new RequestRecord("b",1,"1.2.3",2,3,true,"integer:2".getBytes(StandardCharsets.UTF_8),d);
        ActivityBurst burst=new ActivityBurst(new ActivityBurst.Ref("printer","burst",5),1,3,Arrays.asList(a,b),"192.0.2.1",new ActivityBurst.Coverage(true,true,0,1));
        HistoryReplayPlan plan=HistoryReplayPlan.from(burst,id->"community");
        if(plan.specs.size()!=2||!plan.responses.get(0).equals("integer:1")||!plan.responses.get(1).equals("integer:2"))throw new AssertionError("recorded request order and responses must match");
        try{HistoryReplayPlan.from(burst,id->null);throw new AssertionError("missing credentials must abort");}catch(IllegalStateException expected){}
        ActivityBurst incomplete=new ActivityBurst(burst.ref,1,3,Arrays.asList(a,b),"192.0.2.1",new ActivityBurst.Coverage(false,true,0,1));
        try{HistoryReplayPlan.from(incomplete,id->"community");throw new AssertionError("incomplete sequences must abort");}catch(IllegalStateException expected){}
    }
}
