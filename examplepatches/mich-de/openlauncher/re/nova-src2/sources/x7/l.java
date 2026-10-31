package x7;

import ads_mobile_sdk.tu0;
import ads_mobile_sdk.wd1;
import ads_mobile_sdk.xu0;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.ServiceInfo;
import android.os.Bundle;
import android.util.Log;
import androidx.compose.ui.node.LayoutNode;
import b.u4;
import com.google.android.datatransport.cct.CctBackendFactory;
import com.google.android.datatransport.runtime.backends.TransportBackendDiscovery;
import com.google.firebase.remoteconfig.FirebaseRemoteConfigClientException;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.lang.reflect.InvocationTargetException;
import java.nio.channels.FileChannel;
import java.nio.channels.FileLock;
import java.nio.channels.OverlappingFileLockException;
import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Result;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import z.x;

/* loaded from: classes.dex */
public final class l implements eg.c, d7.f {

    /* renamed from: a, reason: collision with root package name */
    public Object f95145a;

    /* renamed from: b, reason: collision with root package name */
    public Object f95146b;

    public /* synthetic */ l(Object obj, Object obj2) {
        this.f95145a = obj;
        this.f95146b = obj2;
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x0044 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:35:0x003f A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static l c(Context context) throws IOException {
        FileChannel channel;
        FileLock fileLockLock;
        try {
            channel = new RandomAccessFile(new File(context.getFilesDir(), "generatefid.lock"), "rw").getChannel();
            try {
                fileLockLock = channel.lock();
                try {
                    return new l(channel, fileLockLock);
                } catch (IOException e3) {
                    e = e3;
                    Log.e("CrossProcessLock", "encountered error while creating and acquiring the lock, ignoring", e);
                    if (fileLockLock != null) {
                        try {
                            fileLockLock.release();
                        } catch (IOException unused) {
                        }
                    }
                    if (channel != null) {
                        try {
                            channel.close();
                        } catch (IOException unused2) {
                        }
                    }
                    return null;
                } catch (Error e11) {
                    e = e11;
                    Log.e("CrossProcessLock", "encountered error while creating and acquiring the lock, ignoring", e);
                    if (fileLockLock != null) {
                    }
                    if (channel != null) {
                    }
                    return null;
                } catch (OverlappingFileLockException e12) {
                    e = e12;
                    Log.e("CrossProcessLock", "encountered error while creating and acquiring the lock, ignoring", e);
                    if (fileLockLock != null) {
                    }
                    if (channel != null) {
                    }
                    return null;
                }
            } catch (IOException | Error | OverlappingFileLockException e13) {
                e = e13;
                fileLockLock = null;
            }
        } catch (IOException | Error | OverlappingFileLockException e14) {
            e = e14;
            channel = null;
            fileLockLock = null;
        }
    }

    public static e d() {
        e eVar = new e();
        eVar.f95130a = new HashMap();
        eVar.f95131b = new HashMap();
        return eVar;
    }

    public static void e(LayoutNode layoutNode) {
        if (layoutNode.getGloballyPositionedObservers() > 0) {
            layoutNode.dispatchOnPositionedCallbacks$ui_release();
            layoutNode.setNeedsOnGloballyPositionedDispatch$ui_release(false);
            r1.e eVar = layoutNode.get_children$ui_release();
            Object[] objArr = eVar.f85077a;
            int i5 = eVar.f85079c;
            for (int i11 = 0; i11 < i5; i11++) {
                e((LayoutNode) objArr[i11]);
            }
        }
    }

    @Override // d7.f
    public String a() {
        return (String) this.f95145a;
    }

    @Override // d7.f
    public void b(d7.e eVar) {
        u90.b.g(eVar, (Object[]) this.f95146b);
    }

    public Object f(Enum r42) throws GeneralSecurityException {
        Object obj = ((Map) this.f95145a).get(r42);
        if (obj != null) {
            return obj;
        }
        throw new GeneralSecurityException("Unable to convert proto enum: " + r42);
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x003e  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0046  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public CctBackendFactory g(String str) throws PackageManager.NameNotFoundException {
        Bundle bundle;
        Map map;
        PackageManager packageManager;
        if (((Map) this.f95146b) == null) {
            Context context = (Context) this.f95145a;
            try {
                packageManager = context.getPackageManager();
            } catch (PackageManager.NameNotFoundException unused) {
                Log.w("BackendRegistry", "Application info not found.");
            }
            if (packageManager == null) {
                Log.w("BackendRegistry", "Context has no PackageManager.");
            } else {
                ServiceInfo serviceInfo = packageManager.getServiceInfo(new ComponentName(context, (Class<?>) TransportBackendDiscovery.class), 128);
                if (serviceInfo == null) {
                    Log.w("BackendRegistry", "TransportBackendDiscovery has no service info.");
                } else {
                    bundle = serviceInfo.metaData;
                    if (bundle != null) {
                        Log.w("BackendRegistry", "Could not retrieve metadata, returning empty list of transport backends.");
                        map = Collections.EMPTY_MAP;
                    } else {
                        HashMap map2 = new HashMap();
                        for (String str2 : bundle.keySet()) {
                            Object obj = bundle.get(str2);
                            if ((obj instanceof String) && str2.startsWith("backend:")) {
                                for (String str3 : ((String) obj).split(",", -1)) {
                                    String strTrim = str3.trim();
                                    if (!strTrim.isEmpty()) {
                                        map2.put(strTrim, str2.substring(8));
                                    }
                                }
                            }
                        }
                        map = map2;
                    }
                    this.f95146b = map;
                }
            }
            bundle = null;
            if (bundle != null) {
            }
            this.f95146b = map;
        }
        String str4 = (String) ((Map) this.f95146b).get(str);
        if (str4 == null) {
            return null;
        }
        try {
            return (CctBackendFactory) Class.forName(str4).asSubclass(CctBackendFactory.class).getDeclaredConstructor(null).newInstance(null);
        } catch (ClassNotFoundException e3) {
            Log.w("BackendRegistry", "Class " + str4 + " is not found.", e3);
            return null;
        } catch (IllegalAccessException e11) {
            Log.w("BackendRegistry", "Could not instantiate " + str4 + ".", e11);
            return null;
        } catch (InstantiationException e12) {
            Log.w("BackendRegistry", "Could not instantiate " + str4 + ".", e12);
            return null;
        } catch (NoSuchMethodException e13) {
            Log.w("BackendRegistry", "Could not instantiate ".concat(str4), e13);
            return null;
        } catch (InvocationTargetException e14) {
            Log.w("BackendRegistry", "Could not instantiate ".concat(str4), e14);
            return null;
        }
    }

    public an.d h(xm.e eVar) throws JSONException, FirebaseRemoteConfigClientException {
        String string;
        JSONArray jSONArray = eVar.f96115g;
        long j11 = eVar.f96114f;
        HashSet hashSet = new HashSet();
        for (int i5 = 0; i5 < jSONArray.length(); i5++) {
            try {
                JSONObject jSONObject = jSONArray.getJSONObject(i5);
                String string2 = jSONObject.getString("rolloutId");
                JSONArray jSONArray2 = jSONObject.getJSONArray("affectedParameterKeys");
                if (jSONArray2.length() > 1) {
                    Log.w("FirebaseRemoteConfig", String.format("Rollout has multiple affected parameter keys.Only the first key will be included in RolloutsState. rolloutId: %s, affectedParameterKeys: %s", string2, jSONArray2));
                }
                String strOptString = jSONArray2.optString(0, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                xm.e eVarC = ((xm.c) this.f95145a).c();
                String string3 = null;
                if (eVarC == null) {
                    string = null;
                } else {
                    try {
                        string = eVarC.f96110b.getString(strOptString);
                    } catch (JSONException unused) {
                    }
                }
                if (string == null) {
                    xm.e eVarC2 = ((xm.c) this.f95146b).c();
                    if (eVarC2 != null) {
                        try {
                            string3 = eVarC2.f96110b.getString(strOptString);
                        } catch (JSONException unused2) {
                        }
                    }
                    string = string3 != null ? string3 : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                an.b bVarA = an.e.a();
                bVarA.d(string2);
                bVarA.f(jSONObject.getString("variantId"));
                bVarA.b(strOptString);
                bVarA.c(string);
                bVarA.e(j11);
                hashSet.add(bVarA.a());
            } catch (JSONException e3) {
                throw new FirebaseRemoteConfigClientException("Exception parsing rollouts metadata to create RolloutsState.", e3);
            }
        }
        return an.f.a(hashSet);
    }

    public void i() throws IOException {
        try {
            ((FileLock) this.f95146b).release();
            ((FileChannel) this.f95145a).close();
        } catch (IOException e3) {
            Log.e("CrossProcessLock", "encountered error while releasing, ignoring", e3);
        }
    }

    public Enum j(Object obj) throws GeneralSecurityException {
        Enum r02 = (Enum) ((Map) this.f95146b).get(obj);
        if (r02 != null) {
            return r02;
        }
        throw new GeneralSecurityException(u4.h(obj, "Unable to convert object enum: "));
    }

    public void onInitializationFailed(String error) {
        Intrinsics.g(error, "error");
        if (((AtomicBoolean) this.f95145a).getAndSet(true)) {
            return;
        }
        t70.m mVar = (t70.m) this.f95146b;
        int i5 = Result.f71687b;
        mVar.resumeWith(new tu0(error, wd1.f11225m));
    }

    public void onInitializationSucceeded() {
        if (((AtomicBoolean) this.f95145a).getAndSet(true)) {
            return;
        }
        t70.m mVar = (t70.m) this.f95146b;
        int i5 = Result.f71687b;
        mVar.resumeWith(new xu0(Unit.f71706a));
    }

    public l(int i5) {
        switch (i5) {
            case 6:
                this.f95145a = new o7.a(7);
                this.f95146b = new x(16);
                break;
            default:
                this.f95145a = new r1.e(new LayoutNode[16]);
                break;
        }
    }

    public l(String query, Object[] objArr) {
        Intrinsics.g(query, "query");
        this.f95145a = query;
        this.f95146b = objArr;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public l(String query) {
        this(query, (Object[]) null);
        Intrinsics.g(query, "query");
    }
}
