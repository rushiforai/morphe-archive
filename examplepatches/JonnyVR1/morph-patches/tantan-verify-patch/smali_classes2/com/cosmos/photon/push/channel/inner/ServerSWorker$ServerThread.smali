.class Lcom/cosmos/photon/push/channel/inner/ServerSWorker$ServerThread;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cosmos/photon/push/channel/inner/ServerSWorker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ServerThread"
.end annotation


# instance fields
.field volatile isRunning:Z

.field volatile server:Landroid/net/LocalServerSocket;

.field final synthetic this$0:Lcom/cosmos/photon/push/channel/inner/ServerSWorker;


# direct methods
.method public constructor <init>(Lcom/cosmos/photon/push/channel/inner/ServerSWorker;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/channel/inner/ServerSWorker$ServerThread;->this$0:Lcom/cosmos/photon/push/channel/inner/ServerSWorker;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    iput-boolean p1, p0, Lcom/cosmos/photon/push/channel/inner/ServerSWorker$ServerThread;->isRunning:Z

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput-object p1, p0, Lcom/cosmos/photon/push/channel/inner/ServerSWorker$ServerThread;->server:Landroid/net/LocalServerSocket;

    .line 11
    .line 12
    return-void
.end method

.method private processConnect(Landroid/net/LocalSocket;)I
    .locals 6

    .line 1
    const-string p0, "MoPush-Channel"

    .line 2
    .line 3
    const-string v0, "serverSocket accept connection: uid:"

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    :try_start_0
    invoke-virtual {p1}, Landroid/net/LocalSocket;->getPeerCredentials()Landroid/net/Credentials;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    new-instance v3, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v2}, Landroid/net/Credentials;->getUid()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v0, " pid:"

    .line 23
    .line 24
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v2}, Landroid/net/Credentials;->getPid()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    new-instance v0, Ljava/io/PrintWriter;

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/net/LocalSocket;->getOutputStream()Ljava/io/OutputStream;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-direct {v0, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 48
    .line 49
    .line 50
    :try_start_1
    new-instance v2, Ljava/io/BufferedReader;

    .line 51
    .line 52
    new-instance v3, Ljava/io/InputStreamReader;

    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/net/LocalSocket;->getInputStream()Ljava/io/InputStream;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    invoke-direct {v3, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 59
    .line 60
    .line 61
    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 62
    .line 63
    .line 64
    :cond_0
    :goto_0
    :try_start_2
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    if-eqz v1, :cond_3

    .line 69
    .line 70
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    const v4, 0x37814ec3

    .line 75
    .line 76
    .line 77
    if-eq v3, v4, :cond_2

    .line 78
    .line 79
    const v4, 0x60213f5e

    .line 80
    .line 81
    .line 82
    if-eq v3, v4, :cond_1

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_1
    const-string v3, "cmd:exit"

    .line 86
    .line 87
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 91
    if-eqz v1, :cond_0

    .line 92
    .line 93
    const/16 v1, 0x190

    .line 94
    .line 95
    :try_start_3
    invoke-virtual {p1}, Landroid/net/LocalSocket;->close()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Ljava/io/PrintWriter;->close()V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 102
    .line 103
    .line 104
    return v1

    .line 105
    :catch_0
    move-exception p1

    .line 106
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 107
    .line 108
    .line 109
    return v1

    .line 110
    :catchall_0
    move-exception v1

    .line 111
    goto/16 :goto_4

    .line 112
    .line 113
    :catch_1
    move-exception v1

    .line 114
    goto/16 :goto_2

    .line 115
    .line 116
    :cond_2
    :try_start_4
    const-string v3, "cmd:channel"

    .line 117
    .line 118
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result v3

    .line 122
    if-eqz v3, :cond_0

    .line 123
    .line 124
    new-instance v3, Ljava/lang/StringBuilder;

    .line 125
    .line 126
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 127
    .line 128
    .line 129
    const-string v4, "serverSocket accept cmd: "

    .line 130
    .line 131
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    invoke-static {p0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getContext()Landroid/content/Context;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v0}, Ljava/io/PrintWriter;->flush()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 156
    .line 157
    .line 158
    const/4 v1, 0x1

    .line 159
    :try_start_5
    invoke-virtual {p1}, Landroid/net/LocalSocket;->close()V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v0}, Ljava/io/PrintWriter;->close()V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    .line 166
    .line 167
    .line 168
    return v1

    .line 169
    :catch_2
    move-exception p1

    .line 170
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 171
    .line 172
    .line 173
    return v1

    .line 174
    :cond_3
    :try_start_6
    invoke-virtual {p1}, Landroid/net/LocalSocket;->close()V

    .line 175
    .line 176
    .line 177
    invoke-virtual {v0}, Ljava/io/PrintWriter;->close()V

    .line 178
    .line 179
    .line 180
    :goto_1
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3

    .line 181
    .line 182
    .line 183
    goto :goto_3

    .line 184
    :catch_3
    move-exception p1

    .line 185
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 186
    .line 187
    .line 188
    goto :goto_3

    .line 189
    :catchall_1
    move-exception v2

    .line 190
    move-object v5, v2

    .line 191
    move-object v2, v1

    .line 192
    move-object v1, v5

    .line 193
    goto :goto_4

    .line 194
    :catch_4
    move-exception v2

    .line 195
    move-object v5, v2

    .line 196
    move-object v2, v1

    .line 197
    move-object v1, v5

    .line 198
    goto :goto_2

    .line 199
    :catchall_2
    move-exception v0

    .line 200
    move-object v2, v1

    .line 201
    move-object v1, v0

    .line 202
    move-object v0, v2

    .line 203
    goto :goto_4

    .line 204
    :catch_5
    move-exception v0

    .line 205
    move-object v2, v1

    .line 206
    move-object v1, v0

    .line 207
    move-object v0, v2

    .line 208
    :goto_2
    :try_start_7
    invoke-static {p0, v1}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 209
    .line 210
    .line 211
    :try_start_8
    invoke-virtual {p1}, Landroid/net/LocalSocket;->close()V

    .line 212
    .line 213
    .line 214
    invoke-virtual {v0}, Ljava/io/PrintWriter;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3

    .line 215
    .line 216
    .line 217
    goto :goto_1

    .line 218
    :goto_3
    const/4 p0, 0x0

    .line 219
    return p0

    .line 220
    :goto_4
    :try_start_9
    invoke-virtual {p1}, Landroid/net/LocalSocket;->close()V

    .line 221
    .line 222
    .line 223
    invoke-virtual {v0}, Ljava/io/PrintWriter;->close()V

    .line 224
    .line 225
    .line 226
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_6

    .line 227
    .line 228
    .line 229
    goto :goto_5

    .line 230
    :catch_6
    move-exception p1

    .line 231
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 232
    .line 233
    .line 234
    :goto_5
    throw v1
.end method


# virtual methods
.method public end()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/cosmos/photon/push/channel/inner/ServerSWorker$ServerThread;->isRunning:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/cosmos/photon/push/channel/inner/ServerSWorker$ServerThread;->this$0:Lcom/cosmos/photon/push/channel/inner/ServerSWorker;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/cosmos/photon/push/channel/inner/ServerSWorker;->access$000(Lcom/cosmos/photon/push/channel/inner/ServerSWorker;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {}, Lcom/cosmos/photon/push/channel/ChannelConstant;->getExitCommand()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {p0, v0}, Lcom/cosmos/photon/push/channel/inner/ClientWorker;->sendSimpleMessage(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public run()V
    .locals 5

    .line 1
    const-string v0, "ServerSocketThread end"

    .line 2
    .line 3
    const-string v1, "MoPush-Channel"

    .line 4
    .line 5
    const-string v2, "serverSocket begin listener: "

    .line 6
    .line 7
    :try_start_0
    new-instance v3, Landroid/net/LocalServerSocket;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/cosmos/photon/push/channel/inner/ServerSWorker$ServerThread;->this$0:Lcom/cosmos/photon/push/channel/inner/ServerSWorker;

    .line 10
    .line 11
    invoke-static {v4}, Lcom/cosmos/photon/push/channel/inner/ServerSWorker;->access$000(Lcom/cosmos/photon/push/channel/inner/ServerSWorker;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    invoke-direct {v3, v4}, Landroid/net/LocalServerSocket;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iput-object v3, p0, Lcom/cosmos/photon/push/channel/inner/ServerSWorker$ServerThread;->server:Landroid/net/LocalServerSocket;

    .line 19
    .line 20
    new-instance v3, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object v2, p0, Lcom/cosmos/photon/push/channel/inner/ServerSWorker$ServerThread;->this$0:Lcom/cosmos/photon/push/channel/inner/ServerSWorker;

    .line 26
    .line 27
    invoke-static {v2}, Lcom/cosmos/photon/push/channel/inner/ServerSWorker;->access$000(Lcom/cosmos/photon/push/channel/inner/ServerSWorker;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-static {v1, v2}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    iget-boolean v2, p0, Lcom/cosmos/photon/push/channel/inner/ServerSWorker$ServerThread;->isRunning:Z

    .line 42
    .line 43
    if-eqz v2, :cond_1

    .line 44
    .line 45
    iget-object v2, p0, Lcom/cosmos/photon/push/channel/inner/ServerSWorker$ServerThread;->server:Landroid/net/LocalServerSocket;

    .line 46
    .line 47
    invoke-virtual {v2}, Landroid/net/LocalServerSocket;->accept()Landroid/net/LocalSocket;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-direct {p0, v2}, Lcom/cosmos/photon/push/channel/inner/ServerSWorker$ServerThread;->processConnect(Landroid/net/LocalSocket;)I

    .line 52
    .line 53
    .line 54
    move-result v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    const/16 v3, 0x190

    .line 56
    .line 57
    if-ne v2, v3, :cond_0

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :catchall_0
    move-exception v2

    .line 61
    goto :goto_5

    .line 62
    :catch_0
    move-exception v2

    .line 63
    goto :goto_3

    .line 64
    :cond_1
    :goto_0
    iget-object v2, p0, Lcom/cosmos/photon/push/channel/inner/ServerSWorker$ServerThread;->server:Landroid/net/LocalServerSocket;

    .line 65
    .line 66
    if-eqz v2, :cond_2

    .line 67
    .line 68
    :try_start_1
    iget-object p0, p0, Lcom/cosmos/photon/push/channel/inner/ServerSWorker$ServerThread;->server:Landroid/net/LocalServerSocket;

    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/net/LocalServerSocket;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 71
    .line 72
    .line 73
    goto :goto_2

    .line 74
    :catch_1
    move-exception p0

    .line 75
    :goto_1
    invoke-static {v1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 76
    .line 77
    .line 78
    :cond_2
    :goto_2
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    goto :goto_4

    .line 82
    :goto_3
    :try_start_2
    invoke-static {v1, v2}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 83
    .line 84
    .line 85
    iget-object v2, p0, Lcom/cosmos/photon/push/channel/inner/ServerSWorker$ServerThread;->server:Landroid/net/LocalServerSocket;

    .line 86
    .line 87
    if-eqz v2, :cond_2

    .line 88
    .line 89
    :try_start_3
    iget-object p0, p0, Lcom/cosmos/photon/push/channel/inner/ServerSWorker$ServerThread;->server:Landroid/net/LocalServerSocket;

    .line 90
    .line 91
    invoke-virtual {p0}, Landroid/net/LocalServerSocket;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 92
    .line 93
    .line 94
    goto :goto_2

    .line 95
    :catch_2
    move-exception p0

    .line 96
    goto :goto_1

    .line 97
    :goto_4
    return-void

    .line 98
    :goto_5
    iget-object v3, p0, Lcom/cosmos/photon/push/channel/inner/ServerSWorker$ServerThread;->server:Landroid/net/LocalServerSocket;

    .line 99
    .line 100
    if-eqz v3, :cond_3

    .line 101
    .line 102
    :try_start_4
    iget-object p0, p0, Lcom/cosmos/photon/push/channel/inner/ServerSWorker$ServerThread;->server:Landroid/net/LocalServerSocket;

    .line 103
    .line 104
    invoke-virtual {p0}, Landroid/net/LocalServerSocket;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 105
    .line 106
    .line 107
    goto :goto_6

    .line 108
    :catch_3
    move-exception p0

    .line 109
    invoke-static {v1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 110
    .line 111
    .line 112
    :cond_3
    :goto_6
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    throw v2
.end method
