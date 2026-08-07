.class public final Ll/hgi;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/hgi$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0018\u0000 \u001a2\u00020\u0001:\u0001\u001bB\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000f\u0010\u0005\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u0005\u0010\u0003J\u001d\u0010\n\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u001f\u0010\u0010\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000c2\u0008\u0010\u000f\u001a\u0004\u0018\u00010\u000e\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J!\u0010\u0014\u001a\u00020\u000e2\u0006\u0010\r\u001a\u00020\u000c2\n\u0008\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u0012\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u0015\u0010\u0018\u001a\u00020\u00042\u0006\u0010\u0017\u001a\u00020\u0016\u00a2\u0006\u0004\u0008\u0018\u0010\u0019\u00a8\u0006\u001c"
    }
    d2 = {
        "Ll/hgi;",
        "",
        "<init>",
        "()V",
        "",
        "c",
        "",
        "debugMode",
        "Ll/jgi;",
        "greyProvider",
        "g",
        "(ZLl/jgi;)V",
        "",
        "url",
        "Ll/ngi;",
        "result",
        "e",
        "(Ljava/lang/String;Ll/ngi;)Ljava/lang/String;",
        "",
        "localVer",
        "d",
        "(Ljava/lang/String;Ljava/lang/Long;)Ll/ngi;",
        "Ll/igi;",
        "observer",
        "f",
        "(Ll/igi;)V",
        "Companion",
        "a",
        "FEP_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final Companion:Ll/hgi$a;

.field private static volatile a:Ll/hgi;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/hgi$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/hgi$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/hgi;->Companion:Ll/hgi$a;

    .line 8
    .line 9
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Ll/hgi;-><init>()V

    return-void
.end method

.method public static final synthetic a()Ll/hgi;
    .locals 1

    .line 1
    sget-object v0, Ll/hgi;->a:Ll/hgi;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic b(Ll/hgi;)V
    .locals 0

    .line 1
    sput-object p0, Ll/hgi;->a:Ll/hgi;

    .line 2
    .line 3
    return-void
.end method

.method private final c()V
    .locals 8

    .line 1
    sget-object p0, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->INSTANCE:Lcom/hellogroup/fep/grey/internal/FepGreyContext;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->g()Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->c()Ll/pgi;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const/16 v6, 0xc

    .line 18
    .line 19
    const/4 v7, 0x0

    .line 20
    const/16 v2, -0x7d2

    .line 21
    .line 22
    const-string v3, "Called before setup"

    .line 23
    .line 24
    const/4 v4, 0x0

    .line 25
    const/4 v5, 0x0

    .line 26
    invoke-static/range {v1 .. v7}, Ll/pgi;->d(Ll/pgi;ILjava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;ILjava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->a()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-nez p0, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const-string p0, "FepGreyManager not setup, call setup() first"

    .line 37
    .line 38
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public final d(Ljava/lang/String;Ljava/lang/Long;)Ll/ngi;
    .locals 6
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Long;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/hgi;->c()V

    .line 5
    .line 6
    .line 7
    sget-object p0, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->INSTANCE:Lcom/hellogroup/fep/grey/internal/FepGreyContext;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->f()Ll/kgi;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v4, 0x4

    .line 14
    const/4 v5, 0x0

    .line 15
    const/4 v3, 0x0

    .line 16
    move-object v1, p1

    .line 17
    move-object v2, p2

    .line 18
    invoke-static/range {v0 .. v5}, Ll/kgi;->b(Ll/kgi;Ljava/lang/String;Ljava/lang/Long;ZILjava/lang/Object;)Ll/ngi;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public final e(Ljava/lang/String;Ll/ngi;)Ljava/lang/String;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/ngi;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    invoke-virtual {p2}, Ll/ngi;->b()Ll/lgi;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p2}, Ll/ngi;->e()Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    sget-object p2, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->INSTANCE:Lcom/hellogroup/fep/grey/internal/FepGreyContext;

    .line 19
    .line 20
    invoke-virtual {p2}, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->f()Ll/kgi;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-virtual {p2, p1, p0}, Ll/kgi;->d(Ljava/lang/String;Ll/lgi;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_0
    return-object p1
.end method

.method public final f(Ll/igi;)V
    .locals 0
    .param p1    # Ll/igi;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->INSTANCE:Lcom/hellogroup/fep/grey/internal/FepGreyContext;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->d()Ll/tl5;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, p1}, Ll/tl5;->a(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final g(ZLl/jgi;)V
    .locals 8
    .param p2    # Ll/jgi;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->INSTANCE:Lcom/hellogroup/fep/grey/internal/FepGreyContext;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->g()Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->c()Ll/pgi;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const/16 v6, 0xe

    .line 21
    .line 22
    const/4 v7, 0x0

    .line 23
    const-string v2, "already setup, will ignore repeat setup"

    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    const/4 v4, 0x0

    .line 27
    const/4 v5, 0x0

    .line 28
    invoke-static/range {v1 .. v7}, Ll/pgi;->k(Ll/pgi;Ljava/lang/String;Ljava/lang/Throwable;ILjava/util/Map;ILjava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    invoke-virtual {p0, p1}, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->h(Z)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p2}, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->i(Ll/jgi;)V

    .line 36
    .line 37
    .line 38
    sget-object p1, Lcom/hellogroup/fep/config/core/FepConfigManager;->Companion:Lcom/hellogroup/fep/config/core/FepConfigManager$a;

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/hellogroup/fep/config/core/FepConfigManager$a;->a()Lcom/hellogroup/fep/config/core/FepConfigManager;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    new-instance p2, Ll/hgi$b;

    .line 45
    .line 46
    invoke-direct {p2}, Ll/hgi$b;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, p2}, Lcom/hellogroup/fep/config/core/FepConfigManager;->o(Ll/bgi;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/hellogroup/fep/grey/internal/FepGreyContext;->g()Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const/4 p1, 0x1

    .line 57
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 58
    .line 59
    .line 60
    return-void
.end method
