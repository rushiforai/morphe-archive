.class final Lcom/google/android/gms/internal/ads/zzfpq;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "android.media.action.HDMI_AUDIO_PLUG"

    .line 6
    .line 7
    if-ne p0, p1, :cond_1

    .line 8
    .line 9
    const-string p0, "android.media.extra.AUDIO_PLUG_STATE"

    .line 10
    .line 11
    const/4 p1, -0x1

    .line 12
    invoke-virtual {p2, p0, p1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    const/4 p1, 0x1

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    invoke-static {p1}, Lcom/google/android/gms/internal/ads/u1;->c(I)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    if-ne p0, p1, :cond_1

    .line 24
    .line 25
    const/4 p0, 0x2

    .line 26
    invoke-static {p0}, Lcom/google/android/gms/internal/ads/u1;->c(I)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method
