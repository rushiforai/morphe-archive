.class public final Lcom/hellogroup/mk/core/dispatcher/task/MKTaskByCheckUpdate;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ejw;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hellogroup/mk/core/dispatcher/task/MKTaskByCheckUpdate$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0008\u0018\u0000 \u00122\u00020\u0001:\u0001\u000eB\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0019\u0010\t\u001a\u00020\u00082\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000f\u0010\u000c\u001a\u00020\u000bH\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\rR\u001a\u0010\u0003\u001a\u00020\u00028\u0016X\u0096\u0004\u00a2\u0006\u000c\n\u0004\u0008\u000e\u0010\u000f\u001a\u0004\u0008\u0010\u0010\u0011\u00a8\u0006\u0013"
    }
    d2 = {
        "Lcom/hellogroup/mk/core/dispatcher/task/MKTaskByCheckUpdate;",
        "Ll/ejw;",
        "Ll/fjw;",
        "mkBaseTaskRequest",
        "<init>",
        "(Ll/fjw;)V",
        "Ll/cd00;",
        "callback",
        "",
        "n",
        "(Ll/cd00;)V",
        "",
        "f",
        "()Z",
        "a",
        "Ll/fjw;",
        "e",
        "()Ll/fjw;",
        "Companion",
        "MKCore_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final Companion:Lcom/hellogroup/mk/core/dispatcher/task/MKTaskByCheckUpdate$a;


# instance fields
.field private final a:Ll/fjw;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/hellogroup/mk/core/dispatcher/task/MKTaskByCheckUpdate$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/hellogroup/mk/core/dispatcher/task/MKTaskByCheckUpdate$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/hellogroup/mk/core/dispatcher/task/MKTaskByCheckUpdate;->Companion:Lcom/hellogroup/mk/core/dispatcher/task/MKTaskByCheckUpdate$a;

    return-void
.end method

.method public constructor <init>(Ll/fjw;)V
    .locals 0
    .param p1    # Ll/fjw;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/hellogroup/mk/core/dispatcher/task/MKTaskByCheckUpdate;->a:Ll/fjw;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a(Ll/cd00;Landroid/util/Pair;)V
    .locals 0
    .param p1    # Ll/cd00;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Landroid/util/Pair;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/cd00;",
            "Landroid/util/Pair<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p0, p1, p2}, Ll/ejw$a;->k(Ll/ejw;Ll/cd00;Landroid/util/Pair;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public b()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/ejw$a;->m(Ll/ejw;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c()I
    .locals 0

    .line 1
    invoke-static {p0}, Ll/ejw$a;->c(Ll/ejw;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public d()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-static {p0}, Ll/ejw$a;->d(Ll/ejw;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public e()Ll/fjw;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/core/dispatcher/task/MKTaskByCheckUpdate;->a:Ll/fjw;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public g()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/ejw$a;->j(Ll/ejw;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getBid()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-static {p0}, Ll/ejw$a;->a(Ll/ejw;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-static {p0}, Ll/ejw$a;->g(Ll/ejw;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public h()I
    .locals 0

    .line 1
    invoke-static {p0}, Ll/ejw$a;->e(Ll/ejw;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public i()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/ejw$a;->l(Ll/ejw;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-static {p0}, Ll/ejw$a;->f(Ll/ejw;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k()Landroid/util/Pair;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Pair<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-static {p0}, Ll/ejw$a;->h(Ll/ejw;)Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l()Ll/cd00;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-static {p0}, Ll/ejw$a;->b(Ll/ejw;)Ll/cd00;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/ejw$a;->i(Ll/ejw;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public n(Ll/cd00;)V
    .locals 6
    .param p1    # Ll/cd00;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Ll/dlw;->k()Ll/a7m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/hellogroup/mk/core/dispatcher/task/MKTaskByCheckUpdate;->getUrl()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p0}, Lcom/hellogroup/mk/core/dispatcher/task/MKTaskByCheckUpdate;->getBid()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {p0}, Lcom/hellogroup/mk/core/dispatcher/task/MKTaskByCheckUpdate;->e()Ll/fjw;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    invoke-virtual {v3}, Ll/fjw;->e()Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    new-instance v5, Lcom/hellogroup/mk/core/dispatcher/task/MKTaskByCheckUpdate$onExec$1;

    .line 24
    .line 25
    invoke-direct {v5, p0}, Lcom/hellogroup/mk/core/dispatcher/task/MKTaskByCheckUpdate$onExec$1;-><init>(Lcom/hellogroup/mk/core/dispatcher/task/MKTaskByCheckUpdate;)V

    .line 26
    .line 27
    .line 28
    move-object v4, p1

    .line 29
    invoke-interface/range {v0 .. v5}, Ll/a7m;->c(Ljava/lang/String;Ljava/lang/String;ZLl/cd00;Lkotlin/jvm/functions/Function0;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    const-string p1, "MKTaskExecutor"

    .line 34
    .line 35
    const-string v0, "ITaskExecutor not initialized"

    .line 36
    .line 37
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/hellogroup/mk/core/dispatcher/task/MKTaskByCheckUpdate;->m()V

    .line 41
    .line 42
    .line 43
    return-void
.end method
