.class public final Ll/q21;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/q21$d;,
        Ll/q21$b;,
        Ll/q21$c;,
        Ll/q21$e;
    }
.end annotation


# instance fields
.field public a:Landroid/view/LayoutInflater;

.field public b:Landroid/os/Handler;

.field public c:Ll/q21$d;

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
    new-instance v0, Ll/q21$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/q21$a;-><init>(Ll/q21;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/q21;->d:Landroid/os/Handler$Callback;

    .line 10
    .line 11
    new-instance v0, Ll/q21$b;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Ll/q21$b;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/q21;->a:Landroid/view/LayoutInflater;

    .line 17
    .line 18
    new-instance p1, Landroid/os/Handler;

    .line 19
    .line 20
    iget-object v0, p0, Ll/q21;->d:Landroid/os/Handler$Callback;

    .line 21
    .line 22
    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Ll/q21;->b:Landroid/os/Handler;

    .line 26
    .line 27
    invoke-static {}, Ll/q21$d;->b()Ll/q21$d;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Ll/q21;->c:Ll/q21$d;

    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public a(ILandroid/view/ViewGroup;Ll/q21$e;)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/LayoutRes;
        .end annotation
    .end param
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ll/q21$e;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/UiThread;
    .end annotation

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/q21;->c:Ll/q21$d;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/q21$d;->c()Ll/q21$c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object p0, v0, Ll/q21$c;->a:Ll/q21;

    .line 10
    .line 11
    iput p1, v0, Ll/q21$c;->c:I

    .line 12
    .line 13
    iput-object p2, v0, Ll/q21$c;->b:Landroid/view/ViewGroup;

    .line 14
    .line 15
    iput-object p3, v0, Ll/q21$c;->e:Ll/q21$e;

    .line 16
    .line 17
    iget-object p0, p0, Ll/q21;->c:Ll/q21$d;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/q21$d;->a(Ll/q21$c;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const-string p0, "callback argument may not be null!"

    .line 24
    .line 25
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
