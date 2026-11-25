package nl.johninnl.navigation.alerts;

import android.os.Binder;
import android.os.SystemClock;
import java.io.IOException;

/** Real Binder endpoint with deterministic, isolated storage for schema-1 tests. */
public final class WarningEndpointFixtures {
    private WarningEndpointFixtures(){}
    private static WarningCapabilities profile(){return new WarningCapabilities(FlitsmeisterWarningTypes.MANIFEST_DIGEST,FlitsmeisterWarningTypes.required(),false);}
    public static WarningEndpoint empty(){
        return new WarningEndpoint(20000,uid->"app.vela",profile(),()->new WarningEndpoint.Storage("boot-count:7",new PlaybackStore(){
            private PlaybackGrant value;
            public PlaybackGrant load(){return value;}
            public void save(PlaybackGrant next){value=next;}
        },null),SystemClock::elapsedRealtime,Binder::getCallingUid);
    }
    public static WarningEndpoint failing(){
        return new WarningEndpoint(20000,uid->"app.vela",profile(),()->{throw new IOException("UNAVAILABLE_STORAGE");},SystemClock::elapsedRealtime,Binder::getCallingUid);
    }
}
