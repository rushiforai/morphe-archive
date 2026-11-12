.class public final Ldqi;
.super Llj;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Ldqi;",
        "Llj;",
        "<init>",
        "()V",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public r:Lwk9;

.field public final s:Lzyk;


# direct methods
.method public constructor <init>()V
    .registers 3

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Llj;-><init>(II)V

    new-instance v0, Lyse;

    const/16 v1, 0xb

    invoke-direct {v0, p0, v1}, Lyse;-><init>(Landroidx/fragment/app/Fragment;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Ldqi;->s:Lzyk;

    return-void
.end method


# virtual methods
.method public final G0(Lvs;Leqi;)V
    .registers 6

    iget-object v0, p1, Lvs;->c:Ljava/lang/Object;

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p2, Leqi;->a:Ljava/lang/String;

    const-string v2, "-"

    if-nez v1, :cond_b

    move-object v1, v2

    :cond_b
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p1, Lvs;->d:Ljava/lang/Object;

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p2, Leqi;->b:Ljava/lang/String;

    if-eqz v1, :cond_17

    move-object v2, v1

    :cond_17
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p1, Lvs;->b:Landroid/view/ViewGroup;

    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v0, Lzt;

    invoke-direct {v0, p0, p2}, Lzt;-><init>(Ldqi;Leqi;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 9

    invoke-super {p0, p1}, Lltl;->onCreate(Landroid/os/Bundle;)V

    iget-object p1, p0, Ldqi;->s:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lgqi;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object p0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p0, :cond_4b

    invoke-virtual {p0}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    move-result-object v0

    if-eqz v0, :cond_4b

    check-cast v0, Ljava/lang/Iterable;

    new-instance v1, Ljava/util/LinkedHashMap;

    const/16 v2, 0xa

    invoke-static {v0, v2}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-static {v2}, Lqbd;->a(I)I

    move-result v2

    const/16 v3, 0x10

    if-ge v2, v3, :cond_2d

    move v2, v3

    :cond_2d
    invoke-direct {v1, v2}, Ljava/util/LinkedHashMap;-><init>(I)V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_34
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Ljava/lang/String;

    const-string v4, ""

    invoke-virtual {p0, v3, v4}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_34

    :cond_4b
    const/4 v1, 0x0

    :cond_4c
    if-nez v1, :cond_50

    sget-object v1, Ln08;->a:Ln08;

    :cond_50
    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_a5

    iget-object p0, p1, Lgqi;->d:Lpqi;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lmqi;->a:[Lmqi;

    const-string v0, "lf"

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string v3, "1"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    new-instance v3, Ljava/util/LinkedHashMap;

    invoke-direct {v3}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_76
    :goto_76
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_9c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    sget-object v6, Lmqi;->a:[Lmqi;

    invoke-static {v5, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_76

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v5, v4}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_76

    :cond_9c
    invoke-static {}, LJ/N;->MphJ2uhp()Z

    move-result v0

    if-eqz v0, :cond_a5

    invoke-virtual {p0, v3, v2}, Lpqi;->c(Ljava/util/Map;Z)V

    :cond_a5
    iget-object p0, p1, Lgqi;->c:Lsqi;

    sget-object v0, Ll08;->a:Ll08;

    new-instance v1, Ltji;

    const/4 v2, 0x4

    invoke-direct {v1, p1, v2}, Ltji;-><init>(Ljava/lang/Object;B)V

    new-instance p1, Lzg;

    iget-object v2, p0, Lsqi;->a:Llld;

    iget-object v3, p0, Lsqi;->h:Ltvk;

    iget-object v4, p0, Lsqi;->m:Llv1;

    new-instance v5, Lf23;

    const/16 v6, 0xd

    invoke-direct {v5, v1, p0, v0, v6}, Lf23;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p1, v2, v3, v4, v5}, Lzg;-><init>(Llld;Ltvk;Llv1;Lf23;)V

    return-void
.end method

.method public final onDestroyView()V
    .registers 2

    invoke-super {p0}, Lltl;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Ldqi;->r:Lwk9;

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 6

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p1, p0, Ldqi;->r:Lwk9;

    iget-object p1, p1, Lwk9;->s:Landroid/view/View;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    new-instance p2, Lh4i;

    const/4 v0, 0x3

    invoke-direct {p2, p0, v0}, Lh4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Ldqi;->s:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lgqi;

    iget-object p1, p1, Lgqi;->e:Lode;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    iget-object v0, p0, Ldqi;->r:Lwk9;

    iget-object v0, v0, Lwk9;->b:Landroid/widget/LinearLayout;

    new-instance v1, Lqzg;

    const/4 v2, 0x5

    invoke-direct {v1, p0, v2}, Lqzg;-><init>(Ljava/lang/Object;B)V

    const/4 p0, 0x0

    invoke-static {p1, p2, v0, p0, v1}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    return-void
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 29

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    const-string v2, "SDx"

    iget-object v3, v0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v3, v2}, Landroidx/appcompat/widget/Toolbar;->D(Ljava/lang/CharSequence;)V

    const v2, 0x7f0d01f4

    const/4 v3, 0x0

    move-object/from16 v4, p1

    invoke-virtual {v4, v2, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v1, 0x7f0a000e

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_22f

    invoke-static {v3}, Lvs;->a(Landroid/view/View;)Lvs;

    move-result-object v6

    const v1, 0x7f0a009d

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_22f

    invoke-static {v3}, Lvs;->a(Landroid/view/View;)Lvs;

    move-result-object v7

    const v1, 0x7f0a0104

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_22f

    invoke-static {v3}, Lvs;->a(Landroid/view/View;)Lvs;

    move-result-object v8

    const v1, 0x7f0a0151

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_22f

    invoke-static {v3}, Lvs;->a(Landroid/view/View;)Lvs;

    move-result-object v9

    const v1, 0x7f0a0198

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_22f

    invoke-static {v3}, Lvs;->a(Landroid/view/View;)Lvs;

    move-result-object v10

    const v1, 0x7f0a025a

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_22f

    invoke-static {v3}, Lvs;->a(Landroid/view/View;)Lvs;

    move-result-object v11

    const v1, 0x7f0a029c

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_22f

    invoke-static {v3}, Lvs;->a(Landroid/view/View;)Lvs;

    move-result-object v12

    const v1, 0x7f0a0544

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_22f

    invoke-static {v3}, Lvs;->a(Landroid/view/View;)Lvs;

    move-result-object v13

    const v1, 0x7f0a0554

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_22f

    invoke-static {v3}, Lvs;->a(Landroid/view/View;)Lvs;

    move-result-object v14

    const v1, 0x7f0a05e6

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_22f

    invoke-static {v3}, Lvs;->a(Landroid/view/View;)Lvs;

    move-result-object v15

    const v1, 0x7f0a05ee

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_22f

    invoke-static {v3}, Lvs;->a(Landroid/view/View;)Lvs;

    move-result-object v16

    const v1, 0x7f0a05fa

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v17, v3

    check-cast v17, Landroid/widget/TextView;

    if-eqz v17, :cond_22f

    const v1, 0x7f0a083d

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_22f

    invoke-static {v3}, Lvs;->a(Landroid/view/View;)Lvs;

    move-result-object v18

    const v1, 0x7f0a08c6

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_22f

    invoke-static {v3}, Lvs;->a(Landroid/view/View;)Lvs;

    move-result-object v19

    const v1, 0x7f0a08c7

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_22f

    invoke-static {v3}, Lvs;->a(Landroid/view/View;)Lvs;

    move-result-object v20

    const v1, 0x7f0a08d1

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_22f

    invoke-static {v3}, Lvs;->a(Landroid/view/View;)Lvs;

    move-result-object v21

    const v1, 0x7f0a08d8

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v22, v3

    check-cast v22, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v22, :cond_22f

    const v1, 0x7f0a0c71

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_22f

    invoke-static {v3}, Lvs;->a(Landroid/view/View;)Lvs;

    move-result-object v23

    const v1, 0x7f0a0c76

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_22f

    invoke-static {v3}, Lvs;->a(Landroid/view/View;)Lvs;

    move-result-object v24

    const v1, 0x7f0a0c77

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_22f

    invoke-static {v3}, Lvs;->a(Landroid/view/View;)Lvs;

    move-result-object v25

    new-instance v4, Lwk9;

    move-object v5, v2

    check-cast v5, Landroid/widget/LinearLayout;

    invoke-direct/range {v4 .. v25}, Lwk9;-><init>(Landroid/widget/LinearLayout;Lvs;Lvs;Lvs;Lvs;Lvs;Lvs;Lvs;Lvs;Lvs;Lvs;Lvs;Landroid/widget/TextView;Lvs;Lvs;Lvs;Lvs;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;Lvs;Lvs;Lvs;)V

    iput-object v4, v0, Ldqi;->r:Lwk9;

    iget-object v1, v9, Lvs;->e:Ljava/lang/Object;

    check-cast v1, Landroid/widget/TextView;

    const-string v2, "Base url"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Ldqi;->r:Lwk9;

    iget-object v1, v1, Lwk9;->j:Ljava/lang/Object;

    check-cast v1, Lvs;

    iget-object v1, v1, Lvs;->e:Ljava/lang/Object;

    check-cast v1, Landroid/widget/TextView;

    const-string v2, "Country code"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Ldqi;->r:Lwk9;

    iget-object v1, v1, Lwk9;->l:Ljava/lang/Object;

    check-cast v1, Lvs;

    iget-object v1, v1, Lvs;->e:Ljava/lang/Object;

    check-cast v1, Landroid/widget/TextView;

    const-string v2, "Language code"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Ldqi;->r:Lwk9;

    iget-object v1, v1, Lwk9;->o:Ljava/lang/Object;

    check-cast v1, Lvs;

    iget-object v1, v1, Lvs;->e:Ljava/lang/Object;

    check-cast v1, Landroid/widget/TextView;

    const-string v2, "Platform name"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Ldqi;->r:Lwk9;

    iget-object v1, v1, Lwk9;->m:Ljava/lang/Object;

    check-cast v1, Lvs;

    iget-object v1, v1, Lvs;->e:Ljava/lang/Object;

    check-cast v1, Landroid/widget/TextView;

    const-string v2, "Operator"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Ldqi;->r:Lwk9;

    iget-object v1, v1, Lwk9;->g:Ljava/lang/Object;

    check-cast v1, Lvs;

    iget-object v1, v1, Lvs;->e:Ljava/lang/Object;

    check-cast v1, Landroid/widget/TextView;

    const-string v2, "Brand name"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Ldqi;->r:Lwk9;

    iget-object v1, v1, Lwk9;->d:Ljava/lang/Object;

    check-cast v1, Lvs;

    iget-object v1, v1, Lvs;->e:Ljava/lang/Object;

    check-cast v1, Landroid/widget/TextView;

    const-string v2, "Advertising id"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Ldqi;->r:Lwk9;

    iget-object v1, v1, Lwk9;->k:Ljava/lang/Object;

    check-cast v1, Lvs;

    iget-object v1, v1, Lvs;->e:Ljava/lang/Object;

    check-cast v1, Landroid/widget/TextView;

    const-string v2, "Hashed opera user id"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Ldqi;->r:Lwk9;

    iget-object v1, v1, Lwk9;->t:Ljava/lang/Object;

    check-cast v1, Lvs;

    iget-object v1, v1, Lvs;->e:Ljava/lang/Object;

    check-cast v1, Landroid/widget/TextView;

    const-string v2, "User consent"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Ldqi;->r:Lwk9;

    iget-object v1, v1, Lwk9;->r:Ljava/lang/Object;

    check-cast v1, Lvs;

    iget-object v1, v1, Lvs;->e:Ljava/lang/Object;

    check-cast v1, Landroid/widget/TextView;

    const-string v2, "Removed speed dials"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Ldqi;->r:Lwk9;

    iget-object v1, v1, Lwk9;->v:Ljava/lang/Object;

    check-cast v1, Lvs;

    iget-object v1, v1, Lvs;->e:Ljava/lang/Object;

    check-cast v1, Landroid/widget/TextView;

    const-string v2, "Number of user defined speed dials"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Ldqi;->r:Lwk9;

    iget-object v1, v1, Lwk9;->h:Ljava/lang/Object;

    check-cast v1, Lvs;

    iget-object v1, v1, Lvs;->e:Ljava/lang/Object;

    check-cast v1, Landroid/widget/TextView;

    const-string v2, "Config bundle"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Ldqi;->r:Lwk9;

    iget-object v1, v1, Lwk9;->q:Ljava/lang/Object;

    check-cast v1, Lvs;

    iget-object v1, v1, Lvs;->e:Ljava/lang/Object;

    check-cast v1, Landroid/widget/TextView;

    const-string v2, "Referrer source"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Ldqi;->r:Lwk9;

    iget-object v1, v1, Lwk9;->e:Ljava/lang/Object;

    check-cast v1, Lvs;

    iget-object v1, v1, Lvs;->e:Ljava/lang/Object;

    check-cast v1, Landroid/widget/TextView;

    const-string v2, "App version"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Ldqi;->r:Lwk9;

    iget-object v1, v1, Lwk9;->p:Ljava/lang/Object;

    check-cast v1, Lvs;

    iget-object v1, v1, Lvs;->e:Ljava/lang/Object;

    check-cast v1, Landroid/widget/TextView;

    const-string v2, "Referrer campaign"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Ldqi;->r:Lwk9;

    iget-object v1, v1, Lwk9;->u:Ljava/lang/Object;

    check-cast v1, Lvs;

    iget-object v1, v1, Lvs;->e:Ljava/lang/Object;

    check-cast v1, Landroid/widget/TextView;

    const-string v2, "User plan"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Ldqi;->r:Lwk9;

    iget-object v1, v1, Lwk9;->c:Ljava/lang/Object;

    check-cast v1, Lvs;

    iget-object v1, v1, Lvs;->e:Ljava/lang/Object;

    check-cast v1, Landroid/widget/TextView;

    const-string v2, "A/B Group"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, v0, Ldqi;->r:Lwk9;

    iget-object v0, v0, Lwk9;->i:Ljava/lang/Object;

    check-cast v0, Lvs;

    iget-object v0, v0, Lvs;->e:Ljava/lang/Object;

    check-cast v0, Landroid/widget/TextView;

    const-string v1, "Crypto wallet enabled"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_22f
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
