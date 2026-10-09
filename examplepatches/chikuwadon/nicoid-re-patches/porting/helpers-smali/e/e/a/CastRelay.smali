.class public final Le/e/a/CastRelay;
.super Ljava/lang/Object;
.source "CastRelay.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/CastRelay$Session;
    }
.end annotation


# static fields
.field private static final active:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Le/e/a/CastRelay$Session;",
            ">;"
        }
    .end annotation
.end field

.field private static final pending:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Le/e/a/CastRelay$Session;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 12
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Le/e/a/CastRelay;->pending:Ljava/util/Map;

    .line 13
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Le/e/a/CastRelay;->active:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/net/Socket;)V
    .registers 1
    .param p0, "x0"    # Ljava/net/Socket;

    .line 10
    invoke-static {p0}, Le/e/a/CastRelay;->closeSocket(Ljava/net/Socket;)V

    return-void
.end method

.method static synthetic access$100(Ljava/io/BufferedReader;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Ljava/io/BufferedReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    invoke-static {p0}, Le/e/a/CastRelay;->line(Ljava/io/BufferedReader;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Ljava/io/OutputStream;ILjava/lang/String;J)V
    .registers 5
    .param p0, "x0"    # Ljava/io/OutputStream;
    .param p1, "x1"    # I
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    invoke-static {p0, p1, p2, p3, p4}, Le/e/a/CastRelay;->response(Ljava/io/OutputStream;ILjava/lang/String;J)V

    return-void
.end method

.method static synthetic access$300(Ljava/io/InputStream;)[B
    .registers 2
    .param p0, "x0"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    invoke-static {p0}, Le/e/a/CastRelay;->readPlaylist(Ljava/io/InputStream;)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Ljava/io/OutputStream;ILjava/lang/String;J)V
    .registers 5
    .param p0, "x0"    # Ljava/io/OutputStream;
    .param p1, "x1"    # I
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    invoke-static {p0, p1, p2, p3, p4}, Le/e/a/CastRelay;->responseStart(Ljava/io/OutputStream;ILjava/lang/String;J)V

    return-void
.end method

.method static synthetic access$500(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p0, "x0"    # Ljava/io/OutputStream;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    invoke-static {p0, p1, p2}, Le/e/a/CastRelay;->header(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static attach(Ljava/lang/Object;)V
    .registers 9
    .param p0, "callback"    # Ljava/lang/Object;

    .line 25
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "a"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 26
    .local v0, "service":Ljava/lang/Object;
    sget-object v1, Le/e/a/CastRelay;->pending:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/CastRelay$Session;

    .line 27
    .local v1, "session":Le/e/a/CastRelay$Session;
    if-nez v1, :cond_19

    return-void

    .line 28
    :cond_19
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "n"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_27} :catch_95

    .line 30
    .local v2, "server":Ljava/lang/Object;
    :try_start_27
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "i"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 31
    .local v3, "base":Ljava/lang/String;
    if-eqz v3, :cond_83

    const-string v4, "http://"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_83

    .line 32
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "/+$"

    const-string v6, ""

    invoke-virtual {v3, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v1, Le/e/a/CastRelay$Session;->hls:Le/e/a/CastHls;

    iget-object v6, v1, Le/e/a/CastRelay$Session;->master:Ljava/net/URL;

    invoke-virtual {v5, v6}, Le/e/a/CastHls;->route(Ljava/net/URL;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 33
    .local v4, "url":Ljava/lang/String;
    sget-object v5, Le/e/a/CastRelay;->active:Ljava/util/Map;

    invoke-interface {v5, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Le/e/a/CastRelay$Session;

    .local v5, "old":Le/e/a/CastRelay$Session;
    if-eqz v5, :cond_6f

    invoke-virtual {v5}, Le/e/a/CastRelay$Session;->close()V

    .line 34
    :cond_6f
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    const-string v7, "j"

    invoke-virtual {v6, v7}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    invoke-virtual {v6, v0, v4}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 35
    const-string v6, "Cast: authenticated HLS relay attached"

    invoke-static {v6}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    .line 36
    .end local v3    # "base":Ljava/lang/String;
    .end local v4    # "url":Ljava/lang/String;
    .end local v5    # "old":Le/e/a/CastRelay$Session;
    nop

    .line 37
    .end local v0    # "service":Ljava/lang/Object;
    .end local v1    # "session":Le/e/a/CastRelay$Session;
    .end local v2    # "server":Ljava/lang/Object;
    goto :goto_99

    .line 31
    .restart local v0    # "service":Ljava/lang/Object;
    .restart local v1    # "session":Le/e/a/CastRelay$Session;
    .restart local v2    # "server":Ljava/lang/Object;
    .restart local v3    # "base":Ljava/lang/String;
    :cond_83
    new-instance v4, Ljava/io/IOException;

    const-string v5, "No local Cast address"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v0    # "service":Ljava/lang/Object;
    .end local v1    # "session":Le/e/a/CastRelay$Session;
    .end local v2    # "server":Ljava/lang/Object;
    .end local p0    # "callback":Ljava/lang/Object;
    throw v4
    :try_end_8b
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_8b} :catch_8b

    .line 36
    .end local v3    # "base":Ljava/lang/String;
    .restart local v0    # "service":Ljava/lang/Object;
    .restart local v1    # "session":Le/e/a/CastRelay$Session;
    .restart local v2    # "server":Ljava/lang/Object;
    .restart local p0    # "callback":Ljava/lang/Object;
    :catch_8b
    move-exception v3

    .local v3, "error":Ljava/lang/Exception;
    :try_start_8c
    sget-object v4, Le/e/a/CastRelay;->active:Ljava/util/Map;

    invoke-interface {v4, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1}, Le/e/a/CastRelay$Session;->close()V

    .end local p0    # "callback":Ljava/lang/Object;
    throw v3
    :try_end_95
    .catch Ljava/lang/Exception; {:try_start_8c .. :try_end_95} :catch_95

    .line 37
    .end local v0    # "service":Ljava/lang/Object;
    .end local v1    # "session":Le/e/a/CastRelay$Session;
    .end local v2    # "server":Ljava/lang/Object;
    .end local v3    # "error":Ljava/lang/Exception;
    .restart local p0    # "callback":Ljava/lang/Object;
    :catch_95
    move-exception v0

    .local v0, "error":Ljava/lang/Exception;
    invoke-static {v0}, Le/e/a/CastRelay;->failed(Ljava/lang/Throwable;)V

    .line 38
    .end local v0    # "error":Ljava/lang/Exception;
    :goto_99
    return-void
.end method

.method private static closeSocket(Ljava/net/Socket;)V
    .registers 2
    .param p0, "socket"    # Ljava/net/Socket;

    .line 214
    :try_start_0
    invoke-virtual {p0}, Ljava/net/Socket;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    goto :goto_5

    :catch_4
    move-exception v0

    :goto_5
    return-void
.end method

.method public static detach(Ljava/lang/Object;)V
    .registers 2
    .param p0, "server"    # Ljava/lang/Object;

    .line 51
    sget-object v0, Le/e/a/CastRelay;->active:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/CastRelay$Session;

    .local v0, "session":Le/e/a/CastRelay$Session;
    if-eqz v0, :cond_d

    invoke-virtual {v0}, Le/e/a/CastRelay$Session;->close()V

    .line 52
    :cond_d
    return-void
.end method

.method public static dispatch(Ljava/lang/Object;Ljava/net/Socket;)Z
    .registers 7
    .param p0, "server"    # Ljava/lang/Object;
    .param p1, "socket"    # Ljava/net/Socket;

    .line 40
    const-string v0, "k"

    sget-object v1, Le/e/a/CastRelay;->active:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/CastRelay$Session;

    .line 41
    .local v1, "session":Le/e/a/CastRelay$Session;
    const/4 v2, 0x0

    if-nez v1, :cond_e

    return v2

    .line 42
    :cond_e
    :try_start_e
    invoke-virtual {v1, p0, p1}, Le/e/a/CastRelay$Session;->accept(Ljava/lang/Object;Ljava/net/Socket;)V
    :try_end_11
    .catchall {:try_start_e .. :try_end_11} :catchall_24

    .line 45
    :try_start_11
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V
    :try_end_1c
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_11 .. :try_end_1c} :catch_1d

    .line 46
    goto :goto_22

    :catch_1d
    move-exception v0

    .local v0, "error":Ljava/lang/ReflectiveOperationException;
    invoke-static {v0}, Le/e/a/CastRelay;->failed(Ljava/lang/Throwable;)V

    .line 47
    .end local v0    # "error":Ljava/lang/ReflectiveOperationException;
    nop

    .line 48
    :goto_22
    const/4 v0, 0x1

    return v0

    .line 45
    :catchall_24
    move-exception v3

    :try_start_25
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V
    :try_end_30
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_25 .. :try_end_30} :catch_31

    .line 46
    goto :goto_35

    :catch_31
    move-exception v0

    .restart local v0    # "error":Ljava/lang/ReflectiveOperationException;
    invoke-static {v0}, Le/e/a/CastRelay;->failed(Ljava/lang/Throwable;)V

    .line 47
    .end local v0    # "error":Ljava/lang/ReflectiveOperationException;
    :goto_35
    throw v3
.end method

.method static failed(Ljava/lang/Throwable;)V
    .registers 3
    .param p0, "error"    # Ljava/lang/Throwable;

    .line 53
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Cast relay failed: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    return-void
.end method

.method private static header(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p0, "out"    # Ljava/io/OutputStream;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 211
    if-eqz p2, :cond_38

    const/16 v0, 0xd

    invoke-virtual {p2, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_38

    const/16 v0, 0xa

    invoke-virtual {p2, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_38

    .line 212
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write([B)V

    .line 213
    :cond_38
    return-void
.end method

.method private static line(Ljava/io/BufferedReader;)Ljava/lang/String;
    .registers 5
    .param p0, "in"    # Ljava/io/BufferedReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 190
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 191
    .local v0, "text":Ljava/lang/StringBuilder;
    :goto_5
    invoke-virtual {p0}, Ljava/io/BufferedReader;->read()I

    move-result v1

    move v2, v1

    .local v2, "c":I
    const/4 v3, -0x1

    if-eq v1, v3, :cond_2f

    .line 192
    const/16 v1, 0xa

    if-ne v2, v1, :cond_16

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 193
    :cond_16
    const/16 v1, 0xd

    if-eq v2, v1, :cond_1e

    int-to-char v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 194
    :cond_1e
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    const/16 v3, 0x2000

    if-gt v1, v3, :cond_27

    goto :goto_5

    :cond_27
    new-instance v1, Ljava/io/IOException;

    const-string v3, "Oversized Cast header"

    invoke-direct {v1, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 196
    .end local v2    # "c":I
    :cond_2f
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-nez v1, :cond_37

    const/4 v1, 0x0

    goto :goto_3b

    :cond_37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_3b
    return-object v1
.end method

.method public static prepare(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 8
    .param p0, "callback"    # Ljava/lang/Object;
    .param p1, "url"    # Ljava/lang/String;

    .line 16
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "a"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 17
    .local v0, "service":Ljava/lang/Object;
    sget-object v1, Le/e/a/CastRelay;->pending:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/CastRelay$Session;

    .local v1, "old":Le/e/a/CastRelay$Session;
    if-eqz v1, :cond_1b

    invoke-virtual {v1}, Le/e/a/CastRelay$Session;->close()V

    .line 18
    :cond_1b
    if-eqz p1, :cond_53

    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v2

    const-string v3, ".m3u8"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2f

    goto :goto_53

    .line 19
    :cond_2f
    const-string v2, "e.e.a.ModernPlayback"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const-string v3, "domandCookie"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 20
    .local v2, "cookie":Ljava/lang/String;
    sget-object v3, Le/e/a/CastRelay;->pending:Ljava/util/Map;

    new-instance v4, Le/e/a/CastRelay$Session;

    new-instance v5, Ljava/net/URL;

    invoke-direct {v5, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-direct {v4, v5, v2}, Le/e/a/CastRelay$Session;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    invoke-interface {v3, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_51
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_51} :catch_54

    .line 21
    nop

    .end local v0    # "service":Ljava/lang/Object;
    .end local v1    # "old":Le/e/a/CastRelay$Session;
    .end local v2    # "cookie":Ljava/lang/String;
    goto :goto_58

    .line 18
    .restart local v0    # "service":Ljava/lang/Object;
    .restart local v1    # "old":Le/e/a/CastRelay$Session;
    :cond_53
    :goto_53
    return-void

    .line 21
    .end local v0    # "service":Ljava/lang/Object;
    .end local v1    # "old":Le/e/a/CastRelay$Session;
    :catch_54
    move-exception v0

    .local v0, "error":Ljava/lang/Exception;
    invoke-static {v0}, Le/e/a/CastRelay;->failed(Ljava/lang/Throwable;)V

    .line 22
    .end local v0    # "error":Ljava/lang/Exception;
    :goto_58
    return-void
.end method

.method private static readPlaylist(Ljava/io/InputStream;)[B
    .registers 6
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 182
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .local v0, "body":Ljava/io/ByteArrayOutputStream;
    const/16 v1, 0x2000

    new-array v1, v1, [B

    .line 183
    .local v1, "buffer":[B
    :goto_9
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    move v3, v2

    .local v3, "n":I
    const/4 v4, -0x1

    if-eq v2, v4, :cond_27

    .line 184
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v2

    add-int/2addr v2, v3

    const/high16 v4, 0x200000

    if-gt v2, v4, :cond_1f

    .line 185
    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_9

    .line 184
    :cond_1f
    new-instance v2, Ljava/io/IOException;

    const-string v4, "Oversized HLS playlist"

    invoke-direct {v2, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 187
    .end local v3    # "n":I
    :cond_27
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    return-object v2
.end method

.method private static response(Ljava/io/OutputStream;ILjava/lang/String;J)V
    .registers 7
    .param p0, "out"    # Ljava/io/OutputStream;
    .param p1, "status"    # I
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "length"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 208
    invoke-static {p0, p1, p2, p3, p4}, Le/e/a/CastRelay;->responseStart(Ljava/io/OutputStream;ILjava/lang/String;J)V

    const-string v0, "\r\n"

    sget-object v1, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write([B)V

    invoke-virtual {p0}, Ljava/io/OutputStream;->flush()V

    .line 209
    return-void
.end method

.method private static responseStart(Ljava/io/OutputStream;ILjava/lang/String;J)V
    .registers 8
    .param p0, "out"    # Ljava/io/OutputStream;
    .param p1, "status"    # I
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "length"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 199
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "HTTP/1.1 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " Response\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write([B)V

    .line 200
    const-string v0, "Connection"

    const-string v1, "close"

    invoke-static {p0, v0, v1}, Le/e/a/CastRelay;->header(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "Access-Control-Allow-Origin"

    const-string v1, "*"

    invoke-static {p0, v0, v1}, Le/e/a/CastRelay;->header(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V

    .line 201
    const-string v0, "Access-Control-Allow-Methods"

    const-string v1, "GET, HEAD, OPTIONS"

    invoke-static {p0, v0, v1}, Le/e/a/CastRelay;->header(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    const-string v0, "Access-Control-Allow-Headers"

    const-string v1, "Range"

    invoke-static {p0, v0, v1}, Le/e/a/CastRelay;->header(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    const-string v0, "Access-Control-Expose-Headers"

    const-string v1, "Content-Length, Content-Range, Accept-Ranges"

    invoke-static {p0, v0, v1}, Le/e/a/CastRelay;->header(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V

    .line 204
    const-string v0, "Cache-Control"

    const-string v1, "no-store"

    invoke-static {p0, v0, v1}, Le/e/a/CastRelay;->header(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "Content-Type"

    invoke-static {p0, v0, p2}, Le/e/a/CastRelay;->header(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V

    .line 205
    const-wide/16 v0, 0x0

    cmp-long v2, p3, v0

    if-ltz v2, :cond_60

    const-string v0, "Content-Length"

    invoke-static {p3, p4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Le/e/a/CastRelay;->header(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    :cond_60
    return-void
.end method
