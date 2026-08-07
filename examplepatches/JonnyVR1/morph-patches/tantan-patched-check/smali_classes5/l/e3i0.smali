.class public Ll/e3i0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/e3i0$b;,
        Ll/e3i0$d;,
        Ll/e3i0$e;,
        Ll/e3i0$c;
    }
.end annotation


# instance fields
.field public a:Landroid/view/LayoutInflater;

.field public b:Landroid/os/Handler;

.field public c:Ll/e3i0$d;

.field public d:Landroid/os/Handler$Callback;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/e3i0$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/e3i0$a;-><init>(Ll/e3i0;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/e3i0;->d:Landroid/os/Handler$Callback;

    .line 10
    .line 11
    new-instance v0, Ll/e3i0$b;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Ll/e3i0$b;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/e3i0;->a:Landroid/view/LayoutInflater;

    .line 17
    .line 18
    new-instance p1, Landroid/os/Handler;

    .line 19
    .line 20
    iget-object v0, p0, Ll/e3i0;->d:Landroid/os/Handler$Callback;

    .line 21
    .line 22
    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Ll/e3i0;->b:Landroid/os/Handler;

    .line 26
    .line 27
    invoke-static {}, Ll/e3i0$d;->f()Ll/e3i0$d;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Ll/e3i0;->c:Ll/e3i0$d;

    .line 32
    .line 33
    return-void
.end method

.method public static bridge synthetic a(I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/e3i0;->c(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static c(I)Ljava/lang/String;
    .locals 1

    .line 1
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    return-object p0

    .line 12
    :catch_0
    const-string p0, "get error"

    .line 13
    .line 14
    return-object p0
.end method


# virtual methods
.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/e3i0;->c:Ll/e3i0$d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/e3i0;->c:Ll/e3i0$d;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/e3i0$d;->c()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public d(ILandroid/view/ViewGroup;Ll/e3i0$e;)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/LayoutRes;
        .end annotation
    .end param
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ll/e3i0$e;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/UiThread;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/e3i0;->e(ILandroid/view/ViewGroup;Ll/e3i0$e;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public e(ILandroid/view/ViewGroup;Ll/e3i0$e;Z)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/LayoutRes;
        .end annotation
    .end param
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ll/e3i0$e;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/UiThread;
    .end annotation

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/e3i0;->c:Ll/e3i0$d;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/e3i0$d;->h()Ll/e3i0$c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object p0, v0, Ll/e3i0$c;->a:Ll/e3i0;

    .line 10
    .line 11
    iput p1, v0, Ll/e3i0$c;->c:I

    .line 12
    .line 13
    iput-object p2, v0, Ll/e3i0$c;->b:Landroid/view/ViewGroup;

    .line 14
    .line 15
    iput-object p3, v0, Ll/e3i0$c;->f:Ll/e3i0$e;

    .line 16
    .line 17
    iput-boolean p4, v0, Ll/e3i0$c;->e:Z

    .line 18
    .line 19
    iget-object p0, p0, Ll/e3i0;->c:Ll/e3i0$d;

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/e3i0$d;->d(Ll/e3i0$c;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    const-string p0, "callback argument may not be null!"

    .line 26
    .line 27
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
