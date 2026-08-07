.class public final Ll/fvy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zvy0;


# instance fields
.field public final b:Ll/fpw0;

.field public final c:Ll/fpw0;

.field public d:Z


# direct methods
.method public constructor <init>(I)V
    .locals 2

    .line 1
    new-instance v0, Ll/cvy0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/cvy0;-><init>(I)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/dvy0;

    .line 7
    .line 8
    invoke-direct {v1, p1}, Ll/dvy0;-><init>(I)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/fvy0;->b:Ll/fpw0;

    .line 15
    .line 16
    iput-object v1, p0, Ll/fvy0;->c:Ll/fpw0;

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    iput-boolean p1, p0, Ll/fvy0;->d:Z

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic a(I)Landroid/os/HandlerThread;
    .locals 1

    .line 1
    new-instance v0, Landroid/os/HandlerThread;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ivy0;->g(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public static synthetic b(I)Landroid/os/HandlerThread;
    .locals 1

    .line 1
    new-instance v0, Landroid/os/HandlerThread;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ivy0;->i(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method


# virtual methods
.method public final c(Ll/xvy0;)Ll/ivy0;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string v0, "createCodec:"

    .line 2
    .line 3
    iget-object v1, p1, Ll/xvy0;->a:Ll/hwy0;

    .line 4
    .line 5
    iget-object v1, v1, Ll/hwy0;->a:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v3, Ll/mpw0;->a:I

    .line 21
    .line 22
    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Landroid/media/MediaCodec;->createByCodecName(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 26
    .line 27
    .line 28
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 29
    :try_start_1
    iget-boolean v1, p0, Ll/fvy0;->d:Z

    .line 30
    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    iget-object v1, p1, Ll/xvy0;->c:Ll/sqr0;

    .line 34
    .line 35
    sget v3, Ll/mpw0;->a:I

    .line 36
    .line 37
    const/16 v4, 0x22

    .line 38
    .line 39
    if-ge v3, v4, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iget-object v1, v1, Ll/sqr0;->l:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {v1}, Ll/a8t0;->h(Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_1

    .line 49
    .line 50
    new-instance v1, Ll/rxy0;

    .line 51
    .line 52
    invoke-direct {v1, v0}, Ll/rxy0;-><init>(Landroid/media/MediaCodec;)V

    .line 53
    .line 54
    .line 55
    const/4 v3, 0x4

    .line 56
    goto :goto_1

    .line 57
    :catch_0
    move-exception p0

    .line 58
    goto :goto_2

    .line 59
    :cond_1
    :goto_0
    new-instance v1, Ll/nvy0;

    .line 60
    .line 61
    iget-object v3, p0, Ll/fvy0;->c:Ll/fpw0;

    .line 62
    .line 63
    check-cast v3, Ll/dvy0;

    .line 64
    .line 65
    iget v3, v3, Ll/dvy0;->a:I

    .line 66
    .line 67
    invoke-static {v3}, Ll/fvy0;->b(I)Landroid/os/HandlerThread;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-direct {v1, v0, v3}, Ll/nvy0;-><init>(Landroid/media/MediaCodec;Landroid/os/HandlerThread;)V

    .line 72
    .line 73
    .line 74
    const/4 v3, 0x0

    .line 75
    :goto_1
    new-instance v4, Ll/ivy0;

    .line 76
    .line 77
    iget-object p0, p0, Ll/fvy0;->b:Ll/fpw0;

    .line 78
    .line 79
    check-cast p0, Ll/cvy0;

    .line 80
    .line 81
    iget p0, p0, Ll/cvy0;->a:I

    .line 82
    .line 83
    invoke-static {p0}, Ll/fvy0;->a(I)Landroid/os/HandlerThread;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-direct {v4, v0, p0, v1, v2}, Ll/ivy0;-><init>(Landroid/media/MediaCodec;Landroid/os/HandlerThread;Ll/dwy0;Ll/hvy0;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 88
    .line 89
    .line 90
    :try_start_2
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 91
    .line 92
    .line 93
    iget-object p0, p1, Ll/xvy0;->b:Landroid/media/MediaFormat;

    .line 94
    .line 95
    iget-object p1, p1, Ll/xvy0;->d:Landroid/view/Surface;

    .line 96
    .line 97
    invoke-static {v4, p0, p1, v2, v3}, Ll/ivy0;->j(Ll/ivy0;Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 98
    .line 99
    .line 100
    return-object v4

    .line 101
    :catch_1
    move-exception p0

    .line 102
    move-object v2, v4

    .line 103
    goto :goto_2

    .line 104
    :catch_2
    move-exception p0

    .line 105
    move-object v0, v2

    .line 106
    :goto_2
    if-nez v2, :cond_2

    .line 107
    .line 108
    if-eqz v0, :cond_3

    .line 109
    .line 110
    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    .line 111
    .line 112
    .line 113
    goto :goto_3

    .line 114
    :cond_2
    invoke-virtual {v2}, Ll/ivy0;->zzl()V

    .line 115
    .line 116
    .line 117
    :cond_3
    :goto_3
    throw p0
.end method

.method public final d(Z)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Ll/fvy0;->d:Z

    .line 3
    .line 4
    return-void
.end method
