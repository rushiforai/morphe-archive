package nova.branch.engage.sesame_lite.api_integration;

import android.app.Activity;
import android.os.Bundle;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import o4.a;
import org.jetbrains.annotations.NotNull;
import s80.b;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\u0018\u0000 \u00042\u00020\u0001:\u0001\u0005B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0006"}, d2 = {"Lnova/branch/engage/sesame_lite/api_integration/AskPermissionActivity;", "Landroid/app/Activity;", "<init>", "()V", k.O, "s80/b", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes5.dex */
public final class AskPermissionActivity extends Activity {

    @NotNull
    public static final b Companion = new b();

    @Override // android.app.Activity
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        String[] stringArrayExtra = getIntent().getStringArrayExtra("extra_permissions");
        if (stringArrayExtra == null || stringArrayExtra.length == 0) {
            setResult(0);
            finish();
            return;
        }
        ArrayList arrayList = new ArrayList();
        for (String str : stringArrayExtra) {
            Intrinsics.d(str);
            if (a.a(this, str) != 0) {
                arrayList.add(str);
            }
        }
        if (!arrayList.isEmpty()) {
            n4.b.g(this, (String[]) arrayList.toArray(new String[0]), Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE);
        } else {
            setResult(-1);
            finish();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x002e  */
    @Override // android.app.Activity
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onRequestPermissionsResult(int i5, String[] permissions, int[] grantResults) {
        Integer numValueOf;
        Intrinsics.g(permissions, "permissions");
        Intrinsics.g(grantResults, "grantResults");
        super.onRequestPermissionsResult(i5, permissions, grantResults);
        if (i5 == 123) {
            if (grantResults.length == 0) {
                setResult(0);
            } else {
                int length = grantResults.length;
                int i11 = 0;
                while (true) {
                    if (i11 >= length) {
                        numValueOf = null;
                        break;
                    }
                    int i12 = grantResults[i11];
                    if (i12 == 0) {
                        numValueOf = Integer.valueOf(i12);
                        break;
                    }
                    i11++;
                }
                if (numValueOf != null) {
                    setResult(-1);
                }
            }
            finish();
        }
    }
}
