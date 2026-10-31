package h50;

import android.app.Application;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Process;
import androidx.recyclerview.widget.RecyclerView;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.teslacoilsw.conditions.rules.ConditionModel;
import com.teslacoilsw.launcher.NovaApplication;
import com.teslacoilsw.launcher.search.hero.AppWidgetContent;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.security.DigestInputStream;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import kotlin.Unit;
import kotlin.io.FilesKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.ReflectionFactory;
import kotlin.reflect.KClass;
import kotlin.text.Charsets;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SealedClassSerializer;
import kotlinx.serialization.internal.EnumsKt;
import kotlinx.serialization.json.JsonElementSerializer;
import nova.branch.engage.sesame_lite.internal.DB;

/* loaded from: classes.dex */
public final /* synthetic */ class q implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f59265a;

    public /* synthetic */ q(int i5) {
        this.f59265a = i5;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0, types: [int] */
    /* JADX WARN: Type inference failed for: r0v6, types: [java.security.MessageDigest] */
    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() throws IllegalAccessException, NoSuchFieldException, NoSuchMethodException, ClassNotFoundException, SecurityException, IllegalArgumentException {
        Field declaredField;
        MessageDigest messageDigest = this.f59265a;
        int i5 = 0;
        switch (messageDigest) {
            case 0:
                return za0.d.b("io.ktor.client.plugins.SaveBody");
            case 1:
                return Unit.f71706a;
            case 2:
                return Unit.f71706a;
            case 3:
                return Unit.f71706a;
            case 4:
                throw new IllegalStateException("CompositionLocal LocalLifecycleOwner not present");
            case 5:
                List listQ = ul.b.Q(1, 2);
                int i11 = Build.VERSION.SDK_INT;
                return i11 >= 33 ? b70.g.t1(ul.b.Q(22, 21), listQ) : i11 >= 29 ? b70.g.u1(listQ, 21) : listQ;
            case 6:
                return new k0.k0();
            case 7:
                return new LinkedHashMap();
            case 8:
                return JsonElementSerializer.descriptor$lambda$5$lambda$0();
            case 9:
                return JsonElementSerializer.descriptor$lambda$5$lambda$1();
            case 10:
                return JsonElementSerializer.descriptor$lambda$5$lambda$2();
            case 11:
                return JsonElementSerializer.descriptor$lambda$5$lambda$3();
            case 12:
                return JsonElementSerializer.descriptor$lambda$5$lambda$4();
            case 13:
                kx.a aVar = ConditionModel.Companion;
                ReflectionFactory reflectionFactory = Reflection.f71864a;
                return new SealedClassSerializer("com.teslacoilsw.conditions.rules.ConditionModel", reflectionFactory.getOrCreateKotlinClass(ConditionModel.class), new KClass[]{reflectionFactory.getOrCreateKotlinClass(ConditionModel.BluetoothConnectedModel.class), reflectionFactory.getOrCreateKotlinClass(ConditionModel.TimeOfDayDurationModel.class), reflectionFactory.getOrCreateKotlinClass(ConditionModel.TimeOfDayHourRangeModel.class), reflectionFactory.getOrCreateKotlinClass(ConditionModel.WeatherChangeModel.class), reflectionFactory.getOrCreateKotlinClass(ConditionModel.WifiConnectedModel.class)}, new KSerializer[]{com.teslacoilsw.conditions.rules.b.f45554a, com.teslacoilsw.conditions.rules.e.f45555a, com.teslacoilsw.conditions.rules.i.f45557a, com.teslacoilsw.conditions.rules.l.f45558a, com.teslacoilsw.conditions.rules.o.f45559a}, new Annotation[0]);
            case 14:
                Method methodJ = v30.e.j(RecyclerView.class, "invalidateGlows", new Class[0]);
                Intrinsics.d(methodJ);
                return methodJ;
            case 15:
                return new m0.b0(0, 0);
            case 16:
                try {
                    Context context = mx.g0.f77088a;
                } catch (PackageManager.NameNotFoundException unused) {
                }
                boolean z11 = mx.g0.e().getPackageManager().getActivityInfo(new ComponentName("com.teslacoilsw.launcher", "com.teslacoilsw.launcher.RoundIconTest"), 0).icon == 2131820563;
                return Boolean.valueOf(z11);
            case 17:
                try {
                    try {
                        messageDigest = MessageDigest.getInstance("MD5");
                        Context context2 = mx.g0.f77088a;
                        InputStream fileInputStream = new FileInputStream(new File(mx.g0.e().getPackageManager().getApplicationInfo("com.teslacoilsw.launcher", 0).sourceDir));
                        byte[] bArr = new byte[UserMetadata.MAX_INTERNAL_KEY_SIZE];
                        try {
                            InputStream digestInputStream = new DigestInputStream(fileInputStream, messageDigest);
                            do {
                                try {
                                } catch (IOException unused2) {
                                    fileInputStream = digestInputStream;
                                    fileInputStream.close();
                                    return new String(v30.d.b(messageDigest.digest()));
                                } catch (Throwable th2) {
                                    th = th2;
                                    fileInputStream = digestInputStream;
                                    try {
                                        fileInputStream.close();
                                    } catch (IOException unused3) {
                                    }
                                    throw th;
                                }
                            } while (digestInputStream.read(bArr) != -1);
                            digestInputStream.close();
                        } catch (IOException unused4) {
                        } catch (Throwable th3) {
                            th = th3;
                        }
                    } catch (Throwable unused5) {
                        return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    }
                } catch (IOException unused6) {
                }
                return new String(v30.d.b(messageDigest.digest()));
            case 18:
                Context context3 = mx.g0.f77088a;
                return Boolean.valueOf(mx.g0.e().getResources().getBoolean(2131034127));
            case 19:
                Boolean bool = NovaApplication.f45635g;
                if (Build.VERSION.SDK_INT >= 28) {
                    return Application.getProcessName();
                }
                try {
                    return FilesKt.t0(new File("/proc/" + Process.myPid() + "/cmdline"), Charsets.f72001c);
                } catch (Exception e3) {
                    e3.printStackTrace();
                    return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
            case 20:
                return DB.readTx$lambda$6();
            case 21:
                return new ArrayList();
            case 22:
                return new ArrayList();
            case 23:
                return EnumsKt.createSimpleEnumSerializer("com.novalauncher.novalytics.stats.events.LinkClickEvent.OpenLocation", pp.w.values());
            case 24:
                int i12 = Build.VERSION.SDK_INT;
                if (i12 == 30) {
                    i5 = 13;
                } else if (i12 == 31) {
                    i5 = 12;
                }
                try {
                    Class<?> cls = Class.forName("android.os.IPowerManager$Stub");
                    try {
                        declaredField = cls.getDeclaredField("TRANSACTION_goToSleep");
                        declaredField.setAccessible(true);
                    } catch (NoSuchFieldException | SecurityException unused7) {
                        declaredField = null;
                    }
                    if (declaredField != null) {
                        i5 = declaredField.getInt(cls);
                    }
                } catch (ClassNotFoundException | Exception unused8) {
                }
                return Integer.valueOf(i5);
            case 25:
                y40.p.Companion.getClass();
                return y40.o.a();
            case 26:
                ReflectionFactory reflectionFactory2 = Reflection.f71864a;
                return new SealedClassSerializer("com.teslacoilsw.launcher.search.hero.CardContent", reflectionFactory2.getOrCreateKotlinClass(com.teslacoilsw.launcher.search.hero.c.class), new KClass[]{reflectionFactory2.getOrCreateKotlinClass(com.teslacoilsw.launcher.search.hero.a.class), reflectionFactory2.getOrCreateKotlinClass(AppWidgetContent.class), reflectionFactory2.getOrCreateKotlinClass(com.teslacoilsw.launcher.search.hero.b.class), reflectionFactory2.getOrCreateKotlinClass(com.teslacoilsw.launcher.search.hero.d.class), reflectionFactory2.getOrCreateKotlinClass(com.teslacoilsw.launcher.search.hero.e.class), reflectionFactory2.getOrCreateKotlinClass(com.teslacoilsw.launcher.search.hero.f.class)}, new KSerializer[]{u10.d.f90371a, u10.h.f90381a, u10.o.f90405a, u10.x.f90432a, u10.i0.f90383a, u10.s0.f90423a}, new Annotation[0]);
            case 27:
                ReflectionFactory reflectionFactory3 = Reflection.f71864a;
                return new SealedClassSerializer("com.teslacoilsw.launcher.search.hero.HeroCard", reflectionFactory3.getOrCreateKotlinClass(u10.e0.class), new KClass[]{reflectionFactory3.getOrCreateKotlinClass(u10.c.class), reflectionFactory3.getOrCreateKotlinClass(u10.m.class), reflectionFactory3.getOrCreateKotlinClass(u10.w.class), reflectionFactory3.getOrCreateKotlinClass(u10.c0.class), reflectionFactory3.getOrCreateKotlinClass(u10.h0.class), reflectionFactory3.getOrCreateKotlinClass(u10.p0.class), reflectionFactory3.getOrCreateKotlinClass(u10.w0.class)}, new KSerializer[]{u10.a.f90363a, u10.k.f90389a, u10.u.f90424a, u10.a0.f90364a, u10.f0.f90377a, u10.n0.f90404a, u10.u0.f90425a}, new Annotation[0]);
            case 28:
                return EnumsKt.createSimpleEnumSerializer("io.ktor.util.date.WeekDay", v50.f.values());
            default:
                return EnumsKt.createSimpleEnumSerializer("io.ktor.util.date.Month", v50.e.values());
        }
    }
}
