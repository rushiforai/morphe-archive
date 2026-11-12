.class public final Lcom/opera/android/media/OperaMediaNotificationControllerDelegate$PlaybackListenerService;
.super Lymf;
.source "SourceFile"


# static fields
.field public static final synthetic c:I


# instance fields
.field public final b:Lanf;


# direct methods
.method public constructor <init>()V
    .registers 3

    const v0, 0x7f0a060f

    invoke-direct {p0, v0}, Lymf;-><init>(I)V

    new-instance v0, Lanf;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lanf;-><init>(B)V

    iput-object v0, p0, Lcom/opera/android/media/OperaMediaNotificationControllerDelegate$PlaybackListenerService;->b:Lanf;

    return-void
.end method


# virtual methods
.method public final onCreate()V
    .registers 3

    invoke-super {p0}, Lymf;->onCreate()V

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.media.AUDIO_BECOMING_NOISY"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/opera/android/media/OperaMediaNotificationControllerDelegate$PlaybackListenerService;->b:Lanf;

    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method public final onDestroy()V
    .registers 2

    iget-object v0, p0, Lcom/opera/android/media/OperaMediaNotificationControllerDelegate$PlaybackListenerService;->b:Lanf;

    invoke-virtual {p0, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    invoke-super {p0}, Lymf;->onDestroy()V

    return-void
.end method
