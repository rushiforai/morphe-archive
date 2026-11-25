package nl.johninnl.navigation.alerts;
import static org.junit.Assert.*;
import java.util.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
@RunWith(RobolectricTestRunner.class) @Config(sdk=32,manifest=Config.NONE)
public class WarningDiagnosticsTest {
    @Test public void timingEvidenceContainsNoWarningMessageCoordinatesOrRawId(){
        WarningEvent event=new WarningSchedulerTest().event("private-warning-52.123-5.456",0,1,WarningEvent.Operation.ANNOUNCE);
        WarningDiagnostics.event(event,"RECEIVER_ACCEPTED",1020);
        Map<String,Object> row=WarningDiagnostics.snapshot().get(WarningDiagnostics.snapshot().size()-1);
        assertEquals(1020L,row.get("elapsed_ms"));assertEquals(1000L,row.get("issued_ms"));assertEquals(event.providerSession,row.get("provider_session"));
        assertFalse(row.toString().contains("private-warning"));assertFalse(row.containsKey("message"));assertFalse(row.containsKey("latitude"));assertFalse(row.containsKey("longitude"));assertTrue(((String)row.get("event_key")).matches("[0-9a-f]{64}"));
    }
    @Test public void ringAndSnapshotsAreBoundedAndImmutable(){
        WarningEvent event=new WarningSchedulerTest().event("bounded",1,1,WarningEvent.Operation.ANNOUNCE);
        for(int i=0;i<WarningDiagnostics.MAX_RECORDS+10;i++)WarningDiagnostics.event(event,"QUEUED",1000+i);
        List<Map<String,Object>> snapshot=WarningDiagnostics.snapshot();assertEquals(WarningDiagnostics.MAX_RECORDS,snapshot.size());
        try{snapshot.clear();fail("Mutable snapshot");}catch(UnsupportedOperationException expected){}
        try{snapshot.get(0).put("message","forged");fail("Mutable row");}catch(UnsupportedOperationException expected){}
    }
}
