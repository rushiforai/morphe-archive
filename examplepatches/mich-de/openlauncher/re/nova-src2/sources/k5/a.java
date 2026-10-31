package k5;

import android.content.Intent;
import android.os.Bundle;
import android.os.ResultReceiver;
import androidx.compose.ui.node.LayoutNode;
import androidx.credentials.exceptions.GetCredentialCancellationException;
import androidx.credentials.exceptions.GetCredentialException;
import androidx.credentials.exceptions.GetCredentialInterruptedException;
import androidx.credentials.exceptions.GetCredentialUnknownException;
import androidx.credentials.exceptions.NoCredentialException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class a {
    public static GetCredentialException a(String str, String str2) {
        if (str != null) {
            int iHashCode = str.hashCode();
            if (iHashCode != -1567968963) {
                if (iHashCode != -154594663) {
                    if (iHashCode == 1996705159 && str.equals("GET_NO_CREDENTIALS")) {
                        return new NoCredentialException(str2);
                    }
                } else if (str.equals("GET_INTERRUPTED")) {
                    return new GetCredentialInterruptedException(str2);
                }
            } else if (str.equals("GET_CANCELED_TAG")) {
                return new GetCredentialCancellationException(str2);
            }
        }
        return new GetCredentialUnknownException(str2);
    }

    public static void b(ResultReceiver resultReceiver, String str, String errMsg) {
        Intrinsics.g(resultReceiver, "<this>");
        Intrinsics.g(errMsg, "errMsg");
        Bundle bundle = new Bundle();
        bundle.putBoolean("FAILURE_RESPONSE", true);
        bundle.putString("EXCEPTION_TYPE", str);
        bundle.putString("EXCEPTION_MESSAGE", errMsg);
        resultReceiver.send(LayoutNode.NotPlacedPlaceOrder, bundle);
    }

    public static void c(ResultReceiver resultReceiver, int i5, int i11, Intent intent) {
        Intrinsics.g(resultReceiver, "<this>");
        Bundle bundle = new Bundle();
        bundle.putBoolean("FAILURE_RESPONSE", false);
        bundle.putInt("ACTIVITY_REQUEST_CODE", i5);
        bundle.putParcelable("RESULT_DATA", intent);
        resultReceiver.send(i11, bundle);
    }
}
