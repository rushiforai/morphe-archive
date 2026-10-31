package com.facebook.ads.redexgen.X;

import android.net.Uri;
import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.cD, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public interface InterfaceC1550cD {
    void AAH();

    boolean AAU();

    boolean AAV();

    boolean ABK();

    void AI4(boolean z11, int i5);

    void ALJ(int i5);

    void ALO(EnumC1664e4 enumC1664e4, int i5);

    void ALY(int i5);

    void destroy();

    int getCurrentPosition();

    int getDuration();

    long getInitialBufferTime();

    EnumC1664e4 getStartReason();

    EnumC1549cC getState();

    int getVideoHeight();

    int getVideoWidth();

    View getView();

    float getVolume();

    void seekTo(int i5);

    void setBackgroundPlaybackEnabled(boolean z11);

    void setControlsAnchorView(View view);

    void setFullScreen(boolean z11);

    void setRequestedVolume(float f11);

    void setVideoMPD(String str);

    void setVideoStateChangeListener(InterfaceC1548cB interfaceC1548cB);

    void setup(Uri uri);
}
