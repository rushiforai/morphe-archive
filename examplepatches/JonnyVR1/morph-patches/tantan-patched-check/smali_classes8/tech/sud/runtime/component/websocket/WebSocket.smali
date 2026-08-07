.class public Ltech/sud/runtime/component/websocket/WebSocket;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltech/sud/runtime/component/websocket/WebSocket$a;
    }
.end annotation


# instance fields
.field public final a:Ljava/lang/String;

.field private b:Ltech/sud/runtime/component/websocket/WebSocket$a;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "SudNative WebSocket"

    .line 5
    .line 6
    iput-object v0, p0, Ltech/sud/runtime/component/websocket/WebSocket;->a:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(J)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ltech/sud/runtime/component/websocket/WebSocket;->onopen(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(JILjava/lang/String;)V
    .locals 0

    .line 5
    invoke-static {p0, p1, p2, p3}, Ltech/sud/runtime/component/websocket/WebSocket;->onclose(JILjava/lang/String;)V

    return-void
.end method

.method public static synthetic a(JLjava/lang/String;)V
    .locals 0

    .line 6
    invoke-static {p0, p1, p2}, Ltech/sud/runtime/component/websocket/WebSocket;->ontextmessage(JLjava/lang/String;)V

    return-void
.end method

.method public static synthetic a(J[B)V
    .locals 0

    .line 7
    invoke-static {p0, p1, p2}, Ltech/sud/runtime/component/websocket/WebSocket;->onbinarymessage(J[B)V

    return-void
.end method

.method public static synthetic b(JLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ltech/sud/runtime/component/websocket/WebSocket;->onerror(JLjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static native onbinarymessage(J[B)V
.end method

.method private static native onclose(JILjava/lang/String;)V
.end method

.method private static native onerror(JLjava/lang/String;)V
.end method

.method private static native onopen(J)V
.end method

.method private static native ontextmessage(JLjava/lang/String;)V
.end method


# virtual methods
.method public close()V
    .locals 2

    .line 1
    const-string v0, "SudNative WebSocket"

    .line 2
    .line 3
    const-string v1, "close"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ltech/sud/runtime/component/websocket/WebSocket;->b:Ltech/sud/runtime/component/websocket/WebSocket$a;

    .line 9
    .line 10
    invoke-virtual {p0}, Ltech/sud/a/a/Sudif;->g()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/websocket/WebSocket;->b:Ltech/sud/runtime/component/websocket/WebSocket$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ltech/sud/runtime/component/websocket/WebSocket$a;->j()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public open(Ljava/lang/String;J)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "open uri:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " cPtr:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "SudNative WebSocket"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ltech/sud/runtime/component/h/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :try_start_0
    new-instance v0, Ltech/sud/runtime/component/websocket/WebSocket$a;

    .line 29
    .line 30
    invoke-direct {v0, p1, p2, p3}, Ltech/sud/runtime/component/websocket/WebSocket$a;-><init>(Ljava/lang/String;J)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ltech/sud/runtime/component/websocket/WebSocket;->b:Ltech/sud/runtime/component/websocket/WebSocket$a;

    .line 34
    .line 35
    invoke-virtual {v0}, Ltech/sud/a/a/Sudif;->f()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :catch_0
    move-exception p0

    .line 40
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 41
    .line 42
    .line 43
    new-instance p1, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    const-string v0, "cPtr:"

    .line 46
    .line 47
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string p2, " open fail:"

    .line 54
    .line 55
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    const-string p2, "WebSocket"

    .line 63
    .line 64
    invoke-static {p2, p1, p0}, Ltech/sud/runtime/component/h/f;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public send(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/runtime/component/websocket/WebSocket;->b:Ltech/sud/runtime/component/websocket/WebSocket$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ltech/sud/a/a/Sudif;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public send([B)V
    .locals 0

    .line 7
    iget-object p0, p0, Ltech/sud/runtime/component/websocket/WebSocket;->b:Ltech/sud/runtime/component/websocket/WebSocket$a;

    invoke-virtual {p0, p1}, Ltech/sud/a/a/Sudif;->a([B)V

    return-void
.end method
