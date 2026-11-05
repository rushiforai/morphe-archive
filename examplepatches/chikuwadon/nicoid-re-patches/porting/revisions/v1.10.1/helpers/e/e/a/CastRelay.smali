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

.method static synthetic access$0(Ljava/io/OutputStream;ILjava/lang/String;J)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 219
    invoke-static {p0, p1, p2, p3, p4}, Le/e/a/CastRelay;->response(Ljava/io/OutputStream;ILjava/lang/String;J)V

    return-void
.end method

.method static synthetic access$1(Ljava/net/Socket;)V
    .registers 1

    .line 226
    invoke-static {p0}, Le/e/a/CastRelay;->closeSocket(Ljava/net/Socket;)V

    return-void
.end method

.method static synthetic access$2(Ljava/io/BufferedReader;)Ljava/lang/String;
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 201
    invoke-static {p0}, Le/e/a/CastRelay;->line(Ljava/io/BufferedReader;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$3(Ljava/io/InputStream;)[B
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 193
    invoke-static {p0}, Le/e/a/CastRelay;->readPlaylist(Ljava/io/InputStream;)[B

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$4(Ljava/io/OutputStream;ILjava/lang/String;J)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 210
    invoke-static {p0, p1, p2, p3, p4}, Le/e/a/CastRelay;->responseStart(Ljava/io/OutputStream;ILjava/lang/String;J)V

    return-void
.end method

.method static synthetic access$5(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 222
    invoke-static {p0, p1, p2}, Le/e/a/CastRelay;->header(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static attach(Ljava/lang/Object;)V
    .registers 12

    .line 25
    const-string v0, "i"

    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "a"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 26
    sget-object v1, Le/e/a/CastRelay;->pending:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/CastRelay$Session;

    if-nez v1, :cond_1b

    return-void

    .line 28
    :cond_1b
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "n"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_29} :catch_ce

    .line 30
    :try_start_29
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 31
    const-string v4, "e.e.a.CastAddress194"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const-string v5, "resolve"

    const/4 v6, 0x2

    new-array v7, v6, [Ljava/lang/Class;

    const-class v8, Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v8, v7, v9

    const-class v8, Ljava/lang/String;

    const/4 v10, 0x1

    aput-object v8, v7, v10

    invoke-virtual {v4, v5, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    new-array v5, v6, [Ljava/lang/Object;

    aput-object p0, v5, v9

    aput-object v3, v5, v10

    const/4 v3, 0x0

    invoke-virtual {v4, v3, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 32
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "/+$"

    const-string v6, ""

    invoke-virtual {v3, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, v1, Le/e/a/CastRelay$Session;->hls:Le/e/a/CastHls;

    iget-object v6, v1, Le/e/a/CastRelay$Session;->master:Ljava/net/URL;

    invoke-virtual {v5, v6}, Le/e/a/CastHls;->route(Ljava/net/URL;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 33
    sget-object v5, Le/e/a/CastRelay;->active:Ljava/util/Map;

    invoke-interface {v5, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Le/e/a/CastRelay$Session;

    if-eqz v5, :cond_8a

    invoke-virtual {v5}, Le/e/a/CastRelay$Session;->close()V

    .line 34
    :cond_8a
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 35
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v3, "j"

    invoke-virtual {v0, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0, v4}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 36
    const-string p0, "Cast: authenticated HLS relay attached"

    invoke-static {p0}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    .line 37
    iget-object p0, v1, Le/e/a/CastRelay$Session;->diagnostics:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v0, Le/e/a/CastRelay$$ExternalSyntheticLambda0;

    invoke-direct {v0, v1}, Le/e/a/CastRelay$$ExternalSyntheticLambda0;-><init>(Le/e/a/CastRelay$Session;)V

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v4, 0xf

    invoke-interface {p0, v0, v4, v5, v3}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 38
    iget-object p0, v1, Le/e/a/CastRelay$Session;->diagnostics:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v0, Le/e/a/CastRelay$$ExternalSyntheticLambda1;

    invoke-direct {v0, v1}, Le/e/a/CastRelay$$ExternalSyntheticLambda1;-><init>(Le/e/a/CastRelay$Session;)V

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v4, 0x2d

    invoke-interface {p0, v0, v4, v5, v3}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;
    :try_end_c3
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_c3} :catch_c4

    goto :goto_d2

    :catch_c4
    move-exception p0

    .line 39
    :try_start_c5
    sget-object v0, Le/e/a/CastRelay;->active:Ljava/util/Map;

    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1}, Le/e/a/CastRelay$Session;->close()V

    throw p0
    :try_end_ce
    .catch Ljava/lang/Exception; {:try_start_c5 .. :try_end_ce} :catch_ce

    :catch_ce
    move-exception p0

    .line 40
    invoke-static {p0}, Le/e/a/CastRelay;->failed(Ljava/lang/Throwable;)V

    :goto_d2
    return-void
.end method

.method private static closeSocket(Ljava/net/Socket;)V
    .registers 1

    .line 226
    :try_start_0
    invoke-virtual {p0}, Ljava/net/Socket;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_3

    :catch_3
    return-void
.end method

.method public static detach(Ljava/lang/Object;)V
    .registers 2

    .line 54
    sget-object v0, Le/e/a/CastRelay;->active:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/CastRelay$Session;

    if-eqz p0, :cond_d

    invoke-virtual {p0}, Le/e/a/CastRelay$Session;->close()V

    :cond_d
    return-void
.end method

.method public static dispatch(Ljava/lang/Object;Ljava/net/Socket;)Z
    .registers 5

    .line 43
    const-string v0, "k"

    sget-object v1, Le/e/a/CastRelay;->active:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/CastRelay$Session;

    const/4 v2, 0x0

    if-nez v1, :cond_e

    return v2

    .line 45
    :cond_e
    :try_start_e
    invoke-virtual {v1, p0, p1}, Le/e/a/CastRelay$Session;->accept(Ljava/lang/Object;Ljava/net/Socket;)V
    :try_end_11
    .catchall {:try_start_e .. :try_end_11} :catchall_23

    .line 48
    :try_start_11
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0, v2}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V
    :try_end_1c
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_11 .. :try_end_1c} :catch_1d

    goto :goto_21

    :catch_1d
    move-exception p0

    .line 49
    invoke-static {p0}, Le/e/a/CastRelay;->failed(Ljava/lang/Throwable;)V

    :goto_21
    const/4 p0, 0x1

    return p0

    :catchall_23
    move-exception p1

    .line 48
    :try_start_24
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0, v2}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V
    :try_end_2f
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_24 .. :try_end_2f} :catch_30

    goto :goto_34

    :catch_30
    move-exception p0

    .line 49
    invoke-static {p0}, Le/e/a/CastRelay;->failed(Ljava/lang/Throwable;)V

    .line 50
    :goto_34
    throw p1
.end method

.method static failed(Ljava/lang/Throwable;)V
    .registers 3

    .line 56
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Cast relay failed: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    return-void
.end method

.method private static header(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p2, :cond_35

    const/16 v0, 0xd

    .line 223
    invoke-virtual {p2, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_35

    const/16 v0, 0xa

    invoke-virtual {p2, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_35

    .line 224
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p1, ": "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\r\n"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object p2, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {p1, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write([B)V

    :cond_35
    return-void
.end method

.method static synthetic lambda$0(Le/e/a/CastRelay$Session;)V
    .registers 2

    .line 37
    const-string v0, "15s"

    invoke-virtual {p0, v0}, Le/e/a/CastRelay$Session;->summary(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$1(Le/e/a/CastRelay$Session;)V
    .registers 2

    .line 38
    const-string v0, "45s"

    invoke-virtual {p0, v0}, Le/e/a/CastRelay$Session;->summary(Ljava/lang/String;)V

    return-void
.end method

.method private static line(Ljava/io/BufferedReader;)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 202
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 203
    :goto_5
    invoke-virtual {p0}, Ljava/io/BufferedReader;->read()I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_19

    .line 208
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p0

    if-nez p0, :cond_14

    const/4 p0, 0x0

    goto :goto_18

    :cond_14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_18
    return-object p0

    :cond_19
    const/16 v2, 0xa

    if-ne v1, v2, :cond_22

    .line 204
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_22
    const/16 v2, 0xd

    if-eq v1, v2, :cond_2a

    int-to-char v1, v1

    .line 205
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 206
    :cond_2a
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    const/16 v2, 0x2000

    if-gt v1, v2, :cond_33

    goto :goto_5

    :cond_33
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Oversized Cast header"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static prepare(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 6

    .line 16
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "a"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 17
    sget-object v0, Le/e/a/CastRelay;->pending:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/CastRelay$Session;

    if-eqz v1, :cond_1b

    invoke-virtual {v1}, Le/e/a/CastRelay$Session;->close()V

    :cond_1b
    if-eqz p1, :cond_50

    .line 18
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v1

    const-string v2, ".m3u8"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2f

    goto :goto_50

    .line 19
    :cond_2f
    const-string v1, "e.e.a.ModernPlayback"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "domandCookie"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 20
    new-instance v2, Le/e/a/CastRelay$Session;

    new-instance v3, Ljava/net/URL;

    invoke-direct {v3, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3, v1}, Le/e/a/CastRelay$Session;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    invoke-interface {v0, p0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_4f} :catch_51

    goto :goto_55

    :cond_50
    :goto_50
    return-void

    :catch_51
    move-exception p0

    .line 21
    invoke-static {p0}, Le/e/a/CastRelay;->failed(Ljava/lang/Throwable;)V

    :goto_55
    return-void
.end method

.method private static readPlaylist(Ljava/io/InputStream;)[B
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 194
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v1, 0x2000

    new-array v1, v1, [B

    .line 195
    :goto_9
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_15

    .line 199
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    return-object p0

    .line 196
    :cond_15
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v3

    add-int/2addr v3, v2

    const/high16 v4, 0x200000

    if-gt v3, v4, :cond_23

    const/4 v3, 0x0

    .line 197
    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_9

    .line 196
    :cond_23
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Oversized HLS playlist"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static response(Ljava/io/OutputStream;ILjava/lang/String;J)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 220
    invoke-static {p0, p1, p2, p3, p4}, Le/e/a/CastRelay;->responseStart(Ljava/io/OutputStream;ILjava/lang/String;J)V

    const-string p1, "\r\n"

    sget-object p2, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {p1, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write([B)V

    invoke-virtual {p0}, Ljava/io/OutputStream;->flush()V

    return-void
.end method

.method private static responseStart(Ljava/io/OutputStream;ILjava/lang/String;J)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 211
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "HTTP/1.1 "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " Response\r\n"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object v0, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 212
    const-string p1, "Connection"

    const-string v0, "close"

    invoke-static {p0, p1, v0}, Le/e/a/CastRelay;->header(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "Access-Control-Allow-Origin"

    const-string v0, "*"

    invoke-static {p0, p1, v0}, Le/e/a/CastRelay;->header(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V

    .line 213
    const-string p1, "Access-Control-Allow-Methods"

    const-string v0, "GET, HEAD, OPTIONS"

    invoke-static {p0, p1, v0}, Le/e/a/CastRelay;->header(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V

    .line 214
    const-string p1, "Access-Control-Allow-Headers"

    const-string v0, "Range"

    invoke-static {p0, p1, v0}, Le/e/a/CastRelay;->header(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V

    .line 215
    const-string p1, "Access-Control-Expose-Headers"

    const-string v0, "Content-Length, Content-Range, Accept-Ranges"

    invoke-static {p0, p1, v0}, Le/e/a/CastRelay;->header(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V

    .line 216
    const-string p1, "Cache-Control"

    const-string v0, "no-store"

    invoke-static {p0, p1, v0}, Le/e/a/CastRelay;->header(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "Content-Type"

    invoke-static {p0, p1, p2}, Le/e/a/CastRelay;->header(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V

    const-wide/16 p1, 0x0

    cmp-long v0, p3, p1

    if-ltz v0, :cond_5a

    .line 217
    const-string p1, "Content-Length"

    invoke-static {p3, p4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p1, p2}, Le/e/a/CastRelay;->header(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V

    :cond_5a
    return-void
.end method
