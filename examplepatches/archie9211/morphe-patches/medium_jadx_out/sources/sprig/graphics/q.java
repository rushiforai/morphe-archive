package sprig.graphics;

import defpackage.fy3;
import defpackage.jhf;
import kotlin.Metadata;
import org.json.JSONException;
import org.json.JSONObject;
import sprig.j.e;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u0015\u0010\u0006\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007R\u0014\u0010\u000b\u001a\u00020\b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010\nR\u0014\u0010\u000f\u001a\u00020\f8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\r\u0010\u000eR\u0014\u0010\u0012\u001a\u00020\u00048\u0002X\u0082D¢\u0006\u0006\n\u0004\b\u0010\u0010\u0011¨\u0006\u0013"}, d2 = {"Lsprig/h/q;", "", "<init>", "()V", "", "payload", "fetchUploadUrl", "(Ljava/lang/String;)Ljava/lang/String;", "Ljhf;", "a", "Ljhf;", "networkService", "Lsprig/j/e;", "b", "Lsprig/j/e;", "logger", "c", "Ljava/lang/String;", "path", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class q {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public final jhf networkService = new jhf(null);

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    public final e logger = new e();

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    public final String path = "/2/environments/integrations/upload";

    public final String fetchUploadUrl(String payload) throws JSONException {
        payload.getClass();
        try {
            String string = new JSONObject(this.networkService.b(this.path, payload, fy3.a)).getJSONObject("upload").getString("url");
            string.getClass();
            return string;
        } catch (Exception e) {
            e.logError$default(this.logger, "Failed to generate upload url", "", "error: " + e + ", payload: " + payload, null, null, null, 56, null);
            return "";
        }
    }
}
