.class Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/gkl0$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/momo/rtcbase/SurfaceViewRenderer;

.field final synthetic b:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;


# direct methods
.method public constructor <init>(Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;Lcom/momo/rtcbase/SurfaceViewRenderer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a$b;->b:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a$b;->a:Lcom/momo/rtcbase/SurfaceViewRenderer;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/SurfaceTexture;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a$b;->b:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;

    .line 2
    .line 3
    iget v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->b:I

    .line 4
    .line 5
    iget v0, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->c:I

    .line 6
    .line 7
    invoke-virtual {p1, v1, v0}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a$b;->a:Lcom/momo/rtcbase/SurfaceViewRenderer;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lcom/momo/rtcbase/SurfaceViewRenderer;->surfaceTextureCreated(Landroid/graphics/SurfaceTexture;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a$b;->b:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->d:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 20
    .line 21
    invoke-static {p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/MMRtcEngine;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    new-instance v0, Lcom/momo/rtcbase/VideoCanvas;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a$b;->a:Lcom/momo/rtcbase/SurfaceViewRenderer;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a$b;->b:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;

    .line 30
    .line 31
    iget p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$a;->a:I

    .line 32
    .line 33
    const/4 v2, 0x1

    .line 34
    invoke-direct {v0, v1, v2, p0}, Lcom/momo/rtcbase/VideoCanvas;-><init>(Landroid/view/SurfaceView;II)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v0}, Lcom/momo/momortc/MMRtcEngine;->setupRemoteVideo(Lcom/momo/rtcbase/VideoCanvas;)I

    .line 38
    .line 39
    .line 40
    return-void
.end method
