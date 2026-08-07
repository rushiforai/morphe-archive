.class public final Lcom/immomo/svgaplayer/SVGAParser;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;,
        Lcom/immomo/svgaplayer/SVGAParser$FileDownloader;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x2
    }
    d1 = {
        "\u0000X\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0012\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0018\u00002\u00020\u0001:\u0002\'(B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u0008\u0010\u000f\u001a\u00020\u0001H\u0002J\u0012\u0010\u0010\u001a\u0004\u0018\u00010\u00112\u0006\u0010\u0012\u001a\u00020\u0011H\u0002J\u001c\u0010\u0013\u001a\u00020\u00142\u0008\u0010\u0015\u001a\u0004\u0018\u00010\u00162\u0008\u0010\u0017\u001a\u0004\u0018\u00010\u0018H\u0002J\u0006\u0010\u0019\u001a\u00020\u0014J\u001a\u0010\u001a\u001a\u00020\u00142\u0008\u0010\u0015\u001a\u0004\u0018\u00010\u00162\u0006\u0010\u001b\u001a\u00020\u0006H\u0002J\u0012\u0010\u001c\u001a\u0004\u0018\u00010\u00182\u0006\u0010\u001d\u001a\u00020\u001eH\u0002J \u0010\u001c\u001a\u00020\u00142\u0006\u0010\u001d\u001a\u00020\u001e2\u0006\u0010\u0015\u001a\u00020\u00162\u0008\u0008\u0002\u0010\u001f\u001a\u00020 J\u0016\u0010\u001c\u001a\u00020\u00142\u0006\u0010!\u001a\u00020\"2\u0006\u0010\u0015\u001a\u00020\u0016J\u0016\u0010\u001c\u001a\u00020\u00142\u0006\u0010#\u001a\u00020\u00062\u0006\u0010\u0015\u001a\u00020\u0016J \u0010$\u001a\u00020\u00142\u0006\u0010%\u001a\u00020\u00062\u0006\u0010\u0015\u001a\u00020\u00162\u0008\u0008\u0002\u0010\u001f\u001a\u00020 J\u0012\u0010&\u001a\u0004\u0018\u00010\u00112\u0006\u0010\u001d\u001a\u00020\u001eH\u0002R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082D\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u0007\u001a\u00020\u0008X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\t\u0010\n\"\u0004\u0008\u000b\u0010\u000cR\u0016\u0010\r\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u000eX\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006)"
    }
    d2 = {
        "Lcom/immomo/svgaplayer/SVGAParser;",
        "",
        "context",
        "Landroid/content/Context;",
        "(Landroid/content/Context;)V",
        "TAG",
        "",
        "fileDownloader",
        "Lcom/immomo/svgaplayer/SVGAParser$FileDownloader;",
        "getFileDownloader",
        "()Lcom/immomo/svgaplayer/SVGAParser$FileDownloader;",
        "setFileDownloader",
        "(Lcom/immomo/svgaplayer/SVGAParser$FileDownloader;)V",
        "mContextRef",
        "Ljava/lang/ref/WeakReference;",
        "getTaskTag",
        "inflate",
        "",
        "byteArray",
        "onComplete",
        "",
        "callback",
        "Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;",
        "videoItem",
        "Lcom/immomo/svgaplayer/SVGAVideoEntity;",
        "onDestroy",
        "onError",
        "errorMsg",
        "parse",
        "inputStream",
        "Ljava/io/InputStream;",
        "closeInputStream",
        "",
        "url",
        "Ljava/net/URL;",
        "assetsName",
        "parseFile",
        "filePath",
        "readAsBytes",
        "FileDownloader",
        "ParseCompletion",
        "svgalibrary_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xa
    }
.end annotation


# instance fields
.field private final TAG:Ljava/lang/String;

.field private final context:Landroid/content/Context;

.field private fileDownloader:Lcom/immomo/svgaplayer/SVGAParser$FileDownloader;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private mContextRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
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
    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGAParser;->context:Landroid/content/Context;

    .line 8
    .line 9
    const-string v0, "SVGAParser"

    .line 10
    .line 11
    iput-object v0, p0, Lcom/immomo/svgaplayer/SVGAParser;->TAG:Ljava/lang/String;

    .line 12
    .line 13
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 14
    .line 15
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/immomo/svgaplayer/SVGAParser;->mContextRef:Ljava/lang/ref/WeakReference;

    .line 19
    .line 20
    new-instance p1, Lcom/immomo/svgaplayer/SVGAParser$FileDownloader;

    .line 21
    .line 22
    invoke-direct {p1}, Lcom/immomo/svgaplayer/SVGAParser$FileDownloader;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGAParser;->fileDownloader:Lcom/immomo/svgaplayer/SVGAParser$FileDownloader;

    .line 26
    .line 27
    return-void
.end method

.method public static final synthetic access$getContext$p(Lcom/immomo/svgaplayer/SVGAParser;)Landroid/content/Context;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGAParser;->context:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$onComplete(Lcom/immomo/svgaplayer/SVGAParser;Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;Lcom/immomo/svgaplayer/SVGAVideoEntity;)V
    .locals 0
    .param p1    # Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/immomo/svgaplayer/SVGAVideoEntity;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/immomo/svgaplayer/SVGAParser;->onComplete(Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;Lcom/immomo/svgaplayer/SVGAVideoEntity;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$onError(Lcom/immomo/svgaplayer/SVGAParser;Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;Ljava/lang/String;)V
    .locals 0
    .param p1    # Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/immomo/svgaplayer/SVGAParser;->onError(Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$parse(Lcom/immomo/svgaplayer/SVGAParser;Ljava/io/InputStream;)Lcom/immomo/svgaplayer/SVGAVideoEntity;
    .locals 0
    .param p1    # Ljava/io/InputStream;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/svgaplayer/SVGAParser;->parse(Ljava/io/InputStream;)Lcom/immomo/svgaplayer/SVGAVideoEntity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final getTaskTag()Ljava/lang/Object;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/immomo/svgaplayer/SVGAParser;->TAG:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
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

.method private final onComplete(Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;Lcom/immomo/svgaplayer/SVGAVideoEntity;)V
    .locals 1

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    sget-object p2, Lcom/immomo/svgaplayer/ErrorConstant;->Companion:Lcom/immomo/svgaplayer/ErrorConstant$Companion;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/immomo/svgaplayer/ErrorConstant$Companion;->getERROR_MMSVGA_RES_PARSE()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-direct {p0, p1, p2}, Lcom/immomo/svgaplayer/SVGAParser;->onError(Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGAParser;->mContextRef:Ljava/lang/ref/WeakReference;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Landroid/content/Context;

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    new-instance v0, Landroid/os/Handler;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-direct {v0, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 30
    .line 31
    .line 32
    new-instance p0, Lcom/immomo/svgaplayer/SVGAParser$onComplete$$inlined$let$lambda$1;

    .line 33
    .line 34
    invoke-direct {p0, p1, p2}, Lcom/immomo/svgaplayer/SVGAParser$onComplete$$inlined$let$lambda$1;-><init>(Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;Lcom/immomo/svgaplayer/SVGAVideoEntity;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method private final onError(Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGAParser;->mContextRef:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/content/Context;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    new-instance p2, Landroid/os/Handler;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-direct {p2, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Lcom/immomo/svgaplayer/SVGAParser$onError$$inlined$let$lambda$1;

    .line 21
    .line 22
    invoke-direct {p0, p1}, Lcom/immomo/svgaplayer/SVGAParser$onError$$inlined$let$lambda$1;-><init>(Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p2, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method private final parse(Ljava/io/InputStream;)Lcom/immomo/svgaplayer/SVGAVideoEntity;
    .locals 1

    .line 50
    invoke-direct {p0, p1}, Lcom/immomo/svgaplayer/SVGAParser;->readAsBytes(Ljava/io/InputStream;)[B

    move-result-object p1

    if-eqz p1, :cond_0

    .line 51
    :try_start_0
    invoke-direct {p0, p1}, Lcom/immomo/svgaplayer/SVGAParser;->inflate([B)[B

    move-result-object p0

    if-eqz p0, :cond_0

    .line 52
    new-instance p1, Lcom/immomo/svgaplayer/SVGAVideoEntity;

    sget-object v0, Lcom/immomo/svgaplayer/proto/MovieEntity;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    invoke-virtual {v0, p0}, Lcom/squareup/wire/ProtoAdapter;->decode([B)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p0, Lcom/immomo/svgaplayer/proto/MovieEntity;

    invoke-direct {p1, p0}, Lcom/immomo/svgaplayer/SVGAVideoEntity;-><init>(Lcom/immomo/svgaplayer/proto/MovieEntity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p0

    .line 53
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static bridge synthetic parse$default(Lcom/immomo/svgaplayer/SVGAParser;Ljava/io/InputStream;Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;ZILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p4, p4, 0x4

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    const/4 p3, 0x0

    .line 6
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/svgaplayer/SVGAParser;->parse(Ljava/io/InputStream;Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic parseFile$default(Lcom/immomo/svgaplayer/SVGAParser;Ljava/lang/String;Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;ZILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p4, p4, 0x4

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    const/4 p3, 0x0

    .line 6
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/svgaplayer/SVGAParser;->parseFile(Ljava/lang/String;Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;Z)V

    .line 7
    .line 8
    .line 9
    return-void
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
.method public final getFileDownloader()Lcom/immomo/svgaplayer/SVGAParser$FileDownloader;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGAParser;->fileDownloader:Lcom/immomo/svgaplayer/SVGAParser$FileDownloader;

    .line 2
    .line 3
    return-object p0
.end method

.method public final onDestroy()V
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->Companion:Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer$Companion;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer$Companion;->getMSVGAThreadAdapter()Lcom/immomo/svgaplayer/adapter/SVGAThreadAdapter;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/immomo/svgaplayer/SVGAParser;->getTaskTag()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {v0, p0}, Lcom/immomo/svgaplayer/adapter/SVGAThreadAdapter;->cancelTaskByTag(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final parse(Ljava/io/InputStream;Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;Z)V
    .locals 1
    .param p1    # Ljava/io/InputStream;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 47
    new-instance v0, Lcom/immomo/svgaplayer/SVGAParser$parse$runnable$1;

    invoke-direct {v0, p0, p1, p3, p2}, Lcom/immomo/svgaplayer/SVGAParser$parse$runnable$1;-><init>(Lcom/immomo/svgaplayer/SVGAParser;Ljava/io/InputStream;ZLcom/immomo/svgaplayer/SVGAParser$ParseCompletion;)V

    .line 48
    sget-object p1, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->Companion:Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer$Companion;

    invoke-virtual {p1}, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer$Companion;->getMSVGAThreadAdapter()Lcom/immomo/svgaplayer/adapter/SVGAThreadAdapter;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/immomo/svgaplayer/SVGAParser;->getTaskTag()Ljava/lang/Object;

    move-result-object p0

    invoke-interface {p1, p0, v0}, Lcom/immomo/svgaplayer/adapter/SVGAThreadAdapter;->executeTaskByTag(Ljava/lang/Object;Ljava/lang/Runnable;)V

    return-void

    .line 49
    :cond_0
    new-instance p0, Ljava/lang/Thread;

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public final parse(Ljava/lang/String;Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;
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
    :try_start_0
    iget-object v0, p0, Lcom/immomo/svgaplayer/SVGAParser;->mContextRef:Ljava/lang/ref/WeakReference;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/content/Context;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    invoke-virtual {p0, p1, p2, v0}, Lcom/immomo/svgaplayer/SVGAParser;->parse(Ljava/io/InputStream;Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void

    .line 34
    :catch_0
    sget-object p1, Lcom/immomo/svgaplayer/ErrorConstant;->Companion:Lcom/immomo/svgaplayer/ErrorConstant$Companion;

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/immomo/svgaplayer/ErrorConstant$Companion;->getERROR_MMSVGA_RES_ASSETS_LOAD()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-direct {p0, p2, p1}, Lcom/immomo/svgaplayer/SVGAParser;->onError(Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final parse(Ljava/net/URL;Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;)V
    .locals 4
    .param p1    # Ljava/net/URL;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 44
    iget-object v0, p0, Lcom/immomo/svgaplayer/SVGAParser;->fileDownloader:Lcom/immomo/svgaplayer/SVGAParser$FileDownloader;

    invoke-direct {p0}, Lcom/immomo/svgaplayer/SVGAParser;->getTaskTag()Ljava/lang/Object;

    move-result-object v1

    new-instance v2, Lcom/immomo/svgaplayer/SVGAParser$parse$2;

    invoke-direct {v2, p0, p2}, Lcom/immomo/svgaplayer/SVGAParser$parse$2;-><init>(Lcom/immomo/svgaplayer/SVGAParser;Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;)V

    .line 45
    new-instance v3, Lcom/immomo/svgaplayer/SVGAParser$parse$3;

    invoke-direct {v3, p0, p2}, Lcom/immomo/svgaplayer/SVGAParser$parse$3;-><init>(Lcom/immomo/svgaplayer/SVGAParser;Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;)V

    .line 46
    invoke-virtual {v0, v1, p1, v2, v3}, Lcom/immomo/svgaplayer/SVGAParser$FileDownloader;->resume(Ljava/lang/Object;Ljava/net/URL;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public final parseFile(Ljava/lang/String;Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;Z)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/immomo/svgaplayer/SVGAParser$ParseCompletion;
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
    new-instance v0, Lcom/immomo/svgaplayer/SVGAParser$parseFile$runnable$1;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1, p3, p2}, Lcom/immomo/svgaplayer/SVGAParser$parseFile$runnable$1;-><init>(Lcom/immomo/svgaplayer/SVGAParser;Ljava/lang/String;ZLcom/immomo/svgaplayer/SVGAParser$ParseCompletion;)V

    .line 10
    .line 11
    .line 12
    sget-object p1, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->Companion:Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer$Companion;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer$Companion;->getMSVGAThreadAdapter()Lcom/immomo/svgaplayer/adapter/SVGAThreadAdapter;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    invoke-direct {p0}, Lcom/immomo/svgaplayer/SVGAParser;->getTaskTag()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-interface {p1, p0, v0}, Lcom/immomo/svgaplayer/adapter/SVGAThreadAdapter;->executeTaskByTag(Ljava/lang/Object;Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    new-instance p0, Ljava/lang/Thread;

    .line 29
    .line 30
    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/lang/Thread;->start()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final setFileDownloader(Lcom/immomo/svgaplayer/SVGAParser$FileDownloader;)V
    .locals 0
    .param p1    # Lcom/immomo/svgaplayer/SVGAParser$FileDownloader;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGAParser;->fileDownloader:Lcom/immomo/svgaplayer/SVGAParser$FileDownloader;

    .line 5
    .line 6
    return-void
.end method
