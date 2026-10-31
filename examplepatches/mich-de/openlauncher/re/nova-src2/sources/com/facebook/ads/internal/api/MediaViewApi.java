package com.facebook.ads.internal.api;

import android.view.View;
import androidx.annotation.Keep;
import com.facebook.ads.MediaView;
import com.facebook.ads.MediaViewListener;
import com.facebook.ads.MediaViewVideoRenderer;
import com.facebook.infer.annotation.Nullsafe;

@Keep
@Nullsafe(Nullsafe.Mode.LOCAL)
/* loaded from: classes.dex */
public interface MediaViewApi extends AdComponentViewApiProvider {
    void destroy();

    View getAdContentsView();

    int getMediaHeight();

    int getMediaWidth();

    int getVideoDuration();

    void initialize(AdViewConstructorParams adViewConstructorParams, MediaView mediaView);

    boolean isVideoContent();

    void setListener(MediaViewListener mediaViewListener);

    void setVideoRenderer(MediaViewVideoRenderer mediaViewVideoRenderer);
}
