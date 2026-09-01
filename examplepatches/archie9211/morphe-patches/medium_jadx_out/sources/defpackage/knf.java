package defpackage;

import android.text.TextUtils;
import android.util.Pair;
import android.util.SparseArray;
import com.datadog.android.core.yjCm.PqkdNGCEoxOKZk;
import com.drew.metadata.exif.makernotes.FujifilmMakernoteDirectory;
import com.google.android.gms.common.api.Status;
import com.medium.android.tag.recommendedposts.sB.mBTDfueQiGWRV;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class knf {
    public static final SparseArray a;

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:73:0x00ed  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x00ff  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x011f A[FALL_THROUGH] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static com.google.firebase.FirebaseException a(com.google.android.gms.common.api.Status r4) {
        /*
            Method dump skipped, instruction units count: 518
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.knf.a(com.google.android.gms.common.api.Status):com.google.firebase.FirebaseException");
    }

    public static String b(int i) {
        Pair pair = (Pair) a.get(i);
        return pair != null ? (String) pair.first : "INTERNAL_ERROR";
    }

    public static String c(String str, Status status) {
        if (TextUtils.isEmpty(status.b)) {
            return str;
        }
        return str + " [ " + status.b + " ]";
    }

    static {
        SparseArray sparseArray = new SparseArray();
        a = sparseArray;
        sparseArray.put(17000, new Pair("ERROR_INVALID_CUSTOM_TOKEN", "The custom token format is incorrect. Please check the documentation."));
        sparseArray.put(17002, new Pair("ERROR_CUSTOM_TOKEN_MISMATCH", "The custom token corresponds to a different audience."));
        sparseArray.put(17004, new Pair("ERROR_INVALID_CREDENTIAL", "The supplied auth credential is incorrect, malformed or has expired."));
        sparseArray.put(17008, new Pair("ERROR_INVALID_EMAIL", "The email address is badly formatted."));
        sparseArray.put(17009, new Pair("ERROR_WRONG_PASSWORD", "The password is invalid or the user does not have a password."));
        sparseArray.put(17024, new Pair("ERROR_USER_MISMATCH", "The supplied credentials do not correspond to the previously signed in user."));
        sparseArray.put(17014, new Pair("ERROR_REQUIRES_RECENT_LOGIN", "This operation is sensitive and requires recent authentication. Log in again before retrying this request."));
        sparseArray.put(17012, new Pair("ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL", "An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address."));
        sparseArray.put(17007, new Pair("ERROR_EMAIL_ALREADY_IN_USE", "The email address is already in use by another account."));
        sparseArray.put(17025, new Pair("ERROR_CREDENTIAL_ALREADY_IN_USE", mBTDfueQiGWRV.OUNUpL));
        sparseArray.put(17005, new Pair("ERROR_USER_DISABLED", "The user account has been disabled by an administrator."));
        sparseArray.put(17021, new Pair("ERROR_USER_TOKEN_EXPIRED", "The user's credential is no longer valid. The user must sign in again."));
        sparseArray.put(17011, new Pair("ERROR_USER_NOT_FOUND", "There is no user record corresponding to this identifier. The user may have been deleted."));
        sparseArray.put(17017, new Pair("ERROR_INVALID_USER_TOKEN", "This user's credential isn't valid for this project. This can happen if the user's token has been tampered with, or if the user isn't for the project associated with this API key."));
        sparseArray.put(17006, new Pair("ERROR_OPERATION_NOT_ALLOWED", "This operation is not allowed. This may be because the given sign-in provider is disabled for this Firebase project. Enable it in the Firebase console, under the sign-in method tab of the Auth section."));
        sparseArray.put(FujifilmMakernoteDirectory.TAG_FACE_REC_INFO, new Pair("ERROR_WEAK_PASSWORD", "The given password is invalid."));
        sparseArray.put(17029, new Pair("ERROR_EXPIRED_ACTION_CODE", "The out of band code has expired."));
        sparseArray.put(17030, new Pair("ERROR_INVALID_ACTION_CODE", "The out of band code is invalid. This can happen if the code is malformed, expired, or has already been used."));
        sparseArray.put(17031, new Pair("ERROR_INVALID_MESSAGE_PAYLOAD", "The email template corresponding to this action contains invalid characters in its message. Please fix by going to the Auth email templates section in the Firebase Console."));
        sparseArray.put(17033, new Pair("ERROR_INVALID_RECIPIENT_EMAIL", "The email corresponding to this action failed to send as the provided recipient email address is invalid."));
        sparseArray.put(17032, new Pair("ERROR_INVALID_SENDER", "The email template corresponding to this action contains an invalid sender email or name. Please fix by going to the Auth email templates section in the Firebase Console."));
        sparseArray.put(17034, new Pair("ERROR_MISSING_EMAIL", "An email address must be provided."));
        sparseArray.put(17035, new Pair("ERROR_MISSING_PASSWORD", "A password must be provided."));
        sparseArray.put(17041, new Pair("ERROR_MISSING_PHONE_NUMBER", "To send verification codes, provide a phone number for the recipient."));
        sparseArray.put(17042, new Pair("ERROR_INVALID_PHONE_NUMBER", "The format of the phone number provided is incorrect. Please enter the phone number in a format that can be parsed into E.164 format. E.164 phone numbers are written in the format [+][country code][subscriber number including area code]."));
        sparseArray.put(17043, new Pair("ERROR_MISSING_VERIFICATION_CODE", "The verification code from SMS/TOTP is empty. Please enter the verification code."));
        sparseArray.put(17044, new Pair("ERROR_INVALID_VERIFICATION_CODE", "The verification code from SMS/TOTP is invalid. Please check and enter the correct verification code again."));
        sparseArray.put(17045, new Pair("ERROR_MISSING_VERIFICATION_ID", "The Phone Auth Credential was created with an empty verification ID."));
        sparseArray.put(17046, new Pair("ERROR_INVALID_VERIFICATION_ID", "The verification ID used to create the phone auth credential is invalid."));
        sparseArray.put(17049, new Pair("ERROR_RETRY_PHONE_AUTH", "An error occurred during authentication using the PhoneAuthCredential. Please retry authentication."));
        sparseArray.put(17051, new Pair("ERROR_SESSION_EXPIRED", "The sms code has expired. Please re-send the verification code to try again."));
        sparseArray.put(17052, new Pair("ERROR_QUOTA_EXCEEDED", "This project's quota for this operation has been exceeded."));
        sparseArray.put(17028, new Pair("ERROR_APP_NOT_AUTHORIZED", "This app is not authorized to use Firebase Authentication. Please verify that the correct package name, SHA-1, and SHA-256 are configured in the Firebase Console."));
        sparseArray.put(17063, new Pair("ERROR_API_NOT_AVAILABLE_WITHOUT_GOOGLE_PLAY", "The API that you are calling is not available on devices without Google Play services."));
        sparseArray.put(17062, new Pair("ERROR_WEB_INTERNAL_ERROR", "There was an internal error in the web widget."));
        sparseArray.put(17064, new Pair("ERROR_INVALID_CERT_HASH", "There was an error while trying to get your package certificate hash."));
        sparseArray.put(17065, new Pair("ERROR_WEB_STORAGE_UNSUPPORTED", "This browser is not supported or 3rd party cookies and data may be disabled."));
        sparseArray.put(17038, new Pair("ERROR_UNAUTHORIZED_DOMAIN", "The configured custom domain is not allowlisted. Please allowlist the domain in the Firebase console -> Authentication -> Settings -> Authorized domains tab."));
        sparseArray.put(17040, new Pair("ERROR_MISSING_CONTINUE_URI", "A continue URL must be provided in the request."));
        sparseArray.put(17068, new Pair("ERROR_DYNAMIC_LINK_NOT_ACTIVATED", "Please activate Dynamic Links in the Firebase Console and agree to the terms and conditions."));
        sparseArray.put(17071, new Pair("ERROR_INVALID_PROVIDER_ID", "The provider ID provided for the attempted web operation is invalid."));
        sparseArray.put(17057, new Pair("ERROR_WEB_CONTEXT_ALREADY_PRESENTED", "A headful operation is already in progress. Please wait for that to finish."));
        sparseArray.put(17058, new Pair("ERROR_WEB_CONTEXT_CANCELED", "The web operation was canceled by the user."));
        sparseArray.put(17072, new Pair("ERROR_TENANT_ID_MISMATCH", "The provided tenant ID does not match the Auth instance's tenant ID."));
        sparseArray.put(17073, new Pair("ERROR_UNSUPPORTED_TENANT_OPERATION", "This operation is not supported in a multi-tenant context."));
        sparseArray.put(17074, new Pair("ERROR_INVALID_DYNAMIC_LINK_DOMAIN", "The provided dynamic link domain is not configured or authorized for the current project."));
        sparseArray.put(17214, new Pair("ERROR_INVALID_HOSTING_LINK_DOMAIN", "The provided hosting link domain is not configured in Firebase Hosting or is not owned by the current project. This cannot be a default hosting domain (web.app or firebaseapp.com). "));
        sparseArray.put(17075, new Pair("ERROR_REJECTED_CREDENTIAL", "The request contains malformed or mismatching credentials."));
        sparseArray.put(17077, new Pair("ERROR_PHONE_NUMBER_NOT_FOUND", "The provided phone number does not match any of the second factor phone numbers associated with this user."));
        sparseArray.put(17079, new Pair("ERROR_INVALID_TENANT_ID", "The Auth instance's tenant ID is invalid."));
        sparseArray.put(17078, new Pair("ERROR_SECOND_FACTOR_REQUIRED", "Please complete a second factor challenge to finish signing into this account."));
        sparseArray.put(17080, new Pair("ERROR_API_NOT_AVAILABLE", "The API that you are calling is not available."));
        sparseArray.put(17081, new Pair("ERROR_MISSING_MULTI_FACTOR_SESSION", "The request is missing proof of first factor successful sign-in."));
        sparseArray.put(17082, new Pair("ERROR_MISSING_MULTI_FACTOR_INFO", "No second factor identifier is provided."));
        sparseArray.put(17083, new Pair("ERROR_INVALID_MULTI_FACTOR_SESSION", "The request does not contain a valid proof of first factor successful sign-in."));
        sparseArray.put(17084, new Pair("ERROR_MULTI_FACTOR_INFO_NOT_FOUND", "The user does not have a second factor matching the identifier provided."));
        sparseArray.put(17085, new Pair("ERROR_ADMIN_RESTRICTED_OPERATION", "This operation is restricted to administrators only."));
        sparseArray.put(17086, new Pair("ERROR_UNVERIFIED_EMAIL", "This operation requires a verified email."));
        sparseArray.put(17087, new Pair("ERROR_SECOND_FACTOR_ALREADY_ENROLLED", "The second factor is already enrolled on this account."));
        sparseArray.put(17088, new Pair("ERROR_MAXIMUM_SECOND_FACTOR_COUNT_EXCEEDED", "The maximum allowed number of second factors on a user has been exceeded."));
        sparseArray.put(17089, new Pair("ERROR_UNSUPPORTED_FIRST_FACTOR", "Enrolling a second factor or signing in with a multi-factor account requires sign-in with a supported first factor."));
        sparseArray.put(17090, new Pair("ERROR_EMAIL_CHANGE_NEEDS_VERIFICATION", "Multi-factor users must always have a verified email."));
        sparseArray.put(17091, new Pair("ERROR_INTERNAL_SUCCESS_SIGN_OUT", "This is an internal error code indicating that the operation was successful but the user needs to be signed out."));
        sparseArray.put(17093, new Pair("ERROR_MISSING_CLIENT_IDENTIFIER", "This request is missing a valid app identifier, meaning that Play Integrity checks, and reCAPTCHA checks were unsuccessful. Please try again, or check the logcat for more details."));
        sparseArray.put(17209, new Pair("ERROR_PASSKEY_ENROLLMENT_NOT_FOUND", "Cannot find the passkey linked to the current account."));
        sparseArray.put(17210, new Pair(PqkdNGCEoxOKZk.wteMoWCGypKcdf, "The response from Credential Manager is either not parseable, missing required fields or has invalid values for certain fields."));
        sparseArray.put(18002, new Pair("ERROR_ALTERNATE_CLIENT_IDENTIFIER_REQUIRED", "This request contains an app identifier which could not be verified. Please try again with a different identifier(like reCAPTCHA). Check the logcat for more details."));
        sparseArray.put(17094, new Pair("ERROR_MISSING_OR_INVALID_NONCE", "The request does not contain a valid nonce. This can occur if the SHA-256 hash of the provided raw nonce does not match the hashed nonce in the ID token payload."));
        sparseArray.put(18001, new Pair("ERROR_USER_CANCELLED", "The user did not grant your application the permissions it requested."));
        sparseArray.put(17095, new Pair("ERROR_UNSUPPORTED_PASSTHROUGH_OPERATION", "This operation is not supported while in passthrough mode."));
        sparseArray.put(17096, new Pair("ERROR_TOKEN_REFRESH_UNAVAILABLE", "No refresh token is available."));
        sparseArray.put(17201, new Pair("ERROR_MISSING_RECAPTCHA_TOKEN", "The request is missing a reCAPTCHA token."));
        sparseArray.put(17202, new Pair("ERROR_INVALID_RECAPTCHA_TOKEN", "The request contains an invalid reCAPTCHA token."));
        sparseArray.put(17203, new Pair("ERROR_INVALID_RECAPTCHA_ACTION", "The request contains an invalid ReCAPTCHA action."));
        sparseArray.put(17200, new Pair("ERROR_RECAPTCHA_NOT_ENABLED", "ReCAPTCHA is not enabled."));
        sparseArray.put(17204, new Pair("ERROR_MISSING_CLIENT_TYPE", "The request is missing the ReCAPTCHA client type."));
        sparseArray.put(17205, new Pair("ERROR_MISSING_RECAPTCHA_VERSION", "The request is missing the ReCAPTCHA version."));
        sparseArray.put(17206, new Pair("ERROR_INVALID_RECAPTCHA_VERSION", "The request contains an invalid ReCAPTCHA version."));
        sparseArray.put(17207, new Pair("ERROR_INVALID_REQ_TYPE", "The request is invalid. This can occur if input parameters are missing or malformed."));
        sparseArray.put(17056, new Pair("ERROR_CAPTCHA_CHECK_FAILED", "The ReCAPTCHA assessment failed for this request."));
    }
}
