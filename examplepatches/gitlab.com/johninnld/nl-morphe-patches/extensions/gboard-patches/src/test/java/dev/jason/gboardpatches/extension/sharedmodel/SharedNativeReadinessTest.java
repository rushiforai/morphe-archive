package dev.jason.gboardpatches.extension.sharedmodel;
import org.junit.*;
import static org.junit.Assert.*;
public class SharedNativeReadinessTest {
    static final class Signal implements SharedNativeReadiness.Signal {
        boolean present,stock;int additions,removals;
        public boolean provisioned(){return present;}
        public boolean stockProvisioned(){return stock;}
        public void provision(){present=true;additions++;}
        public void revoke(){present=false;removals++;}
    }
    @Test public void readyHostPublishesOneProvisioningSignal()throws Exception{Signal signal=new Signal();SharedNativeReadiness.Claim claim=new SharedNativeReadiness.Claim();claim.update(true,signal);claim.update(true,signal);assertTrue(signal.present);assertEquals(1,signal.additions);}
    @Test public void unavailableHostRevokesOnlyItsOwnSignal()throws Exception{Signal signal=new Signal();SharedNativeReadiness.Claim claim=new SharedNativeReadiness.Claim();claim.update(true,signal);claim.update(false,signal);assertFalse(signal.present);assertEquals(1,signal.removals);}
    @Test public void existingGoogleProvisioningIsNeverClaimedOrRemoved()throws Exception{Signal signal=new Signal();signal.present=true;SharedNativeReadiness.Claim claim=new SharedNativeReadiness.Claim();claim.update(true,signal);claim.update(false,signal);assertTrue(signal.present);assertEquals(0,signal.removals);assertFalse(claim.supplied);}
    @Test public void laterGoogleProvisioningSurvivesSwitchingOffShared()throws Exception{Signal signal=new Signal();SharedNativeReadiness.Claim claim=new SharedNativeReadiness.Claim();claim.update(true,signal);signal.stock=true;claim.update(false,signal);assertTrue(signal.present);assertEquals(0,signal.removals);}
    @Test public void nativeLifecycleRemovalCanBeRestoredWhileHostRemainsReady()throws Exception{Signal signal=new Signal();SharedNativeReadiness.Claim claim=new SharedNativeReadiness.Claim();claim.update(true,signal);signal.present=false;claim.update(true,signal);assertTrue(signal.present);assertEquals(2,signal.additions);}
}
