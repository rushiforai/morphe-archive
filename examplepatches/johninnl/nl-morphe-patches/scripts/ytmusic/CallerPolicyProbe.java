package nl.johninnl.ytmusic.probe;

import android.app.Instrumentation;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Bundle;
import java.lang.reflect.Field;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Collections;

/** Run against an explicitly installed separate test copy signed with the probe's key. */
public final class CallerPolicyProbe extends Instrumentation {
    private String host;
    private int checks;
    private Bundle bindings;

    @Override public void onCreate(Bundle args) {
        super.onCreate(args);
        host = args == null ? null : args.getString("host");
        if (host == null) host = "app.seb3thehacker.gearslip";
        bindings = args == null ? new Bundle() : args;
        start();
    }

    @Override public void onStart() {
        Bundle result = new Bundle();
        try {
            Context context = getTargetContext();
            ClassLoader loader = context.getClassLoader();
            String version = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
            check(bindings.getString("manager") != null, "Pass the emitted APK discovery bindings");
            Class<?> manager = loader.loadClass(bindings.getString("manager"));
            Class<?> caller = loader.loadClass(bindings.getString("caller"));
            Class<?> client = loader.loadClass(bindings.getString("client"));
            Object policy = allocate(manager);
            Field ctx = manager.getDeclaredField(bindings.getString("context"));
            ctx.setAccessible(true);
            ctx.set(policy, context);
            Field browseSet = manager.getDeclaredField(bindings.getString("membership"));
            browseSet.setAccessible(true);
            browseSet.set(policy, Collections.emptySet());
            Constructor<?> callerConstructor = caller.getDeclaredConstructor(String.class);
            Constructor<?> clientConstructor = client.getDeclaredConstructor(String.class);
            callerConstructor.setAccessible(true);
            clientConstructor.setAccessible(true);
            Object hostCaller = callerConstructor.newInstance(host);
            Object hostClient = clientConstructor.newInstance(host);
            int hostUid = context.getPackageManager().getApplicationInfo(host, 0).uid;
            check(hostUid != context.getApplicationInfo().uid, "Probe needs a separately installed host");
            Method trust = manager.getDeclaredMethod(bindings.getString("trust"), caller, client, int.class);
            Method eligible = manager.getDeclaredMethod(bindings.getString("eligible"), client);
            Method browsable = manager.getDeclaredMethod(bindings.getString("browsable"), client);

            trust.setAccessible(true);
            eligible.setAccessible(true);
            browsable.setAccessible(true);

            // The flag provider and certificate helpers are intentionally unset. Successful
            // execution proves the actual emitted DEX takes its host path before those gates.
            check(Boolean.TRUE.equals(trust.invoke(policy, hostCaller, hostClient, hostUid)),
                    "Installed host ownership did not bypass server-flag and AA-dependent rejection");
            check(Boolean.FALSE.equals(trust.invoke(policy, hostCaller, hostClient, context.getApplicationInfo().uid)),
                    "Spoofed host package accepted under YT Music's UID");
            check(Boolean.FALSE.equals(trust.invoke(policy, hostCaller, hostClient, -1)), "Invalid UID accepted");
            check(Boolean.TRUE.equals(eligible.invoke(policy, hostClient)), "Configured host browser eligibility missing");
            check(Boolean.TRUE.equals(browsable.invoke(policy, hostClient)), "Configured host returned an empty browser root gate");

            Object otherCaller = callerConstructor.newInstance("unrelated.client");
            Object otherClient = clientConstructor.newInstance("unrelated.client");
            Method originalTrust = manager.getDeclaredMethod("morpheOriginalCallerPolicy", caller, client, int.class);
            Method originalEligible = manager.getDeclaredMethod("morpheOriginalBrowserEligibility", client);
            originalTrust.setAccessible(true);
            originalEligible.setAccessible(true);
            check(sameOutcome(eligible, originalEligible, policy, otherClient),
                    "Unrelated browser eligibility changed");
            check(sameOutcome(trust, originalTrust, policy, otherCaller, otherClient, hostUid),
                    "Unrelated caller did not retain the original policy outcome");

            result.putString("result", "PASS " + checks + " actual-DEX caller policy checks; host=" + host + "; UID=" + hostUid);
            result.putString("scope", "Reflective policy execution with real PackageManager ownership. Live Binder browser sessions, content and playback require separate validation.");
            finish(-1, result);
        } catch (Throwable failure) {
            result.putString("result", "FAIL after " + checks + " checks: " + android.util.Log.getStackTraceString(failure));
            finish(1, result);
        }
    }

    private static boolean sameOutcome(Method wrapper, Method original, Object target, Object... args) throws Exception {
        Object left = null, right = null;
        Throwable leftFailure = null, rightFailure = null;
        try { left = wrapper.invoke(target, args); } catch (InvocationTargetException e) { leftFailure = e.getCause(); }
        try { right = original.invoke(target, args); } catch (InvocationTargetException e) { rightFailure = e.getCause(); }
        if (leftFailure != null || rightFailure != null) {
            return leftFailure != null && rightFailure != null && leftFailure.getClass() == rightFailure.getClass();
        }
        return java.util.Objects.equals(left, right);
    }

    private static Object allocate(Class<?> type) throws Exception {
        Class<?> unsafe = Class.forName("sun.misc.Unsafe");
        Field field = unsafe.getDeclaredField("theUnsafe");
        field.setAccessible(true);
        return unsafe.getMethod("allocateInstance", Class.class).invoke(field.get(null), type);
    }

    private void check(boolean condition, String name) {
        if (!condition) throw new AssertionError(name);
        checks++;
    }
}
