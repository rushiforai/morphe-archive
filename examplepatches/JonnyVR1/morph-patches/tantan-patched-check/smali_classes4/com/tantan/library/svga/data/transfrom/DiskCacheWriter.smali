.class public final Lcom/tantan/library/svga/data/transfrom/DiskCacheWriter;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantan/library/svga/data/cache/disk/DiskCache$Writer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<DataType:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/tantan/library/svga/data/cache/disk/DiskCache$Writer;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u0000*\u0004\u0008\u0000\u0010\u00012\u00020\u0002B\u001d\u0012\u000c\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0004\u0012\u0008\u0010\u0005\u001a\u0004\u0018\u00018\u0000\u00a2\u0006\u0002\u0010\u0006J\u0010\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bH\u0016R\u0012\u0010\u0005\u001a\u0004\u0018\u00018\u0000X\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u0007R\u0014\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000c"
    }
    d2 = {
        "Lcom/tantan/library/svga/data/transfrom/DiskCacheWriter;",
        "DataType",
        "Lcom/tantan/library/svga/data/cache/disk/DiskCache$Writer;",
        "encoder",
        "Lcom/tantan/library/svga/data/transfrom/Encoder;",
        "data",
        "(Lcom/tantan/library/svga/data/transfrom/Encoder;Ljava/lang/Object;)V",
        "Ljava/lang/Object;",
        "write",
        "",
        "file",
        "Ljava/io/File;",
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
.field private final data:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TDataType;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final encoder:Lcom/tantan/library/svga/data/transfrom/Encoder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantan/library/svga/data/transfrom/Encoder<",
            "TDataType;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/tantan/library/svga/data/transfrom/Encoder;Ljava/lang/Object;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/data/transfrom/Encoder;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/data/transfrom/Encoder<",
            "TDataType;>;TDataType;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/tantan/library/svga/data/transfrom/DiskCacheWriter;->encoder:Lcom/tantan/library/svga/data/transfrom/Encoder;

    .line 8
    .line 9
    iput-object p2, p0, Lcom/tantan/library/svga/data/transfrom/DiskCacheWriter;->data:Ljava/lang/Object;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public write(Ljava/io/File;)Z
    .locals 2
    .param p1    # Ljava/io/File;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    :try_start_0
    iget-object v1, p0, Lcom/tantan/library/svga/data/transfrom/DiskCacheWriter;->data:Ljava/lang/Object;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tantan/library/svga/data/transfrom/DiskCacheWriter;->encoder:Lcom/tantan/library/svga/data/transfrom/Encoder;

    .line 10
    .line 11
    invoke-interface {p0, v1, p1}, Lcom/tantan/library/svga/data/transfrom/Encoder;->encode(Ljava/lang/Object;Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :catch_0
    :cond_0
    return v0
.end method
