.class public final Lcom/tantan/library/svga/ResourceKey;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantan/library/svga/data/cache/Key;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantan/library/svga/ResourceKey$KeyBuilder;,
        Lcom/tantan/library/svga/ResourceKey$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0013\u0018\u0000 \u001f2\u00020\u0001:\u0002\u001f B\u000f\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u0008\u0010\u001c\u001a\u00020\u0006H\u0016J\u0008\u0010\u001d\u001a\u00020\u0006H\u0016J\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u0000R\u0010\u0010\u0005\u001a\u0004\u0018\u00010\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u0007\u001a\u00020\u0008X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\t\u0010\n\"\u0004\u0008\u000b\u0010\u000cR\u001a\u0010\r\u001a\u00020\u000eX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000f\u0010\u0010\"\u0004\u0008\u0011\u0010\u0012R\u001a\u0010\u0013\u001a\u00020\u000eX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0014\u0010\u0010\"\u0004\u0008\u0015\u0010\u0012R\u001a\u0010\u0016\u001a\u00020\u0006X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0017\u0010\u0018\"\u0004\u0008\u0019\u0010\u001aR\u000e\u0010\u001b\u001a\u00020\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006!"
    }
    d2 = {
        "Lcom/tantan/library/svga/ResourceKey;",
        "Lcom/tantan/library/svga/data/cache/Key;",
        "builder",
        "Lcom/tantan/library/svga/ResourceKey$KeyBuilder;",
        "(Lcom/tantan/library/svga/ResourceKey$KeyBuilder;)V",
        "error",
        "",
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
        "getPath",
        "()Ljava/lang/String;",
        "setPath",
        "(Ljava/lang/String;)V",
        "uuid",
        "cacheKey",
        "get",
        "transToErrorKey",
        "Companion",
        "KeyBuilder",
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


# static fields
.field public static final Companion:Lcom/tantan/library/svga/ResourceKey$Companion;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field private final error:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private inSampleSize:I

.field private isCacheable:Z

.field private isPreload:Z

.field private path:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final uuid:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/tantan/library/svga/ResourceKey$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/tantan/library/svga/ResourceKey$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/tantan/library/svga/ResourceKey;->Companion:Lcom/tantan/library/svga/ResourceKey$Companion;

    return-void
.end method

.method private constructor <init>(Lcom/tantan/library/svga/ResourceKey$KeyBuilder;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->getPath$svga_lib_release()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/tantan/library/svga/ResourceKey;->path:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->getError$svga_lib_release()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/tantan/library/svga/ResourceKey;->error:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->isCacheable$svga_lib_release()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput-boolean v0, p0, Lcom/tantan/library/svga/ResourceKey;->isCacheable:Z

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->isPreload$svga_lib_release()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iput-boolean v0, p0, Lcom/tantan/library/svga/ResourceKey;->isPreload:Z

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/tantan/library/svga/ResourceKey$KeyBuilder;->getInSampleSize$svga_lib_release()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    iput p1, p0, Lcom/tantan/library/svga/ResourceKey;->inSampleSize:I

    .line 33
    .line 34
    sget-object p1, Lcom/tantan/library/svga/ResourceKey;->Companion:Lcom/tantan/library/svga/ResourceKey$Companion;

    .line 35
    .line 36
    iget-object v0, p0, Lcom/tantan/library/svga/ResourceKey;->path:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/ResourceKey$Companion;->cacheKey(Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Lcom/tantan/library/svga/ResourceKey;->uuid:Ljava/lang/String;

    .line 43
    .line 44
    return-void
.end method

.method public synthetic constructor <init>(Lcom/tantan/library/svga/ResourceKey$KeyBuilder;Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 45
    invoke-direct {p0, p1}, Lcom/tantan/library/svga/ResourceKey;-><init>(Lcom/tantan/library/svga/ResourceKey$KeyBuilder;)V

    return-void
.end method


# virtual methods
.method public cacheKey()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/ResourceKey;->uuid:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public get()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/ResourceKey;->path:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getInSampleSize$svga_lib_release()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantan/library/svga/ResourceKey;->inSampleSize:I

    .line 2
    .line 3
    return p0
.end method

.method public final getPath()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/ResourceKey;->path:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final isCacheable$svga_lib_release()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tantan/library/svga/ResourceKey;->isCacheable:Z

    .line 2
    .line 3
    return p0
.end method

.method public final isPreload$svga_lib_release()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tantan/library/svga/ResourceKey;->isPreload:Z

    .line 2
    .line 3
    return p0
.end method

.method public final setCacheable$svga_lib_release(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tantan/library/svga/ResourceKey;->isCacheable:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setInSampleSize$svga_lib_release(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantan/library/svga/ResourceKey;->inSampleSize:I

    .line 2
    .line 3
    return-void
.end method

.method public final setPath(Ljava/lang/String;)V
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
    iput-object p1, p0, Lcom/tantan/library/svga/ResourceKey;->path:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public final setPreload$svga_lib_release(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tantan/library/svga/ResourceKey;->isPreload:Z

    .line 2
    .line 3
    return-void
.end method

.method public final transToErrorKey()Lcom/tantan/library/svga/ResourceKey;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/ResourceKey;->error:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/tantan/library/svga/ResourceKey;->error:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/tantan/library/svga/ResourceKey;->path:Ljava/lang/String;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method
