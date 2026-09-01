package androidx.credentials.playservices.controllers;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Parcel;
import android.os.ResultReceiver;
import androidx.credentials.exceptions.CreateCredentialCancellationException;
import androidx.credentials.exceptions.CreateCredentialException;
import androidx.credentials.exceptions.CreateCredentialInterruptedException;
import androidx.credentials.exceptions.CreateCredentialUnknownException;
import androidx.credentials.exceptions.GetCredentialCancellationException;
import androidx.credentials.exceptions.GetCredentialException;
import androidx.credentials.exceptions.GetCredentialInterruptedException;
import androidx.credentials.exceptions.GetCredentialUnknownException;
import androidx.credentials.exceptions.NoCredentialException;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import defpackage.g76;
import defpackage.gy2;
import defpackage.k80;
import java.util.Set;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0010\u0018\u0000 \u00132\u00020\u0001:\u0001\u0013B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J#\u0010\t\u001a\u0004\u0018\u00010\u0006\"\n\b\u0000\u0010\u0007*\u0004\u0018\u00010\u00062\u0006\u0010\b\u001a\u00028\u0000¢\u0006\u0004\b\t\u0010\nJ%\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\b\u001a\u00020\u00062\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u0010\u0010\u0011R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010\u0012¨\u0006\u0014"}, d2 = {"Landroidx/credentials/playservices/controllers/CredentialProviderBaseController;", "", "Landroid/content/Context;", "context", "<init>", "(Landroid/content/Context;)V", "Landroid/os/ResultReceiver;", "T", "resultReceiver", "toIpcFriendlyResultReceiver", "(Landroid/os/ResultReceiver;)Landroid/os/ResultReceiver;", "Landroid/content/Intent;", "hiddenIntent", "", "typeTag", "Lc1e;", "generateHiddenActivityIntent", "(Landroid/os/ResultReceiver;Landroid/content/Intent;Ljava/lang/String;)V", "Landroid/content/Context;", "Companion", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
public class CredentialProviderBaseController {
    public static final String ACTIVITY_REQUEST_CODE_TAG = "ACTIVITY_REQUEST_CODE";
    public static final String BEGIN_SIGN_IN_TAG = "BEGIN_SIGN_IN";
    public static final String CREATE_CANCELED = "CREATE_CANCELED";
    public static final String CREATE_INTERRUPTED = "CREATE_INTERRUPTED";
    public static final String CREATE_PASSWORD_TAG = "CREATE_PASSWORD";
    public static final String CREATE_PUBLIC_KEY_CREDENTIAL_TAG = "CREATE_PUBLIC_KEY_CREDENTIAL";
    public static final String CREATE_UNKNOWN = "CREATE_UNKNOWN";
    public static final String EXCEPTION_MESSAGE_TAG = "EXCEPTION_MESSAGE";
    public static final String EXCEPTION_TYPE_TAG = "EXCEPTION_TYPE";
    public static final String EXTRA_DIGITAL_CREDENTIAL_INTENT = "EXTRA_DIGITAL_CREDENTIAL_INTENT";
    public static final String EXTRA_ERROR_NAME = "EXTRA_ERROR_NAME";
    public static final String EXTRA_FLOW_PENDING_INTENT = "EXTRA_FLOW_PENDING_INTENT";
    public static final String FAILURE_RESPONSE_TAG = "FAILURE_RESPONSE";
    public static final String GET_CANCELED = "GET_CANCELED_TAG";
    public static final String GET_INTERRUPTED = "GET_INTERRUPTED";
    public static final String GET_NO_CREDENTIALS = "GET_NO_CREDENTIALS";
    public static final String GET_UNKNOWN = "GET_UNKNOWN";
    public static final String REQUEST_TAG = "REQUEST_TYPE";
    public static final String RESULT_DATA_TAG = "RESULT_DATA";
    public static final String RESULT_RECEIVER_TAG = "RESULT_RECEIVER";
    public static final String SIGN_IN_INTENT_TAG = "SIGN_IN_INTENT";
    public static final String TYPE_TAG = "TYPE";
    private final Context context;

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);
    private static final Set<Integer> retryables = k80.S0(new Integer[]{7, 20});
    private static final int CONTROLLER_REQUEST_CODE = 1;

    public CredentialProviderBaseController(Context context) {
        context.getClass();
        this.context = context;
    }

    public final void generateHiddenActivityIntent(ResultReceiver resultReceiver, Intent hiddenIntent, String typeTag) {
        resultReceiver.getClass();
        hiddenIntent.getClass();
        typeTag.getClass();
        hiddenIntent.putExtra(TYPE_TAG, typeTag);
        hiddenIntent.putExtra(ACTIVITY_REQUEST_CODE_TAG, CONTROLLER_REQUEST_CODE);
        hiddenIntent.putExtra(RESULT_RECEIVER_TAG, toIpcFriendlyResultReceiver(resultReceiver));
        hiddenIntent.setFlags(ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID);
    }

    public final <T extends ResultReceiver> ResultReceiver toIpcFriendlyResultReceiver(T resultReceiver) {
        Parcel parcelObtain = Parcel.obtain();
        parcelObtain.getClass();
        resultReceiver.getClass();
        resultReceiver.writeToParcel(parcelObtain, 0);
        parcelObtain.setDataPosition(0);
        ResultReceiver resultReceiver2 = (ResultReceiver) ResultReceiver.CREATOR.createFromParcel(parcelObtain);
        parcelObtain.recycle();
        return resultReceiver2;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000L\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\"\n\u0002\b\u001c\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J#\u0010\n\u001a\u00020\u00072\b\u0010\u0005\u001a\u0004\u0018\u00010\u00042\b\u0010\u0006\u001a\u0004\u0018\u00010\u0004H\u0000¢\u0006\u0004\b\b\u0010\tJ#\u0010\u0011\u001a\u00020\u000e*\u00020\u000b2\u0006\u0010\f\u001a\u00020\u00042\u0006\u0010\r\u001a\u00020\u0004H\u0000¢\u0006\u0004\b\u000f\u0010\u0010J-\u0010\u0019\u001a\u00020\u000e*\u00020\u000b2\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0014\u001a\u00020\u00122\b\u0010\u0016\u001a\u0004\u0018\u00010\u0015H\u0000¢\u0006\u0004\b\u0017\u0010\u0018J#\u0010\u001d\u001a\u00020\u001a2\b\u0010\u0005\u001a\u0004\u0018\u00010\u00042\b\u0010\u0006\u001a\u0004\u0018\u00010\u0004H\u0000¢\u0006\u0004\b\u001b\u0010\u001cR \u0010\u001e\u001a\u00020\u00128\u0000X\u0081D¢\u0006\u0012\n\u0004\b\u001e\u0010\u001f\u0012\u0004\b\"\u0010\u0003\u001a\u0004\b \u0010!R\u001d\u0010$\u001a\b\u0012\u0004\u0012\u00020\u00120#8\u0006¢\u0006\f\n\u0004\b$\u0010%\u001a\u0004\b&\u0010'R\u0014\u0010(\u001a\u00020\u00048\u0006X\u0086T¢\u0006\u0006\n\u0004\b(\u0010)R\u0014\u0010*\u001a\u00020\u00048\u0006X\u0086T¢\u0006\u0006\n\u0004\b*\u0010)R\u0014\u0010+\u001a\u00020\u00048\u0006X\u0086T¢\u0006\u0006\n\u0004\b+\u0010)R\u0014\u0010,\u001a\u00020\u00048\u0006X\u0086T¢\u0006\u0006\n\u0004\b,\u0010)R\u0014\u0010-\u001a\u00020\u00048\u0006X\u0086T¢\u0006\u0006\n\u0004\b-\u0010)R\u0014\u0010.\u001a\u00020\u00048\u0006X\u0086T¢\u0006\u0006\n\u0004\b.\u0010)R\u0014\u0010/\u001a\u00020\u00048\u0006X\u0086T¢\u0006\u0006\n\u0004\b/\u0010)R\u0014\u00100\u001a\u00020\u00048\u0006X\u0086T¢\u0006\u0006\n\u0004\b0\u0010)R\u0014\u00101\u001a\u00020\u00048\u0006X\u0086T¢\u0006\u0006\n\u0004\b1\u0010)R\u0014\u00102\u001a\u00020\u00048\u0006X\u0086T¢\u0006\u0006\n\u0004\b2\u0010)R\u0014\u00103\u001a\u00020\u00048\u0006X\u0086T¢\u0006\u0006\n\u0004\b3\u0010)R\u0014\u00104\u001a\u00020\u00048\u0006X\u0086T¢\u0006\u0006\n\u0004\b4\u0010)R\u0014\u00105\u001a\u00020\u00048\u0006X\u0086T¢\u0006\u0006\n\u0004\b5\u0010)R\u0014\u00106\u001a\u00020\u00048\u0006X\u0086T¢\u0006\u0006\n\u0004\b6\u0010)R\u0014\u00107\u001a\u00020\u00048\u0006X\u0086T¢\u0006\u0006\n\u0004\b7\u0010)R\u0014\u00108\u001a\u00020\u00048\u0006X\u0086T¢\u0006\u0006\n\u0004\b8\u0010)R\u0014\u00109\u001a\u00020\u00048\u0006X\u0086T¢\u0006\u0006\n\u0004\b9\u0010)R\u0014\u0010:\u001a\u00020\u00048\u0006X\u0086T¢\u0006\u0006\n\u0004\b:\u0010)R\u0014\u0010;\u001a\u00020\u00048\u0006X\u0086T¢\u0006\u0006\n\u0004\b;\u0010)R\u0014\u0010<\u001a\u00020\u00048\u0006X\u0086T¢\u0006\u0006\n\u0004\b<\u0010)R\u0014\u0010=\u001a\u00020\u00048\u0006X\u0086T¢\u0006\u0006\n\u0004\b=\u0010)R\u0014\u0010>\u001a\u00020\u00048\u0006X\u0086T¢\u0006\u0006\n\u0004\b>\u0010)¨\u0006?"}, d2 = {"Landroidx/credentials/playservices/controllers/CredentialProviderBaseController$Companion;", "", "<init>", "()V", "", "typeName", "msg", "Landroidx/credentials/exceptions/GetCredentialException;", "getCredentialExceptionTypeToException$credentials_play_services_auth", "(Ljava/lang/String;Ljava/lang/String;)Landroidx/credentials/exceptions/GetCredentialException;", "getCredentialExceptionTypeToException", "Landroid/os/ResultReceiver;", "errName", "errMsg", "Lc1e;", "reportError$credentials_play_services_auth", "(Landroid/os/ResultReceiver;Ljava/lang/String;Ljava/lang/String;)V", "reportError", "", "requestCode", "resultCode", "Landroid/content/Intent;", "data", "reportResult$credentials_play_services_auth", "(Landroid/os/ResultReceiver;IILandroid/content/Intent;)V", "reportResult", "Landroidx/credentials/exceptions/CreateCredentialException;", "createCredentialExceptionTypeToException$credentials_play_services_auth", "(Ljava/lang/String;Ljava/lang/String;)Landroidx/credentials/exceptions/CreateCredentialException;", "createCredentialExceptionTypeToException", "CONTROLLER_REQUEST_CODE", "I", "getCONTROLLER_REQUEST_CODE$credentials_play_services_auth", "()I", "getCONTROLLER_REQUEST_CODE$credentials_play_services_auth$annotations", "", "retryables", "Ljava/util/Set;", "getRetryables", "()Ljava/util/Set;", "GET_CANCELED", "Ljava/lang/String;", CredentialProviderBaseController.GET_INTERRUPTED, CredentialProviderBaseController.GET_NO_CREDENTIALS, CredentialProviderBaseController.GET_UNKNOWN, CredentialProviderBaseController.CREATE_CANCELED, CredentialProviderBaseController.CREATE_INTERRUPTED, CredentialProviderBaseController.CREATE_UNKNOWN, "TYPE_TAG", "BEGIN_SIGN_IN_TAG", "SIGN_IN_INTENT_TAG", "CREATE_PASSWORD_TAG", "CREATE_PUBLIC_KEY_CREDENTIAL_TAG", "REQUEST_TAG", "RESULT_DATA_TAG", CredentialProviderBaseController.EXTRA_FLOW_PENDING_INTENT, CredentialProviderBaseController.EXTRA_DIGITAL_CREDENTIAL_INTENT, CredentialProviderBaseController.EXTRA_ERROR_NAME, "FAILURE_RESPONSE_TAG", "EXCEPTION_TYPE_TAG", "EXCEPTION_MESSAGE_TAG", "ACTIVITY_REQUEST_CODE_TAG", "RESULT_RECEIVER_TAG", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(gy2 gy2Var) {
            this();
        }

        public final CreateCredentialException createCredentialExceptionTypeToException$credentials_play_services_auth(String typeName, String msg) {
            return g76.L(typeName, CredentialProviderBaseController.CREATE_CANCELED) ? new CreateCredentialCancellationException(msg) : g76.L(typeName, CredentialProviderBaseController.CREATE_INTERRUPTED) ? new CreateCredentialInterruptedException(msg) : new CreateCredentialUnknownException(msg);
        }

        public final int getCONTROLLER_REQUEST_CODE$credentials_play_services_auth() {
            return CredentialProviderBaseController.CONTROLLER_REQUEST_CODE;
        }

        public final GetCredentialException getCredentialExceptionTypeToException$credentials_play_services_auth(String typeName, String msg) {
            if (typeName != null) {
                int iHashCode = typeName.hashCode();
                if (iHashCode != -1567968963) {
                    if (iHashCode != -154594663) {
                        if (iHashCode == 1996705159 && typeName.equals(CredentialProviderBaseController.GET_NO_CREDENTIALS)) {
                            return new NoCredentialException(msg);
                        }
                    } else if (typeName.equals(CredentialProviderBaseController.GET_INTERRUPTED)) {
                        return new GetCredentialInterruptedException(msg);
                    }
                } else if (typeName.equals(CredentialProviderBaseController.GET_CANCELED)) {
                    return new GetCredentialCancellationException(msg);
                }
            }
            return new GetCredentialUnknownException(msg);
        }

        public final Set<Integer> getRetryables() {
            return CredentialProviderBaseController.retryables;
        }

        public final void reportError$credentials_play_services_auth(ResultReceiver resultReceiver, String str, String str2) {
            resultReceiver.getClass();
            str.getClass();
            str2.getClass();
            Bundle bundle = new Bundle();
            bundle.putBoolean(CredentialProviderBaseController.FAILURE_RESPONSE_TAG, true);
            bundle.putString(CredentialProviderBaseController.EXCEPTION_TYPE_TAG, str);
            bundle.putString(CredentialProviderBaseController.EXCEPTION_MESSAGE_TAG, str2);
            resultReceiver.send(Integer.MAX_VALUE, bundle);
        }

        public final void reportResult$credentials_play_services_auth(ResultReceiver resultReceiver, int i, int i2, Intent intent) {
            resultReceiver.getClass();
            Bundle bundle = new Bundle();
            bundle.putBoolean(CredentialProviderBaseController.FAILURE_RESPONSE_TAG, false);
            bundle.putInt(CredentialProviderBaseController.ACTIVITY_REQUEST_CODE_TAG, i);
            bundle.putParcelable(CredentialProviderBaseController.RESULT_DATA_TAG, intent);
            resultReceiver.send(i2, bundle);
        }

        private Companion() {
        }

        public static /* synthetic */ void getCONTROLLER_REQUEST_CODE$credentials_play_services_auth$annotations() {
        }
    }
}
