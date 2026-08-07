.class public Ll/qc1;
.super Ll/jc00;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/qc1$b;
    }
.end annotation


# instance fields
.field private final l:Ljava/lang/String;

.field private m:Landroid/media/AudioRecord;

.field private n:I

.field private o:Z

.field private p:Ljava/lang/Thread;

.field private q:Ljava/lang/Object;

.field private r:Ll/q210$a;

.field private s:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(III)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p3, p1, p2, v0}, Ll/jc00;-><init>(IIIZ)V

    .line 3
    .line 4
    .line 5
    const-string p1, "AudioRecorderWrapper"

    .line 6
    .line 7
    iput-object p1, p0, Ll/qc1;->l:Ljava/lang/String;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput-object p1, p0, Ll/qc1;->m:Landroid/media/AudioRecord;

    .line 11
    .line 12
    iput v0, p0, Ll/qc1;->n:I

    .line 13
    .line 14
    iput-boolean v0, p0, Ll/qc1;->o:Z

    .line 15
    .line 16
    iput-object p1, p0, Ll/qc1;->p:Ljava/lang/Thread;

    .line 17
    .line 18
    new-instance p1, Ljava/lang/Object;

    .line 19
    .line 20
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Ll/qc1;->q:Ljava/lang/Object;

    .line 24
    .line 25
    new-instance p1, Ll/qc1$a;

    .line 26
    .line 27
    invoke-direct {p1, p0}, Ll/qc1$a;-><init>(Ll/qc1;)V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Ll/qc1;->s:Ljava/lang/Runnable;

    .line 31
    .line 32
    return-void
.end method

.method public static synthetic s2(Ll/qc1;)Landroid/media/AudioRecord;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qc1;->m:Landroid/media/AudioRecord;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic t2(Ll/qc1;)Ll/q210$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qc1;->r:Ll/q210$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic u2(Ll/qc1;)Ll/qc1$b;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0
.end method

.method public static synthetic v2(Ll/qc1;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/qc1;->o:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic w2(Ll/qc1;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/qc1;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic x2(Ll/qc1;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qc1;->q:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public A2(Ll/q210$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qc1;->r:Ll/q210$a;

    .line 2
    .line 3
    return-void
.end method

.method public B2()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/qc1;->o:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/qc1;->p:Ljava/lang/Thread;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Ljava/lang/Thread;

    .line 9
    .line 10
    iget-object v1, p0, Ll/qc1;->s:Ljava/lang/Runnable;

    .line 11
    .line 12
    const-string v2, "live-media-AReThread"

    .line 13
    .line 14
    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/qc1;->p:Ljava/lang/Thread;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public C2()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/qc1;->o:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/qc1;->o:Z

    .line 7
    .line 8
    iget-object v0, p0, Ll/qc1;->p:Ljava/lang/Thread;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-wide/16 v1, 0xbb8

    .line 13
    .line 14
    :try_start_0
    invoke-virtual {v0, v1, v2}, Ljava/lang/Thread;->join(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :catch_0
    move-exception v0

    .line 19
    iget-object p0, p0, Ll/qc1;->p:Ljava/lang/Thread;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public p2()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/qc1;->o:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/qc1;->C2()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Ll/qc1;->p:Ljava/lang/Thread;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/qc1;->m:Landroid/media/AudioRecord;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Ll/qc1;->m:Landroid/media/AudioRecord;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Ll/qc1;->q:Ljava/lang/Object;

    .line 21
    .line 22
    monitor-enter v0

    .line 23
    :try_start_0
    iput-object v1, p0, Ll/jc00;->j:Ll/fb1;

    .line 24
    .line 25
    monitor-exit v0

    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    throw p0
.end method

.method public y2(Ljava/lang/String;IIII)Z
    .locals 8

    .line 1
    const-string p1, " startRecord  recorderaudio audioSampleRate:"

    .line 2
    .line 3
    iput p3, p0, Ll/jc00;->e:I

    .line 4
    .line 5
    iput p2, p0, Ll/jc00;->d:I

    .line 6
    .line 7
    iput p4, p0, Ll/jc00;->f:I

    .line 8
    .line 9
    iput p5, p0, Ll/qc1;->n:I

    .line 10
    .line 11
    mul-int/lit8 p3, p2, 0x78

    .line 12
    .line 13
    div-int/lit16 p3, p3, 0x3e8

    .line 14
    .line 15
    mul-int/lit8 p3, p3, 0x20

    .line 16
    .line 17
    shr-int/lit8 p3, p3, 0x3

    .line 18
    .line 19
    const/16 p5, 0xc

    .line 20
    .line 21
    const/16 v0, 0x10

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    if-ne p4, v1, :cond_0

    .line 25
    .line 26
    move p4, v0

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move p4, p5

    .line 29
    :goto_0
    const/4 v2, 0x2

    .line 30
    invoke-static {p2, p4, v2}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    mul-int/2addr p2, v0

    .line 35
    if-ge p3, p2, :cond_1

    .line 36
    .line 37
    move v7, p2

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    move v7, p3

    .line 40
    :goto_1
    :try_start_0
    new-instance v2, Landroid/media/AudioRecord;

    .line 41
    .line 42
    iget v4, p0, Ll/jc00;->d:I

    .line 43
    .line 44
    iget p2, p0, Ll/jc00;->f:I

    .line 45
    .line 46
    if-ne p2, v1, :cond_2

    .line 47
    .line 48
    move v5, v0

    .line 49
    goto :goto_2

    .line 50
    :cond_2
    move v5, p5

    .line 51
    :goto_2
    const/4 v6, 0x2

    .line 52
    const/4 v3, 0x1

    .line 53
    invoke-direct/range {v2 .. v7}, Landroid/media/AudioRecord;-><init>(IIIII)V

    .line 54
    .line 55
    .line 56
    iput-object v2, p0, Ll/qc1;->m:Landroid/media/AudioRecord;

    .line 57
    .line 58
    const-string p2, "AudioRecorderWrapper"

    .line 59
    .line 60
    new-instance p3, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    invoke-direct {p3, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    iget p1, p0, Ll/jc00;->d:I

    .line 66
    .line 67
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string p1, ";mSampleChannels:"

    .line 71
    .line 72
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    iget p1, p0, Ll/jc00;->f:I

    .line 76
    .line 77
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    .line 86
    .line 87
    return v1

    .line 88
    :catch_0
    iget-object p0, p0, Ll/qc1;->r:Ll/q210$a;

    .line 89
    .line 90
    const/4 p1, 0x0

    .line 91
    if-eqz p0, :cond_3

    .line 92
    .line 93
    const p2, 0x9100

    .line 94
    .line 95
    .line 96
    const/4 p3, 0x0

    .line 97
    invoke-interface {p0, p2, v1, p1, p3}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    :cond_3
    return p1
.end method

.method public z2(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/jc00;->d:I

    .line 2
    .line 3
    return-void
.end method
