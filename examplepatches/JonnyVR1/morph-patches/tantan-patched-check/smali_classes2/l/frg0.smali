.class public final Ll/frg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ztg0;


# instance fields
.field public final a:Ljava/io/InputStream;

.field public final b:[B

.field public final c:Ll/vfg0;

.field public final d:I

.field public final e:Ll/aug0;

.field public final f:Ll/d0h0;


# direct methods
.method public constructor <init>(ILjava/io/InputStream;Ll/vfg0;Ll/aug0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/frg0;->d:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/frg0;->a:Ljava/io/InputStream;

    .line 7
    .line 8
    iget p1, p4, Ll/aug0;->h:I

    .line 9
    .line 10
    new-array p1, p1, [B

    .line 11
    .line 12
    iput-object p1, p0, Ll/frg0;->b:[B

    .line 13
    .line 14
    iput-object p3, p0, Ll/frg0;->c:Ll/vfg0;

    .line 15
    .line 16
    iput-object p4, p0, Ll/frg0;->e:Ll/aug0;

    .line 17
    .line 18
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object p1, p1, Ll/jwg0;->b:Ll/d0h0;

    .line 23
    .line 24
    iput-object p1, p0, Ll/frg0;->f:Ll/d0h0;

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public final a(Ll/jgg0;)J
    .locals 10

    .line 1
    iget-object v0, p1, Ll/jgg0;->d:Ll/ixg0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ixg0;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_5

    .line 8
    .line 9
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Ll/jwg0;->g:Ll/nmg0;

    .line 14
    .line 15
    iget-object v1, p1, Ll/jgg0;->b:Ll/aug0;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/nmg0;->c(Ll/aug0;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/frg0;->a:Ljava/io/InputStream;

    .line 21
    .line 22
    iget-object v1, p0, Ll/frg0;->b:[B

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/4 v1, -0x1

    .line 29
    if-ne v0, v1, :cond_0

    .line 30
    .line 31
    int-to-long p0, v0

    .line 32
    return-wide p0

    .line 33
    :cond_0
    iget-object v1, p0, Ll/frg0;->c:Ll/vfg0;

    .line 34
    .line 35
    iget v2, p0, Ll/frg0;->d:I

    .line 36
    .line 37
    iget-object v3, p0, Ll/frg0;->b:[B

    .line 38
    .line 39
    monitor-enter v1

    .line 40
    :try_start_0
    iget-boolean v4, v1, Ll/vfg0;->e:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    .line 42
    if-eqz v4, :cond_1

    .line 43
    .line 44
    monitor-exit v1

    .line 45
    goto :goto_0

    .line 46
    :cond_1
    :try_start_1
    invoke-virtual {v1, v2}, Ll/vfg0;->e(I)Ll/ojg0;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    check-cast v4, Ll/qng0;

    .line 51
    .line 52
    iget-object v4, v4, Ll/qng0;->c:Ljava/io/BufferedOutputStream;

    .line 53
    .line 54
    const/4 v5, 0x0

    .line 55
    invoke-virtual {v4, v3, v5, v0}, Ljava/io/BufferedOutputStream;->write([BII)V

    .line 56
    .line 57
    .line 58
    iget-object v3, v1, Ll/vfg0;->c:Ljava/util/concurrent/atomic/AtomicLong;

    .line 59
    .line 60
    int-to-long v4, v0

    .line 61
    invoke-virtual {v3, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 62
    .line 63
    .line 64
    iget-object v3, v1, Ll/vfg0;->b:Landroid/util/SparseArray;

    .line 65
    .line 66
    invoke-virtual {v3, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    check-cast v2, Ljava/util/concurrent/atomic/AtomicLong;

    .line 71
    .line 72
    invoke-virtual {v2, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 73
    .line 74
    .line 75
    invoke-virtual {v1}, Ll/vfg0;->g()V

    .line 76
    .line 77
    .line 78
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 79
    :goto_0
    int-to-long v0, v0

    .line 80
    iget-wide v2, p1, Ll/jgg0;->k:J

    .line 81
    .line 82
    add-long/2addr v2, v0

    .line 83
    iput-wide v2, p1, Ll/jgg0;->k:J

    .line 84
    .line 85
    iget-object v2, p0, Ll/frg0;->f:Ll/d0h0;

    .line 86
    .line 87
    iget-object p0, p0, Ll/frg0;->e:Ll/aug0;

    .line 88
    .line 89
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 90
    .line 91
    .line 92
    iget v2, p0, Ll/aug0;->o:I

    .line 93
    .line 94
    int-to-long v2, v2

    .line 95
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 96
    .line 97
    .line 98
    move-result-wide v4

    .line 99
    const-wide/16 v6, 0x0

    .line 100
    .line 101
    cmp-long v8, v2, v6

    .line 102
    .line 103
    if-lez v8, :cond_2

    .line 104
    .line 105
    iget-object p0, p0, Ll/aug0;->q:Ljava/util/concurrent/atomic/AtomicLong;

    .line 106
    .line 107
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 108
    .line 109
    .line 110
    move-result-wide v8

    .line 111
    sub-long/2addr v4, v8

    .line 112
    cmp-long p0, v4, v2

    .line 113
    .line 114
    if-ltz p0, :cond_3

    .line 115
    .line 116
    :cond_2
    iget-wide v2, p1, Ll/jgg0;->k:J

    .line 117
    .line 118
    cmp-long p0, v2, v6

    .line 119
    .line 120
    if-nez p0, :cond_4

    .line 121
    .line 122
    :cond_3
    return-wide v0

    .line 123
    :cond_4
    iget-object p0, p1, Ll/jgg0;->m:Ll/d0h0;

    .line 124
    .line 125
    iget-object p0, p0, Ll/d0h0;->a:Ll/oyg0;

    .line 126
    .line 127
    iget-object v4, p1, Ll/jgg0;->b:Ll/aug0;

    .line 128
    .line 129
    iget v5, p1, Ll/jgg0;->a:I

    .line 130
    .line 131
    invoke-virtual {p0, v4, v5, v2, v3}, Ll/oyg0;->b(Ll/aug0;IJ)V

    .line 132
    .line 133
    .line 134
    iput-wide v6, p1, Ll/jgg0;->k:J

    .line 135
    .line 136
    return-wide v0

    .line 137
    :catchall_0
    move-exception p0

    .line 138
    monitor-exit v1

    .line 139
    throw p0

    .line 140
    :cond_5
    sget-object p0, LSudchar/Sudfor;->Suddo:LSudchar/Sudfor;

    .line 141
    .line 142
    throw p0
.end method
