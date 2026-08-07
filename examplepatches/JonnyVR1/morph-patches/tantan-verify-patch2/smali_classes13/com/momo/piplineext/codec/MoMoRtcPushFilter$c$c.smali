.class Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->onError(I)V
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
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$c;->b:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 2
    .line 3
    iput p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$c;->a:I

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
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$c;->b:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 4
    .line 5
    sget-object v1, Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;->WAIT:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 6
    .line 7
    invoke-static {v0, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->h4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;)Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$c;->b:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ror;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-boolean v0, v0, Ll/ror;->h1:Z

    .line 19
    .line 20
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$c;->b:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, v1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->d3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/q210$a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$c;->a:I

    .line 32
    .line 33
    iget-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$c;->b:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 34
    .line 35
    iget-object v3, v3, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 36
    .line 37
    const/16 v4, 0x1101

    .line 38
    .line 39
    invoke-interface {v0, v4, v1, v2, v3}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    iget-object v0, v1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 44
    .line 45
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->d3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/q210$a;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$c;->b:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 54
    .line 55
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->d3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/q210$a;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$c;->a:I

    .line 60
    .line 61
    iget-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$c;->b:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 62
    .line 63
    iget-object v3, v3, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 64
    .line 65
    const/16 v4, 0x1100

    .line 66
    .line 67
    invoke-interface {v0, v4, v1, v2, v3}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$c;->b:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 71
    .line 72
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 73
    .line 74
    invoke-static {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ror;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    iget v1, v1, Ll/uow;->B0:I

    .line 79
    .line 80
    const/4 v2, 0x1

    .line 81
    invoke-virtual {v0, v1, v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->onUserOffline(II)V

    .line 82
    .line 83
    .line 84
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$c;->b:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 85
    .line 86
    iget-object v0, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 87
    .line 88
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    if-eqz v0, :cond_2

    .line 93
    .line 94
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$c;->b:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 95
    .line 96
    iget-object v0, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;->a:Lcom/momo/piplineext/codec/MoMoRtcPushFilter;

    .line 97
    .line 98
    invoke-static {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    iget p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c$c;->a:I

    .line 103
    .line 104
    invoke-interface {v0, p0}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onError(I)V

    .line 105
    .line 106
    .line 107
    :cond_2
    return-void
.end method
