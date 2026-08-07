.class public Ll/p5j;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/q5j;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/q5j<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/q5j;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/q5j<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/p5j;->a:Ll/q5j;

    .line 5
    .line 6
    return-void
.end method

.method public static b(Ll/q5j;)Ll/p5j;
    .locals 2
    .param p0    # Ll/q5j;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/q5j<",
            "*>;)",
            "Ll/p5j;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/p5j;

    .line 2
    .line 3
    const-string v1, "callbacks == null"

    .line 4
    .line 5
    invoke-static {p0, v1}, Ll/yn80;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ll/q5j;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/p5j;-><init>(Ll/q5j;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method


# virtual methods
.method public a(Landroidx/fragment/app/Fragment;)V
    .locals 1
    .param p1    # Landroidx/fragment/app/Fragment;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/p5j;->a:Ll/q5j;

    .line 2
    .line 3
    iget-object v0, p0, Ll/q5j;->e:Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p0, p1}, Landroidx/fragment/app/FragmentManager;->k(Ll/q5j;Ll/o5j;Landroidx/fragment/app/Fragment;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p5j;->a:Ll/q5j;

    .line 2
    .line 3
    iget-object p0, p0, Ll/q5j;->e:Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->y()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public d(Landroid/content/res/Configuration;)V
    .locals 0
    .param p1    # Landroid/content/res/Configuration;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/p5j;->a:Ll/q5j;

    .line 2
    .line 3
    iget-object p0, p0, Ll/q5j;->e:Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->A(Landroid/content/res/Configuration;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public e(Landroid/view/MenuItem;)Z
    .locals 0
    .param p1    # Landroid/view/MenuItem;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/p5j;->a:Ll/q5j;

    .line 2
    .line 3
    iget-object p0, p0, Ll/q5j;->e:Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->B(Landroid/view/MenuItem;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public f()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p5j;->a:Ll/q5j;

    .line 2
    .line 3
    iget-object p0, p0, Ll/q5j;->e:Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->C()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public g(Landroid/view/Menu;Landroid/view/MenuInflater;)Z
    .locals 0
    .param p1    # Landroid/view/Menu;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/MenuInflater;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/p5j;->a:Ll/q5j;

    .line 2
    .line 3
    iget-object p0, p0, Ll/q5j;->e:Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Landroidx/fragment/app/FragmentManager;->D(Landroid/view/Menu;Landroid/view/MenuInflater;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public h()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p5j;->a:Ll/q5j;

    .line 2
    .line 3
    iget-object p0, p0, Ll/q5j;->e:Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->E()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public i()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p5j;->a:Ll/q5j;

    .line 2
    .line 3
    iget-object p0, p0, Ll/q5j;->e:Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->G()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public j(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p5j;->a:Ll/q5j;

    .line 2
    .line 3
    iget-object p0, p0, Ll/q5j;->e:Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->H(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public k(Landroid/view/MenuItem;)Z
    .locals 0
    .param p1    # Landroid/view/MenuItem;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/p5j;->a:Ll/q5j;

    .line 2
    .line 3
    iget-object p0, p0, Ll/q5j;->e:Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->J(Landroid/view/MenuItem;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public l(Landroid/view/Menu;)V
    .locals 0
    .param p1    # Landroid/view/Menu;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/p5j;->a:Ll/q5j;

    .line 2
    .line 3
    iget-object p0, p0, Ll/q5j;->e:Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->K(Landroid/view/Menu;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public m()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p5j;->a:Ll/q5j;

    .line 2
    .line 3
    iget-object p0, p0, Ll/q5j;->e:Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->M()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public n(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p5j;->a:Ll/q5j;

    .line 2
    .line 3
    iget-object p0, p0, Ll/q5j;->e:Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->N(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public o(Landroid/view/Menu;)Z
    .locals 0
    .param p1    # Landroid/view/Menu;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/p5j;->a:Ll/q5j;

    .line 2
    .line 3
    iget-object p0, p0, Ll/q5j;->e:Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->O(Landroid/view/Menu;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public p()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p5j;->a:Ll/q5j;

    .line 2
    .line 3
    iget-object p0, p0, Ll/q5j;->e:Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->Q()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public q()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p5j;->a:Ll/q5j;

    .line 2
    .line 3
    iget-object p0, p0, Ll/q5j;->e:Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->R()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public r()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p5j;->a:Ll/q5j;

    .line 2
    .line 3
    iget-object p0, p0, Ll/q5j;->e:Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->T()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public s()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/p5j;->a:Ll/q5j;

    .line 2
    .line 3
    iget-object p0, p0, Ll/q5j;->e:Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->a0(Z)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public t()Landroidx/fragment/app/FragmentManager;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/p5j;->a:Ll/q5j;

    .line 2
    .line 3
    iget-object p0, p0, Ll/q5j;->e:Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    return-object p0
.end method

.method public u()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p5j;->a:Ll/q5j;

    .line 2
    .line 3
    iget-object p0, p0, Ll/q5j;->e:Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->U0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public v(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/p5j;->a:Ll/q5j;

    .line 2
    .line 3
    iget-object p0, p0, Ll/q5j;->e:Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->v0()Landroid/view/LayoutInflater$Factory2;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0, p1, p2, p3, p4}, Landroid/view/LayoutInflater$Factory2;->onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public w(Landroid/os/Parcelable;)V
    .locals 1
    .param p1    # Landroid/os/Parcelable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/p5j;->a:Ll/q5j;

    .line 2
    .line 3
    instance-of v0, p0, Ll/tll0;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/q5j;->e:Landroidx/fragment/app/FragmentManager;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentManager;->k1(Landroid/os/Parcelable;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const-string p0, "Your FragmentHostCallback must implement ViewModelStoreOwner to call restoreSaveState(). Call restoreAllState()  if you\'re still using retainNestedNonConfig()."

    .line 14
    .line 15
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public x()Landroid/os/Parcelable;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/p5j;->a:Ll/q5j;

    .line 2
    .line 3
    iget-object p0, p0, Ll/q5j;->e:Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->m1()Landroid/os/Parcelable;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
