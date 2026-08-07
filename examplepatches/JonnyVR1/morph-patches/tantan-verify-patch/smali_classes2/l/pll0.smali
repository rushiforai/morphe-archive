.class public final Ll/pll0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0000\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0008\u0010\tJ1\u0010\u0010\u001a\u00028\u0000\"\u0008\u0008\u0000\u0010\u000b*\u00020\n2\u000c\u0010\r\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u000c2\u0008\u0008\u0002\u0010\u000f\u001a\u00020\u000eH\u0000\u00a2\u0006\u0004\u0008\u0010\u0010\u0011R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0012\u0010\u0013R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0014\u0010\u0015R\u0014\u0010\u0007\u001a\u00020\u00068\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0016\u0010\u0017R\u0014\u0010\u001a\u001a\u00020\u00188\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0010\u0010\u0019\u00a8\u0006\u001b"
    }
    d2 = {
        "Ll/pll0;",
        "",
        "Ll/sll0;",
        "store",
        "Landroidx/lifecycle/t$c;",
        "factory",
        "Ll/cvb;",
        "defaultExtras",
        "<init>",
        "(Ll/sll0;Landroidx/lifecycle/t$c;Ll/cvb;)V",
        "Ll/nll0;",
        "T",
        "Lkotlin/reflect/KClass;",
        "modelClass",
        "",
        "key",
        "d",
        "(Lkotlin/reflect/KClass;Ljava/lang/String;)Ll/nll0;",
        "a",
        "Ll/sll0;",
        "b",
        "Landroidx/lifecycle/t$c;",
        "c",
        "Ll/cvb;",
        "Ll/ooh0;",
        "Ll/ooh0;",
        "lock",
        "lifecycle-viewmodel_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public final a:Ll/sll0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Landroidx/lifecycle/t$c;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final c:Ll/cvb;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final d:Ll/ooh0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/sll0;Landroidx/lifecycle/t$c;Ll/cvb;)V
    .locals 0
    .param p1    # Ll/sll0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroidx/lifecycle/t$c;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/cvb;
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
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/pll0;->a:Ll/sll0;

    .line 14
    .line 15
    iput-object p2, p0, Ll/pll0;->b:Landroidx/lifecycle/t$c;

    .line 16
    .line 17
    iput-object p3, p0, Ll/pll0;->c:Ll/cvb;

    .line 18
    .line 19
    new-instance p1, Ll/ooh0;

    .line 20
    .line 21
    invoke-direct {p1}, Ll/ooh0;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Ll/pll0;->d:Ll/ooh0;

    .line 25
    .line 26
    return-void
.end method

.method public static final synthetic a(Ll/pll0;)Ll/cvb;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pll0;->c:Ll/cvb;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic b(Ll/pll0;)Landroidx/lifecycle/t$c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pll0;->b:Landroidx/lifecycle/t$c;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic c(Ll/pll0;)Ll/sll0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pll0;->a:Ll/sll0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Ll/pll0;Lkotlin/reflect/KClass;Ljava/lang/String;ILjava/lang/Object;)Ll/nll0;
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    sget-object p2, Ll/rll0;->INSTANCE:Ll/rll0;

    .line 6
    .line 7
    invoke-virtual {p2, p1}, Ll/rll0;->c(Lkotlin/reflect/KClass;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/pll0;->d(Lkotlin/reflect/KClass;Ljava/lang/String;)Ll/nll0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method


# virtual methods
.method public final d(Lkotlin/reflect/KClass;Ljava/lang/String;)Ll/nll0;
    .locals 3
    .param p1    # Lkotlin/reflect/KClass;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ll/nll0;",
            ">(",
            "Lkotlin/reflect/KClass<",
            "TT;>;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/pll0;->d:Ll/ooh0;

    .line 8
    .line 9
    monitor-enter v0

    .line 10
    :try_start_0
    invoke-static {p0}, Ll/pll0;->c(Ll/pll0;)Ll/sll0;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1, p2}, Ll/sll0;->b(Ljava/lang/String;)Ll/nll0;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-interface {p1, v1}, Lkotlin/reflect/KClass;->isInstance(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    invoke-static {p0}, Ll/pll0;->b(Ll/pll0;)Landroidx/lifecycle/t$c;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    instance-of p1, p1, Landroidx/lifecycle/t$e;

    .line 29
    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    invoke-static {p0}, Ll/pll0;->b(Ll/pll0;)Landroidx/lifecycle/t$c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Landroidx/lifecycle/t$e;

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v1}, Landroidx/lifecycle/t$e;->a(Ll/nll0;)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :catchall_0
    move-exception p0

    .line 46
    goto :goto_2

    .line 47
    :cond_0
    :goto_0
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 48
    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_1
    new-instance v1, Ll/r120;

    .line 52
    .line 53
    invoke-static {p0}, Ll/pll0;->a(Ll/pll0;)Ll/cvb;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-direct {v1, v2}, Ll/r120;-><init>(Ll/cvb;)V

    .line 58
    .line 59
    .line 60
    sget-object v2, Landroidx/lifecycle/t;->b:Ll/cvb$c;

    .line 61
    .line 62
    invoke-virtual {v1, v2, p2}, Ll/r120;->c(Ll/cvb$c;Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    invoke-static {p0}, Ll/pll0;->b(Ll/pll0;)Landroidx/lifecycle/t$c;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-static {v2, p1, v1}, Ll/qll0;->a(Landroidx/lifecycle/t$c;Lkotlin/reflect/KClass;Ll/cvb;)Ll/nll0;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-static {p0}, Ll/pll0;->c(Ll/pll0;)Ll/sll0;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0, p2, v1}, Ll/sll0;->d(Ljava/lang/String;Ll/nll0;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    .line 79
    .line 80
    :goto_1
    monitor-exit v0

    .line 81
    return-object v1

    .line 82
    :goto_2
    monitor-exit v0

    .line 83
    throw p0
.end method
