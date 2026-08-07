.class public Ll/dgq0$i;
.super Ll/dgq0$h;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RequiresApi;
    value = 0x1d
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/dgq0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "i"
.end annotation


# instance fields
.field public n:Ll/svm;

.field public o:Ll/svm;

.field public p:Ll/svm;


# direct methods
.method public constructor <init>(Ll/dgq0;Landroid/view/WindowInsets;)V
    .locals 0
    .param p1    # Ll/dgq0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/WindowInsets;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dgq0$h;-><init>(Ll/dgq0;Landroid/view/WindowInsets;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Ll/dgq0$i;->n:Ll/svm;

    .line 6
    .line 7
    iput-object p1, p0, Ll/dgq0$i;->o:Ll/svm;

    .line 8
    .line 9
    iput-object p1, p0, Ll/dgq0$i;->p:Ll/svm;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Ll/dgq0;Ll/dgq0$i;)V
    .locals 0
    .param p1    # Ll/dgq0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/dgq0$i;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0, p1, p2}, Ll/dgq0$h;-><init>(Ll/dgq0;Ll/dgq0$h;)V

    const/4 p1, 0x0

    .line 13
    iput-object p1, p0, Ll/dgq0$i;->n:Ll/svm;

    .line 14
    iput-object p1, p0, Ll/dgq0$i;->o:Ll/svm;

    .line 15
    iput-object p1, p0, Ll/dgq0$i;->p:Ll/svm;

    return-void
.end method


# virtual methods
.method public h()Ll/svm;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dgq0$i;->o:Ll/svm;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/dgq0$f;->c:Landroid/view/WindowInsets;

    .line 6
    .line 7
    invoke-static {v0}, Ll/pgq0;->a(Landroid/view/WindowInsets;)Landroid/graphics/Insets;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/svm;->d(Landroid/graphics/Insets;)Ll/svm;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/dgq0$i;->o:Ll/svm;

    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Ll/dgq0$i;->o:Ll/svm;

    .line 18
    .line 19
    return-object p0
.end method

.method public j()Ll/svm;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dgq0$i;->n:Ll/svm;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/dgq0$f;->c:Landroid/view/WindowInsets;

    .line 6
    .line 7
    invoke-static {v0}, Ll/qgq0;->a(Landroid/view/WindowInsets;)Landroid/graphics/Insets;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/svm;->d(Landroid/graphics/Insets;)Ll/svm;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/dgq0$i;->n:Ll/svm;

    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Ll/dgq0$i;->n:Ll/svm;

    .line 18
    .line 19
    return-object p0
.end method

.method public l()Ll/svm;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dgq0$i;->p:Ll/svm;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/dgq0$f;->c:Landroid/view/WindowInsets;

    .line 6
    .line 7
    invoke-static {v0}, Ll/ogq0;->a(Landroid/view/WindowInsets;)Landroid/graphics/Insets;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/svm;->d(Landroid/graphics/Insets;)Ll/svm;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/dgq0$i;->p:Ll/svm;

    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Ll/dgq0$i;->p:Ll/svm;

    .line 18
    .line 19
    return-object p0
.end method

.method public s(Ll/svm;)V
    .locals 0
    .param p1    # Ll/svm;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    return-void
.end method
