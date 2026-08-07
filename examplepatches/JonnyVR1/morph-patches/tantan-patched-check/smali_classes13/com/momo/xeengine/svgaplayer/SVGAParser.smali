.class public final Lcom/momo/xeengine/svgaplayer/SVGAParser;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000J\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0012\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u00002\u00020\u0001:\u0001\u001bB\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u0012\u0010\t\u001a\u0004\u0018\u00010\n2\u0006\u0010\u000b\u001a\u00020\nH\u0002J\u001c\u0010\u000c\u001a\u00020\r2\u0008\u0010\u000e\u001a\u0004\u0018\u00010\u000f2\u0008\u0010\u0010\u001a\u0004\u0018\u00010\u0011H\u0002J\u001a\u0010\u0012\u001a\u00020\r2\u0008\u0010\u000e\u001a\u0004\u0018\u00010\u000f2\u0006\u0010\u0013\u001a\u00020\u0014H\u0002J\u0012\u0010\u0015\u001a\u0004\u0018\u00010\u00112\u0006\u0010\u0016\u001a\u00020\u0017H\u0002J\u0016\u0010\u0018\u001a\u00020\r2\u0006\u0010\u0019\u001a\u00020\u00142\u0006\u0010\u000e\u001a\u00020\u000fJ\u0012\u0010\u001a\u001a\u0004\u0018\u00010\n2\u0006\u0010\u0016\u001a\u00020\u0017H\u0002R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0016\u0010\u0007\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001c"
    }
    d2 = {
        "Lcom/momo/xeengine/svgaplayer/SVGAParser;",
        "",
        "view",
        "Landroid/view/View;",
        "(Landroid/view/View;)V",
        "executorService",
        "Ljava/util/concurrent/ExecutorService;",
        "viewRef",
        "Ljava/lang/ref/WeakReference;",
        "inflate",
        "",
        "byteArray",
        "onComplete",
        "",
        "callback",
        "Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;",
        "videoItem",
        "Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;",
        "onError",
        "errorMsg",
        "",
        "parse",
        "inputStream",
        "Ljava/io/InputStream;",
        "parseFile",
        "filePath",
        "readAsBytes",
        "ParseCompletion",
        "gift_player_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xf
    }
.end annotation


# instance fields
.field private final executorService:Ljava/util/concurrent/ExecutorService;

.field private viewRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/momo/xeengine/svgaplayer/SVGAParser;->viewRef:Ljava/lang/ref/WeakReference;

    .line 13
    .line 14
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SVGAParser;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 22
    .line 23
    return-void
.end method

.method public static final synthetic access$getExecutorService$p(Lcom/momo/xeengine/svgaplayer/SVGAParser;)Ljava/util/concurrent/ExecutorService;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAParser;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$onComplete(Lcom/momo/xeengine/svgaplayer/SVGAParser;Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/momo/xeengine/svgaplayer/SVGAParser;->onComplete(Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$onError(Lcom/momo/xeengine/svgaplayer/SVGAParser;Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/momo/xeengine/svgaplayer/SVGAParser;->onError(Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$parse(Lcom/momo/xeengine/svgaplayer/SVGAParser;Ljava/io/InputStream;)Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/xeengine/svgaplayer/SVGAParser;->parse(Ljava/io/InputStream;)Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final inflate([B)[B
    .locals 5

    .line 1
    const/4 p0, 0x0

    .line 2
    :try_start_0
    new-instance v0, Ljava/util/zip/Inflater;

    .line 3
    .line 4
    invoke-direct {v0}, Ljava/util/zip/Inflater;-><init>()V

    .line 5
    .line 6
    .line 7
    array-length v1, p1

    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-virtual {v0, p1, v2, v1}, Ljava/util/zip/Inflater;->setInput([BII)V

    .line 10
    .line 11
    .line 12
    const/16 p1, 0x800

    .line 13
    .line 14
    new-array v1, p1, [B

    .line 15
    .line 16
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    .line 17
    .line 18
    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    :goto_0
    :try_start_1
    invoke-virtual {v0, v1, v2, p1}, Ljava/util/zip/Inflater;->inflate([BII)I

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    if-gtz v4, :cond_0

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/util/zip/Inflater;->end()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 31
    .line 32
    .line 33
    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    :try_start_2
    invoke-static {v3, p0}, Lkotlin/io/CloseableKt;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 35
    .line 36
    .line 37
    return-object p1

    .line 38
    :catch_0
    move-exception p1

    .line 39
    goto :goto_2

    .line 40
    :catchall_0
    move-exception p1

    .line 41
    goto :goto_1

    .line 42
    :cond_0
    :try_start_3
    invoke-virtual {v3, v1, v2, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :goto_1
    :try_start_4
    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 47
    :catchall_1
    move-exception v0

    .line 48
    :try_start_5
    invoke-static {v3, p1}, Lkotlin/io/CloseableKt;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 49
    .line 50
    .line 51
    throw v0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 52
    :goto_2
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 53
    .line 54
    .line 55
    return-object p0
.end method

.method private final onComplete(Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;)V
    .locals 1

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    sget-object p2, Lcom/momo/xeengine/svgaplayer/ErrorConstant;->Companion:Lcom/momo/xeengine/svgaplayer/ErrorConstant$Companion;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/momo/xeengine/svgaplayer/ErrorConstant$Companion;->getERROR_MMSVGA_RES_PARSE()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-direct {p0, p1, p2}, Lcom/momo/xeengine/svgaplayer/SVGAParser;->onError(Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAParser;->viewRef:Ljava/lang/ref/WeakReference;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Landroid/view/View;

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    new-instance v0, Lcom/momo/xeengine/svgaplayer/SVGAParser$onComplete$1;

    .line 24
    .line 25
    invoke-direct {v0, p1, p2}, Lcom/momo/xeengine/svgaplayer/SVGAParser$onComplete$1;-><init>(Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method private final onError(Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAParser;->viewRef:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/view/View;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    new-instance v0, Lcom/momo/xeengine/svgaplayer/SVGAParser$onError$1;

    .line 12
    .line 13
    invoke-direct {v0, p1, p2}, Lcom/momo/xeengine/svgaplayer/SVGAParser$onError$1;-><init>(Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method private final parse(Ljava/io/InputStream;)Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/xeengine/svgaplayer/SVGAParser;->readAsBytes(Ljava/io/InputStream;)[B

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    :try_start_0
    invoke-direct {p0, p1}, Lcom/momo/xeengine/svgaplayer/SVGAParser;->inflate([B)[B

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    new-instance p1, Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;

    .line 14
    .line 15
    sget-object v0, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Lcom/squareup/wire/ProtoAdapter;->decode([B)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    check-cast p0, Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;

    .line 25
    .line 26
    invoke-direct {p1, p0}, Lcom/momo/xeengine/svgaplayer/SVGAVideoEntity;-><init>(Lcom/momo/xeengine/svgaplayer/proto/MovieEntity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    .line 29
    return-object p1

    .line 30
    :catch_0
    move-exception p0

    .line 31
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 32
    .line 33
    .line 34
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 35
    .line 36
    :cond_0
    const/4 p0, 0x0

    .line 37
    return-object p0
.end method

.method private final readAsBytes(Ljava/io/InputStream;)[B
    .locals 5

    .line 1
    const/4 p0, 0x0

    .line 2
    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 3
    .line 4
    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    .line 6
    .line 7
    const/16 v1, 0x800

    .line 8
    .line 9
    :try_start_1
    new-array v2, v1, [B

    .line 10
    .line 11
    :goto_0
    const/4 v3, 0x0

    .line 12
    invoke-virtual {p1, v2, v3, v1}, Ljava/io/InputStream;->read([BII)I

    .line 13
    .line 14
    .line 15
    move-result v4

    .line 16
    if-gtz v4, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 19
    .line 20
    .line 21
    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    :try_start_2
    invoke-static {v0, p0}, Lkotlin/io/CloseableKt;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 23
    .line 24
    .line 25
    return-object p1

    .line 26
    :catch_0
    move-exception p1

    .line 27
    goto :goto_2

    .line 28
    :catchall_0
    move-exception p1

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    :try_start_3
    invoke-virtual {v0, v2, v3, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :goto_1
    :try_start_4
    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 35
    :catchall_1
    move-exception v1

    .line 36
    :try_start_5
    invoke-static {v0, p1}, Lkotlin/io/CloseableKt;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 37
    .line 38
    .line 39
    throw v1
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 40
    :goto_2
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 41
    .line 42
    .line 43
    return-object p0
.end method


# virtual methods
.method public final parseFile(Ljava/lang/String;Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    new-instance v0, Lcom/momo/xeengine/svgaplayer/SVGAParser$parseFile$loadFunc$1;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1, p2}, Lcom/momo/xeengine/svgaplayer/SVGAParser$parseFile$loadFunc$1;-><init>(Lcom/momo/xeengine/svgaplayer/SVGAParser;Ljava/lang/String;Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;)V

    .line 10
    .line 11
    .line 12
    new-instance p1, Lcom/momo/xeengine/svgaplayer/SVGAParser$parseFile$loadResult$1;

    .line 13
    .line 14
    invoke-direct {p1, p0, v0, p2}, Lcom/momo/xeengine/svgaplayer/SVGAParser$parseFile$loadResult$1;-><init>(Lcom/momo/xeengine/svgaplayer/SVGAParser;Lkotlin/jvm/functions/Function0;Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p1}, Lcom/momo/xeengine/somanager/XEngineSOManager;->check(Lcom/momo/xeengine/somanager/IXEngineSOLoader$LoaderCallback;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SVGAParser;->executorService:Ljava/util/concurrent/ExecutorService;

    .line 24
    .line 25
    new-instance p1, Lcom/momo/xeengine/svgaplayer/SVGAParser$sam$java_lang_Runnable$0;

    .line 26
    .line 27
    invoke-direct {p1, v0}, Lcom/momo/xeengine/svgaplayer/SVGAParser$sam$java_lang_Runnable$0;-><init>(Lkotlin/jvm/functions/Function0;)V

    .line 28
    .line 29
    .line 30
    invoke-interface {p0, p1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method
