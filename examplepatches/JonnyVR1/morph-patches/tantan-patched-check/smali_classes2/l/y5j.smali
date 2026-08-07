.class public Ll/y5j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ryd0;


# instance fields
.field public a:Landroidx/lifecycle/k;

.field public b:Ll/oyd0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/y5j;->a:Landroidx/lifecycle/k;

    .line 6
    .line 7
    iput-object v0, p0, Ll/y5j;->b:Ll/oyd0;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a(Landroidx/lifecycle/Lifecycle$Event;)V
    .locals 0
    .param p1    # Landroidx/lifecycle/Lifecycle$Event;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/y5j;->a:Landroidx/lifecycle/k;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/lifecycle/k;->i(Landroidx/lifecycle/Lifecycle$Event;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y5j;->a:Landroidx/lifecycle/k;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroidx/lifecycle/k;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Landroidx/lifecycle/k;-><init>(Ll/ker;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/y5j;->a:Landroidx/lifecycle/k;

    .line 11
    .line 12
    invoke-static {p0}, Ll/oyd0;->a(Ll/ryd0;)Ll/oyd0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Ll/y5j;->b:Ll/oyd0;

    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y5j;->a:Landroidx/lifecycle/k;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public d(Landroid/os/Bundle;)V
    .locals 0
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/y5j;->b:Ll/oyd0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/oyd0;->c(Landroid/os/Bundle;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e(Landroid/os/Bundle;)V
    .locals 0
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/y5j;->b:Ll/oyd0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/oyd0;->d(Landroid/os/Bundle;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f(Landroidx/lifecycle/Lifecycle$State;)V
    .locals 0
    .param p1    # Landroidx/lifecycle/Lifecycle$State;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/y5j;->a:Landroidx/lifecycle/k;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/lifecycle/k;->n(Landroidx/lifecycle/Lifecycle$State;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getLifecycle()Landroidx/lifecycle/Lifecycle;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/y5j;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/y5j;->a:Landroidx/lifecycle/k;

    .line 5
    .line 6
    return-object p0
.end method

.method public getSavedStateRegistry()Landroidx/savedstate/a;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/y5j;->b:Ll/oyd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/oyd0;->b()Landroidx/savedstate/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
