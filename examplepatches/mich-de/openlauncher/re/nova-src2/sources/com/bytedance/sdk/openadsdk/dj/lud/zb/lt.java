package com.bytedance.sdk.openadsdk.dj.lud.zb;

import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.os.SystemClock;
import com.bykv.vk.openvk.ycx.ycx.ycx.sya.a;
import com.bytedance.sdk.component.utils.htf;
import java.io.File;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class lt extends sya {

    /* renamed from: dj, reason: collision with root package name */
    private int f26540dj = 0;
    private long sya;
    private final a ycx;

    /* renamed from: zb, reason: collision with root package name */
    private long f26541zb;

    public lt(a aVar) {
        this.ycx = aVar;
    }

    public void ycx(long j11) {
        this.f26541zb = j11;
    }

    public void zb(long j11) {
        this.sya = j11;
    }

    public void ycx(int i5) {
        this.f26540dj = i5;
    }

    @Override // com.bytedance.sdk.openadsdk.dj.lud.zb.sya
    public void ycx(JSONObject jSONObject) {
        if (jSONObject == null) {
            return;
        }
        try {
            jSONObject.put("total_duration", this.f26541zb);
            jSONObject.put("buffers_time", this.sya);
            jSONObject.put("video_backup", this.f26540dj);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZPoDucB7lmiY1F01iA", "fesokSyqbNWtRdNYgA==", "WuopoQyWesiOZdVXiRK0", 58);
            htf.sya("FeedOverModel", th2.getMessage());
        }
    }

    @Override // com.bytedance.sdk.openadsdk.dj.lud.zb.sya
    public void ycx(ycx ycxVar) throws JSONException {
        int integer;
        super.ycx(ycxVar);
        JSONObject jSONObjectDj = ycxVar.dj();
        if (com.bytedance.sdk.openadsdk.dv.lud.ycx("re_vi_en_le", 0) != 1) {
            return;
        }
        File file = new File(this.ycx.lud(), this.ycx.wie());
        if (file.exists()) {
            long jElapsedRealtime = SystemClock.elapsedRealtime();
            String absolutePath = file.getAbsolutePath();
            MediaExtractor mediaExtractor = null;
            try {
                MediaExtractor mediaExtractor2 = new MediaExtractor();
                try {
                    mediaExtractor2.setDataSource(absolutePath);
                    int trackCount = mediaExtractor2.getTrackCount();
                    for (int i5 = 0; i5 < trackCount; i5++) {
                        MediaFormat trackFormat = mediaExtractor2.getTrackFormat(i5);
                        String string = trackFormat.getString("mime");
                        if (string != null && ("video/avc".equals(string) || "video/hevc".equals(string))) {
                            if (trackFormat.containsKey("level")) {
                                integer = trackFormat.getInteger("level");
                                mediaExtractor2.release();
                                break;
                            }
                        }
                    }
                    mediaExtractor2.release();
                } catch (Throwable th2) {
                    th = th2;
                    mediaExtractor = mediaExtractor2;
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOUE7Un0pRD204=", "becpkAyYbMSPTtJomBis", "XOs5uDPoRcKWT9s=", 179);
                    if (mediaExtractor != null) {
                        mediaExtractor.release();
                    }
                    integer = -1;
                    jSONObjectDj.put("level", integer);
                    jSONObjectDj.put("level_cost_time", SystemClock.elapsedRealtime() - jElapsedRealtime);
                }
            } catch (Throwable th3) {
                th = th3;
            }
            integer = -1;
            try {
                jSONObjectDj.put("level", integer);
                jSONObjectDj.put("level_cost_time", SystemClock.elapsedRealtime() - jElapsedRealtime);
            } catch (JSONException e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZPoDucB7lmiY1F01iA", "fesokSyqbNWtRdNYgA==", "WesrmhG5W8KQRcVJqQelJk8=", 80);
            }
        }
    }
}
