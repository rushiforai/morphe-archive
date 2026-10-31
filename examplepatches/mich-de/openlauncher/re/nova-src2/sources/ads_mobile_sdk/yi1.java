package ads_mobile_sdk;

import java.io.IOException;

/* loaded from: classes2.dex */
public class yi1 extends IOException {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ int f12028b = 0;

    /* renamed from: a, reason: collision with root package name */
    public boolean f12029a;

    public yi1(xi1 xi1Var) {
        super("Unable to parse map entry.", xi1Var);
    }

    public static yi1 a() {
        return new yi1("Protocol message had invalid UTF-8.");
    }

    public static yi1 c() {
        return new yi1("Failed to parse the message.");
    }

    public yi1(IOException iOException) {
        super(iOException.getMessage(), iOException);
    }

    public yi1(String str) {
        super(str);
    }
}
