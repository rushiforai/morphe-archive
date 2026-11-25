package nl.johninnl.navigation.startup;
import org.junit.Test;
import static org.junit.Assert.*;

public class StartupPolicyTest {
    private Object policy() throws Exception { return Class.forName("nl.johninnl.navigation.startup.StartupPolicy").getConstructor().newInstance(); }
    private boolean start(Object p,long now,String health) throws Exception { return (Boolean)p.getClass().getMethod("shouldStart",long.class,String.class).invoke(p,now,health); }
    private void attempted(Object p,long now) throws Exception { p.getClass().getMethod("attempted",long.class).invoke(p,now); }
    @Test public void stoppedEngineStartsButRunningWithoutGpsDoesNot() throws Exception {
        Object p=policy();assertTrue(start(p,1000,"stopped"));assertFalse(start(p,1000,"running"));
    }
    @Test public void startupGetsThirtySecondsBeforeRetryAndBackoffIsBounded() throws Exception {
        Object p=policy();attempted(p,1000);assertFalse(start(p,30999,"starting"));assertTrue(start(p,31000,"starting"));
        for(int i=0;i<12;i++)attempted(p,100000);
        assertFalse(start(p,159999,"stopped"));assertTrue(start(p,160000,"stopped"));
    }
    @Test public void permissionAndDisabledStatesNeverRestart() throws Exception {
        Object p=policy();for(String state:new String[]{"disabled","permission_required","unavailable","incompatible"})assertFalse(start(p,100000,state));
    }
    @Test public void changingSourceResetsPreviousRetryBudget() throws Exception {
        Object p=policy();attempted(p,1000);assertFalse(start(p,1001,"stopped"));p.getClass().getMethod("reset").invoke(p);assertTrue(start(p,1001,"stopped"));
    }
}
