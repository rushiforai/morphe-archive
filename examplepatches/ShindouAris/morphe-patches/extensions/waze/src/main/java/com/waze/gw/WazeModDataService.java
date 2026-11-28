package com.waze.gw;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.Binder;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.RemoteCallbackList;
import android.os.RemoteException;
import android.os.SystemClock;
import android.util.Log;

import java.util.ArrayList;

/**
 * Third-party Data API (docs/THIRD_PARTY_API.md). The Binder is hand-written against the published
 * com.wazemod.api AIDL contract: interface descriptors, transaction codes FIRST_CALL_TRANSACTION + id
 * and Bundle marshalling (int 1 + writeToParcel) match what the AIDL tool generates for clients.
 * Snapshot fields mirror HLP/1 (same canonical state and codecs).
 */
public final class WazeModDataService extends Service {
    private static final String TAG = "WazeGW-DataApi";
    private static final String DESCRIPTOR = "com.wazemod.api.IWazeModData";
    private static final String LISTENER_DESCRIPTOR = "com.wazemod.api.IWazeModListener";
    private static final int API_VERSION = 1;
    private static final int GET_API_VERSION = IBinder.FIRST_CALL_TRANSACTION + 1;
    private static final int GET_SNAPSHOT = IBinder.FIRST_CALL_TRANSACTION + 2;
    private static final int REGISTER_LISTENER = IBinder.FIRST_CALL_TRANSACTION + 3;
    private static final int UNREGISTER_LISTENER = IBinder.FIRST_CALL_TRANSACTION + 4;
    private static final int ON_UPDATE = IBinder.FIRST_CALL_TRANSACTION + 1;
    private static final int ON_REVOKED = IBinder.FIRST_CALL_TRANSACTION + 2;
    private static final long UPDATE_INTERVAL_MS = 200L;   // at most 5 updates per second
    private static final int MAX_ALERTS = 3;

    private static volatile WazeModDataService instance;

    /** Cookie = caller UID, so a revoked app's listeners can be found and dropped. */
    private final RemoteCallbackList<Listener> listeners = new RemoteCallbackList<Listener>();
    private HandlerThread thread;
    private Handler handler;
    private volatile String lastSignature = "";     // reset from Binder threads on register

    private static final class Listener implements IInterface {
        final IBinder binder;
        Listener(IBinder binder) { this.binder = binder; }
        @Override public IBinder asBinder() { return binder; }
    }

    private final Runnable push = new Runnable() {
        @Override public void run() {
            if (listeners.getRegisteredCallbackCount() == 0) return;   // restarted by register
            try {
                HudCanonicalState state = HudCanonicalState.capture(WazeModDataService.this);
                String signature = HlpStateEncoder.signature(state, HlpProtocol.SUPPORTED_FIELDS);
                if (!signature.equals(lastSignature)) {
                    lastSignature = signature;
                    Bundle snapshot = snapshot(state);
                    int count = listeners.beginBroadcast();
                    try {
                        for (int i = 0; i < count; i++) {
                            send(listeners.getBroadcastItem(i).binder, ON_UPDATE, snapshot);
                        }
                    } finally {
                        listeners.finishBroadcast();
                    }
                }
            } catch (Throwable error) {
                Log.w(TAG, "update failed", error);
            }
            handler.postDelayed(this, UPDATE_INTERVAL_MS);
        }
    };

    private final Binder binder = new Binder() {
        @Override protected boolean onTransact(int code, Parcel data, Parcel reply, int flags)
                throws RemoteException {
            if (code < GET_API_VERSION || code > UNREGISTER_LISTENER)
                return super.onTransact(code, data, reply, flags);
            data.enforceInterface(DESCRIPTOR);
            int uid = Binder.getCallingUid();
            if (!DataApiGrants.isAllowedUid(WazeModDataService.this, uid)) {
                reply.writeException(new SecurityException("WazeMod: access not granted"));
                return true;
            }
            switch (code) {
                case GET_API_VERSION:
                    reply.writeNoException();
                    reply.writeInt(API_VERSION);
                    return true;
                case GET_SNAPSHOT:
                    Bundle snapshot = snapshot(HudCanonicalState.capture(WazeModDataService.this));
                    reply.writeNoException();
                    reply.writeInt(1);
                    snapshot.writeToParcel(reply, Parcelable.PARCELABLE_WRITE_RETURN_VALUE);
                    return true;
                case REGISTER_LISTENER: {
                    IBinder listener = data.readStrongBinder();
                    if (listener != null && listeners.register(new Listener(listener), uid)) {
                        lastSignature = "";            // the new listener gets a snapshot at once
                        startUpdates();
                    }
                    reply.writeNoException();
                    return true;
                }
                default: {                             // UNREGISTER_LISTENER
                    IBinder listener = data.readStrongBinder();
                    if (listener != null) listeners.unregister(new Listener(listener));
                    reply.writeNoException();
                    return true;
                }
            }
        }
    };

    { binder.attachInterface(null, DESCRIPTOR); }

    @Override public void onCreate() {
        super.onCreate();
        instance = this;
        thread = new HandlerThread("WazeModDataApi");
        thread.start();
        handler = new Handler(thread.getLooper());
    }

    @Override public IBinder onBind(Intent intent) { return binder; }

    @Override public void onDestroy() {
        instance = null;
        listeners.kill();
        thread.quitSafely();
        super.onDestroy();
    }

    private void startUpdates() {
        handler.removeCallbacks(push);
        handler.post(push);
    }

    /** Settings "Thu hồi": forget the grant and disconnect that app's listeners now. */
    static void revoke(Context context, String pkg) {
        DataApiGrants.revoke(context, pkg);
        final WazeModDataService service = instance;
        if (service == null) return;
        service.handler.post(new Runnable() {
            @Override public void run() { service.dropRevoked(); }
        });
    }

    private void dropRevoked() {
        ArrayList<Listener> revoked = new ArrayList<Listener>();
        int count = listeners.beginBroadcast();
        try {
            for (int i = 0; i < count; i++) {
                int uid = (Integer) listeners.getBroadcastCookie(i);
                if (!DataApiGrants.isAllowedUid(this, uid)) revoked.add(listeners.getBroadcastItem(i));
            }
        } finally {
            listeners.finishBroadcast();
        }
        for (Listener listener : revoked) {
            send(listener.binder, ON_REVOKED, null);
            listeners.unregister(listener);
        }
    }

    /** One-way call into the client's IWazeModListener. */
    private static void send(IBinder listener, int code, Bundle snapshot) {
        Parcel data = Parcel.obtain();
        try {
            data.writeInterfaceToken(LISTENER_DESCRIPTOR);
            if (code == ON_UPDATE) {
                data.writeInt(1);
                snapshot.writeToParcel(data, 0);
            }
            listener.transact(code, data, null, IBinder.FLAG_ONEWAY);
        } catch (Throwable ignored) {
            // A dead client is removed by RemoteCallbackList's death link.
        } finally {
            data.recycle();
        }
    }

    /** Same content as the HLP/1 state frame; keys documented in THIRD_PARTY_INTEGRATION.md. */
    static Bundle snapshot(HudCanonicalState s) {
        Bundle b = new Bundle();
        b.putInt("api", API_VERSION);
        b.putLong("timestamp", SystemClock.elapsedRealtime());
        b.putBoolean("navigating", s.navigating);
        b.putInt("speed", Math.max(0, s.speedKmh));
        b.putInt("speed_limit", Math.max(0, s.limitKmh));
        if (s.minimumLimitKmh >= 10) b.putInt("speed_min", s.minimumLimitKmh);
        b.putBoolean("overspeed", s.limitKmh >= 10 && s.speedKmh > s.limitKmh + s.overMargin);
        if (s.currentStreet.length() > 0) b.putString("current_street", s.currentStreet);
        if (s.navigating) {
            b.putInt("turn", s.turn);
            b.putInt("then_turn", s.nextTurn);
            b.putInt("turn_distance_m", s.turnDistanceM);
            b.putInt("roundabout_exit", s.exitNumber);
            b.putParcelableArray("lanes", lanes(s.lanes));
            if (s.nextStreet.length() > 0) b.putString("next_street", s.nextStreet);
            if (s.etaClock.length() > 0) b.putString("eta_clock", s.etaClock);
            b.putInt("eta_minutes", s.remainingMinutes);
            if (s.remainingMeters >= 0) b.putInt("remaining_m", s.remainingMeters);
        }
        b.putBoolean("avg_zone", s.averageZone);
        if (s.averageZone) {
            b.putInt("avg_remaining_m", s.averageLeftM);
            b.putInt("avg_recommended_speed", s.recommendedSpeedKmh);
            b.putInt("avg_percent", s.averagePercent);
        }
        b.putParcelableArray("alerts", alerts(s));
        return b;
    }

    /** HLP "lan": per lane, direction bitmask and recommended subset; lanes with no direction skipped. */
    private static Bundle[] lanes(Gateway.LaneSnapshot lanes) {
        ArrayList<Bundle> result = new ArrayList<Bundle>();
        for (int lane = 0; lane < lanes.size(); lane++) {
            int directions = 0;
            int recommended = 0;
            for (int angle = 0; angle < lanes.angleCount(lane); angle++) {
                int bit = HudLaneCodec.directionBit(lanes.angleAt(lane, angle));
                directions |= bit;
                if (lanes.isSelected(lane, angle)) recommended |= bit;
            }
            if (directions == 0) continue;
            Bundle item = new Bundle();
            item.putInt("directions", directions);
            item.putInt("recommended", recommended);
            result.add(item);
        }
        return result.toArray(new Bundle[0]);
    }

    /** HLP "alrs": nearest alerts first, type/value/jam details from the same codec. */
    private static Bundle[] alerts(HudCanonicalState s) {
        ArrayList<Bundle> result = new ArrayList<Bundle>();
        for (int i = 0; i < s.alerts.size() && result.size() < MAX_ALERTS; i++) {
            String[] row = s.alerts.get(i).rawRow.split("\\t", -1);
            if (row.length < 4) continue;
            int[] code = HudAlertCodec.decode(row);
            Bundle item = new Bundle();
            item.putInt("type", code[0]);
            item.putInt("distance_m", parseInt(row[3], -1));
            if (code[1] > 0) item.putInt("value", code[1]);
            int severity = HudAlertCodec.jamSeverity(row);
            int minutes = HudAlertCodec.jamDelayMinutes(row);
            if (severity > 0) item.putInt("jam_severity", severity);
            if (minutes > 0) item.putInt("jam_delay_min", minutes);
            result.add(item);
        }
        return result.toArray(new Bundle[0]);
    }

    private static int parseInt(String value, int fallback) {
        try { return Integer.parseInt(value.trim()); }
        catch (Throwable ignored) { return fallback; }
    }
}
