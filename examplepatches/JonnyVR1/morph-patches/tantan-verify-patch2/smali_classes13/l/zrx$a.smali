.class Ll/zrx$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/zrx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field private a:J

.field final synthetic b:Ll/zrx;


# direct methods
.method public constructor <init>(Ll/zrx;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/zrx$a;->b:Ll/zrx;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x2710

    .line 7
    .line 8
    iput-wide v0, p0, Ll/zrx$a;->a:J

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .line 1
    :cond_0
    :goto_0
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "Mp4MuxerWrapper"

    .line 6
    .line 7
    if-nez v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Ll/zrx$a;->b:Ll/zrx;

    .line 10
    .line 11
    invoke-static {v0}, Ll/zrx;->a(Ll/zrx;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_3

    .line 16
    .line 17
    :try_start_0
    iget-object v0, p0, Ll/zrx$a;->b:Ll/zrx;

    .line 18
    .line 19
    invoke-static {v0}, Ll/zrx;->b(Ll/zrx;)Ljava/util/concurrent/LinkedBlockingQueue;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const-wide/16 v2, 0x5

    .line 28
    .line 29
    if-lez v0, :cond_2

    .line 30
    .line 31
    iget-object v0, p0, Ll/zrx$a;->b:Ll/zrx;

    .line 32
    .line 33
    invoke-static {v0}, Ll/zrx;->b(Ll/zrx;)Ljava/util/concurrent/LinkedBlockingQueue;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->take()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Ll/oxd0;

    .line 42
    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    iget-object v4, v0, Ll/oxd0;->b:Ljava/nio/ByteBuffer;

    .line 46
    .line 47
    if-eqz v4, :cond_1

    .line 48
    .line 49
    iget-object v2, p0, Ll/zrx$a;->b:Ll/zrx;

    .line 50
    .line 51
    invoke-static {v2}, Ll/zrx;->c(Ll/zrx;)Landroid/media/MediaCodec;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    iget-wide v3, p0, Ll/zrx$a;->a:J

    .line 56
    .line 57
    invoke-virtual {v2, v3, v4}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    .line 58
    .line 59
    .line 60
    move-result v6

    .line 61
    if-ltz v6, :cond_0

    .line 62
    .line 63
    iget-object v2, p0, Ll/zrx$a;->b:Ll/zrx;

    .line 64
    .line 65
    invoke-static {v2}, Ll/zrx;->d(Ll/zrx;)[Ljava/nio/ByteBuffer;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    aget-object v2, v2, v6

    .line 70
    .line 71
    iget-object v3, v0, Ll/oxd0;->b:Ljava/nio/ByteBuffer;

    .line 72
    .line 73
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 74
    .line 75
    .line 76
    iget-object v2, p0, Ll/zrx$a;->b:Ll/zrx;

    .line 77
    .line 78
    invoke-static {v2}, Ll/zrx;->d(Ll/zrx;)[Ljava/nio/ByteBuffer;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    aget-object v2, v2, v6

    .line 83
    .line 84
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 85
    .line 86
    .line 87
    iget-object v2, v0, Ll/oxd0;->b:Ljava/nio/ByteBuffer;

    .line 88
    .line 89
    invoke-virtual {v2}, Ljava/nio/Buffer;->limit()I

    .line 90
    .line 91
    .line 92
    move-result v8

    .line 93
    iget-object v2, p0, Ll/zrx$a;->b:Ll/zrx;

    .line 94
    .line 95
    invoke-static {v2}, Ll/zrx;->c(Ll/zrx;)Landroid/media/MediaCodec;

    .line 96
    .line 97
    .line 98
    move-result-object v5

    .line 99
    invoke-virtual {v0}, Ll/oxd0;->d()J

    .line 100
    .line 101
    .line 102
    move-result-wide v9

    .line 103
    const/4 v11, 0x0

    .line 104
    const/4 v7, 0x0

    .line 105
    invoke-virtual/range {v5 .. v11}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0}, Ll/oxd0;->f()V

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :catch_0
    move-exception v0

    .line 113
    move-object p0, v0

    .line 114
    goto :goto_1

    .line 115
    :cond_1
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    .line 116
    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_2
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    .line 121
    .line 122
    goto :goto_0

    .line 123
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    const-string v2, "MediaCodec deque or queue buffer error ! ["

    .line 126
    .line 127
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    const-string p0, "]"

    .line 138
    .line 139
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    .line 148
    .line 149
    const/16 p0, 0x1001

    .line 150
    .line 151
    invoke-static {p0}, Ll/p4f;->a(I)V

    .line 152
    .line 153
    .line 154
    :cond_3
    const-string p0, ""

    .line 155
    .line 156
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    return-void
.end method
