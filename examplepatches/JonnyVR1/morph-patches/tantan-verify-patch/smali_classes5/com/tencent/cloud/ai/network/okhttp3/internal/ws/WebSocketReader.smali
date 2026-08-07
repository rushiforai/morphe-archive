.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader$FrameCallback;
    }
.end annotation


# instance fields
.field public final a:Z

.field public final b:Lcom/tencent/cloud/ai/network/okio/g;

.field public final c:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader$FrameCallback;

.field public d:Z

.field public e:I

.field public f:J

.field public g:Z

.field public h:Z

.field public final i:Lcom/tencent/cloud/ai/network/okio/e;

.field public final j:Lcom/tencent/cloud/ai/network/okio/e;

.field public final k:[B

.field public final l:Lcom/tencent/cloud/ai/network/okio/e$b;


# direct methods
.method public constructor <init>(ZLcom/tencent/cloud/ai/network/okio/g;Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader$FrameCallback;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/tencent/cloud/ai/network/okio/e;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/tencent/cloud/ai/network/okio/e;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->i:Lcom/tencent/cloud/ai/network/okio/e;

    .line 10
    .line 11
    new-instance v0, Lcom/tencent/cloud/ai/network/okio/e;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/tencent/cloud/ai/network/okio/e;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->j:Lcom/tencent/cloud/ai/network/okio/e;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    if-eqz p2, :cond_2

    .line 20
    .line 21
    iput-boolean p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->a:Z

    .line 22
    .line 23
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 24
    .line 25
    iput-object p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader$FrameCallback;

    .line 26
    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    move-object p2, v0

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 p2, 0x4

    .line 32
    new-array p2, p2, [B

    .line 33
    .line 34
    :goto_0
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->k:[B

    .line 35
    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    new-instance v0, Lcom/tencent/cloud/ai/network/okio/e$b;

    .line 40
    .line 41
    invoke-direct {v0}, Lcom/tencent/cloud/ai/network/okio/e$b;-><init>()V

    .line 42
    .line 43
    .line 44
    :goto_1
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->l:Lcom/tencent/cloud/ai/network/okio/e$b;

    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    const-string p0, "source == null"

    .line 48
    .line 49
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    throw v0
.end method


# virtual methods
.method public final a()V
    .locals 8

    .line 1
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->f:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-lez v4, :cond_0

    .line 8
    .line 9
    iget-object v4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 10
    .line 11
    iget-object v5, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->i:Lcom/tencent/cloud/ai/network/okio/e;

    .line 12
    .line 13
    invoke-interface {v4, v5, v0, v1}, Lcom/tencent/cloud/ai/network/okio/g;->b(Lcom/tencent/cloud/ai/network/okio/e;J)V

    .line 14
    .line 15
    .line 16
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->a:Z

    .line 17
    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->i:Lcom/tencent/cloud/ai/network/okio/e;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->l:Lcom/tencent/cloud/ai/network/okio/e$b;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/tencent/cloud/ai/network/okio/e;->a(Lcom/tencent/cloud/ai/network/okio/e$b;)Lcom/tencent/cloud/ai/network/okio/e$b;

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->l:Lcom/tencent/cloud/ai/network/okio/e$b;

    .line 28
    .line 29
    invoke-virtual {v0, v2, v3}, Lcom/tencent/cloud/ai/network/okio/e$b;->h(J)I

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->l:Lcom/tencent/cloud/ai/network/okio/e$b;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->k:[B

    .line 35
    .line 36
    invoke-static {v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketProtocol;->a(Lcom/tencent/cloud/ai/network/okio/e$b;[B)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->l:Lcom/tencent/cloud/ai/network/okio/e$b;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/e$b;->close()V

    .line 42
    .line 43
    .line 44
    :cond_0
    iget v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->e:I

    .line 45
    .line 46
    packed-switch v0, :pswitch_data_0

    .line 47
    .line 48
    .line 49
    new-instance v0, Ljava/net/ProtocolException;

    .line 50
    .line 51
    iget p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->e:I

    .line 52
    .line 53
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    new-instance v1, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    const-string v2, "Unknown control opcode: "

    .line 60
    .line 61
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-direct {v0, p0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    throw v0

    .line 75
    :pswitch_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader$FrameCallback;

    .line 76
    .line 77
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->i:Lcom/tencent/cloud/ai/network/okio/e;

    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/e;->m()Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-interface {v0, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader$FrameCallback;->onReadPong(Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :pswitch_1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader$FrameCallback;

    .line 88
    .line 89
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->i:Lcom/tencent/cloud/ai/network/okio/e;

    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/e;->m()Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-interface {v0, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader$FrameCallback;->onReadPing(Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :pswitch_2
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->i:Lcom/tencent/cloud/ai/network/okio/e;

    .line 100
    .line 101
    iget-wide v4, v0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 102
    .line 103
    const-wide/16 v6, 0x1

    .line 104
    .line 105
    cmp-long v1, v4, v6

    .line 106
    .line 107
    if-eqz v1, :cond_3

    .line 108
    .line 109
    cmp-long v1, v4, v2

    .line 110
    .line 111
    if-eqz v1, :cond_2

    .line 112
    .line 113
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/e;->readShort()S

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->i:Lcom/tencent/cloud/ai/network/okio/e;

    .line 118
    .line 119
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okio/e;->n()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketProtocol;->a(I)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    if-nez v2, :cond_1

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_1
    invoke-static {v2}, Ll/e7b0;->a(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :cond_2
    const/16 v0, 0x3ed

    .line 135
    .line 136
    const-string v1, ""

    .line 137
    .line 138
    :goto_0
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader$FrameCallback;

    .line 139
    .line 140
    invoke-interface {v2, v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader$FrameCallback;->onReadClose(ILjava/lang/String;)V

    .line 141
    .line 142
    .line 143
    const/4 v0, 0x1

    .line 144
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->d:Z

    .line 145
    .line 146
    return-void

    .line 147
    :cond_3
    const-string p0, "Malformed close payload length of 1."

    .line 148
    .line 149
    invoke-static {p0}, Ll/e7b0;->a(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    return-void

    .line 153
    :pswitch_data_0
    .packed-switch 0x8
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final b()V
    .locals 6

    .line 1
    sget-object v0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->d:Z

    .line 4
    .line 5
    if-nez v1, :cond_11

    .line 6
    .line 7
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 8
    .line 9
    invoke-interface {v1}, Lcom/tencent/cloud/ai/network/okio/w;->timeout()Lcom/tencent/cloud/ai/network/okio/x;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okio/x;->f()J

    .line 14
    .line 15
    .line 16
    move-result-wide v1

    .line 17
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 18
    .line 19
    invoke-interface {v3}, Lcom/tencent/cloud/ai/network/okio/w;->timeout()Lcom/tencent/cloud/ai/network/okio/x;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okio/x;->b()Lcom/tencent/cloud/ai/network/okio/x;

    .line 24
    .line 25
    .line 26
    :try_start_0
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 27
    .line 28
    invoke-interface {v3}, Lcom/tencent/cloud/ai/network/okio/g;->readByte()B

    .line 29
    .line 30
    .line 31
    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    iget-object v4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 33
    .line 34
    invoke-interface {v4}, Lcom/tencent/cloud/ai/network/okio/w;->timeout()Lcom/tencent/cloud/ai/network/okio/x;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    invoke-virtual {v4, v1, v2, v0}, Lcom/tencent/cloud/ai/network/okio/x;->a(JLjava/util/concurrent/TimeUnit;)Lcom/tencent/cloud/ai/network/okio/x;

    .line 39
    .line 40
    .line 41
    and-int/lit8 v0, v3, 0xf

    .line 42
    .line 43
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->e:I

    .line 44
    .line 45
    and-int/lit16 v0, v3, 0x80

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    const/4 v2, 0x1

    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    move v0, v2

    .line 52
    goto :goto_0

    .line 53
    :cond_0
    move v0, v1

    .line 54
    :goto_0
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->g:Z

    .line 55
    .line 56
    and-int/lit8 v4, v3, 0x8

    .line 57
    .line 58
    if-eqz v4, :cond_1

    .line 59
    .line 60
    move v4, v2

    .line 61
    goto :goto_1

    .line 62
    :cond_1
    move v4, v1

    .line 63
    :goto_1
    iput-boolean v4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->h:Z

    .line 64
    .line 65
    if-eqz v4, :cond_3

    .line 66
    .line 67
    if-eqz v0, :cond_2

    .line 68
    .line 69
    goto :goto_2

    .line 70
    :cond_2
    const-string p0, "Control frames must be final."

    .line 71
    .line 72
    invoke-static {p0}, Ll/e7b0;->a(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_3
    :goto_2
    and-int/lit8 v0, v3, 0x40

    .line 77
    .line 78
    if-eqz v0, :cond_4

    .line 79
    .line 80
    move v0, v2

    .line 81
    goto :goto_3

    .line 82
    :cond_4
    move v0, v1

    .line 83
    :goto_3
    and-int/lit8 v4, v3, 0x20

    .line 84
    .line 85
    if-eqz v4, :cond_5

    .line 86
    .line 87
    move v4, v2

    .line 88
    goto :goto_4

    .line 89
    :cond_5
    move v4, v1

    .line 90
    :goto_4
    and-int/lit8 v3, v3, 0x10

    .line 91
    .line 92
    if-eqz v3, :cond_6

    .line 93
    .line 94
    move v3, v2

    .line 95
    goto :goto_5

    .line 96
    :cond_6
    move v3, v1

    .line 97
    :goto_5
    if-nez v0, :cond_10

    .line 98
    .line 99
    if-nez v4, :cond_10

    .line 100
    .line 101
    if-nez v3, :cond_10

    .line 102
    .line 103
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 104
    .line 105
    invoke-interface {v0}, Lcom/tencent/cloud/ai/network/okio/g;->readByte()B

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    and-int/lit16 v3, v0, 0x80

    .line 110
    .line 111
    if-eqz v3, :cond_7

    .line 112
    .line 113
    move v1, v2

    .line 114
    :cond_7
    iget-boolean v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->a:Z

    .line 115
    .line 116
    if-ne v1, v2, :cond_9

    .line 117
    .line 118
    new-instance v0, Ljava/net/ProtocolException;

    .line 119
    .line 120
    iget-boolean p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->a:Z

    .line 121
    .line 122
    if-eqz p0, :cond_8

    .line 123
    .line 124
    const-string p0, "Server-sent frames must not be masked."

    .line 125
    .line 126
    goto :goto_6

    .line 127
    :cond_8
    const-string p0, "Client-sent frames must be masked."

    .line 128
    .line 129
    :goto_6
    invoke-direct {v0, p0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    throw v0

    .line 133
    :cond_9
    and-int/lit8 v0, v0, 0x7f

    .line 134
    .line 135
    int-to-long v2, v0

    .line 136
    iput-wide v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->f:J

    .line 137
    .line 138
    const-wide/16 v4, 0x7e

    .line 139
    .line 140
    cmp-long v0, v2, v4

    .line 141
    .line 142
    if-nez v0, :cond_a

    .line 143
    .line 144
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 145
    .line 146
    invoke-interface {v0}, Lcom/tencent/cloud/ai/network/okio/g;->readShort()S

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    int-to-long v2, v0

    .line 151
    const-wide/32 v4, 0xffff

    .line 152
    .line 153
    .line 154
    and-long/2addr v2, v4

    .line 155
    iput-wide v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->f:J

    .line 156
    .line 157
    goto :goto_7

    .line 158
    :cond_a
    const-wide/16 v4, 0x7f

    .line 159
    .line 160
    cmp-long v0, v2, v4

    .line 161
    .line 162
    if-nez v0, :cond_c

    .line 163
    .line 164
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 165
    .line 166
    invoke-interface {v0}, Lcom/tencent/cloud/ai/network/okio/g;->readLong()J

    .line 167
    .line 168
    .line 169
    move-result-wide v2

    .line 170
    iput-wide v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->f:J

    .line 171
    .line 172
    const-wide/16 v4, 0x0

    .line 173
    .line 174
    cmp-long v0, v2, v4

    .line 175
    .line 176
    if-ltz v0, :cond_b

    .line 177
    .line 178
    goto :goto_7

    .line 179
    :cond_b
    new-instance v0, Ljava/net/ProtocolException;

    .line 180
    .line 181
    iget-wide v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->f:J

    .line 182
    .line 183
    invoke-static {v1, v2}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    new-instance v1, Ljava/lang/StringBuilder;

    .line 188
    .line 189
    const-string v2, "Frame length 0x"

    .line 190
    .line 191
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    const-string p0, " > 0x7FFFFFFFFFFFFFFF"

    .line 198
    .line 199
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    invoke-direct {v0, p0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    throw v0

    .line 210
    :cond_c
    :goto_7
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->h:Z

    .line 211
    .line 212
    if-eqz v0, :cond_e

    .line 213
    .line 214
    iget-wide v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->f:J

    .line 215
    .line 216
    const-wide/16 v4, 0x7d

    .line 217
    .line 218
    cmp-long v0, v2, v4

    .line 219
    .line 220
    if-gtz v0, :cond_d

    .line 221
    .line 222
    goto :goto_8

    .line 223
    :cond_d
    const-string p0, "Control frame must be less than 125B."

    .line 224
    .line 225
    invoke-static {p0}, Ll/e7b0;->a(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    return-void

    .line 229
    :cond_e
    :goto_8
    if-eqz v1, :cond_f

    .line 230
    .line 231
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 232
    .line 233
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->k:[B

    .line 234
    .line 235
    invoke-interface {v0, p0}, Lcom/tencent/cloud/ai/network/okio/g;->readFully([B)V

    .line 236
    .line 237
    .line 238
    :cond_f
    return-void

    .line 239
    :cond_10
    const-string p0, "Reserved flags are unsupported."

    .line 240
    .line 241
    invoke-static {p0}, Ll/e7b0;->a(Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    return-void

    .line 245
    :catchall_0
    move-exception v3

    .line 246
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 247
    .line 248
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/w;->timeout()Lcom/tencent/cloud/ai/network/okio/x;

    .line 249
    .line 250
    .line 251
    move-result-object p0

    .line 252
    invoke-virtual {p0, v1, v2, v0}, Lcom/tencent/cloud/ai/network/okio/x;->a(JLjava/util/concurrent/TimeUnit;)Lcom/tencent/cloud/ai/network/okio/x;

    .line 253
    .line 254
    .line 255
    throw v3

    .line 256
    :cond_11
    const-string p0, "closed"

    .line 257
    .line 258
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    return-void
.end method
