package com.userleap.internal.sessions.util;

import android.widget.EditText;
import android.widget.ImageView;
import android.widget.VideoView;
import defpackage.d46;
import kotlin.Metadata;
import sprig.graphics.p;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\b\n\u0002\u0018\u0002\n\u0002\b\t\"\u001a\u0010\u0001\u001a\u00020\u00008\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0001\u0010\u0002\u001a\u0004\b\u0003\u0010\u0004\"\u001a\u0010\u0005\u001a\u00020\u00008\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0005\u0010\u0002\u001a\u0004\b\u0006\u0010\u0004\"\u001a\u0010\u0007\u001a\u00020\u00008\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0007\u0010\u0002\u001a\u0004\b\b\u0010\u0004¨\u0006\t"}, d2 = {"Lsprig/h/p;", "inputRedactor", "Lsprig/h/p;", "getInputRedactor", "()Lsprig/h/p;", "imageRedactor", "getImageRedactor", "videoRedactor", "getVideoRedactor", "userleap_release"}, k = 2, mv = {1, 8, 0})
public final class RedactorsKt {
    private static final p inputRedactor = new p(d46.Q(EditText.class));
    private static final p imageRedactor = new p(d46.Q(ImageView.class));
    private static final p videoRedactor = new p(d46.Q(VideoView.class));

    public static final p getImageRedactor() {
        return imageRedactor;
    }

    public static final p getInputRedactor() {
        return inputRedactor;
    }

    public static final p getVideoRedactor() {
        return videoRedactor;
    }
}
