.class public final Lcom/immomo/molive/apm/ApmPlugin$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/molive/apm/ApmPlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0007\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001d\u0010\t\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\t\u0010\nJ\r\u0010\u000b\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u000b\u0010\u0003J\u000f\u0010\r\u001a\u00020\u000cH\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u000cH\u0016\u00a2\u0006\u0004\u0008\u000f\u0010\u000eJ\u000f\u0010\u0011\u001a\u00020\u0010H\u0016\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u000f\u0010\u0013\u001a\u00020\u0010H\u0016\u00a2\u0006\u0004\u0008\u0013\u0010\u0012J\u000f\u0010\u0014\u001a\u00020\u0010H\u0016\u00a2\u0006\u0004\u0008\u0014\u0010\u0012J\u000f\u0010\u0015\u001a\u00020\u0010H\u0016\u00a2\u0006\u0004\u0008\u0015\u0010\u0012J\u000f\u0010\u0016\u001a\u00020\u0010H\u0016\u00a2\u0006\u0004\u0008\u0016\u0010\u0012J\u000f\u0010\u0017\u001a\u00020\u0010H\u0016\u00a2\u0006\u0004\u0008\u0017\u0010\u0012J\u000f\u0010\u0018\u001a\u00020\u0010H\u0016\u00a2\u0006\u0004\u0008\u0018\u0010\u0012R\u001b\u0010\u001e\u001a\u00020\u00198BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u001a\u0010\u001b\u001a\u0004\u0008\u001c\u0010\u001d\u00a8\u0006\u001f"
    }
    d2 = {
        "Lcom/immomo/molive/apm/ApmPlugin$a;",
        "",
        "<init>",
        "()V",
        "Ll/zt0;",
        "apmPluginConfig",
        "Landroid/content/Context;",
        "context",
        "",
        "k",
        "(Ll/zt0;Landroid/content/Context;)V",
        "l",
        "",
        "a",
        "()F",
        "j",
        "",
        "h",
        "()I",
        "g",
        "f",
        "e",
        "d",
        "b",
        "i",
        "Lcom/immomo/molive/apm/ApmPlugin;",
        "INSTANCE$delegate",
        "Lkotlin/Lazy;",
        "c",
        "()Lcom/immomo/molive/apm/ApmPlugin;",
        "INSTANCE",
        "apm-tracer_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# direct methods
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
    invoke-direct {p0}, Lcom/immomo/molive/apm/ApmPlugin$a;-><init>()V

    return-void
.end method

.method private final c()Lcom/immomo/molive/apm/ApmPlugin;
    .locals 0

    .line 1
    invoke-static {}, Lcom/immomo/molive/apm/ApmPlugin;->d()Lkotlin/Lazy;

    move-result-object p0

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/immomo/molive/apm/ApmPlugin;

    return-object p0
.end method


# virtual methods
.method public a()F
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/molive/apm/ApmPlugin$a;->c()Lcom/immomo/molive/apm/ApmPlugin;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/immomo/molive/apm/ApmPlugin;->k()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public b()I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/molive/apm/ApmPlugin$a;->c()Lcom/immomo/molive/apm/ApmPlugin;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/immomo/molive/apm/ApmPlugin;->l()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/molive/apm/ApmPlugin$a;->c()Lcom/immomo/molive/apm/ApmPlugin;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/immomo/molive/apm/ApmPlugin;->q()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public e()I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/molive/apm/ApmPlugin$a;->c()Lcom/immomo/molive/apm/ApmPlugin;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/immomo/molive/apm/ApmPlugin;->r()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public f()I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/molive/apm/ApmPlugin$a;->c()Lcom/immomo/molive/apm/ApmPlugin;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/immomo/molive/apm/ApmPlugin;->t()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public g()I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/molive/apm/ApmPlugin$a;->c()Lcom/immomo/molive/apm/ApmPlugin;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/immomo/molive/apm/ApmPlugin;->y()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public h()I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/molive/apm/ApmPlugin$a;->c()Lcom/immomo/molive/apm/ApmPlugin;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/immomo/molive/apm/ApmPlugin;->z()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public i()I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/molive/apm/ApmPlugin$a;->c()Lcom/immomo/molive/apm/ApmPlugin;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/immomo/molive/apm/ApmPlugin;->C()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public j()F
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/molive/apm/ApmPlugin$a;->c()Lcom/immomo/molive/apm/ApmPlugin;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/immomo/molive/apm/ApmPlugin;->E()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final k(Ll/zt0;Landroid/content/Context;)V
    .locals 0
    .param p1    # Ll/zt0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/content/Context;
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
    invoke-direct {p0}, Lcom/immomo/molive/apm/ApmPlugin$a;->c()Lcom/immomo/molive/apm/ApmPlugin;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1, p2}, Lcom/immomo/molive/apm/ApmPlugin;->O(Ll/zt0;Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final l()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/molive/apm/ApmPlugin$a;->c()Lcom/immomo/molive/apm/ApmPlugin;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/immomo/molive/apm/ApmPlugin;->P()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
