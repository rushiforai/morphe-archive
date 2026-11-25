package nl.johninnl.navigation.alerts;

import android.os.Bundle;
import android.os.IBinder;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.HashSet;
import java.util.Set;

/** Manual Binder protocol; no application model or custom Parcelable crosses processes. */
public final class WarningWire {
    public static final String DESCRIPTOR="nl.johninnl.navigation.WARNINGS_V1";
    public static final String CALLBACK="nl.johninnl.navigation.WARNINGS_CALLBACK_V1";
    public static final int REGISTER=1,CONFIRM=2,GET_STATE=3,CLAIM_AUDIO=4,RENEW_AUDIO=5,RESUME=6,
            BEGIN_ATTEMPT=7,OUTCOME=8,RELEASE=9,ACK=10,PING=11,PREVIEW=12;
    public static final int VERIFY=1,EVENTS=2,STATE_INVALIDATED=3,OWNER_REVOKED=4;
    public static final int MAX_FRAME=256*1024;
    private WarningWire() { }
    public static Bundle status(String value) { Bundle b=new Bundle();b.putString("status",value);return b; }
    static String text(Bundle b,String key) { Object x=b.get(key);if(!(x instanceof String))throw new IllegalArgumentException("FIELD_TYPE:"+key);return (String)x; }
    static long number(Bundle b,String key) { Object x=b.get(key);if(!(x instanceof Long))throw new IllegalArgumentException("FIELD_TYPE:"+key);return (Long)x; }
    static int integer(Bundle b,String key) { Object x=b.get(key);if(!(x instanceof Integer))throw new IllegalArgumentException("FIELD_TYPE:"+key);return (Integer)x; }
    static boolean flag(Bundle b,String key) { Object x=b.get(key);if(!(x instanceof Boolean))throw new IllegalArgumentException("FIELD_TYPE:"+key);return (Boolean)x; }
    static Set<String> strings(Bundle b,String key) {
        Object raw=b.get(key);if(!(raw instanceof ArrayList))throw new IllegalArgumentException("FIELD_TYPE:"+key);
        ArrayList<?> values=(ArrayList<?>)raw;if(values.size()>WarningCapabilities.MAX_CAPABILITIES)throw new IllegalArgumentException("CAPABILITY_COUNT");
        Set<String> out=new HashSet<>();for(Object value:values) { if(!(value instanceof String))throw new IllegalArgumentException("FIELD_TYPE:"+key);out.add((String)value); }
        return out;
    }
    static Set<WarningAudioOwner.Mode> modes(Bundle b) {
        Set<WarningAudioOwner.Mode> out=EnumSet.noneOf(WarningAudioOwner.Mode.class);
        for(String value:strings(b,"output_modes"))out.add(WarningAudioOwner.Mode.valueOf(value));return out;
    }
    static Bundle grant(PlaybackGrant g) {
        Bundle b=new Bundle();b.putString("boot",g.bootIdentity);b.putString("session",g.providerSession);b.putString("consumer_nonce",g.consumerNonce);
        b.putString("owner_token",g.ownerToken);b.putString("event_key",g.eventKey);b.putString("attempt_id",g.attemptId);b.putString("attempt_nonce",g.attemptNonce);
        b.putInt("uid",g.ownerUid);b.putLong("epoch",g.ownerEpoch);b.putLong("revision",g.revision);b.putString("mode",g.mode.name());
        b.putString("outcome",g.outcome.name());b.putBoolean("granted",g.granted);b.putBoolean("started",g.started);return b;
    }
    static PlaybackGrant grant(Bundle b) {
        return new PlaybackGrant(text(b,"boot"),text(b,"session"),text(b,"consumer_nonce"),text(b,"owner_token"),text(b,"event_key"),text(b,"attempt_id"),
                text(b,"attempt_nonce"),integer(b,"uid"),number(b,"epoch"),number(b,"revision"),WarningAudioOwner.Mode.valueOf(text(b,"mode")),
                PlaybackGrant.Outcome.valueOf(text(b,"outcome")),flag(b,"granted"),flag(b,"started"));
    }
    static Bundle checked(Bundle b) { if(WarningCodec.encodedSize(b)>MAX_FRAME)throw new IllegalArgumentException("FRAME_SIZE");return b; }
}
