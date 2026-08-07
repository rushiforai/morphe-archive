.class public final Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0018\u0010\u0006\u001a\u00020\u00072\u0008\u0010\u0008\u001a\u0004\u0018\u00010\t2\u0006\u0010\n\u001a\u00020\u000bR\u000e\u0010\u0003\u001a\u00020\u0004X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0082T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000c"
    }
    d2 = {
        "Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper$Companion;",
        "",
        "()V",
        "APP_VERSION",
        "",
        "VALUE_COUNT",
        "create",
        "Lcom/tantan/library/svga/data/cache/disk/DiskCache;",
        "directory",
        "Ljava/io/File;",
        "maxSize",
        "",
        "svga_lib_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final create(Ljava/io/File;J)Lcom/tantan/library/svga/data/cache/disk/DiskCache;
    .locals 0
    .param p1    # Ljava/io/File;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance p0, Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2, p3}, Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper;-><init>(Ljava/io/File;J)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
