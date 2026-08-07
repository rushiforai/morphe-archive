.class Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$d;
.super Ljava/util/TimerTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->onJoinChannelSuccess(Ljava/lang/String;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;


# direct methods
.method public constructor <init>(Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$d;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$d;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$d;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/MMRtcEngine;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$d;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/MMRtcEngine;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$d;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P5()[B

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, p0}, Lcom/momo/momortc/MMRtcEngine;->setSei([B)I

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method
