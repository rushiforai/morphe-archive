package tx;

import android.content.Context;
import com.instabridge.ai.account.AccountManager;
import com.instabridge.ai.account.DeletionStatus;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.CancellationException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g2 {

    /* renamed from: a, reason: collision with root package name */
    public static final g2 f89756a = new g2();

    /* renamed from: b, reason: collision with root package name */
    public static final w70.i2 f89757b;

    /* renamed from: c, reason: collision with root package name */
    public static final w70.i2 f89758c;

    /* renamed from: d, reason: collision with root package name */
    public static volatile boolean f89759d;

    /* renamed from: e, reason: collision with root package name */
    public static final d2 f89760e;

    static {
        w70.i2 i2VarC = w70.u1.c(null);
        f89757b = i2VarC;
        f89758c = i2VarC;
        f89760e = d2.f89697d;
    }

    public static String b(Context context, c2 c2Var) {
        String string;
        Object objA;
        Object objA2;
        Object objA3;
        String str = c2Var.f89680a;
        Locale locale = Locale.getDefault();
        ZoneId zoneIdSystemDefault = ZoneId.systemDefault();
        String str2 = null;
        if (str != null && (string = r70.k.u1(str).toString()) != null) {
            if (string.length() <= 0) {
                string = null;
            }
            if (string != null) {
                try {
                    int i5 = Result.f71687b;
                    objA = OffsetDateTime.parse(string).toInstant().atZone(zoneIdSystemDefault).toLocalDate();
                } catch (Throwable th2) {
                    int i11 = Result.f71687b;
                    objA = ResultKt.a(th2);
                }
                if (Result.a(objA) != null) {
                    try {
                        objA = Instant.parse(string).atZone(zoneIdSystemDefault).toLocalDate();
                    } catch (Throwable th3) {
                        int i12 = Result.f71687b;
                        objA = ResultKt.a(th3);
                    }
                }
                if (Result.a(objA) != null) {
                    try {
                        objA2 = LocalDateTime.parse(string).toInstant(ZoneOffset.UTC).atZone(zoneIdSystemDefault).toLocalDate();
                    } catch (Throwable th4) {
                        int i13 = Result.f71687b;
                        objA2 = ResultKt.a(th4);
                    }
                    objA = objA2;
                }
                if (Result.a(objA) != null) {
                    try {
                        objA3 = LocalDate.parse(string);
                    } catch (Throwable th5) {
                        int i14 = Result.f71687b;
                        objA3 = ResultKt.a(th5);
                    }
                    objA = objA3;
                }
                if (objA instanceof Result.Failure) {
                    objA = null;
                }
                LocalDate localDate = (LocalDate) objA;
                if (localDate != null) {
                    str2 = DateTimeFormatter.ofLocalizedDate(FormatStyle.LONG).withLocale(locale).format(localDate);
                }
            }
        }
        return str2 != null ? context.getString(2132018826, str2) : context.getString(2132018825);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Context context, ContinuationImpl continuationImpl) throws Throwable {
        e2 e2Var;
        boolean zBooleanValue;
        if (continuationImpl instanceof e2) {
            e2Var = (e2) continuationImpl;
            int i5 = e2Var.f89707v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                e2Var.f89707v = i5 - Integer.MIN_VALUE;
            } else {
                e2Var = new e2(this, continuationImpl);
            }
        }
        Object objCancelDeletion = e2Var.f89705t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = e2Var.f89707v;
        int i12 = 0;
        try {
            if (i11 == 0) {
                ResultKt.b(objCancelDeletion);
                d2 d2Var = f89760e;
                Context applicationContext = context.getApplicationContext();
                d2Var.getClass();
                AccountManager accountManager = new AccountManager(applicationContext);
                e2Var.f89707v = 1;
                objCancelDeletion = accountManager.cancelDeletion(e2Var);
                if (objCancelDeletion == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objCancelDeletion);
            }
            zBooleanValue = ((Boolean) objCancelDeletion).booleanValue();
        } catch (CancellationException e3) {
            throw e3;
        } catch (Exception e11) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("NOVA_AI");
            bVar.p(e11, "cancel deletion failed", new Object[0]);
            zBooleanValue = false;
        }
        Map mapN = a80.m.n("result", zBooleanValue ? "success" : "error");
        zy.c cVar = zy.c.f98823a;
        zy.c.i("ai_deletion_cancel_result", mapN);
        mc0.b bVar2 = mc0.d.f76206a;
        bVar2.r("NOVA_AI_BILLING");
        bVar2.h("%s %s", "ai_deletion_cancel_result", b70.g.f1(b70.g.D1(new q(i12), mapN.entrySet()), " ", null, null, 0, new s10.i(22), 30));
        if (zBooleanValue) {
            f89757b.j(null);
            f89759d = false;
        }
        return Boolean.valueOf(zBooleanValue);
    }

    /* JADX WARN: Can't wrap try/catch for region: R(6:57|(1:(1:(5:12|59|13|35|(2:41|42)(6:43|(1:45)|46|(1:49)|50|51))(2:19|20))(1:21))(2:22|(2:53|54)(3:27|(1:30)|33))|55|31|(3:34|35|(0)(0))|33) */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x0094, code lost:
    
        r9 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x0095, code lost:
    
        r7 = r11;
        r11 = r9;
        r9 = r7;
     */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00a9  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00ac  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(Context context, String str, boolean z11, ContinuationImpl continuationImpl) throws Throwable {
        f2 f2Var;
        Context applicationContext;
        g2 g2Var;
        boolean z12;
        DeletionStatus deletionStatus;
        if (continuationImpl instanceof f2) {
            f2Var = (f2) continuationImpl;
            int i5 = f2Var.f89735z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                f2Var.f89735z = i5 - Integer.MIN_VALUE;
            } else {
                f2Var = new f2(this, continuationImpl);
            }
        }
        Object deletionStatus2 = f2Var.f89733x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = f2Var.f89735z;
        try {
            if (i11 == 0) {
                ResultKt.b(deletionStatus2);
                applicationContext = context.getApplicationContext();
                if (!fo.d.j() || !ps.k.r()) {
                    f89757b.j(null);
                    return Unit.f71706a;
                }
                k2 k2Var = k2.f89839a;
                f2Var.f89729t = this;
                f2Var.f89730u = str;
                f2Var.f89731v = applicationContext;
                f2Var.f89732w = z11;
                f2Var.f89735z = 1;
                if (k2.c(applicationContext, "deletion_status", f2Var) != coroutineSingletons) {
                    g2Var = this;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                z12 = f2Var.f89732w;
                str = f2Var.f89730u;
                try {
                    ResultKt.b(deletionStatus2);
                    deletionStatus = (DeletionStatus) deletionStatus2;
                } catch (Exception e3) {
                    Exception e11 = e3;
                    mc0.b bVar = mc0.d.f76206a;
                    bVar.r("NOVA_AI");
                    bVar.p(e11, "deletion status (%s) failed", str);
                    deletionStatus = null;
                    if (deletionStatus != null) {
                    }
                }
                if (deletionStatus != null) {
                    return Unit.f71706a;
                }
                c2 c2Var = Intrinsics.b(deletionStatus.getStatus(), "pending_deletion") ? new c2(deletionStatus.getDeletesAt()) : null;
                f89757b.j(c2Var);
                if (z12 && c2Var != null) {
                    f89759d = true;
                }
                mc0.b bVar2 = mc0.d.f76206a;
                bVar2.r("NOVA_AI");
                bVar2.h("deletion status (%s): %s", str, deletionStatus.getStatus());
                return Unit.f71706a;
            }
            z11 = f2Var.f89732w;
            applicationContext = f2Var.f89731v;
            str = f2Var.f89730u;
            g2Var = f2Var.f89729t;
            ResultKt.b(deletionStatus2);
            f89760e.getClass();
            AccountManager accountManager = new AccountManager(applicationContext);
            f2Var.f89729t = g2Var;
            f2Var.f89730u = str;
            f2Var.f89731v = null;
            f2Var.f89732w = z11;
            f2Var.f89735z = 2;
            deletionStatus2 = accountManager.getDeletionStatus(f2Var);
            if (deletionStatus2 != coroutineSingletons) {
                z12 = z11;
                deletionStatus = (DeletionStatus) deletionStatus2;
                if (deletionStatus != null) {
                }
            }
            return coroutineSingletons;
        } catch (CancellationException e12) {
            throw e12;
        }
    }
}
