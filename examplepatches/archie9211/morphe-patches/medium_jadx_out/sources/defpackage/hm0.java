package defpackage;

import com.medium.android.core.fragments.KB.JWcjNoweKCnTr;
import com.medium.android.profile.ui.premium.cfCC.mgKMENwrbHf;
import java.util.Arrays;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class hm0 extends co6 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ String b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ hm0(String str, int i) {
        super(0);
        this.a = i;
        this.b = str;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        String strValueOf;
        int i = this.a;
        String str = mgKMENwrbHf.PFBxOHWWWzjPina;
        String str2 = this.b;
        switch (i) {
            case 0:
                return ka1.r("Dropped item in BackPressuredBlockingQueue queue: ", str2);
            case 1:
                return ev6.x("Received unknown broadcast intent: [", str2, "]");
            case 2:
                return String.format(Locale.US, "Unable to schedule %s task on the executor", Arrays.copyOf(new Object[]{str2}, 1));
            case 3:
                return String.format(Locale.US, "Unable to get result of the %s task", Arrays.copyOf(new Object[]{str2}, 1));
            case 4:
                return String.format(Locale.US, "Unable to get result of the %s task", Arrays.copyOf(new Object[]{str2}, 1));
            case 5:
                return String.format(Locale.US, "Unable to get result of the %s task", Arrays.copyOf(new Object[]{str2}, 1));
            case 6:
                return String.format(Locale.US, "Unable to schedule %s task on the executor", Arrays.copyOf(new Object[]{str2}, 1));
            case 7:
                return String.format(Locale.US, "Unable to schedule %s task on the executor", Arrays.copyOf(new Object[]{str2}, 1));
            case 8:
                return String.format(Locale.US, "Cannot add event receiver for feature \"%s\", it is not registered.", Arrays.copyOf(new Object[]{str2}, 1));
            case 9:
                return String.format(Locale.US, "Feature \"%s\" already has event receiver registered, overwriting it.", Arrays.copyOf(new Object[]{str2}, 1));
            case 10:
                return str2;
            case 11:
                return ev6.x(JWcjNoweKCnTr.dXR, str2, "\" is an invalid tag, and was ignored.");
            case 12:
                return String.format(Locale.US, "User-provided tag %s is dropped, because it matches reserved tag key", Arrays.copyOf(new Object[]{str2}, 1));
            case 13:
                if (str2.length() <= 0) {
                    return str2;
                }
                StringBuilder sb = new StringBuilder();
                char cCharAt = str2.charAt(0);
                if (Character.isLowerCase(cCharAt)) {
                    Locale locale = Locale.US;
                    locale.getClass();
                    strValueOf = kyd.j0(cCharAt, locale);
                } else {
                    strValueOf = String.valueOf(cCharAt);
                }
                sb.append((Object) strValueOf);
                sb.append(str2.substring(1));
                return sb.toString();
            case 14:
                return String.format(Locale.US, str, Arrays.copyOf(new Object[]{str2}, 1));
            case 15:
                return String.format(Locale.US, str, Arrays.copyOf(new Object[]{str2}, 1));
            case 16:
                return "Kronos onError @host:".concat(str2);
            case 17:
                return String.format(Locale.US, "Error while trying to deserialize the NDK Crash info: %s", Arrays.copyOf(new Object[]{str2}, 1));
            case 18:
                return String.format(Locale.US, "Error while trying to deserialize the NDK Crash info: %s", Arrays.copyOf(new Object[]{str2}, 1));
            case 19:
                return String.format(Locale.US, "Feature \"%s\" is being retrieved, but no SDK instance is available. Make sure the SDK is properly initialized.", Arrays.copyOf(new Object[]{str2}, 1));
            case 20:
                return "Unexpected EOF at the operation=".concat(str2);
            default:
                return ev6.x("An SdkCode with name ", str2, " has already been registered.");
        }
    }
}
