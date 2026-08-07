.class Ltv/danmaku/ijk/media/source/AidSource$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/source/AidSource;->R1(Ltv/danmaku/ijk/media/player/IMediaPlayer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ltv/danmaku/ijk/media/source/AidSource;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/source/AidSource;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$2;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 7

    .line 1
    const-string v0, "----FirstFrameDrawCallback"

    .line 2
    .line 3
    const-string v1, "aidStream"

    .line 4
    .line 5
    invoke-static {v1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/AidSource$2;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 9
    .line 10
    invoke-static {v0}, Ltv/danmaku/ijk/media/source/AidSource;->i2(Ltv/danmaku/ijk/media/source/AidSource;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/AidSource$2;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 17
    .line 18
    invoke-static {v0}, Ltv/danmaku/ijk/media/source/AidSource;->j2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v2, 0x2

    .line 23
    const/16 v3, 0x9

    .line 24
    .line 25
    if-eq v0, v2, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/AidSource$2;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 28
    .line 29
    invoke-static {v0}, Ltv/danmaku/ijk/media/source/AidSource;->j2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    const/4 v2, 0x3

    .line 34
    if-eq v0, v2, :cond_0

    .line 35
    .line 36
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/AidSource$2;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 37
    .line 38
    invoke-static {v0}, Ltv/danmaku/ijk/media/source/AidSource;->j2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-ne v0, v3, :cond_1

    .line 43
    .line 44
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/AidSource$2;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 45
    .line 46
    invoke-static {v0}, Ltv/danmaku/ijk/media/source/AidSource;->i2(Ltv/danmaku/ijk/media/source/AidSource;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const/4 v2, 0x0

    .line 51
    const/4 v4, 0x0

    .line 52
    const/16 v5, 0xc8

    .line 53
    .line 54
    const/16 v6, 0xd0

    .line 55
    .line 56
    invoke-static {v0, v5, v6, v2, v4}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->postEventFromStreamPro(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;IIILjava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    new-instance v0, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    const-string v2, "----first frame draw finish callback: msg:208;"

    .line 62
    .line 63
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/AidSource$2;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 67
    .line 68
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/AidSource;->j2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/AidSource$2;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 83
    .line 84
    invoke-static {v0}, Ltv/danmaku/ijk/media/source/AidSource;->j2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-ne v0, v3, :cond_1

    .line 89
    .line 90
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/AidSource$2;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 91
    .line 92
    invoke-static {v0}, Ltv/danmaku/ijk/media/source/AidSource;->k2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/AidSource$2;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 97
    .line 98
    invoke-static {p0}, Ltv/danmaku/ijk/media/source/AidSource;->m2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    const/16 v2, 0x160

    .line 103
    .line 104
    const/16 v3, 0x280

    .line 105
    .line 106
    invoke-static {v0, v2, v3, v1, p0}, Ltv/danmaku/ijk/media/source/AidSource;->U1(Ltv/danmaku/ijk/media/source/AidSource;IIII)V

    .line 107
    .line 108
    .line 109
    :cond_1
    return-void
.end method
