.class Lcom/momo/piplineext/codec/MoMoRtcPushFilter$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->release()V
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
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$d;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

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
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$d;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->M2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/rtcbase/EglBase;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$d;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->M2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/rtcbase/EglBase;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/momo/rtcbase/EglBase;->release()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$d;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-static {p0, v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->N2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Lcom/momo/rtcbase/EglBase;)Lcom/momo/rtcbase/EglBase;

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method
