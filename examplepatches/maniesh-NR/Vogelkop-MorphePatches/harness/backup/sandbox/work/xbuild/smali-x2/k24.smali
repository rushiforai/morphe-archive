.class public abstract Lk24;
.super Lryl;
.source "SourceFile"

# interfaces
.implements Ll24;


# instance fields
.field public c:Lm24;

.field public final d:Lvr3;

.field public e:Lj24;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lryl;-><init>()V

    new-instance v0, Lvr3;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lk24;->d:Lvr3;

    return-void
.end method


# virtual methods
.method public L()V
    .registers 4

    iget-object v0, p0, Lk24;->d:Lvr3;

    iget-boolean v1, v0, Lvr3;->b:Z

    if-eqz v1, :cond_20

    const/4 v1, 0x0

    iput-boolean v1, v0, Lvr3;->b:Z

    invoke-virtual {v0}, Lvr3;->f()V

    iget-object v1, v0, Lvr3;->c:Ljava/lang/Object;

    check-cast v1, Landroid/view/ViewGroup;

    if-eqz v1, :cond_20

    iget-boolean v2, v0, Lvr3;->b:Z

    if-eqz v2, :cond_1c

    iget v0, v0, Lvr3;->a:I

    invoke-virtual {v1, v0}, Landroid/view/View;->setImportantForAccessibility(I)V

    goto :goto_20

    :cond_1c
    const/4 v0, 0x4

    invoke-virtual {v1, v0}, Landroid/view/View;->setImportantForAccessibility(I)V

    :cond_20
    :goto_20
    iget-object v0, p0, Lk24;->e:Lj24;

    if-eqz v0, :cond_2b

    instance-of p0, p0, Lar8;

    if-nez p0, :cond_2b

    const/4 p0, 0x1

    iput-boolean p0, v0, Lj24;->a:Z

    :cond_2b
    return-void
.end method

.method public final V()Z
    .registers 2

    invoke-virtual {p0}, Lryl;->i0()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-virtual {p0}, Lk24;->m0()V

    :cond_9
    const/4 p0, 0x1

    return p0
.end method

.method public final Z()Z
    .registers 1

    invoke-virtual {p0}, Lryl;->i0()Z

    const/4 p0, 0x1

    return p0
.end method

.method public h0(Landroidx/fragment/app/w;)V
    .registers 2

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p0

    check-cast p0, Lhjf;

    invoke-virtual {p0}, Lhjf;->t()Lijf;

    move-result-object p0

    invoke-interface {p0}, Lijf;->b()Lcom/opera/android/Lazy;

    move-result-object p0

    if-eqz p0, :cond_1d

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgjm;

    iget-object p0, p0, Lgjm;->c:Lshf;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lshf;->C(Ljava/lang/Integer;)Z

    return-void

    :cond_1d
    invoke-virtual {p1}, Landroidx/fragment/app/w;->X()Z

    return-void
.end method

.method public j()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public k0()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public l()V
    .registers 4

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isRemoving()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lk24;->d:Lvr3;

    iget-boolean v2, v1, Lvr3;->b:Z

    if-eq v0, v2, :cond_25

    iput-boolean v0, v1, Lvr3;->b:Z

    invoke-virtual {v1}, Lvr3;->f()V

    iget-object v0, v1, Lvr3;->c:Ljava/lang/Object;

    check-cast v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_25

    iget-boolean v2, v1, Lvr3;->b:Z

    if-eqz v2, :cond_21

    iget v1, v1, Lvr3;->a:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setImportantForAccessibility(I)V

    goto :goto_25

    :cond_21
    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setImportantForAccessibility(I)V

    :cond_25
    :goto_25
    iget-object v0, p0, Lk24;->e:Lj24;

    if-eqz v0, :cond_30

    instance-of p0, p0, Lar8;

    if-nez p0, :cond_30

    const/4 p0, 0x0

    iput-boolean p0, v0, Lj24;->a:Z

    :cond_30
    return-void
.end method

.method public l0(Z)V
    .registers 2

    iget-object p1, p0, Lk24;->d:Lvr3;

    iget-object p1, p1, Lvr3;->c:Ljava/lang/Object;

    check-cast p1, Landroid/view/ViewGroup;

    if-eqz p1, :cond_17

    invoke-virtual {p1}, Landroid/view/ViewGroup;->findFocus()Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_17

    sget-object p1, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object p1

    invoke-static {p1}, Lq9n;->u(Landroid/view/View;)Z

    :cond_17
    invoke-virtual {p0}, Lryl;->g0()V

    return-void
.end method

.method public m0()V
    .registers 1

    return-void
.end method

.method public abstract n0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
.end method

.method public onAttach(Landroid/content/Context;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/fragment/app/i;->onAttach(Landroid/content/Context;)V

    iget-object p1, p0, Lk24;->c:Lm24;

    if-nez p1, :cond_11

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lzi4;->y(Landroid/content/Context;)Lm24;

    move-result-object p1

    iput-object p1, p0, Lk24;->c:Lm24;

    :cond_11
    invoke-interface {p1, p0}, Lm24;->a(Ll24;)V

    return-void
.end method

.method public final onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 8

    const/4 p3, 0x0

    if-nez p2, :cond_8

    invoke-virtual {p0, p1, p3}, Lk24;->n0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_8
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0}, Lk24;->k0()I

    move-result v0

    sget-object v1, Lq9n;->c:Ll5b;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object p2

    if-eqz v0, :cond_24

    if-eqz p2, :cond_24

    new-instance v1, Ls8n;

    invoke-direct {v1, p1, v0}, Ls8n;-><init>(Landroid/content/Context;I)V

    move-object p1, v1

    :cond_24
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    new-instance v2, Lj24;

    invoke-direct {v2, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lk24;->e:Lj24;

    if-eqz v0, :cond_49

    if-eqz p2, :cond_49

    new-instance p1, Landroid/util/TypedValue;

    invoke-direct {p1}, Landroid/util/TypedValue;-><init>()V

    const/4 v3, 0x2

    iput v3, p1, Landroid/util/TypedValue;->type:I

    iput v0, p1, Landroid/util/TypedValue;->resourceId:I

    iput v0, p1, Landroid/util/TypedValue;->data:I

    new-instance v0, Lff2;

    sget-object v3, Lu8n;->h:[I

    invoke-direct {v0, v3, p1}, Lff2;-><init>([ILandroid/util/TypedValue;)V

    invoke-static {p2, v2, v0, p3}, Lu8n;->f(Ldll;Landroid/view/View;Lff2;Ljava/util/ArrayDeque;)V

    :cond_49
    iget-object p1, p0, Lk24;->e:Lj24;

    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 p3, -0x1

    invoke-direct {p2, p3, p3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p1, p0, Lk24;->e:Lj24;

    invoke-virtual {p0, v1, p1}, Lk24;->n0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    iget-object p2, p0, Lk24;->e:Lj24;

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object p0, p0, Lk24;->e:Lj24;

    return-object p0
.end method

.method public onDestroyView()V
    .registers 5

    iget-object v0, p0, Lk24;->d:Lvr3;

    iget-object v1, v0, Lvr3;->c:Ljava/lang/Object;

    check-cast v1, Landroid/view/ViewGroup;

    if-eqz v1, :cond_19

    invoke-virtual {v1}, Landroid/view/ViewGroup;->findFocus()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_19

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-static {v1}, Lq9n;->v(Landroid/view/Window;)Z

    :cond_19
    invoke-super {p0}, Landroidx/fragment/app/i;->onDestroyView()V

    iget-object v1, v0, Lvr3;->c:Ljava/lang/Object;

    check-cast v1, Landroid/view/ViewGroup;

    const/4 v2, 0x0

    if-eqz v1, :cond_4a

    iput-object v2, v0, Lvr3;->c:Ljava/lang/Object;

    iput-object v2, v0, Lvr3;->d:Ljava/lang/Object;

    invoke-virtual {v0}, Lvr3;->f()V

    iget-object v1, v0, Lvr3;->c:Ljava/lang/Object;

    check-cast v1, Landroid/view/ViewGroup;

    if-eqz v1, :cond_36

    invoke-virtual {v1}, Landroid/view/View;->getImportantForAccessibility()I

    move-result v1

    iput v1, v0, Lvr3;->a:I

    :cond_36
    iget-object v1, v0, Lvr3;->c:Ljava/lang/Object;

    check-cast v1, Landroid/view/ViewGroup;

    if-eqz v1, :cond_4a

    iget-boolean v3, v0, Lvr3;->b:Z

    if-eqz v3, :cond_46

    iget v0, v0, Lvr3;->a:I

    invoke-virtual {v1, v0}, Landroid/view/View;->setImportantForAccessibility(I)V

    goto :goto_4a

    :cond_46
    const/4 v0, 0x4

    invoke-virtual {v1, v0}, Landroid/view/View;->setImportantForAccessibility(I)V

    :cond_4a
    :goto_4a
    iput-object v2, p0, Lk24;->e:Lj24;

    return-void
.end method

.method public onDetach()V
    .registers 2

    iget-object v0, p0, Lk24;->c:Lm24;

    invoke-interface {v0, p0}, Lm24;->c(Ll24;)V

    invoke-super {p0}, Landroidx/fragment/app/i;->onDetach()V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 4

    invoke-super {p0, p1, p2}, Landroidx/fragment/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    sget p2, Lcom/opera/android/InputFilterFrameLayout;->c:I

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/view/View;->setClickable(Z)V

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/View;->setFocusable(Z)V

    new-instance p2, Lv8b;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnGenericMotionListener(Landroid/view/View$OnGenericMotionListener;)V

    new-instance p2, Lw8b;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnHoverListener(Landroid/view/View$OnHoverListener;)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    const/16 v0, 0x3e8

    invoke-static {p2, v0}, Landroid/view/PointerIcon;->getSystemIcon(Landroid/content/Context;I)Landroid/view/PointerIcon;

    move-result-object p2

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {p1, p2}, Lj5n;->a(Landroid/view/View;Landroid/view/PointerIcon;)V

    check-cast p1, Landroid/view/ViewGroup;

    iget-object p0, p0, Lk24;->d:Lvr3;

    iget-object p2, p0, Lvr3;->c:Ljava/lang/Object;

    check-cast p2, Landroid/view/ViewGroup;

    if-eq p1, p2, :cond_50

    iput-object p1, p0, Lvr3;->c:Ljava/lang/Object;

    const/4 p1, 0x0

    iput-object p1, p0, Lvr3;->d:Ljava/lang/Object;

    invoke-virtual {p0}, Lvr3;->f()V

    iget-object p1, p0, Lvr3;->c:Ljava/lang/Object;

    check-cast p1, Landroid/view/ViewGroup;

    if-eqz p1, :cond_4a

    invoke-virtual {p1}, Landroid/view/View;->getImportantForAccessibility()I

    move-result p1

    iput p1, p0, Lvr3;->a:I

    :cond_4a
    iget-object p1, p0, Lvr3;->c:Ljava/lang/Object;

    check-cast p1, Landroid/view/ViewGroup;

    if-nez p1, :cond_51

    :cond_50
    return-void

    :cond_51
    iget-boolean p2, p0, Lvr3;->b:Z

    if-eqz p2, :cond_5b

    iget p0, p0, Lvr3;->a:I

    invoke-virtual {p1, p0}, Landroid/view/View;->setImportantForAccessibility(I)V

    return-void

    :cond_5b
    const/4 p0, 0x4

    invoke-virtual {p1, p0}, Landroid/view/View;->setImportantForAccessibility(I)V

    return-void
.end method

.method public final u()Z
    .registers 3

    invoke-virtual {p0}, Lryl;->i0()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_a

    invoke-virtual {p0, v1}, Lk24;->l0(Z)V

    :cond_a
    return v1
.end method
