.class public final Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000R\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010%\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u00c0\u0002\u0018\u00002\u00020\u0001:\u0001#B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J1\u0010\u000c\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0012\u0010\u000b\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\n0\u0008\u00a2\u0006\u0004\u0008\u000c\u0010\rJ7\u0010\u0011\u001a\u0004\u0018\u00010\u00102\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0014\u0010\u000f\u001a\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u000eH\u0002\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J;\u0010\u0015\u001a\u0008\u0012\u0004\u0012\u00020\n0\u00142\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0013\u001a\u00020\u00102\u0014\u0010\u000f\u001a\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u000eH\u0002\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J;\u0010\u0017\u001a\u0008\u0012\u0004\u0012\u00020\n0\u00142\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0013\u001a\u00020\u00102\u0014\u0010\u000f\u001a\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u000eH\u0002\u00a2\u0006\u0004\u0008\u0017\u0010\u0016J;\u0010\u0018\u001a\u0008\u0012\u0004\u0012\u00020\n0\u00142\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0013\u001a\u00020\u00102\u0014\u0010\u000f\u001a\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u000eH\u0002\u00a2\u0006\u0004\u0008\u0018\u0010\u0016J;\u0010\u0019\u001a\u0008\u0012\u0004\u0012\u00020\n0\u00142\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0013\u001a\u00020\u00102\u0014\u0010\u000f\u001a\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u000eH\u0002\u00a2\u0006\u0004\u0008\u0019\u0010\u0016J;\u0010\u001a\u001a\u0008\u0012\u0004\u0012\u00020\n0\u00142\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0013\u001a\u00020\u00102\u0014\u0010\u000f\u001a\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u000eH\u0002\u00a2\u0006\u0004\u0008\u001a\u0010\u0016J%\u0010\u001d\u001a\u0008\u0012\u0004\u0012\u00020\u001c0\u001b2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0013\u001a\u00020\u0010H\u0002\u00a2\u0006\u0004\u0008\u001d\u0010\u001eJ+\u0010!\u001a\u0008\u0012\u0004\u0012\u00020 0\u001b2\u0006\u0010\u0013\u001a\u00020\u00102\u000c\u0010\u001f\u001a\u0008\u0012\u0004\u0012\u00020\u001c0\u001bH\u0002\u00a2\u0006\u0004\u0008!\u0010\"\u00a8\u0006$"
    }
    d2 = {
        "Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;",
        "",
        "<init>",
        "()V",
        "Lcom/tantanapp/sharedlibrary/loader/a;",
        "config",
        "",
        "module",
        "Lkotlin/Function1;",
        "Lcom/tantanapp/sharedlibrary/loader/LoadEvent;",
        "",
        "callback",
        "m",
        "(Lcom/tantanapp/sharedlibrary/loader/a;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V",
        "",
        "extras",
        "Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;",
        "f",
        "(Lcom/tantanapp/sharedlibrary/loader/a;Ljava/lang/String;Ljava/util/Map;)Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;",
        "moduleZipInfo",
        "Ll/q5d0;",
        "j",
        "(Lcom/tantanapp/sharedlibrary/loader/a;Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;Ljava/util/Map;)Ll/q5d0;",
        "h",
        "n",
        "g",
        "p",
        "",
        "Lcom/tantanapp/sharedlibrary/loader/internal/SoInfo;",
        "k",
        "(Lcom/tantanapp/sharedlibrary/loader/a;Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;)Ljava/util/List;",
        "missingSoInfoList",
        "Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;",
        "l",
        "(Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;Ljava/util/List;)Ljava/util/List;",
        "a",
        "loader_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final INSTANCE:Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;

    invoke-direct {v0}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;-><init>()V

    sput-object v0, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;->INSTANCE:Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic a(Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;Lcom/tantanapp/sharedlibrary/loader/a;Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;Ljava/util/Map;)Ll/q5d0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;->g(Lcom/tantanapp/sharedlibrary/loader/a;Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;Ljava/util/Map;)Ll/q5d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic b(Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;Lcom/tantanapp/sharedlibrary/loader/a;Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;Ljava/util/Map;)Ll/q5d0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;->h(Lcom/tantanapp/sharedlibrary/loader/a;Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;Ljava/util/Map;)Ll/q5d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic c(Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;Lcom/tantanapp/sharedlibrary/loader/a;Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;Ljava/util/Map;)Ll/q5d0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;->j(Lcom/tantanapp/sharedlibrary/loader/a;Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;Ljava/util/Map;)Ll/q5d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic d(Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;Lcom/tantanapp/sharedlibrary/loader/a;Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;Ljava/util/Map;)Ll/q5d0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;->n(Lcom/tantanapp/sharedlibrary/loader/a;Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;Ljava/util/Map;)Ll/q5d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic e(Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;Lcom/tantanapp/sharedlibrary/loader/a;Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;Ljava/util/Map;)Ll/q5d0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;->p(Lcom/tantanapp/sharedlibrary/loader/a;Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;Ljava/util/Map;)Ll/q5d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final i(Ljava/util/Map;Lcom/tantanapp/sharedlibrary/loader/a;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/tantanapp/sharedlibrary/loader/a;",
            ")",
            "Ljava/util/List<",
            "Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "missing_zip_info_list"

    .line 2
    .line 3
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    check-cast p0, Ljava/util/List;

    .line 11
    .line 12
    check-cast p0, Ljava/lang/Iterable;

    .line 13
    .line 14
    new-instance v0, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    move-object v2, v1

    .line 34
    check-cast v2, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;

    .line 35
    .line 36
    new-instance v3, Ljava/io/File;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/a;->a()Ljava/io/File;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-virtual {v2}, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;->getName()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2}, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;->getMd5()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-static {v3, v2}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->a(Ljava/io/File;Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_0

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    invoke-static {v3}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->e(Ljava/io/File;)V

    .line 61
    .line 62
    .line 63
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    const-string p1, "checkDownload="

    .line 70
    .line 71
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    sget-object v6, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$download$checkDownload$2$1;->INSTANCE:Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$download$checkDownload$2$1;

    .line 75
    .line 76
    const/16 v7, 0x1f

    .line 77
    .line 78
    const/4 v8, 0x0

    .line 79
    const/4 v1, 0x0

    .line 80
    const/4 v2, 0x0

    .line 81
    const/4 v3, 0x0

    .line 82
    const/4 v4, 0x0

    .line 83
    const/4 v5, 0x0

    .line 84
    invoke-static/range {v0 .. v8}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-static {p0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    return-object v0
.end method

.method public static final o(Ljava/util/Map;Lcom/tantanapp/sharedlibrary/loader/a;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/tantanapp/sharedlibrary/loader/a;",
            ")Z"
        }
    .end annotation

    .line 1
    const-string v0, "missing_so_info_list"

    .line 2
    .line 3
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    check-cast p0, Ljava/util/List;

    .line 11
    .line 12
    check-cast p0, Ljava/lang/Iterable;

    .line 13
    .line 14
    instance-of v0, p0, Ljava/util/Collection;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    move-object v0, p0

    .line 20
    check-cast v0, Ljava/util/Collection;

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    return v1

    .line 29
    :cond_0
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Lcom/tantanapp/sharedlibrary/loader/internal/SoInfo;

    .line 44
    .line 45
    new-instance v2, Ljava/io/File;

    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/a;->m()Ljava/io/File;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-virtual {v0}, Lcom/tantanapp/sharedlibrary/loader/internal/SoInfo;->getName()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/tantanapp/sharedlibrary/loader/internal/SoInfo;->getMd5()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {v2, v0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->a(Ljava/io/File;Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_1

    .line 67
    .line 68
    const/4 p0, 0x0

    .line 69
    return p0

    .line 70
    :cond_2
    return v1
.end method


# virtual methods
.method public final f(Lcom/tantanapp/sharedlibrary/loader/a;Ljava/lang/String;Ljava/util/Map;)Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/sharedlibrary/loader/a;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;->INSTANCE:Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    const-string p0, "checkNeedLoad apkHasSoFiles=true"

    .line 11
    .line 12
    invoke-static {p0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-object v2

    .line 16
    :cond_0
    invoke-virtual {v0, p2}, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;->g(Ljava/lang/String;)Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;->k(Lcom/tantanapp/sharedlibrary/loader/a;Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;)Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    const-string p0, "checkNeedLoad verifySo success"

    .line 31
    .line 32
    invoke-static {p0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-object v2

    .line 36
    :cond_1
    invoke-virtual {p0, p2, v0}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;->l(Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;Ljava/util/List;)Ljava/util/List;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string v1, "missing_so_info_list"

    .line 41
    .line 42
    invoke-interface {p3, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    const-string v1, "missing_zip_info_list"

    .line 46
    .line 47
    invoke-interface {p3, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    new-instance p3, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v1, "EXTRA_MISSING_SO_INFO_LIST="

    .line 53
    .line 54
    invoke-direct {p3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p3

    .line 64
    invoke-static {p3}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    new-instance p3, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    const-string v0, "EXTRA_MISSING_ZIP_INFO_LIST="

    .line 70
    .line 71
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-static {p0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    new-instance p0, Ljava/lang/StringBuilder;

    .line 85
    .line 86
    const-string p3, "checkNeedLoad delete and make unzip dir="

    .line 87
    .line 88
    invoke-direct {p0, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/a;->m()Ljava/io/File;

    .line 92
    .line 93
    .line 94
    move-result-object p3

    .line 95
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-static {p0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/a;->m()Ljava/io/File;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-static {p0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->e(Ljava/io/File;)V

    .line 110
    .line 111
    .line 112
    invoke-static {p0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->f(Ljava/io/File;)Ljava/io/File;

    .line 113
    .line 114
    .line 115
    return-object p2
.end method

.method public final g(Lcom/tantanapp/sharedlibrary/loader/a;Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;Ljava/util/Map;)Ll/q5d0;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/sharedlibrary/loader/a;",
            "Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ll/q5d0<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string p2, "mergeSo: soPathFileListBeforeCopyNew="

    .line 4
    .line 5
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/a;->l()Ljava/io/File;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    invoke-virtual {p2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    const/4 p3, 0x0

    .line 17
    if-nez p2, :cond_0

    .line 18
    .line 19
    new-array p2, p3, [Ljava/io/File;

    .line 20
    .line 21
    :cond_0
    move-object v0, p2

    .line 22
    sget-object v6, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$copySo$1;->INSTANCE:Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$copySo$1;

    .line 23
    .line 24
    const/16 v7, 0x1f

    .line 25
    .line 26
    const/4 v8, 0x0

    .line 27
    const/4 v1, 0x0

    .line 28
    const/4 v2, 0x0

    .line 29
    const/4 v3, 0x0

    .line 30
    const/4 v4, 0x0

    .line 31
    const/4 v5, 0x0

    .line 32
    invoke-static/range {v0 .. v8}, Lkotlin/collections/ArraysKt;->joinToString$default([Ljava/lang/Object;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {p0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/a;->m()Ljava/io/File;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    if-nez p0, :cond_1

    .line 55
    .line 56
    new-array p0, p3, [Ljava/io/File;

    .line 57
    .line 58
    :cond_1
    invoke-static {p0}, Lkotlin/collections/ArraysKt;->toList([Ljava/lang/Object;)Ljava/util/List;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    new-instance p2, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    const-string v0, "mergeSo: unzipFileList="

    .line 65
    .line 66
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    move-object v1, p0

    .line 70
    check-cast v1, Ljava/lang/Iterable;

    .line 71
    .line 72
    sget-object v7, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$copySo$2;->INSTANCE:Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$copySo$2;

    .line 73
    .line 74
    const/16 v8, 0x1f

    .line 75
    .line 76
    const/4 v9, 0x0

    .line 77
    const/4 v2, 0x0

    .line 78
    const/4 v3, 0x0

    .line 79
    const/4 v4, 0x0

    .line 80
    const/4 v5, 0x0

    .line 81
    const/4 v6, 0x0

    .line 82
    invoke-static/range {v1 .. v9}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-static {p0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    :cond_2
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 101
    .line 102
    .line 103
    move-result p2

    .line 104
    if-eqz p2, :cond_4

    .line 105
    .line 106
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    move-object v0, p2

    .line 111
    check-cast v0, Ljava/io/File;

    .line 112
    .line 113
    new-instance v1, Ljava/io/File;

    .line 114
    .line 115
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/a;->l()Ljava/io/File;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    invoke-direct {v1, p2, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 127
    .line 128
    .line 129
    move-result p2

    .line 130
    new-instance v2, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    const-string v3, "mergeSo: copyTo file="

    .line 133
    .line 134
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    const-string v3, ", exist="

    .line 141
    .line 142
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    invoke-static {v2}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    if-eqz p2, :cond_3

    .line 156
    .line 157
    :try_start_0
    sget-object p2, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 158
    .line 159
    const/4 v4, 0x4

    .line 160
    const/4 v5, 0x0

    .line 161
    const/4 v2, 0x1

    .line 162
    const/4 v3, 0x0

    .line 163
    invoke-static/range {v0 .. v5}, Ll/yki;->q(Ljava/io/File;Ljava/io/File;ZIILjava/lang/Object;)Ljava/io/File;

    .line 164
    .line 165
    .line 166
    move-result-object p2

    .line 167
    invoke-static {p2}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 171
    goto :goto_1

    .line 172
    :catchall_0
    move-exception v0

    .line 173
    move-object p2, v0

    .line 174
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 175
    .line 176
    invoke-static {p2}, Lkotlin/ResultKt;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    move-result-object p2

    .line 180
    invoke-static {p2}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object p2

    .line 184
    :goto_1
    invoke-static {p2}, Lkotlin/Result;->exceptionOrNull-impl(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 185
    .line 186
    .line 187
    move-result-object p2

    .line 188
    if-eqz p2, :cond_2

    .line 189
    .line 190
    new-instance p2, Ljava/lang/StringBuilder;

    .line 191
    .line 192
    const-string v0, "mergeSo: copyTo failed file="

    .line 193
    .line 194
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object p2

    .line 204
    invoke-static {p2}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 205
    .line 206
    .line 207
    goto :goto_0

    .line 208
    :cond_3
    const/4 v4, 0x4

    .line 209
    const/4 v5, 0x0

    .line 210
    const/4 v2, 0x1

    .line 211
    const/4 v3, 0x0

    .line 212
    invoke-static/range {v0 .. v5}, Ll/yki;->q(Ljava/io/File;Ljava/io/File;ZIILjava/lang/Object;)Ljava/io/File;

    .line 213
    .line 214
    .line 215
    goto :goto_0

    .line 216
    :cond_4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 217
    .line 218
    const-string p2, "mergeSo: soPathFileListAfterCopyNew="

    .line 219
    .line 220
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/a;->l()Ljava/io/File;

    .line 224
    .line 225
    .line 226
    move-result-object p2

    .line 227
    invoke-virtual {p2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 228
    .line 229
    .line 230
    move-result-object p2

    .line 231
    if-nez p2, :cond_5

    .line 232
    .line 233
    new-array p2, p3, [Ljava/io/File;

    .line 234
    .line 235
    :cond_5
    move-object v0, p2

    .line 236
    sget-object v6, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$copySo$4;->INSTANCE:Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$copySo$4;

    .line 237
    .line 238
    const/16 v7, 0x1f

    .line 239
    .line 240
    const/4 v8, 0x0

    .line 241
    const/4 v1, 0x0

    .line 242
    const/4 v2, 0x0

    .line 243
    const/4 v3, 0x0

    .line 244
    const/4 v4, 0x0

    .line 245
    const/4 v5, 0x0

    .line 246
    invoke-static/range {v0 .. v8}, Lkotlin/collections/ArraysKt;->joinToString$default([Ljava/lang/Object;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object p2

    .line 250
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object p0

    .line 257
    invoke-static {p0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/a;->m()Ljava/io/File;

    .line 261
    .line 262
    .line 263
    move-result-object p0

    .line 264
    invoke-static {p0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->e(Ljava/io/File;)V

    .line 265
    .line 266
    .line 267
    sget-object p0, Ll/q5d0;->Companion:Ll/q5d0$a;

    .line 268
    .line 269
    invoke-virtual {p0}, Ll/q5d0$a;->d()Ll/q5d0;

    .line 270
    .line 271
    .line 272
    move-result-object p0

    .line 273
    return-object p0
.end method

.method public final h(Lcom/tantanapp/sharedlibrary/loader/a;Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;Ljava/util/Map;)Ll/q5d0;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/sharedlibrary/loader/a;",
            "Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ll/q5d0<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p3, p1}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;->i(Ljava/util/Map;Lcom/tantanapp/sharedlibrary/loader/a;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    const-string p0, "download skip"

    .line 12
    .line 13
    invoke-static {p0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    sget-object p0, Ll/q5d0;->Companion:Ll/q5d0$a;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/q5d0$a;->d()Ll/q5d0;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_0
    new-instance p2, Ljava/util/concurrent/CountDownLatch;

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-direct {p2, v0}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 30
    .line 31
    .line 32
    new-instance v0, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 35
    .line 36
    .line 37
    check-cast p0, Ljava/lang/Iterable;

    .line 38
    .line 39
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;

    .line 54
    .line 55
    new-instance v2, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    const-string v3, "download: url="

    .line 58
    .line 59
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1}, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;->getUrl()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string v3, ", path="

    .line 70
    .line 71
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/a;->a()Ljava/io/File;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string v3, ", fileName="

    .line 86
    .line 87
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;->getName()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-static {v2}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/a;->d()Lcom/tantanapp/sharedlibrary/loader/a$a;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    invoke-virtual {v1}, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;->getUrl()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/a;->a()Ljava/io/File;

    .line 113
    .line 114
    .line 115
    move-result-object v4

    .line 116
    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v4

    .line 120
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v1}, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;->getName()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v5

    .line 127
    new-instance v6, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$download$1$1;

    .line 128
    .line 129
    invoke-direct {v6, v1, v0, p2}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$download$1$1;-><init>(Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;Ljava/util/List;Ljava/util/concurrent/CountDownLatch;)V

    .line 130
    .line 131
    .line 132
    invoke-interface {v2, v3, v4, v5, v6}, Lcom/tantanapp/sharedlibrary/loader/a$a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    .line 133
    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_1
    invoke-virtual {p2}, Ljava/util/concurrent/CountDownLatch;->await()V

    .line 137
    .line 138
    .line 139
    invoke-static {p3, p1}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;->i(Ljava/util/Map;Lcom/tantanapp/sharedlibrary/loader/a;)Ljava/util/List;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    if-eqz p1, :cond_2

    .line 148
    .line 149
    sget-object p0, Ll/q5d0;->Companion:Ll/q5d0$a;

    .line 150
    .line 151
    invoke-virtual {p0}, Ll/q5d0$a;->d()Ll/q5d0;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    return-object p0

    .line 156
    :cond_2
    sget-object p1, Ll/q5d0;->Companion:Ll/q5d0$a;

    .line 157
    .line 158
    new-instance p2, Ljava/lang/StringBuilder;

    .line 159
    .line 160
    const-string p3, "download failed="

    .line 161
    .line 162
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    move-object v1, p0

    .line 166
    check-cast v1, Ljava/lang/Iterable;

    .line 167
    .line 168
    sget-object v7, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$download$2;->INSTANCE:Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$download$2;

    .line 169
    .line 170
    const/16 v8, 0x1f

    .line 171
    .line 172
    const/4 v9, 0x0

    .line 173
    const/4 v2, 0x0

    .line 174
    const/4 v3, 0x0

    .line 175
    const/4 v4, 0x0

    .line 176
    const/4 v5, 0x0

    .line 177
    const/4 v6, 0x0

    .line 178
    invoke-static/range {v1 .. v9}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    const-string p0, "\nfailureInfo="

    .line 186
    .line 187
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    invoke-virtual {p1, p0}, Ll/q5d0$a;->a(Ljava/lang/String;)Ll/q5d0;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    return-object p0
.end method

.method public final j(Lcom/tantanapp/sharedlibrary/loader/a;Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;Ljava/util/Map;)Ll/q5d0;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/sharedlibrary/loader/a;",
            "Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ll/q5d0<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/a;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/a;->j()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    new-instance v5, Ljava/util/concurrent/CountDownLatch;

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    invoke-direct {v5, p0}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 18
    .line 19
    .line 20
    sget-object p0, Ll/q5d0;->Companion:Ll/q5d0$a;

    .line 21
    .line 22
    const-string v0, ""

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/q5d0$a;->a(Ljava/lang/String;)Ll/q5d0;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    filled-new-array {p0}, [Ll/q5d0;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    new-instance v1, Ll/n1;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/a;->c()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    new-instance v0, Ll/i;

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/a;->i()[B

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/a;->c()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/a;->c()Landroid/content/Context;

    .line 53
    .line 54
    .line 55
    move-result-object v6

    .line 56
    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 57
    .line 58
    .line 59
    move-result-object v6

    .line 60
    const-string v7, "android_id"

    .line 61
    .line 62
    invoke-static {v6, v7}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v6

    .line 66
    invoke-direct {v0, v2, v3, v6}, Ll/i;-><init>([BLjava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-direct {v1, p0, v0}, Ll/n1;-><init>(Landroid/content/Context;Ll/w850;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v1}, Ll/n1;->g()V

    .line 73
    .line 74
    .line 75
    new-instance p0, Lcom/google/android/vending/licensing/b;

    .line 76
    .line 77
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/a;->c()Landroid/content/Context;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/a;->h()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-direct {p0, v0, v1, p1}, Lcom/google/android/vending/licensing/b;-><init>(Landroid/content/Context;Ll/oi80;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    new-instance v0, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$b;

    .line 89
    .line 90
    move-object v3, p2

    .line 91
    move-object v2, p3

    .line 92
    invoke-direct/range {v0 .. v5}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$b;-><init>(Ll/n1;Ljava/util/Map;Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;[Ll/q5d0;Ljava/util/concurrent/CountDownLatch;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0, v0}, Lcom/google/android/vending/licensing/b;->f(Ll/wdr;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v5}, Ljava/util/concurrent/CountDownLatch;->await()V

    .line 99
    .line 100
    .line 101
    const/4 p0, 0x0

    .line 102
    aget-object p0, v4, p0

    .line 103
    .line 104
    return-object p0

    .line 105
    :cond_1
    :goto_0
    const-string p0, "fetchObbInfoIfNeeded skip"

    .line 106
    .line 107
    invoke-static {p0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    sget-object p0, Ll/q5d0;->Companion:Ll/q5d0$a;

    .line 111
    .line 112
    invoke-virtual {p0}, Ll/q5d0$a;->d()Ll/q5d0;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    return-object p0
.end method

.method public final k(Lcom/tantanapp/sharedlibrary/loader/a;Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;)Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/sharedlibrary/loader/a;",
            "Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;",
            ")",
            "Ljava/util/List<",
            "Lcom/tantanapp/sharedlibrary/loader/internal/SoInfo;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "start verifySo "

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p2}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;->getName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/a;->l()Ljava/io/File;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    if-nez p0, :cond_0

    .line 31
    .line 32
    const/4 p0, 0x0

    .line 33
    new-array p0, p0, [Ljava/io/File;

    .line 34
    .line 35
    :cond_0
    invoke-static {p0}, Lkotlin/collections/ArraysKt;->toList([Ljava/lang/Object;)Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    new-instance p1, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v0, "soPathFileList="

    .line 42
    .line 43
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    move-object v1, p0

    .line 47
    check-cast v1, Ljava/lang/Iterable;

    .line 48
    .line 49
    sget-object v7, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$findMissingSoInfoList$1;->INSTANCE:Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$findMissingSoInfoList$1;

    .line 50
    .line 51
    const/16 v8, 0x1f

    .line 52
    .line 53
    const/4 v9, 0x0

    .line 54
    const/4 v2, 0x0

    .line 55
    const/4 v3, 0x0

    .line 56
    const/4 v4, 0x0

    .line 57
    const/4 v5, 0x0

    .line 58
    const/4 v6, 0x0

    .line 59
    invoke-static/range {v1 .. v9}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-static {p0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p2}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;->getZipInfoList()Ljava/util/List;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    check-cast p0, Ljava/lang/Iterable;

    .line 78
    .line 79
    new-instance v2, Ljava/util/ArrayList;

    .line 80
    .line 81
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    if-eqz p1, :cond_1

    .line 93
    .line 94
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    check-cast p1, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;

    .line 99
    .line 100
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;->getSoInfoList()Ljava/util/List;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    check-cast p1, Ljava/lang/Iterable;

    .line 105
    .line 106
    invoke-static {v2, p1}, Lkotlin/collections/CollectionsKt;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 107
    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 111
    .line 112
    const-string p1, "moduleSoInfoList="

    .line 113
    .line 114
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    sget-object v8, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$findMissingSoInfoList$2;->INSTANCE:Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$findMissingSoInfoList$2;

    .line 118
    .line 119
    const/16 v9, 0x1f

    .line 120
    .line 121
    const/4 v10, 0x0

    .line 122
    const/4 v3, 0x0

    .line 123
    const/4 v4, 0x0

    .line 124
    const/4 v5, 0x0

    .line 125
    const/4 v6, 0x0

    .line 126
    const/4 v7, 0x0

    .line 127
    invoke-static/range {v2 .. v10}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-static {p0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    new-instance v3, Ljava/util/ArrayList;

    .line 142
    .line 143
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 144
    .line 145
    .line 146
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 151
    .line 152
    .line 153
    move-result p1

    .line 154
    if-eqz p1, :cond_5

    .line 155
    .line 156
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    move-object p2, p1

    .line 161
    check-cast p2, Lcom/tantanapp/sharedlibrary/loader/internal/SoInfo;

    .line 162
    .line 163
    instance-of v0, v1, Ljava/util/Collection;

    .line 164
    .line 165
    if-eqz v0, :cond_2

    .line 166
    .line 167
    move-object v0, v1

    .line 168
    check-cast v0, Ljava/util/Collection;

    .line 169
    .line 170
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    if-eqz v0, :cond_2

    .line 175
    .line 176
    goto :goto_2

    .line 177
    :cond_2
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    :cond_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 182
    .line 183
    .line 184
    move-result v2

    .line 185
    if-eqz v2, :cond_4

    .line 186
    .line 187
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    move-result-object v2

    .line 191
    check-cast v2, Ljava/io/File;

    .line 192
    .line 193
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v4

    .line 197
    invoke-virtual {p2}, Lcom/tantanapp/sharedlibrary/loader/internal/SoInfo;->getName()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v5

    .line 201
    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    move-result v4

    .line 205
    if-eqz v4, :cond_3

    .line 206
    .line 207
    invoke-virtual {p2}, Lcom/tantanapp/sharedlibrary/loader/internal/SoInfo;->getMd5()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v4

    .line 211
    invoke-static {v2, v4}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->a(Ljava/io/File;Ljava/lang/String;)Z

    .line 212
    .line 213
    .line 214
    move-result v2

    .line 215
    if-eqz v2, :cond_3

    .line 216
    .line 217
    goto :goto_1

    .line 218
    :cond_4
    :goto_2
    invoke-interface {v3, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 219
    .line 220
    .line 221
    goto :goto_1

    .line 222
    :cond_5
    new-instance p0, Ljava/lang/StringBuilder;

    .line 223
    .line 224
    const-string p1, "missingSoInfoList="

    .line 225
    .line 226
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    sget-object v9, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$findMissingSoInfoList$3;->INSTANCE:Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$findMissingSoInfoList$3;

    .line 230
    .line 231
    const/16 v10, 0x1f

    .line 232
    .line 233
    const/4 v11, 0x0

    .line 234
    const/4 v4, 0x0

    .line 235
    const/4 v5, 0x0

    .line 236
    const/4 v6, 0x0

    .line 237
    const/4 v7, 0x0

    .line 238
    const/4 v8, 0x0

    .line 239
    invoke-static/range {v3 .. v11}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object p0

    .line 250
    invoke-static {p0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    return-object v3
.end method

.method public final l(Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;Ljava/util/List;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;",
            "Ljava/util/List<",
            "Lcom/tantanapp/sharedlibrary/loader/internal/SoInfo;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;",
            ">;"
        }
    .end annotation

    .line 1
    check-cast p2, Ljava/lang/Iterable;

    .line 2
    .line 3
    new-instance p0, Ljava/util/ArrayList;

    .line 4
    .line 5
    const/16 v0, 0xa

    .line 6
    .line 7
    invoke-static {p2, v0}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 12
    .line 13
    .line 14
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_4

    .line 23
    .line 24
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/tantanapp/sharedlibrary/loader/internal/SoInfo;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;->getZipInfoList()Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Ljava/lang/Iterable;

    .line 35
    .line 36
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    :cond_0
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_3

    .line 45
    .line 46
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;

    .line 51
    .line 52
    invoke-virtual {v2}, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;->getSoInfoList()Ljava/util/List;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    check-cast v3, Ljava/lang/Iterable;

    .line 57
    .line 58
    instance-of v4, v3, Ljava/util/Collection;

    .line 59
    .line 60
    if-eqz v4, :cond_1

    .line 61
    .line 62
    move-object v4, v3

    .line 63
    check-cast v4, Ljava/util/Collection;

    .line 64
    .line 65
    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    if-eqz v4, :cond_1

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_1
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    if-eqz v4, :cond_0

    .line 81
    .line 82
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    check-cast v4, Lcom/tantanapp/sharedlibrary/loader/internal/SoInfo;

    .line 87
    .line 88
    invoke-static {v4, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v4

    .line 92
    if-eqz v4, :cond_2

    .line 93
    .line 94
    invoke-interface {p0, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_3
    const-string p0, "Collection contains no element matching the predicate."

    .line 99
    .line 100
    invoke-static {p0}, Ll/npj0;->a(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    const/4 p0, 0x0

    .line 104
    return-object p0

    .line 105
    :cond_4
    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->toSet(Ljava/lang/Iterable;)Ljava/util/Set;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    check-cast p0, Ljava/lang/Iterable;

    .line 110
    .line 111
    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->toList(Ljava/lang/Iterable;)Ljava/util/List;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    new-instance p1, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    const-string p2, "missingZipInfoList="

    .line 118
    .line 119
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    move-object v0, p0

    .line 123
    check-cast v0, Ljava/lang/Iterable;

    .line 124
    .line 125
    sget-object v6, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$findMissingZipInfoList$1;->INSTANCE:Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$findMissingZipInfoList$1;

    .line 126
    .line 127
    const/16 v7, 0x1f

    .line 128
    .line 129
    const/4 v8, 0x0

    .line 130
    const/4 v1, 0x0

    .line 131
    const/4 v2, 0x0

    .line 132
    const/4 v3, 0x0

    .line 133
    const/4 v4, 0x0

    .line 134
    const/4 v5, 0x0

    .line 135
    invoke-static/range {v0 .. v8}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p2

    .line 139
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    invoke-static {p1}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    return-object p0
.end method

.method public final declared-synchronized m(Lcom/tantanapp/sharedlibrary/loader/a;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
    .locals 9
    .param p1    # Lcom/tantanapp/sharedlibrary/loader/a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/sharedlibrary/loader/a;",
            "Ljava/lang/String;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/tantanapp/sharedlibrary/loader/LoadEvent;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "checkNeedLoad: "

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/tantanapp/common/utils/ThreadUtil;->f()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_5

    .line 18
    .line 19
    new-instance v1, Ljava/util/LinkedHashMap;

    .line 20
    .line 21
    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 22
    .line 23
    .line 24
    sget-object v2, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->Companion:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$a;

    .line 25
    .line 26
    sget-object v3, Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;->CheckNeedLoad:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;

    .line 27
    .line 28
    invoke-virtual {v2, v3}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent$a;->b(Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;)Lcom/tantanapp/sharedlibrary/loader/LoadEvent;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    invoke-interface {p3, v4}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p1, p2, v1}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;->f(Lcom/tantanapp/sharedlibrary/loader/a;Ljava/lang/String;Ljava/util/Map;)Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    if-nez p2, :cond_0

    .line 40
    .line 41
    const-string v4, "no need"

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catchall_0
    move-exception p1

    .line 45
    goto/16 :goto_3

    .line 46
    .line 47
    :cond_0
    const-string v4, "need"

    .line 48
    .line 49
    :goto_0
    invoke-virtual {v0, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-static {v0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    const/4 v0, 0x2

    .line 57
    const/4 v4, 0x0

    .line 58
    invoke-static {v2, v3, v4, v0, v4}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent$a;->d(Lcom/tantanapp/sharedlibrary/loader/LoadEvent$a;Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;Ljava/lang/Object;ILjava/lang/Object;)Lcom/tantanapp/sharedlibrary/loader/LoadEvent;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    new-instance v0, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$a;

    .line 66
    .line 67
    sget-object v2, Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;->FetchObbInfoIfNeeded:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;

    .line 68
    .line 69
    new-instance v3, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$load$1;

    .line 70
    .line 71
    invoke-direct {v3, p0}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$load$1;-><init>(Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    const/4 v4, 0x3

    .line 75
    invoke-direct {v0, v2, v4, v3}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$a;-><init>(Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;ILkotlin/jvm/functions/Function3;)V

    .line 76
    .line 77
    .line 78
    new-instance v2, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$a;

    .line 79
    .line 80
    sget-object v3, Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;->Download:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;

    .line 81
    .line 82
    new-instance v5, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$load$2;

    .line 83
    .line 84
    invoke-direct {v5, p0}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$load$2;-><init>(Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    invoke-direct {v2, v3, v4, v5}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$a;-><init>(Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;ILkotlin/jvm/functions/Function3;)V

    .line 88
    .line 89
    .line 90
    new-instance v3, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$a;

    .line 91
    .line 92
    sget-object v5, Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;->Unzip:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;

    .line 93
    .line 94
    new-instance v6, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$load$3;

    .line 95
    .line 96
    invoke-direct {v6, p0}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$load$3;-><init>(Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    invoke-direct {v3, v5, v4, v6}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$a;-><init>(Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;ILkotlin/jvm/functions/Function3;)V

    .line 100
    .line 101
    .line 102
    new-instance v4, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$a;

    .line 103
    .line 104
    sget-object v5, Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;->CopySo:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;

    .line 105
    .line 106
    new-instance v6, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$load$4;

    .line 107
    .line 108
    invoke-direct {v6, p0}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$load$4;-><init>(Ljava/lang/Object;)V

    .line 109
    .line 110
    .line 111
    const/4 v7, 0x1

    .line 112
    invoke-direct {v4, v5, v7, v6}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$a;-><init>(Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;ILkotlin/jvm/functions/Function3;)V

    .line 113
    .line 114
    .line 115
    new-instance v5, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$a;

    .line 116
    .line 117
    sget-object v6, Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;->VerifySo:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;

    .line 118
    .line 119
    new-instance v8, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$load$5;

    .line 120
    .line 121
    invoke-direct {v8, p0}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$load$5;-><init>(Ljava/lang/Object;)V

    .line 122
    .line 123
    .line 124
    invoke-direct {v5, v6, v7, v8}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$a;-><init>(Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;ILkotlin/jvm/functions/Function3;)V

    .line 125
    .line 126
    .line 127
    filled-new-array {v0, v2, v3, v4, v5}, [Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$a;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    check-cast v0, Ljava/lang/Iterable;

    .line 136
    .line 137
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 142
    .line 143
    .line 144
    move-result v2

    .line 145
    if-eqz v2, :cond_4

    .line 146
    .line 147
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    check-cast v2, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$a;

    .line 152
    .line 153
    sget-object v3, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->Companion:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$a;

    .line 154
    .line 155
    invoke-virtual {v2}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$a;->c()Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;

    .line 156
    .line 157
    .line 158
    move-result-object v4

    .line 159
    invoke-virtual {v3, v4}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent$a;->b(Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;)Lcom/tantanapp/sharedlibrary/loader/LoadEvent;

    .line 160
    .line 161
    .line 162
    move-result-object v4

    .line 163
    invoke-interface {p3, v4}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    if-nez p2, :cond_1

    .line 167
    .line 168
    invoke-virtual {v2}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$a;->c()Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    const-string v4, "skip"

    .line 173
    .line 174
    invoke-virtual {v3, v2, v4}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent$a;->c(Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;Ljava/lang/Object;)Lcom/tantanapp/sharedlibrary/loader/LoadEvent;

    .line 175
    .line 176
    .line 177
    move-result-object v2

    .line 178
    invoke-interface {p3, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    goto :goto_1

    .line 182
    :cond_1
    sget-object v3, Ll/q5d0;->Companion:Ll/q5d0$a;

    .line 183
    .line 184
    invoke-virtual {v3}, Ll/q5d0$a;->d()Ll/q5d0;

    .line 185
    .line 186
    .line 187
    move-result-object v3

    .line 188
    invoke-virtual {v2}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$a;->b()I

    .line 189
    .line 190
    .line 191
    move-result v4

    .line 192
    const/4 v5, 0x0

    .line 193
    :cond_2
    if-ge v5, v4, :cond_3

    .line 194
    .line 195
    new-instance v3, Ljava/lang/StringBuilder;

    .line 196
    .line 197
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 198
    .line 199
    .line 200
    const-string v6, "trying "

    .line 201
    .line 202
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v2}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$a;->c()Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;

    .line 206
    .line 207
    .line 208
    move-result-object v6

    .line 209
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    const/16 v6, 0x20

    .line 213
    .line 214
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    add-int/lit8 v5, v5, 0x1

    .line 218
    .line 219
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v3

    .line 226
    invoke-static {v3}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 227
    .line 228
    .line 229
    :try_start_1
    invoke-virtual {v2}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$a;->a()Lkotlin/jvm/functions/Function3;

    .line 230
    .line 231
    .line 232
    move-result-object v3

    .line 233
    invoke-interface {v3, p1, p2, v1}, Lkotlin/jvm/functions/Function3;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    .line 235
    .line 236
    move-result-object v3

    .line 237
    check-cast v3, Ll/q5d0;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 238
    .line 239
    goto :goto_2

    .line 240
    :catchall_1
    move-exception v3

    .line 241
    :try_start_2
    sget-object v6, Ll/q5d0;->Companion:Ll/q5d0$a;

    .line 242
    .line 243
    invoke-virtual {v6, v3}, Ll/q5d0$a;->b(Ljava/lang/Throwable;)Ll/q5d0;

    .line 244
    .line 245
    .line 246
    move-result-object v3

    .line 247
    :goto_2
    invoke-virtual {v3}, Ll/q5d0;->e()Z

    .line 248
    .line 249
    .line 250
    move-result v6

    .line 251
    if-eqz v6, :cond_2

    .line 252
    .line 253
    sget-object v4, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->Companion:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$a;

    .line 254
    .line 255
    invoke-virtual {v2}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$a;->c()Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;

    .line 256
    .line 257
    .line 258
    move-result-object v2

    .line 259
    invoke-virtual {v3}, Ll/q5d0;->c()Ljava/lang/Object;

    .line 260
    .line 261
    .line 262
    move-result-object v3

    .line 263
    invoke-virtual {v4, v2, v3}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent$a;->c(Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;Ljava/lang/Object;)Lcom/tantanapp/sharedlibrary/loader/LoadEvent;

    .line 264
    .line 265
    .line 266
    move-result-object v2

    .line 267
    invoke-interface {p3, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 268
    .line 269
    .line 270
    goto/16 :goto_1

    .line 271
    .line 272
    :cond_3
    sget-object p1, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;->Companion:Lcom/tantanapp/sharedlibrary/loader/LoadEvent$a;

    .line 273
    .line 274
    invoke-virtual {v2}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$a;->c()Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;

    .line 275
    .line 276
    .line 277
    move-result-object p2

    .line 278
    invoke-virtual {v3}, Ll/q5d0;->a()Ljava/lang/Throwable;

    .line 279
    .line 280
    .line 281
    move-result-object v0

    .line 282
    invoke-virtual {p1, p2, v0}, Lcom/tantanapp/sharedlibrary/loader/LoadEvent$a;->a(Lcom/tantanapp/sharedlibrary/loader/LoadEvent$Step;Ljava/lang/Throwable;)Lcom/tantanapp/sharedlibrary/loader/LoadEvent;

    .line 283
    .line 284
    .line 285
    move-result-object p1

    .line 286
    invoke-interface {p3, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 287
    .line 288
    .line 289
    monitor-exit p0

    .line 290
    return-void

    .line 291
    :cond_4
    monitor-exit p0

    .line 292
    return-void

    .line 293
    :cond_5
    :try_start_3
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 294
    .line 295
    const-string p2, "Load can not be called in ui thread!"

    .line 296
    .line 297
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 298
    .line 299
    .line 300
    throw p1

    .line 301
    :goto_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 302
    throw p1
.end method

.method public final n(Lcom/tantanapp/sharedlibrary/loader/a;Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;Ljava/util/Map;)Ll/q5d0;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/sharedlibrary/loader/a;",
            "Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ll/q5d0<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p3, p1}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;->o(Ljava/util/Map;Lcom/tantanapp/sharedlibrary/loader/a;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "unzip skip"

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sget-object p0, Ll/q5d0;->Companion:Ll/q5d0$a;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/q5d0$a;->d()Ll/q5d0;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_0
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/a;->m()Ljava/io/File;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->e(Ljava/io/File;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/a;->m()Ljava/io/File;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->f(Ljava/io/File;)Ljava/io/File;

    .line 31
    .line 32
    .line 33
    const-string p0, "missing_zip_info_list"

    .line 34
    .line 35
    invoke-interface {p3, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 40
    .line 41
    .line 42
    check-cast p0, Ljava/util/List;

    .line 43
    .line 44
    check-cast p0, Ljava/lang/Iterable;

    .line 45
    .line 46
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    if-eqz p2, :cond_1

    .line 55
    .line 56
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    check-cast p2, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;

    .line 61
    .line 62
    new-instance v0, Ljava/io/File;

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/a;->a()Ljava/io/File;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {p2}, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;->getName()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    invoke-direct {v0, v1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1}, Lcom/tantanapp/sharedlibrary/loader/a;->m()Ljava/io/File;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 84
    .line 85
    .line 86
    invoke-static {v0, p2}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->g(Ljava/io/File;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_1
    invoke-static {p3, p1}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;->o(Ljava/util/Map;Lcom/tantanapp/sharedlibrary/loader/a;)Z

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    if-eqz p0, :cond_2

    .line 95
    .line 96
    sget-object p0, Ll/q5d0;->Companion:Ll/q5d0$a;

    .line 97
    .line 98
    invoke-virtual {p0}, Ll/q5d0$a;->d()Ll/q5d0;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    return-object p0

    .line 103
    :cond_2
    sget-object p0, Ll/q5d0;->Companion:Ll/q5d0$a;

    .line 104
    .line 105
    const-string p1, "unzip failed"

    .line 106
    .line 107
    invoke-virtual {p0, p1}, Ll/q5d0$a;->a(Ljava/lang/String;)Ll/q5d0;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    return-object p0
.end method

.method public final p(Lcom/tantanapp/sharedlibrary/loader/a;Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;Ljava/util/Map;)Ll/q5d0;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantanapp/sharedlibrary/loader/a;",
            "Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ll/q5d0<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;->k(Lcom/tantanapp/sharedlibrary/loader/a;Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    sget-object p0, Ll/q5d0;->Companion:Ll/q5d0$a;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/q5d0$a;->d()Ll/q5d0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    sget-object p1, Ll/q5d0;->Companion:Ll/q5d0$a;

    .line 19
    .line 20
    new-instance p2, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string p3, "verifySo failed: missingSoInfoList="

    .line 23
    .line 24
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    move-object v0, p0

    .line 28
    check-cast v0, Ljava/lang/Iterable;

    .line 29
    .line 30
    sget-object v6, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$verifySo$1;->INSTANCE:Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$verifySo$1;

    .line 31
    .line 32
    const/16 v7, 0x1f

    .line 33
    .line 34
    const/4 v8, 0x0

    .line 35
    const/4 v1, 0x0

    .line 36
    const/4 v2, 0x0

    .line 37
    const/4 v3, 0x0

    .line 38
    const/4 v4, 0x0

    .line 39
    const/4 v5, 0x0

    .line 40
    invoke-static/range {v0 .. v8}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p1, p0}, Ll/q5d0$a;->a(Ljava/lang/String;)Ll/q5d0;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0
.end method
