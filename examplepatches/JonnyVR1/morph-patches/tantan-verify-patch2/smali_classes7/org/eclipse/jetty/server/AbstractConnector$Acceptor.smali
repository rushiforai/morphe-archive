.class Lorg/eclipse/jetty/server/AbstractConnector$Acceptor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/server/AbstractConnector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Acceptor"
.end annotation


# instance fields
.field _acceptor:I

.field final synthetic this$0:Lorg/eclipse/jetty/server/AbstractConnector;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/server/AbstractConnector;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/AbstractConnector$Acceptor;->this$0:Lorg/eclipse/jetty/server/AbstractConnector;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p2, p0, Lorg/eclipse/jetty/server/AbstractConnector$Acceptor;->_acceptor:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lorg/eclipse/jetty/server/AbstractConnector$Acceptor;->this$0:Lorg/eclipse/jetty/server/AbstractConnector;

    .line 6
    .line 7
    monitor-enter v1

    .line 8
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jetty/server/AbstractConnector$Acceptor;->this$0:Lorg/eclipse/jetty/server/AbstractConnector;

    .line 9
    .line 10
    invoke-static {v2}, Lorg/eclipse/jetty/server/AbstractConnector;->access$000(Lorg/eclipse/jetty/server/AbstractConnector;)[Ljava/lang/Thread;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    if-nez v2, :cond_0

    .line 15
    .line 16
    monitor-exit v1

    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto/16 :goto_a

    .line 20
    .line 21
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jetty/server/AbstractConnector$Acceptor;->this$0:Lorg/eclipse/jetty/server/AbstractConnector;

    .line 22
    .line 23
    invoke-static {v2}, Lorg/eclipse/jetty/server/AbstractConnector;->access$000(Lorg/eclipse/jetty/server/AbstractConnector;)[Ljava/lang/Thread;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    iget v3, p0, Lorg/eclipse/jetty/server/AbstractConnector$Acceptor;->_acceptor:I

    .line 28
    .line 29
    aput-object v0, v2, v3

    .line 30
    .line 31
    iget-object v2, p0, Lorg/eclipse/jetty/server/AbstractConnector$Acceptor;->this$0:Lorg/eclipse/jetty/server/AbstractConnector;

    .line 32
    .line 33
    invoke-static {v2}, Lorg/eclipse/jetty/server/AbstractConnector;->access$000(Lorg/eclipse/jetty/server/AbstractConnector;)[Ljava/lang/Thread;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    iget v3, p0, Lorg/eclipse/jetty/server/AbstractConnector$Acceptor;->_acceptor:I

    .line 38
    .line 39
    aget-object v2, v2, v3

    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    new-instance v3, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v4, " Acceptor"

    .line 54
    .line 55
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget v4, p0, Lorg/eclipse/jetty/server/AbstractConnector$Acceptor;->_acceptor:I

    .line 59
    .line 60
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v4, " "

    .line 64
    .line 65
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-object v4, p0, Lorg/eclipse/jetty/server/AbstractConnector$Acceptor;->this$0:Lorg/eclipse/jetty/server/AbstractConnector;

    .line 69
    .line 70
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-virtual {v0, v3}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    invoke-virtual {v0}, Ljava/lang/Thread;->getPriority()I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    const/4 v3, 0x0

    .line 86
    :try_start_1
    iget-object v4, p0, Lorg/eclipse/jetty/server/AbstractConnector$Acceptor;->this$0:Lorg/eclipse/jetty/server/AbstractConnector;

    .line 87
    .line 88
    invoke-static {v4}, Lorg/eclipse/jetty/server/AbstractConnector;->access$100(Lorg/eclipse/jetty/server/AbstractConnector;)I

    .line 89
    .line 90
    .line 91
    move-result v4

    .line 92
    sub-int v4, v1, v4

    .line 93
    .line 94
    invoke-virtual {v0, v4}, Ljava/lang/Thread;->setPriority(I)V

    .line 95
    .line 96
    .line 97
    :goto_0
    iget-object v4, p0, Lorg/eclipse/jetty/server/AbstractConnector$Acceptor;->this$0:Lorg/eclipse/jetty/server/AbstractConnector;

    .line 98
    .line 99
    invoke-virtual {v4}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->isRunning()Z

    .line 100
    .line 101
    .line 102
    move-result v4

    .line 103
    if-eqz v4, :cond_1

    .line 104
    .line 105
    iget-object v4, p0, Lorg/eclipse/jetty/server/AbstractConnector$Acceptor;->this$0:Lorg/eclipse/jetty/server/AbstractConnector;

    .line 106
    .line 107
    invoke-interface {v4}, Lorg/eclipse/jetty/server/Connector;->getConnection()Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 111
    if-eqz v4, :cond_1

    .line 112
    .line 113
    :try_start_2
    iget-object v4, p0, Lorg/eclipse/jetty/server/AbstractConnector$Acceptor;->this$0:Lorg/eclipse/jetty/server/AbstractConnector;

    .line 114
    .line 115
    iget v5, p0, Lorg/eclipse/jetty/server/AbstractConnector$Acceptor;->_acceptor:I

    .line 116
    .line 117
    invoke-virtual {v4, v5}, Lorg/eclipse/jetty/server/AbstractConnector;->accept(I)V
    :try_end_2
    .catch Lorg/eclipse/jetty/io/EofException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 118
    .line 119
    .line 120
    goto :goto_0

    .line 121
    :catchall_1
    move-exception v4

    .line 122
    goto :goto_1

    .line 123
    :catch_0
    move-exception v4

    .line 124
    goto :goto_2

    .line 125
    :catch_1
    move-exception v4

    .line 126
    goto :goto_3

    .line 127
    :catch_2
    move-exception v4

    .line 128
    goto :goto_4

    .line 129
    :goto_1
    :try_start_3
    invoke-static {}, Lorg/eclipse/jetty/server/AbstractConnector;->access$200()Lorg/eclipse/jetty/util/log/Logger;

    .line 130
    .line 131
    .line 132
    move-result-object v5

    .line 133
    invoke-interface {v5, v4}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/Throwable;)V

    .line 134
    .line 135
    .line 136
    goto :goto_0

    .line 137
    :catchall_2
    move-exception v4

    .line 138
    goto :goto_7

    .line 139
    :goto_2
    invoke-static {}, Lorg/eclipse/jetty/server/AbstractConnector;->access$200()Lorg/eclipse/jetty/util/log/Logger;

    .line 140
    .line 141
    .line 142
    move-result-object v5

    .line 143
    invoke-interface {v5, v4}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V

    .line 144
    .line 145
    .line 146
    goto :goto_0

    .line 147
    :goto_3
    invoke-static {}, Lorg/eclipse/jetty/server/AbstractConnector;->access$200()Lorg/eclipse/jetty/util/log/Logger;

    .line 148
    .line 149
    .line 150
    move-result-object v5

    .line 151
    invoke-interface {v5, v4}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V

    .line 152
    .line 153
    .line 154
    goto :goto_0

    .line 155
    :goto_4
    invoke-static {}, Lorg/eclipse/jetty/server/AbstractConnector;->access$200()Lorg/eclipse/jetty/util/log/Logger;

    .line 156
    .line 157
    .line 158
    move-result-object v5

    .line 159
    invoke-interface {v5, v4}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 160
    .line 161
    .line 162
    goto :goto_0

    .line 163
    :cond_1
    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v0, v2}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    iget-object v4, p0, Lorg/eclipse/jetty/server/AbstractConnector$Acceptor;->this$0:Lorg/eclipse/jetty/server/AbstractConnector;

    .line 170
    .line 171
    monitor-enter v4

    .line 172
    :try_start_4
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractConnector$Acceptor;->this$0:Lorg/eclipse/jetty/server/AbstractConnector;

    .line 173
    .line 174
    invoke-static {v0}, Lorg/eclipse/jetty/server/AbstractConnector;->access$000(Lorg/eclipse/jetty/server/AbstractConnector;)[Ljava/lang/Thread;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    if-eqz v0, :cond_2

    .line 179
    .line 180
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractConnector$Acceptor;->this$0:Lorg/eclipse/jetty/server/AbstractConnector;

    .line 181
    .line 182
    invoke-static {v0}, Lorg/eclipse/jetty/server/AbstractConnector;->access$000(Lorg/eclipse/jetty/server/AbstractConnector;)[Ljava/lang/Thread;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    iget p0, p0, Lorg/eclipse/jetty/server/AbstractConnector$Acceptor;->_acceptor:I

    .line 187
    .line 188
    aput-object v3, v0, p0

    .line 189
    .line 190
    goto :goto_5

    .line 191
    :catchall_3
    move-exception p0

    .line 192
    goto :goto_6

    .line 193
    :cond_2
    :goto_5
    monitor-exit v4

    .line 194
    return-void

    .line 195
    :goto_6
    monitor-exit v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 196
    throw p0

    .line 197
    :goto_7
    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {v0, v2}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    iget-object v0, p0, Lorg/eclipse/jetty/server/AbstractConnector$Acceptor;->this$0:Lorg/eclipse/jetty/server/AbstractConnector;

    .line 204
    .line 205
    monitor-enter v0

    .line 206
    :try_start_5
    iget-object v1, p0, Lorg/eclipse/jetty/server/AbstractConnector$Acceptor;->this$0:Lorg/eclipse/jetty/server/AbstractConnector;

    .line 207
    .line 208
    invoke-static {v1}, Lorg/eclipse/jetty/server/AbstractConnector;->access$000(Lorg/eclipse/jetty/server/AbstractConnector;)[Ljava/lang/Thread;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    if-eqz v1, :cond_3

    .line 213
    .line 214
    iget-object v1, p0, Lorg/eclipse/jetty/server/AbstractConnector$Acceptor;->this$0:Lorg/eclipse/jetty/server/AbstractConnector;

    .line 215
    .line 216
    invoke-static {v1}, Lorg/eclipse/jetty/server/AbstractConnector;->access$000(Lorg/eclipse/jetty/server/AbstractConnector;)[Ljava/lang/Thread;

    .line 217
    .line 218
    .line 219
    move-result-object v1

    .line 220
    iget p0, p0, Lorg/eclipse/jetty/server/AbstractConnector$Acceptor;->_acceptor:I

    .line 221
    .line 222
    aput-object v3, v1, p0

    .line 223
    .line 224
    goto :goto_8

    .line 225
    :catchall_4
    move-exception p0

    .line 226
    goto :goto_9

    .line 227
    :cond_3
    :goto_8
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 228
    throw v4

    .line 229
    :goto_9
    :try_start_6
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 230
    throw p0

    .line 231
    :goto_a
    :try_start_7
    monitor-exit v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 232
    throw p0
.end method
