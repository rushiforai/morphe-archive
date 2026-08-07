.class Ll/grx$c;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/grx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field private a:Z

.field private b:Z

.field private c:Lcom/momo/x264/x264sdk$listener;

.field private d:Lcom/momo/x264/x264sdk;

.field private e:Ljava/nio/ByteBuffer;

.field final synthetic f:Ll/grx;


# direct methods
.method public constructor <init>(Ll/grx;Ljava/lang/String;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/grx$c;->f:Ll/grx;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p2, 0x0

    .line 7
    iput-boolean p2, p0, Ll/grx$c;->a:Z

    .line 8
    .line 9
    iput-boolean p2, p0, Ll/grx$c;->b:Z

    .line 10
    .line 11
    new-instance p2, Ll/grx$c$a;

    .line 12
    .line 13
    invoke-direct {p2, p0}, Ll/grx$c$a;-><init>(Ll/grx$c;)V

    .line 14
    .line 15
    .line 16
    iput-object p2, p0, Ll/grx$c;->c:Lcom/momo/x264/x264sdk$listener;

    .line 17
    .line 18
    const/4 p2, 0x0

    .line 19
    iput-object p2, p0, Ll/grx$c;->d:Lcom/momo/x264/x264sdk;

    .line 20
    .line 21
    iput-object p2, p0, Ll/grx$c;->e:Ljava/nio/ByteBuffer;

    .line 22
    .line 23
    new-instance p2, Lcom/momo/x264/x264sdk;

    .line 24
    .line 25
    iget-object v0, p0, Ll/grx$c;->c:Lcom/momo/x264/x264sdk$listener;

    .line 26
    .line 27
    invoke-direct {p2, v0}, Lcom/momo/x264/x264sdk;-><init>(Lcom/momo/x264/x264sdk$listener;)V

    .line 28
    .line 29
    .line 30
    iput-object p2, p0, Ll/grx$c;->d:Lcom/momo/x264/x264sdk;

    .line 31
    .line 32
    iget-object p0, p1, Ll/grx;->i1:Ll/uow;

    .line 33
    .line 34
    iget v0, p0, Ll/tow;->m:I

    .line 35
    .line 36
    iget v1, p0, Ll/tow;->n:I

    .line 37
    .line 38
    const/16 v2, 0xf

    .line 39
    .line 40
    iget p0, p0, Ll/tow;->H:I

    .line 41
    .line 42
    invoke-virtual {p2, v0, v1, v2, p0}, Lcom/momo/x264/x264sdk;->initEncode(IIII)V

    .line 43
    .line 44
    .line 45
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    new-instance p2, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    const-string v0, "----h264data listener:width="

    .line 52
    .line 53
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p1, Ll/grx;->i1:Ll/uow;

    .line 57
    .line 58
    iget v0, v0, Ll/tow;->m:I

    .line 59
    .line 60
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v0, "; height="

    .line 64
    .line 65
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-object v0, p1, Ll/grx;->i1:Ll/uow;

    .line 69
    .line 70
    iget v0, v0, Ll/tow;->n:I

    .line 71
    .line 72
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string v0, ";bitrate="

    .line 76
    .line 77
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    iget-object p1, p1, Ll/grx;->i1:Ll/uow;

    .line 81
    .line 82
    iget p1, p1, Ll/tow;->H:I

    .line 83
    .line 84
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    const-string p2, "MediaCodecFilter"

    .line 92
    .line 93
    invoke-virtual {p0, p2, p1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public static synthetic a(Ll/grx$c;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/grx$c;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Ll/grx$c;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/grx$c;->b:Z

    .line 2
    .line 3
    return p1
.end method


# virtual methods
.method public c()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/grx$c;->a:Z

    .line 3
    .line 4
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 9
    .line 10
    const-string v2, "SoftCodecThread quit"

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-wide/16 v0, 0xbb8

    .line 16
    .line 17
    :try_start_0
    invoke-virtual {p0, v0, v1}, Ljava/lang/Thread;->join(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :catch_0
    move-exception v0

    .line 22
    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public run()V
    .locals 5

    .line 1
    :cond_0
    :goto_0
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-boolean v0, p0, Ll/grx$c;->a:Z

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/grx$c;->f:Ll/grx;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/grx;->R2()Ljava/nio/ByteBuffer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v1, p0, Ll/grx$c;->d:Lcom/momo/x264/x264sdk;

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v0}, Ljava/nio/Buffer;->limit()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    const-wide/16 v3, 0x0

    .line 32
    .line 33
    invoke-virtual {v1, v2, v0, v3, v4}, Lcom/momo/x264/x264sdk;->PushOriStream([BIJ)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    iget-object v0, p0, Ll/grx$c;->f:Ll/grx;

    .line 38
    .line 39
    invoke-static {v0}, Ll/grx;->u2(Ll/grx;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    monitor-enter v0

    .line 44
    :try_start_0
    iget-object v1, p0, Ll/grx$c;->d:Lcom/momo/x264/x264sdk;

    .line 45
    .line 46
    const/4 v2, 0x0

    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/momo/x264/x264sdk;->release()V

    .line 50
    .line 51
    .line 52
    iput-object v2, p0, Ll/grx$c;->d:Lcom/momo/x264/x264sdk;

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :catchall_0
    move-exception p0

    .line 56
    goto :goto_2

    .line 57
    :cond_2
    :goto_1
    iget-object v1, p0, Ll/grx$c;->f:Ll/grx;

    .line 58
    .line 59
    invoke-static {v1}, Ll/grx;->v2(Ll/grx;)Ljava/util/LinkedList;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    if-eqz v1, :cond_3

    .line 64
    .line 65
    iget-object v1, p0, Ll/grx$c;->f:Ll/grx;

    .line 66
    .line 67
    invoke-static {v1}, Ll/grx;->v2(Ll/grx;)Ljava/util/LinkedList;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 72
    .line 73
    .line 74
    iget-object v1, p0, Ll/grx$c;->f:Ll/grx;

    .line 75
    .line 76
    invoke-static {v1, v2}, Ll/grx;->w2(Ll/grx;Ljava/util/LinkedList;)Ljava/util/LinkedList;

    .line 77
    .line 78
    .line 79
    :cond_3
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 85
    .line 86
    new-instance v2, Ljava/lang/StringBuilder;

    .line 87
    .line 88
    const-string v3, "SoftCodecThread end interrupted"

    .line 89
    .line 90
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    xor-int/lit8 v3, v3, 0x1

    .line 98
    .line 99
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string v3, " shouldQuit:"

    .line 103
    .line 104
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    iget-boolean v3, p0, Ll/grx$c;->a:Z

    .line 108
    .line 109
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    const-string v3, " mIsRunning:"

    .line 113
    .line 114
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    iget-object p0, p0, Ll/grx$c;->f:Ll/grx;

    .line 118
    .line 119
    iget-boolean p0, p0, Ll/grx;->X0:Z

    .line 120
    .line 121
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-virtual {v0, v1, p0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :goto_2
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 133
    throw p0
.end method
