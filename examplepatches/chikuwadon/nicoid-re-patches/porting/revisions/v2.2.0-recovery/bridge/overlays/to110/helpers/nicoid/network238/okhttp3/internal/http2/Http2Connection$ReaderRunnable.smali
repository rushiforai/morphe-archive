.class public final Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;
.implements Lnicoid/network238/kotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/http2/Http2Connection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "ReaderRunnable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;",
        "Lnicoid/network238/kotlin/jvm/functions/Function0;"
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\t\n\u0002\u0010\u000e\n\u0002\u0008\u0005\u0008\u0086\u0004\u0018\u00002\u00020\u00012\u0008\u0012\u0004\u0012\u00020\u00030\u0002B\u0011\u0008\u0000\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\t\u0010\n\u001a\u00020\u0003H\u0096\u0002J(\u0010\u000b\u001a\u00020\u00032\u0006\u0010\u000c\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u000fH\u0016J.\u0010\u0013\u001a\u00020\u00032\u0006\u0010\u000c\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0014\u001a\u00020\u000f2\u000c\u0010\u0015\u001a\u0008\u0012\u0004\u0012\u00020\u00170\u0016H\u0016J\u0018\u0010\u0018\u001a\u00020\u00032\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0019\u001a\u00020\u001aH\u0016J\u0018\u0010\u001b\u001a\u00020\u00032\u0006\u0010\u001c\u001a\u00020\r2\u0006\u0010\u001b\u001a\u00020\u001dH\u0016J\u0016\u0010\u001e\u001a\u00020\u00032\u0006\u0010\u001c\u001a\u00020\r2\u0006\u0010\u001b\u001a\u00020\u001dJ\u0008\u0010\u001f\u001a\u00020\u0003H\u0016J \u0010 \u001a\u00020\u00032\u0006\u0010!\u001a\u00020\r2\u0006\u0010\"\u001a\u00020\u000f2\u0006\u0010#\u001a\u00020\u000fH\u0016J \u0010$\u001a\u00020\u00032\u0006\u0010%\u001a\u00020\u000f2\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010&\u001a\u00020\'H\u0016J\u0018\u0010(\u001a\u00020\u00032\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010)\u001a\u00020*H\u0016J(\u0010+\u001a\u00020\u00032\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010,\u001a\u00020\u000f2\u0006\u0010-\u001a\u00020\u000f2\u0006\u0010.\u001a\u00020\rH\u0016J&\u0010/\u001a\u00020\u00032\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u00100\u001a\u00020\u000f2\u000c\u00101\u001a\u0008\u0012\u0004\u0012\u00020\u00170\u0016H\u0016J8\u00102\u001a\u00020\u00032\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u00103\u001a\u0002042\u0006\u00105\u001a\u00020\'2\u0006\u00106\u001a\u0002042\u0006\u00107\u001a\u00020\u000f2\u0006\u00108\u001a\u00020*H\u0016R\u0014\u0010\u0004\u001a\u00020\u0005X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\t\u00a8\u00069"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;",
        "Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;",
        "Lnicoid/network238/kotlin/Function0;",
        "",
        "reader",
        "Lnicoid/network238/okhttp3/internal/http2/Http2Reader;",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;Lnicoid/network238/okhttp3/internal/http2/Http2Reader;)V",
        "getReader$okhttp",
        "()Lnicoid/network238/okhttp3/internal/http2/Http2Reader;",
        "invoke",
        "data",
        "inFinished",
        "",
        "streamId",
        "",
        "source",
        "Lnicoid/network238/okio/BufferedSource;",
        "length",
        "headers",
        "associatedStreamId",
        "headerBlock",
        "",
        "Lnicoid/network238/okhttp3/internal/http2/Header;",
        "rstStream",
        "errorCode",
        "Lnicoid/network238/okhttp3/internal/http2/ErrorCode;",
        "settings",
        "clearPrevious",
        "Lnicoid/network238/okhttp3/internal/http2/Settings;",
        "applyAndAckSettings",
        "ackSettings",
        "ping",
        "ack",
        "payload1",
        "payload2",
        "goAway",
        "lastGoodStreamId",
        "debugData",
        "Lnicoid/network238/okio/ByteString;",
        "windowUpdate",
        "windowSizeIncrement",
        "",
        "priority",
        "streamDependency",
        "weight",
        "exclusive",
        "pushPromise",
        "promisedStreamId",
        "requestHeaders",
        "alternateService",
        "origin",
        "",
        "protocol",
        "host",
        "port",
        "maxAge",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final reader:Lnicoid/network238/okhttp3/internal/http2/Http2Reader;

.field final synthetic this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;


# direct methods
.method public static synthetic $r8$lambda$-_UQnGq5VUgB0kEomNLPoIaKCCk(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;)Lnicoid/network238/kotlin/Unit;
    .registers 2

    invoke-static {p0, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->applyAndAckSettings$lambda$0$0$1(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;)Lnicoid/network238/kotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$XZ_EeCBqRdcY-_YZDRWVjMHYQQs(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;Lnicoid/network238/okhttp3/internal/http2/Http2Stream;)Lnicoid/network238/kotlin/Unit;
    .registers 2

    invoke-static {p0, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->headers$lambda$0$0(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;Lnicoid/network238/okhttp3/internal/http2/Http2Stream;)Lnicoid/network238/kotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;Lnicoid/network238/okhttp3/internal/http2/Http2Reader;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/internal/http2/Http2Reader;",
            ")V"
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 619
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 620
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->reader:Lnicoid/network238/okhttp3/internal/http2/Http2Reader;

    return-void
.end method

.method private static final applyAndAckSettings$lambda$0$0$1(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;)Lnicoid/network238/kotlin/Unit;
    .registers 3

    .line 783
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->getListener$okhttp()Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;

    move-result-object v0

    iget-object p1, p1, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast p1, Lnicoid/network238/okhttp3/internal/http2/Settings;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;->onSettings(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;Lnicoid/network238/okhttp3/internal/http2/Settings;)V

    .line 784
    sget-object p0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    return-object p0
.end method

.method private static final headers$lambda$0$0(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;Lnicoid/network238/okhttp3/internal/http2/Http2Stream;)Lnicoid/network238/kotlin/Unit;
    .registers 6

    .line 700
    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->getListener$okhttp()Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;

    move-result-object v0

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$Listener;->onStream(Lnicoid/network238/okhttp3/internal/http2/Http2Stream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 702
    sget-object v1, Lnicoid/network238/okhttp3/internal/platform/Platform;->Companion:Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->get()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Http2Connection.Listener failure for "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->getConnectionName$okhttp()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const/4 v2, 0x4

    invoke-virtual {v1, p0, v2, v0}, Lnicoid/network238/okhttp3/internal/platform/Platform;->log(Ljava/lang/String;ILjava/lang/Throwable;)V

    .line 704
    :try_start_1
    sget-object p0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->PROTOCOL_ERROR:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    invoke-virtual {p1, p0, v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->close(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;Ljava/io/IOException;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    move-exception p0

    .line 707
    :goto_0
    sget-object p0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    return-object p0
.end method

.method static final ping$lambda$1(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;II)Lnicoid/network238/kotlin/Unit;
    .registers 4

    .line 834
    const/4 v0, 0x1

    invoke-virtual {p0, v0, p1, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writePing(ZII)V

    .line 835
    sget-object p0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    return-object p0
.end method

.method static final settings$lambda$0(Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;ZLnicoid/network238/okhttp3/internal/http2/Settings;)Lnicoid/network238/kotlin/Unit;
    .registers 3

    .line 733
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->applyAndAckSettings(ZLnicoid/network238/okhttp3/internal/http2/Settings;)V

    .line 734
    sget-object p0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    return-object p0
.end method


# virtual methods
.method public ackSettings()V
    .registers 1

    return-void
.end method

.method public alternateService(ILjava/lang/String;Lnicoid/network238/okio/ByteString;Ljava/lang/String;IJ)V
    .registers 8

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public final applyAndAckSettings(ZLnicoid/network238/okhttp3/internal/http2/Settings;)V
    .registers 20

    move-object/from16 v1, p0

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 756
    new-instance v0, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;

    invoke-direct {v0}, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;-><init>()V

    .line 757
    iget-object v2, v1, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->getWriter()Lnicoid/network238/okhttp3/internal/http2/Http2Writer;

    move-result-object v2

    iget-object v3, v1, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    .line 1049
    monitor-enter v2

    .line 1050
    :try_start_0
    monitor-enter v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 759
    :try_start_1
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->getPeerSettings()Lnicoid/network238/okhttp3/internal/http2/Settings;

    move-result-object v4

    if-eqz p1, :cond_0

    move-object/from16 v5, p2

    goto :goto_0

    .line 764
    :cond_0
    new-instance v5, Lnicoid/network238/okhttp3/internal/http2/Settings;

    invoke-direct {v5}, Lnicoid/network238/okhttp3/internal/http2/Settings;-><init>()V

    .line 765
    invoke-virtual {v5, v4}, Lnicoid/network238/okhttp3/internal/http2/Settings;->merge(Lnicoid/network238/okhttp3/internal/http2/Settings;)V

    .line 766
    move-object/from16 v6, p2

    invoke-virtual {v5, v6}, Lnicoid/network238/okhttp3/internal/http2/Settings;->merge(Lnicoid/network238/okhttp3/internal/http2/Settings;)V

    .line 760
    :goto_0
    iput-object v5, v0, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 770
    invoke-virtual {v5}, Lnicoid/network238/okhttp3/internal/http2/Settings;->getInitialWindowSize()I

    move-result v5

    int-to-long v5, v5

    .line 771
    invoke-virtual {v4}, Lnicoid/network238/okhttp3/internal/http2/Settings;->getInitialWindowSize()I

    move-result v4

    int-to-long v7, v4

    sub-long/2addr v5, v7

    const-wide/16 v7, 0x0

    cmp-long v4, v5, v7

    const/4 v7, 0x0

    if-eqz v4, :cond_2

    .line 774
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->getStreams$okhttp()Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_1

    .line 777
    :cond_1
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->getStreams$okhttp()Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v4

    .line 1052
    new-array v8, v7, [Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-interface {v4, v8}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    goto :goto_2

    :cond_2
    :goto_1
    const/4 v4, 0x0

    .line 780
    :goto_2
    iget-object v8, v0, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast v8, Lnicoid/network238/okhttp3/internal/http2/Settings;

    invoke-virtual {v3, v8}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->setPeerSettings(Lnicoid/network238/okhttp3/internal/http2/Settings;)V

    .line 782
    # getter for: Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->settingsListenerQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;
    invoke-static {v3}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->access$getSettingsListenerQueue$p(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;)Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    move-result-object v9

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->getConnectionName$okhttp()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v10, " onSettings"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    new-instance v14, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable$3;

    invoke-direct {v14, v3, v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable$3;-><init>(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;)V

    const/4 v15, 0x6

    const/16 v16, 0x0

    const-wide/16 v11, 0x0

    const/4 v13, 0x0

    invoke-static/range {v9 .. v16}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->execute$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;JZLnicoid/network238/kotlin/jvm/functions/Function0;ILjava/lang/Object;)V

    .line 785
    sget-object v8, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1050
    :try_start_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 787
    :try_start_3
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->getWriter()Lnicoid/network238/okhttp3/internal/http2/Http2Writer;

    move-result-object v8

    iget-object v0, v0, Lnicoid/network238/kotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast v0, Lnicoid/network238/okhttp3/internal/http2/Settings;

    invoke-virtual {v8, v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Writer;->applyAndAckSettings(Lnicoid/network238/okhttp3/internal/http2/Settings;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    goto :goto_3

    :catch_0
    move-exception v0

    .line 789
    :try_start_4
    # invokes: Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->failConnection(Ljava/io/IOException;)V
    invoke-static {v3, v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->access$failConnection(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;Ljava/io/IOException;)V

    .line 791
    :goto_3
    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 1049
    monitor-exit v2

    if-eqz v4, :cond_3

    .line 793
    array-length v0, v4

    :goto_4
    if-ge v7, v0, :cond_3

    aget-object v2, v4, v7

    .line 1053
    monitor-enter v2

    .line 795
    :try_start_5
    invoke-virtual {v2, v5, v6}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->addBytesToWriteWindow(J)V

    .line 796
    sget-object v3, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 1053
    monitor-exit v2

    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    :catchall_0
    move-exception v0

    monitor-exit v2

    throw v0

    :cond_3
    return-void

    :catchall_1
    move-exception v0

    .line 1050
    :try_start_6
    monitor-exit v3

    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    :catchall_2
    move-exception v0

    .line 1049
    monitor-exit v2

    throw v0
.end method

.method public data(ZILnicoid/network238/okio/BufferedSource;I)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 650
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    invoke-virtual {v0, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->pushedStream$okhttp(I)Z

    move-result v0

    .line 654
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    if-eqz v0, :cond_0

    .line 651
    invoke-virtual {v1, p2, p3, p4, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->pushDataLater$okhttp(ILnicoid/network238/okio/BufferedSource;IZ)V

    return-void

    .line 654
    :cond_0
    invoke-virtual {v1, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->getStream(I)Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    move-result-object v0

    if-nez v0, :cond_1

    .line 656
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->PROTOCOL_ERROR:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    invoke-virtual {p1, p2, v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writeSynResetLater$okhttp(ILnicoid/network238/okhttp3/internal/http2/ErrorCode;)V

    .line 657
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    int-to-long v0, p4

    invoke-virtual {p1, v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->updateConnectionFlowControl$okhttp(J)V

    .line 658
    invoke-interface {p3, v0, v1}, Lnicoid/network238/okio/BufferedSource;->skip(J)V

    return-void

    .line 661
    :cond_1
    invoke-virtual {v0, p3, p4}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->receiveData(Lnicoid/network238/okio/BufferedSource;I)V

    if-eqz p1, :cond_2

    .line 663
    sget-object p1, Lnicoid/network238/okhttp3/Headers;->EMPTY:Lnicoid/network238/okhttp3/Headers;

    const/4 p2, 0x1

    invoke-virtual {v0, p1, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->receiveHeaders(Lnicoid/network238/okhttp3/Headers;Z)V

    :cond_2
    return-void
.end method

.method public final getReader$okhttp()Lnicoid/network238/okhttp3/internal/http2/Http2Reader;
    .registers 2

    .line 620
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->reader:Lnicoid/network238/okhttp3/internal/http2/Http2Reader;

    return-object v0
.end method

.method public goAway(ILnicoid/network238/okhttp3/internal/http2/ErrorCode;Lnicoid/network238/okio/ByteString;)V
    .registers 7

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 844
    invoke-virtual {p3}, Lnicoid/network238/okio/ByteString;->size()I

    .line 850
    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    .line 1056
    monitor-enter p2

    .line 851
    :try_start_0
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->getStreams$okhttp()Ljava/util/Map;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p3

    .line 1058
    const/4 v0, 0x0

    new-array v1, v0, [Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    invoke-interface {p3, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p3

    .line 852
    const/4 v1, 0x1

    invoke-static {p2, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->access$setShutdown$p(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;Z)V

    .line 853
    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1056
    monitor-exit p2

    .line 856
    check-cast p3, [Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    array-length p2, p3

    :goto_0
    if-ge v0, p2, :cond_1

    aget-object v1, p3, v0

    .line 857
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getId()I

    move-result v2

    if-le v2, p1, :cond_0

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->isLocallyInitiated()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 858
    sget-object v2, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->REFUSED_STREAM:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    invoke-virtual {v1, v2}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->receiveRstStream(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;)V

    .line 859
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->getId()I

    move-result v1

    invoke-virtual {v2, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->removeStream$okhttp(I)Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void

    :catchall_0
    move-exception p1

    .line 1056
    monitor-exit p2

    throw p1
.end method

.method public headers(ZIILjava/util/List;)V
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZII",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/http2/Header;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 673
    iget-object p3, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    invoke-virtual {p3, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->pushedStream$okhttp(I)Z

    move-result p3

    .line 678
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    if-eqz p3, :cond_0

    .line 674
    invoke-virtual {v2, p2, p4, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->pushHeadersLater$okhttp(ILjava/util/List;Z)V

    return-void

    .line 1048
    :cond_0
    monitor-enter v2

    .line 679
    :try_start_0
    invoke-virtual {v2, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->getStream(I)Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    move-result-object p3

    if-nez p3, :cond_4

    .line 683
    # getter for: Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->isShutdown:Z
    invoke-static {v2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->access$isShutdown$p(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;)Z

    move-result p3

    if-eqz p3, :cond_1

    goto :goto_0

    .line 686
    :cond_1
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->getLastGoodStreamId$okhttp()I

    move-result p3

    if-gt p2, p3, :cond_2

    goto :goto_0

    .line 689
    :cond_2
    rem-int/lit8 p3, p2, 0x2

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->getNextStreamId$okhttp()I

    move-result v0

    rem-int/lit8 v0, v0, 0x2

    if-ne p3, v0, :cond_3

    goto :goto_0

    .line 692
    :cond_3
    invoke-static {p4}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->toHeaders(Ljava/util/List;)Lnicoid/network238/okhttp3/Headers;

    move-result-object v5

    .line 693
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    const/4 v3, 0x0

    move v4, p1

    move v1, p2

    invoke-direct/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;-><init>(ILnicoid/network238/okhttp3/internal/http2/Http2Connection;ZZLnicoid/network238/okhttp3/Headers;)V

    .line 694
    invoke-virtual {v2, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->setLastGoodStreamId$okhttp(I)V

    .line 695
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->getStreams$okhttp()Ljava/util/Map;

    move-result-object p1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {p1, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 698
    # getter for: Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;
    invoke-static {v2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->access$getTaskRunner$p(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;)Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->newQueue()Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    move-result-object v3

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->getConnectionName$okhttp()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const/16 p2, 0x5b

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, "] onStream"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v8, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable$1;

    invoke-direct {v8, v2, v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable$1;-><init>(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;Lnicoid/network238/okhttp3/internal/http2/Http2Stream;)V

    const/4 v9, 0x6

    const/4 v10, 0x0

    const-wide/16 v5, 0x0

    const/4 v7, 0x0

    invoke-static/range {v3 .. v10}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->execute$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;JZLnicoid/network238/kotlin/jvm/functions/Function0;ILjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1048
    :goto_0
    monitor-exit v2

    return-void

    .line 710
    :cond_4
    move v4, p1

    :try_start_1
    sget-object p1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1048
    monitor-exit v2

    .line 713
    invoke-static {p4}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->toHeaders(Ljava/util/List;)Lnicoid/network238/okhttp3/Headers;

    move-result-object p1

    invoke-virtual {p3, p1, v4}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->receiveHeaders(Lnicoid/network238/okhttp3/Headers;Z)V

    return-void

    :catchall_0
    move-exception v0

    move-object p1, v0

    .line 1048
    monitor-exit v2

    throw p1
.end method

.method public bridge synthetic invoke()Ljava/lang/Object;
    .registers 2

    .line 619
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->invoke()V

    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    return-object v0
.end method

.method public invoke()V
    .registers 6

    .line 624
    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->INTERNAL_ERROR:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;

    .line 628
    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->reader:Lnicoid/network238/okhttp3/internal/http2/Http2Reader;

    invoke-virtual {v2, p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->readConnectionPreface(Lnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;)V

    .line 629
    :cond_0
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->reader:Lnicoid/network238/okhttp3/internal/http2/Http2Reader;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, p0}, Lnicoid/network238/okhttp3/internal/http2/Http2Reader;->nextFrame(ZLnicoid/network238/okhttp3/internal/http2/Http2Reader$Handler;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 631
    sget-object v2, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->NO_ERROR:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 632
    :try_start_1
    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->CANCEL:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 638
    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    invoke-virtual {v3, v2, v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->close$okhttp(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;Lnicoid/network238/okhttp3/internal/http2/ErrorCode;Ljava/io/IOException;)V

    .line 639
    :goto_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->reader:Lnicoid/network238/okhttp3/internal/http2/Http2Reader;

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    return-void

    :catch_0
    move-exception v1

    goto :goto_1

    :catchall_0
    move-exception v2

    move-object v3, v2

    move-object v2, v0

    goto :goto_2

    :catch_1
    move-exception v1

    move-object v2, v0

    .line 635
    :goto_1
    :try_start_2
    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/ErrorCode;->PROTOCOL_ERROR:Lnicoid/network238/okhttp3/internal/http2/ErrorCode;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 638
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    invoke-virtual {v2, v0, v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->close$okhttp(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;Lnicoid/network238/okhttp3/internal/http2/ErrorCode;Ljava/io/IOException;)V

    goto :goto_0

    .line 639
    :catchall_1
    move-exception v3

    .line 638
    :goto_2
    iget-object v4, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    invoke-virtual {v4, v2, v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->close$okhttp(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;Lnicoid/network238/okhttp3/internal/http2/ErrorCode;Ljava/io/IOException;)V

    .line 639
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->reader:Lnicoid/network238/okhttp3/internal/http2/Http2Reader;

    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    throw v3
.end method

.method public ping(ZII)V
    .registers 14

    .line 833
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    if-eqz p1, :cond_3

    .line 1054
    monitor-enter v1

    const/4 p1, 0x1

    const-wide/16 v2, 0x1

    if-eq p2, p1, :cond_2

    const/4 p1, 0x2

    if-eq p2, p1, :cond_1

    const/4 p1, 0x3

    if-eq p2, p1, :cond_0

    goto :goto_0

    .line 822
    :cond_0
    :try_start_0
    # getter for: Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->awaitPongsReceived:J
    invoke-static {v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->access$getAwaitPongsReceived$p(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;)J

    move-result-wide p1

    add-long/2addr p1, v2

    invoke-static {v1, p1, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->access$setAwaitPongsReceived$p(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;J)V

    .line 1055
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    :goto_0
    sget-object p1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    goto :goto_1

    .line 818
    :cond_1
    # getter for: Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->degradedPongsReceived:J
    invoke-static {v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->access$getDegradedPongsReceived$p(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;)J

    move-result-wide p1

    add-long/2addr p1, v2

    invoke-static {v1, p1, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->access$setDegradedPongsReceived$p(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;J)V

    goto :goto_1

    .line 814
    :cond_2
    # getter for: Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->intervalPongsReceived:J
    invoke-static {v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->access$getIntervalPongsReceived$p(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;)J

    move-result-wide p1

    add-long/2addr p1, v2

    invoke-static {v1, p1, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->access$setIntervalPongsReceived$p(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1054
    :goto_1
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    move-object p1, v0

    monitor-exit v1

    throw p1

    .line 833
    :cond_3
    # getter for: Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writerQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;
    invoke-static {v1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->access$getWriterQueue$p(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;)Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    move-result-object v2

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->getConnectionName$okhttp()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " ping"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    new-instance v7, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable$0;

    invoke-direct {v7, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable$0;-><init>(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;II)V

    const/4 v8, 0x6

    const/4 v9, 0x0

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    invoke-static/range {v2 .. v9}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->execute$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;JZLnicoid/network238/kotlin/jvm/functions/Function0;ILjava/lang/Object;)V

    return-void
.end method

.method public priority(IIIZ)V
    .registers 5

    return-void
.end method

.method public pushPromise(IILjava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/http2/Header;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 897
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    invoke-virtual {p1, p2, p3}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->pushRequestLater$okhttp(ILjava/util/List;)V

    return-void
.end method

.method public rstStream(ILnicoid/network238/okhttp3/internal/http2/ErrorCode;)V
    .registers 5

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 720
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->pushedStream$okhttp(I)Z

    move-result v0

    .line 724
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    if-eqz v0, :cond_0

    .line 721
    invoke-virtual {v1, p1, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->pushResetLater$okhttp(ILnicoid/network238/okhttp3/internal/http2/ErrorCode;)V

    return-void

    .line 724
    :cond_0
    invoke-virtual {v1, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->removeStream$okhttp(I)Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 725
    invoke-virtual {p1, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->receiveRstStream(Lnicoid/network238/okhttp3/internal/http2/ErrorCode;)V

    :cond_1
    return-void
.end method

.method public settings(ZLnicoid/network238/okhttp3/internal/http2/Settings;)V
    .registers 12

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 732
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    # getter for: Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->writerQueue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;
    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->access$getWriterQueue$p(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;)Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    move-result-object v1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->getConnectionName$okhttp()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " applyAndAckSettings"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v6, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable$2;

    invoke-direct {v6, p0, p1, p2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable$2;-><init>(Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;ZLnicoid/network238/okhttp3/internal/http2/Settings;)V

    const/4 v7, 0x6

    const/4 v8, 0x0

    const-wide/16 v3, 0x0

    const/4 v5, 0x0

    invoke-static/range {v1 .. v8}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->execute$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;JZLnicoid/network238/kotlin/jvm/functions/Function0;ILjava/lang/Object;)V

    return-void
.end method

.method public windowUpdate(IJ)V
    .registers 7

    .line 874
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/http2/Http2Connection$ReaderRunnable;->this$0:Lnicoid/network238/okhttp3/internal/http2/Http2Connection;

    if-nez p1, :cond_0

    .line 1059
    monitor-enter v0

    .line 870
    :try_start_0
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->getWriteBytesMaximum()J

    move-result-wide v1

    add-long/2addr v1, p2

    invoke-static {v0, v1, v2}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->access$setWriteBytesMaximum$p(Lnicoid/network238/okhttp3/internal/http2/Http2Connection;J)V

    .line 1060
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 872
    sget-object p1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1059
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0

    throw p1

    .line 874
    :cond_0
    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/internal/http2/Http2Connection;->getStream(I)Lnicoid/network238/okhttp3/internal/http2/Http2Stream;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 1061
    monitor-enter p1

    .line 877
    :try_start_1
    invoke-virtual {p1, p2, p3}, Lnicoid/network238/okhttp3/internal/http2/Http2Stream;->addBytesToWriteWindow(J)V

    .line 878
    sget-object p2, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1061
    monitor-exit p1

    return-void

    :catchall_1
    move-exception p2

    monitor-exit p1

    throw p2

    :cond_1
    return-void
.end method
