.class public final Lz3m;
.super Lo73;
.source "SourceFile"


# instance fields
.field public final j:Landroid/content/Context;

.field public final k:Lcrk;

.field public final l:Ljjg;

.field public final m:Lf0c;

.field public final n:Lk4m;

.field public o:Lcom/opera/api/Callback;

.field public p:Lszb;

.field public q:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcrk;Ljjg;Lf0c;Lk4m;)V
    .registers 6

    invoke-direct {p0}, Lo73;-><init>()V

    iput-object p1, p0, Lz3m;->j:Landroid/content/Context;

    iput-object p2, p0, Lz3m;->k:Lcrk;

    iput-object p3, p0, Lz3m;->l:Ljjg;

    iput-object p4, p0, Lz3m;->m:Lf0c;

    iput-object p5, p0, Lz3m;->n:Lk4m;

    return-void
.end method


# virtual methods
.method public final m(Lr9i;Landroid/view/View;)V
    .registers 15

    iget-object v0, p0, Lz3m;->j:Landroid/content/Context;

    invoke-static {v0}, Lv3m;->c(Landroid/content/Context;)Ljava/util/Set;

    move-result-object v1

    new-instance v2, Lqw8;

    const/4 v3, 0x5

    invoke-direct {v2, p0, v3}, Lqw8;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1, v2}, Lsfe;->M0(Ljava/lang/Iterable;Lxq9;)Lzlb;

    move-result-object v1

    invoke-static {v1}, Lnb6;->J(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v1

    new-instance v2, Lomj;

    const/16 v4, 0xf

    invoke-direct {v2, v4}, Lomj;-><init>(B)V

    invoke-static {v1, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    new-instance v2, Lf15;

    const/4 v4, 0x6

    invoke-direct {v2, p0, v4}, Lf15;-><init>(Ljava/lang/Object;B)V

    new-instance v4, Lzlb;

    const/4 v5, 0x0

    invoke-direct {v4, v1, v2, v5}, Lzlb;-><init>(Ljava/lang/Iterable;Ljava/lang/Object;B)V

    invoke-static {v4}, Lnb6;->J(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v2

    iget-object v4, p1, Lr9i;->d:Ljava/lang/Object;

    check-cast v4, Lo66;

    const/16 v6, 0x11

    iput v6, v4, Lo66;->m:I

    const/high16 v4, 0x43600000    # 224.0f

    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-static {v4, p2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p2

    iget-object v4, p1, Lr9i;->d:Ljava/lang/Object;

    check-cast v4, Lo66;

    iput p2, v4, Lo66;->v:I

    iget-object p1, p1, Lr9i;->c:Ljava/lang/Object;

    check-cast p1, Lm66;

    iget-boolean p2, p0, Lz3m;->q:Z

    const v4, 0x7f0d010e

    const-string v6, ""

    if-eqz p2, :cond_87

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result p2

    move v7, v5

    :goto_58
    if-ge v7, p2, :cond_7d

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v7, v7, 0x1

    check-cast v8, Ly3m;

    invoke-virtual {p1, v5, v5, v5, v6}, Litd;->a(IIILjava/lang/CharSequence;)Lptd;

    move-result-object v9

    iget-object v10, p0, Lz3m;->k:Lcrk;

    iget-object v11, v8, Ly3m;->a:Lszb;

    invoke-virtual {v10, v11}, Lcrk;->test(Ljava/lang/Object;)Z

    move-result v10

    invoke-virtual {p0, v8, v10}, Lz3m;->q(Ly3m;Z)Landroid/widget/LinearLayout;

    move-result-object v10

    invoke-virtual {v9, v10}, Lptd;->d(Landroid/view/View;)Lmsk;

    new-instance v10, Lw3m;

    invoke-direct {v10, p0, v8, v5}, Lw3m;-><init>(Lz3m;Ly3m;B)V

    iput-object v10, v9, Lptd;->p:Landroid/view/MenuItem$OnMenuItemClickListener;

    goto :goto_58

    :cond_7d
    invoke-virtual {p1, v5, v5, v5, v6}, Litd;->a(IIILjava/lang/CharSequence;)Lptd;

    move-result-object p2

    invoke-virtual {p2, v5}, Lptd;->setEnabled(Z)Landroid/view/MenuItem;

    invoke-virtual {p2, v4}, Lptd;->setActionView(I)Landroid/view/MenuItem;

    :cond_87
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p2

    move v2, v5

    :goto_8c
    if-ge v2, p2, :cond_bb

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v2, v2, 0x1

    check-cast v7, Ly3m;

    invoke-virtual {p1, v5, v5, v5, v6}, Litd;->a(IIILjava/lang/CharSequence;)Lptd;

    move-result-object v8

    iget-boolean v9, p0, Lz3m;->q:Z

    const/4 v10, 0x1

    if-nez v9, :cond_ab

    iget-object v9, v7, Ly3m;->a:Lszb;

    iget-object v11, p0, Lz3m;->p:Lszb;

    invoke-virtual {v9, v11}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_ab

    move v9, v10

    goto :goto_ac

    :cond_ab
    move v9, v5

    :goto_ac
    invoke-virtual {p0, v7, v9}, Lz3m;->q(Ly3m;Z)Landroid/widget/LinearLayout;

    move-result-object v9

    invoke-virtual {v8, v9}, Lptd;->d(Landroid/view/View;)Lmsk;

    new-instance v9, Lw3m;

    invoke-direct {v9, p0, v7, v10}, Lw3m;-><init>(Lz3m;Ly3m;B)V

    iput-object v9, v8, Lptd;->p:Landroid/view/MenuItem$OnMenuItemClickListener;

    goto :goto_8c

    :cond_bb
    iget-boolean p2, p0, Lz3m;->q:Z

    if-nez p2, :cond_131

    iget-object p2, p0, Lz3m;->p:Lszb;

    if-nez p2, :cond_131

    invoke-virtual {p1, v5, v5, v5, v6}, Litd;->a(IIILjava/lang/CharSequence;)Lptd;

    move-result-object p2

    invoke-virtual {p2, v5}, Lptd;->setEnabled(Z)Landroid/view/MenuItem;

    invoke-virtual {p2, v4}, Lptd;->setActionView(I)Landroid/view/MenuItem;

    invoke-virtual {p1, v5, v5, v5, v6}, Litd;->a(IIILjava/lang/CharSequence;)Lptd;

    move-result-object p1

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const/4 v0, 0x0

    const v1, 0x7f0d028f

    invoke-virtual {p2, v1, v0, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    const v0, 0x7f0a06c5

    invoke-static {v0, p2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    if-eqz v1, :cond_120

    check-cast p2, Landroid/widget/LinearLayout;

    invoke-static {v1}, Lphj;->Z(Landroid/widget/TextView;)V

    new-instance v0, Lx3m;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Lagc;-><init>(Landroid/content/Context;)V

    new-instance v2, Lowj;

    const-string v4, "<link>"

    const-string v5, "</link>"

    invoke-direct {v2, v4, v5, v0}, Lowj;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/text/style/CharacterStyle;)V

    const v0, 0x7f141341

    iget-object v4, p0, Lz3m;->m:Lf0c;

    iget-object v4, v4, Lf0c;->a:Lv3m;

    invoke-virtual {v4, v0}, Lv3m;->a(I)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v2}, [Lowj;

    move-result-object v2

    invoke-static {v0, v2}, Ln1h;->d(Ljava/lang/String;[Lowj;)Landroid/text/SpannableString;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p1, p2}, Lptd;->d(Landroid/view/View;)Lmsk;

    new-instance p2, Laxe;

    invoke-direct {p2, p0, v3}, Laxe;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p1, Lptd;->p:Landroid/view/MenuItem$OnMenuItemClickListener;

    return-void

    :cond_120
    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :cond_131
    return-void
.end method

.method public final n(Lr9i;)V
    .registers 3

    iget-boolean v0, p0, Lz3m;->q:Z

    if-nez v0, :cond_24

    iget-object p0, p0, Lz3m;->p:Lszb;

    if-nez p0, :cond_24

    iget-object p0, p1, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Lo66;

    iget-object p0, p0, Lo66;->f:Ll56;

    if-nez p0, :cond_12

    const/4 p0, 0x0

    goto :goto_14

    :cond_12
    iget-object p0, p0, Landroidx/appcompat/widget/ListPopupWindow;->c:Lim7;

    :goto_14
    if-nez p0, :cond_17

    return-void

    :cond_17
    invoke-virtual {p0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p1

    invoke-interface {p1}, Landroid/widget/Adapter;->getCount()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    invoke-virtual {p0, p1}, Landroid/widget/ListView;->setSelection(I)V

    :cond_24
    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 2

    const/4 p0, 0x1

    return p0
.end method

.method public final q(Ly3m;Z)Landroid/widget/LinearLayout;
    .registers 6

    iget-object p0, p0, Lz3m;->j:Landroid/content/Context;

    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p0

    const v0, 0x7f0d0290

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Lov0;->e(Landroid/view/View;)Lov0;

    move-result-object p0

    iget-object v0, p0, Lov0;->d:Ljava/lang/Object;

    check-cast v0, Landroid/widget/TextView;

    iget-object p1, p1, Ly3m;->b:Ljava/lang/String;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lov0;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageView;

    if-nez p2, :cond_23

    const/4 v2, 0x4

    :cond_23
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Lov0;->b:Landroid/view/View;

    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0
.end method
