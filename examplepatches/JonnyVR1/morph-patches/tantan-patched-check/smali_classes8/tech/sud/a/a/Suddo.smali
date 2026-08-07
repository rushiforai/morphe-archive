.class public final Ltech/sud/a/a/Suddo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic Suddo:Ltech/sud/a/a/Sudif;


# direct methods
.method public constructor <init>(Ltech/sud/a/a/Sudif;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/a/a/Suddo;->Suddo:Ltech/sud/a/a/Sudif;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "WebSocketWriteThread-"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v2}, Ljava/lang/Thread;->getId()J

    .line 17
    .line 18
    .line 19
    move-result-wide v2

    .line 20
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :goto_0
    const/4 v0, 0x0

    .line 31
    const/4 v1, 0x0

    .line 32
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-nez v2, :cond_0

    .line 37
    .line 38
    iget-object v2, p0, Ltech/sud/a/a/Suddo;->Suddo:Ltech/sud/a/a/Sudif;

    .line 39
    .line 40
    invoke-static {v2}, Ltech/sud/a/a/Sudif;->a(Ltech/sud/a/a/Sudif;)Ll/swg0;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    iget-object v2, v2, Ll/swg0;->a:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/util/concurrent/LinkedBlockingQueue;->take()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Ljava/nio/ByteBuffer;

    .line 51
    .line 52
    iget-object v3, p0, Ltech/sud/a/a/Suddo;->Suddo:Ltech/sud/a/a/Sudif;

    .line 53
    .line 54
    invoke-static {v3}, Ltech/sud/a/a/Sudif;->b(Ltech/sud/a/a/Sudif;)Ljava/io/OutputStream;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    invoke-virtual {v2}, Ljava/nio/Buffer;->limit()I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    invoke-virtual {v3, v4, v0, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 67
    .line 68
    .line 69
    iget-object v2, p0, Ltech/sud/a/a/Suddo;->Suddo:Ltech/sud/a/a/Sudif;

    .line 70
    .line 71
    invoke-static {v2}, Ltech/sud/a/a/Sudif;->b(Ltech/sud/a/a/Sudif;)Ljava/io/OutputStream;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :catchall_0
    move-exception v0

    .line 80
    goto :goto_4

    .line 81
    :catch_0
    move-exception v0

    .line 82
    goto :goto_2

    .line 83
    :catch_1
    :try_start_1
    iget-object v2, p0, Ltech/sud/a/a/Suddo;->Suddo:Ltech/sud/a/a/Sudif;

    .line 84
    .line 85
    invoke-static {v2}, Ltech/sud/a/a/Sudif;->a(Ltech/sud/a/a/Sudif;)Ll/swg0;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    iget-object v2, v2, Ll/swg0;->a:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 90
    .line 91
    invoke-virtual {v2}, Ljava/util/concurrent/LinkedBlockingQueue;->iterator()Ljava/util/Iterator;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    if-eqz v3, :cond_0

    .line 100
    .line 101
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    check-cast v3, Ljava/nio/ByteBuffer;

    .line 106
    .line 107
    iget-object v4, p0, Ltech/sud/a/a/Suddo;->Suddo:Ltech/sud/a/a/Sudif;

    .line 108
    .line 109
    invoke-static {v4}, Ltech/sud/a/a/Sudif;->b(Ltech/sud/a/a/Sudif;)Ljava/io/OutputStream;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    .line 114
    .line 115
    .line 116
    move-result-object v5

    .line 117
    invoke-virtual {v3}, Ljava/nio/Buffer;->limit()I

    .line 118
    .line 119
    .line 120
    move-result v3

    .line 121
    invoke-virtual {v4, v5, v0, v3}, Ljava/io/OutputStream;->write([BII)V

    .line 122
    .line 123
    .line 124
    iget-object v3, p0, Ltech/sud/a/a/Suddo;->Suddo:Ltech/sud/a/a/Sudif;

    .line 125
    .line 126
    invoke-static {v3}, Ltech/sud/a/a/Sudif;->b(Ltech/sud/a/a/Sudif;)Ljava/io/OutputStream;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    invoke-virtual {v3}, Ljava/io/OutputStream;->flush()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 131
    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_0
    iget-object v0, p0, Ltech/sud/a/a/Suddo;->Suddo:Ltech/sud/a/a/Sudif;

    .line 135
    .line 136
    invoke-static {v0}, Ltech/sud/a/a/Sudif;->c(Ltech/sud/a/a/Sudif;)V

    .line 137
    .line 138
    .line 139
    iget-object p0, p0, Ltech/sud/a/a/Suddo;->Suddo:Ltech/sud/a/a/Sudif;

    .line 140
    .line 141
    invoke-static {p0, v1}, Ltech/sud/a/a/Sudif;->a(Ltech/sud/a/a/Sudif;Ljava/lang/Thread;)Ljava/lang/Thread;

    .line 142
    .line 143
    .line 144
    goto :goto_3

    .line 145
    :goto_2
    :try_start_2
    iget-object v2, p0, Ltech/sud/a/a/Suddo;->Suddo:Ltech/sud/a/a/Sudif;

    .line 146
    .line 147
    invoke-static {v2, v0}, Ltech/sud/a/a/Sudif;->a(Ltech/sud/a/a/Sudif;Ljava/io/IOException;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 148
    .line 149
    .line 150
    iget-object v0, p0, Ltech/sud/a/a/Suddo;->Suddo:Ltech/sud/a/a/Sudif;

    .line 151
    .line 152
    invoke-static {v0}, Ltech/sud/a/a/Sudif;->c(Ltech/sud/a/a/Sudif;)V

    .line 153
    .line 154
    .line 155
    iget-object p0, p0, Ltech/sud/a/a/Suddo;->Suddo:Ltech/sud/a/a/Sudif;

    .line 156
    .line 157
    invoke-static {p0, v1}, Ltech/sud/a/a/Sudif;->a(Ltech/sud/a/a/Sudif;Ljava/lang/Thread;)Ljava/lang/Thread;

    .line 158
    .line 159
    .line 160
    :goto_3
    return-void

    .line 161
    :goto_4
    iget-object v2, p0, Ltech/sud/a/a/Suddo;->Suddo:Ltech/sud/a/a/Sudif;

    .line 162
    .line 163
    invoke-static {v2}, Ltech/sud/a/a/Sudif;->c(Ltech/sud/a/a/Sudif;)V

    .line 164
    .line 165
    .line 166
    iget-object p0, p0, Ltech/sud/a/a/Suddo;->Suddo:Ltech/sud/a/a/Sudif;

    .line 167
    .line 168
    invoke-static {p0, v1}, Ltech/sud/a/a/Sudif;->a(Ltech/sud/a/a/Sudif;Ljava/lang/Thread;)Ljava/lang/Thread;

    .line 169
    .line 170
    .line 171
    throw v0
.end method
