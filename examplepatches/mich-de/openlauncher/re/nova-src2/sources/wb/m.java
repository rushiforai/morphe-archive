package wb;

import android.media.MediaPlayer;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.bytedance.sdk.openadsdk.oty.sya;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.ref.WeakReference;

/* loaded from: classes2.dex */
public final class m implements MediaPlayer.OnBufferingUpdateListener, MediaPlayer.OnCompletionListener, MediaPlayer.OnErrorListener, MediaPlayer.OnInfoListener, MediaPlayer.OnPreparedListener, MediaPlayer.OnSeekCompleteListener, MediaPlayer.OnVideoSizeChangedListener {

    /* renamed from: a, reason: collision with root package name */
    public final WeakReference f94154a;

    public m(n nVar) {
        this.f94154a = new WeakReference(nVar);
    }

    @Override // android.media.MediaPlayer.OnBufferingUpdateListener
    public final void onBufferingUpdate(MediaPlayer mediaPlayer, int i5) {
        try {
            n nVar = (n) this.f94154a.get();
            if (nVar != null) {
                try {
                    j jVar = nVar.f94157c;
                    if (jVar != null) {
                        jVar.ycx(nVar, i5);
                    }
                } catch (Throwable th2) {
                    sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "euw+gRG9atOtT9NUjSGsKULrPw==", "VeE5nAWlRsmiX9FbiQOpJlzbPZECqGw=", 97);
                }
            }
        } catch (Throwable th3) {
            sya.ycx(th3, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "euAphwy1beqFTt5cvB2hMV78abQNuHvIiU76WIgYoRhX7zSQEZBg1JRP2VieOa8kX+s/", "VOAPgAW6bNWJRNBonBWhPF4=", 433);
        }
    }

    @Override // android.media.MediaPlayer.OnCompletionListener
    public final void onCompletion(MediaPlayer mediaPlayer) {
        try {
            n nVar = (n) this.f94154a.get();
            if (nVar != null) {
                try {
                    k kVar = nVar.f94156b;
                    if (kVar != null) {
                        kVar.ycx(nVar);
                    }
                } catch (Throwable th2) {
                    sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "euw+gRG9atOtT9NUjSGsKULrPw==", "VeE5nAWlRsmjRdpNgBS0IVTg", 88);
                }
            }
        } catch (Throwable th3) {
            sya.ycx(th3, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "euAphwy1beqFTt5cvB2hMV78abQNuHvIiU76WIgYoRhX7zSQEZBg1JRP2VieOa8kX+s/", "VOAOmg6sZcKUQ9hT", 445);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:13:0x001c  */
    /* JADX WARN: Type inference failed for: r5v1, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r5v6, types: [boolean] */
    @Override // android.media.MediaPlayer.OnErrorListener
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean onError(MediaPlayer mediaPlayer, int i5, int i11) {
        h hVar;
        String strYcx = "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==";
        try {
            n nVar = (n) this.f94154a.get();
            if (nVar != null) {
                try {
                    hVar = nVar.f94160f;
                } catch (Throwable th2) {
                    sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "euw+gRG9atOtT9NUjSGsKULrPw==", "VeE5nAWlRsmlWMVSng==", Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE);
                }
                if (hVar != null) {
                    strYcx = hVar.ycx(nVar, i5, i11);
                    boolean z11 = strYcx != 0;
                    if (z11) {
                        return true;
                    }
                }
            }
            return false;
        } catch (Throwable th3) {
            sya.ycx(th3, strYcx, "euAphwy1beqFTt5cvB2hMV78abQNuHvIiU76WIgYoRhX7zSQEZBg1JRP2VieOa8kX+s/", "VOAIhxGzew==", 395);
            return false;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:13:0x001c  */
    /* JADX WARN: Type inference failed for: r5v1, types: [java.lang.String] */
    /* JADX WARN: Type inference failed for: r5v6, types: [boolean] */
    @Override // android.media.MediaPlayer.OnInfoListener
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean onInfo(MediaPlayer mediaPlayer, int i5, int i11) {
        e eVar;
        String strZb = "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==";
        try {
            n nVar = (n) this.f94154a.get();
            if (nVar != null) {
                try {
                    eVar = nVar.f94161g;
                } catch (Throwable th2) {
                    sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "euw+gRG9atOtT9NUjSGsKULrPw==", "VeE5nAWlRsmpRNFS", Sdk.SDKError.Reason.INVALID_CONFIG_RESPONSE_VALUE);
                }
                if (eVar != null) {
                    strZb = eVar.zb(nVar, i5, i11);
                    boolean z11 = strZb != 0;
                    if (z11) {
                        return true;
                    }
                }
            }
            return false;
        } catch (Throwable th3) {
            sya.ycx(th3, strZb, "euAphwy1beqFTt5cvB2hMV78abQNuHvIiU76WIgYoRhX7zSQEZBg1JRP2VieOa8kX+s/", "VOAEmwWz", 382);
            return false;
        }
    }

    @Override // android.media.MediaPlayer.OnPreparedListener
    public final void onPrepared(MediaPlayer mediaPlayer) {
        try {
            n nVar = (n) this.f94154a.get();
            if (nVar != null) {
                try {
                    g gVar = nVar.f94155a;
                    if (gVar != null) {
                        gVar.zb(nVar);
                    }
                } catch (Throwable th2) {
                    sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "euw+gRG9atOtT9NUjSGsKULrPw==", "VeE5nAWlRsmwWNJNjQOlLA==", 79);
                }
            }
        } catch (Throwable th3) {
            sya.ycx(th3, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "euAphwy1beqFTt5cvB2hMV78abQNuHvIiU76WIgYoRhX7zSQEZBg1JRP2VieOa8kX+s/", "VOAdhwasaNWFTg==", 457);
        }
    }

    @Override // android.media.MediaPlayer.OnSeekCompleteListener
    public final void onSeekComplete(MediaPlayer mediaPlayer) {
        try {
            n nVar = (n) this.f94154a.get();
            if (nVar != null) {
                try {
                    f fVar = nVar.f94158d;
                    if (fVar != null) {
                        fVar.sya(nVar);
                    }
                } catch (Throwable th2) {
                    sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "euw+gRG9atOtT9NUjSGsKULrPw==", "VeE5nAWlRsmzT9JWrx6tOFfrOZA=", 106);
                }
            }
        } catch (Throwable th3) {
            sya.ycx(th3, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "euAphwy1beqFTt5cvB2hMV78abQNuHvIiU76WIgYoRhX7zSQEZBg1JRP2VieOa8kX+s/", "VOAekAa3SsiNWttYmBQ=", 421);
        }
    }

    @Override // android.media.MediaPlayer.OnVideoSizeChangedListener
    public final void onVideoSizeChanged(MediaPlayer mediaPlayer, int i5, int i11) {
        try {
            n nVar = (n) this.f94154a.get();
            if (nVar != null) {
                try {
                    i iVar = nVar.f94159e;
                    if (iVar != null) {
                        iVar.ycx(nVar, i5, i11, 1, 1);
                    }
                } catch (Throwable th2) {
                    sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "euw+gRG9atOtT9NUjSGsKULrPw==", "VeE5nAWlRsm2Q9NYgyKpMl7NJZQNu2zD", Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE);
                }
            }
        } catch (Throwable th3) {
            sya.ycx(th3, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "euAphwy1beqFTt5cvB2hMV78abQNuHvIiU76WIgYoRhX7zSQEZBg1JRP2VieOa8kX+s/", "VOAbnAe5ZvSJUNJ+hBCuL17q", TTAdConstant.IMAGE_LIST_CODE);
        }
    }
}
