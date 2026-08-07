.class public abstract Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;
.super Landroidx/fragment/app/Fragment;
.source "SourceFile"


# instance fields
.field private A:Z

.field private B:I

.field private C:I

.field private D:Landroid/content/Intent;

.field private E:Z

.field private F:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private G:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;>;"
        }
    .end annotation
.end field

.field private H:Landroid/app/Dialog;

.field private I:Z

.field private J:Z

.field private K:Landroidx/appcompat/widget/Toolbar;

.field protected L:Ll/c2j0;

.field private M:Landroidx/appcompat/widget/Toolbar;

.field private N:Z

.field private O:Z

.field private P:Z

.field private Q:Z

.field private R:Z

.field private S:Z

.field T:Z

.field private U:Z

.field private V:Z

.field public z:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->z:Ljava/lang/String;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->A:Z

    .line 16
    .line 17
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->E:Z

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    iput-object v1, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->F:Ljava/lang/ref/WeakReference;

    .line 21
    .line 22
    iput-object v1, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->G:Landroid/util/SparseArray;

    .line 23
    .line 24
    iput-object v1, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->H:Landroid/app/Dialog;

    .line 25
    .line 26
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->I:Z

    .line 27
    .line 28
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->J:Z

    .line 29
    .line 30
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->N:Z

    .line 31
    .line 32
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->O:Z

    .line 33
    .line 34
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->P:Z

    .line 35
    .line 36
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->Q:Z

    .line 37
    .line 38
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->S:Z

    .line 39
    .line 40
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->T:Z

    .line 41
    .line 42
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->U:Z

    .line 43
    .line 44
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->V:Z

    .line 45
    .line 46
    return-void
.end method

.method private n4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->V3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Ll/vo2;->i(Landroidx/fragment/app/Fragment;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->m4()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->p4()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->W3()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->h4()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->g4()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->W3()V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method


# virtual methods
.method public V3()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->E:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->A:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getUserVisibleHint()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->S:Z

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->g4()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public W3()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->O:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->T:Z

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->T:Z

    .line 15
    .line 16
    return-void

    .line 17
    :cond_1
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->isCreated()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v1, 0x1

    .line 22
    if-eqz v0, :cond_3

    .line 23
    .line 24
    invoke-virtual {p0, v1}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->o4(Z)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->j4()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->Y3()Landroidx/appcompat/widget/Toolbar;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    if-eqz v0, :cond_3

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->e4()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->d4()Landroidx/appcompat/widget/Toolbar$f;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    if-lez v2, :cond_2

    .line 48
    .line 49
    :try_start_0
    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->getMenu()Landroid/view/Menu;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-interface {v4}, Landroid/view/Menu;->clear()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/Toolbar;->inflateMenu(I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v3}, Landroidx/appcompat/widget/Toolbar;->setOnMenuItemClickListener(Landroidx/appcompat/widget/Toolbar$f;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->q4()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :catch_0
    move-exception v0

    .line 67
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->z:Ljava/lang/String;

    .line 68
    .line 69
    const-string v3, ""

    .line 70
    .line 71
    invoke-static {v2, v3, v0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_2
    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->getMenu()Landroid/view/Menu;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-interface {v0}, Landroid/view/Menu;->clear()V

    .line 80
    .line 81
    .line 82
    :cond_3
    :goto_0
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->l4()V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0, v1}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->r4(Z)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public X3()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/vo2;->i(Landroidx/fragment/app/Fragment;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->m4()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public Y3()Landroidx/appcompat/widget/Toolbar;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->M:Landroidx/appcompat/widget/Toolbar;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->c4()Landroidx/appcompat/widget/Toolbar;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->M:Landroidx/appcompat/widget/Toolbar;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->M:Landroidx/appcompat/widget/Toolbar;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    return-object v0

    .line 16
    :cond_1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    instance-of v1, v0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;

    .line 23
    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    check-cast v0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->c4()Landroidx/appcompat/widget/Toolbar;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_2
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    if-eqz p0, :cond_3

    .line 38
    .line 39
    instance-of v0, p0, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;

    .line 40
    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    check-cast p0, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/activity/BaseMkActivity;->K0()Landroidx/appcompat/widget/Toolbar;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :cond_3
    const/4 p0, 0x0

    .line 51
    return-object p0
.end method

.method public Z3(I)Landroid/view/View;
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/IdRes;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(I)TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->G:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->G:Landroid/util/SparseArray;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Landroid/view/View;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move-object v0, v1

    .line 26
    :goto_0
    if-nez v0, :cond_3

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->a4()Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->a4()Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    :goto_1
    if-eqz v1, :cond_2

    .line 44
    .line 45
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->G:Landroid/util/SparseArray;

    .line 46
    .line 47
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 48
    .line 49
    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    :cond_2
    return-object v1

    .line 56
    :cond_3
    return-object v0
.end method

.method public a4()Landroid/view/View;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->F:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->b4()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    const/4 v3, 0x0

    .line 31
    invoke-virtual {v0, v2, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ljava/lang/ref/WeakReference;

    .line 36
    .line 37
    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    iput-object v1, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->F:Ljava/lang/ref/WeakReference;

    .line 41
    .line 42
    :cond_1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->F:Ljava/lang/ref/WeakReference;

    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    check-cast p0, Landroid/view/View;

    .line 49
    .line 50
    return-object p0

    .line 51
    :cond_2
    return-object v1
.end method

.method public abstract b4()I
.end method

.method public c4()Landroidx/appcompat/widget/Toolbar;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->K:Landroidx/appcompat/widget/Toolbar;

    .line 2
    .line 3
    return-object p0
.end method

.method public d4()Landroidx/appcompat/widget/Toolbar$f;
    .locals 0

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public e4()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    return p0
.end method

.method public abstract f4(Landroid/view/View;)V
.end method

.method public g4()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->N:Z

    .line 2
    .line 3
    return p0
.end method

.method public h4()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->A:Z

    .line 2
    .line 3
    return p0
.end method

.method public i4()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public isCreated()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->I:Z

    .line 2
    .line 3
    return p0
.end method

.method public j4()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->R:Z

    .line 2
    .line 3
    return p0
.end method

.method public k4(IILandroid/content/Intent;)V
    .locals 0

    .line 1
    return-void
.end method

.method public l4()V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/vo2;->o(Landroidx/fragment/app/Fragment;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->O:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->P:Z

    .line 9
    .line 10
    return-void
.end method

.method public abstract m4()V
.end method

.method public o4(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->N:Z

    .line 2
    .line 3
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->I:Z

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->J:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->B:I

    .line 12
    .line 13
    iget v1, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->C:I

    .line 14
    .line 15
    iget-object v2, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->D:Landroid/content/Intent;

    .line 16
    .line 17
    invoke-virtual {p0, v0, v1, v2}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->k4(IILandroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->J:Z

    .line 22
    .line 23
    :cond_0
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->i4()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->hashCode()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment$a;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment$a;-><init>(Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v0, v1}, Ll/x310;->c(Ljava/lang/Object;Ljava/lang/Runnable;)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->V3()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->X3()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->p4()V

    .line 56
    .line 57
    .line 58
    :cond_2
    :goto_0
    invoke-static {p0, p1}, Ll/vo2;->b(Landroidx/fragment/app/Fragment;Landroid/os/Bundle;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->i4()Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-nez p1, :cond_3

    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->h4()Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-nez p1, :cond_3

    .line 72
    .line 73
    invoke-static {p0}, Ll/vo2;->i(Landroidx/fragment/app/Fragment;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->m4()V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->p4()V

    .line 80
    .line 81
    .line 82
    :cond_3
    return-void
.end method

.method public final onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->I:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->k4(IILandroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->J:Z

    .line 11
    .line 12
    iput p1, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->B:I

    .line 13
    .line 14
    iput p2, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->C:I

    .line 15
    .line 16
    iput-object p3, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->D:Landroid/content/Intent;

    .line 17
    .line 18
    :goto_0
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/app/Activity;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p0, p1}, Ll/vo2;->c(Landroidx/fragment/app/Fragment;Landroid/app/Activity;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/util/SparseArray;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->G:Landroid/util/SparseArray;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->F:Ljava/lang/ref/WeakReference;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->I:Z

    .line 16
    .line 17
    invoke-static {p0, p1}, Ll/vo2;->d(Landroidx/fragment/app/Fragment;Landroid/os/Bundle;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->F:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->F:Ljava/lang/ref/WeakReference;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Landroid/view/View;

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->b4()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ljava/lang/ref/WeakReference;

    .line 31
    .line 32
    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    iput-object v1, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->F:Ljava/lang/ref/WeakReference;

    .line 36
    .line 37
    :goto_1
    invoke-static {p0}, Ll/c2j0;->d(Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;)Ll/c2j0;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iput-object v1, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->L:Ll/c2j0;

    .line 42
    .line 43
    invoke-virtual {v1}, Ll/c2j0;->g()Landroidx/appcompat/widget/Toolbar;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iput-object v1, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->K:Landroidx/appcompat/widget/Toolbar;

    .line 48
    .line 49
    const/4 v1, 0x1

    .line 50
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->E:Z

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->f4(Landroid/view/View;)V

    .line 53
    .line 54
    .line 55
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->S:Z

    .line 56
    .line 57
    invoke-static {p0, p1, p2, p3}, Ll/vo2;->e(Landroidx/fragment/app/Fragment;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)V

    .line 58
    .line 59
    .line 60
    iput-boolean v1, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->S:Z

    .line 61
    .line 62
    return-object v0
.end method

.method public onDestroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Ll/vo2;->f(Landroidx/fragment/app/Fragment;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onDestroyView()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->hashCode()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/x310;->a(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroyView()V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->S:Z

    .line 17
    .line 18
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->F:Ljava/lang/ref/WeakReference;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->clear()V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->F:Ljava/lang/ref/WeakReference;

    .line 25
    .line 26
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->G:Landroid/util/SparseArray;

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 29
    .line 30
    .line 31
    invoke-static {p0}, Ll/vo2;->g(Landroidx/fragment/app/Fragment;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public onDetach()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDetach()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->I:Z

    .line 6
    .line 7
    invoke-static {p0}, Ll/vo2;->h(Landroidx/fragment/app/Fragment;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onHiddenChanged(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onHiddenChanged(Z)V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->V:Z

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    :try_start_0
    iget-boolean p1, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->U:Z

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    const/4 p1, 0x1

    .line 13
    iput-boolean p1, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->U:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    return-void

    .line 16
    :catch_0
    move-exception p0

    .line 17
    invoke-static {}, Ll/ykw;->a()Ll/ykw;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1, p0}, Ll/ykw;->b(Ljava/lang/Throwable;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onPause()V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Ll/vo2;->j(Landroidx/fragment/app/Fragment;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 0
    .param p2    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # [I
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Ll/vo2;->k(Landroidx/fragment/app/Fragment;)V

    .line 5
    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->Q:Z

    .line 8
    .line 9
    if-nez v0, :cond_2

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->V3()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-static {p0}, Ll/vo2;->i(Landroidx/fragment/app/Fragment;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->m4()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->p4()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->W3()V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->h4()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->g4()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->W3()V

    .line 43
    .line 44
    .line 45
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 46
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->Q:Z

    .line 47
    .line 48
    :cond_2
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p0, p1}, Ll/vo2;->l(Landroidx/fragment/app/Fragment;Landroid/os/Bundle;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onStart()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStart()V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Ll/vo2;->m(Landroidx/fragment/app/Fragment;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onStop()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStop()V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Ll/vo2;->n(Landroidx/fragment/app/Fragment;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p4()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->A:Z

    .line 3
    .line 4
    return-void
.end method

.method public q4()V
    .locals 0

    .line 1
    return-void
.end method

.method public r4(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->S:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->R:Z

    .line 6
    .line 7
    :cond_0
    return-void
.end method

.method public setUserVisibleHint(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->setUserVisibleHint(Z)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getUserVisibleHint()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->n4()V

    .line 11
    .line 12
    .line 13
    :cond_0
    :try_start_0
    iget-boolean p1, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->V:Z

    .line 14
    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getUserVisibleHint()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    iget-boolean p1, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->U:Z

    .line 24
    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    const/4 p1, 0x1

    .line 28
    iput-boolean p1, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->U:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catch_0
    move-exception p1

    .line 32
    invoke-static {}, Ll/ykw;->a()Ll/ykw;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0, p1}, Ll/ykw;->b(Ljava/lang/Throwable;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    :goto_0
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getUserVisibleHint()Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_2

    .line 44
    .line 45
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->n4()V

    .line 46
    .line 47
    .line 48
    :cond_2
    return-void
.end method
