package androidx.credentials.playservices.controllers.identitycredentials.signalcredentialstate;

import android.content.Context;
import android.os.CancellationSignal;
import androidx.credentials.exceptions.publickeycredential.SignalCredentialRateLimitExceededException;
import androidx.credentials.exceptions.publickeycredential.SignalCredentialStateException;
import androidx.credentials.exceptions.publickeycredential.SignalCredentialUnknownException;
import androidx.credentials.playservices.controllers.CredentialProviderController;
import com.google.android.gms.common.api.ApiException;
import defpackage.ah2;
import defpackage.c1e;
import defpackage.cj7;
import defpackage.ep7;
import defpackage.fi2;
import defpackage.gy2;
import defpackage.ij7;
import defpackage.muc;
import defpackage.rd6;
import defpackage.rh2;
import defpackage.rya;
import defpackage.tdc;
import defpackage.tuc;
import defpackage.udc;
import defpackage.vdc;
import defpackage.wdc;
import defpackage.zf2;
import java.util.concurrent.Executor;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\b\u0000\u0018\u0000 \u001b2 \u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u0001:\u0001\u001bB\u000f\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ=\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u000b\u001a\u00020\u00022\u0012\u0010\r\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\f2\u0006\u0010\u000f\u001a\u00020\u000e2\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u0017\u0010\u0015\u001a\u00020\u00032\u0006\u0010\u000b\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u0017\u0010\u0018\u001a\u00020\u00052\u0006\u0010\u0017\u001a\u00020\u0004H\u0014¢\u0006\u0004\b\u0018\u0010\u0019R\u0014\u0010\b\u001a\u00020\u00078\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001a¨\u0006\u001c"}, d2 = {"Landroidx/credentials/playservices/controllers/identitycredentials/signalcredentialstate/SignalCredentialStateController;", "Landroidx/credentials/playservices/controllers/CredentialProviderController;", "Ludc;", "Ltdc;", "Lvdc;", "Lwdc;", "Landroidx/credentials/exceptions/publickeycredential/SignalCredentialStateException;", "Landroid/content/Context;", "context", "<init>", "(Landroid/content/Context;)V", "request", "Lah2;", "callback", "Ljava/util/concurrent/Executor;", "executor", "Landroid/os/CancellationSignal;", "cancellationSignal", "Lc1e;", "invokePlayServices", "(Ludc;Lah2;Ljava/util/concurrent/Executor;Landroid/os/CancellationSignal;)V", "convertRequestToPlayServices", "(Ludc;)Ltdc;", "response", "convertResponseToCredentialManager", "(Lvdc;)Lwdc;", "Landroid/content/Context;", "Companion", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class SignalCredentialStateController extends CredentialProviderController<udc, tdc, vdc, wdc, SignalCredentialStateException> {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);
    public static final long MAX_RETRY_TIME = 600000;
    public static final String RATE_LIMIT_EXCEPTION_MESSAGE_MATCHER = "called too frequently";
    public static final String SIGNAL_REQUEST_JSON_KEY = "androidx.credentials.signal_request_json_key";
    private final Context context;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public SignalCredentialStateController(Context context) {
        super(context);
        context.getClass();
        this.context = context;
    }

    public static final SignalCredentialStateController getInstance(Context context) {
        return INSTANCE.getInstance(context);
    }

    private static final c1e invokePlayServices$lambda$0(Executor executor, SignalCredentialStateController signalCredentialStateController, ah2 ah2Var, vdc vdcVar) {
        c1e c1eVar = c1e.a;
        if (vdcVar == null) {
            executor.execute(new zf2(ah2Var, 11));
            return c1eVar;
        }
        executor.execute(new fi2(ah2Var, 23, signalCredentialStateController.convertResponseToCredentialManager(vdcVar)));
        return c1eVar;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void invokePlayServices$lambda$0$0(ah2 ah2Var) {
        int i = SignalCredentialStateException.a;
        ah2Var.a(new SignalCredentialUnknownException("androidx.credentials.SignalCredentialStateException.TYPE_UNKNOWN", "No SignalCredentialStateResponse received"));
    }

    private static final void invokePlayServices$lambda$2(Executor executor, ah2 ah2Var, Exception exc) {
        String message;
        exc.getClass();
        rya ryaVar = new rya();
        int i = SignalCredentialStateException.a;
        ryaVar.a = new SignalCredentialUnknownException("androidx.credentials.SignalCredentialStateException.TYPE_UNKNOWN", exc.getMessage());
        if ((exc instanceof ApiException) && ((ApiException) exc).a.a == 16 && (message = exc.getMessage()) != null && muc.Q(message, RATE_LIMIT_EXCEPTION_MESSAGE_MATCHER, false)) {
            INSTANCE.parseRefillMinutesRegex(exc.getMessage());
            ryaVar.a = new SignalCredentialRateLimitExceededException("androidx.credentials.SignalCredentialStateException.RATE_LIMIT_EXCEEDED", exc.getMessage());
        }
        executor.execute(new rh2(ah2Var, ryaVar, 3));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void invokePlayServices$lambda$2$0(ah2 ah2Var, rya ryaVar) {
        ah2Var.a(ryaVar.a);
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public /* synthetic */ tdc convertRequestToPlayServices(udc udcVar) {
        if (udcVar == null) {
            return convertRequestToPlayServices2((udc) null);
        }
        rd6.m();
        return null;
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public wdc convertResponseToCredentialManager(vdc response) {
        response.getClass();
        return new wdc();
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public /* synthetic */ void invokePlayServices(udc udcVar, ah2 ah2Var, Executor executor, CancellationSignal cancellationSignal) {
        if (udcVar == null) {
            invokePlayServices2((udc) null, ah2Var, executor, cancellationSignal);
        } else {
            rd6.m();
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\t\u001a\u00020\b2\b\u0010\n\u001a\u0004\u0018\u00010\u0005J\u0010\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000eH\u0007R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\bX\u0086T¢\u0006\u0002\n\u0000¨\u0006\u000f"}, d2 = {"Landroidx/credentials/playservices/controllers/identitycredentials/signalcredentialstate/SignalCredentialStateController$Companion;", "", "<init>", "()V", "SIGNAL_REQUEST_JSON_KEY", "", "RATE_LIMIT_EXCEPTION_MESSAGE_MATCHER", "MAX_RETRY_TIME", "", "parseRefillMinutesRegex", "exceptionMessage", "getInstance", "Landroidx/credentials/playservices/controllers/identitycredentials/signalcredentialstate/SignalCredentialStateController;", "context", "Landroid/content/Context;", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(gy2 gy2Var) {
            this();
        }

        public final SignalCredentialStateController getInstance(Context context) {
            context.getClass();
            return new SignalCredentialStateController(context);
        }

        public final long parseRefillMinutesRegex(String exceptionMessage) {
            cj7 cj7VarD;
            Integer numO;
            if (exceptionMessage == null) {
                return SignalCredentialStateController.MAX_RETRY_TIME;
            }
            Pattern patternCompile = Pattern.compile("^SignalCredentialState has been called too frequently\\. Please retry later after (\\d+) minutes\\.$");
            patternCompile.getClass();
            Matcher matcher = patternCompile.matcher(exceptionMessage);
            matcher.getClass();
            ij7 ij7VarR = ep7.r(matcher, 0, exceptionMessage);
            return (ij7VarR == null || (cj7VarD = ij7VarR.c.d(1)) == null || (numO = tuc.O(cj7VarD.a)) == null) ? SignalCredentialStateController.MAX_RETRY_TIME : numO.intValue();
        }

        private Companion() {
        }
    }

    /* JADX INFO: renamed from: invokePlayServices, reason: avoid collision after fix types in other method */
    public void invokePlayServices2(udc request, ah2 callback, Executor executor, CancellationSignal cancellationSignal) {
        throw null;
    }

    /* JADX INFO: renamed from: convertRequestToPlayServices, reason: avoid collision after fix types in other method */
    public tdc convertRequestToPlayServices2(udc request) {
        throw null;
    }
}
