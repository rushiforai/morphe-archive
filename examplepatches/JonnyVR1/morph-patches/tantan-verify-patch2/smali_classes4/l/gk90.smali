.class public Ll/gk90;
.super Ll/r2i0;
.source "SourceFile"


# instance fields
.field public a:Ll/z1m;

.field public b:Ll/y1m;

.field public c:Ll/fk90;

.field public d:Ljava/util/concurrent/atomic/AtomicInteger;

.field public e:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method public constructor <init>(Ll/fk90;Ll/z1m;Ll/y1m;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/r2i0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/gk90;->d:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 11
    .line 12
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/gk90;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 18
    .line 19
    iput-object p1, p0, Ll/gk90;->c:Ll/fk90;

    .line 20
    .line 21
    iput-object p2, p0, Ll/gk90;->a:Ll/z1m;

    .line 22
    .line 23
    iput-object p3, p0, Ll/gk90;->b:Ll/y1m;

    .line 24
    .line 25
    return-void
.end method

.method public static synthetic b(Ll/gk90;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gk90;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gk90;->a:Ll/z1m;

    .line 2
    .line 3
    iget-object p0, p0, Ll/z1m;->b:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public final c()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/gk90;->a:Ll/z1m;

    .line 2
    .line 3
    iget-object v0, v0, Ll/z1m;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/gk90;->d(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/gk90;->d:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/gk90;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object v0, p0, Ll/gk90;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 26
    .line 27
    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    const-string v2, "\u63a2\u6d4b\u7ed3\u679c\u5931\u8d25"

    .line 31
    .line 32
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Ll/gk90;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 36
    .line 37
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v2, "\u6b21 !!!"

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-static {v0}, Ll/r6e;->a(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/gk90;->d:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 59
    .line 60
    .line 61
    :goto_0
    iget-object v0, p0, Ll/gk90;->d:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    iget-object v2, p0, Ll/gk90;->a:Ll/z1m;

    .line 68
    .line 69
    iget v3, v2, Ll/z1m;->c:I

    .line 70
    .line 71
    if-ne v0, v3, :cond_1

    .line 72
    .line 73
    const/4 v0, 0x1

    .line 74
    iput-boolean v0, v2, Ll/z1m;->h:Z

    .line 75
    .line 76
    iget-object v0, p0, Ll/gk90;->d:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/gk90;->b:Ll/y1m;

    .line 82
    .line 83
    if-eqz v0, :cond_1

    .line 84
    .line 85
    iget-object v2, p0, Ll/gk90;->a:Ll/z1m;

    .line 86
    .line 87
    invoke-interface {v0, v2}, Ll/y1m;->a(Ll/z1m;)V

    .line 88
    .line 89
    .line 90
    :cond_1
    iget-object v0, p0, Ll/gk90;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 91
    .line 92
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    iget-object v2, p0, Ll/gk90;->a:Ll/z1m;

    .line 97
    .line 98
    iget v3, v2, Ll/z1m;->d:I

    .line 99
    .line 100
    if-ne v0, v3, :cond_2

    .line 101
    .line 102
    iput-boolean v1, v2, Ll/z1m;->h:Z

    .line 103
    .line 104
    iget-object v0, p0, Ll/gk90;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Ll/gk90;->b:Ll/y1m;

    .line 110
    .line 111
    if-eqz v0, :cond_2

    .line 112
    .line 113
    new-instance v0, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    const-string v1, "\u63a2\u6d4b\u7ed3\u679c\u5931\u8d2510\u6b21\uff0c\u53bb\u66f4\u65b0:"

    .line 116
    .line 117
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    iget-object v1, p0, Ll/gk90;->a:Ll/z1m;

    .line 121
    .line 122
    iget-object v1, v1, Ll/z1m;->b:Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    const-string v1, "!!!"

    .line 128
    .line 129
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-static {v0}, Ll/r6e;->a(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Ll/gk90;->b:Ll/y1m;

    .line 140
    .line 141
    iget-object v1, p0, Ll/gk90;->a:Ll/z1m;

    .line 142
    .line 143
    invoke-interface {v0, v1}, Ll/y1m;->a(Ll/z1m;)V

    .line 144
    .line 145
    .line 146
    :cond_2
    invoke-static {}, Ll/vml;->c()Ll/vml;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-virtual {v0}, Ll/vml;->b()Z

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    if-nez v0, :cond_3

    .line 155
    .line 156
    iget-object v0, p0, Ll/gk90;->c:Ll/fk90;

    .line 157
    .line 158
    iget-object v1, p0, Ll/gk90;->a:Ll/z1m;

    .line 159
    .line 160
    iget-object v1, v1, Ll/z1m;->a:Ljava/lang/String;

    .line 161
    .line 162
    invoke-virtual {v0, v1}, Ll/fk90;->b(Ljava/lang/String;)Lcom/tantanapp/httpdns/probe/IPProbeService$Status;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    sget-object v1, Lcom/tantanapp/httpdns/probe/IPProbeService$Status;->PROBING:Lcom/tantanapp/httpdns/probe/IPProbeService$Status;

    .line 167
    .line 168
    if-ne v0, v1, :cond_3

    .line 169
    .line 170
    invoke-static {}, Ll/hoi0;->a()Ll/hoi0;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    iget-object v1, p0, Ll/gk90;->a:Ll/z1m;

    .line 175
    .line 176
    iget v1, v1, Ll/z1m;->e:I

    .line 177
    .line 178
    mul-int/lit16 v1, v1, 0x3e8

    .line 179
    .line 180
    int-to-long v1, v1

    .line 181
    invoke-virtual {v0, p0, v1, v2}, Ll/hoi0;->c(Ll/r2i0;J)V

    .line 182
    .line 183
    .line 184
    :cond_3
    return-void
.end method

.method public final d(Ljava/lang/String;)Z
    .locals 5

    .line 1
    const-string v0, "\u63a2\u6d4b\u7ed3\u679c:"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    :try_start_0
    new-instance v3, Ljava/net/Socket;

    .line 6
    .line 7
    invoke-direct {v3}, Ljava/net/Socket;-><init>()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 8
    .line 9
    .line 10
    :try_start_1
    new-instance v1, Ljava/net/InetSocketAddress;

    .line 11
    .line 12
    iget-object v4, p0, Ll/gk90;->a:Ll/z1m;

    .line 13
    .line 14
    iget v4, v4, Ll/z1m;->f:I

    .line 15
    .line 16
    invoke-direct {v1, p1, v4}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/gk90;->a:Ll/z1m;

    .line 20
    .line 21
    iget p0, p0, Ll/z1m;->g:I

    .line 22
    .line 23
    invoke-virtual {v3, v1, p0}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    .line 24
    .line 25
    .line 26
    const/4 v2, 0x1

    .line 27
    new-instance p0, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v1, " succuess!!!"

    .line 36
    .line 37
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {p0}, Ll/r6e;->a(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 45
    .line 46
    .line 47
    :try_start_2
    invoke-virtual {v3}, Ljava/net/Socket;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 48
    .line 49
    .line 50
    goto :goto_1

    .line 51
    :catchall_0
    move-exception p0

    .line 52
    move-object v1, v3

    .line 53
    goto :goto_2

    .line 54
    :catch_0
    move-object v1, v3

    .line 55
    goto :goto_0

    .line 56
    :catchall_1
    move-exception p0

    .line 57
    goto :goto_2

    .line 58
    :catch_1
    :goto_0
    :try_start_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string p1, " faild!!!"

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-static {p0}, Ll/r6e;->a(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 76
    .line 77
    .line 78
    if-eqz v1, :cond_0

    .line 79
    .line 80
    :try_start_4
    invoke-virtual {v1}, Ljava/net/Socket;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 81
    .line 82
    .line 83
    :catch_2
    :cond_0
    :goto_1
    return v2

    .line 84
    :goto_2
    if-eqz v1, :cond_1

    .line 85
    .line 86
    :try_start_5
    invoke-virtual {v1}, Ljava/net/Socket;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 87
    .line 88
    .line 89
    :catch_3
    :cond_1
    throw p0
.end method

.method public run()V
    .locals 1

    .line 1
    new-instance v0, Ll/gk90$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/gk90$a;-><init>(Ll/gk90;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/w21;->a(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
