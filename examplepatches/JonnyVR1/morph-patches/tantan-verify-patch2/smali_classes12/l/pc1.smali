.class public Ll/pc1;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/pc1$b;
    }
.end annotation


# static fields
.field public static o:I = 0x1

.field public static p:I = 0x2


# instance fields
.field private final a:Ljava/lang/String;

.field private b:I

.field private c:I

.field private d:I

.field private e:Landroid/media/AudioRecord;

.field private f:I

.field private g:Z

.field private h:Ljava/lang/Thread;

.field private i:Ll/pc1$b;

.field private j:Z

.field private k:Ljava/lang/Object;

.field private l:I

.field private m:Ll/spw;

.field private n:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "AudioRecorderWrapper"

    .line 5
    .line 6
    iput-object v0, p0, Ll/pc1;->a:Ljava/lang/String;

    .line 7
    .line 8
    const v0, 0xac44

    .line 9
    .line 10
    .line 11
    iput v0, p0, Ll/pc1;->b:I

    .line 12
    .line 13
    const/16 v0, 0x10

    .line 14
    .line 15
    iput v0, p0, Ll/pc1;->c:I

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    iput v0, p0, Ll/pc1;->d:I

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    iput-object v1, p0, Ll/pc1;->e:Landroid/media/AudioRecord;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    iput v2, p0, Ll/pc1;->f:I

    .line 25
    .line 26
    iput-boolean v2, p0, Ll/pc1;->g:Z

    .line 27
    .line 28
    iput-object v1, p0, Ll/pc1;->h:Ljava/lang/Thread;

    .line 29
    .line 30
    iput-object v1, p0, Ll/pc1;->i:Ll/pc1$b;

    .line 31
    .line 32
    iput-boolean v2, p0, Ll/pc1;->j:Z

    .line 33
    .line 34
    new-instance v2, Ljava/lang/Object;

    .line 35
    .line 36
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v2, p0, Ll/pc1;->k:Ljava/lang/Object;

    .line 40
    .line 41
    iput v0, p0, Ll/pc1;->l:I

    .line 42
    .line 43
    iput-object v1, p0, Ll/pc1;->m:Ll/spw;

    .line 44
    .line 45
    new-instance v0, Ll/pc1$a;

    .line 46
    .line 47
    invoke-direct {v0, p0}, Ll/pc1$a;-><init>(Ll/pc1;)V

    .line 48
    .line 49
    .line 50
    iput-object v0, p0, Ll/pc1;->n:Ljava/lang/Runnable;

    .line 51
    .line 52
    return-void
.end method

.method public static synthetic a(Ll/pc1;)Landroid/media/AudioRecord;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pc1;->e:Landroid/media/AudioRecord;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ll/pc1;)Ll/spw;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pc1;->m:Ll/spw;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Ll/pc1;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/pc1;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic d(Ll/pc1;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/pc1;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic e(Ll/pc1;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/pc1;->j:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic f(Ll/pc1;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pc1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g(Ll/pc1;)Ll/pc1$b;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pc1;->i:Ll/pc1$b;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public h(IIII)Z
    .locals 7

    .line 1
    iput p2, p0, Ll/pc1;->c:I

    .line 2
    .line 3
    iput p1, p0, Ll/pc1;->b:I

    .line 4
    .line 5
    iput p3, p0, Ll/pc1;->d:I

    .line 6
    .line 7
    iput p4, p0, Ll/pc1;->f:I

    .line 8
    .line 9
    mul-int/lit8 p2, p1, 0x78

    .line 10
    .line 11
    div-int/lit16 p2, p2, 0x3e8

    .line 12
    .line 13
    mul-int/lit8 p2, p2, 0x20

    .line 14
    .line 15
    shr-int/lit8 p2, p2, 0x3

    .line 16
    .line 17
    const/16 p4, 0x10

    .line 18
    .line 19
    const/4 v0, 0x2

    .line 20
    if-ne p3, v0, :cond_0

    .line 21
    .line 22
    const/16 p3, 0xc

    .line 23
    .line 24
    move v4, p3

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move v4, p4

    .line 27
    :goto_0
    invoke-static {p1, v4, v0}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    mul-int/2addr p1, p4

    .line 32
    if-ge p2, p1, :cond_1

    .line 33
    .line 34
    move v6, p1

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    move v6, p2

    .line 37
    :goto_1
    :try_start_0
    new-instance v1, Landroid/media/AudioRecord;

    .line 38
    .line 39
    iget v2, p0, Ll/pc1;->l:I

    .line 40
    .line 41
    iget v3, p0, Ll/pc1;->b:I

    .line 42
    .line 43
    const/4 v5, 0x2

    .line 44
    invoke-direct/range {v1 .. v6}, Landroid/media/AudioRecord;-><init>(IIIII)V

    .line 45
    .line 46
    .line 47
    iput-object v1, p0, Ll/pc1;->e:Landroid/media/AudioRecord;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    .line 49
    const/4 p0, 0x1

    .line 50
    return p0

    .line 51
    :catch_0
    move-exception v0

    .line 52
    move-object p1, v0

    .line 53
    new-instance p2, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    const-string p3, "Open Recorder devcie error ! ["

    .line 56
    .line 57
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p4

    .line 64
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string p4, "]"

    .line 68
    .line 69
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    const-string v0, "AudioRecorderWrapper"

    .line 77
    .line 78
    invoke-static {v0, p2}, Ll/lyv;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Ll/pc1;->m:Ll/spw;

    .line 82
    .line 83
    if-eqz p0, :cond_2

    .line 84
    .line 85
    new-instance p2, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    const/16 p2, 0x7d1

    .line 105
    .line 106
    invoke-interface {p0, p2, p1}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 107
    .line 108
    .line 109
    :cond_2
    const/4 p0, 0x0

    .line 110
    return p0
.end method

.method public i()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/pc1;->g:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/pc1;->m()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Ll/pc1;->h:Ljava/lang/Thread;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/pc1;->e:Landroid/media/AudioRecord;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Ll/pc1;->e:Landroid/media/AudioRecord;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Ll/pc1;->k:Ljava/lang/Object;

    .line 21
    .line 22
    monitor-enter v0

    .line 23
    :try_start_0
    iput-object v1, p0, Ll/pc1;->i:Ll/pc1$b;

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

.method public j(Ll/spw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pc1;->m:Ll/spw;

    .line 2
    .line 3
    return-void
.end method

.method public k(Ll/pc1$b;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pc1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-object p1, p0, Ll/pc1;->i:Ll/pc1$b;

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public l()V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/pc1;->g:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/pc1;->h:Ljava/lang/Thread;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Ljava/lang/Thread;

    .line 9
    .line 10
    iget-object v1, p0, Ll/pc1;->n:Ljava/lang/Runnable;

    .line 11
    .line 12
    new-instance v2, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v3, "AudioRecorderThread"

    .line 15
    .line 16
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ll/g8g0;->b()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/pc1;->h:Ljava/lang/Thread;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public m()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/pc1;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/pc1;->g:Z

    .line 7
    .line 8
    iget-object v0, p0, Ll/pc1;->h:Ljava/lang/Thread;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catch_0
    move-exception v0

    .line 17
    iget-object v1, p0, Ll/pc1;->m:Ll/spw;

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    new-instance v2, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v3, "Stop Recording  failed ! ["

    .line 24
    .line 25
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v3, "]"

    .line 36
    .line 37
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    const/16 v3, 0x7d3

    .line 45
    .line 46
    invoke-interface {v1, v3, v2}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 50
    .line 51
    .line 52
    :goto_0
    const/4 v0, 0x0

    .line 53
    iput-object v0, p0, Ll/pc1;->h:Ljava/lang/Thread;

    .line 54
    .line 55
    :cond_1
    return-void
.end method
