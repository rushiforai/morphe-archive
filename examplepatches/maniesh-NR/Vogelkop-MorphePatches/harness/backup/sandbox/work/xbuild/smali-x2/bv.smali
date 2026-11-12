.class public final Lbv;
.super Lo73;
.source "SourceFile"


# instance fields
.field public final j:Lcom/opera/android/BrowserActivity;

.field public final k:Lgjm;

.field public final l:Lro9;

.field public final m:Z

.field public n:Lvr0;

.field public o:I

.field public p:Z


# direct methods
.method public constructor <init>(ZLcom/opera/android/BrowserActivity;Lgjm;Lro9;)V
    .registers 6

    invoke-direct {p0}, Lo73;-><init>()V

    sget-object v0, Lvr0;->c:Lvr0;

    iput-object v0, p0, Lbv;->n:Lvr0;

    iput-boolean p1, p0, Lbv;->m:Z

    iput-object p2, p0, Lbv;->j:Lcom/opera/android/BrowserActivity;

    iput-object p3, p0, Lbv;->k:Lgjm;

    iput-object p4, p0, Lbv;->l:Lro9;

    return-void
.end method


# virtual methods
.method public final m(Lr9i;Landroid/view/View;)V
    .registers 5

    const p2, 0x7f100003

    invoke-virtual {p1, p2}, Lr9i;->L(I)V

    iget-object p1, p1, Lr9i;->c:Ljava/lang/Object;

    check-cast p1, Lm66;

    iget-object p2, p0, Lbv;->l:Lro9;

    iget-object v0, p2, Lro9;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/BrowserActivity;

    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v1

    if-eqz v1, :cond_22

    check-cast v1, Ld7l;

    iget-object v1, v1, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->m()Z

    move-result v1

    if-nez v1, :cond_31

    :cond_22
    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->C:Lfnh;

    if-nez v0, :cond_27

    const/4 v0, 0x0

    :cond_27
    iget-object v0, v0, Lfnh;->f:Lcom/opera/android/browser/SessionStore;

    iget-wide v0, v0, Lcom/opera/android/browser/SessionStore;->a:J

    invoke-static {v0, v1}, LJ/N;->Mwymlr4O(J)Z

    move-result v0

    if-eqz v0, :cond_3d

    :cond_31
    const v0, 0x7f0a0636

    invoke-virtual {p1, v0}, Litd;->removeItem(I)V

    const v0, 0x7f0a0631

    invoke-virtual {p1, v0}, Litd;->removeItem(I)V

    :cond_3d
    iget-boolean v0, p0, Lbv;->m:Z

    if-nez v0, :cond_47

    const v1, 0x7f0a062f

    invoke-virtual {p1, v1}, Litd;->removeItem(I)V

    :cond_47
    iget-object p2, p2, Lro9;->c:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/BrowserActivity;

    invoke-virtual {p2}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object p2

    move-object v1, p2

    check-cast v1, Ld7l;

    iget-object v1, v1, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6c

    const v1, 0x7f0a062e

    invoke-virtual {p1, v1}, Litd;->removeItem(I)V

    if-nez v0, :cond_6c

    const v0, 0x7f0a0632

    invoke-virtual {p1, v0}, Litd;->removeItem(I)V

    :cond_6c
    check-cast p2, Ld7l;

    iget-object v0, p2, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v0

    iget v0, v0, Lcom/opera/android/browser/TabInfo;->d:I

    iput v0, p0, Lbv;->o:I

    iget-object p2, p2, Ld7l;->j:Le7l;

    invoke-interface {p2}, Lb9l;->m()Z

    move-result p2

    iput-boolean p2, p0, Lbv;->p:Z

    if-eqz p2, :cond_9f

    const p2, 0x7f0a0634

    invoke-virtual {p1, p2}, Litd;->removeItem(I)V

    const p2, 0x7f0a0633

    invoke-virtual {p1, p2}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p2

    const v0, 0x7f080244

    invoke-interface {p2, v0}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    const v0, 0x7f140b0f

    invoke-interface {p2, v0}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    sget-object p2, Lvr0;->b:Lvr0;

    iput-object p2, p0, Lbv;->n:Lvr0;

    :cond_9f
    iget p0, p0, Lbv;->o:I

    if-nez p0, :cond_a9

    const p0, 0x7f0a0635

    invoke-virtual {p1, p0}, Litd;->removeItem(I)V

    :cond_a9
    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 15

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0634

    const/4 v2, 0x0

    const/4 v3, 0x0

    iget-object v4, p0, Lbv;->l:Lro9;

    const/4 v5, 0x1

    if-ne v0, v1, :cond_1d

    sget-object p0, Lvr0;->b:Lvr0;

    invoke-virtual {v4, p0}, Lro9;->Z(Lvr0;)V

    iget-object p0, v4, Lro9;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    sget p1, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0, v3, v5, v2}, Lcom/opera/android/BrowserActivity;->j1(ZZLcom/opera/android/browser/TabInfo;)Ld7l;

    return v5

    :cond_1d
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0633

    if-ne v0, v1, :cond_35

    iget-object p0, p0, Lbv;->n:Lvr0;

    invoke-virtual {v4, p0}, Lro9;->Z(Lvr0;)V

    iget-object p0, v4, Lro9;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    sget p1, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0, v5, v5, v2}, Lcom/opera/android/BrowserActivity;->j1(ZZLcom/opera/android/browser/TabInfo;)Ld7l;

    return v5

    :cond_35
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0635

    if-ne v0, v1, :cond_5d

    iget-boolean p1, p0, Lbv;->p:Z

    iget v8, p0, Lbv;->o:I

    new-instance v6, Lcom/opera/android/browser/TabInfo;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    const-wide/16 v11, 0x0

    const/4 v7, 0x0

    invoke-direct/range {v6 .. v12}, Lcom/opera/android/browser/TabInfo;-><init>(IIJJ)V

    sget-object p0, Lvr0;->i:Lvr0;

    invoke-virtual {v4, p0}, Lro9;->Z(Lvr0;)V

    iget-object p0, v4, Lro9;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0, p1, v5, v6}, Lcom/opera/android/BrowserActivity;->j1(ZZLcom/opera/android/browser/TabInfo;)Ld7l;

    return v5

    :cond_5d
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a062e

    if-ne v0, v1, :cond_f7

    sget-object p0, Lvr0;->m:Lvr0;

    invoke-virtual {v4, p0}, Lro9;->Z(Lvr0;)V

    iget-object p0, v4, Lro9;->c:Ljava/lang/Object;

    move-object v10, p0

    check-cast v10, Lcom/opera/android/BrowserActivity;

    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v10}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object p0

    if-eqz p0, :cond_132

    invoke-virtual {v10}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/opera/android/settings/SettingsManager;->f()Le7j;

    move-result-object p1

    iget-object v0, v10, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    sget-object v1, Le7j;->d:Le7j;

    if-ne p1, v1, :cond_8d

    if-eqz v0, :cond_89

    move-object v2, v0

    :cond_89
    invoke-virtual {v2, p0, v5}, Lk6l;->i(Lb2l;Z)Ld7l;

    return v5

    :cond_8d
    if-nez v0, :cond_90

    move-object v0, v2

    :cond_90
    invoke-virtual {v0, p0, v3}, Lk6l;->i(Lb2l;Z)Ld7l;

    move-result-object v7

    const p0, 0x7f0a01a3

    invoke-virtual {v10, p0}, Landroid/app/Activity;->requireViewById(I)Landroid/view/View;

    move-result-object v9

    const p0, 0x7f0a0b31

    invoke-virtual {v10, p0}, Landroid/app/Activity;->requireViewById(I)Landroid/view/View;

    move-result-object p0

    move-object v8, p0

    check-cast v8, Landroid/widget/FrameLayout;

    iget-object p0, v10, Lcom/opera/android/BrowserActivity;->X:Lbvl;

    if-nez p0, :cond_aa

    move-object p0, v2

    :cond_aa
    invoke-interface {p0}, Lbvl;->getState()Lpde;

    move-result-object p0

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lavl;

    iget-object p0, p0, Lavl;->a:Lyul;

    iget-boolean p0, p0, Lyul;->b:Z

    if-eqz p0, :cond_bc

    move v11, v3

    goto :goto_d6

    :cond_bc
    iget-object p1, v10, Lcom/opera/android/BrowserActivity;->X:Lbvl;

    if-nez p1, :cond_c1

    move-object p1, v2

    :cond_c1
    invoke-interface {p1}, Lbvl;->getState()Lpde;

    move-result-object p1

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lavl;

    iget p1, p1, Lavl;->c:I

    iget-object v0, v10, Lcom/opera/android/BrowserActivity;->Q:Lcom/opera/android/RootView;

    if-nez v0, :cond_d2

    move-object v0, v2

    :cond_d2
    iget v0, v0, Lcom/opera/android/RootView;->o:I

    add-int/2addr p1, v0

    move v11, p1

    :goto_d6
    xor-int/lit8 v12, p0, 0x1

    new-instance v6, Lyt3;

    invoke-direct/range {v6 .. v12}, Lyt3;-><init>(Ld7l;Landroid/widget/FrameLayout;Landroid/view/View;Lcom/opera/android/BrowserActivity;IZ)V

    iget-object p0, v10, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz p0, :cond_e2

    move-object v2, p0

    :cond_e2
    invoke-virtual {v2}, Lk6l;->A()Lb2l;

    move-result-object p0

    iget-object p1, v10, Lcom/opera/android/BrowserActivity;->w0:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lc8l;

    new-instance v0, Lqv3;

    invoke-direct {v0, v6, v3}, Lqv3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p0, v0}, Lc8l;->b(Lb2l;Lw7l;)V

    return v5

    :cond_f7
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0636

    if-ne v0, v1, :cond_118

    sget-object p1, Lvr0;->d:Lvr0;

    invoke-virtual {v4, p1}, Lro9;->Z(Lvr0;)V

    new-instance p1, Ljnh;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lk9;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lk9;-><init>(Ljava/lang/Object;B)V

    iget-object v1, p0, Lbv;->k:Lgjm;

    iget-object p0, p0, Lbv;->j:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v1, p1, p0, v0}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    return v5

    :cond_118
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p0

    const p1, 0x7f0a062f

    if-ne p0, p1, :cond_168

    sget-object p0, Lvr0;->y:Lvr0;

    invoke-virtual {v4, p0}, Lro9;->Z(Lvr0;)V

    iget-object p0, v4, Lro9;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    sget p1, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object p1

    if-nez p1, :cond_133

    :cond_132
    return v5

    :cond_133
    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v0, :cond_138

    move-object v0, v2

    :cond_138
    iget-object v0, v0, Lk6l;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-eq v0, v5, :cond_15c

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v0, :cond_145

    move-object v0, v2

    :cond_145
    invoke-virtual {v0}, Lk6l;->q()I

    move-result v0

    if-ne v0, v5, :cond_15f

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v0, :cond_150

    move-object v0, v2

    :cond_150
    iget-object v0, v0, Lk6l;->b:Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-ne p1, v0, :cond_15f

    :cond_15c
    invoke-virtual {p0, p1}, Lcom/opera/android/BrowserActivity;->h0(Lb2l;)V

    :cond_15f
    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz p0, :cond_164

    move-object v2, p0

    :cond_164
    invoke-virtual {v2, p1}, Lk6l;->k(Lb2l;)V

    return v5

    :cond_168
    return v3
.end method
