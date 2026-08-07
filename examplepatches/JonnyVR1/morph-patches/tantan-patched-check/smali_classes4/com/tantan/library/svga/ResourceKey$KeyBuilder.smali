.class public final Lcom/tantan/library/svga/ResourceKey$KeyBuilder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/library/svga/ResourceKey;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "KeyBuilder"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0006\u0010\u001b\u001a\u00020\u001cJ\u000e\u0010\u0003\u001a\u00020\u00002\u0006\u0010\u0003\u001a\u00020\u0004J\u000e\u0010\u0018\u001a\u00020\u00002\u0006\u0010\u0018\u001a\u00020\u0004J\u000e\u0010\u001d\u001a\u00020\u00002\u0006\u0010\u000f\u001a\u00020\u0010J\u000e\u0010\u001e\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\nJ\u000e\u0010\u001f\u001a\u00020\u00002\u0006\u0010\u0015\u001a\u00020\u0010R\u001c\u0010\u0003\u001a\u0004\u0018\u00010\u0004X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006\"\u0004\u0008\u0007\u0010\u0008R\u001a\u0010\t\u001a\u00020\nX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000b\u0010\u000c\"\u0004\u0008\r\u0010\u000eR\u001a\u0010\u000f\u001a\u00020\u0010X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0011\u0010\u0012\"\u0004\u0008\u0013\u0010\u0014R\u001a\u0010\u0015\u001a\u00020\u0010X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0016\u0010\u0012\"\u0004\u0008\u0017\u0010\u0014R\u001a\u0010\u0018\u001a\u00020\u0004X\u0080.\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0019\u0010\u0006\"\u0004\u0008\u001a\u0010\u0008\u00a8\u0006 "
    }
    d2 = {
        "Lcom/tantan/library/svga/ResourceKey$KeyBuilder;",
        "",
        "()V",
        "error",
        "",
        "getError$svga_lib_release",
        "()Ljava/lang/String;",
        "setError$svga_lib_release",
        "(Ljava/lang/String;)V",
        "inSampleSize",
        "",
        "getInSampleSize$svga_lib_release",
        "()I",
        "setInSampleSize$svga_lib_release",
        "(I)V",
        "isCacheable",
        "",
        "isCacheable$svga_lib_release",
        "()Z",
        "setCacheable$svga_lib_release",
        "(Z)V",
        "isPreload",
        "isPreload$svga_lib_release",
        "setPreload$svga_lib_release",
        "path",
        "getPath$svga_lib_release",
        "setPath$svga_lib_release",
        "build",
        "Lcom/tantan/library/svga/ResourceKey;",
        "setCacheable",
        "setInSampleSize",
        "setPreload",
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
.field private error:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private inSampleSize:I

.field private isCacheable:Z

.field private isPreload:Z

.field public path:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->isCacheable:Z

    .line 6
    .line 7
    sget-object v0, Lcom/tantan/library/svga/SVGALoader;->INSTANCE:Lcom/tantan/library/svga/SVGALoader;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGALoader;->getInSampleSize()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->inSampleSize:I

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final build()Lcom/tantan/library/svga/ResourceKey;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Lcom/tantan/library/svga/ResourceKey;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/tantan/library/svga/ResourceKey;-><init>(Lcom/tantan/library/svga/ResourceKey$KeyBuilder;Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public final error(Ljava/lang/String;)Lcom/tantan/library/svga/ResourceKey$KeyBuilder;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->error:Ljava/lang/String;

    .line 5
    .line 6
    return-object p0
.end method

.method public final getError$svga_lib_release()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->error:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getInSampleSize$svga_lib_release()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->inSampleSize:I

    .line 2
    .line 3
    return p0
.end method

.method public final getPath$svga_lib_release()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->path:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "path"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final isCacheable$svga_lib_release()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->isCacheable:Z

    .line 2
    .line 3
    return p0
.end method

.method public final isPreload$svga_lib_release()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->isPreload:Z

    .line 2
    .line 3
    return p0
.end method

.method public final path(Ljava/lang/String;)Lcom/tantan/library/svga/ResourceKey$KeyBuilder;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->setPath$svga_lib_release(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method

.method public final setCacheable(Z)Lcom/tantan/library/svga/ResourceKey$KeyBuilder;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iput-boolean p1, p0, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->isCacheable:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public final setCacheable$svga_lib_release(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->isCacheable:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setError$svga_lib_release(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->error:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final setInSampleSize(I)Lcom/tantan/library/svga/ResourceKey$KeyBuilder;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iput p1, p0, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->inSampleSize:I

    .line 2
    .line 3
    return-object p0
.end method

.method public final setInSampleSize$svga_lib_release(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->inSampleSize:I

    .line 2
    .line 3
    return-void
.end method

.method public final setPath$svga_lib_release(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->path:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public final setPreload(Z)Lcom/tantan/library/svga/ResourceKey$KeyBuilder;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iput-boolean p1, p0, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->isPreload:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public final setPreload$svga_lib_release(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->isPreload:Z

    .line 2
    .line 3
    return-void
.end method
