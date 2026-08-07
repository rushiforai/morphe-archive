.class public final Lcom/tantan/library/svga/SVGA$initCacheProvider$directoryGetter$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantan/library/svga/data/cache/disk/DiskCacheFactory$CacheDirectoryGetter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantan/library/svga/SVGA;->initCacheProvider(Landroid/app/Application;Lcom/tantan/library/svga/SVGAConfig;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0013\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001R\u0014\u0010\u0002\u001a\u00020\u00038VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0004\u0010\u0005\u00a8\u0006\u0006"
    }
    d2 = {
        "com/tantan/library/svga/SVGA$initCacheProvider$directoryGetter$1",
        "Lcom/tantan/library/svga/data/cache/disk/DiskCacheFactory$CacheDirectoryGetter;",
        "cacheDirectory",
        "Ljava/io/File;",
        "getCacheDirectory",
        "()Ljava/io/File;",
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


# instance fields
.field final synthetic $app:Landroid/app/Application;

.field final synthetic $config:Lcom/tantan/library/svga/SVGAConfig;


# direct methods
.method public constructor <init>(Lcom/tantan/library/svga/SVGAConfig;Landroid/app/Application;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/SVGA$initCacheProvider$directoryGetter$1;->$config:Lcom/tantan/library/svga/SVGAConfig;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tantan/library/svga/SVGA$initCacheProvider$directoryGetter$1;->$app:Landroid/app/Application;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getCacheDirectory()Ljava/io/File;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tantan/library/svga/SVGA$initCacheProvider$directoryGetter$1;->$config:Lcom/tantan/library/svga/SVGAConfig;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/tantan/library/svga/SVGAConfig;->getDiskCacheDir()Ljava/io/File;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/tantan/library/svga/SVGA$initCacheProvider$directoryGetter$1;->$app:Landroid/app/Application;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    :cond_0
    const-string p0, "svga"

    .line 18
    .line 19
    invoke-direct {v0, v1, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method
