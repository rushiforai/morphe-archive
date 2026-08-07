.class Ll/tc0$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/tc0;->B6(Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/tc0;


# direct methods
.method public constructor <init>(Ll/tc0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tc0$f;->a:Ll/tc0;

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
    iget-object v0, p0, Ll/tc0$f;->a:Ll/tc0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tc0;->g4(Ll/tc0;)Ll/q210$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/16 v1, 0xa

    .line 8
    .line 9
    const/16 v2, 0x1101

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/tc0$f;->a:Ll/tc0;

    .line 14
    .line 15
    invoke-static {v0}, Ll/tc0;->g4(Ll/tc0;)Ll/q210$a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v3, 0x0

    .line 20
    iget-object v4, p0, Ll/tc0$f;->a:Ll/tc0;

    .line 21
    .line 22
    invoke-interface {v0, v2, v1, v3, v4}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Ll/tc0$f;->a:Ll/tc0;

    .line 26
    .line 27
    invoke-static {v0}, Ll/tc0;->O3(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Ll/tc0$f;->a:Ll/tc0;

    .line 34
    .line 35
    invoke-static {v0}, Ll/tc0;->O3(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-interface {v0}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onConnectionLost()V

    .line 40
    .line 41
    .line 42
    :cond_1
    iget-object v0, p0, Ll/tc0$f;->a:Ll/tc0;

    .line 43
    .line 44
    invoke-static {v0}, Ll/tc0;->f3(Ll/tc0;)Ll/wvx;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const-wide/16 v3, 0x32c

    .line 49
    .line 50
    iput-wide v3, v0, Ll/wvx;->y0:J

    .line 51
    .line 52
    iget-object v0, p0, Ll/tc0$f;->a:Ll/tc0;

    .line 53
    .line 54
    invoke-static {v0}, Ll/tc0;->g3(Ll/tc0;)Ll/wvx;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const/16 v3, 0x32c

    .line 59
    .line 60
    iput v3, v0, Ll/wvx;->k0:I

    .line 61
    .line 62
    iget-object v0, p0, Ll/tc0$f;->a:Ll/tc0;

    .line 63
    .line 64
    const/4 v3, 0x1

    .line 65
    invoke-static {v0, v3}, Ll/tc0;->T2(Ll/tc0;I)I

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/tc0$f;->a:Ll/tc0;

    .line 69
    .line 70
    invoke-virtual {v0, v2, v1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->e2(II)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/tc0$f;->a:Ll/tc0;

    .line 74
    .line 75
    invoke-static {v0}, Ll/tc0;->h3(Ll/tc0;)Ll/evx;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    if-eqz v0, :cond_2

    .line 80
    .line 81
    iget-object v0, p0, Ll/tc0$f;->a:Ll/tc0;

    .line 82
    .line 83
    invoke-static {v0}, Ll/tc0;->i3(Ll/tc0;)Ll/evx;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    const-string v1, "configConnectLost"

    .line 88
    .line 89
    const-string v2, "errorcode 812"

    .line 90
    .line 91
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    :cond_2
    iget-object p0, p0, Ll/tc0$f;->a:Ll/tc0;

    .line 99
    .line 100
    invoke-virtual {p0}, Ll/tc0;->f()V

    .line 101
    .line 102
    .line 103
    return-void
.end method
