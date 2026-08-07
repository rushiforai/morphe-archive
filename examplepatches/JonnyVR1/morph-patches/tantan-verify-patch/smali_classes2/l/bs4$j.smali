.class public Ll/bs4$j;
.super Ll/yhj0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/bs4;->createAnimator(Landroid/view/ViewGroup;Ll/kij0;Ll/kij0;)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:Landroid/view/ViewGroup;

.field public final synthetic c:Ll/bs4;


# direct methods
.method public constructor <init>(Ll/bs4;Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bs4$j;->c:Ll/bs4;

    .line 2
    .line 3
    iput-object p2, p0, Ll/bs4$j;->b:Landroid/view/ViewGroup;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/yhj0;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Ll/bs4$j;->a:Z

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public b(Ll/ygj0;)V
    .locals 0
    .param p1    # Ll/ygj0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/bs4$j;->b:Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p0, p1}, Ll/dll0;->c(Landroid/view/ViewGroup;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public c(Ll/ygj0;)V
    .locals 2
    .param p1    # Ll/ygj0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-boolean v0, p0, Ll/bs4$j;->a:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/bs4$j;->b:Landroid/view/ViewGroup;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {v0, v1}, Ll/dll0;->c(Landroid/view/ViewGroup;Z)V

    .line 9
    .line 10
    .line 11
    :cond_0
    invoke-virtual {p1, p0}, Ll/ygj0;->removeListener(Ll/ygj0$g;)Ll/ygj0;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public d(Ll/ygj0;)V
    .locals 0
    .param p1    # Ll/ygj0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/bs4$j;->b:Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-static {p0, p1}, Ll/dll0;->c(Landroid/view/ViewGroup;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public e(Ll/ygj0;)V
    .locals 1
    .param p1    # Ll/ygj0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Ll/bs4$j;->b:Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Ll/dll0;->c(Landroid/view/ViewGroup;Z)V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Ll/bs4$j;->a:Z

    .line 9
    .line 10
    return-void
.end method
