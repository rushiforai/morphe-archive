.class Lcom/momo/piplineext/codec/MoMoRtcPushFilter$6;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/piplineext/codec/MoMoRtcPushFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;


# direct methods
.method public constructor <init>(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$6;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    .line 1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "android.intent.action.HEADSET_PLUG"

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    const-string p1, "state"

    .line 14
    .line 15
    invoke-virtual {p2, p1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    const/4 v2, 0x1

    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$6;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 30
    .line 31
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/MMRtcEngine;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Ll/csx;->D()Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-ne v2, p1, :cond_1

    .line 46
    .line 47
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$6;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 48
    .line 49
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/MMRtcEngine;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    const-string p1, "{\"che.audio.enable.ns\":true}"

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Lcom/momo/momortc/MMRtcEngine;->setParameters(Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-ne p1, v2, :cond_1

    .line 64
    .line 65
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$6;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 66
    .line 67
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/MMRtcEngine;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    if-eqz p1, :cond_1

    .line 72
    .line 73
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p1}, Ll/csx;->D()Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-ne v2, p1, :cond_1

    .line 82
    .line 83
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$6;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 84
    .line 85
    invoke-static {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/MMRtcEngine;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    const-string p1, "{\"che.audio.enable.ns\":false}"

    .line 90
    .line 91
    invoke-virtual {p0, p1}, Lcom/momo/momortc/MMRtcEngine;->setParameters(Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    :cond_1
    return-void
.end method
