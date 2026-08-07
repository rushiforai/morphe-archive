.class public final Ll/uiq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/siq0;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u000c\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J!\u0010\r\u001a\u00020\u000c2\u0006\u0010\t\u001a\u00020\u00082\u0008\u0010\u000b\u001a\u0004\u0018\u00010\nH\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u001f\u0010\u0011\u001a\u00020\u000c2\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u0010\u001a\u00020\u000fH\u0016\u00a2\u0006\u0004\u0008\u0011\u0010\u0012R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0013\u0010\u0014\u001a\u0004\u0008\u0015\u0010\u0016R\u0017\u0010\u0005\u001a\u00020\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0017\u0010\u0018\u001a\u0004\u0008\u0019\u0010\u001a\u00a8\u0006\u001b"
    }
    d2 = {
        "Ll/uiq0;",
        "Ll/siq0;",
        "Landroidx/work/impl/a;",
        "processor",
        "Ll/zni0;",
        "workTaskExecutor",
        "<init>",
        "(Landroidx/work/impl/a;Ll/zni0;)V",
        "Ll/e3g0;",
        "workSpecId",
        "Landroidx/work/WorkerParameters$a;",
        "runtimeExtras",
        "",
        "e",
        "(Ll/e3g0;Landroidx/work/WorkerParameters$a;)V",
        "",
        "reason",
        "d",
        "(Ll/e3g0;I)V",
        "a",
        "Landroidx/work/impl/a;",
        "getProcessor",
        "()Landroidx/work/impl/a;",
        "b",
        "Ll/zni0;",
        "getWorkTaskExecutor",
        "()Ll/zni0;",
        "work-runtime_release"
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
.field public final a:Landroidx/work/impl/a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Ll/zni0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/work/impl/a;Ll/zni0;)V
    .locals 0
    .param p1    # Landroidx/work/impl/a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/zni0;
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
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ll/uiq0;->a:Landroidx/work/impl/a;

    .line 11
    .line 12
    iput-object p2, p0, Ll/uiq0;->b:Ll/zni0;

    .line 13
    .line 14
    return-void
.end method

.method public static f(Ll/uiq0;Ll/e3g0;Landroidx/work/WorkerParameters$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uiq0;->a:Landroidx/work/impl/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Landroidx/work/impl/a;->p(Ll/e3g0;Landroidx/work/WorkerParameters$a;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public d(Ll/e3g0;I)V
    .locals 3
    .param p1    # Ll/e3g0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/uiq0;->b:Ll/zni0;

    .line 5
    .line 6
    new-instance v1, Ll/r5g0;

    .line 7
    .line 8
    iget-object p0, p0, Ll/uiq0;->a:Landroidx/work/impl/a;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-direct {v1, p0, p1, v2, p2}, Ll/r5g0;-><init>(Landroidx/work/impl/a;Ll/e3g0;ZI)V

    .line 12
    .line 13
    .line 14
    invoke-interface {v0, v1}, Ll/zni0;->b(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public e(Ll/e3g0;Landroidx/work/WorkerParameters$a;)V
    .locals 2
    .param p1    # Ll/e3g0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroidx/work/WorkerParameters$a;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/uiq0;->b:Ll/zni0;

    .line 5
    .line 6
    new-instance v1, Ll/tiq0;

    .line 7
    .line 8
    invoke-direct {v1, p0, p1, p2}, Ll/tiq0;-><init>(Ll/uiq0;Ll/e3g0;Landroidx/work/WorkerParameters$a;)V

    .line 9
    .line 10
    .line 11
    invoke-interface {v0, v1}, Ll/zni0;->b(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
