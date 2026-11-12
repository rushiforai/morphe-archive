.class public abstract Lltl;
.super Lk24;
.source "SourceFile"


# instance fields
.field public final f:Lnrl;

.field public g:Lwjj;

.field public h:Litl;

.field public final i:Ljava/util/ArrayList;

.field public j:Lqe6;

.field public k:Lcom/opera/android/StatusBarDrawingFrameLayout;

.field public l:Landroidx/appcompat/widget/Toolbar;

.field public m:Lse;

.field protected n:Lqm9;
    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation
.end field

.field public o:Z

.field public p:Z

.field public final q:Lr63;


# direct methods
.method public constructor <init>(Litl;)V
    .registers 4

    invoke-direct {p0}, Lk24;-><init>()V

    new-instance v0, Lnrl;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lltl;->f:Lnrl;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lltl;->i:Ljava/util/ArrayList;

    new-instance v0, Lr63;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lr63;-><init>(Lk24;B)V

    iput-object v0, p0, Lltl;->q:Lr63;

    iput-object p1, p0, Lltl;->h:Litl;

    return-void
.end method

.method public static o0(Lcom/google/android/material/appbar/AppBarLayout;I)V
    .registers 3

    const/4 v0, -0x1

    if-eq p1, v0, :cond_f

    iput p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->n:I

    iget-object p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->o:Ljava/lang/ref/WeakReference;

    if-eqz p1, :cond_c

    invoke-virtual {p1}, Ljava/lang/ref/Reference;->clear()V

    :cond_c
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->o:Ljava/lang/ref/WeakReference;

    :cond_f
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    check-cast p0, Lqv5;

    iget-object p1, p0, Lqv5;->a:Lnv5;

    check-cast p1, Lcom/google/android/material/appbar/AppBarLayout$Behavior;

    if-nez p1, :cond_20

    new-instance p1, Lcom/google/android/material/appbar/AppBarLayout$Behavior;

    invoke-direct {p1}, Lcom/google/android/material/appbar/AppBarLayout$Behavior;-><init>()V

    :cond_20
    new-instance v0, Lgtl;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p1, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->o:Lgtl;

    invoke-virtual {p0, p1}, Lqv5;->b(Lnv5;)V

    return-void
.end method


# virtual methods
.method public A0(Lcom/google/android/material/floatingactionbutton/FloatingActionButton;)V
    .registers 3

    invoke-static {p1}, Latj;->a(Landroid/view/View;)V

    const p0, 0x7f1400d5

    const/4 v0, 0x0

    invoke-static {p1, p0, v0}, Ln1h;->n(Landroid/view/View;II)V

    const p0, 0x7f0804df

    invoke-virtual {p1, p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setImageResource(I)V

    return-void
.end method

.method public B0(Landroid/view/LayoutInflater;Lcom/opera/android/custom_views/FadingRecyclerView;)V
    .registers 3

    return-void
.end method

.method public C0(Litl;)Litl;
    .registers 2

    return-object p1
.end method

.method public final D0()V
    .registers 4

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_14

    iget-boolean v1, p0, Lltl;->o:Z

    if-eqz v1, :cond_14

    new-instance v1, Lcbl;

    const/16 v2, 0xd

    invoke-direct {v1, p0, v2}, Lcbl;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    :cond_14
    return-void
.end method

.method public final E0()V
    .registers 7

    iget-object v0, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lf03;->v(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v1

    iget-object v2, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p0, v0}, Lltl;->t0(Landroid/content/Context;)I

    move-result v0

    invoke-virtual {p0}, Lltl;->s0()I

    move-result v3

    const/4 v4, 0x0

    if-nez v0, :cond_1b

    invoke-virtual {v2, v4}, Landroidx/appcompat/widget/Toolbar;->A(Landroid/graphics/drawable/Drawable;)V

    goto :goto_37

    :cond_1b
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v0, v5}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {v0, v1}, Lj14;->o0(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    invoke-virtual {v2, v0}, Landroidx/appcompat/widget/Toolbar;->A(Landroid/graphics/drawable/Drawable;)V

    const-string v0, "mNavButtonView"

    invoke-static {v2, v0}, Lmzg;->h(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_37

    const/4 v2, 0x0

    invoke-static {v0, v3, v2}, Ln1h;->n(Landroid/view/View;II)V

    :cond_37
    :goto_37
    iget-object v0, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    iget-object v0, v0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/AppCompatImageButton;

    if-eqz v0, :cond_41

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    :cond_41
    if-nez v4, :cond_44

    return-void

    :cond_44
    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, v1}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    iget-object p0, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->c()V

    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/AppCompatImageButton;

    invoke-virtual {p0, v4}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public final F0(Ljtl;)Lktl;
    .registers 3

    new-instance v0, Lktl;

    invoke-direct {v0, p1}, Lktl;-><init>(Ljtl;)V

    iget-object p0, p0, Lltl;->i:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public final j0(Lbtj;)V
    .registers 3

    iget-object v0, p0, Lltl;->h:Litl;

    iget-boolean v0, v0, Litl;->d:Z

    if-eqz v0, :cond_9

    iput-object p1, p0, Lryl;->b:Lbtj;

    return-void

    :cond_9
    const-string p0, "ToolbarFragment installs its own snackbar handler. Call Config.Builder.withCustomSnackbarHandling() to opt out."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-void
.end method

.method public final m0()V
    .registers 2

    iget-object v0, p0, Lltl;->m:Lse;

    if-nez v0, :cond_9

    iget-object p0, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->F()Z

    :cond_9
    return-void
.end method

.method public final n0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 15

    iget-object v0, p0, Lltl;->h:Litl;

    invoke-virtual {p0, v0}, Lltl;->C0(Litl;)Litl;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v1

    iget-object v2, p0, Lltl;->f:Lnrl;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v3, v1, Lcom/opera/android/BrowserActivity;

    if-eqz v3, :cond_1e

    check-cast v1, Lcom/opera/android/BrowserActivity;

    new-instance v3, Lv6d;

    iget-object v1, v1, Lcom/opera/android/BrowserActivity;->u1:Lqq6;

    invoke-direct {v3, v1}, Lv6d;-><init>(Lqq6;)V

    iput-object v3, v2, Lnrl;->b:Ljava/lang/Object;

    :cond_1e
    iget-boolean v1, v0, Litl;->h:Z

    const/4 v3, 0x1

    if-eqz v1, :cond_25

    iput-boolean v3, v2, Lnrl;->a:Z

    :cond_25
    if-eqz p2, :cond_2c

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    goto :goto_30

    :cond_2c
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p2

    :goto_30
    sget-boolean v1, Lpjm;->a:Z

    iget v2, v0, Litl;->i:I

    const/4 v4, 0x2

    if-eqz v1, :cond_3c

    if-ne v2, v3, :cond_3b

    move v2, v3

    goto :goto_3c

    :cond_3b
    move v2, v4

    :cond_3c
    :goto_3c
    const/4 v1, 0x0

    if-ne v2, v3, :cond_41

    move v5, v3

    goto :goto_42

    :cond_41
    move v5, v1

    :goto_42
    new-instance v6, Lcom/opera/android/StatusBarDrawingFrameLayout;

    const/4 v7, 0x0

    invoke-direct {v6, p2, v7}, Lcom/opera/android/StatusBarDrawingFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v6, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    if-eqz v5, :cond_52

    iget-boolean v8, v0, Litl;->e:Z

    if-nez v8, :cond_52

    move v8, v3

    goto :goto_53

    :cond_52
    move v8, v1

    :goto_53
    invoke-virtual {v6, v8}, Lcom/opera/android/StatusBarDrawingFrameLayout;->c(Z)V

    if-eqz v5, :cond_6a

    iget-boolean v5, v0, Litl;->e:Z

    if-nez v5, :cond_6a

    iget-boolean v5, v0, Litl;->f:Z

    if-nez v5, :cond_6a

    iget-object v5, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    new-instance v6, Letl;

    invoke-direct {v6, p0, v1}, Letl;-><init>(Lltl;B)V

    invoke-static {v5, v6}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    :cond_6a
    iget-object v5, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-static {v5}, Lxug;->k(Landroid/view/View;)Latj;

    move-result-object v6

    if-nez v6, :cond_7d

    new-instance v6, Latj;

    invoke-direct {v6, v5}, Latj;-><init>(Landroid/view/View;)V

    const v8, 0x7f0a0a8f

    invoke-virtual {v5, v8, v6}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    :cond_7d
    iget-object v6, v0, Litl;->l:Lsa2;

    iget v6, v6, Lsa2;->b:I

    invoke-virtual {p1, v6, v5, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v6

    iget-object v8, v0, Litl;->l:Lsa2;

    sget-object v9, Litl;->m:Lsa2;

    if-ne v8, v9, :cond_bd

    sget-object v8, Lr5n;->a:Ljava/util/WeakHashMap;

    const v8, 0x7f0a0bbf

    invoke-static {v6, v8}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/view/View;

    check-cast v8, Landroid/view/ViewStub;

    if-eq v2, v3, :cond_b6

    if-eq v2, v4, :cond_b2

    const/4 v10, 0x3

    if-eq v2, v10, :cond_ae

    const/4 v10, 0x4

    if-eq v2, v10, :cond_aa

    const/4 v10, 0x5

    if-ne v2, v10, :cond_a9

    const v2, 0x7f0d0429

    goto :goto_b7

    :cond_a9
    throw v7

    :cond_aa
    const v2, 0x7f0d042a

    goto :goto_b7

    :cond_ae
    const v2, 0x7f0d042d

    goto :goto_b7

    :cond_b2
    const v2, 0x7f0d042c

    goto :goto_b7

    :cond_b6
    move v2, v1

    :goto_b7
    invoke-virtual {v8, v2}, Landroid/view/ViewStub;->setLayoutResource(I)V

    invoke-virtual {v8}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    :cond_bd
    const v2, 0x7f0a0bba

    invoke-static {v2, v6}, Lq9n;->y(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroidx/appcompat/widget/Toolbar;

    iput-object v2, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    iget-object v8, v0, Litl;->a:Lpxh;

    if-eqz v8, :cond_d7

    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    invoke-virtual {v8, v10}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v8

    invoke-virtual {v2, v8}, Landroidx/appcompat/widget/Toolbar;->D(Ljava/lang/CharSequence;)V

    :cond_d7
    iget-object v2, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    new-instance v8, Lic;

    const/16 v10, 0xd

    invoke-direct {v8, p0, v10}, Lic;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v8}, Landroidx/appcompat/widget/Toolbar;->B(Landroid/view/View$OnClickListener;)V

    iget-object v2, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    new-instance v8, Letl;

    invoke-direct {v8, p0, v3}, Letl;-><init>(Lltl;B)V

    invoke-static {v2, v8}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    iget v2, v0, Litl;->b:I

    if-eqz v2, :cond_132

    iget-object v8, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v10, Llsk;

    invoke-virtual {v8}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v11

    invoke-direct {v10, v11}, Llsk;-><init>(Landroid/content/Context;)V

    invoke-virtual {v8}, Landroidx/appcompat/widget/Toolbar;->o()Litd;

    move-result-object v8

    invoke-virtual {v10, v2, v8}, Llsk;->inflate(ILandroid/view/Menu;)V

    iget-object v2, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    new-instance v8, Letl;

    invoke-direct {v8, p0, v4}, Letl;-><init>(Lltl;B)V

    invoke-static {v2, v8}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    iget-object v2, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    new-instance v8, Lcrk;

    const/16 v10, 0x11

    invoke-direct {v8, p0, v10}, Lcrk;-><init>(Ljava/lang/Object;B)V

    iput-object v8, v2, Landroidx/appcompat/widget/Toolbar;->H:Lssl;

    invoke-virtual {v2}, Landroidx/appcompat/widget/Toolbar;->o()Litd;

    move-result-object v2

    invoke-virtual {p0, v2}, Lltl;->x0(Litd;)V

    iget-object v2, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    new-instance v8, Lhtl;

    invoke-direct {v8}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v10

    iget-object v2, v2, Landroidx/appcompat/widget/Toolbar;->F:Lntd;

    invoke-virtual {v2, v8, v10}, Lntd;->a(Lmud;Lndc;)V

    :cond_132
    iget-boolean v2, v0, Litl;->c:Z

    if-eqz v2, :cond_148

    const v2, 0x7f0a0413

    invoke-virtual {v6, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v2, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {v2, v1, v3}, Lsan;->a(IZ)V

    invoke-virtual {p0, v2}, Lltl;->A0(Lcom/google/android/material/floatingactionbutton/FloatingActionButton;)V

    :cond_148
    new-instance v2, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    invoke-direct {v2, p2, v7}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance v8, Lqm9;

    invoke-direct {v8, v2}, Lqm9;-><init>(Landroid/view/View;)V

    iput-object v8, p0, Lltl;->n:Lqm9;

    iget-boolean v10, v0, Litl;->d:Z

    if-nez v10, :cond_15a

    iput-object v8, p0, Lryl;->b:Lbtj;

    :cond_15a
    invoke-virtual {v5, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object v2, v0, Litl;->l:Lsa2;

    if-ne v2, v9, :cond_216

    sget-object v2, Lr5n;->a:Ljava/util/WeakHashMap;

    const v2, 0x7f0a026c

    invoke-static {v6, v2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    check-cast v2, Landroid/view/ViewStub;

    iget v8, v0, Litl;->j:I

    if-eq v8, v3, :cond_179

    if-ne v8, v4, :cond_178

    const v8, 0x7f0d0427

    goto :goto_17c

    :cond_178
    throw v7

    :cond_179
    const v8, 0x7f0d0426

    :goto_17c
    invoke-virtual {v2, v8}, Landroid/view/ViewStub;->setLayoutResource(I)V

    invoke-virtual {v2}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    iget v8, v0, Litl;->j:I

    invoke-static {v8}, Lvep;->A(I)I

    move-result v8

    if-eqz v8, :cond_19e

    if-eq v8, v3, :cond_191

    move-object v8, v7

    goto :goto_1b1

    :cond_191
    move-object v8, v2

    check-cast v8, La6n;

    invoke-virtual {p0, v6, v2}, Lltl;->p0(Landroid/view/View;Landroid/view/View;)V

    move-object v9, v2

    check-cast v9, Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {p0, p1, v9}, Lltl;->B0(Landroid/view/LayoutInflater;Lcom/opera/android/custom_views/FadingRecyclerView;)V

    goto :goto_1b1

    :cond_19e
    move-object v8, v2

    check-cast v8, La6n;

    invoke-virtual {p0, v6, v2}, Lltl;->p0(Landroid/view/View;Landroid/view/View;)V

    new-instance v9, Lwjj;

    move-object v10, v2

    check-cast v10, Landroidx/core/widget/NestedScrollView;

    invoke-direct {v9, v10}, Lwjj;-><init>(Landroidx/core/widget/NestedScrollView;)V

    iput-object v9, p0, Lltl;->g:Lwjj;

    invoke-virtual {p0, p1, v2}, Lltl;->v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V

    :goto_1b1
    iget v9, v0, Litl;->k:I

    if-eqz v9, :cond_1f2

    const v9, 0x7f0a0184

    invoke-static {v6, v9}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/View;

    check-cast v6, Landroid/view/ViewStub;

    iget v9, v0, Litl;->k:I

    if-eq v9, v3, :cond_1cb

    if-ne v9, v4, :cond_1ca

    const v4, 0x7f0d0428

    goto :goto_1ce

    :cond_1ca
    throw v7

    :cond_1cb
    const v4, 0x7f0d0425

    :goto_1ce
    invoke-virtual {v6, v4}, Landroid/view/ViewStub;->setLayoutResource(I)V

    invoke-virtual {v6}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    invoke-virtual {p0, p1, v4}, Lltl;->u0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V

    if-eqz v8, :cond_1ef

    const p1, 0x7f040466

    const v4, 0x106000d

    invoke-static {p1, p2, v4}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-interface {v8, p1}, La6n;->h(Landroid/content/res/ColorStateList;)V

    invoke-interface {v8}, La6n;->f()V

    invoke-interface {v8}, La6n;->c()V

    :cond_1ef
    invoke-virtual {v6, v1}, Landroid/view/ViewStub;->setVisibility(I)V

    :cond_1f2
    iget p1, v0, Litl;->k:I

    if-eqz p1, :cond_1f8

    move p1, v3

    goto :goto_1f9

    :cond_1f8
    move p1, v1

    :goto_1f9
    iget-object p2, v0, Litl;->g:Ldxh;

    if-eqz p1, :cond_20d

    iget-object p1, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-virtual {p1, v3}, Lcom/opera/android/StatusBarDrawingFrameLayout;->d(Z)V

    iget-object p1, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    new-instance p2, Llje;

    invoke-direct {p2, p1, v1}, Llje;-><init>(Lcom/opera/android/StatusBarDrawingFrameLayout;B)V

    invoke-static {p1, p2}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    goto :goto_21c

    :cond_20d
    invoke-static {v2}, Lz4o;->q0(Landroid/view/View;)V

    iget-object p1, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-static {p1, p2}, Lz4o;->r0(Lcom/opera/android/StatusBarDrawingFrameLayout;Ldxh;)V

    goto :goto_21c

    :cond_216
    invoke-virtual {p0, p1, v5}, Lltl;->y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V

    invoke-virtual {p0}, Lltl;->z0()V

    :goto_21c
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object p1

    iget-object p0, p0, Lltl;->q:Lr63;

    iget-object p1, p1, Landroidx/fragment/app/w;->o:Ljava/util/ArrayList;

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v5
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object p0, p0, Lltl;->n:Lqm9;

    if-eqz p0, :cond_e

    iget-object p0, p0, Lqm9;->d:Lgtj;

    if-eqz p0, :cond_e

    invoke-virtual {p0}, Lgtj;->k()V

    :cond_e
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 2

    invoke-super {p0, p1}, Lryl;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroidx/fragment/app/i;->setShowsDialog(Z)V

    return-void
.end method

.method public final onCreateAnimation(IZI)Landroid/view/animation/Animation;
    .registers 9

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v1

    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onCreateAnimation(IZI)Landroid/view/animation/Animation;

    move-result-object v2

    iget-object p0, p0, Lltl;->f:Lnrl;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-nez v2, :cond_19

    if-eqz p3, :cond_19

    invoke-static {v0, p3}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v2

    :cond_19
    const/4 p3, 0x0

    if-nez v2, :cond_37

    const/16 v0, 0x1001

    if-eq p1, v0, :cond_28

    const/16 v0, 0x1003

    if-eq p1, v0, :cond_28

    const/16 v0, 0x2002

    if-ne p1, v0, :cond_37

    :cond_28
    const/4 p1, 0x2

    new-array p1, p1, [F

    fill-array-data p1, :array_90

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p3

    const-wide/16 v3, 0xdc

    invoke-virtual {p3, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    :cond_37
    if-nez v2, :cond_50

    if-nez p3, :cond_50

    if-eqz p2, :cond_40

    sget-object p1, Lt6d;->d:Lt6d;

    goto :goto_42

    :cond_40
    sget-object p1, Lt6d;->a:Lt6d;

    :goto_42
    iget-object p2, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast p2, Lv6d;

    if-eqz p2, :cond_8a

    iget-boolean p0, p0, Lnrl;->a:Z

    if-eqz p0, :cond_8a

    invoke-virtual {p2, p1}, Lv6d;->b(Lt6d;)V

    goto :goto_8a

    :cond_50
    if-eqz p2, :cond_7b

    new-instance p1, Lld9;

    const/4 p2, 0x5

    invoke-direct {p1, p0, p2}, Lld9;-><init>(Ljava/lang/Object;B)V

    if-eqz v2, :cond_63

    new-instance p2, Lzk9;

    invoke-direct {p2, p0, v1, p1}, Lzk9;-><init>(Lnrl;Landroid/view/View;Lld9;)V

    invoke-virtual {v2, p2}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    goto :goto_6b

    :cond_63
    new-instance p2, Lal9;

    invoke-direct {p2, p0, v1, p1}, Lal9;-><init>(Lnrl;Landroid/view/View;Lld9;)V

    invoke-virtual {p3, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    :goto_6b
    sget-object p1, Lt6d;->c:Lt6d;

    iget-object p2, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast p2, Lv6d;

    if-eqz p2, :cond_8a

    iget-boolean p0, p0, Lnrl;->a:Z

    if-eqz p0, :cond_8a

    invoke-virtual {p2, p1}, Lv6d;->b(Lt6d;)V

    goto :goto_8a

    :cond_7b
    sget-object p1, Lt6d;->a:Lt6d;

    iget-object p2, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast p2, Lv6d;

    if-eqz p2, :cond_8a

    iget-boolean p0, p0, Lnrl;->a:Z

    if-eqz p0, :cond_8a

    invoke-virtual {p2, p1}, Lv6d;->b(Lt6d;)V

    :cond_8a
    :goto_8a
    if-eqz p3, :cond_8f

    invoke-virtual {p3}, Landroid/animation/Animator;->start()V

    :cond_8f
    return-object v2

    :array_90
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public onDestroyView()V
    .registers 5

    iget-object v0, p0, Lltl;->m:Lse;

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Lse;->a()V

    :cond_7
    const/4 v0, 0x0

    iput-object v0, p0, Lryl;->b:Lbtj;

    iput-object v0, p0, Lltl;->n:Lqm9;

    const/4 v1, 0x0

    iput-boolean v1, p0, Lltl;->o:Z

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object v1

    iget-object v2, p0, Lltl;->q:Lr63;

    iget-object v1, v1, Landroidx/fragment/app/w;->o:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v1, p0, Lltl;->f:Lnrl;

    iget-object v2, v1, Lnrl;->b:Ljava/lang/Object;

    check-cast v2, Lv6d;

    if-eqz v2, :cond_29

    sget-object v3, Lt6d;->a:Lt6d;

    invoke-virtual {v2, v3}, Lv6d;->b(Lt6d;)V

    iput-object v0, v1, Lnrl;->b:Ljava/lang/Object;

    :cond_29
    invoke-super {p0}, Lk24;->onDestroyView()V

    return-void
.end method

.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 2

    const/4 p0, 0x1

    return p0
.end method

.method public onPause()V
    .registers 2

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onPause()V

    invoke-virtual {p0}, Lltl;->w0()Z

    move-result v0

    if-eqz v0, :cond_15

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object p0

    invoke-static {p0}, Lgwi;->a(Landroid/content/Context;)Lgwi;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lgwi;->b(Z)V

    :cond_15
    return-void
.end method

.method public onResume()V
    .registers 3

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    invoke-virtual {p0}, Lltl;->w0()Z

    move-result v0

    if-eqz v0, :cond_15

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v0

    invoke-static {v0}, Lgwi;->a(Landroid/content/Context;)Lgwi;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lgwi;->b(Z)V

    :cond_15
    invoke-virtual {p0}, Lltl;->D0()V

    return-void
.end method

.method public final p0(Landroid/view/View;Landroid/view/View;)V
    .registers 6

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    const v0, 0x7f0a010b

    invoke-static {p1, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    check-cast v0, Lcom/google/android/material/appbar/AppBarLayout;

    invoke-virtual {p2}, Landroid/view/View;->getId()I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_19

    invoke-virtual {p2}, Landroid/view/View;->getId()I

    move-result v1

    goto :goto_1c

    :cond_19
    const v1, 0x7f0a0269

    :goto_1c
    invoke-static {v0, v1}, Lltl;->o0(Lcom/google/android/material/appbar/AppBarLayout;I)V

    invoke-virtual {p0, p1, v1, v0}, Lltl;->q0(Landroid/view/View;ILcom/google/android/material/appbar/AppBarLayout;)V

    instance-of v0, p2, Lnij;

    if-eqz v0, :cond_43

    check-cast p2, Lnij;

    const v0, 0x7f0a023d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/appbar/CollapsingToolbarLayout;

    if-eqz p1, :cond_3a

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    goto :goto_3b

    :cond_3a
    const/4 v0, -0x2

    :goto_3b
    new-instance v1, Lg00;

    invoke-direct {v1, p0, v0, p1}, Lg00;-><init>(Lltl;ILcom/google/android/material/appbar/CollapsingToolbarLayout;)V

    invoke-interface {p2, v1}, Lnij;->a(Lg00;)V

    :cond_43
    return-void
.end method

.method public final q0(Landroid/view/View;ILcom/google/android/material/appbar/AppBarLayout;)V
    .registers 6

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    instance-of p2, p1, Landroidx/core/widget/NestedScrollView;

    const/16 v0, 0xf

    if-eqz p2, :cond_19

    new-instance p2, Lqe6;

    check-cast p1, Landroidx/core/widget/NestedScrollView;

    new-instance v1, Lf1p;

    invoke-direct {v1, p1, p3}, Lf1p;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {p2, v1, v0}, Lqe6;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Lltl;->j:Lqe6;

    return-void

    :cond_19
    instance-of p2, p1, Landroid/widget/ScrollView;

    if-eqz p2, :cond_2c

    new-instance p2, Lqe6;

    check-cast p1, Landroid/widget/ScrollView;

    new-instance p3, Ld06;

    invoke-direct {p3, p1}, Ld06;-><init>(Ljava/lang/Object;)V

    invoke-direct {p2, p3, v0}, Lqe6;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Lltl;->j:Lqe6;

    return-void

    :cond_2c
    instance-of p2, p1, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz p2, :cond_39

    new-instance p2, Lqe6;

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    invoke-direct {p2, p1}, Lqe6;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V

    iput-object p2, p0, Lltl;->j:Lqe6;

    :cond_39
    return-void
.end method

.method public r0(I)Landroid/view/MenuItem;
    .registers 2

    iget-object p0, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->o()Litd;

    move-result-object p0

    invoke-virtual {p0, p1}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p0

    return-object p0
.end method

.method public s0()I
    .registers 1

    instance-of p0, p0, Lcom/opera/android/uninstall/UninstallSurveyFragment;

    if-eqz p0, :cond_8

    const p0, 0x7f14044d

    return p0

    :cond_8
    const p0, 0x7f14129d

    return p0
.end method

.method public t0(Landroid/content/Context;)I
    .registers 3

    instance-of p0, p0, Lcom/opera/android/uninstall/UninstallSurveyFragment;

    if-eqz p0, :cond_8

    const p0, 0x7f080522

    return p0

    :cond_8
    const p0, 0x7f040003

    const v0, 0x7f0804f2

    invoke-static {p0, p1, v0}, Lf03;->E(ILandroid/content/Context;I)I

    move-result p0

    return p0
.end method

.method public u0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 3

    return-void
.end method

.method public v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 4

    new-instance v0, Lftl;

    invoke-direct {v0, p0, p1, p2}, Lftl;-><init>(Lltl;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V

    iget-object p0, p0, Lltl;->i:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->forEach(Ljava/util/function/Consumer;)V

    return-void
.end method

.method public w0()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public x0(Litd;)V
    .registers 2

    return-void
.end method

.method public y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V
    .registers 3

    return-void
.end method

.method public z0()V
    .registers 3

    iget-object v0, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/opera/android/StatusBarDrawingFrameLayout;->d(Z)V

    iget-object p0, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    new-instance v0, Llje;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Llje;-><init>(Lcom/opera/android/StatusBarDrawingFrameLayout;B)V

    invoke-static {p0, v0}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    return-void
.end method
