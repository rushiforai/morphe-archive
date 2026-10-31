package com.dhuadapter.mediabridge;

import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.graphics.Bitmap;
import android.media.MediaMetadata;
import android.media.Rating;
import android.media.session.MediaController;
import android.media.session.PlaybackState;
import android.net.Uri;
import android.os.Binder;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Parcel;
import android.os.RemoteException;
import android.util.Log;

/**
 * Bridges the patched app's own MediaSession to Zeekr MediaCenter by binding
 * DIRECTLY to ZeekrMediaCenterService and speaking raw Binder — NO Zeekr SDK
 * facade, NO MediaCenterAPI, NO special permission, NO native .so.
 *
 * Why direct-bind instead of the SDK: the SDK's MediaCenterAPI.init routes
 * through com.zeekr.coreservice, which enforces a package allowlist and rejects
 * a non-whitelisted app server-side ("mediacenter is not available", disconnect
 * 305) BEFORE our client-side getAvailableServices hook can fire. The service
 * ecarx.xsf.mediacenter.ZeekrMediaCenterService, however, is exported with NO
 * android:permission (verified in XSFMediaCenter.apk manifest) and does not
 * check the caller package — so binding to it directly registers anyone.
 *
 * Protocol (firmware-verified against vendored SDK smali $Stub TRANSACTION_*
 * constants + jadx of XSFMediaCenter.apk; see
 * docs/zeekr-mediacenter-protocol-verified.md):
 *
 *   LAYER 1 (transport) — com.zeekr.sdk.base.internal.IZeekrSupportService
 *     asyncBinderCall(ZeekrPlatformMessage, IBinder callback)  transact code 3
 *     ZeekrPlatformMessage = {mServiceName, mMoudleName, mMethod, mMethodParam[B, mAttachParam[B}
 *     Bootstrap issues method "mediaCenterRegisterMusicNew" (+ 3 more) with a
 *     register-callback binder; the media-center calls our callbacks back with
 *     the token + per-service binders.
 *
 *   LAYER 2 (AIDL services, obtained via the callbacks / getMediaControllerApi):
 *     IMediaCenterSvc               requestPlay=6, updateMusicPlaybackState=7,
 *                                   getStateBinder=0x21, getMediaControllerApi=0x23
 *     IMediaControllerApiSvc.register=1 (writeString pkg + writeStrongBinder
 *                                   IMediaController -> readStrongBinder token)
 *     IZeekrMusicClient (OUR stub)  steering-wheel commands onPlay=1..progressDrag=0x24
 *     IMusicPlaybackInfo (OUR stub) getTitle=2, getArtist=3, ... getPackageName=0x1b
 *
 * IN-PROCESS in the patched app via a Pine hook (attachController). The one
 * empirically-unresolved piece is the exact ZeekrPlatformMessage string values
 * and the mMethodParam protobuf schema for mediaCenterRegisterMusicNew: we send
 * a minimal payload (protobuf field 1 = package name) and log the reply code so
 * an on-DHU run reveals whether more is required.
 *
 * Artwork: prefer a plain http(s) ART_URI from MediaMetadata (media-center
 * fetches it directly); fall back to CoverProvider content:// for a Bitmap.
 */
public final class MediaBridge {

    private static final String TAG = "DhuAdapter";

    // ── Descriptors (firmware-verified) ────────────────────────────────
    private static final String DESC_SUPPORT   = "com.zeekr.sdk.base.internal.IZeekrSupportService";
    private static final String DESC_CENTER    = "com.zeekr.sdk.mediacenter.IMediaCenterSvc";
    private static final String DESC_CONTROLLER= "com.zeekr.sdk.mediacenter.control.IMediaControllerApiSvc";
    private static final String DESC_MUSIC_CLIENT = "com.zeekr.sdk.mediacenter.IZeekrMusicClient";
    private static final String DESC_PLAYBACK_INFO= "com.zeekr.sdk.mediacenter.IMusicPlaybackInfo";
    private static final String DESC_REGISTER_CB  = "com.zeekr.sdk.mediacenter.IRegisterCallBack";
    private static final String DESC_TOKEN_CB     = "com.zeekr.mediacenter.ITokenCallBack";
    private static final String DESC_CENTER_CB    = "com.zeekr.sdk.mediacenter.IMediaCenterSvcCallBack";


    // ── LAYER-1 transport codes ────────────────────────────────────────
    private static final int TX_ASYNC_BINDER_CALL = 3;    // IZeekrSupportService.asyncBinderCall

    // ── LAYER-2 IMediaCenterSvc codes ──────────────────────────────────
    private static final int TX_REQUEST_PLAY            = 6;
    private static final int TX_UPDATE_PLAYBACK_STATE   = 7;
    private static final int TX_UPDATE_CURRENT_SOURCE_TYPE = 9;   // updateCurrentSourceType(token,int) — needs focus
    private static final int TX_UPDATE_CURRENT_PROGRESS    = 11;  // updateCurrentProgress(token,long) — server fans out to cluster/dim/widget
    private static final int TX_DECLARE_SUPPORT_COLLECT    = 16;  // declareSupportCollectTypes(token,int[]) — server forwards onCollect only to declared clients
    private static final int TX_UPDATE_PLAYLIST            = 10;  // updatePlaylist(token,int type,List<IMedia>) — needs focus; feeds center/dim "next up"
    private static final int ZK_MEDIA_LIST_TYPE_NORMAL     = 0;   // TYPE_MEDIA_LIST_NORMAL
    private static final int TX_GET_STATE_BINDER        = 0x21; // 33
    private static final int TX_GET_MEDIA_CONTROLLER_API= 0x23; // 35

    // ── IStateRecoverApiSvc (state-recovery plane, from getStateBinder) ─
    private static final String DESC_STATE_RECOVER =
            "com.zeekr.sdk.mediacenter.staterecover.IStateRecoverApiSvc";
    private static final String DESC_RECOVERY_LISTENER =
            "com.zeekr.sdk.mediacenter.staterecover.IMusicRecoveryListener";
    private static final int TX_SR_REGISTER_RECOVERY_INTENT = 1;  // (token,int,String)->bool
    private static final int TX_SR_GET_RECOVERY_INFO        = 4;  // (token)->IMusicPlaybackInfo
    private static final int TX_SR_SET_CALLBACK             = 5;  // (token,IMusicRecoveryListener)->bool
    private static final int TX_SR_ON_COMPLETE              = 6;  // (token)->void
    // IMusicRecoveryListener incoming codes (server pushes resume here)
    private static final int TX_RL_ON_GET_MEDIA_LIST    = 1;
    private static final int TX_RL_ON_GET_PLAYBACK_INFO = 2;
    private static final int TX_RL_ON_RESUME            = 3;   // onResumePlaybackInfo(...)

    /** Action fired by the server's recovery broadcast → our RecoveryReceiver. */
    static final String RECOVERY_ACTION = "com.dhuadapter.RECOVER";

    // ── IMediaControllerApiSvc codes ───────────────────────────────────
    private static final int TX_REGISTER                = 1;    // register(pkg, IMediaController)->token

    // ── IRegisterCallBack getter codes (media-center reads binders from reply) ──
    private static final int TX_GET_REGISTER            = 1;    // -> ITokenCallBack
    private static final int TX_GET_MUSIC_CLIENT        = 2;    // -> IZeekrMusicClient

    // ── ITokenCallBack / IMediaCenterSvcCallBack incoming codes ────────
    private static final int TX_TOKEN_ON_CALLBACK       = 1;    // ITokenCallBack.onCallback(token)
    private static final int TX_CENTER_CB_GET_SVC       = 2;    // IMediaCenterSvcCallBack.getIMediaCenterSvc

    // ── IZeekrMusicClient incoming steering codes (subset we act on) ───
    private static final int TX_MC_ON_PLAY      = 1;
    private static final int TX_MC_ON_PAUSE     = 2;
    private static final int TX_MC_ON_NEXT      = 3;
    private static final int TX_MC_ON_PREVIOUS  = 4;
    private static final int TX_MC_ON_FORWARD   = 5;
    private static final int TX_MC_ON_REWIND    = 6;
    private static final int TX_MC_ON_COLLECT   = 0xf;  // 15 onCollect(int type, boolean isCollect) — VR path
    private static final int TX_MC_CTRL_COLLECT = 32;   // ctrlCollect(int type, boolean) -> int — widget V1 path
    private static final int TX_MC_OPERATION_TYPE = 33; // operationType(int) — server calls it before collect
    private static final int TX_MC_CTRL_COLLECT_ASYNC = 45; // ctrlCollectAsync(from, displayId, type, boolean, IZeekrPlatformCallback) -> boolean — widget V2 path
    private static final String DESC_PLATFORM_CB = "com.zeekr.sdk.base.internal.IZeekrPlatformCallback";
    private static final int TX_MC_GET_PLAYBACK_INFO = 0xa;
    private static final int TX_MC_GET_SOURCE_TYPE_LIST    = 11;  // -> int[] (createIntArray)
    private static final int TX_MC_GET_CURRENT_SOURCE_TYPE = 12;  // -> int
    private static final int TX_MC_GET_CURRENT_PROGRESS    = 13;  // -> long (drives cluster seek bar)
    private static final int TX_MC_PROGRESS_DRAG = 0x24;

    // ── IMusicPlaybackInfo outgoing (media-center reads track fields from us) ──
    private static final int TX_PI_GET_LAUNCH_INTENT  = 1;    // -> PendingIntent (wake-from-sleep)
    private static final int TX_PI_GET_TITLE          = 2;
    private static final int TX_PI_GET_ARTIST         = 3;
    private static final int TX_PI_GET_ALBUM          = 4;
    private static final int TX_PI_GET_DURATION       = 7;
    private static final int TX_PI_GET_SOURCE_TYPE    = 9;
    private static final int TX_PI_GET_PLAYBACK_STATUS= 0xb;
    private static final int TX_PI_GET_ARTWORK        = 0x10;
    private static final int TX_PI_GET_UUID           = 24;   // 0x18 -> per-track uuid (recovery/dedup)
    private static final int TX_PI_GET_APP_NAME       = 0x19;
    private static final int TX_PI_GET_PACKAGE_NAME   = 0x1b;
    private static final int TX_PI_GET_PLAYING_LIST_ID = 30;  // 0x1e -> "info id" in server log
    private static final int TX_PI_GET_PLAYING_LIST_TYPE = 32; // 0x20 -> list type (int)
    private static final int TX_PI_GET_PLAYER_INTENT  = 0x21;  // 33 -> PendingIntent (wake, player UI)
    // ── capability / collect / lyric getters (server reads these to drive the UI) ──
    private static final int TX_PI_GET_LYRIC_CONTENT      = 12;   // 0xc  -> String
    private static final int TX_PI_GET_LYRIC              = 13;   // 0xd  -> Uri (nullable)
    private static final int TX_PI_GET_CUR_LYRIC_SENTENCE = 14;   // 0xe  -> String
    private static final int TX_PI_IS_SUPPORT_COLLECT     = 20;   // 0x14 -> bool (favourite supported)
    private static final int TX_PI_IS_COLLECTED           = 21;   // 0x15 -> bool (currently favourited)
    private static final int TX_PI_IS_SUPPORT_DOWNLOAD    = 22;   // 0x16 -> bool
    private static final int TX_PI_IS_SUPPORT_LOOP        = 28;   // 0x1c -> bool (repeat/shuffle switch)
    private static final int TX_PI_GET_COLLECT_TYPE       = 36;   // 0x24 -> int (TYPE_COLLECTION_*)
    private static final int TX_PI_GET_TRANSLATED_LYRICS  = 54;   // 0x36 -> String
    private static final int TX_PI_IS_SUPPORT_DRAG        = 48;   // 0x30 -> bool (seek-bar draggable)
    private static final int ZK_COLLECTION_MUSIC          = 0;    // TYPE_COLLECTION_MUSIC
    private static final int TX_PI_GET_PLAY_CTRL_SUPPORT  = 47;   // 0x2f -> int bitmask: bit0=NEXT, bit1=play/pause, bit2=PREVIOUS

    // PlaybackStatus ints per firmware: IDLE=0, PLAYING=1, PAUSED=2.
    private static final int ZK_STATUS_IDLE = 0;
    private static final int ZK_STATUS_PLAYING = 1;
    private static final int ZK_STATUS_PAUSED = 2;

    // SourceType per firmware com.zeekr.sdk.mediacenter.SourceType. A third-party
    // streaming player is SOURCE_TYPE_ONLINE=6 (the server itself treats netease/
    // qq music as sourceType==6 in MediaMainApiImpl). NOT 0=LOCAL — LOCAL is the
    // built-in local-media source and routes third-party apps into the wrong
    // (com.zeekr.local / DEFAULT_MEDIA_PACKAGE) handling + icon/category.
    private static final int ZK_SOURCE_TYPE_ONLINE = 6;

    private static final String MEDIACENTER_PKG = "com.zeekr.mediacenter";
    private static final String SERVICE_ACTION  = "ecarx.xsf.ZEEKR_MEDIA_CENTER_SERVICE";
    private static final String SERVICE_CLASS   = "ecarx.xsf.mediacenter.ZeekrMediaCenterService";

    // Bootstrap ZeekrPlatformMessage fields (firmware-verified). The server
    // dispatches purely by mMethod; mServiceName/mMoudleName are not matched, so
    // the SDK's "mediacenter"/"ZeekrMediaCenterAPI" values are used verbatim.
    private static final String MSG_SERVICE_NAME = "mediacenter";            // mServiceName (domain)
    private static final String MSG_MODULE_NAME  = "ZeekrMediaCenterAPI";    // mMoudleName
    private static final String MSG_METHOD_REGISTER = "mediaCenterRegisterMusicNew";
    // Second EAS invoke: server calls getIMediaCenterSvc on our
    // IMediaCenterSvcCallBack, handing us the IMediaCenterSvc binder we push
    // updateMusicPlaybackState (code 7) on. Payload = marshalled RequestMediaSvcPois.
    private static final String MSG_METHOD_UPDATE_PLAYBACK_STATE_EAS =
            "mediaCenterUpdateMusicPlayBackState";

    private final Context appContext;
    private final Handler main = new Handler(Looper.getMainLooper());

    private volatile boolean bound;
    private volatile boolean initStarted;

    private volatile IBinder supportBinder;     // IZeekrSupportService (bind result)
    private volatile IBinder mediaCenterSvc;     // IMediaCenterSvc (from callback)
    private volatile IBinder controllerApiSvc;   // IMediaControllerApiSvc (getMediaControllerApi)
    private volatile IBinder stateSvc;           // IStateRecoverApiSvc (getStateBinder)
    private volatile IBinder token;              // IMediaCenterClientToken (from ITokenCallBack)
    private volatile boolean registered;
    private volatile boolean lastPlaying;        // edge-track PLAYING for requestPlay re-acquire
    private volatile boolean progressTicking;    // 1 Hz progress pump active (playing)
    private volatile boolean collectDeclared;    // declareSupportCollectTypes sent for this registration
    private volatile long collectDiagActions = -1L; // last actions value logged by the collect diagnostic
    private static final long PROGRESS_TICK_MS = 1000L;

    private volatile MediaController controller;

    /** Most-recent instance, so a cold-start RecoveryReceiver can reach the bridge. */
    private static volatile MediaBridge INSTANCE;

    public MediaBridge(Context appContext) {
        this.appContext = appContext.getApplicationContext();
        INSTANCE = this;
    }

    // ── Lifecycle ──────────────────────────────────────────────────────

    /** Bind to ZeekrMediaCenterService; bootstrap runs in onServiceConnected. Idempotent. */
    public synchronized void bind() {
        if (initStarted) {
            return;
        }
        initStarted = true;
        main.post(new Runnable() {
            @Override public void run() {
                try {
                    Intent i = new Intent(SERVICE_ACTION)
                            .setComponent(new ComponentName(MEDIACENTER_PKG, SERVICE_CLASS));
                    boolean ok = appContext.bindService(i, connection, Context.BIND_AUTO_CREATE);
                    Log.i(TAG, "MediaBridge.bindService(" + SERVICE_ACTION + ") -> " + ok);
                    if (!ok) {
                        // Fall back to action-only resolution (some builds resolve by action).
                        appContext.bindService(new Intent(SERVICE_ACTION).setPackage(MEDIACENTER_PKG),
                                connection, Context.BIND_AUTO_CREATE);
                    }
                } catch (Throwable t) {
                    Log.e(TAG, "MediaBridge.bind failed", t);
                    initStarted = false;
                }
            }
        });
    }

    private final ServiceConnection connection = new ServiceConnection() {
        @Override public void onServiceConnected(ComponentName name, IBinder service) {
            Log.i(TAG, "MediaCenter connected: " + name);
            supportBinder = service;
            bound = true;
            bootstrap();
        }
        @Override public void onServiceDisconnected(ComponentName name) {
            Log.w(TAG, "MediaCenter disconnected: " + name);
            bound = false;
            supportBinder = null;
            mediaCenterSvc = null;
            controllerApiSvc = null;
            stateSvc = null;
            token = null;
            registered = false;
            progressTicking = false;
            collectDeclared = false;
            main.removeCallbacks(progressTick);
        }
    };

    /**
     * LAYER 1 bootstrap. Two independent invokes over IZeekrSupportService
     * (transact code 3), each carrying a ZeekrPlatformMessage + a callback:
     *
     *   (1) mediaCenterRegisterMusicNew, payload = protobuf{pkg}, cb =
     *       IRegisterCallBack → server pulls getMusicClient()(code2) +
     *       getRegister()(code1) and delivers the token via
     *       ITokenCallBack.onCallback → onTokenReceived().
     *   (2) mediaCenterUpdateMusicPlayBackState, payload = a marshalled
     *       RequestMediaSvcPois (Parcelable, all-null is valid), cb =
     *       IMediaCenterSvcCallBack → server calls getIMediaCenterSvc(code2)
     *       handing us the IMediaCenterSvc binder, which we need to push
     *       updateMusicPlaybackState (code 7) — the ONLY path that fills the
     *       server's MusicPlaybackInfoHolder (title/artist/status/artwork). The
     *       server does NOT pull metadata from the registered client; without
     *       this second invoke the source appears but shows no metadata.
     *
     * Invoke (2) is standalone (server gate is only mMainBinder != null, set at
     * service init) — it does not depend on (1) completing. We fire both.
     *
     * NOTE: the server dispatches purely by mMethod; mServiceName/mMoudleName
     * are not matched, so a single attempt suffices. registerEx / IExCallback
     * is a Widget/VR-Ex concern, NOT music registration — not sent here.
     */
    private void bootstrap() {
        IBinder svc = supportBinder;
        if (svc == null) {
            return;
        }
        String label = appContext.getPackageName();
        try {
            // (1) register → token via ITokenCallBack
            byte[] regPayload = protobufString1(label);   // protobuf ZeekrCommonMsg.m{1:pkg}
            int c1 = asyncBinderCall(svc, MSG_SERVICE_NAME, MSG_MODULE_NAME,
                    MSG_METHOD_REGISTER, regPayload, registerCallback);
            Log.i(TAG, "invoke(mediaCenterRegisterMusicNew) mCode=" + c1);
        } catch (Throwable t) {
            Log.e(TAG, "register invoke failed", t);
        }
        try {
            // (2) updateMusicPlayBackState → IMediaCenterSvc via IMediaCenterSvcCallBack.
            //     payload = marshalled RequestMediaSvcPois (recoveryIntent=null,
            //     content=null): writeParcelable(null)=writeInt(-1), writeList(null)=
            //     writeInt(-1). Built in-process via Parcel (blob is ABI-local; we
            //     never share it off-device, so a hand-built parcel is fine).
            byte[] svcPayload = marshallEmptyMediaSvcPois();
            int c2 = asyncBinderCall(svc, MSG_SERVICE_NAME, MSG_MODULE_NAME,
                    MSG_METHOD_UPDATE_PLAYBACK_STATE_EAS, svcPayload, centerCallback);
            Log.i(TAG, "invoke(mediaCenterUpdateMusicPlayBackState) mCode=" + c2);
        } catch (Throwable t) {
            Log.e(TAG, "updateMusicPlayBackState invoke failed", t);
        }
    }

    /**
     * Marshal a minimal RequestMediaSvcPois the server accepts. Its Parcelable
     * writeToParcel is exactly: writeParcelable(recoveryIntent, flags) then
     * writeList(content). Both null → two writeInt(-1). The server's
     * CREATOR.createFromParcel never returns null, so pois != null holds and
     * getIMediaCenterSvc fires. (content=null makes the server's post-callback
     * getContent().size() log NPE, but that is caught AFTER the binder is
     * already handed over — harmless.)
     */
    private static byte[] marshallEmptyMediaSvcPois() {
        Parcel p = Parcel.obtain();
        try {
            p.writeInt(-1);   // writeParcelable(recoveryIntent=null) → null marker
            p.writeInt(0);    // writeList(content=EMPTY) → size 0 (not -1/null): keeps the
                              //   server's post-callback getContent().size() log from NPE-ing
            return p.marshall();
        } finally {
            p.recycle();
        }
    }

    /**
     * LAYER 1 transport: IZeekrSupportService.asyncBinderCall(ZeekrPlatformMessage, IBinder).
     * Returns the ZeekrPlatformRetMessage.mCode (200/0xC8 == accepted) or -1 on failure.
     */
    private int asyncBinderCall(IBinder target, String serviceName, String moduleName,
                                String method, byte[] methodParam, IBinder callback)
            throws RemoteException {
        Parcel data = Parcel.obtain();
        Parcel reply = Parcel.obtain();
        try {
            data.writeInterfaceToken(DESC_SUPPORT);
            data.writeInt(1);                       // presence flag: msg != null
            //   ── ZeekrPlatformMessage.writeToParcel (5 fields, no trailing flag) ──
            data.writeString(serviceName);          // mServiceName ("mediacenter")
            data.writeString(moduleName);           // mMoudleName ("ZeekrMediaCenterAPI")
            data.writeString(method);               // mMethod
            data.writeByteArray(methodParam);       // mMethodParam (protobuf)
            data.writeByteArray(null);              // mAttachParam (null in SDK)
            // NOTE: NO writeInt here. The server's IZeekrSupportService$Stub reads
            // asyncBinderCall(msg, readStrongBinder()) — the strong binder comes
            // IMMEDIATELY after the message. A stray writeInt(0) here lands where
            // the binder is read → server sees a null callback → NPE →
            // IRegisterCallBack.asInterface(null).getMusicClient() → mCode=502
            // → nothing registers. (The writeInt(0) belongs only to the else/
            // null-message branch of the SDK proxy.)
            data.writeStrongBinder(callback);       // callback binder (register cb)
            target.transact(TX_ASYNC_BINDER_CALL, data, reply, 0);
            reply.readException();
            // ZeekrPlatformRetMessage.createFromParcel: a presence-int comes FIRST,
            // then (if non-zero) mCode, mMsg, mAttachInfo. Read the presence int
            // before mCode, else we read the presence flag (always 1) as mCode.
            int mCode = -1;
            String mMsg = null;
            if (reply.readInt() != 0) {
                mCode = reply.readInt();
                mMsg = reply.readString();
            }
            Log.i(TAG, "asyncBinderCall reply mCode=" + mCode + " msg=" + mMsg);
            return mCode;
        } finally {
            reply.recycle();
            data.recycle();
        }
    }

    /**
     * Called from the ITokenCallBack stub when the media-center delivers the
     * IMediaCenterClientToken (phase-1 completion). Marks us registered and
     * pushes initial state. The control-plane (getMediaControllerApi/register)
     * is OPTIONAL and only attempted if an IMediaCenterSvc binder later arrives.
     */
    private synchronized void onTokenReceived(IBinder tk) {
        if (tk == null) {
            return;
        }
        token = tk;
        Log.i(TAG, "IMediaCenterClientToken received");
        maybeStartPushing();
    }

    /**
     * Fires once BOTH the token (from ITokenCallBack, invoke 1) and the
     * IMediaCenterSvc binder (from IMediaCenterSvcCallBack, invoke 2) have
     * arrived — they come from two independent callbacks in either order.
     * Idempotent. We push state here but do NOT requestPlay: claiming focus at
     * registration would steal the active source (radio/BT) even when nothing is
     * playing. Focus is claimed lazily on the first PLAYING transition instead
     * (requestPlayIfPlaying from the controller callback) — matching the
     * reference bridge, which only calls requestPlay on state==PLAYING.
     */
    private synchronized void maybeStartPushing() {
        if (registered || token == null || mediaCenterSvc == null) {
            return;
        }
        registered = true;
        Log.i(TAG, "token + IMediaCenterSvc both ready — claiming focus");
        // Firmware focus/ordering contract (MediaMainApiImpl): mFocusMusicClient is
        // assigned ONLY by requestPlay. Metadata(7)/pause routing/updateCurrentSourceType(9)
        // all require focus (checkMusicClientTokenValid z=true → "please requestPlay
        // first" otherwise). We are ALREADY registered (the server ran registerInMusic
        // inside registerMusicNew and returned our token), so no explicit registerInMusic
        // is needed — the log error was the FOCUS branch, not the register branch.
        //  1. requestPlay — the only thing that assigns mFocusMusicClient. Unconditional
        //     (not gated on PLAYING): we must hold focus from the start.
        requestPlay();
        //  2. updateCurrentSourceType — needs focus; declares us as ONLINE.
        updateCurrentSourceType();
        //  3. recovery callback — needs registration (not focus).
        tryStateRecovery();
        // mFocusMusicClient is assigned on the server's MediaCenterService Handler
        // thread (async), so an immediate pushState would race ahead of the grant and
        // get rejected. Push ONLY after the grant settles (no immediate pre-focus push
        // → clean log, no early "please requestPlay first").
        main.postDelayed(new Runnable() { @Override public void run() { pushState(); } }, 400);
        main.postDelayed(new Runnable() { @Override public void run() { pushState(); } }, 1500);
        // Progress fan-out: once focus settles, start pumping position to the server,
        // which forwards it to cluster, dim AND the launcher widget
        // (MediaMainApiImpl.updateCurrentProgress -> getCtrlWidgetCallback().updateProgress).
        main.postDelayed(new Runnable() { @Override public void run() { startProgressTicks(); } }, 1600);
        // Seed the "next up" list once focus has settled.
        main.postDelayed(new Runnable() { @Override public void run() { updatePlaylist(); } }, 1700);
        main.postDelayed(new Runnable() { @Override public void run() { declareCollectIfSupported(); } }, 1800);
        // Seed the playing-edge tracker so the first onPlaybackStateChanged doesn't
        // re-fire requestPlay (focus already claimed above).
        PlaybackState p0 = ps();
        lastPlaying = p0 != null && p0.getState() == PlaybackState.STATE_PLAYING;
    }

    /** IMediaCenterSvc.updateCurrentSourceType(9): token + sourceType int. Needs focus. */
    private void updateCurrentSourceType() {
        IBinder center = mediaCenterSvc;
        IBinder tk = token;
        if (center == null || tk == null) {
            return;
        }
        Parcel data = Parcel.obtain();
        Parcel reply = Parcel.obtain();
        try {
            data.writeInterfaceToken(DESC_CENTER);
            data.writeStrongBinder(tk);
            data.writeInt(ZK_SOURCE_TYPE_ONLINE);
            center.transact(TX_UPDATE_CURRENT_SOURCE_TYPE, data, reply, 0);
            reply.readException();
            Log.i(TAG, "updateCurrentSourceType(ONLINE) sent");
        } catch (Throwable t) {
            Log.w(TAG, "updateCurrentSourceType failed", t);
        } finally {
            reply.recycle();
            data.recycle();
        }
    }

    /**
     * IMediaCenterSvc.updateCurrentProgress(11): token + progress(long, ms).
     * The server (MediaMainApiImpl.updateCurrentProgress) fans this out to the
     * cluster seek bar, the dim display AND the launcher widget
     * (getCtrlWidgetCallback().updateProgress) — so this one outbound push is
     * what moves the launcher widget's progress bar. Pure Zeekr Binder protocol;
     * no app references, position derived live from PlaybackState.
     */
    private void updateCurrentProgress(long progressMs) {
        IBinder center = mediaCenterSvc;
        IBinder tk = token;
        if (center == null || tk == null) {
            return;
        }
        Parcel data = Parcel.obtain();
        Parcel reply = Parcel.obtain();
        try {
            data.writeInterfaceToken(DESC_CENTER);
            data.writeStrongBinder(tk);
            data.writeLong(progressMs);
            center.transact(TX_UPDATE_CURRENT_PROGRESS, data, reply, 0);
            reply.readException();
        } catch (Throwable t) {
            Log.w(TAG, "updateCurrentProgress failed", t);
        } finally {
            reply.recycle();
            data.recycle();
        }
    }

    /**
     * Self-reposting 1 Hz progress pump. getPosition() is only a snapshot, so a
     * steady tick (position() extrapolates between PlaybackState updates) keeps
     * the widget/cluster bar moving. Ticks only while PLAYING; on pause/stop it
     * pushes the final frozen position once and halts, and onPlaybackStateChanged
     * restarts it on the next PLAYING edge.
     */
    private final Runnable progressTick = new Runnable() {
        @Override public void run() {
            if (!progressTicking) {
                return;
            }
            PlaybackState p = ps();
            updateCurrentProgress(position(p));
            if (p != null && p.getState() == PlaybackState.STATE_PLAYING) {
                main.postDelayed(this, PROGRESS_TICK_MS);
            } else {
                progressTicking = false;   // final position already pushed above
            }
        }
    };

    private void startProgressTicks() {
        if (!registered || progressTicking) {
            return;
        }
        progressTicking = true;
        main.removeCallbacks(progressTick);
        main.post(progressTick);
    }

    private void stopProgressTicks() {
        progressTicking = false;
        main.removeCallbacks(progressTick);
        updateCurrentProgress(position(ps()));   // land the bar at the paused position
    }

    /**
     * IMediaCenterSvc.declareSupportCollectTypes(16): token + int[] types. The
     * server (CtrlCollectDelegate) forwards a widget/center favourite tap to
     * IZeekrMusicClient.onCollect only for clients that declared the type, so
     * without this the heart never reaches us. Declared only when the session
     * really accepts a heart/thumb rating; otherwise the reason is logged once
     * per actions value so it can be read off logcat.
     */
    private void declareCollectIfSupported() {
        IBinder center = mediaCenterSvc;
        IBinder tk = token;
        if (!registered || collectDeclared || center == null || tk == null) {
            return;
        }
        PlaybackState p = ps();
        if (!supportsCollect(p)) {
            long a = actions(p);
            if (a != collectDiagActions) {
                collectDiagActions = a;
                MediaController mc = controller;
                int rt = -1;
                try { if (mc != null) { rt = mc.getRatingType(); } } catch (Throwable ignored) { /* keep -1 */ }
                Log.i(TAG, "collect not declared: actions=0x" + Long.toHexString(a)
                        + " ACTION_SET_RATING=" + ((a & PlaybackState.ACTION_SET_RATING) != 0L)
                        + " ratingType=" + rt);
            }
            return;
        }
        Parcel data = Parcel.obtain();
        Parcel reply = Parcel.obtain();
        try {
            data.writeInterfaceToken(DESC_CENTER);
            data.writeStrongBinder(tk);
            data.writeIntArray(new int[]{ ZK_COLLECTION_MUSIC });
            center.transact(TX_DECLARE_SUPPORT_COLLECT, data, reply, 0);
            reply.readException();
            boolean ok = reply.readInt() != 0;
            collectDeclared = ok;
            int rt = -1;
            try { MediaController mc = controller; if (mc != null) { rt = mc.getRatingType(); } } catch (Throwable ignored) { /* keep -1 */ }
            Log.i(TAG, "declareSupportCollectTypes(MUSIC) -> " + ok + " ratingType=" + rt);
        } catch (Throwable t) {
            Log.w(TAG, "declareSupportCollectTypes failed", t);
        } finally {
            reply.recycle();
            data.recycle();
        }
    }

    // ── Play queue -> server (updatePlaylist, code 10) ────────────────────────
    // Pushes the live MediaController queue as a List<IMedia> so the center/dim
    // "next up" list reflects the real queue. Needs focus. App-agnostic: every
    // field comes from framework MediaDescription, and IMedia is written with real
    // Parcel calls in the exact field order the server's IMedia reads back.
    private void updatePlaylist() {
        IBinder center = mediaCenterSvc;
        IBinder tk = token;
        if (!registered || center == null || tk == null) {
            return;
        }
        MediaController mc = controller;
        java.util.List<android.media.session.MediaSession.QueueItem> q =
                (mc != null) ? mc.getQueue() : null;
        if (q == null || q.isEmpty()) {
            return;   // server drops empty lists anyway
        }
        Parcel data = Parcel.obtain();
        Parcel reply = Parcel.obtain();
        try {
            data.writeInterfaceToken(DESC_CENTER);
            data.writeStrongBinder(tk);
            data.writeInt(ZK_MEDIA_LIST_TYPE_NORMAL);
            // writeTypedList(List<IMedia>): size, then per element writeInt(1)+writeToParcel
            data.writeInt(q.size());
            int idx = 0;
            for (android.media.session.MediaSession.QueueItem qi : q) {
                data.writeInt(1);
                writeMediaItem(data, qi, idx++);
            }
            center.transact(TX_UPDATE_PLAYLIST, data, reply, 0);
            reply.readException();
        } catch (Throwable t) {
            Log.w(TAG, "updatePlaylist failed", t);
        } finally {
            reply.recycle();
            data.recycle();
        }
    }

    /**
     * Marshal one queue item as com.zeekr.sdk.mediacenter.bean.IMedia, field for
     * field in its exact writeToParcel order (verified against the vendored SDK).
     * Uri fields use the real Parcel.writeParcelable so the bytes match the
     * server's readParcelable(Uri). Unknown fields -> "" / 0 / null.
     */
    private void writeMediaItem(Parcel p, android.media.session.MediaSession.QueueItem qi, int indexInQueue) {
        android.media.MediaDescription d = (qi != null) ? qi.getDescription() : null;
        String title  = (d != null && d.getTitle()       != null) ? d.getTitle().toString()       : "";
        String artist = (d != null && d.getSubtitle()     != null) ? d.getSubtitle().toString()     : "";
        String descr  = (d != null && d.getDescription()  != null) ? d.getDescription().toString()  : "";
        String mid    = (d != null && d.getMediaId()      != null) ? d.getMediaId()                  : "";
        Uri    path   = (d != null) ? d.getMediaUri() : null;
        Uri    art    = (d != null) ? d.getIconUri()  : null;
        long   dur    = 0L;
        try { if (d != null && d.getExtras() != null) dur = d.getExtras().getLong(MediaMetadata.METADATA_KEY_DURATION, 0L); } catch (Throwable ignore) {}
        p.writeString(mid);                 // uuid (stable id == mediaId)
        p.writeString(title);               // title
        p.writeString(artist);              // artist
        p.writeString("");                  // album
        p.writeString("");                  // author
        p.writeString("");                  // composer
        p.writeString(descr);               // description
        p.writeString(artist);              // subtitle
        p.writeString("");                  // rating
        p.writeString("");                  // year
        p.writeLong(dur);                   // duration
        p.writeInt(indexInQueue);           // positionInQueue
        p.writeInt(indexInQueue);           // albumIndex
        p.writeString("");                  // categoryStr
        p.writeString("");                  // subCategoryStr
        p.writeString(mid);                 // mediaId
        p.writeString("");                  // mediaCp
        p.writeString("");                  // targetType
        p.writeInt(ZK_SOURCE_TYPE_ONLINE);  // sourceType
        p.writeParcelable(path, 0);         // mediaPath (Uri)
        p.writeString("");                  // lyricContent
        p.writeParcelable(null, 0);         // lyric (Uri)
        p.writeParcelable(art, 0);          // artWork (Uri)
        p.writeString("");                  // radioFrequency
        p.writeString("");                  // radioStationName
        p.writeInt(0);                      // vip
        p.writeString("");                  // playingMediaListId
        p.writeInt(0);                      // playingMediaListType
        p.writeInt(0);                      // supportCollect
        p.writeInt(0);                      // collected
    }

    /** Claim media focus (requestPlay, code 6) only when we are actually PLAYING. */
    private void requestPlayIfPlaying() {
        PlaybackState p = ps();
        boolean playing = p != null && p.getState() == PlaybackState.STATE_PLAYING;
        // Re-acquire focus only on the transition INTO playing (edge), not on every
        // state change — the initial focus is already claimed at registration, and
        // spamming requestPlay each tick churns focus and can bounce the active source.
        if (playing && !lastPlaying) {
            requestPlay();
        }
        lastPlaying = playing;
    }

    /**
     * OPTIONAL control-plane: if the media-center hands us an IMediaCenterSvc
     * binder, obtain IMediaControllerApiSvc and register our controller there
     * too (richer control surface). Not required for basic register/metadata.
     *
     * INTENTIONALLY UNWIRED (reserve): steering-wheel commands arrive on our
     * IZeekrMusicClient (registered via registerMusicNew's getMusicClient), not
     * via IMediaControllerApiSvc.register, so this is not on the critical path.
     * The reference bridge registered BOTH planes, so if wheel control does NOT
     * respond on the DHU, re-arm this by calling it from centerCallback
     * alongside maybeStartPushing(). Kept, not deleted, for that one-line revert.
     */
    private synchronized void tryRegisterController() {
        IBinder center = mediaCenterSvc;
        IBinder tk = token;
        if (center == null || tk == null || controllerApiSvc != null) {
            return;
        }
        try {
            // getMediaControllerApi (35) takes NO args — pass null so we don't
            // write a stray strongBinder into the request parcel.
            controllerApiSvc = transactGetBinder(center, DESC_CENTER, TX_GET_MEDIA_CONTROLLER_API, null);
            IBinder api = controllerApiSvc;
            if (api == null) {
                return;
            }
            Parcel data = Parcel.obtain();
            Parcel reply = Parcel.obtain();
            try {
                data.writeInterfaceToken(DESC_CONTROLLER);
                data.writeString(appContext.getPackageName());
                data.writeStrongBinder(musicClientStub);
                api.transact(TX_REGISTER, data, reply, 0);
                reply.readException();
                IBinder ctlToken = reply.readStrongBinder();
                Log.i(TAG, "control-plane register ok, ctlToken=" + ctlToken);
            } finally {
                reply.recycle();
                data.recycle();
            }
            requestPlay();
        } catch (Throwable t) {
            Log.w(TAG, "tryRegisterController (optional control-plane) failed", t);
        }
    }

    private void requestPlay() {
        IBinder center = mediaCenterSvc;
        IBinder tk = token;
        if (center == null || tk == null) {
            return;
        }
        Parcel data = Parcel.obtain();
        Parcel reply = Parcel.obtain();
        try {
            data.writeInterfaceToken(DESC_CENTER);
            data.writeStrongBinder(tk);
            center.transact(TX_REQUEST_PLAY, data, reply, 0);
            reply.readException();
            Log.i(TAG, "requestPlay (claiming focus) sent");
        } catch (Throwable t) {
            Log.w(TAG, "requestPlay failed", t);
        } finally {
            reply.recycle();
            data.recycle();
        }
    }

    /**
     * State-recovery plane (getStateBinder=33 → IStateRecoverApiSvc). Registers
     * our IMusicRecoveryListener so the server can tell us to resume playback,
     * and if WE were the last active source, resumes immediately + signals
     * complete. Also persists a recovery intent so the server can relaunch us
     * after a reboot. All firmware-verified; a no-op when we were not last.
     */
    private void tryStateRecovery() {
        IBinder center = mediaCenterSvc;
        IBinder tk = token;
        if (center == null || tk == null || stateSvc != null) {
            return;
        }
        try {
            // getStateBinder (33) takes NO args — pass null (no stray binder written).
            stateSvc = transactGetBinder(center, DESC_CENTER, TX_GET_STATE_BINDER, null);
            if (stateSvc == null) {
                Log.w(TAG, "getStateBinder → null");
                return;
            }
            // setMusicRecoveryCallback(5): token + our IMusicRecoveryListener.
            // Server returns false on cold start ("System not Active / not Launch
            // Finish cache") and caches the callback; retry a few times so we
            // reliably latch. See setRecoveryCallbackWithRetry().
            setRecoveryCallbackWithRetry(0);

            // registerMusicRecoveryIntent(1): tell the server how to relaunch us
            // after a reboot. intentType=1 → server sendBroadcast(intent +
            // FLAG_INCLUDE_STOPPED_PACKAGES) which reaches our KILLED process and
            // fires RecoveryReceiver → onRecoveryBroadcast → re-bind + resume.
            registerRecoveryIntent(buildRecoveryJson(appContext.getPackageName()));
            // getRecoveryMusicPlaybackInfo(4): if WE were the last active source, resume.
            IBinder lastInfo = transactGetBinder(stateSvc, DESC_STATE_RECOVER,
                    TX_SR_GET_RECOVERY_INFO, tk);
            if (lastInfo != null) {
                String lastPkg = readInfoString(lastInfo, TX_PI_GET_PACKAGE_NAME);
                Log.i(TAG, "recovery lastPkg=" + lastPkg);
                if (appContext.getPackageName().equals(lastPkg)) {
                    Log.i(TAG, "we were last active — resuming");
                    transport(TransportOp.PLAY, 0);
                    onMusicRecoveryComplete(tk);
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "tryStateRecovery failed", t);
        }
    }

    /**
     * setMusicRecoveryCallback with retry. Server returns false on cold start and
     * caches the callback ("System not Active / not Launch Finish cache"), so a
     * single call may not latch. Retry up to 5× at 3s until ok=true.
     */
    private void setRecoveryCallbackWithRetry(int attempt) {
        if (setMusicRecoveryCallbackOnce(attempt)) {
            return;                                  // success — stop
        }
        if (attempt + 1 < 5) {
            final int next = attempt + 1;
            main.postDelayed(() -> setRecoveryCallbackWithRetry(next), 3000);
        } else {
            Log.w(TAG, "setMusicRecoveryCallback gave up after 5 tries");
        }
    }

    /** One setMusicRecoveryCallback(5) attempt. Returns server ok. */
    private boolean setMusicRecoveryCallbackOnce(int attempt) {
        IBinder sr = stateSvc;
        IBinder tk = token;
        if (sr == null || tk == null) {
            return false;
        }
        Parcel d = Parcel.obtain();
        Parcel r = Parcel.obtain();
        try {
            d.writeInterfaceToken(DESC_STATE_RECOVER);
            d.writeStrongBinder(tk);
            d.writeStrongBinder(recoveryListener);
            sr.transact(TX_SR_SET_CALLBACK, d, r, 0);
            r.readException();
            boolean ok = r.readInt() != 0;
            Log.i(TAG, "setMusicRecoveryCallback ok=" + ok + " (try " + (attempt + 1) + ")");
            return ok;
        } catch (Throwable t) {
            Log.w(TAG, "setMusicRecoveryCallback failed", t);
            return false;
        } finally {
            r.recycle();
            d.recycle();
        }
    }

    /**
     * Build the recovery intentJson the server parses via
     * StateRecoverUtils.changeStringToIntent — a CUSTOM {mAction,mPackage,mExtras}
     * schema, NOT Gson(Intent). mExtras MUST be a valid intent-URI or the server
     * throws URISyntaxException → null intent → relaunch fails; "#Intent;end" is a
     * valid empty intent. Extras do not survive the round-trip (reader parses
     * mExtras as an intent-URI), so we carry only action + package.
     */
    private String buildRecoveryJson(String pkg) {
        return "{\"mAction\":\"" + RECOVERY_ACTION + "\","
             +  "\"mPackage\":\"" + pkg + "\","
             +  "\"mExtras\":\"#Intent;end\"}";
    }

    /** Read a String getter (e.g. getPackageName) off a remote IMusicPlaybackInfo. */
    private String readInfoString(IBinder info, int code) {
        Parcel d = Parcel.obtain();
        Parcel r = Parcel.obtain();
        try {
            d.writeInterfaceToken(DESC_PLAYBACK_INFO);
            info.transact(code, d, r, 0);
            r.readException();
            return r.readString();
        } catch (Throwable t) {
            return null;
        } finally {
            r.recycle();
            d.recycle();
        }
    }

    /** IStateRecoverApiSvc.onMusicRecoveryComplete(6): tell the server we resumed. */
    private void onMusicRecoveryComplete(IBinder tk) {
        IBinder sr = stateSvc;
        if (sr == null || tk == null) {
            return;
        }
        Parcel d = Parcel.obtain();
        Parcel r = Parcel.obtain();
        try {
            d.writeInterfaceToken(DESC_STATE_RECOVER);
            d.writeStrongBinder(tk);
            sr.transact(TX_SR_ON_COMPLETE, d, r, 0);
            r.readException();
        } catch (Throwable ignored) {
        } finally {
            r.recycle();
            d.recycle();
        }
    }

    /**
     * IStateRecoverApiSvc.registerMusicRecoveryIntent(1) — WIRED (reboot auto-resume).
     *
     * Firmware truth (StateRecoverApiImpl + StateRecoverUtils.changeStringToIntent):
     * the str is stored as intentJson and on boot the server parses it with a CUSTOM
     * schema (NOT Gson(Intent)): it reads json keys mAction/mPackage/mExtras, where
     * mExtras is parsed with Intent.getIntent(uri) — so mExtras MUST be a valid
     * intent-URI (extras themselves do NOT survive; carry only action+package). Then
     * per intentType it does startForegroundService(intent) (type 0) or
     * intent.addFlags(FLAG_INCLUDE_STOPPED_PACKAGES); sendBroadcast(intent) (type 1).
     * We use type=1 → the broadcast reaches our KILLED process and fires our
     * RecoveryReceiver (declared in the patched manifest) → onRecoveryBroadcast →
     * re-bind + resume. json is built by buildRecoveryJson() (mExtras="#Intent;end",
     * a valid empty intent — an absent/invalid mExtras makes the server throw and
     * store a null intent). No Gson dependency needed.
     */
    private void registerRecoveryIntent(String intentJson) {
        IBinder sr = stateSvc;
        IBinder tk = token;
        if (sr == null || tk == null || intentJson == null || intentJson.isEmpty()) {
            return;   // never send an empty json — see javadoc
        }
        Parcel d = Parcel.obtain();
        Parcel r = Parcel.obtain();
        try {
            d.writeInterfaceToken(DESC_STATE_RECOVER);
            d.writeStrongBinder(tk);
            d.writeInt(1);            // intentType=1 → sendBroadcast (reaches a killed app)
            d.writeString(intentJson);
            sr.transact(TX_SR_REGISTER_RECOVERY_INTENT, d, r, 0);
            r.readException();
            Log.i(TAG, "registerMusicRecoveryIntent ok=" + (r.readInt() != 0));
        } catch (Throwable t) {
            Log.w(TAG, "registerRecoveryIntent failed", t);
        } finally {
            r.recycle();
            d.recycle();
        }
    }

    /** Teardown: unregister best-effort and unbind. */
    public synchronized void teardown() {
        try {
            if (bound) {
                try {
                    appContext.unbindService(connection);
                } catch (Throwable t) {
                    Log.w(TAG, "unbindService failed", t);
                }
            }
        } finally {
            bound = false;
            registered = false;
            initStarted = false;
            supportBinder = null;
            mediaCenterSvc = null;
            controllerApiSvc = null;
            stateSvc = null;
            token = null;
            Log.i(TAG, "MediaBridge.teardown done");
        }
    }

    // ── MediaController wiring (called from the Pine hook) ─────────────

    public void attachController(MediaController mc) {
        if (mc == null) {
            return;
        }
        // Dedup by SESSION token, not the MediaController object: the setActive
        // hook creates a new MediaController each time, so a reference compare
        // never matches. getSessionToken() identifies the underlying session.
        MediaController prev = this.controller;
        if (prev != null) {
            try {
                if (prev.getSessionToken().equals(mc.getSessionToken())) {
                    if (registered) {
                        pushState();
                    }
                    return;   // same session — don't stack another callback
                }
            } catch (Throwable ignored) { }
        }
        try {
            // A different controller arrived — detach the old one first so its
            // callback doesn't linger on a stale session.
            if (prev != null) {
                try {
                    prev.unregisterCallback(controllerCb);
                } catch (Throwable ignored) { }
            }
            this.controller = mc;
            mc.registerCallback(controllerCb, main);
            if (!initStarted) {
                bind();
            } else if (registered) {
                pushState();
            }
        } catch (Throwable t) {
            Log.e(TAG, "attachController failed", t);
        }
    }

    private final MediaController.Callback controllerCb = new MediaController.Callback() {
        @Override public void onMetadataChanged(MediaMetadata metadata) { pushState(); }
        @Override public void onPlaybackStateChanged(PlaybackState state) {
            pushState(); requestPlayIfPlaying();
            declareCollectIfSupported();
            if (state != null && state.getState() == PlaybackState.STATE_PLAYING) startProgressTicks();
            else stopProgressTicks();
        }
        @Override public void onQueueChanged(java.util.List<android.media.session.MediaSession.QueueItem> queue) { updatePlaylist(); }
        @Override public void onSessionDestroyed() { Log.i(TAG, "app MediaSession destroyed"); }
    };

    /**
     * LAYER 2: IMediaCenterSvc.updateMusicPlaybackState (7).
     * Firmware-verified wire layout (IMediaCenterSvc$Stub.onTransact case 7):
     *   writeInterfaceToken(DESC_CENTER)
     *   writeStrongBinder(token)              // IMediaCenterClientToken
     *   writeStrongBinder(playbackInfoStub)   // IMusicPlaybackInfo — a LIVE binder,
     *                                          // NOT a marshalled struct; the server
     *                                          // pulls fields via getter RPCs on demand.
     * So "pushing state" is just re-handing our IMusicPlaybackInfo binder; the actual
     * title/artist/artwork/duration/status are served lazily by playbackInfoStub reading
     * the live MediaController. We call this on every metadata/state change so the server
     * re-reads (and to (re)assert our binder if the token was refreshed).
     */
    private void pushState() {
        IBinder center = mediaCenterSvc;
        IBinder tk = token;
        if (!registered || center == null || tk == null) {
            return;
        }
        Parcel data = Parcel.obtain();
        Parcel reply = Parcel.obtain();
        try {
            data.writeInterfaceToken(DESC_CENTER);
            data.writeStrongBinder(tk);
            data.writeStrongBinder(playbackInfoStub);
            center.transact(TX_UPDATE_PLAYBACK_STATE, data, reply, 0);
            reply.readException();
            persistSnapshot();
        } catch (Throwable t) {
            Log.w(TAG, "pushState failed", t);
        } finally {
            reply.recycle();
            data.recycle();
        }
    }

    // ── Generic helper: transact a method that takes token, returns a binder ──
    private IBinder transactGetBinder(IBinder target, String descriptor, int code, IBinder tk)
            throws RemoteException {
        Parcel data = Parcel.obtain();
        Parcel reply = Parcel.obtain();
        try {
            data.writeInterfaceToken(descriptor);
            if (tk != null) {
                data.writeStrongBinder(tk);
            }
            target.transact(code, data, reply, 0);
            reply.readException();
            return reply.readStrongBinder();
        } finally {
            reply.recycle();
            data.recycle();
        }
    }

    // ── protobuf: field 1 (wire-type 2, tag 0x0a) length-delimited string ──
    private static byte[] protobufString1(String s) {
        byte[] utf = s.getBytes(java.nio.charset.StandardCharsets.UTF_8);
        // 0x0a + varint(len) + bytes.  len < 128 for any package name.
        java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream();
        out.write(0x0a);
        int len = utf.length;
        while (true) {
            int b = len & 0x7f;
            len >>>= 7;
            if (len != 0) {
                out.write(b | 0x80);
            } else {
                out.write(b);
                break;
            }
        }
        out.write(utf, 0, utf.length);
        return out.toByteArray();
    }

    // ── Track-field helpers reading the live MediaController ────────────
    private MediaMetadata md() { MediaController mc = controller; return mc != null ? mc.getMetadata() : null; }
    private PlaybackState ps() { MediaController mc = controller; return mc != null ? mc.getPlaybackState() : null; }
    private static String safe(String s) { return s == null ? "" : s; }

    /** Human-readable app name for getAppName(): the application label from
     *  PackageManager (what the widget shows as the source), falling back to the
     *  package name only if the label can't be resolved. */
    private String appLabel() {
        try {
            CharSequence l = appContext.getPackageManager()
                    .getApplicationLabel(appContext.getApplicationInfo());
            if (l != null && l.length() > 0) {
                return l.toString();
            }
        } catch (Throwable ignored) { /* fall through */ }
        return appContext.getPackageName();
    }

    private String title(MediaMetadata m) { return m != null ? safe(m.getString(MediaMetadata.METADATA_KEY_TITLE)) : ""; }
    private String artist(MediaMetadata m) { return m != null ? safe(m.getString(MediaMetadata.METADATA_KEY_ARTIST)) : ""; }
    private String album(MediaMetadata m) { return m != null ? safe(m.getString(MediaMetadata.METADATA_KEY_ALBUM)) : ""; }
    private long duration(MediaMetadata m) { return m != null ? m.getLong(MediaMetadata.METADATA_KEY_DURATION) : 0L; }

    /**
     * Stable per-track id for the server's "info id" (getPlayingMediaListId code 30)
     * and getUuid (code 24) — used for dedup / favourites / queue. MUST be stable
     * across pushes of the SAME track, else the cluster treats each push as a new
     * track. Priority: METADATA_KEY_MEDIA_ID -> active queue item's media id ->
     * synthetic "<sourceType>_<title>_<artist>" (same shape the server synthesises
     * for BT sources). */
    private String mediaId(MediaMetadata m) {
        if (m != null) {
            String id = m.getString(MediaMetadata.METADATA_KEY_MEDIA_ID);
            if (id != null && !id.isEmpty()) return id;
        }
        try {
            MediaController mc = controller;
            PlaybackState st = (mc != null) ? mc.getPlaybackState() : null;
            if (mc != null && st != null && st.getActiveQueueItemId() != android.media.session.MediaSession.QueueItem.UNKNOWN_ID) {
                java.util.List<android.media.session.MediaSession.QueueItem> q = mc.getQueue();
                if (q != null) {
                    for (android.media.session.MediaSession.QueueItem qi : q) {
                        if (qi != null && qi.getQueueId() == st.getActiveQueueItemId()
                                && qi.getDescription() != null
                                && qi.getDescription().getMediaId() != null) {
                            return qi.getDescription().getMediaId();
                        }
                    }
                }
            }
        } catch (Throwable ignored) { /* fall through to synthetic */ }
        return ZK_SOURCE_TYPE_ONLINE + "_" + title(m) + "_" + artist(m);
    }
    private long position(PlaybackState p) {
        if (p == null) {
            return 0L;
        }
        long pos = p.getPosition();
        // Extrapolate from the last update while playing — getPosition() is a
        // snapshot at getLastPositionUpdateTime(), so a static value freezes the
        // cluster seek bar between PlaybackState changes.
        if (p.getState() == PlaybackState.STATE_PLAYING) {
            long dt = android.os.SystemClock.elapsedRealtime() - p.getLastPositionUpdateTime();
            if (dt > 0) {
                pos += (long) (dt * p.getPlaybackSpeed());
            }
        }
        return pos;
    }
    private int status(PlaybackState p) {
        // NEVER report IDLE(0): the server treats 0 as "source gone" and drops us
        // → falls back to BT. Non-playing (paused/stopped/buffering/none) → PAUSED(2),
        // matching the reference bridge (setStatus(playing ? 1 : 2)).
        if (p != null && p.getState() == PlaybackState.STATE_PLAYING) {
            return ZK_STATUS_PLAYING;
        }
        return ZK_STATUS_PAUSED;
    }

    // ── Capability getters, derived live from framework API (no hardcode) ──────
    // The media server reads these off our IMusicPlaybackInfo stub when it builds
    // its MediaPlayInfo snapshot, and the UI greys out controls accordingly.
    // Repeat/shuffle action bits are not constants of the framework PlaybackState
    // (only of androidx PlaybackStateCompat); sessions built on MediaSessionCompat
    // pass them through in getActions() as these raw bits.
    private static final long ACTION_SET_REPEAT_MODE          = 1L << 18;
    private static final long ACTION_SET_SHUFFLE_MODE_ENABLED = 1L << 19;  // legacy
    private static final long ACTION_SET_SHUFFLE_MODE         = 1L << 21;
    private long actions(PlaybackState p) { return p != null ? p.getActions() : 0L; }
    /** Seek-bar draggable iff the session advertises ACTION_SEEK_TO. */
    private boolean supportsDrag(PlaybackState p) { return (actions(p) & PlaybackState.ACTION_SEEK_TO) != 0L; }
    /** Repeat/shuffle switch iff the session advertises a repeat- or shuffle-mode action. */
    private boolean supportsLoopSwitch(PlaybackState p) {
        return (actions(p) & (ACTION_SET_REPEAT_MODE | ACTION_SET_SHUFFLE_MODE_ENABLED | ACTION_SET_SHUFFLE_MODE)) != 0L;
    }
    /** Favourite/collect supported iff the session accepts ACTION_SET_RATING. */
    private boolean supportsCollect(PlaybackState p) {
        return (actions(p) & PlaybackState.ACTION_SET_RATING) != 0L;
    }
    /** Favourite toggle in the session's own rating style: a thumb rating when the
     *  session declares THUMB_UP_DOWN, a heart rating otherwise (including when the
     *  reported rating type is NONE or cannot be read). */
    private Rating favouriteRating(boolean on) {
        MediaController mc = controller;
        if (mc == null) { return null; }
        try {
            switch (mc.getRatingType()) {
                case Rating.RATING_THUMB_UP_DOWN: return Rating.newThumbRating(on);
                default:                          return Rating.newHeartRating(on);
            }
        } catch (Throwable t) { return Rating.newHeartRating(on); }
    }
    /** Currently favourited: the track carries a HEART user-rating that is set. */
    private volatile String lastCollectDiag;
    private boolean isCollected(MediaMetadata m) {
        boolean res = isCollectedRaw(m);
        // Diagnostic: log what the session publishes, only when it changes.
        try {
            String d = "USER_RATING=" + (m != null ? m.getRating(MediaMetadata.METADATA_KEY_USER_RATING) : null)
                    + " RATING=" + (m != null ? m.getRating(MediaMetadata.METADATA_KEY_RATING) : null)
                    + " -> isCollected=" + res;
            if (!d.equals(lastCollectDiag)) { lastCollectDiag = d; Log.i(TAG, "collect state: " + d); }
        } catch (Throwable ignored) { /* diagnostics only */ }
        return res;
    }
    private boolean isCollectedRaw(MediaMetadata m) {
        if (m == null) { return false; }
        try {
            // The user's own like is USER_RATING. RATING is the item's overall
            // rating, not the user's like — reading it inverted the widget icon.
            Rating r = m.getRating(MediaMetadata.METADATA_KEY_USER_RATING);
            if (r == null || !r.isRated()) { return false; }
            if (r.getRatingStyle() == Rating.RATING_HEART) { return r.hasHeart(); }
            if (r.getRatingStyle() == Rating.RATING_THUMB_UP_DOWN) { return r.isThumbUp(); }
            return false;
        } catch (Throwable t) { return false; }
    }
    /** Android MediaMetadata has no standard lyric key, so we expose none until a
     *  source provides one — a safe empty rather than a failed getter. */
    private String lyricContent(MediaMetadata m) { return ""; }
    /**
     * getPlayControllerSupport bitmask. Encoding verified against the UI consumer
     * com.zeekr.mediawidget.mediacenter.PlaybackInfoCal (ZeekrMediaMultiDisplay /
     * FloatLyrics): bit0(1)=NEXT, bit1(2)=play/pause, bit2(4)=PREVIOUS. Derived
     * live from PlaybackState.getActions(); no hardcode. */
    private int playCtrlSupportMask(PlaybackState p) {
        long a = actions(p);
        int s = 0;
        if ((a & PlaybackState.ACTION_SKIP_TO_NEXT) != 0L) { s |= 1; }
        if ((a & (PlaybackState.ACTION_PLAY | PlaybackState.ACTION_PAUSE | PlaybackState.ACTION_PLAY_PAUSE)) != 0L) { s |= 2; }
        if ((a & PlaybackState.ACTION_SKIP_TO_PREVIOUS) != 0L) { s |= 4; }
        return s;
    }

    /** Prefer http(s) ART_URI (media-center fetches it); fall back to CoverProvider content://. */
    private Uri resolveArtwork(MediaMetadata m) {
        if (m == null) {
            return Uri.EMPTY;
        }
        try {
            String uri = m.getString(MediaMetadata.METADATA_KEY_ALBUM_ART_URI);
            if (uri == null || uri.isEmpty()) {
                uri = m.getString(MediaMetadata.METADATA_KEY_ART_URI);
            }
            if (uri != null && !uri.isEmpty()) {
                return Uri.parse(uri);
            }
            Bitmap art = m.getBitmap(MediaMetadata.METADATA_KEY_ALBUM_ART);
            if (art == null) {
                art = m.getBitmap(MediaMetadata.METADATA_KEY_ART);
            }
            if (art != null) {
                Uri u = CoverProvider.publish(appContext, art);
                if (u != null) {
                    try {
                        appContext.grantUriPermission(MEDIACENTER_PKG, u,
                                Intent.FLAG_GRANT_READ_URI_PERMISSION);
                    } catch (Throwable ignored) { }
                    return u;
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "resolveArtwork failed", t);
        }
        return Uri.EMPTY;
    }

    // ── Callback Binder stubs the media-center drives ──────────────────

    /**
     * IRegisterCallBack: the media-center transacts getRegister(1) / getMusicClient(2)
     * and reads a binder we WRITE into the reply (getters, not receivers).
     * getRegister -> our ITokenCallBack (receives the token);
     * getMusicClient -> our IZeekrMusicClient (steering-wheel commands).
     */
    private final Binder registerCallback = new Binder() {
        @Override protected boolean onTransact(int code, Parcel data, Parcel reply, int flags)
                throws RemoteException {
            switch (code) {
                case TX_GET_REGISTER:
                    data.enforceInterface(DESC_REGISTER_CB);
                    if (reply != null) {
                        reply.writeNoException();
                        reply.writeStrongBinder(tokenCallback);
                    }
                    return true;
                case TX_GET_MUSIC_CLIENT:
                    data.enforceInterface(DESC_REGISTER_CB);
                    if (reply != null) {
                        reply.writeNoException();
                        reply.writeStrongBinder(musicClientStub);
                    }
                    return true;
                case INTERFACE_TRANSACTION:
                    if (reply != null) {
                        reply.writeString(DESC_REGISTER_CB);
                    }
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }
    };

    /** ITokenCallBack.onCallback(1): media-center hands us the client token. */
    private final Binder tokenCallback = new Binder() {
        @Override protected boolean onTransact(int code, Parcel data, Parcel reply, int flags)
                throws RemoteException {
            if (code == TX_TOKEN_ON_CALLBACK) {
                data.enforceInterface(DESC_TOKEN_CB);
                final IBinder tk = data.readStrongBinder();
                Log.i(TAG, "token received via ITokenCallBack.onCallback");
                main.post(new Runnable() { @Override public void run() { onTokenReceived(tk); } });
                if (reply != null) {
                    reply.writeNoException();
                }
                return true;
            }
            if (code == INTERFACE_TRANSACTION) {
                if (reply != null) { reply.writeString(DESC_TOKEN_CB); }
                return true;
            }
            return super.onTransact(code, data, reply, flags);
        }
    };

    /** IMediaCenterSvcCallBack.getIMediaCenterSvc(2): media-center hands us the svc binder. */
    private final Binder centerCallback = new Binder() {
        @Override protected boolean onTransact(int code, Parcel data, Parcel reply, int flags)
                throws RemoteException {
            if (code == TX_CENTER_CB_GET_SVC) {
                data.enforceInterface(DESC_CENTER_CB);
                IBinder svc = data.readStrongBinder();
                if (svc != null) {
                    mediaCenterSvc = svc;
                    Log.i(TAG, "IMediaCenterSvc received");
                    main.post(new Runnable() { @Override public void run() { maybeStartPushing(); } });
                }
                if (reply != null) {
                    reply.writeNoException();
                }
                return true;
            }
            if (code == INTERFACE_TRANSACTION) {
                if (reply != null) { reply.writeString(DESC_CENTER_CB); }
                return true;
            }
            return super.onTransact(code, data, reply, flags);
        }
    };

    /**
     * IMusicRecoveryListener: the server pushes recovery commands here after a
     * relaunch. onResumePlaybackInfo(3) → resume playback (the app remembers its
     * own position); the other two are acked. Registered via
     * setMusicRecoveryCallback in tryStateRecovery.
     */
    private final Binder recoveryListener = new Binder() {
        @Override protected boolean onTransact(int code, Parcel data, Parcel reply, int flags)
                throws RemoteException {
            switch (code) {
                case TX_RL_ON_RESUME:
                    data.enforceInterface(DESC_RECOVERY_LISTENER);
                    try {
                        // ResumePlaybackInfo (Parcelable): presence flag then, per
                        // CREATOR order: radioFreq(str), radioName(str), radioMode(int),
                        // pos(long), sourceType(int), mediaPath(Uri, nullable), status(int),
                        // uuid(str)... We only need pos + status to resume correctly.
                        int has = data.readInt();
                        if (has != 0) {
                            data.readString(); data.readString(); data.readInt();
                            long pos = data.readLong();
                            data.readInt();                                   // sourceType
                            // mMediaPath is written via writeParcelable (className
                            // string + optional object), NOT a writeInt(1/0) flag —
                            // consume it as a Parcelable so status/pos stay aligned.
                            data.readParcelable(getClass().getClassLoader());
                            int st = data.readInt();
                            Log.i(TAG, "onResumePlaybackInfo status=" + st + " pos=" + pos);
                            transport(st == ZK_STATUS_PLAYING ? TransportOp.PLAY : TransportOp.PAUSE, pos);
                        } else {
                            Log.i(TAG, "onResumePlaybackInfo (no info) — play");
                            transport(TransportOp.PLAY, 0);
                        }
                    } catch (Throwable t) {
                        Log.w(TAG, "onResumePlaybackInfo parse failed — play", t);
                        transport(TransportOp.PLAY, 0);
                    }
                    if (reply != null) { reply.writeNoException(); }
                    return true;
                case TX_RL_ON_GET_MEDIA_LIST:
                case TX_RL_ON_GET_PLAYBACK_INFO:
                    data.enforceInterface(DESC_RECOVERY_LISTENER);
                    if (reply != null) { reply.writeNoException(); }
                    return true;
                case INTERFACE_TRANSACTION:
                    if (reply != null) { reply.writeString(DESC_RECOVERY_LISTENER); }
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }
    };

    /**
     * IZeekrMusicClient: incoming steering-wheel / UI commands the media-center
     * sends to our registered controller. We normalize the known codes to the
     * app's MediaController transport controls; getMusicPlaybackInfo returns our
     * IMusicPlaybackInfo stub so the cluster can read track fields.
     */
    private final Binder musicClientStub = new Binder() {
        @Override protected boolean onTransact(int code, Parcel data, Parcel reply, int flags)
                throws RemoteException {
            switch (code) {
                case TX_MC_ON_PLAY:     data.enforceInterface(DESC_MUSIC_CLIENT); replyOk(reply, transport(TransportOp.PLAY, 0)); return true;
                case TX_MC_ON_PAUSE:    data.enforceInterface(DESC_MUSIC_CLIENT); replyOk(reply, transport(TransportOp.PAUSE, 0)); return true;
                case TX_MC_ON_NEXT:     data.enforceInterface(DESC_MUSIC_CLIENT); replyOk(reply, transport(TransportOp.NEXT, 0)); return true;
                case TX_MC_ON_PREVIOUS: data.enforceInterface(DESC_MUSIC_CLIENT); replyOk(reply, transport(TransportOp.PREV, 0)); return true;
                case TX_MC_ON_FORWARD:  data.enforceInterface(DESC_MUSIC_CLIENT); replyOk(reply, transport(TransportOp.FORWARD, 0)); return true;
                case TX_MC_ON_REWIND:   data.enforceInterface(DESC_MUSIC_CLIENT); replyOk(reply, transport(TransportOp.REWIND, 0)); return true;
                case TX_MC_CTRL_COLLECT: {           // widget favourite tap (V1)
                    data.enforceInterface(DESC_MUSIC_CLIENT);
                    data.readInt();                       // collect type
                    boolean on = data.readInt() != 0;
                    Log.i(TAG, "widget ctrlCollect(isCollect=" + on + ")");
                    replyOk(reply, collect(on));          // widget treats > 0 as success
                    return true;
                }
                case TX_MC_CTRL_COLLECT_ASYNC: {     // widget favourite tap (V2, multi-display)
                    data.enforceInterface(DESC_MUSIC_CLIENT);
                    data.readInt();                       // from
                    data.readInt();                       // displayId
                    data.readInt();                       // collect type
                    boolean on = data.readInt() != 0;
                    IBinder cb = data.readStrongBinder();
                    Log.i(TAG, "widget ctrlCollectAsync(isCollect=" + on + ")");
                    boolean ok = collect(on);
                    replyOk(reply, ok);
                    notifyCtrlOp(cb, "playCtrlCollectV2", ok);
                    return true;
                }
                case TX_MC_OPERATION_TYPE:
                    data.enforceInterface(DESC_MUSIC_CLIENT);
                    data.readInt();
                    if (reply != null) { reply.writeNoException(); }
                    return true;
                case TX_MC_ON_COLLECT: {
                    data.enforceInterface(DESC_MUSIC_CLIENT);
                    int type = data.readInt();            // collect type (0=music) — not needed
                    boolean isCollect = data.readInt() != 0;
                    replyOk(reply, collect(isCollect));
                    return true;
                }
                case TX_MC_PROGRESS_DRAG: {
                    data.enforceInterface(DESC_MUSIC_CLIENT);
                    long pos = data.readLong();
                    replyOk(reply, transport(TransportOp.SEEK, pos));
                    return true;
                }
                case TX_MC_GET_CURRENT_PROGRESS:   // long — drives the cluster seek bar
                    data.enforceInterface(DESC_MUSIC_CLIENT);
                    replyLong(reply, position(ps()));
                    return true;
                case TX_MC_GET_CURRENT_SOURCE_TYPE:
                    data.enforceInterface(DESC_MUSIC_CLIENT);
                    replyInt(reply, ZK_SOURCE_TYPE_ONLINE);
                    return true;
                case TX_MC_GET_SOURCE_TYPE_LIST:
                    data.enforceInterface(DESC_MUSIC_CLIENT);
                    if (reply != null) {
                        reply.writeNoException();
                        reply.writeIntArray(new int[]{ ZK_SOURCE_TYPE_ONLINE });
                    }
                    return true;
                case TX_MC_GET_PLAYBACK_INFO:
                    data.enforceInterface(DESC_MUSIC_CLIENT);
                    if (reply != null) {
                        reply.writeNoException();
                        reply.writeStrongBinder(playbackInfoStub);
                    }
                    return true;
                case INTERFACE_TRANSACTION:
                    if (reply != null) { reply.writeString(DESC_MUSIC_CLIENT); }
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }
    };

    /**
     * IMusicPlaybackInfo: the media-center / widget reads individual track fields
     * from us on demand. Each getter reads the live MediaController.
     */
    private final Binder playbackInfoStub = new Binder() {
        @Override protected boolean onTransact(int code, Parcel data, Parcel reply, int flags)
                throws RemoteException {
            MediaMetadata m = md();
            PlaybackState p = ps();
            switch (code) {
                case TX_PI_GET_LAUNCH_INTENT:
                case TX_PI_GET_PLAYER_INTENT:
                    data.enforceInterface(DESC_PLAYBACK_INFO);
                    replyPendingIntent(reply, launchPendingIntent());
                    return true;
                case TX_PI_GET_TITLE:   data.enforceInterface(DESC_PLAYBACK_INFO); replyStr(reply, title(m)); return true;
                case TX_PI_GET_ARTIST:  data.enforceInterface(DESC_PLAYBACK_INFO); replyStr(reply, artist(m)); return true;
                case TX_PI_GET_ALBUM:   data.enforceInterface(DESC_PLAYBACK_INFO); replyStr(reply, album(m)); return true;
                case TX_PI_GET_DURATION:data.enforceInterface(DESC_PLAYBACK_INFO); replyLong(reply, duration(m)); return true;
                case TX_PI_GET_SOURCE_TYPE: data.enforceInterface(DESC_PLAYBACK_INFO); replyInt(reply, ZK_SOURCE_TYPE_ONLINE); return true;
                case TX_PI_GET_PLAYBACK_STATUS: data.enforceInterface(DESC_PLAYBACK_INFO); replyInt(reply, status(p)); return true;
                case TX_PI_GET_ARTWORK: data.enforceInterface(DESC_PLAYBACK_INFO); replyUri(reply, resolveArtwork(m)); return true;
                case TX_PI_GET_APP_NAME:data.enforceInterface(DESC_PLAYBACK_INFO); replyStr(reply, appLabel()); return true;
                case TX_PI_GET_PACKAGE_NAME: data.enforceInterface(DESC_PLAYBACK_INFO); replyStr(reply, appContext.getPackageName()); return true;
                case TX_PI_GET_PLAYING_LIST_ID: data.enforceInterface(DESC_PLAYBACK_INFO); replyStr(reply, mediaId(m)); return true;
                case TX_PI_GET_UUID:            data.enforceInterface(DESC_PLAYBACK_INFO); replyStr(reply, mediaId(m)); return true;
                case TX_PI_GET_PLAYING_LIST_TYPE: data.enforceInterface(DESC_PLAYBACK_INFO); replyInt(reply, 0); return true;
                case TX_PI_IS_SUPPORT_DRAG:     data.enforceInterface(DESC_PLAYBACK_INFO); replyInt(reply, supportsDrag(p) ? 1 : 0); return true;
                case TX_PI_GET_PLAY_CTRL_SUPPORT: data.enforceInterface(DESC_PLAYBACK_INFO); replyInt(reply, playCtrlSupportMask(p)); return true;
                case TX_PI_IS_SUPPORT_LOOP:     data.enforceInterface(DESC_PLAYBACK_INFO); replyInt(reply, supportsLoopSwitch(p) ? 1 : 0); return true;
                case TX_PI_IS_SUPPORT_COLLECT:  data.enforceInterface(DESC_PLAYBACK_INFO); replyInt(reply, supportsCollect(p) ? 1 : 0); return true;
                case TX_PI_IS_COLLECTED:        data.enforceInterface(DESC_PLAYBACK_INFO); replyInt(reply, isCollected(m) ? 1 : 0); return true;
                case TX_PI_GET_COLLECT_TYPE:    data.enforceInterface(DESC_PLAYBACK_INFO); replyInt(reply, ZK_COLLECTION_MUSIC); return true;
                case TX_PI_IS_SUPPORT_DOWNLOAD: data.enforceInterface(DESC_PLAYBACK_INFO); replyInt(reply, 0); return true;
                case TX_PI_GET_LYRIC_CONTENT:   data.enforceInterface(DESC_PLAYBACK_INFO); replyStr(reply, lyricContent(m)); return true;
                case TX_PI_GET_CUR_LYRIC_SENTENCE: data.enforceInterface(DESC_PLAYBACK_INFO); replyStr(reply, ""); return true;
                case TX_PI_GET_TRANSLATED_LYRICS:  data.enforceInterface(DESC_PLAYBACK_INFO); replyStr(reply, ""); return true;
                case TX_PI_GET_LYRIC:           data.enforceInterface(DESC_PLAYBACK_INFO); replyUri(reply, null); return true;
                case INTERFACE_TRANSACTION:
                    if (reply != null) { reply.writeString(DESC_PLAYBACK_INFO); }
                    return true;
                default:
                    return super.onTransact(code, data, reply, flags);
            }
        }
    };

    private static void replyOk(Parcel reply, boolean ok) {
        if (reply != null) { reply.writeNoException(); reply.writeInt(ok ? 1 : 0); }
    }
    private static void replyStr(Parcel reply, String s) {
        if (reply != null) { reply.writeNoException(); reply.writeString(s == null ? "" : s); }
    }
    private static void replyInt(Parcel reply, int v) {
        if (reply != null) { reply.writeNoException(); reply.writeInt(v); }
    }
    private static void replyLong(Parcel reply, long v) {
        if (reply != null) { reply.writeNoException(); reply.writeLong(v); }
    }
    /**
     * IMusicPlaybackInfo.getArtwork() returns a Uri — the server reads it as a
     * nullable Parcelable (readInt()!=0 ? Uri.CREATOR.createFromParcel : null).
     * So reply writeNoException(); writeInt(1)+uri.writeToParcel if present, else
     * writeInt(0). (resolveArtwork returns Uri.EMPTY when there is no art →
     * treated as none, so the server never gets an empty/garbage Uri.)
     */
    private static void replyUri(Parcel reply, Uri uri) {
        if (reply == null) {
            return;
        }
        reply.writeNoException();
        if (uri != null && !Uri.EMPTY.equals(uri)) {
            reply.writeInt(1);
            uri.writeToParcel(reply, 0);
        } else {
            reply.writeInt(0);
        }
    }
    /**
     * IMusicPlaybackInfo getters return a PendingIntent as: writeNoException();
     * then writeInt(1)+pi.writeToParcel(reply,0) if non-null, else writeInt(0)
     * — matching the firmware AIDL stub (PendingIntent.CREATOR nullable pattern).
     */
    private static void replyPendingIntent(Parcel reply, PendingIntent pi) {
        if (reply == null) {
            return;
        }
        reply.writeNoException();
        if (pi != null) {
            reply.writeInt(1);
            pi.writeToParcel(reply, 0);
        } else {
            reply.writeInt(0);
        }
    }

    /**
     * Build the wake-from-sleep PendingIntent MediaCenter caches (via getLaunchIntent).
     * The media-center serializes the INNER Intent (pendingIntent.getIntent().toUri)
     * into its SQLite source list at register time, then relaunches us from that URI
     * on a user tap — so our process being dead afterwards is irrelevant. The intent
     * must resolve to a launchable component of THIS app: we use the standard launcher
     * intent for our own package (getLaunchIntentForPackage).
     */
    private PendingIntent launchPendingIntent() {
        try {
            Intent launch = appContext.getPackageManager()
                    .getLaunchIntentForPackage(appContext.getPackageName());
            if (launch == null) {
                // Fallback: explicit MAIN/LAUNCHER intent scoped to our package.
                launch = new Intent(Intent.ACTION_MAIN)
                        .addCategory(Intent.CATEGORY_LAUNCHER)
                        .setPackage(appContext.getPackageName());
            }
            launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            int flags = PendingIntent.FLAG_UPDATE_CURRENT;
            // FLAG_IMMUTABLE is required from API 31+; the DHU is well above that.
            flags |= PendingIntent.FLAG_IMMUTABLE;
            return PendingIntent.getActivity(appContext, 0, launch, flags);
        } catch (Throwable t) {
            Log.w(TAG, "launchPendingIntent build failed", t);
            return null;
        }
    }

    private enum TransportOp { PLAY, PAUSE, NEXT, PREV, FORWARD, REWIND, SEEK }


    /** Persist the last pushed state so a cold-start resume can serve it before a
     *  live MediaController exists. */
    private void persistSnapshot() {
        try {
            MediaMetadata m = md();
            PlaybackState p = ps();
            appContext.getSharedPreferences("dhu_last", Context.MODE_PRIVATE).edit()
                    .putString("mediaId", mediaId(m))
                    .putString("title", title(m))
                    .putString("artist", artist(m))
                    .putString("artworkUri", String.valueOf(resolveArtwork(m)))
                    .putLong("pos", position(p))
                    .putInt("state", status(p))
                    .apply();
        } catch (Throwable ignored) { }
    }

    /**
     * Static entry fired by RecoveryReceiver after the server's reboot broadcast
     * relaunches our (killed) process. The AppComponentFactory has already run and
     * installed the hooks; we just re-bind the media bridge and resume.
     *   Level A — source back in the cluster: re-bind + register (pushes cached state).
     *   Level B — actually resume audio from cold: connect to the app's own
     *             MediaBrowserService and issue play() (best-effort; some apps
     *             restart the track or need a live session — an app limitation).
     */
    public static void onRecoveryBroadcast(Context ctx) {
        MediaBridge inst = INSTANCE;
        if (inst == null) {
            inst = new MediaBridge(ctx);   // process cold-started; stand one up
        }
        final MediaBridge bridge = inst;
        final Context appCtx = ctx.getApplicationContext();
        try {
            bridge.bind();                 // Level A: re-bind + register (idempotent)
        } catch (Throwable t) {
            Log.w(TAG, "recovery bind failed", t);
        }
        try {
            ComponentName mbs = findMediaBrowserService(appCtx);
            if (mbs != null) {
                final android.media.browse.MediaBrowser[] holder = new android.media.browse.MediaBrowser[1];
                android.media.browse.MediaBrowser b = new android.media.browse.MediaBrowser(
                        appCtx, mbs,
                        new android.media.browse.MediaBrowser.ConnectionCallback() {
                            @Override public void onConnected() {
                                try {
                                    MediaController mc = new MediaController(appCtx, holder[0].getSessionToken());
                                    bridge.attachController(mc);
                                    mc.getTransportControls().play();
                                    Log.i(TAG, "recovery Level-B: MediaBrowser connected, play() issued");
                                } catch (Throwable t) {
                                    Log.w(TAG, "recovery Level-B onConnected failed", t);
                                }
                            }
                            @Override public void onConnectionFailed() {
                                Log.w(TAG, "recovery Level-B: MediaBrowser connection failed");
                            }
                        }, null);
                holder[0] = b;
                b.connect();
            } else {
                Log.i(TAG, "recovery Level-B: no MediaBrowserService — Level A only");
            }
        } catch (Throwable t) {
            Log.w(TAG, "recovery Level-B failed", t);
        }
    }

    /** Find the app's own MediaBrowserService (Android 'resume from cold' path). */
    private static ComponentName findMediaBrowserService(Context ctx) {
        try {
            Intent i = new Intent("android.media.browse.MediaBrowserService").setPackage(ctx.getPackageName());
            java.util.List<android.content.pm.ResolveInfo> ris =
                    ctx.getPackageManager().queryIntentServices(i, 0);
            if (ris != null && !ris.isEmpty()) {
                android.content.pm.ServiceInfo si = ris.get(0).serviceInfo;
                return new ComponentName(si.packageName, si.name);
            }
        } catch (Throwable ignored) { }
        return null;
    }
    /**
     * Center requested a favourite toggle (IZeekrMusicClient.onCollect, code 15).
     * Reflect it onto the app via the framework rating API. Best-effort: a no-op
     * (returns false) if the app's MediaSession doesn't accept a HEART rating.
     * The new state propagates back through isCollected() on the next pushState.
     */
    private boolean collect(boolean isCollect) {
        MediaController mc = controller;
        if (mc == null) {
            return false;
        }
        try {
            Rating r = supportsCollect(ps()) ? favouriteRating(isCollect) : null;
            if (r == null) {
                Log.i(TAG, "onCollect ignored: session does not accept a heart/thumb rating");
                return false;
            }
            mc.getTransportControls().setRating(r);
            Log.i(TAG, "onCollect(" + isCollect + ") -> setRating " + r);
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "collect(setRating) failed", t);
            return false;
        }
    }

    /**
     * Report the result of an async widget control back through the
     * IZeekrPlatformCallback the widget passed (oneway onCall, code 1). Payload is
     * ZeekrPlatformCallbackMessage{method, protobuf OnWidgetCtrlOpPois{1:code, 2:message}}.
     * The widget requires a non-null message, so one is always sent.
     */
    private static void notifyCtrlOp(IBinder cb, String method, boolean ok) {
        if (cb == null) {
            return;
        }
        byte[] msg = (ok ? "ok" : "unsupported").getBytes(java.nio.charset.StandardCharsets.UTF_8);
        java.io.ByteArrayOutputStream pb = new java.io.ByteArrayOutputStream();
        pb.write(0x08); pb.write(ok ? 1 : 0);           // field 1 code (varint): 1 = success
        pb.write(0x12); pb.write(msg.length);           // field 2 message (length-delimited)
        pb.write(msg, 0, msg.length);
        Parcel data = Parcel.obtain();
        try {
            data.writeInterfaceToken(DESC_PLATFORM_CB);
            data.writeInt(1);                            // non-null ZeekrPlatformCallbackMessage
            data.writeString(method);                    // mMethod
            data.writeByteArray(pb.toByteArray());       // mMethodParam
            data.writeByteArray(null);                   // mAttachParam
            cb.transact(1, data, null, IBinder.FLAG_ONEWAY);
        } catch (Throwable t) {
            Log.w(TAG, "notifyCtrlOp failed", t);
        } finally {
            data.recycle();
        }
    }

    private boolean transport(TransportOp op, long arg) {
        MediaController mc = controller;
        if (mc == null) {
            return false;
        }
        try {
            MediaController.TransportControls tc = mc.getTransportControls();
            switch (op) {
                case PLAY:    tc.play(); break;
                case PAUSE:   tc.pause(); break;
                case NEXT:    tc.skipToNext(); break;
                case PREV:    tc.skipToPrevious(); break;
                case FORWARD: tc.fastForward(); break;
                case REWIND:  tc.rewind(); break;
                case SEEK:    tc.seekTo(arg); break;
            }
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "transport " + op + " failed", t);
            return false;
        }
    }
}
