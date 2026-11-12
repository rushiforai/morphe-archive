.class public final Ld35;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final a:Lc35;

.field public final b:Lc35;

.field public c:Z

.field public d:Z

.field public final e:I

.field public f:I

.field public final synthetic g:Le35;


# direct methods
.method public constructor <init>(Le35;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld35;->g:Le35;

    const-class v0, Lx25;

    invoke-virtual {p1, v0}, Le35;->I0(Ljava/lang/Class;)Lc35;

    move-result-object v0

    iput-object v0, p0, Ld35;->a:Lc35;

    const-class v1, Lo25;

    invoke-virtual {p1, v1}, Le35;->I0(Ljava/lang/Class;)Lc35;

    move-result-object v1

    iput-object v1, p0, Ld35;->b:Lc35;

    iget-boolean v2, v0, Lc35;->e:Z

    const/4 v3, 0x0

    if-nez v2, :cond_1c

    move v2, v3

    goto :goto_22

    :cond_1c
    iget-object v2, v0, Lc35;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->isChecked()Z

    move-result v2

    :goto_22
    const/4 v4, 0x1

    if-eqz v2, :cond_42

    iget-object v2, p1, Le35;->x:Ls25;

    iget-object v2, v2, Ls25;->k:Lzwk;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzwk;->e()Z

    move-result v2

    if-eqz v2, :cond_42

    iget-object v2, p1, Le35;->x:Ls25;

    iget-object v2, v2, Ls25;->k:Lzwk;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v2, 0x3

    invoke-static {v2}, Lzwk;->c(I)Z

    move-result v2

    if-eqz v2, :cond_42

    move v2, v4

    goto :goto_43

    :cond_42
    move v2, v3

    :goto_43
    iput-boolean v2, p0, Ld35;->c:Z

    iget-boolean v2, v1, Lc35;->e:Z

    if-nez v2, :cond_4b

    move v2, v3

    goto :goto_51

    :cond_4b
    iget-object v2, v1, Lc35;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->isChecked()Z

    move-result v2

    :goto_51
    if-eqz v2, :cond_6f

    iget-object v2, p1, Le35;->x:Ls25;

    iget-object v2, v2, Ls25;->k:Lzwk;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzwk;->e()Z

    move-result v2

    if-eqz v2, :cond_6f

    iget-object p1, p1, Le35;->x:Ls25;

    iget-object p1, p1, Ls25;->k:Lzwk;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4}, Lzwk;->c(I)Z

    move-result p1

    if-eqz p1, :cond_6f

    move p1, v4

    goto :goto_70

    :cond_6f
    move p1, v3

    :goto_70
    iput-boolean p1, p0, Ld35;->d:Z

    iget-boolean v2, p0, Ld35;->c:Z

    add-int/2addr v2, p1

    iput v2, p0, Ld35;->e:I

    iput v4, p0, Ld35;->f:I

    iput v3, v0, Lc35;->d:I

    iput v3, v1, Lc35;->d:I

    return-void
.end method


# virtual methods
.method public final a(I)V
    .registers 4

    iget-object p0, p0, Ld35;->g:Le35;

    iget v0, p0, Le35;->y:I

    iget-object p0, p0, Le35;->x:Ls25;

    const/4 v1, 0x1

    if-ne v0, v1, :cond_14

    iget-object p0, p0, Ls25;->a:Lcom/opera/android/BrowserActivity;

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void

    :cond_14
    iget-object p0, p0, Ls25;->c:Lpt3;

    new-instance v0, Lglj;

    const/16 v1, 0x9c4

    invoke-direct {v0, p1, v1}, Lglj;-><init>(II)V

    invoke-virtual {p0, v0}, Lpt3;->f(Lo93;)V

    return-void
.end method

.method public final run()V
    .registers 14

    const/4 v0, 0x1

    iget-object v1, p0, Ld35;->g:Le35;

    iget v2, p0, Ld35;->e:I

    if-le v2, v0, :cond_22

    iget-object v3, v1, Le35;->x:Ls25;

    iget-object v3, v3, Ls25;->a:Lcom/opera/android/BrowserActivity;

    iget v4, p0, Ld35;->f:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v4, v2}, [Ljava/lang/Object;

    move-result-object v2

    const v4, 0x7f140baf

    invoke-virtual {v3, v4, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    :goto_20
    move-object v6, v2

    goto :goto_24

    :cond_22
    const/4 v2, 0x0

    goto :goto_20

    :goto_24
    iget-boolean v2, p0, Ld35;->c:Z

    const/16 v3, 0xc

    sget-object v9, Lijm;->b:Lijm;

    const-string v10, "com.opera.android.ui.DIALOG_QUEUE_SERVICE"

    iget-object v4, p0, Ld35;->a:Lc35;

    const/4 v5, 0x0

    if-eqz v2, :cond_58

    iput-boolean v5, p0, Ld35;->c:Z

    iput v0, v4, Lc35;->d:I

    new-instance v7, Ljl4;

    invoke-direct {v7, v4, v3}, Ljl4;-><init>(Ljava/lang/Object;B)V

    new-instance v3, Lg25;

    const v4, 0x7f140fa4

    const v5, 0x7f140fa5

    move-object v8, p0

    invoke-direct/range {v3 .. v8}, Lg25;-><init>(IILjava/lang/String;Ljl4;Ld35;)V

    iget-object p0, v1, Le35;->x:Ls25;

    iget-object p0, p0, Ls25;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0, v10}, Lt5d;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lz77;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v3, v9}, Lr22;->b(Ljjm;Lijm;)V

    goto/16 :goto_24c

    :cond_58
    move-object v8, p0

    iget-boolean p0, v8, Ld35;->d:Z

    iget-object v2, v8, Ld35;->b:Lc35;

    if-eqz p0, :cond_85

    iput-boolean v5, v8, Ld35;->d:Z

    iput v0, v2, Lc35;->d:I

    new-instance v7, Ljl4;

    invoke-direct {v7, v2, v3}, Ljl4;-><init>(Ljava/lang/Object;B)V

    new-instance v3, Lg25;

    const v4, 0x7f140f9d

    const v5, 0x7f140f9e

    invoke-direct/range {v3 .. v8}, Lg25;-><init>(IILjava/lang/String;Ljl4;Ld35;)V

    iget-object p0, v1, Le35;->x:Ls25;

    iget-object p0, p0, Ls25;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0, v10}, Lt5d;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lz77;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v3, v9}, Lr22;->b(Ljjm;Lijm;)V

    goto/16 :goto_24c

    :cond_85
    iget p0, v4, Lc35;->d:I

    const/4 v3, 0x3

    if-eq p0, v0, :cond_b8

    iget-boolean p0, v4, Lc35;->e:Z

    if-nez p0, :cond_90

    move p0, v5

    goto :goto_96

    :cond_90
    iget-object p0, v4, Lc35;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->isChecked()Z

    move-result p0

    :goto_96
    if-eqz p0, :cond_b8

    iget p0, v4, Lc35;->d:I

    if-ne p0, v3, :cond_b8

    iget-object p0, v1, Le35;->x:Ls25;

    iget-object p0, p0, Ls25;->k:Lzwk;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzwk;->e()Z

    move-result p0

    if-eqz p0, :cond_b8

    iget-object p0, v1, Le35;->x:Ls25;

    iget-object p0, p0, Ls25;->k:Lzwk;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v3}, Lzwk;->c(I)Z

    move-result p0

    if-eqz p0, :cond_b8

    move p0, v0

    goto :goto_b9

    :cond_b8
    move p0, v5

    :goto_b9
    iget v4, v2, Lc35;->d:I

    if-eq v4, v0, :cond_eb

    iget-boolean v4, v2, Lc35;->e:Z

    if-nez v4, :cond_c3

    move v4, v5

    goto :goto_c9

    :cond_c3
    iget-object v4, v2, Lc35;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v4}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->isChecked()Z

    move-result v4

    :goto_c9
    if-eqz v4, :cond_eb

    iget v2, v2, Lc35;->d:I

    if-ne v2, v3, :cond_eb

    iget-object v2, v1, Le35;->x:Ls25;

    iget-object v2, v2, Ls25;->k:Lzwk;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzwk;->e()Z

    move-result v2

    if-eqz v2, :cond_eb

    iget-object v2, v1, Le35;->x:Ls25;

    iget-object v2, v2, Ls25;->k:Lzwk;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Lzwk;->c(I)Z

    move-result v2

    if-eqz v2, :cond_eb

    move v2, v0

    goto :goto_ec

    :cond_eb
    move v2, v5

    :goto_ec
    if-eqz p0, :cond_118

    if-eqz v2, :cond_109

    iget-object p0, v1, Le35;->x:Ls25;

    iget-object v2, p0, Ls25;->k:Lzwk;

    iget-object p0, p0, Ls25;->f:Lcom/opera/android/settings/SettingsManager;

    invoke-static {v3, v2, p0}, Lxih;->h(ILzwk;Lcom/opera/android/settings/SettingsManager;)V

    iget-object p0, v1, Le35;->x:Ls25;

    iget-object v2, p0, Ls25;->k:Lzwk;

    iget-object p0, p0, Ls25;->f:Lcom/opera/android/settings/SettingsManager;

    invoke-static {v0, v2, p0}, Lxih;->h(ILzwk;Lcom/opera/android/settings/SettingsManager;)V

    const p0, 0x7f14105c

    invoke-virtual {v8, p0}, Ld35;->a(I)V

    goto :goto_129

    :cond_109
    iget-object p0, v1, Le35;->x:Ls25;

    iget-object v4, p0, Ls25;->k:Lzwk;

    iget-object p0, p0, Ls25;->f:Lcom/opera/android/settings/SettingsManager;

    invoke-static {v3, v4, p0}, Lxih;->h(ILzwk;Lcom/opera/android/settings/SettingsManager;)V

    const p0, 0x7f141065

    invoke-virtual {v8, p0}, Ld35;->a(I)V

    :cond_118
    if-eqz v2, :cond_129

    iget-object p0, v1, Le35;->x:Ls25;

    iget-object v2, p0, Ls25;->k:Lzwk;

    iget-object p0, p0, Ls25;->f:Lcom/opera/android/settings/SettingsManager;

    invoke-static {v0, v2, p0}, Lxih;->h(ILzwk;Lcom/opera/android/settings/SettingsManager;)V

    const p0, 0x7f140f94

    invoke-virtual {v8, p0}, Ld35;->a(I)V

    :cond_129
    :goto_129
    const-class p0, La35;

    invoke-static {p0}, Ljava/util/EnumSet;->noneOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v2

    invoke-static {p0}, Ljava/util/EnumSet;->noneOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object p0

    iget-object v3, v1, Le35;->r:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    move v6, v5

    move v7, v6

    :goto_13b
    if-ge v7, v4, :cond_177

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v7, v7, 0x1

    check-cast v9, Lc35;

    iget-object v10, v1, Le35;->x:Ls25;

    iget v11, v9, Lc35;->d:I

    if-eq v11, v0, :cond_15b

    iget-boolean v11, v9, Lc35;->e:Z

    if-nez v11, :cond_151

    move v11, v5

    goto :goto_157

    :cond_151
    iget-object v11, v9, Lc35;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v11}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->isChecked()Z

    move-result v11

    :goto_157
    if-eqz v11, :cond_15b

    move v11, v0

    goto :goto_15c

    :cond_15b
    move v11, v5

    :goto_15c
    iget-object v9, v9, Lc35;->a:Lr25;

    if-nez v11, :cond_166

    iget-object v9, v9, Lr25;->e:La35;

    invoke-virtual {p0, v9}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    goto :goto_13b

    :cond_166
    new-instance v11, Lrl;

    const/4 v12, 0x4

    invoke-direct {v11, v12}, Lrl;-><init>(B)V

    invoke-virtual {v9, v10, v11}, Lr25;->a(Ls25;Ljava/lang/Runnable;)V

    iget-object v9, v9, Lr25;->e:La35;

    invoke-virtual {v2, v9}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v6, 0x1

    goto :goto_13b

    :cond_177
    iget-object v3, v1, Le35;->x:Ls25;

    iget-object v3, v3, Ls25;->a:Lcom/opera/android/BrowserActivity;

    sget-object v4, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v3

    iget-object v3, v3, Ld6j;->c:Lx5f;

    iget-boolean v4, v3, Lx5f;->h:Z

    if-eqz v4, :cond_1f8

    iget-object v4, v3, Lx5f;->d:Lzpa;

    new-instance v7, Ll90;

    const/16 v9, 0x98b

    const/4 v10, -0x1

    const/16 v11, 0x10

    invoke-direct {v7, v9, v10, v11}, Ljf0;-><init>(III)V

    invoke-virtual {v2}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_19d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1b1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, La35;

    invoke-static {v9}, Lp37;->w(La35;)I

    move-result v9

    invoke-virtual {v7, v9, v0, v0}, Ljf0;->r(IIZ)V

    goto :goto_19d

    :cond_1b1
    invoke-virtual {p0}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1b5
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c9

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, La35;

    invoke-static {v2}, Lp37;->w(La35;)I

    move-result v2

    invoke-virtual {v7, v2, v0, v5}, Ljf0;->r(IIZ)V

    goto :goto_1b5

    :cond_1c9
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p0

    invoke-virtual {p0, v4}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v2

    invoke-virtual {v2, v4}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    if-eqz v4, :cond_1e9

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_1e9

    new-instance v9, Lhf0;

    invoke-direct {v9, v2, v11, v4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_1f2

    :cond_1e9
    invoke-static {v2, v11, v0}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v4

    new-instance v9, Lhf0;

    invoke-direct {v9, v2, v11, v4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_1f2
    invoke-virtual {v9, v7}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v3, p0}, Lx5f;->U0(Lx56;)V

    :cond_1f8
    iget-object p0, v1, Le35;->r:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-ne v6, p0, :cond_21c

    iget-object p0, v1, Le35;->x:Ls25;

    iget-object p0, p0, Ls25;->a:Lcom/opera/android/BrowserActivity;

    const-string v2, "yandex_search_deal"

    invoke-virtual {p0, v2, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-static {}, Ltz5;->c()Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-static {p0}, Ltz5;->e(Landroid/content/SharedPreferences;)Ljava/lang/String;

    :cond_21c
    if-lez v6, :cond_24c

    const p0, 0x7f1403b3

    invoke-virtual {v8, p0}, Ld35;->a(I)V

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object p0

    check-cast p0, Lcom/opera/android/BrowserActivity;

    invoke-virtual {v1, v5}, Le35;->l0(Z)V

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->m0:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lf35;

    iget-object p0, p0, Lf35;->a:Li7f;

    new-instance v1, Lg7f;

    invoke-direct {v1, p0}, Lg7f;-><init>(Li7f;)V

    :goto_23c
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_24c

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lw25;

    invoke-interface {p0}, Lw25;->P()V

    goto :goto_23c

    :cond_24c
    :goto_24c
    iget p0, v8, Ld35;->f:I

    add-int/2addr p0, v0

    iput p0, v8, Ld35;->f:I

    return-void
.end method
