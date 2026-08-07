.class public final Ll/nvy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/dwy0;


# annotations
.annotation build Landroidx/annotation/RequiresApi;
    value = 0x17
.end annotation


# static fields
.field public static final g:Ljava/util/ArrayDeque;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "MESSAGE_PARAMS_INSTANCE_POOL"
    .end annotation
.end field

.field public static final h:Ljava/lang/Object;


# instance fields
.field public final a:Landroid/media/MediaCodec;

.field public final b:Landroid/os/HandlerThread;

.field public c:Landroid/os/Handler;

.field public final d:Ljava/util/concurrent/atomic/AtomicReference;

.field public final e:Ll/bjv0;

.field public f:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/ArrayDeque;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/nvy0;->g:Ljava/util/ArrayDeque;

    .line 7
    .line 8
    new-instance v0, Ljava/lang/Object;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/nvy0;->h:Ljava/lang/Object;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/media/MediaCodec;Landroid/os/HandlerThread;)V
    .locals 2

    .line 1
    new-instance v0, Ll/bjv0;

    .line 2
    .line 3
    sget-object v1, Ll/mfv0;->a:Ll/mfv0;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/bjv0;-><init>(Ll/mfv0;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/nvy0;->a:Landroid/media/MediaCodec;

    .line 12
    .line 13
    iput-object p2, p0, Ll/nvy0;->b:Landroid/os/HandlerThread;

    .line 14
    .line 15
    iput-object v0, p0, Ll/nvy0;->e:Ll/bjv0;

    .line 16
    .line 17
    new-instance p1, Ljava/util/concurrent/atomic/AtomicReference;

    .line 18
    .line 19
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Ll/nvy0;->d:Ljava/util/concurrent/atomic/AtomicReference;

    .line 23
    .line 24
    return-void
.end method

.method public static bridge synthetic d(Ll/nvy0;Landroid/os/Message;)V
    .locals 10

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_3

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    if-eq v0, v2, :cond_2

    .line 8
    .line 9
    const/4 v2, 0x2

    .line 10
    if-eq v0, v2, :cond_1

    .line 11
    .line 12
    const/4 v2, 0x3

    .line 13
    if-eq v0, v2, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/nvy0;->d:Ljava/util/concurrent/atomic/AtomicReference;

    .line 16
    .line 17
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 18
    .line 19
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p0, v1, p1}, Ll/kvy0;->a(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_0
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast p1, Landroid/os/Bundle;

    .line 33
    .line 34
    :try_start_0
    iget-object v0, p0, Ll/nvy0;->a:Landroid/media/MediaCodec;

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Landroid/media/MediaCodec;->setParameters(Landroid/os/Bundle;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :catch_0
    move-exception v0

    .line 41
    move-object p1, v0

    .line 42
    iget-object p0, p0, Ll/nvy0;->d:Ljava/util/concurrent/atomic/AtomicReference;

    .line 43
    .line 44
    invoke-static {p0, v1, p1}, Ll/kvy0;->a(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    iget-object p0, p0, Ll/nvy0;->e:Ll/bjv0;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/bjv0;->e()Z

    .line 51
    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_2
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 55
    .line 56
    check-cast p1, Ll/mvy0;

    .line 57
    .line 58
    iget v3, p1, Ll/mvy0;->a:I

    .line 59
    .line 60
    iget-object v5, p1, Ll/mvy0;->d:Landroid/media/MediaCodec$CryptoInfo;

    .line 61
    .line 62
    iget-wide v6, p1, Ll/mvy0;->e:J

    .line 63
    .line 64
    iget v8, p1, Ll/mvy0;->f:I

    .line 65
    .line 66
    :try_start_1
    sget-object v9, Ll/nvy0;->h:Ljava/lang/Object;

    .line 67
    .line 68
    monitor-enter v9
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    .line 69
    :try_start_2
    iget-object v2, p0, Ll/nvy0;->a:Landroid/media/MediaCodec;

    .line 70
    .line 71
    const/4 v4, 0x0

    .line 72
    invoke-virtual/range {v2 .. v8}, Landroid/media/MediaCodec;->queueSecureInputBuffer(IILandroid/media/MediaCodec$CryptoInfo;JI)V

    .line 73
    .line 74
    .line 75
    monitor-exit v9

    .line 76
    goto :goto_0

    .line 77
    :catchall_0
    move-exception v0

    .line 78
    monitor-exit v9
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 79
    :try_start_3
    throw v0
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_1

    .line 80
    :catch_1
    move-exception v0

    .line 81
    iget-object p0, p0, Ll/nvy0;->d:Ljava/util/concurrent/atomic/AtomicReference;

    .line 82
    .line 83
    invoke-static {p0, v1, v0}, Ll/kvy0;->a(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    :goto_0
    move-object v1, p1

    .line 87
    goto :goto_1

    .line 88
    :cond_3
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 89
    .line 90
    check-cast p1, Ll/mvy0;

    .line 91
    .line 92
    iget v3, p1, Ll/mvy0;->a:I

    .line 93
    .line 94
    iget v5, p1, Ll/mvy0;->c:I

    .line 95
    .line 96
    iget-wide v6, p1, Ll/mvy0;->e:J

    .line 97
    .line 98
    iget v8, p1, Ll/mvy0;->f:I

    .line 99
    .line 100
    :try_start_4
    iget-object v2, p0, Ll/nvy0;->a:Landroid/media/MediaCodec;

    .line 101
    .line 102
    const/4 v4, 0x0

    .line 103
    invoke-virtual/range {v2 .. v8}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_2

    .line 104
    .line 105
    .line 106
    goto :goto_0

    .line 107
    :catch_2
    move-exception v0

    .line 108
    iget-object p0, p0, Ll/nvy0;->d:Ljava/util/concurrent/atomic/AtomicReference;

    .line 109
    .line 110
    invoke-static {p0, v1, v0}, Ll/kvy0;->a(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :goto_1
    if-eqz v1, :cond_4

    .line 115
    .line 116
    sget-object p0, Ll/nvy0;->g:Ljava/util/ArrayDeque;

    .line 117
    .line 118
    monitor-enter p0

    .line 119
    :try_start_5
    invoke-virtual {p0, v1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    monitor-exit p0

    .line 123
    goto :goto_2

    .line 124
    :catchall_1
    move-exception v0

    .line 125
    move-object p1, v0

    .line 126
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 127
    throw p1

    .line 128
    :cond_4
    :goto_2
    return-void
.end method

.method public static e()Ll/mvy0;
    .locals 2

    .line 1
    sget-object v0, Ll/nvy0;->g:Ljava/util/ArrayDeque;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    new-instance v1, Ll/mvy0;

    .line 11
    .line 12
    invoke-direct {v1}, Ll/mvy0;-><init>()V

    .line 13
    .line 14
    .line 15
    monitor-exit v0

    .line 16
    return-object v1

    .line 17
    :catchall_0
    move-exception v1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->removeFirst()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Ll/mvy0;

    .line 24
    .line 25
    monitor-exit v0

    .line 26
    return-object v1

    .line 27
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    throw v1
.end method

.method public static f([B[B)[B
    .locals 2
    .param p0    # [B
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p1    # [B
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-object p1

    .line 4
    :cond_0
    if-eqz p1, :cond_2

    .line 5
    .line 6
    array-length v0, p0

    .line 7
    array-length v1, p1

    .line 8
    if-ge v1, v0, :cond_1

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_1
    const/4 v1, 0x0

    .line 12
    invoke-static {p0, v1, p1, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 13
    .line 14
    .line 15
    return-object p1

    .line 16
    :cond_2
    :goto_0
    array-length p1, p0

    .line 17
    invoke-static {p0, p1}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static g([I[I)[I
    .locals 2
    .param p0    # [I
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p1    # [I
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-object p1

    .line 4
    :cond_0
    if-eqz p1, :cond_2

    .line 5
    .line 6
    array-length v0, p0

    .line 7
    array-length v1, p1

    .line 8
    if-ge v1, v0, :cond_1

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_1
    const/4 v1, 0x0

    .line 12
    invoke-static {p0, v1, p1, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 13
    .line 14
    .line 15
    return-object p1

    .line 16
    :cond_2
    :goto_0
    array-length p1, p0

    .line 17
    invoke-static {p0, p1}, Ljava/util/Arrays;->copyOf([II)[I

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method


# virtual methods
.method public final a(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/nvy0;->zzc()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/nvy0;->c:Landroid/os/Handler;

    .line 5
    .line 6
    sget v0, Ll/mpw0;->a:I

    .line 7
    .line 8
    const/4 v0, 0x3

    .line 9
    invoke-virtual {p0, v0, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final b(IILl/tux0;JI)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/nvy0;->zzc()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/nvy0;->e()Ll/mvy0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const/4 v3, 0x0

    .line 9
    const/4 v6, 0x0

    .line 10
    const/4 v2, 0x0

    .line 11
    move v1, p1

    .line 12
    move-wide v4, p4

    .line 13
    invoke-virtual/range {v0 .. v6}, Ll/mvy0;->a(IIIJI)V

    .line 14
    .line 15
    .line 16
    iget-object p1, v0, Ll/mvy0;->d:Landroid/media/MediaCodec$CryptoInfo;

    .line 17
    .line 18
    iget p2, p3, Ll/tux0;->f:I

    .line 19
    .line 20
    iput p2, p1, Landroid/media/MediaCodec$CryptoInfo;->numSubSamples:I

    .line 21
    .line 22
    iget-object p2, p3, Ll/tux0;->d:[I

    .line 23
    .line 24
    iget-object p4, p1, Landroid/media/MediaCodec$CryptoInfo;->numBytesOfClearData:[I

    .line 25
    .line 26
    invoke-static {p2, p4}, Ll/nvy0;->g([I[I)[I

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    iput-object p2, p1, Landroid/media/MediaCodec$CryptoInfo;->numBytesOfClearData:[I

    .line 31
    .line 32
    iget-object p2, p3, Ll/tux0;->e:[I

    .line 33
    .line 34
    iget-object p4, p1, Landroid/media/MediaCodec$CryptoInfo;->numBytesOfEncryptedData:[I

    .line 35
    .line 36
    invoke-static {p2, p4}, Ll/nvy0;->g([I[I)[I

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    iput-object p2, p1, Landroid/media/MediaCodec$CryptoInfo;->numBytesOfEncryptedData:[I

    .line 41
    .line 42
    iget-object p2, p3, Ll/tux0;->b:[B

    .line 43
    .line 44
    iget-object p4, p1, Landroid/media/MediaCodec$CryptoInfo;->key:[B

    .line 45
    .line 46
    invoke-static {p2, p4}, Ll/nvy0;->f([B[B)[B

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 51
    .line 52
    .line 53
    iput-object p2, p1, Landroid/media/MediaCodec$CryptoInfo;->key:[B

    .line 54
    .line 55
    iget-object p2, p3, Ll/tux0;->a:[B

    .line 56
    .line 57
    iget-object p4, p1, Landroid/media/MediaCodec$CryptoInfo;->iv:[B

    .line 58
    .line 59
    invoke-static {p2, p4}, Ll/nvy0;->f([B[B)[B

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 64
    .line 65
    .line 66
    iput-object p2, p1, Landroid/media/MediaCodec$CryptoInfo;->iv:[B

    .line 67
    .line 68
    iget p2, p3, Ll/tux0;->c:I

    .line 69
    .line 70
    iput p2, p1, Landroid/media/MediaCodec$CryptoInfo;->mode:I

    .line 71
    .line 72
    sget p2, Ll/mpw0;->a:I

    .line 73
    .line 74
    const/16 p4, 0x18

    .line 75
    .line 76
    if-lt p2, p4, :cond_0

    .line 77
    .line 78
    new-instance p2, Landroid/media/MediaCodec$CryptoInfo$Pattern;

    .line 79
    .line 80
    iget p4, p3, Ll/tux0;->g:I

    .line 81
    .line 82
    iget p3, p3, Ll/tux0;->h:I

    .line 83
    .line 84
    invoke-direct {p2, p4, p3}, Landroid/media/MediaCodec$CryptoInfo$Pattern;-><init>(II)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1, p2}, Landroid/media/MediaCodec$CryptoInfo;->setPattern(Landroid/media/MediaCodec$CryptoInfo$Pattern;)V

    .line 88
    .line 89
    .line 90
    :cond_0
    iget-object p0, p0, Ll/nvy0;->c:Landroid/os/Handler;

    .line 91
    .line 92
    const/4 p1, 0x1

    .line 93
    invoke-virtual {p0, p1, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public final c(IIIJI)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/nvy0;->zzc()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/nvy0;->e()Ll/mvy0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const/4 v2, 0x0

    .line 9
    move v1, p1

    .line 10
    move v3, p3

    .line 11
    move-wide v4, p4

    .line 12
    move v6, p6

    .line 13
    invoke-virtual/range {v0 .. v6}, Ll/mvy0;->a(IIIJI)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/nvy0;->c:Landroid/os/Handler;

    .line 17
    .line 18
    sget p1, Ll/mpw0;->a:I

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-virtual {p0, p1, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final zzb()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/nvy0;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    :try_start_0
    iget-object v0, p0, Ll/nvy0;->c:Landroid/os/Handler;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/nvy0;->e:Ll/bjv0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/bjv0;->c()Z

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/nvy0;->c:Landroid/os/Handler;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    const/4 v1, 0x2

    .line 23
    invoke-virtual {v0, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/nvy0;->e:Ll/bjv0;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/bjv0;->a()V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    throw v1

    .line 37
    :cond_1
    throw v1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    :catch_0
    move-exception p0

    .line 39
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 44
    .line 45
    .line 46
    invoke-static {p0}, Ll/xpg0;->a(Ljava/lang/Throwable;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    return-void
.end method

.method public final zzc()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/nvy0;->d:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Ljava/lang/RuntimeException;

    .line 9
    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    throw p0
.end method

.method public final zzg()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/nvy0;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/nvy0;->zzb()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/nvy0;->b:Landroid/os/HandlerThread;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 11
    .line 12
    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Ll/nvy0;->f:Z

    .line 15
    .line 16
    return-void
.end method

.method public final zzh()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/nvy0;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/nvy0;->b:Landroid/os/HandlerThread;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/nvy0;->b:Landroid/os/HandlerThread;

    .line 11
    .line 12
    new-instance v1, Ll/lvy0;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-direct {v1, p0, v0}, Ll/lvy0;-><init>(Ll/nvy0;Landroid/os/Looper;)V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Ll/nvy0;->c:Landroid/os/Handler;

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Ll/nvy0;->f:Z

    .line 25
    .line 26
    :cond_0
    return-void
.end method
