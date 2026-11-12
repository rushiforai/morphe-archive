.class public final Ly53;
.super Llim;
.source "SourceFile"

# interfaces
.implements Lhpf;


# instance fields
.field public final a:Li7d;

.field public final b:Lh73;

.field public final c:Lor2;

.field public final d:Lcom/opera/android/custom_views/FadingNestedScrollView;

.field public final e:Lqm9;

.field public final f:Ltcc;

.field public final g:Landroid/content/Context;

.field public final h:Ld7h;

.field public final i:Ld37;

.field public final j:Lxol;

.field public final k:Lzol;

.field public final l:Lpde;

.field public final m:Lr7d;

.field public n:Livg;

.field public o:Z

.field public final p:Lru9;

.field public final q:Lx53;


# direct methods
.method public constructor <init>(Li7d;Lh73;Lor2;Lcom/opera/android/custom_views/FadingNestedScrollView;Ltcc;Lx79;)V
    .registers 16

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lx53;

    invoke-direct {v0, p0}, Lx53;-><init>(Ly53;)V

    iput-object v0, p0, Ly53;->q:Lx53;

    iput-object p1, p0, Ly53;->a:Li7d;

    iput-object p2, p0, Ly53;->b:Lh73;

    iput-object p3, p0, Ly53;->c:Lor2;

    iput-object p4, p0, Ly53;->d:Lcom/opera/android/custom_views/FadingNestedScrollView;

    new-instance p1, Lqm9;

    invoke-direct {p1, p4}, Lqm9;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Ly53;->e:Lqm9;

    invoke-static {p4}, Lxug;->k(Landroid/view/View;)Latj;

    move-result-object p1

    if-nez p1, :cond_2a

    new-instance p1, Latj;

    invoke-direct {p1, p4}, Latj;-><init>(Landroid/view/View;)V

    const v1, 0x7f0a0a8f

    invoke-virtual {p4, v1, p1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    :cond_2a
    iput-object p5, p0, Ly53;->f:Ltcc;

    iget-object p1, p3, Lor2;->c:Landroid/view/View;

    check-cast p1, Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Ly53;->g:Landroid/content/Context;

    new-instance p3, Ld7h;

    iget-object p4, p2, Lh73;->n:Lf84;

    const/16 v1, 0xb

    invoke-direct {p3, p1, p4, v1}, Ld7h;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p3, p0, Ly53;->h:Ld7h;

    new-instance p3, Lpde;

    iget-boolean p4, p2, Lh73;->h:Z

    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p4

    invoke-direct {p3, p4}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p3, p0, Ly53;->l:Lpde;

    new-instance p4, Ld37;

    invoke-static {p1}, Lmom;->a(Landroid/content/Context;)Lgom;

    move-result-object v1

    iget-object v1, v1, Lgom;->a:Llom;

    iget-object v2, p2, Lh73;->r:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lyk6;

    iget-object v2, v2, Lyk6;->n:Lkze;

    iget-boolean v3, p2, Lh73;->i:Z

    iget-boolean v4, p2, Lh73;->x:Z

    iget-object v5, p2, Lh73;->u:Lji;

    invoke-virtual {v5}, Lji;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lekc;

    iget-object v6, p2, Lh73;->v:Lj4c;

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lekc;

    invoke-direct {p4}, Ljava/lang/Object;-><init>()V

    iput-object v1, p4, Ld37;->c:Ljava/lang/Object;

    iput-object v2, p4, Ld37;->d:Ljava/lang/Object;

    iput-object p3, p4, Ld37;->e:Ljava/lang/Object;

    iput-boolean v3, p4, Ld37;->a:Z

    iput-boolean v4, p4, Ld37;->b:Z

    iput-object v5, p4, Ld37;->f:Ljava/lang/Object;

    iput-object v6, p4, Ld37;->g:Ljava/lang/Object;

    new-instance v1, Lh42;

    invoke-virtual {p4}, Ld37;->B()Lehc;

    move-result-object v3

    invoke-direct {v1, v3}, Lh42;-><init>(Ljava/lang/Object;)V

    new-instance v3, Lyol;

    const/4 v4, 0x0

    invoke-direct {v3, p4, v4}, Lyol;-><init>(Ld37;B)V

    new-instance v7, Lt7d;

    const/16 v8, 0x18

    invoke-direct {v7, v3, v8}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v1, v2, v7}, Lh42;->s(Lekc;Lf7f;)V

    new-instance v2, Lyol;

    const/4 v3, 0x1

    invoke-direct {v2, p4, v3}, Lyol;-><init>(Ld37;B)V

    new-instance v7, Lt7d;

    invoke-direct {v7, v2, v8}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v1, p3, v7}, Lh42;->s(Lekc;Lf7f;)V

    new-instance p3, Lyol;

    const/4 v2, 0x2

    invoke-direct {p3, p4, v2}, Lyol;-><init>(Ld37;B)V

    new-instance v2, Lt7d;

    invoke-direct {v2, p3, v8}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v1, v5, v2}, Lh42;->s(Lekc;Lf7f;)V

    new-instance p3, Lyol;

    const/4 v2, 0x3

    invoke-direct {p3, p4, v2}, Lyol;-><init>(Ld37;B)V

    new-instance v2, Lt7d;

    invoke-direct {v2, p3, v8}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v1, v6, v2}, Lh42;->s(Lekc;Lf7f;)V

    iput-object v1, p4, Ld37;->h:Ljava/lang/Object;

    iput-object p4, p0, Ly53;->i:Ld37;

    new-instance p3, Lxol;

    invoke-direct {p3, p0}, Lxol;-><init>(Ly53;)V

    iput-object p3, p0, Ly53;->j:Lxol;

    new-instance p4, Lzol;

    invoke-direct {p4, p3}, Lzol;-><init>(Lxol;)V

    iput-object p4, p0, Ly53;->k:Lzol;

    iput-boolean v3, p4, Ltx7;->a:Z

    invoke-static {p1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p1

    iput-object p1, p0, Ly53;->p:Lru9;

    invoke-virtual {p1, v0}, Lru9;->a(Ln1;)V

    new-instance p3, Lp12;

    iget-object p4, p2, Lh73;->o:Ljtg;

    iget-object v0, p2, Lh73;->p:Lkze;

    iget-object v1, p2, Lh73;->q:Lkze;

    iget-object v2, p2, Lh73;->l:Lx5f;

    iget-object p2, p2, Lh73;->a:Lf7d;

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v5, Lva2;

    const/16 v6, 0xc

    invoke-direct {v5, p2, v6}, Lva2;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p3}, Ljava/lang/Object;-><init>()V

    iput-object p4, p3, Lp12;->a:Ljava/lang/Object;

    iput-object v0, p3, Lp12;->b:Ljava/lang/Object;

    iput-object v1, p3, Lp12;->c:Ljava/lang/Object;

    iput-object p6, p3, Lp12;->d:Ljava/lang/Object;

    iput-object p1, p3, Lp12;->e:Ljava/lang/Object;

    iput-object v2, p3, Lp12;->f:Ljava/lang/Object;

    iput-object v5, p3, Lp12;->g:Ljava/lang/Object;

    new-instance p1, Ltsd;

    invoke-virtual {p3}, Lp12;->n()Lp7d;

    move-result-object p2

    invoke-direct {p1, p2}, Ltsd;-><init>(Ljava/lang/Object;)V

    iput-object p1, p3, Lp12;->h:Ljava/lang/Object;

    new-instance p2, Ls7d;

    invoke-direct {p2, p3, v4}, Ls7d;-><init>(Lp12;B)V

    new-instance p4, Lt7d;

    invoke-direct {p4, p2, v4}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p1, v0, p4}, Ltsd;->s(Lekc;Lf7f;)V

    new-instance p2, Ls7d;

    invoke-direct {p2, p3, v3}, Ls7d;-><init>(Lp12;B)V

    new-instance p4, Lt7d;

    invoke-direct {p4, p2, v4}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p1, v1, p4}, Ltsd;->s(Lekc;Lf7f;)V

    new-instance p1, Lr7d;

    new-instance p2, Lt02;

    const/16 p4, 0x14

    invoke-direct {p2, p0, p4}, Lt02;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1, p2, p3}, Lr7d;-><init>(Lt02;Lp12;)V

    iput-object p1, p0, Ly53;->m:Lr7d;

    invoke-virtual {p5, p1}, Ltcc;->a(Lmdc;)V

    return-void
.end method

.method public static R(Landroid/view/View;Ljava/lang/Runnable;)V
    .registers 4

    new-instance v0, Ls53;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Ls53;-><init>(Ljava/lang/Runnable;B)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public final I(Lfpf;)V
    .registers 2

    invoke-virtual {p0}, Ly53;->V()V

    return-void
.end method

.method public final S(Lwol;)Lp1f;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    iget-object p0, p0, Ly53;->b:Lh73;

    if-eqz p1, :cond_3b

    const/4 v0, 0x1

    if-eq p1, v0, :cond_3b

    const/4 v1, 0x4

    if-eq p1, v1, :cond_32

    const/4 v2, 0x7

    if-eq p1, v2, :cond_2b

    const/16 v0, 0x9

    if-eq p1, v0, :cond_24

    const/16 v0, 0xa

    if-eq p1, v0, :cond_1b

    const/4 p0, 0x0

    return-object p0

    :cond_1b
    iget-object p0, p0, Lh73;->g:Lv1f;

    const/16 p1, 0x10

    invoke-virtual {p0, p1}, Lv1f;->a(I)Lp1f;

    move-result-object p0

    return-object p0

    :cond_24
    iget-object p0, p0, Lh73;->g:Lv1f;

    invoke-virtual {p0, v1}, Lv1f;->a(I)Lp1f;

    move-result-object p0

    return-object p0

    :cond_2b
    iget-object p0, p0, Lh73;->g:Lv1f;

    invoke-virtual {p0, v0}, Lv1f;->a(I)Lp1f;

    move-result-object p0

    return-object p0

    :cond_32
    iget-object p0, p0, Lh73;->g:Lv1f;

    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Lv1f;->a(I)Lp1f;

    move-result-object p0

    return-object p0

    :cond_3b
    iget-object p0, p0, Lh73;->g:Lv1f;

    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Lv1f;->a(I)Lp1f;

    move-result-object p0

    return-object p0
.end method

.method public final T(Lmh0;)V
    .registers 2

    iget-object p0, p0, Ly53;->b:Lh73;

    iget-object p0, p0, Lh73;->l:Lx5f;

    invoke-virtual {p0, p1}, Lx5f;->c0(Lmh0;)V

    return-void
.end method

.method public final U(Lcom/opera/android/widget/MenuSettingsListItem;I)V
    .registers 5

    iget-object p0, p0, Ly53;->g:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const v1, 0x7f12005c

    invoke-virtual {p0, v1, p2, v0}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    iget-object p1, p1, Lcom/opera/android/widget/MenuSettingsListItem;->b:Lor2;

    iget-object p1, p1, Lor2;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final V()V
    .registers 5

    iget-object v0, p0, Ly53;->c:Lor2;

    iget-object v0, v0, Lor2;->d:Ljava/lang/Object;

    check-cast v0, Lrf2;

    iget-object v0, v0, Lrf2;->b:Ljava/lang/Object;

    check-cast v0, Lg7d;

    iget-object v0, v0, Lg7d;->c:Lcom/opera/android/custom_views/CircleImageView;

    iget-object v1, p0, Ly53;->b:Lh73;

    iget-object v1, v1, Lh73;->m:Lxb;

    iget-object v1, v1, Lxb;->e:Ljze;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ldpf;

    new-instance v2, Liu2;

    const/4 v3, 0x3

    invoke-direct {v2, v0, v3}, Liu2;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Ly53;->h:Ld7h;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lwzg;

    invoke-direct {v0, p0, v2}, Lwzg;-><init>(Ld7h;Liu2;)V

    invoke-virtual {v1, v0}, Ldpf;->a(Lhpf;)V

    return-void
.end method

.method public final W(Lndc;)V
    .registers 21

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Ly53;->c:Lor2;

    iget-object v3, v2, Lor2;->d:Ljava/lang/Object;

    check-cast v3, Lrf2;

    iget-object v3, v3, Lrf2;->i:Ljava/lang/Object;

    check-cast v3, Landroidx/cardview/widget/CardView;

    new-instance v4, Lv53;

    const/4 v5, 0x0

    invoke-direct {v4, v0, v5}, Lv53;-><init>(Ly53;B)V

    invoke-static {v3, v4}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {v4, v3}, Lv53;->a(Landroid/view/View;)V

    iget-object v3, v2, Lor2;->d:Ljava/lang/Object;

    check-cast v3, Lrf2;

    iget-object v4, v3, Lrf2;->c:Landroid/view/View;

    check-cast v4, Lcom/opera/android/custom_views/StylingImageButton;

    iget-object v6, v0, Ly53;->g:Landroid/content/Context;

    const v7, 0x7f1401b7

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v8

    const v9, 0x7f1406e2

    invoke-virtual {v6, v9, v8}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v9, v7}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/view/View;->setTooltipText(Ljava/lang/CharSequence;)V

    iget-object v6, v3, Lrf2;->b:Ljava/lang/Object;

    check-cast v6, Lg7d;

    iget-object v7, v6, Lg7d;->b:Landroid/widget/FrameLayout;

    invoke-virtual {v7, v5}, Landroid/view/View;->setClickable(Z)V

    iget-object v6, v6, Lg7d;->c:Lcom/opera/android/custom_views/CircleImageView;

    new-instance v7, Lv53;

    const/4 v8, 0x1

    invoke-direct {v7, v0, v8}, Lv53;-><init>(Ly53;B)V

    invoke-static {v6, v7}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {v7, v6}, Lv53;->a(Landroid/view/View;)V

    iget-object v6, v3, Lrf2;->i:Ljava/lang/Object;

    check-cast v6, Landroidx/cardview/widget/CardView;

    new-instance v7, Lw53;

    invoke-direct {v7, v0, v5}, Lw53;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v6, v7}, Landroid/view/View;->setOnHoverListener(Landroid/view/View$OnHoverListener;)V

    iget-object v7, v3, Lrf2;->k:Landroid/view/View;

    check-cast v7, Lcom/opera/android/ui/catalog/widget/OperaChip;

    new-instance v9, Lr53;

    invoke-direct {v9, v0, v5}, Lr53;-><init>(Ly53;B)V

    invoke-static {v7, v9}, Ly53;->R(Landroid/view/View;Ljava/lang/Runnable;)V

    new-instance v7, Lr53;

    invoke-direct {v7, v0, v8}, Lr53;-><init>(Ly53;B)V

    invoke-static {v6, v7}, Ly53;->R(Landroid/view/View;Ljava/lang/Runnable;)V

    iget-object v6, v3, Lrf2;->h:Landroid/view/View;

    check-cast v6, Lcom/opera/android/ui/catalog/widget/OperaChip;

    new-instance v7, Lr53;

    const/4 v9, 0x2

    invoke-direct {v7, v0, v9}, Lr53;-><init>(Ly53;B)V

    invoke-static {v6, v7}, Ly53;->R(Landroid/view/View;Ljava/lang/Runnable;)V

    iget-object v3, v3, Lrf2;->g:Landroid/view/View;

    check-cast v3, Lcom/opera/android/custom_views/StylingImageButton;

    new-instance v6, Lr53;

    const/4 v7, 0x3

    invoke-direct {v6, v0, v7}, Lr53;-><init>(Ly53;B)V

    invoke-static {v3, v6}, Ly53;->R(Landroid/view/View;Ljava/lang/Runnable;)V

    new-instance v3, Lr53;

    const/4 v6, 0x4

    invoke-direct {v3, v0, v6}, Lr53;-><init>(Ly53;B)V

    invoke-static {v4, v3}, Ly53;->R(Landroid/view/View;Ljava/lang/Runnable;)V

    iget-object v3, v2, Lor2;->b:Ljava/lang/Object;

    check-cast v3, Lor2;

    iget-object v4, v3, Lor2;->b:Ljava/lang/Object;

    move-object v13, v4

    check-cast v13, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;

    new-instance v4, Lr53;

    const/4 v10, 0x5

    invoke-direct {v4, v0, v10}, Lr53;-><init>(Ly53;B)V

    new-instance v10, Lzt;

    invoke-direct {v10, v4, v7}, Lzt;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v13, v10}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    iget-object v4, v3, Lor2;->e:Ljava/lang/Object;

    move-object v14, v4

    check-cast v14, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;

    new-instance v4, Lr53;

    const/4 v10, 0x6

    invoke-direct {v4, v0, v10}, Lr53;-><init>(Ly53;B)V

    new-instance v10, Lzt;

    invoke-direct {v10, v4, v7}, Lzt;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v14, v10}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    iget-object v4, v3, Lor2;->d:Ljava/lang/Object;

    move-object v15, v4

    check-cast v15, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;

    new-instance v4, Lr53;

    const/4 v10, 0x7

    invoke-direct {v4, v0, v10}, Lr53;-><init>(Ly53;B)V

    new-instance v10, Lzt;

    invoke-direct {v10, v4, v7}, Lzt;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v15, v10}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    iget-object v4, v3, Lor2;->f:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;

    new-instance v10, Lr53;

    const/16 v11, 0x8

    invoke-direct {v10, v0, v11}, Lr53;-><init>(Ly53;B)V

    new-instance v11, Lzt;

    invoke-direct {v11, v10, v7}, Lzt;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, v11}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    new-instance v10, Lr53;

    const/16 v11, 0x9

    invoke-direct {v10, v0, v11}, Lr53;-><init>(Ly53;B)V

    const-wide/16 v11, 0x708

    invoke-static {v10, v11, v12}, Lvml;->d(Ljava/lang/Runnable;J)V

    new-instance v10, Lwrl;

    iget-object v11, v0, Ly53;->d:Lcom/opera/android/custom_views/FadingNestedScrollView;

    iget-object v12, v0, Ly53;->e:Lqm9;

    move-object/from16 v17, v11

    iget-object v11, v0, Ly53;->g:Landroid/content/Context;

    move-object/from16 v18, v12

    iget-object v12, v0, Ly53;->b:Lh73;

    move-object/from16 v16, v4

    invoke-direct/range {v10 .. v18}, Lwrl;-><init>(Landroid/content/Context;Lh73;Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;Lcom/opera/android/custom_views/FadingNestedScrollView;Lqm9;)V

    iget-object v12, v0, Ly53;->f:Ltcc;

    invoke-virtual {v12, v10}, Ltcc;->a(Lmdc;)V

    iget-object v3, v3, Lor2;->c:Landroid/view/View;

    check-cast v3, Landroid/widget/LinearLayout;

    invoke-static {v3}, Lor2;->c(Landroid/view/View;)Lor2;

    move-result-object v3

    iget-object v4, v3, Lor2;->b:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;

    iget-object v4, v4, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;->a:Lvs;

    iget-object v4, v4, Lvs;->c:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/mainmenu/ToggleAnimationView;

    const v10, 0x7f0402cf

    const v11, 0x7f0402d0

    const v13, 0x7f040315

    invoke-virtual {v4, v13, v10, v11}, Lcom/opera/android/mainmenu/ToggleAnimationView;->A(III)V

    iget-object v4, v3, Lor2;->e:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;

    iget-object v4, v4, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;->a:Lvs;

    iget-object v4, v4, Lvs;->c:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/mainmenu/ToggleAnimationView;

    const v10, 0x7f040217

    const v11, 0x7f0402ae

    invoke-virtual {v4, v10, v11, v11}, Lcom/opera/android/mainmenu/ToggleAnimationView;->A(III)V

    iget-object v4, v3, Lor2;->d:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;

    iget-object v4, v4, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;->a:Lvs;

    iget-object v4, v4, Lvs;->c:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/mainmenu/ToggleAnimationView;

    const v10, 0x7f040204

    const v11, 0x7f0402a9

    invoke-virtual {v4, v10, v11, v11}, Lcom/opera/android/mainmenu/ToggleAnimationView;->A(III)V

    iget-object v3, v3, Lor2;->f:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;

    iget-object v3, v3, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;->a:Lvs;

    iget-object v3, v3, Lvs;->c:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/mainmenu/ToggleAnimationView;

    const v4, 0x7f04029c

    const v10, 0x7f0402b6

    invoke-virtual {v3, v4, v10, v10}, Lcom/opera/android/mainmenu/ToggleAnimationView;->A(III)V

    iget-object v3, v2, Lor2;->f:Ljava/lang/Object;

    check-cast v3, Lkf;

    iget-object v3, v3, Lkf;->c:Ljava/lang/Object;

    check-cast v3, Landroidx/recyclerview/widget/RecyclerView;

    new-instance v4, Landroidx/recyclerview/widget/GridLayoutManager;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    invoke-direct {v4, v9}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(I)V

    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v9

    iget v9, v9, Landroid/content/res/Configuration;->screenWidthDp:I

    const/16 v10, 0x168

    if-ge v9, v10, :cond_18d

    move v9, v8

    goto :goto_18e

    :cond_18d
    move v9, v5

    :goto_18e
    iget-object v10, v0, Ly53;->k:Lzol;

    iget-boolean v11, v10, Lzol;->f:Z

    if-eq v9, v11, :cond_196

    iput-boolean v9, v10, Lzol;->f:Z

    :cond_196
    iput-object v10, v4, Landroidx/recyclerview/widget/GridLayoutManager;->g:Ltx7;

    invoke-virtual {v3, v4}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    const/4 v15, 0x0

    invoke-virtual {v3, v15}, Landroidx/recyclerview/widget/RecyclerView;->B0(Landroidx/recyclerview/widget/e;)V

    iget-object v4, v0, Ly53;->j:Lxol;

    invoke-virtual {v3, v4}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f0705a5

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v9

    new-instance v10, Lou1;

    invoke-direct {v10, v6, v9}, Lou1;-><init>(BI)V

    invoke-virtual {v3, v10}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    iget-object v3, v2, Lor2;->e:Ljava/lang/Object;

    check-cast v3, Lei;

    iget-object v6, v3, Lei;->e:Landroid/view/View;

    check-cast v6, Lcom/opera/android/widget/MenuSettingsListItem;

    new-instance v9, Lr53;

    const/16 v10, 0xa

    invoke-direct {v9, v0, v10}, Lr53;-><init>(Ly53;B)V

    invoke-static {v6, v9}, Ly53;->R(Landroid/view/View;Ljava/lang/Runnable;)V

    iget-object v6, v3, Lei;->f:Ljava/lang/Object;

    check-cast v6, Lcom/opera/android/widget/MenuSettingsListItem;

    new-instance v9, Lr53;

    const/16 v10, 0xb

    invoke-direct {v9, v0, v10}, Lr53;-><init>(Ly53;B)V

    invoke-static {v6, v9}, Ly53;->R(Landroid/view/View;Ljava/lang/Runnable;)V

    iget-object v6, v3, Lei;->g:Landroid/view/View;

    check-cast v6, Lcom/opera/android/widget/MenuSettingsListItem;

    new-instance v9, Lr53;

    const/16 v11, 0xc

    invoke-direct {v9, v0, v11}, Lr53;-><init>(Ly53;B)V

    invoke-static {v6, v9}, Ly53;->R(Landroid/view/View;Ljava/lang/Runnable;)V

    iget-object v6, v3, Lei;->h:Landroid/view/View;

    check-cast v6, Lcom/opera/android/widget/MenuSettingsListItem;

    new-instance v9, Lr53;

    const/16 v13, 0xd

    invoke-direct {v9, v0, v13}, Lr53;-><init>(Ly53;B)V

    invoke-static {v6, v9}, Ly53;->R(Landroid/view/View;Ljava/lang/Runnable;)V

    iget-object v3, v3, Lei;->i:Landroid/view/View;

    check-cast v3, Lcom/opera/android/widget/MenuSettingsListItem;

    new-instance v6, Lr53;

    const/16 v9, 0xe

    invoke-direct {v6, v0, v9}, Lr53;-><init>(Ly53;B)V

    invoke-static {v3, v6}, Ly53;->R(Landroid/view/View;Ljava/lang/Runnable;)V

    new-instance v3, Lr53;

    const/16 v6, 0xf

    invoke-direct {v3, v0, v6}, Lr53;-><init>(Ly53;B)V

    iget-object v6, v0, Ly53;->b:Lh73;

    iget-object v9, v6, Lh73;->c:Lrs2;

    new-instance v13, Lt53;

    invoke-direct {v13, v3, v5}, Lt53;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v14, Lqs2;

    invoke-direct {v14, v9, v13}, Lqs2;-><init>(Lrs2;Lt53;)V

    invoke-virtual {v12, v14}, Ltcc;->a(Lmdc;)V

    iget-object v9, v9, Lrs2;->a:Li7f;

    invoke-virtual {v9, v13}, Li7f;->b(Ljava/lang/Object;)Z

    invoke-virtual {v3}, Lr53;->run()V

    iget-object v3, v6, Lh73;->m:Lxb;

    iget-object v3, v3, Lxb;->e:Ljze;

    new-instance v9, Livg;

    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v13, Lvx;

    invoke-direct {v13, v3, v10}, Lvx;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v9, v13, v2}, Livg;-><init>(Lvx;Lor2;)V

    iput-object v9, v0, Ly53;->n:Livg;

    new-instance v2, Lu53;

    invoke-direct {v2, v0, v5}, Lu53;-><init>(Ly53;B)V

    invoke-virtual {v3, v1, v2}, Lekc;->j(Lndc;Lf7f;)V

    new-instance v2, Lklk;

    iget-object v3, v6, Lh73;->e:Lydn;

    invoke-direct {v2, v3}, Lklk;-><init>(Lydn;)V

    new-instance v3, Lu53;

    invoke-direct {v3, v0, v8}, Lu53;-><init>(Ly53;B)V

    invoke-virtual {v2, v1, v3}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v2, v0, Ly53;->i:Ld37;

    iget-object v2, v2, Ld37;->h:Ljava/lang/Object;

    check-cast v2, Lh42;

    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v3, Lk9;

    invoke-direct {v3, v4, v11}, Lk9;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v1, v3}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v13, v6, Lh73;->z:Lplh;

    iget-object v0, v0, Ly53;->a:Li7d;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v14, Lq53;

    invoke-direct {v14, v0, v5}, Lq53;-><init>(Li7d;B)V

    invoke-static {v12}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v0

    new-instance v11, Lmz9;

    const/16 v16, 0xb

    invoke-direct/range {v11 .. v16}, Lmz9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v0, v15, v15, v11, v7}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void
.end method

.method public final h(Lcpf;)V
    .registers 2

    invoke-virtual {p0}, Ly53;->V()V

    return-void
.end method

.method public final n(Lepf;)V
    .registers 2

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 3

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Ly53;->o:Z

    iget-object p1, p0, Ly53;->p:Lru9;

    iget-object v0, p0, Ly53;->q:Lx53;

    invoke-virtual {p1, v0}, Lru9;->d(Ln1;)V

    iget-object p1, p0, Ly53;->f:Ltcc;

    iget-object p0, p0, Ly53;->m:Lr7d;

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    return-void
.end method

.method public final onStart(Lndc;)V
    .registers 2

    iget-object p0, p0, Ly53;->b:Lh73;

    iget-object p0, p0, Lh73;->g:Lv1f;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lv1f;->c(I)V

    return-void
.end method

.method public final r(Lgpf;)V
    .registers 2

    invoke-virtual {p0}, Ly53;->V()V

    return-void
.end method
