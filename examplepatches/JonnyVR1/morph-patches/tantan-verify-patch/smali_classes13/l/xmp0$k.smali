.class Ll/xmp0$k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/xmp0;->Z5()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/xmp0;


# direct methods
.method public constructor <init>(Ll/xmp0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xmp0$k;->a:Ll/xmp0;

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
    iget-object v0, p0, Ll/xmp0$k;->a:Ll/xmp0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/xmp0;->A3(Ll/xmp0;)Ll/evx;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "configConnectLost"

    .line 8
    .line 9
    const-string v2, "errorcode 10"

    .line 10
    .line 11
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/xmp0$k;->a:Ll/xmp0;

    .line 19
    .line 20
    invoke-static {v0}, Ll/xmp0;->R2(Ll/xmp0;)Ll/q210$a;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/16 v1, 0xa

    .line 25
    .line 26
    const/16 v2, 0x1101

    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-object v0, p0, Ll/xmp0$k;->a:Ll/xmp0;

    .line 31
    .line 32
    invoke-static {v0}, Ll/xmp0;->R2(Ll/xmp0;)Ll/q210$a;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const/4 v3, 0x0

    .line 37
    iget-object v4, p0, Ll/xmp0$k;->a:Ll/xmp0;

    .line 38
    .line 39
    invoke-interface {v0, v2, v1, v3, v4}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    iget-object v0, p0, Ll/xmp0$k;->a:Ll/xmp0;

    .line 43
    .line 44
    invoke-static {v0}, Ll/xmp0;->c3(Ll/xmp0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    iget-object v0, p0, Ll/xmp0$k;->a:Ll/xmp0;

    .line 51
    .line 52
    invoke-static {v0}, Ll/xmp0;->c3(Ll/xmp0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-interface {v0}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onConnectionLost()V

    .line 57
    .line 58
    .line 59
    :cond_1
    iget-object v0, p0, Ll/xmp0$k;->a:Ll/xmp0;

    .line 60
    .line 61
    const/4 v3, 0x1

    .line 62
    invoke-static {v0, v3}, Ll/xmp0;->n4(Ll/xmp0;I)I

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/xmp0$k;->a:Ll/xmp0;

    .line 66
    .line 67
    invoke-static {v0}, Ll/xmp0;->o4(Ll/xmp0;)Ll/anw;

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/xmp0$k;->a:Ll/xmp0;

    .line 71
    .line 72
    invoke-static {v0}, Ll/xmp0;->B3(Ll/xmp0;)Ll/wvx;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    const-wide/16 v3, 0x32c

    .line 77
    .line 78
    iput-wide v3, v0, Ll/wvx;->y0:J

    .line 79
    .line 80
    iget-object v0, p0, Ll/xmp0$k;->a:Ll/xmp0;

    .line 81
    .line 82
    invoke-static {v0}, Ll/xmp0;->C3(Ll/xmp0;)Ll/wvx;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    const/16 v3, 0x32c

    .line 87
    .line 88
    iput v3, v0, Ll/wvx;->k0:I

    .line 89
    .line 90
    iget-object v0, p0, Ll/xmp0$k;->a:Ll/xmp0;

    .line 91
    .line 92
    invoke-virtual {v0, v2, v1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->e2(II)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Ll/xmp0$k;->a:Ll/xmp0;

    .line 96
    .line 97
    invoke-static {v0}, Ll/xmp0;->D3(Ll/xmp0;)Ll/evx;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    if-eqz v0, :cond_2

    .line 102
    .line 103
    iget-object v0, p0, Ll/xmp0$k;->a:Ll/xmp0;

    .line 104
    .line 105
    invoke-static {v0}, Ll/xmp0;->E3(Ll/xmp0;)Ll/evx;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    const-string v1, "onConnectionLost"

    .line 110
    .line 111
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 116
    .line 117
    .line 118
    :cond_2
    iget-object p0, p0, Ll/xmp0$k;->a:Ll/xmp0;

    .line 119
    .line 120
    invoke-virtual {p0}, Ll/xmp0;->f()V

    .line 121
    .line 122
    .line 123
    return-void
.end method
