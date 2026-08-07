.class Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$BlueConnectStateBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "BlueConnectStateBroadcastReceiver"
.end annotation


# instance fields
.field final synthetic a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;


# direct methods
.method private constructor <init>(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$BlueConnectStateBroadcastReceiver;->a:Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$a;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$BlueConnectStateBroadcastReceiver;-><init>(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;)V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2
    .line 3
    .line 4
    :catchall_0
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 1
    const-string p0, "android.bluetooth.adapter.extra.CONNECTION_STATE"

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p2, p0, p1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const-string p1, "HeadsetPlugReceiver"

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    const/4 p2, 0x2

    .line 13
    if-eq p0, p2, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string p2, "STATE_CONNECTED"

    .line 21
    .line 22
    invoke-virtual {p0, p1, p2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string p2, "STATE_DISCONNECTED"

    .line 31
    .line 32
    invoke-virtual {p0, p1, p2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
