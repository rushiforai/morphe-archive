.class Lorg/eclipse/jetty/server/session/JDBCSessionManager$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jetty/server/session/JDBCSessionManager;->loadSession(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/server/session/JDBCSessionManager;

.field final synthetic val$_exception:Ljava/util/concurrent/atomic/AtomicReference;

.field final synthetic val$_reference:Ljava/util/concurrent/atomic/AtomicReference;

.field final synthetic val$canonicalContextPath:Ljava/lang/String;

.field final synthetic val$id:Ljava/lang/String;

.field final synthetic val$vhost:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/server/session/JDBCSessionManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/atomic/AtomicReference;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$1;->this$0:Lorg/eclipse/jetty/server/session/JDBCSessionManager;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$1;->val$id:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$1;->val$canonicalContextPath:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$1;->val$vhost:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p5, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$1;->val$_reference:Ljava/util/concurrent/atomic/AtomicReference;

    .line 10
    .line 11
    iput-object p6, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$1;->val$_exception:Ljava/util/concurrent/atomic/AtomicReference;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    const-string v0, "LOADED session "

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$1;->this$0:Lorg/eclipse/jetty/server/session/JDBCSessionManager;

    .line 5
    .line 6
    invoke-static {v2}, Lorg/eclipse/jetty/server/session/JDBCSessionManager;->access$700(Lorg/eclipse/jetty/server/session/JDBCSessionManager;)Ljava/sql/Connection;

    .line 7
    .line 8
    .line 9
    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 10
    :try_start_1
    iget-object v3, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$1;->this$0:Lorg/eclipse/jetty/server/session/JDBCSessionManager;

    .line 11
    .line 12
    iget-object v3, v3, Lorg/eclipse/jetty/server/session/JDBCSessionManager;->_jdbcSessionIdMgr:Lorg/eclipse/jetty/server/session/JDBCSessionIdManager;

    .line 13
    .line 14
    iget-object v3, v3, Lorg/eclipse/jetty/server/session/JDBCSessionIdManager;->_dbAdaptor:Lorg/eclipse/jetty/server/session/JDBCSessionIdManager$DatabaseAdaptor;

    .line 15
    .line 16
    iget-object v4, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$1;->val$id:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v5, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$1;->val$canonicalContextPath:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v6, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$1;->val$vhost:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v3, v2, v4, v5, v6}, Lorg/eclipse/jetty/server/session/JDBCSessionIdManager$DatabaseAdaptor;->getLoadStatement(Ljava/sql/Connection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/sql/PreparedStatement;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-interface {v3}, Ljava/sql/PreparedStatement;->executeQuery()Ljava/sql/ResultSet;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-interface {v3}, Ljava/sql/ResultSet;->next()Z

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    if-eqz v4, :cond_0

    .line 35
    .line 36
    new-instance v1, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;

    .line 37
    .line 38
    iget-object v4, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$1;->this$0:Lorg/eclipse/jetty/server/session/JDBCSessionManager;

    .line 39
    .line 40
    iget-object v5, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$1;->val$id:Ljava/lang/String;

    .line 41
    .line 42
    invoke-direct {v1, v4, v5}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;-><init>(Lorg/eclipse/jetty/server/session/JDBCSessionManager;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object v4, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$1;->this$0:Lorg/eclipse/jetty/server/session/JDBCSessionManager;

    .line 46
    .line 47
    iget-object v4, v4, Lorg/eclipse/jetty/server/session/JDBCSessionManager;->_jdbcSessionIdMgr:Lorg/eclipse/jetty/server/session/JDBCSessionIdManager;

    .line 48
    .line 49
    iget-object v4, v4, Lorg/eclipse/jetty/server/session/JDBCSessionIdManager;->_sessionTableRowId:Ljava/lang/String;

    .line 50
    .line 51
    invoke-interface {v3, v4}, Ljava/sql/ResultSet;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-virtual {v1, v4}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;->setRowId(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    const-string v4, "cookieTime"

    .line 59
    .line 60
    invoke-interface {v3, v4}, Ljava/sql/ResultSet;->getLong(Ljava/lang/String;)J

    .line 61
    .line 62
    .line 63
    move-result-wide v4

    .line 64
    invoke-virtual {v1, v4, v5}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;->setCookieSet(J)V

    .line 65
    .line 66
    .line 67
    const-string v4, "lastAccessTime"

    .line 68
    .line 69
    invoke-interface {v3, v4}, Ljava/sql/ResultSet;->getLong(Ljava/lang/String;)J

    .line 70
    .line 71
    .line 72
    move-result-wide v4

    .line 73
    invoke-virtual {v1, v4, v5}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;->setLastAccessed(J)V

    .line 74
    .line 75
    .line 76
    const-string v4, "accessTime"

    .line 77
    .line 78
    invoke-interface {v3, v4}, Ljava/sql/ResultSet;->getLong(Ljava/lang/String;)J

    .line 79
    .line 80
    .line 81
    move-result-wide v4

    .line 82
    invoke-virtual {v1, v4, v5}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;->setAccessed(J)V

    .line 83
    .line 84
    .line 85
    const-string v4, "createTime"

    .line 86
    .line 87
    invoke-interface {v3, v4}, Ljava/sql/ResultSet;->getLong(Ljava/lang/String;)J

    .line 88
    .line 89
    .line 90
    move-result-wide v4

    .line 91
    invoke-virtual {v1, v4, v5}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;->setCreated(J)V

    .line 92
    .line 93
    .line 94
    const-string v4, "lastNode"

    .line 95
    .line 96
    invoke-interface {v3, v4}, Ljava/sql/ResultSet;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    invoke-virtual {v1, v4}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;->setLastNode(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    const-string v4, "lastSavedTime"

    .line 104
    .line 105
    invoke-interface {v3, v4}, Ljava/sql/ResultSet;->getLong(Ljava/lang/String;)J

    .line 106
    .line 107
    .line 108
    move-result-wide v4

    .line 109
    invoke-virtual {v1, v4, v5}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;->setLastSaved(J)V

    .line 110
    .line 111
    .line 112
    const-string v4, "expiryTime"

    .line 113
    .line 114
    invoke-interface {v3, v4}, Ljava/sql/ResultSet;->getLong(Ljava/lang/String;)J

    .line 115
    .line 116
    .line 117
    move-result-wide v4

    .line 118
    invoke-virtual {v1, v4, v5}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;->setExpiryTime(J)V

    .line 119
    .line 120
    .line 121
    const-string v4, "contextPath"

    .line 122
    .line 123
    invoke-interface {v3, v4}, Ljava/sql/ResultSet;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v4

    .line 127
    invoke-virtual {v1, v4}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;->setCanonicalContext(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    const-string v4, "virtualHost"

    .line 131
    .line 132
    invoke-interface {v3, v4}, Ljava/sql/ResultSet;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v4

    .line 136
    invoke-virtual {v1, v4}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;->setVirtualHost(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    iget-object v4, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$1;->this$0:Lorg/eclipse/jetty/server/session/JDBCSessionManager;

    .line 140
    .line 141
    invoke-virtual {v4}, Lorg/eclipse/jetty/server/session/AbstractSessionManager;->getSessionIdManager()Lorg/eclipse/jetty/server/SessionIdManager;

    .line 142
    .line 143
    .line 144
    move-result-object v4

    .line 145
    check-cast v4, Lorg/eclipse/jetty/server/session/JDBCSessionIdManager;

    .line 146
    .line 147
    iget-object v4, v4, Lorg/eclipse/jetty/server/session/JDBCSessionIdManager;->_dbAdaptor:Lorg/eclipse/jetty/server/session/JDBCSessionIdManager$DatabaseAdaptor;

    .line 148
    .line 149
    const-string v5, "map"

    .line 150
    .line 151
    invoke-virtual {v4, v3, v5}, Lorg/eclipse/jetty/server/session/JDBCSessionIdManager$DatabaseAdaptor;->getBlobInputStream(Ljava/sql/ResultSet;Ljava/lang/String;)Ljava/io/InputStream;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    new-instance v4, Lorg/eclipse/jetty/server/session/JDBCSessionManager$ClassLoadingObjectInputStream;

    .line 156
    .line 157
    iget-object v5, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$1;->this$0:Lorg/eclipse/jetty/server/session/JDBCSessionManager;

    .line 158
    .line 159
    invoke-direct {v4, v5, v3}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$ClassLoadingObjectInputStream;-><init>(Lorg/eclipse/jetty/server/session/JDBCSessionManager;Ljava/io/InputStream;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v4}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    check-cast v3, Ljava/util/Map;

    .line 167
    .line 168
    invoke-virtual {v1, v3}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;->setAttributeMap(Ljava/util/Map;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 172
    .line 173
    .line 174
    invoke-static {}, Lorg/eclipse/jetty/server/session/JDBCSessionManager;->access$800()Lorg/eclipse/jetty/util/log/Logger;

    .line 175
    .line 176
    .line 177
    move-result-object v3

    .line 178
    invoke-interface {v3}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 179
    .line 180
    .line 181
    move-result v3

    .line 182
    if-eqz v3, :cond_0

    .line 183
    .line 184
    invoke-static {}, Lorg/eclipse/jetty/server/session/JDBCSessionManager;->access$800()Lorg/eclipse/jetty/util/log/Logger;

    .line 185
    .line 186
    .line 187
    move-result-object v3

    .line 188
    new-instance v4, Ljava/lang/StringBuilder;

    .line 189
    .line 190
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    const/4 v4, 0x0

    .line 201
    new-array v4, v4, [Ljava/lang/Object;

    .line 202
    .line 203
    invoke-interface {v3, v0, v4}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 204
    .line 205
    .line 206
    goto :goto_0

    .line 207
    :catchall_0
    move-exception p0

    .line 208
    move-object v1, v2

    .line 209
    goto :goto_3

    .line 210
    :catch_0
    move-exception v0

    .line 211
    move-object v1, v2

    .line 212
    goto :goto_1

    .line 213
    :cond_0
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$1;->val$_reference:Ljava/util/concurrent/atomic/AtomicReference;

    .line 214
    .line 215
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 216
    .line 217
    .line 218
    if-eqz v2, :cond_1

    .line 219
    .line 220
    :try_start_2
    invoke-interface {v2}, Ljava/sql/Connection;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 221
    .line 222
    .line 223
    return-void

    .line 224
    :catch_1
    move-exception p0

    .line 225
    invoke-static {}, Lorg/eclipse/jetty/server/session/JDBCSessionManager;->access$800()Lorg/eclipse/jetty/util/log/Logger;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    invoke-interface {v0, p0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/Throwable;)V

    .line 230
    .line 231
    .line 232
    goto :goto_2

    .line 233
    :catchall_1
    move-exception p0

    .line 234
    goto :goto_3

    .line 235
    :catch_2
    move-exception v0

    .line 236
    :goto_1
    :try_start_3
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$1;->val$_exception:Ljava/util/concurrent/atomic/AtomicReference;

    .line 237
    .line 238
    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 239
    .line 240
    .line 241
    if-eqz v1, :cond_1

    .line 242
    .line 243
    :try_start_4
    invoke-interface {v1}, Ljava/sql/Connection;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 244
    .line 245
    .line 246
    :cond_1
    :goto_2
    return-void

    .line 247
    :goto_3
    if-eqz v1, :cond_2

    .line 248
    .line 249
    :try_start_5
    invoke-interface {v1}, Ljava/sql/Connection;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 250
    .line 251
    .line 252
    goto :goto_4

    .line 253
    :catch_3
    move-exception v0

    .line 254
    invoke-static {}, Lorg/eclipse/jetty/server/session/JDBCSessionManager;->access$800()Lorg/eclipse/jetty/util/log/Logger;

    .line 255
    .line 256
    .line 257
    move-result-object v1

    .line 258
    invoke-interface {v1, v0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/Throwable;)V

    .line 259
    .line 260
    .line 261
    :cond_2
    :goto_4
    throw p0
.end method
