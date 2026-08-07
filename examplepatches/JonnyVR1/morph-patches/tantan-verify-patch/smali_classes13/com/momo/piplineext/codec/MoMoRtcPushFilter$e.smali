.class Lcom/momo/piplineext/codec/MoMoRtcPushFilter$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->S5()V
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
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$e;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$e;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ror;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-boolean v0, v0, Ll/ror;->h1:Z

    .line 8
    .line 9
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$e;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 10
    .line 11
    const/16 v2, 0xc9

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->d3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/q210$a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x0

    .line 20
    iget-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$e;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 21
    .line 22
    const/16 v4, 0x1101

    .line 23
    .line 24
    invoke-interface {v0, v4, v2, v1, v3}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$e;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 28
    .line 29
    invoke-virtual {p0, v4, v2}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->e2(II)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    iget-object p0, v1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->R1:Lcom/momo/momortc/IMMRtcEngineEventInterface;

    .line 34
    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ror;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget v0, v0, Ll/uow;->B0:I

    .line 42
    .line 43
    invoke-interface {p0, v0, v2}, Lcom/momo/momortc/IMMRtcEngineEventInterface;->onUserOffline(II)V

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method
