.class public final Lbc9;
.super Lba2;
.source "SourceFile"

# interfaces
.implements Lmb9;


# instance fields
.field public final b:Lnb9;

.field public final c:Lcom/opera/android/BrowserActivity;

.field public final d:Ltcl;

.field public final e:Lha2;

.field public final f:Lrc9;

.field public g:Ljava/lang/String;

.field public final h:Lwun;

.field public final i:Lrn9;

.field public final j:Ltcc;

.field public final k:Lxc9;

.field public final l:Lfge;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Ltcl;Lha2;Lrc9;Ltcc;Lxc9;Ljava/lang/String;Lwun;Lfge;)V
    .registers 12

    const-class v0, Lhb9;

    invoke-direct {p0, v0}, Lba2;-><init>(Ljava/lang/Class;)V

    new-instance v0, Lnb9;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnb9;-><init>(B)V

    iput-object v0, p0, Lbc9;->b:Lnb9;

    new-instance v0, Lrn9;

    const/16 v1, 0x11

    invoke-direct {v0, v1}, Lrn9;-><init>(B)V

    iput-object v0, p0, Lbc9;->i:Lrn9;

    iput-object p1, p0, Lbc9;->c:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lbc9;->d:Ltcl;

    iput-object p3, p0, Lbc9;->e:Lha2;

    iput-object p4, p0, Lbc9;->f:Lrc9;

    iput-object p5, p0, Lbc9;->j:Ltcc;

    iput-object p6, p0, Lbc9;->k:Lxc9;

    iput-object p7, p0, Lbc9;->g:Ljava/lang/String;

    iput-object p8, p0, Lbc9;->h:Lwun;

    iput-object p9, p0, Lbc9;->l:Lfge;

    iget-object p1, p4, Lrc9;->d:Lh7f;

    invoke-virtual {p1, p0}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public static u(Landroid/widget/ImageView;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    sget-object v0, Llg7;->a:[[I

    invoke-static {}, Lc5o;->m()Lc5o;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lc5o;->o(Ljava/lang/String;Ljava/lang/String;)Lo29;

    move-result-object p1

    invoke-static {p1}, Llg7;->g(Lo29;)Lkg7;

    move-result-object p1

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    const/4 v0, 0x2

    invoke-virtual {p1, v0, p2}, Lkg7;->h(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p0, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p1, v0, p2}, Lkg7;->g(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method


# virtual methods
.method public final d(ILjava/util/ArrayList;)V
    .registers 3

    if-lez p1, :cond_3

    return-void

    :cond_3
    iget-object p0, p0, Lbc9;->f:Lrc9;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Ljava/util/ArrayList;

    iget-object p0, p0, Lrc9;->c:Ljava/util/ArrayList;

    invoke-direct {p1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method public final f(II)V
    .registers 6

    iget-object v0, p0, Lbc9;->i:Lrn9;

    iget-object v0, v0, Lrn9;->d:Ljava/lang/Object;

    check-cast v0, Lja2;

    iget-object v1, p0, Lbc9;->e:Lha2;

    if-eqz v0, :cond_d

    invoke-virtual {v1, v0, v0}, Lha2;->W(Lja2;Lja2;)V

    :cond_d
    const-class v0, Lhb9;

    invoke-virtual {v1, v0}, Lha2;->L(Ljava/lang/Class;)I

    move-result v0

    const/4 v2, -0x1

    if-ne v0, v2, :cond_17

    return-void

    :cond_17
    :goto_17
    add-int/lit8 v2, p2, -0x1

    if-lez p2, :cond_26

    add-int p2, v0, p1

    invoke-virtual {v1, p2}, Lha2;->J(I)Lja2;

    move-result-object p2

    invoke-virtual {v1, p2}, Lha2;->V(Lja2;)V

    move p2, v2

    goto :goto_17

    :cond_26
    invoke-virtual {p0}, Lbc9;->t()V

    return-void
.end method

.method public final h(II)V
    .registers 9

    iget-object v0, p0, Lbc9;->i:Lrn9;

    iget-object v0, v0, Lrn9;->d:Ljava/lang/Object;

    check-cast v0, Lja2;

    iget-object v1, p0, Lbc9;->e:Lha2;

    if-eqz v0, :cond_d

    invoke-virtual {v1, v0, v0}, Lha2;->W(Lja2;Lja2;)V

    :cond_d
    const-class v0, Lhb9;

    invoke-virtual {v1, v0}, Lha2;->L(Ljava/lang/Class;)I

    move-result v0

    const/4 v2, -0x1

    if-ne v0, v2, :cond_1c

    iget-object v0, v1, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :cond_1c
    const/4 v2, 0x0

    :goto_1d
    if-ge v2, p2, :cond_34

    add-int v3, v0, p1

    add-int/2addr v3, v2

    add-int v4, p1, v2

    iget-object v5, p0, Lbc9;->f:Lrc9;

    iget-object v5, v5, Lrc9;->c:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lhb9;

    invoke-virtual {v1, v3, v4}, Lha2;->H(ILja2;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1d

    :cond_34
    iget-object p1, p0, Lbc9;->j:Ltcc;

    check-cast p1, Lqdc;

    iget-object p1, p1, Lqdc;->i:Lqcc;

    sget-object p2, Lqcc;->e:Lqcc;

    invoke-virtual {p1, p2}, Lqcc;->d(Lqcc;)Z

    move-result p1

    if-eqz p1, :cond_47

    iget-object p1, p0, Lbc9;->k:Lxc9;

    invoke-virtual {p1}, Lxc9;->a()V

    :cond_47
    invoke-virtual {p0}, Lbc9;->t()V

    return-void
.end method

.method public final k(Landroid/view/ViewGroup;I)Lab2;
    .registers 15

    const v0, 0x7f0d01c6

    const/16 v1, 0xc

    const/4 v2, 0x0

    if-ne p2, v0, :cond_1f

    new-instance v3, Lwb9;

    invoke-static {p1, p2, v2}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v6

    iget-object v7, p0, Lbc9;->g:Ljava/lang/String;

    new-instance v9, Lvk2;

    invoke-direct {v9, p0, v1}, Lvk2;-><init>(Ljava/lang/Object;B)V

    iget-object v4, p0, Lbc9;->c:Lcom/opera/android/BrowserActivity;

    iget-object v5, p0, Lbc9;->d:Ltcl;

    iget-object v8, p0, Lbc9;->i:Lrn9;

    invoke-direct/range {v3 .. v9}, Lwb9;-><init>(Lcom/opera/android/BrowserActivity;Ltcl;Landroid/view/View;Ljava/lang/String;Lrn9;Lvk2;)V

    return-object v3

    :cond_1f
    const v0, 0x7f0d01c1

    iget-object v10, p0, Lbc9;->b:Lnb9;

    if-ne p2, v0, :cond_40

    new-instance v3, Ltb9;

    invoke-static {p1, p2, v2}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v6

    iget-object v7, p0, Lbc9;->g:Ljava/lang/String;

    new-instance v9, Lvk2;

    invoke-direct {v9, p0, v1}, Lvk2;-><init>(Ljava/lang/Object;B)V

    move-object v11, v10

    iget-object v10, p0, Lbc9;->h:Lwun;

    iget-object v4, p0, Lbc9;->c:Lcom/opera/android/BrowserActivity;

    iget-object v5, p0, Lbc9;->d:Ltcl;

    iget-object v8, p0, Lbc9;->i:Lrn9;

    invoke-direct/range {v3 .. v11}, Ltb9;-><init>(Lcom/opera/android/BrowserActivity;Ltcl;Landroid/view/View;Ljava/lang/String;Lrn9;Lvk2;Lwun;Lnb9;)V

    return-object v3

    :cond_40
    move-object v11, v10

    const v0, 0x7f0d01bf

    if-ne p2, v0, :cond_5b

    new-instance v3, Lqb9;

    invoke-static {p1, p2, v2}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v6

    iget-object v7, p0, Lbc9;->g:Ljava/lang/String;

    iget-object v8, p0, Lbc9;->i:Lrn9;

    iget-object v9, p0, Lbc9;->l:Lfge;

    iget-object v4, p0, Lbc9;->c:Lcom/opera/android/BrowserActivity;

    iget-object v5, p0, Lbc9;->d:Ltcl;

    move-object v10, v11

    invoke-direct/range {v3 .. v10}, Lqb9;-><init>(Lcom/opera/android/BrowserActivity;Ltcl;Landroid/view/View;Ljava/lang/String;Lrn9;Lfge;Lnb9;)V

    return-object v3

    :cond_5b
    const v0, 0x7f0d01c5

    if-ne p2, v0, :cond_6a

    new-instance p0, Lac9;

    invoke-static {p1, p2, v2}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    invoke-direct {p0, p1, v11}, Lac9;-><init>(Landroid/view/View;Lnb9;)V

    return-object p0

    :cond_6a
    const v0, 0x7f0d01c7

    if-ne p2, v0, :cond_81

    new-instance v3, Lyb9;

    invoke-static {p1, p2, v2}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v6

    iget-object v7, p0, Lbc9;->g:Ljava/lang/String;

    iget-object v8, p0, Lbc9;->i:Lrn9;

    iget-object v4, p0, Lbc9;->c:Lcom/opera/android/BrowserActivity;

    iget-object v5, p0, Lbc9;->d:Ltcl;

    invoke-direct/range {v3 .. v8}, Lxb9;-><init>(Lcom/opera/android/BrowserActivity;Ltcl;Landroid/view/View;Ljava/lang/String;Lrn9;)V

    return-object v3

    :cond_81
    const/4 p0, 0x0

    return-object p0
.end method

.method public final m(I)V
    .registers 5

    const-class v0, Lhb9;

    iget-object v1, p0, Lbc9;->e:Lha2;

    invoke-virtual {v1, v0}, Lha2;->L(Ljava/lang/Class;)I

    move-result v0

    const/4 v2, -0x1

    if-ne v0, v2, :cond_c

    return-void

    :cond_c
    add-int/2addr v0, p1

    invoke-virtual {v1, v0}, Lha2;->J(I)Lja2;

    move-result-object v0

    iget-object p0, p0, Lbc9;->f:Lrc9;

    iget-object p0, p0, Lrc9;->c:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lhb9;

    invoke-virtual {v1, v0, p0}, Lha2;->W(Lja2;Lja2;)V

    return-void
.end method

.method public final onDestroy()V
    .registers 2

    iget-object v0, p0, Lbc9;->f:Lrc9;

    iget-object v0, v0, Lrc9;->d:Lh7f;

    invoke-virtual {v0, p0}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final q(Lja2;ILca2;)I
    .registers 4

    instance-of p0, p1, Lkb9;

    if-eqz p0, :cond_8

    const p0, 0x7f0d01c6

    return p0

    :cond_8
    instance-of p0, p1, Ljb9;

    if-eqz p0, :cond_10

    const p0, 0x7f0d01c1

    return p0

    :cond_10
    instance-of p0, p1, Lib9;

    if-eqz p0, :cond_18

    const p0, 0x7f0d01bf

    return p0

    :cond_18
    instance-of p0, p1, Lzb9;

    if-eqz p0, :cond_20

    const p0, 0x7f0d01c5

    return p0

    :cond_20
    instance-of p0, p1, Llb9;

    if-eqz p0, :cond_28

    const p0, 0x7f0d01c7

    return p0

    :cond_28
    const/4 p0, 0x0

    return p0
.end method

.method public final t()V
    .registers 5

    iget-object v0, p0, Lbc9;->e:Lha2;

    iget-object v1, v0, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    if-lez v1, :cond_17

    iget-object v1, v0, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Lha2;->J(I)Lja2;

    move-result-object v1

    goto :goto_18

    :cond_17
    const/4 v1, 0x0

    :goto_18
    iget-object p0, p0, Lbc9;->i:Lrn9;

    iget-object v3, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast v3, Lja2;

    if-eq v1, v3, :cond_26

    if-eqz v3, :cond_24

    iput-boolean v2, p0, Lrn9;->b:Z

    :cond_24
    iput-object v1, p0, Lrn9;->d:Ljava/lang/Object;

    :cond_26
    if-eqz v1, :cond_2b

    invoke-virtual {v0, v1, v1}, Lha2;->W(Lja2;Lja2;)V

    :cond_2b
    return-void
.end method
