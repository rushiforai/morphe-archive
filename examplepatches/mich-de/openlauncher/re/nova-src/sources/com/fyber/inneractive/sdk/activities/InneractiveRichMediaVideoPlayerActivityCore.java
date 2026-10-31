package com.fyber.inneractive.sdk.activities;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.widget.VideoView;
import com.fyber.inneractive.sdk.R;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public class InneractiveRichMediaVideoPlayerActivityCore extends Activity {
    public static final String VIDEO_CURRENT_POSITION = "video_current_position";
    public static final String VIDEO_URL = "video_url";

    /* renamed from: a, reason: collision with root package name */
    public VideoView f27581a;

    /* renamed from: b, reason: collision with root package name */
    public int f27582b = 0;

    /* renamed from: c, reason: collision with root package name */
    public final n f27583c = new n(this);

    public static boolean startRichMediaIntent(Context context, String str) {
        Intent intent = new Intent(context, (Class<?>) InneractiveRichMediaVideoPlayerActivityCore.class);
        intent.setFlags(268435456);
        intent.putExtra(VIDEO_URL, str);
        try {
            context.startActivity(intent);
            return true;
        } catch (Exception unused) {
            IAlog.a("Activity InneractiveRichMediaVideoPlayerActivityCore was not found. Did you declare it in your AndroidManifest.xml?", new Object[0]);
            return false;
        }
    }

    public void initWindowFeatures() {
        requestWindowFeature(1);
        getWindow().addFlags(1024);
        getWindow().addFlags(128);
    }

    @Override // android.app.Activity
    public void onCreate(Bundle bundle) {
        initWindowFeatures();
        super.onCreate(bundle);
        if (bundle != null) {
            this.f27582b = bundle.getInt(VIDEO_CURRENT_POSITION, 0);
        }
        setContentView(R.layout.ia_layout_rich_media_video);
        this.f27581a = (VideoView) findViewById(R.id.mraid_video_view);
        Intent intent = getIntent();
        String stringExtra = (intent == null || !intent.hasExtra(VIDEO_URL)) ? null : intent.getStringExtra(VIDEO_URL);
        if (TextUtils.isEmpty(stringExtra)) {
            IAlog.a("Error: video can not be played.", new Object[0]);
            finish();
        } else {
            this.f27581a.setVideoPath(stringExtra);
            this.f27581a.setOnCompletionListener(new p(this));
            this.f27581a.setOnErrorListener(new q(this));
            this.f27581a.setOnPreparedListener(this.f27583c);
        }
        findViewById(R.id.ia_iv_close_button).setOnClickListener(new o(this));
    }

    @Override // android.app.Activity
    public void onPause() {
        super.onPause();
        this.f27582b = this.f27581a.getCurrentPosition();
        this.f27581a.pause();
    }

    @Override // android.app.Activity
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        VideoView videoView = this.f27581a;
        bundle.putInt(VIDEO_CURRENT_POSITION, videoView == null ? 0 : videoView.getCurrentPosition());
    }
}
