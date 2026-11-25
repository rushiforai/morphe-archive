package nl.johninnl.warningprobe.fm15moving;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.location.Location;
import android.os.Looper;
import android.os.SystemClock;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Collection;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;

/**
 * Private FM15 moving-input support. Runtime acceptance requires the integrated coordinator.
 *
 * Reflection targets are the original SDK29 15.0/1289 APK, SHA-256
 * 09d01a21ae058c9c9a75dcd0714f39ddbd37b63b68259692675f19b1a39a66ea.
 * See .analysis/native-warning-bindings/fm15-port/moving15-investigation/
 * REPORT.md, input-seams-contract.json, critical-dex-windows.json and
 * stateflow-cas-contract.json. These are static ABI/body proofs,
 * not runtime attestation of a patched APK. A later coordinator must independently
 * verify its installed artifact and the actual original native location path.
 *
 * Call begin/check/restore on the target main looper, after real receiver startup.
 * Do not wait on that looper. Only a private candidate-set value is replaced.
 * Existing candidates are retained. Native source fixes, history, road/lookahead,
 * lifecycle/jobs, previous relevance, lead policy and output decisions are never
 * written. No target classes are defined/shadowed in this helper.
 *
 * Admission cannot prove sensor provenance from a Location object alone. A live
 * caller still needs actual native-source and receiver-GPS witnesses, real native
 * announcement/removal evidence and lifecycle-safe cleanup. A sample is not a
 * warning packet, grant, coverage declaration or acceptance result.
 */
public final class Fm15PrivateMovingInput {
    private Fm15PrivateMovingInput() {}
    private static final long MAX_FIX_AGE_NS = 2500L * 1000000L;
    private static final Set<String> USED_IDS = new HashSet<String>();
    private static Handle active;

    /** No native objects are exposed through this handle. Keep one handle per case. */
    public static final class Handle {
        public final String fixtureId;
        public final String speedCamType;
        public final Policy nativePolicyAtEntry;
        private final Binding binding;
        private final Object model;
        private final Set<?> previous;
        private final Collection<?> previousMembers;
        private final Set<?> inserted;
        private boolean lost;
        private boolean restored;
        private boolean everActive;
        private RestoreResult restoration;

        private Handle(String id, String type, Binding binding, Object model,
                       Set<?> previous, Collection<?> previousMembers, Set<?> inserted) {
            fixtureId = id; speedCamType = type; this.binding = binding;
            this.model = model; this.previous = previous; this.inserted = inserted;
            this.previousMembers = Collections.unmodifiableList(new ArrayList<Object>(previousMembers));
            nativePolicyAtEntry = binding.policy;
        }
        public boolean isRestored() { return restored; }
        public boolean hasLostOwnership() { return lost; }
    }

    /** Values read from the actual existing lef. They are never imposed on it. */
    public static final class Policy {
        public final int defaultSecondsRadius, speedTrapSecondsRadius, trafficJamSecondsRadius;
        public final float tollMaxDistanceMeters;
        private Policy(Object actual, ClassLoader loader) throws Exception {
            defaultSecondsRadius = integer(actual, loader, "lef", "a");
            speedTrapSecondsRadius = integer(actual, loader, "lef", "b");
            trafficJamSecondsRadius = integer(actual, loader, "lef", "c");
            tollMaxDistanceMeters = number(actual, loader, "lef", "d");
            require(defaultSecondsRadius > 0 && speedTrapSecondsRadius > 0 && trafficJamSecondsRadius > 0
                    && Float.isFinite(tollMaxDistanceMeters) && tollMaxDistanceMeters > 0,
                    "Unsupported native lead configuration");
        }
        private boolean same(Policy other) {
            return defaultSecondsRadius == other.defaultSecondsRadius
                    && speedTrapSecondsRadius == other.speedTrapSecondsRadius
                    && trafficJamSecondsRadius == other.trafficJamSecondsRadius
                    && Float.compare(tollMaxDistanceMeters, other.tollMaxDistanceMeters) == 0;
        }
    }

    /** Actual existing native service/configuration and source-location observation. */
    public static class SourceState {
        public final String sourceProvider, nativeServiceClass, nativeProviderClass;
        public final String nativeCandidateStateClass, nativeJob1Class, nativeJob2Class, nativeEngineClass, nativeAlertManagerClass;
        public final long sourceElapsedRealtimeNanos, sourceAgeMillis;
        public final double sourceLatitude, sourceLongitude;
        public final float sourceSpeedMps, sourceBearing, sourceAccuracyMeters;
        public final Policy nativePolicy;
        private SourceState(Binding current, Location fix) throws Exception {
            sourceProvider = fix.getProvider();
            sourceElapsedRealtimeNanos = fix.getElapsedRealtimeNanos();
            sourceAgeMillis = (SystemClock.elapsedRealtimeNanos() - sourceElapsedRealtimeNanos) / 1000000L;
            sourceLatitude = fix.getLatitude(); sourceLongitude = fix.getLongitude();
            sourceSpeedMps = fix.getSpeed(); sourceBearing = fix.getBearing(); sourceAccuracyMeters = fix.getAccuracy();
            nativePolicy = current.policy;
            nativeServiceClass = current.service.getClass().getName();
            nativeProviderClass = current.provider.getClass().getName();
            nativeCandidateStateClass = current.flow.getClass().getName();
            nativeJob1Class = current.job1.getClass().getName(); nativeJob2Class = current.job2.getClass().getName();
            nativeEngineClass = read(current.service, current.loader, "wd6", "d").getClass().getName();
            nativeAlertManagerClass = read(current.service, current.loader, "wd6", "b").getClass().getName();
        }
    }

    /** Read existing state only; never initialize/start the native service or write source GPS. */
    public static SourceState inspect(Context target) throws Exception {
        mainThread(); Binding current = existing(target, true);
        return new SourceState(current, freshFix(current));
    }

    /** Read-only facts. Null radius/distance means the original engine has not supplied it. */
    public static final class Sample extends SourceState {
        public final String fixtureId;
        public final boolean nativeRelevant, nativeEngineActive, nativeWarningActive, nativeInGpsPath;
        public final boolean everObservedNativeActive;
        public final Float nativeCalculatedRadiusMeters, nativeDistanceMeters;
        public final Long nativeFirstActiveElapsedMillis;
        public final String nativeValidationPath, nativeReason;

        private Sample(Handle handle, Binding current, Location fix, NativeResult result) throws Exception {
            super(current, fix);
            fixtureId = handle.fixtureId;
            nativeRelevant = result.relevant; nativeEngineActive = result.engineActive;
            nativeWarningActive = result.warningActive; nativeInGpsPath = result.inGpsPath;
            everObservedNativeActive = handle.everActive;
            nativeCalculatedRadiusMeters = result.radius; nativeDistanceMeters = result.distance;
            nativeFirstActiveElapsedMillis = result.firstActive;
            nativeValidationPath = result.validationPath; nativeReason = result.reason;
        }
    }

    /** Read-only cache/ownership facts, including after a failed check; no native object references escape. */
    public static final class IdentityState {
        public final boolean managerSame, componentSame, scopedSame, serviceSame, lazySame, providerSame;
        public final boolean flowSame, engineSame, alertManagerSame, job1Same, job2Same, configSame;
        public final boolean currentCandidatesSame, currentCandidatesAreSet, fixtureMemberSame, fixtureIdPresent;
        public final int currentCandidateCount;
        private IdentityState(Handle handle, Object manager, Object component, Object scoped, Object service,
                              Object lazy, Object provider, Object flow, Object engine, Object alertManager,
                              Object job1, Object job2, Object config, Object candidates) throws Exception {
            Binding expected=handle.binding;
            managerSame=manager==expected.manager; componentSame=component==expected.component;
            scopedSame=scoped==expected.scoped; serviceSame=service==expected.service;
            lazySame=lazy==expected.lazy; providerSame=provider==expected.provider; flowSame=flow==expected.flow;
            engineSame=engine==expected.engine; alertManagerSame=alertManager==expected.alertManager;
            job1Same=job1==expected.job1; job2Same=job2==expected.job2; configSame=config==expected.config;
            currentCandidatesSame=candidates==handle.inserted; currentCandidatesAreSet=candidates instanceof Set;
            currentCandidateCount=currentCandidatesAreSet?((Set<?>)candidates).size():-1;
            boolean member=false,id=false;
            if(currentCandidatesAreSet){
                Class<?> base=type(expected.loader,"nl.flitsmeister.fmcore.data.model.reports.BaseReport");
                for(Object candidate:(Set<?>)candidates){
                    if(candidate==handle.model)member=true;
                    if(candidate!=null&&base.isInstance(candidate)&&handle.fixtureId.equals(invoke(base,candidate,"getId",new Class<?>[0])))id=true;
                }
            }
            fixtureMemberSame=member; fixtureIdPresent=id;
        }
    }

    /** Inspect cached references only, even when ownership is lost. Missing caches remain null, never initialized. */
    public static IdentityState inspectIdentity(Handle handle) throws Exception {
        mainThread(); require(handle!=null,"Missing private input handle for diagnostic");
        Binding expected=handle.binding; ClassLoader loader=expected.loader;
        Object manager=read(expected.application,loader,"nl.flitsmeister.Hilt_FlitsmeisterApplication","c");
        Object component=cachedRead(manager,loader,"eg0","a");
        Object scoped=cachedRead(component,loader,"jl5","Z");
        Object service=cachedRead(scoped,loader,"b87","b");
        Object lazy=cachedRead(service,loader,"wd6","x");
        Object provider=cachedRead(lazy,loader,"fti","b");
        Object flow=cachedRead(provider,loader,"pef","g");
        Object engine=cachedRead(service,loader,"wd6","d"),alertManager=cachedRead(service,loader,"wd6","b");
        Object job1=cachedRead(service,loader,"wd6","w1"),job2=cachedRead(service,loader,"wd6","x1"),config=cachedRead(service,loader,"wd6","X");
        Object candidates=flow!=null&&type(loader,"iji").isInstance(flow)?invoke(type(loader,"iji"),flow,"getValue",new Class<?>[0]):null;
        return new IdentityState(handle,manager,component,scoped,service,lazy,provider,flow,engine,alertManager,job1,job2,config,candidates);
    }
    private static Object cachedRead(Object receiver,ClassLoader loader,String owner,String name)throws Exception {
        return receiver!=null&&type(loader,owner).isInstance(receiver)?read(receiver,loader,owner,name):null;
    }

    /** Restoration is cleanup, never evidence that a target was naturally passed. */
    public static final class RestoreResult {
        public final boolean restored, wasNativeWarningActive, wasInNativeGpsPath;
        public final boolean everObservedNativeActive;
        private RestoreResult(NativeResult before, boolean everActive) {
            restored = true; wasNativeWarningActive = before.warningActive;
            wasInNativeGpsPath = before.inGpsPath; everObservedNativeActive = everActive;
        }
    }

    /**
     * Augment the real provider's candidate set. Caller must choose a fresh private
     * UUID-based ID before configuring receiver observations. Target coordinates and
     * optional bearings describe a controlled static camera, never a source GPS fix.
     */
    public static Handle begin(Context target, String fixtureId, String speedCamType,
                               double targetLatitude, double targetLongitude,
                               Float bearing1, Float bearing2) throws Exception {
        mainThread(); require(active == null, "A private input handle is already active");
        require(fixtureId != null && fixtureId.length() <= 128 && fixtureId.matches(
                "private-fm15-moving-[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}(?:-[A-Za-z0-9._-]{1,24})?"),
                "Use a fresh private UUID-based fixture ID");
        require(!USED_IDS.contains(fixtureId), "Fixture ID was already admitted in this helper process");
        require("SPEED_50".equals(speedCamType) || "SPEED_100".equals(speedCamType) || "SPEED_130".equals(speedCamType),
                "Unsupported private moving-camera subtype");
        require(Double.isFinite(targetLatitude) && Math.abs(targetLatitude) <= 90
                && Double.isFinite(targetLongitude) && Math.abs(targetLongitude) <= 180, "Invalid controlled camera target");
        bearing(bearing1); bearing(bearing2);
        Binding binding = existing(target, true);
        freshFix(binding);
        Object value = flowValue(binding);
        require(value instanceof Set, "Native candidate state is not a Set");
        Set<?> previous = (Set<?>) value;
        LinkedHashSet<Object> augmented = new LinkedHashSet<Object>();
        ArrayList<Object> originalMembers = new ArrayList<Object>();
        Class<?> base = type(binding.loader, "nl.flitsmeister.fmcore.data.model.reports.BaseReport");
        for (Object candidate : previous) {
            require(candidate != null && base.isInstance(candidate), "Unexpected native candidate type");
            require(!fixtureId.equals(invoke(base, candidate, "getId", new Class<?>[0])), "Fixture ID collides with native input");
            augmented.add(candidate);
            originalMembers.add(candidate);
        }
        require(!nativeIdPresent(binding, fixtureId), "Fixture ID already exists in original native state");
        Object model = camera(binding.loader, fixtureId, speedCamType, targetLatitude, targetLongitude, bearing1, bearing2);
        augmented.add(model);
        Set<?> inserted = Collections.unmodifiableSet(augmented);
        Binding current = existing(target, true);
        require(binding.same(current) && binding.policy.same(current.policy), "Native binding changed during entry");
        freshFix(current);
        Handle handle = new Handle(fixtureId, speedCamType, binding, model, previous, originalMembers, inserted);
        require(flowValue(current) == previous && sameMembers(previous, handle.previousMembers), "Native candidates changed before entry");
        // Keep an exceptional-cleanup handle even if a native continuation throws during CAS.
        active = handle;
        if (!cas(current, previous, inserted)) { active = null; throw new IllegalStateException("Native candidates changed during entry; no input admitted"); }
        USED_IDS.add(fixtureId);
        if (flowValue(current) != inserted) {
            handle.lost = true;
            throw new IllegalStateException("Native producer replaced private input immediately; no blind restoration allowed");
        }
        return handle;
    }

    /** Only for exceptional cleanup if begin throws after attempting its owned write. */
    public static Handle current() { mainThread(); return active; }

    /** Observe original native decisions after real location pulses; this never drives them. */
    public static Sample check(Handle handle) throws Exception {
        mainThread(); ownedHandle(handle);
        Binding current = ownedBinding(handle, true);
        require(handle.nativePolicyAtEntry.same(current.policy), "Native lead configuration changed; case is inconclusive");
        Location fix = freshFix(current);
        NativeResult result = nativeResult(current, handle.model, handle.fixtureId);
        if (result.warningActive) handle.everActive = true;
        return new Sample(handle, current, fix, result);
    }

    /**
     * Restore only this exact still-owned value. If native input/bindings changed,
     * abort without writing. A caller must separately join genuine native passage,
     * removal/CLEAR and receiver callbacks before claiming moving acceptance.
     * Cleanup while wasNativeWarningActive=true is an aborted input withdrawal.
     */
    public static RestoreResult restore(Handle handle) throws Exception {
        mainThread(); require(handle != null, "Missing private input handle");
        if (handle.restored) return handle.restoration;
        ownedHandle(handle);
        Binding current = ownedBinding(handle, false); // Stale GPS must not prevent safe owned-input cleanup.
        if (!sameMembers(handle.previous, handle.previousMembers)) {
            handle.lost = true;
            throw new IllegalStateException("Original candidate snapshot changed in place; restoration is refused");
        }
        NativeResult before = new NativeResult();
        before.warningActive = containsModel(read(current.service, current.loader, "wd6", "p1"), current.loader, handle.model);
        before.inGpsPath = containsModel(read(current.service, current.loader, "wd6", "q1"), current.loader, handle.model);
        if (before.warningActive) handle.everActive = true;
        if (!cas(current, handle.inserted, handle.previous)) {
            handle.lost = true;
            throw new IllegalStateException("Native producer changed input during restoration; no overwrite performed");
        }
        handle.restoration = new RestoreResult(before, handle.everActive);
        handle.restored = true; active = null;
        require(flowValue(current) == handle.previous,
                "Native input advanced after guarded restoration; no further restoration write is allowed");
        return handle.restoration;
    }

    private static final class Binding {
        final Context application;
        final ClassLoader loader;
        final Object manager, component, scoped, service, lazy, provider, flow, job1, job2, config, engine, alertManager;
        final Policy policy;
        Binding(Context application, ClassLoader loader, Object manager, Object component, Object scoped,
                Object service, Object lazy, Object provider, Object flow, Object job1, Object job2, Object config) throws Exception {
            this.application = application; this.loader = loader; this.manager = manager; this.component = component;
            this.scoped = scoped; this.service = service; this.lazy = lazy; this.provider = provider; this.flow = flow;
            this.job1 = job1; this.job2 = job2; this.config = config; policy = new Policy(config, loader);
            engine=read(service,loader,"wd6","d"); alertManager=read(service,loader,"wd6","b");
        }
        boolean same(Binding other) {
            return application == other.application && manager == other.manager && component == other.component
                    && scoped == other.scoped && service == other.service && lazy == other.lazy
                    && provider == other.provider && flow == other.flow && job1 == other.job1
                    && job2 == other.job2 && config == other.config && engine==other.engine && alertManager==other.alertManager;
        }
    }

    private static Binding existing(Context target, boolean running) throws Exception {
        require(target != null, "Missing target context");
        Context app = target.getApplicationContext();
        require(app != null && "nl.flitsmeister".equals(app.getPackageName()), "Wrong target application");
        PackageInfo info = app.getPackageManager().getPackageInfo(app.getPackageName(), 0);
        require("15.0".equals(info.versionName) && info.getLongVersionCode() == 1289L, "Only FM15 15.0/1289 is admitted");
        ClassLoader loader = app.getClassLoader();
        require(type(loader, "nl.flitsmeister.FlitsmeisterApplication").isInstance(app), "Not the original application instance");
        Object manager = read(app, loader, "nl.flitsmeister.Hilt_FlitsmeisterApplication", "c");
        exact(manager, loader, "eg0");
        Object component = read(manager, loader, "eg0", "a"); exact(component, loader, "jl5");
        Object scoped = read(component, loader, "jl5", "Z"); exact(scoped, loader, "b87");
        Object service = read(scoped, loader, "b87", "b");
        require(service != field(loader, "b87", "c").get(null), "Native service provider has never been initialized");
        exact(service, loader, "wd6");
        // These getters are used only after proving their caches already contain the native instances.
        require(invoke(type(loader, "tef"), component, "l", new Class<?>[0]) == service, "Native scoped service identity differs");
        Object lazy = read(service, loader, "wd6", "x"); exact(lazy, loader, "fti");
        require(Boolean.TRUE.equals(invoke(type(loader, "fti"), lazy, "isInitialized", new Class<?>[0])), "Native event provider was not initialized");
        Object provider = read(lazy, loader, "fti", "b"); exact(provider, loader, "pef");
        require(invoke(type(loader, "fti"), lazy, "getValue", new Class<?>[0]) == provider, "Native lazy provider identity differs");
        Object flow = read(provider, loader, "pef", "g"); exact(flow, loader, "iji");
        Object job1 = read(service, loader, "wd6", "w1"), job2 = read(service, loader, "wd6", "x1");
        Object config = read(service, loader, "wd6", "X"); exact(config, loader, "lef");
        require(read(service, loader, "wd6", "b") == field(loader, "xl", "a").get(null), "Native alert manager was replaced");
        require(read(service, loader, "wd6", "d") == field(loader, "ajf", "a").get(null), "Native relevance engine was replaced");
        exact(read(service, loader, "wd6", "s"), loader, "nl.flitsmeister.fmcore.data.model.reports.SignallingSpamFilterImpl");
        if (running) {
            require(Boolean.TRUE.equals(invoke(type(loader, "dh8"), service, "isStarted", new Class<?>[0])), "Native service is not started");
            Object lifecycle = invoke(type(loader, "dh8"), service, "getLifecycle", new Class<?>[0]);
            Object state = invoke(type(loader, "androidx.lifecycle.Lifecycle"), lifecycle, "getCurrentState", new Class<?>[0]);
            require(state instanceof Enum && ("STARTED".equals(((Enum<?>) state).name()) || "RESUMED".equals(((Enum<?>) state).name())), "Native lifecycle is not started");
            activeJob(job1, loader); activeJob(job2, loader);
            exact(read(service, loader, "wd6", "u1"), loader, "bjf");
        }
        return new Binding(app, loader, manager, component, scoped, service, lazy, provider, flow, job1, job2, config);
    }

    private static Binding ownedBinding(Handle handle, boolean running) throws Exception {
        require(!handle.lost, "Private input ownership was already lost; abort this case");
        Binding current = existing(handle.binding.application, running);
        if (!handle.binding.same(current)) {
            handle.lost = true;
            throw new IllegalStateException("Native binding replaced private input; restoration is refused");
        }
        if (flowValue(current) != handle.inserted) {
            handle.lost = true;
            throw new IllegalStateException("Native producer replaced candidate set; restoration is refused");
        }
        return current;
    }

    private static Location freshFix(Binding binding) throws Exception {
        Object state = read(binding.provider, binding.loader, "pef", "f"); exact(state, binding.loader, "iji");
        Object value = invoke(type(binding.loader, "iji"), state, "getValue", new Class<?>[0]);
        require(value instanceof Location && read(binding.service, binding.loader, "wd6", "v1") == value,
                "The native collector has not consumed the current source fix; wait outside the main thread");
        Location fix = (Location) value;
        long stamp = fix.getElapsedRealtimeNanos(), now = SystemClock.elapsedRealtimeNanos();
        require(stamp > 0 && stamp <= now && now - stamp <= MAX_FIX_AGE_NS, "Native source fix is not fresh");
        require(fix.hasSpeed() && Float.isFinite(fix.getSpeed()) && fix.getSpeed() > 0
                && fix.hasBearing() && Float.isFinite(fix.getBearing())
                && fix.hasAccuracy() && Float.isFinite(fix.getAccuracy()) && fix.getAccuracy() >= 0
                && Double.isFinite(fix.getLatitude()) && Math.abs(fix.getLatitude()) <= 90
                && Double.isFinite(fix.getLongitude()) && Math.abs(fix.getLongitude()) <= 180,
                "Native moving fix lacks real motion/quality fields");
        return fix;
    }

    private static final class NativeResult {
        boolean relevant, engineActive, warningActive, inGpsPath;
        Float radius, distance;
        Long firstActive;
        String validationPath, reason;
    }
    private static NativeResult nativeResult(Binding binding, Object model, String id) throws Exception {
        NativeResult result = new NativeResult();
        result.warningActive = containsModel(read(binding.service, binding.loader, "wd6", "p1"), binding.loader, model);
        result.inGpsPath = containsModel(read(binding.service, binding.loader, "wd6", "q1"), binding.loader, model);
        Object prior = read(binding.service, binding.loader, "wd6", "u1");
        if (prior == null) return result;
        exact(prior, binding.loader, "bjf");
        Object reports = read(prior, binding.loader, "bjf", "a"); require(reports instanceof Collection, "Invalid native relevance result");
        for (Object report : (Collection<?>) reports) {
            exact(report, binding.loader, "waf");
            if (!id.equals(read(report, binding.loader, "waf", "a"))) continue;
            require(!result.relevant, "Duplicate native relevance identity");
            result.relevant = true; result.engineActive = bool(report, binding.loader, "waf", "e");
            Object radius = read(report, binding.loader, "waf", "g"), timestamp = read(report, binding.loader, "waf", "f");
            require(radius == null || radius instanceof Float, "Invalid native calculated radius");
            require(timestamp == null || timestamp instanceof Long, "Invalid native active timestamp");
            result.radius = (Float) radius; result.firstActive = (Long) timestamp;
            Object metadata = read(report, binding.loader, "waf", "b"); exact(metadata, binding.loader, "yaf");
            result.distance = number(metadata, binding.loader, "yaf", "c");
            result.validationPath = String.valueOf(read(report, binding.loader, "waf", "c"));
            result.reason = String.valueOf(read(report, binding.loader, "waf", "d"));
        }
        return result;
    }
    private static boolean nativeIdPresent(Binding binding, String id) throws Exception {
        Class<?> base = type(binding.loader, "nl.flitsmeister.fmcore.data.model.reports.BaseReport");
        for (String field : new String[] {"p1", "q1"}) {
            Object values = read(binding.service, binding.loader, "wd6", field); require(values instanceof Set, "Invalid native active set");
            for (Object value : (Set<?>) values) {
                exact(value, binding.loader, "ma1");
                if (id.equals(invoke(base, read(value, binding.loader, "ma1", "a"), "getId", new Class<?>[0]))) return true;
            }
        }
        Object prior = read(binding.service, binding.loader, "wd6", "u1"); exact(prior, binding.loader, "bjf");
        for (String field : new String[] {"a", "b"}) {
            Object values = read(prior, binding.loader, "bjf", field); require(values instanceof Collection, "Invalid native prior result");
            for (Object value : (Collection<?>) values) {
                String owner = field.equals("a") ? "waf" : "iaa"; exact(value, binding.loader, owner);
                if (id.equals(read(value, binding.loader, owner, "a"))) return true;
            }
        }
        return false;
    }
    private static boolean containsModel(Object values, ClassLoader loader, Object model) throws Exception {
        require(values instanceof Set, "Invalid native warning/path set");
        for (Object value : (Set<?>) values) { exact(value, loader, "ma1"); if (read(value, loader, "ma1", "a") == model) return true; }
        return false;
    }

    private static Object camera(ClassLoader loader, String id, String subtype, double latitude, double longitude,
                                 Float bearing1, Float bearing2) throws Exception {
        Class<?> camera = type(loader, "nl.flitsmeister.fmcore.data.model.reports.SpeedCam");
        Class<?> base = type(loader, "nl.flitsmeister.fmcore.data.model.reports.BaseReport");
        Class<?> enumeration = type(loader, "nl.flitsmeister.fmcore.data.model.reports.SpeedCamType");
        Object model = camera.getConstructor().newInstance();
        Object nativeSubtype = invoke(enumeration, null, "valueOf", new Class<?>[] {String.class}, subtype);
        invoke(camera, model, "setSpeedCamType", new Class<?>[] {enumeration}, nativeSubtype);
        invoke(base, model, "setId", new Class<?>[] {String.class}, id);
        Location targetPoint = new Location("private-fm15-camera-target");
        targetPoint.setLatitude(latitude); targetPoint.setLongitude(longitude);
        invoke(base, model, "setLocation", new Class<?>[] {Location.class}, targetPoint);
        Object geoHash = invoke(type(loader, "p99$a"), null, "e", new Class<?>[] {double.class, double.class, int.class}, latitude, longitude, 5);
        exact(geoHash, loader, "p99");
        invoke(base, model, "setGeoHash", new Class<?>[] {type(loader, "p99")}, geoHash);
        invoke(camera, model, "setBearing1", new Class<?>[] {Float.class}, bearing1);
        invoke(camera, model, "setBearing2", new Class<?>[] {Float.class}, bearing2);
        require(invoke(base, model, "getLocation", new Class<?>[0]) == targetPoint
                && invoke(base, model, "getGeoHash", new Class<?>[0]) == geoHash, "Native input model did not retain its original target/geohash");
        return model;
    }

    private static void activeJob(Object job, ClassLoader loader) throws Exception {
        require(job != null && type(loader, "yhi").isInstance(job), "Missing original native collection job");
        Class<?> api = type(loader, "eca");
        require(Boolean.TRUE.equals(invoke(api, job, "isActive", new Class<?>[0]))
                && Boolean.FALSE.equals(invoke(api, job, "isCancelled", new Class<?>[0])), "Native collection job is inactive");
    }
    private static Object flowValue(Binding binding) throws Exception { return invoke(type(binding.loader, "iji"), binding.flow, "getValue", new Class<?>[0]); }
    private static boolean cas(Binding binding, Object expected, Object update) throws Exception {
        require(expected != null && update != null, "Never use native unconditional/null StateFlow update");
        // Original classes6.dex iji.l starts MONITOR_ENTER on this same flow.
        // Keep its structural equality check from accepting a different equal set
        // written between our identity check and the native guarded update.
        synchronized (binding.flow) {
            if (flowValue(binding) != expected) return false;
            return Boolean.TRUE.equals(invoke(type(binding.loader, "iji"), binding.flow, "l", new Class<?>[] {Object.class, Object.class}, expected, update));
        }
    }
    private static boolean sameMembers(Collection<?> actual, Collection<?> expected) {
        if (actual.size() != expected.size()) return false;
        for (Object value : actual) {
            boolean found = false; for (Object original : expected) if (value == original) { found = true; break; }
            if (!found) return false;
        }
        return true;
    }
    private static void ownedHandle(Handle handle) { require(handle != null && handle == active && !handle.restored, "Private input handle is not active"); }
    private static void bearing(Float value) { require(value == null || Float.isFinite(value) && value >= 0 && value < 360, "Invalid controlled report bearing"); }
    private static void mainThread() { require(Looper.myLooper() == Looper.getMainLooper(), "Call this prototype on the target main looper"); }
    private static Class<?> type(ClassLoader loader, String name) throws ClassNotFoundException { return Class.forName(name, false, loader); }
    private static void exact(Object value, ClassLoader loader, String name) throws Exception { require(value != null && value.getClass() == type(loader, name), "Unexpected or uninitialized native object type"); }
    private static Field field(ClassLoader loader, String owner, String name) throws Exception { Field field = type(loader, owner).getDeclaredField(name); field.setAccessible(true); return field; }
    private static Object read(Object receiver, ClassLoader loader, String owner, String name) throws Exception { return field(loader, owner, name).get(receiver); }
    private static int integer(Object receiver, ClassLoader loader, String owner, String name) throws Exception { return field(loader, owner, name).getInt(receiver); }
    private static float number(Object receiver, ClassLoader loader, String owner, String name) throws Exception { return field(loader, owner, name).getFloat(receiver); }
    private static boolean bool(Object receiver, ClassLoader loader, String owner, String name) throws Exception { return field(loader, owner, name).getBoolean(receiver); }
    private static Object invoke(Class<?> owner, Object receiver, String name, Class<?>[] parameters, Object... arguments) throws Exception {
        Method method = owner.getMethod(name, parameters); method.setAccessible(true);
        try { return method.invoke(receiver, arguments); }
        catch (InvocationTargetException error) {
            Throwable cause = error.getCause();
            if (cause instanceof Exception) throw (Exception) cause;
            if (cause instanceof Error) throw (Error) cause;
            throw new IllegalStateException("Native reflection invocation failed", cause);
        }
    }
    private static void require(boolean condition, String message) { if (!condition) throw new IllegalStateException(message); }
}
