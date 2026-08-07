.class public final Ll/tpy$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/tpy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0012\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u0007\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J%\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\t0\u00082\u0006\u0010\u0005\u001a\u00020\u00042\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\n\u0010\u000bJ%\u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u00082\u0006\u0010\u0005\u001a\u00020\u00042\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\r\u0010\u000bJ%\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\t0\u00082\u0006\u0010\u0005\u001a\u00020\u00042\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\u000e\u0010\u000bR\u0014\u0010\u0010\u001a\u00020\u000f8\u0002X\u0082T\u00a2\u0006\u0006\n\u0004\u0008\u0010\u0010\u0011R\u0014\u0010\u0012\u001a\u00020\u000f8\u0002X\u0082T\u00a2\u0006\u0006\n\u0004\u0008\u0012\u0010\u0011R\u0014\u0010\u0013\u001a\u00020\u000f8\u0002X\u0082T\u00a2\u0006\u0006\n\u0004\u0008\u0013\u0010\u0011R\u0014\u0010\u0014\u001a\u00020\u000f8\u0002X\u0082T\u00a2\u0006\u0006\n\u0004\u0008\u0014\u0010\u0011R\u0014\u0010\u0015\u001a\u00020\u000f8\u0002X\u0082T\u00a2\u0006\u0006\n\u0004\u0008\u0015\u0010\u0011\u00a8\u0006\u0016"
    }
    d2 = {
        "Ll/tpy$a;",
        "",
        "<init>",
        "()V",
        "Ljava/io/File;",
        "diskMemoryLocation",
        "Ll/axl;",
        "logger",
        "Ll/epy;",
        "",
        "b",
        "(Ljava/io/File;Ll/axl;)Ll/epy;",
        "Landroid/graphics/Bitmap;",
        "c",
        "a",
        "",
        "IMAGE_CACHE_MIN_KB",
        "J",
        "GIF_CACHE_MIN_KB",
        "FILE_CACHE_MIN_KB",
        "IMAGE_SIZE_MAX_DISK",
        "FILE_SIZE_MAX_DISK",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/tpy$a;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Ljava/io/File;Ll/axl;)Ll/epy;
    .locals 8
    .param p1    # Ljava/io/File;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/axl;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Ll/axl;",
            ")",
            "Ll/epy<",
            "[B>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/spy;

    .line 5
    .line 6
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ljava/lang/Runtime;->maxMemory()J

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    const-wide/32 v3, 0x8000

    .line 15
    .line 16
    .line 17
    div-long v3, v1, v3

    .line 18
    .line 19
    const-wide/16 v5, 0x1400

    .line 20
    .line 21
    const-wide/16 v1, 0x3c00

    .line 22
    .line 23
    move-object v7, p1

    .line 24
    invoke-direct/range {v0 .. v7}, Ll/spy;-><init>(JJJLjava/io/File;)V

    .line 25
    .line 26
    .line 27
    new-instance p0, Ll/bji;

    .line 28
    .line 29
    invoke-direct {p0, v0, p2}, Ll/bji;-><init>(Ll/spy;Ll/axl;)V

    .line 30
    .line 31
    .line 32
    return-object p0
.end method

.method public final b(Ljava/io/File;Ll/axl;)Ll/epy;
    .locals 8
    .param p1    # Ljava/io/File;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/axl;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Ll/axl;",
            ")",
            "Ll/epy<",
            "[B>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/spy;

    .line 5
    .line 6
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ljava/lang/Runtime;->maxMemory()J

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    const-wide/32 v3, 0x8000

    .line 15
    .line 16
    .line 17
    div-long v3, v1, v3

    .line 18
    .line 19
    const-wide/16 v5, 0x1400

    .line 20
    .line 21
    const-wide/16 v1, 0x1400

    .line 22
    .line 23
    move-object v7, p1

    .line 24
    invoke-direct/range {v0 .. v7}, Ll/spy;-><init>(JJJLjava/io/File;)V

    .line 25
    .line 26
    .line 27
    new-instance p0, Ll/xqm;

    .line 28
    .line 29
    invoke-direct {p0, v0, p2}, Ll/xqm;-><init>(Ll/spy;Ll/axl;)V

    .line 30
    .line 31
    .line 32
    return-object p0
.end method

.method public final c(Ljava/io/File;Ll/axl;)Ll/epy;
    .locals 8
    .param p1    # Ljava/io/File;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/axl;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Ll/axl;",
            ")",
            "Ll/epy<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/spy;

    .line 5
    .line 6
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ljava/lang/Runtime;->maxMemory()J

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    const-wide/32 v3, 0x8000

    .line 15
    .line 16
    .line 17
    div-long v3, v1, v3

    .line 18
    .line 19
    const-wide/16 v5, 0x1400

    .line 20
    .line 21
    const-wide/16 v1, 0x5000

    .line 22
    .line 23
    move-object v7, p1

    .line 24
    invoke-direct/range {v0 .. v7}, Ll/spy;-><init>(JJJLjava/io/File;)V

    .line 25
    .line 26
    .line 27
    new-instance p0, Ll/zqm;

    .line 28
    .line 29
    invoke-direct {p0, v0, p2}, Ll/zqm;-><init>(Ll/spy;Ll/axl;)V

    .line 30
    .line 31
    .line 32
    return-object p0
.end method
