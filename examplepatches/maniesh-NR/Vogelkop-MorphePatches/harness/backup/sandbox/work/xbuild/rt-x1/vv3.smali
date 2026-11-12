.class public final Lvv3;
.super Lnz0;
.source "SourceFile"


# instance fields
.field public final a:Lx5f;

.field public final b:Z

.field public final c:Lgjm;

.field public d:Lvb0;

.field public e:Landroid/view/View;

.field public f:Z

.field public g:Z

.field public final synthetic h:Lcom/opera/android/BrowserActivity;


# direct methods
.method public constructor <init>(ZLcom/opera/android/BrowserActivity;Lx5f;Lgjm;)V
    .registers 6

    iput-object p2, p0, Lvv3;->h:Lcom/opera/android/BrowserActivity;

    const/4 p2, 0x1

    const/4 v0, 0x0

    invoke-direct {p0, p2, v0}, Lnz0;-><init>(ZZ)V

    sget-object p2, Lvb0;->d:Lvb0;

    iput-object p2, p0, Lvv3;->d:Lvb0;

    iput-object p3, p0, Lvv3;->a:Lx5f;

    iput-boolean p1, p0, Lvv3;->b:Z

    iput-object p4, p0, Lvv3;->c:Lgjm;

    return-void
.end method


# virtual methods
.method public final b()V
    .registers 10

    iget-boolean v0, p0, Lvv3;->g:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lvv3;->d:Lvb0;

    iget-boolean v1, p0, Lvv3;->f:Z

    iget-object v2, p0, Lvv3;->a:Lx5f;

    iget-boolean v3, v2, Lx5f;->h:Z

    const/4 v4, 0x1

    if-eqz v3, :cond_54

    iget-object v3, v2, Lx5f;->d:Lzpa;

    new-instance v5, Lud0;

    const/4 v6, -0x1

    const/4 v7, 0x4

    const/16 v8, 0x98b

    invoke-direct {v5, v8, v6, v7}, Ljf0;-><init>(III)V

    const/4 v6, 0x0

    invoke-virtual {v5, v6, v4, v0}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 v0, 0x3

    invoke-virtual {v5, v0, v4, v1}, Ljf0;->r(IIZ)V

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    invoke-virtual {v0, v3}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v1

    invoke-virtual {v1, v3}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object v1

    const/16 v3, 0xd

    invoke-virtual {v1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    if-eqz v6, :cond_45

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_45

    new-instance v7, Lhf0;

    invoke-direct {v7, v1, v3, v6}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_4e

    :cond_45
    invoke-static {v1, v3, v4}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v6

    new-instance v7, Lhf0;

    invoke-direct {v7, v1, v3, v6}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_4e
    invoke-virtual {v7, v5}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v2, v0}, Lx5f;->U0(Lx56;)V

    :cond_54
    iput-boolean v4, p0, Lvv3;->g:Z

    return-void
.end method

.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f1403bf

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getPositiveButtonIcon(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 4

    const p0, 0x7f0805cc

    invoke-static {p0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    const v0, 0x7f0402b9

    const v1, 0x7f06063b

    invoke-static {v0, p1, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    invoke-static {p0, p1}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    return-object p0
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f140a2b

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getTheme()I
    .registers 1

    const p0, 0x7f150296

    return p0
.end method

.method public final onCreateDialog(Laz0;)V
    .registers 15

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0d012b

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0a0850

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lvv3;->e:Landroid/view/View;

    invoke-virtual {p1}, Laz0;->getContext()Landroid/content/Context;

    move-result-object p0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v1

    const-string v2, "exit_clear_data_categories"

    invoke-virtual {v1, v2}, Lcom/opera/android/settings/SettingsManager;->z(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lz4o;->A0(Ljava/lang/String;)Ljava/util/HashSet;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/HashSet;->isEmpty()Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_99

    const v4, 0x7f0a01eb

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    invoke-virtual {v4, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    invoke-static {}, Lz4o;->R()[Lr25;

    move-result-object v6

    array-length v7, v6

    move v8, v3

    :goto_54
    if-ge v8, v7, :cond_99

    aget-object v9, v6, v8

    iget-object v10, v9, Lr25;->a:Ljava/lang/String;

    invoke-virtual {v1, v10}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_84

    const v10, 0x7f0d012a

    invoke-virtual {v5, v10, v4, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v10

    invoke-virtual {v4, v10}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v11, 0x7f0a069d

    invoke-static {v11, v10}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/TextView;

    if-eqz v12, :cond_87

    check-cast v10, Landroid/widget/LinearLayout;

    iget-object v9, v9, Lr25;->b:Lrxh;

    invoke-virtual {v12}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    invoke-virtual {v9, v10}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v9

    invoke-virtual {v12, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_84
    add-int/lit8 v8, v8, 0x1

    goto :goto_54

    :cond_87
    invoke-virtual {v10}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v11}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_99
    const v1, 0x7f1406e1

    invoke-virtual {p1, v1}, Laz0;->b(I)V

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object p0

    iget-object p0, p0, Lsf7;->a:Lrf7;

    iget-object p0, p0, Lrf7;->c:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    move v4, v3

    :cond_ac
    if-ge v4, v1, :cond_bd

    invoke-virtual {p0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Lre7;

    invoke-virtual {v5}, Lre7;->m()Z

    move-result v5

    if-eqz v5, :cond_ac

    const/4 v3, 0x1

    :cond_bd
    if-nez v2, :cond_c9

    if-eqz v3, :cond_c5

    const p0, 0x7f1406de

    goto :goto_d2

    :cond_c5
    const p0, 0x7f1406dd

    goto :goto_d2

    :cond_c9
    if-eqz v3, :cond_cf

    const p0, 0x7f1406e0

    goto :goto_d2

    :cond_cf
    const p0, 0x7f1406df

    :goto_d2
    invoke-virtual {p1, p0}, Laz0;->a(I)V

    invoke-virtual {p1, v0}, Laz0;->setView(Landroid/view/View;)Laz0;

    return-void
.end method

.method public final onDismissDialog(Lbz0;Lhjm;)V
    .registers 3

    invoke-virtual {p0}, Lvv3;->b()V

    return-void
.end method

.method public final onNegativeButtonClicked(Lbz0;)V
    .registers 2

    sget-object p1, Lvb0;->c:Lvb0;

    iput-object p1, p0, Lvv3;->d:Lvb0;

    return-void
.end method

.method public final onShowDialog(Lbz0;)V
    .registers 5

    invoke-super {p0, p1}, Lnz0;->onShowDialog(Lbz0;)V

    iget-object v0, p0, Lvv3;->e:Landroid/view/View;

    if-eqz v0, :cond_10

    new-instance v1, Lsh8;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lsh8;-><init>(Lvv3;Lbz0;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_10
    new-instance v0, Lsh8;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lsh8;-><init>(Lvv3;Lbz0;B)V

    const/4 v1, -0x1

    invoke-virtual {p1, v1}, Lbz0;->f(I)Landroid/widget/Button;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-boolean v0, p0, Lvv3;->b:Z

    if-eqz v0, :cond_29

    invoke-virtual {p1, v1}, Lbz0;->f(I)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    :cond_29
    new-instance v0, Luk6;

    const/16 v2, 0x19

    invoke-direct {v0, p0, v2}, Luk6;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v1}, Lbz0;->f(I)Landroid/widget/Button;

    move-result-object p0

    new-instance p1, Lu7;

    const/16 v1, 0x8

    invoke-direct {p1, v0, v1}, Lu7;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0, p1}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    return-void
.end method
