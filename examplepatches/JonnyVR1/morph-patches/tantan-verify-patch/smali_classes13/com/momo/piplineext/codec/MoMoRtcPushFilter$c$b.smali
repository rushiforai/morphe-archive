.class Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->onUserJoined(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;


# direct methods
.method public constructor <init>(Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$b;->b:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 2
    .line 3
    iput p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$b;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$b;->b:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->V2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ebl0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v2, "----onVideoChannelAdded Audio: userID="

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$b;->a:I

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const-string v2, "MoMoRtcPushFilter"

    .line 46
    .line 47
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$b;->b:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 53
    .line 54
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->V2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ebl0;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iget p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$b;->a:I

    .line 59
    .line 60
    int-to-long v2, p0

    .line 61
    const/16 v5, 0xb0

    .line 62
    .line 63
    const/16 v6, 0xb0

    .line 64
    .line 65
    const/4 v4, 0x0

    .line 66
    invoke-interface/range {v1 .. v6}, Ll/ebl0;->a(JLandroid/view/SurfaceView;II)V

    .line 67
    .line 68
    .line 69
    :cond_0
    return-void
.end method
