.class final Lcom/google/android/exoplayer2/StreamVolumeManager$VolumeChangeReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/StreamVolumeManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "VolumeChangeReceiver"
.end annotation


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/StreamVolumeManager;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/StreamVolumeManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/StreamVolumeManager$VolumeChangeReceiver;->a:Lcom/google/android/exoplayer2/StreamVolumeManager;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/StreamVolumeManager;Lcom/google/android/exoplayer2/StreamVolumeManager$a;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/StreamVolumeManager$VolumeChangeReceiver;-><init>(Lcom/google/android/exoplayer2/StreamVolumeManager;)V

    return-void
.end method

.method public static synthetic a(Lcom/google/android/exoplayer2/StreamVolumeManager;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/google/android/exoplayer2/StreamVolumeManager;->b(Lcom/google/android/exoplayer2/StreamVolumeManager;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/google/android/exoplayer2/StreamVolumeManager$VolumeChangeReceiver;->a:Lcom/google/android/exoplayer2/StreamVolumeManager;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/google/android/exoplayer2/StreamVolumeManager;->a(Lcom/google/android/exoplayer2/StreamVolumeManager;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Lcom/google/android/exoplayer2/StreamVolumeManager$VolumeChangeReceiver;->a:Lcom/google/android/exoplayer2/StreamVolumeManager;

    .line 8
    .line 9
    new-instance p2, Lcom/google/android/exoplayer2/a0;

    .line 10
    .line 11
    invoke-direct {p2, p0}, Lcom/google/android/exoplayer2/a0;-><init>(Lcom/google/android/exoplayer2/StreamVolumeManager;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method
