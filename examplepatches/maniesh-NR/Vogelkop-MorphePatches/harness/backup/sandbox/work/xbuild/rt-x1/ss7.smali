.class public abstract Lss7;
.super Llj;
.source "SourceFile"


# instance fields
.field public A:Li53;

.field public B:Lml3;

.field public C:Lqm3;

.field public final r:Ldl3;

.field public final s:Lmj2;

.field public t:Lcr2;

.field public u:Lpq3;

.field public v:Lal3;

.field public w:Lw80;

.field public x:Lole;

.field public y:Z

.field public z:Z


# direct methods
.method public constructor <init>(II)V
    .registers 4

    sget v0, Lfki;->a:I

    invoke-static {v0}, Lu7k;->f(I)Lu7k;

    move-result-object v0

    invoke-virtual {v0, p1}, Lu7k;->s(I)V

    iget-object p1, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast p1, Litl;

    iput p2, p1, Litl;->b:I

    const/4 p2, 0x1

    iput p2, p1, Litl;->k:I

    iput-boolean p2, p1, Litl;->d:Z

    invoke-direct {p0, p1}, Lltl;-><init>(Litl;)V

    new-instance p1, Ldl3;

    const/4 p2, 0x3

    invoke-direct {p1, p0, p2}, Ldl3;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lss7;->r:Ldl3;

    new-instance p1, Lmj2;

    const/4 p2, 0x6

    invoke-direct {p1, p0, p2}, Lmj2;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lss7;->s:Lmj2;

    sget-object p1, Lqm3;->b:Lqm3;

    iput-object p1, p0, Lss7;->C:Lqm3;

    return-void
.end method

.method public static L0(Lal3;Lml3;Lss7;Lw80;Lole;)V
    .registers 10

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    if-eqz p0, :cond_24

    invoke-interface {p0}, Lal3;->getId()J

    move-result-wide v1

    const-wide/16 v3, -0x1

    cmp-long v1, v1, v3

    if-nez v1, :cond_1b

    const-string v1, "bookmark"

    invoke-static {p0}, Ljkj;->j(Lal3;)Ljkj;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    goto :goto_24

    :cond_1b
    const-string v1, "bookmark-id"

    invoke-interface {p0}, Lal3;->getId()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    :cond_24
    :goto_24
    if-eqz p1, :cond_2f

    const-string p0, "bookmark-parent"

    invoke-interface {p1}, Lal3;->getId()J

    move-result-wide v1

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    :cond_2f
    const-string p0, "show-snackbar"

    const/4 p1, 0x0

    invoke-virtual {v0, p0, p1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    const-string p0, "dialog-source"

    iget-byte p1, p3, Lw80;->a:B

    invoke-virtual {v0, p0, p1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {p2, v0}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    iput-object p4, p2, Lss7;->x:Lole;

    return-void
.end method


# virtual methods
.method public G0(Lal3;Ljava/lang/String;)Lal3;
    .registers 5

    iget-object p0, p0, Lss7;->t:Lcr2;

    iget-object p0, p0, Lcr2;->f:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    const-wide/16 v0, -0x1

    invoke-static {v0, v1, p2, p0}, Llkj;->k(JLjava/lang/String;Ljava/lang/String;)Llkj;

    move-result-object p0

    return-object p0
.end method

.method public H0()Lx80;
    .registers 1

    sget-object p0, Lx80;->c:Lx80;

    return-object p0
.end method

.method public final I0(Ljava/lang/CharSequence;)Z
    .registers 7

    iget-object v0, p0, Lss7;->B:Lml3;

    if-eqz v0, :cond_62

    if-eqz p1, :cond_f

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    goto :goto_11

    :cond_f
    const-string p1, ""

    :goto_11
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_62

    iget-object v0, p0, Lss7;->v:Lal3;

    if-eqz v0, :cond_28

    invoke-interface {v0}, Lol3;->g()Z

    move-result v0

    if-eqz v0, :cond_28

    iget-object v0, p0, Lss7;->v:Lal3;

    invoke-interface {v0}, Lal3;->getId()J

    move-result-wide v0

    goto :goto_2a

    :cond_28
    const-wide/16 v0, -0x1

    :goto_2a
    iget-object p0, p0, Lss7;->B:Lml3;

    invoke-interface {p0}, Lml3;->i()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_34
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_62

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lal3;

    invoke-interface {v2}, Lol3;->g()Z

    move-result v3

    if-eqz v3, :cond_34

    invoke-interface {v2}, Lal3;->getId()J

    move-result-wide v3

    cmp-long v3, v3, v0

    if-eqz v3, :cond_34

    invoke-interface {v2}, Lal3;->getTitle()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_59

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    goto :goto_5a

    :cond_59
    const/4 v2, 0x0

    :goto_5a
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_34

    const/4 p0, 0x1

    return p0

    :cond_62
    const/4 p0, 0x0

    return p0
.end method

.method public J0()Z
    .registers 1

    iget-object p0, p0, Lss7;->t:Lcr2;

    iget-object p0, p0, Lcr2;->f:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public K0()V
    .registers 2

    iget-object v0, p0, Lss7;->u:Lpq3;

    iget-object v0, v0, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0}, Lss7;->J0()Z

    move-result p0

    invoke-virtual {v0, p0}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method

.method public final M0(Lvb0;)V
    .registers 11

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    iget-object v1, p0, Lss7;->w:Lw80;

    invoke-virtual {p0}, Lss7;->H0()Lx80;

    move-result-object v2

    iget-boolean p0, p0, Lss7;->z:Z

    iget-boolean v3, v0, Lx5f;->h:Z

    if-nez v3, :cond_1f

    return-void

    :cond_1f
    iget-object v3, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    invoke-virtual {v4, v3}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v3

    new-instance v5, Lv80;

    const/4 v6, -0x1

    const/4 v7, 0x4

    const/16 v8, 0x98b

    invoke-direct {v5, v8, v6, v7}, Ljf0;-><init>(III)V

    const/4 v6, 0x3

    const/4 v7, 0x1

    invoke-virtual {v5, v6, v7, p0}, Ljf0;->r(IIZ)V

    const/4 p0, 0x0

    invoke-virtual {v5, p0, v7, p1}, Ljf0;->q(IILjava/lang/Object;)V

    if-eqz v1, :cond_3e

    move p0, v7

    :cond_3e
    invoke-virtual {v5, v7, p0, v1}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 p0, 0x2

    invoke-virtual {v5, p0, v7, v2}, Ljf0;->q(IILjava/lang/Object;)V

    const/16 p0, 0x24

    invoke-virtual {v3, p0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_5b

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_5b

    new-instance v1, Lhf0;

    invoke-direct {v1, v3, p0, p1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_64

    :cond_5b
    invoke-static {v3, p0, v7}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object p1

    new-instance v1, Lhf0;

    invoke-direct {v1, v3, p0, p1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_64
    invoke-virtual {v1, v5}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v4}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final N0()V
    .registers 3

    iget-object v0, p0, Lss7;->t:Lcr2;

    iget-object v0, v0, Lcr2;->d:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    iget-object v0, p0, Lss7;->t:Lcr2;

    iget-object v0, v0, Lcr2;->d:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-static {v1}, Laik;->c(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    new-instance v0, Lbn7;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lbn7;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final O0()V
    .registers 3

    iget-object v0, p0, Lss7;->B:Lml3;

    if-eqz v0, :cond_22

    invoke-interface {v0}, Lol3;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_22

    iget-object v0, p0, Lss7;->t:Lcr2;

    iget-object v0, v0, Lcr2;->k:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    iget-object p0, p0, Lss7;->B:Lml3;

    invoke-interface {p0}, Lol3;->b()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lalo;->z(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void

    :cond_22
    iget-object v0, p0, Lss7;->t:Lcr2;

    iget-object v0, v0, Lcr2;->k:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    const v1, 0x7f08055a

    invoke-static {v1, p0}, Lalo;->A(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public final P0()V
    .registers 4

    iget-object v0, p0, Lss7;->t:Lcr2;

    if-eqz v0, :cond_35

    iget-object v0, p0, Lss7;->u:Lpq3;

    if-eqz v0, :cond_35

    iget-object v0, p0, Lss7;->B:Lml3;

    if-eqz v0, :cond_26

    invoke-interface {v0}, Lml3;->h()Z

    move-result v0

    if-nez v0, :cond_26

    iget-object v0, p0, Lss7;->t:Lcr2;

    iget-object v0, v0, Lcr2;->l:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v1, p0, Lss7;->B:Lml3;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v1, v2}, Lalo;->J(Lml3;Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_32

    :cond_26
    iget-object v0, p0, Lss7;->t:Lcr2;

    iget-object v0, v0, Lcr2;->l:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    const v1, 0x7f14037f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    :goto_32
    invoke-virtual {p0}, Lss7;->K0()V

    :cond_35
    return-void
.end method

.method public final l0(Z)V
    .registers 3

    if-eqz p1, :cond_8

    sget-object v0, Lvb0;->d:Lvb0;

    invoke-virtual {p0, v0}, Lss7;->M0(Lvb0;)V

    goto :goto_d

    :cond_8
    sget-object v0, Lvb0;->c:Lvb0;

    invoke-virtual {p0, v0}, Lss7;->M0(Lvb0;)V

    :goto_d
    invoke-super {p0, p1}, Lk24;->l0(Z)V

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 9

    invoke-super {p0, p1}, Lltl;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->g()Li53;

    move-result-object p1

    iput-object p1, p0, Lss7;->A:Li53;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "bookmark-id"

    const-wide/16 v1, -0x1

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    cmp-long v0, v3, v1

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v0, :cond_40

    iget-object v0, p0, Lss7;->A:Li53;

    check-cast v0, Lcom/opera/android/bookmarks/h;

    invoke-virtual {v0, v3, v4, v5}, Lcom/opera/android/bookmarks/h;->m(JZ)Lal3;

    move-result-object v0

    iput-object v0, p0, Lss7;->v:Lal3;

    if-eqz v0, :cond_55

    iget-object v3, p0, Lss7;->A:Li53;

    check-cast v3, Lcom/opera/android/bookmarks/h;

    invoke-virtual {v3}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v3

    invoke-interface {v0, v3}, Lal3;->a(Lcom/opera/android/bookmarks/c;)Lml3;

    move-result-object v0

    goto :goto_56

    :cond_40
    const-string v0, "bookmark-parent"

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    cmp-long v0, v3, v1

    if-eqz v0, :cond_55

    iget-object v0, p0, Lss7;->A:Li53;

    check-cast v0, Lcom/opera/android/bookmarks/h;

    invoke-virtual {v0, v3, v4, v5}, Lcom/opera/android/bookmarks/h;->m(JZ)Lal3;

    move-result-object v0

    check-cast v0, Lml3;

    goto :goto_56

    :cond_55
    move-object v0, v6

    :goto_56
    const-string v3, "show-snackbar"

    const/4 v4, 0x0

    invoke-virtual {p1, v3, v4}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, p0, Lss7;->y:Z

    const-string v3, "dialog-source"

    invoke-virtual {p1, v3}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    move-result p1

    if-eqz p1, :cond_76

    if-eq p1, v5, :cond_73

    const/4 v3, 0x2

    if-ne p1, v3, :cond_6f

    sget-object p1, Lw80;->d:Lw80;

    goto :goto_78

    :cond_6f
    invoke-static {}, Lhai;->d()V

    return-void

    :cond_73
    sget-object p1, Lw80;->c:Lw80;

    goto :goto_78

    :cond_76
    sget-object p1, Lw80;->b:Lw80;

    :goto_78
    iput-object p1, p0, Lss7;->w:Lw80;

    if-nez v0, :cond_9a

    iget-object p1, p0, Lss7;->A:Li53;

    check-cast p1, Lcom/opera/android/bookmarks/h;

    iget-object v0, p1, Lcom/opera/android/bookmarks/h;->j:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v3, "last_folder"

    invoke-interface {v0, v3, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    invoke-virtual {p1, v0, v1, v5}, Lcom/opera/android/bookmarks/h;->m(JZ)Lal3;

    move-result-object p1

    instance-of v0, p1, Lml3;

    if-eqz v0, :cond_99

    move-object v6, p1

    check-cast v6, Lml3;

    :cond_99
    move-object v0, v6

    :cond_9a
    if-nez v0, :cond_a4

    iget-object p1, p0, Lss7;->A:Li53;

    check-cast p1, Lcom/opera/android/bookmarks/h;

    invoke-virtual {p1}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v0

    :cond_a4
    iget-object p1, p0, Lss7;->B:Lml3;

    if-eq p1, v0, :cond_bf

    if-eqz p1, :cond_ac

    iput-boolean v5, p0, Lss7;->z:Z

    :cond_ac
    iput-object v0, p0, Lss7;->B:Lml3;

    iget-object p1, p0, Lss7;->A:Li53;

    check-cast p1, Lcom/opera/android/bookmarks/h;

    invoke-virtual {p1}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object p1

    invoke-static {v0, p1}, Lqm3;->a(Lml3;Lcom/opera/android/bookmarks/c;)Lqm3;

    move-result-object p1

    iput-object p1, p0, Lss7;->C:Lqm3;

    invoke-virtual {p0}, Lss7;->P0()V

    :cond_bf
    return-void
.end method

.method public final onDestroyView()V
    .registers 3

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {v0}, Lq9n;->v(Landroid/view/Window;)Z

    iget-object v0, p0, Lss7;->A:Li53;

    iget-object v1, p0, Lss7;->r:Ldl3;

    invoke-virtual {v0, v1}, Li53;->f(Lql3;)V

    invoke-super {p0}, Lltl;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Lss7;->t:Lcr2;

    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 12

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a02c9

    const/4 v1, 0x1

    if-ne p1, v0, :cond_6c

    iget-object p1, p0, Lss7;->v:Lal3;

    if-nez p1, :cond_f

    return v1

    :cond_f
    iget-object p1, p0, Lss7;->x:Lole;

    if-eqz p1, :cond_6c

    iput-boolean v1, p0, Lss7;->z:Z

    iget-object p1, p1, Lole;->a:Ljava/lang/Object;

    check-cast p1, Lul3;

    iget-object v0, p1, Lul3;->i:Lcom/opera/android/undo/UndoBar;

    const/4 v2, 0x0

    if-nez v0, :cond_43

    iget-object v0, p1, Lul3;->d:Lcom/opera/android/Lazy;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnkm;

    iget-object v3, p1, Lul3;->e:Lgx3;

    invoke-virtual {v3}, Lgx3;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lqim;

    iget-object v3, v3, Lqim;->e:Lysj;

    new-instance v6, Lrl3;

    invoke-direct {v6, v3, v2}, Lrl3;-><init>(Lysj;B)V

    iget-object v7, p1, Lul3;->a:Lin3;

    new-instance v4, Lcom/opera/android/undo/UndoBar;

    iget-object v5, v0, Lnkm;->a:Lhjf;

    const/4 v9, 0x1

    move-object v8, v7

    invoke-direct/range {v4 .. v9}, Lcom/opera/android/undo/UndoBar;-><init>(Landroid/app/Activity;Lvwh;Llkm;Lkkm;Z)V

    iput-object v4, p1, Lul3;->i:Lcom/opera/android/undo/UndoBar;

    move-object v0, v4

    :cond_43
    iget p1, v0, Lcom/opera/android/undo/UndoBar;->h:I

    const v3, 0x7f140376

    if-eq p1, v3, :cond_4f

    iput v3, v0, Lcom/opera/android/undo/UndoBar;->h:I

    invoke-virtual {v0}, Lcom/opera/android/undo/UndoBar;->f()V

    :cond_4f
    iget-object p1, p0, Lss7;->v:Lal3;

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v1}, Ljava/util/ArrayList;-><init>(I)V

    aget-object p1, p1, v2

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/opera/android/undo/UndoBar;->c(Ljava/util/List;)V

    invoke-virtual {p0}, Lryl;->g0()V

    :cond_6c
    return v1
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 4

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p1, p0, Lss7;->v:Lal3;

    if-nez p1, :cond_a

    invoke-virtual {p0}, Lss7;->N0()V

    :cond_a
    iget-object p1, p0, Lss7;->t:Lcr2;

    iget-object p2, p1, Lcr2;->e:Landroid/view/View;

    check-cast p2, Lcom/google/android/material/textfield/TextInputLayout;

    const/4 v0, 0x1

    iput-boolean v0, p2, Lcom/google/android/material/textfield/TextInputLayout;->x0:Z

    iget-object p1, p1, Lcr2;->c:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/textfield/TextInputLayout;

    iput-boolean v0, p1, Lcom/google/android/material/textfield/TextInputLayout;->x0:Z

    invoke-virtual {p0}, Lss7;->P0()V

    iget-object p1, p0, Lss7;->t:Lcr2;

    iget-object p1, p1, Lcr2;->d:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    iget-object p2, p0, Lss7;->s:Lmj2;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    iget-object p0, p0, Lss7;->t:Lcr2;

    iget-object p0, p0, Lcr2;->f:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p0, p2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    return-void
.end method

.method public final u0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 4

    invoke-static {p1, p2}, Lpq3;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lpq3;

    move-result-object p1

    iput-object p1, p0, Lss7;->u:Lpq3;

    iget-object p1, p1, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    const p2, 0x7f140ee9

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p0, Lss7;->u:Lpq3;

    iget-object p1, p1, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Lrs7;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Lrs7;-><init>(Lss7;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lss7;->u:Lpq3;

    iget-object p1, p1, Lpq3;->c:Lcom/google/android/material/button/MaterialButton;

    const p2, 0x7f1403bf

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p0, Lss7;->u:Lpq3;

    iget-object p1, p1, Lpq3;->c:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Lrs7;

    const/4 v0, 0x2

    invoke-direct {p2, p0, v0}, Lrs7;-><init>(Lss7;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 22

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    const v2, 0x7f0d0098

    const/4 v3, 0x0

    move-object/from16 v4, p1

    invoke-virtual {v4, v2, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v1, 0x7f0a008e

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v7, v4

    check-cast v7, Landroid/widget/LinearLayout;

    if-eqz v7, :cond_e7

    const v1, 0x7f0a008f

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v8, v4

    check-cast v8, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v8, :cond_e7

    const v1, 0x7f0a0090

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v9, v4

    check-cast v9, Landroid/widget/ImageView;

    if-eqz v9, :cond_e7

    const v1, 0x7f0a0091

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v10, v4

    check-cast v10, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v10, :cond_e7

    const v1, 0x7f0a0166

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v11, v4

    check-cast v11, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v11, :cond_e7

    const v1, 0x7f0a05b8

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v12, v4

    check-cast v12, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v12, :cond_e7

    const v1, 0x7f0a05bf

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v13, v4

    check-cast v13, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v13, :cond_e7

    const v1, 0x7f0a080c

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v4, :cond_e7

    const v1, 0x7f0a08d0

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v14, v4

    check-cast v14, Landroid/widget/ImageButton;

    if-eqz v14, :cond_e7

    const v1, 0x7f0a096d

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v15, v4

    check-cast v15, Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;

    if-eqz v15, :cond_e7

    const v1, 0x7f0a06c5

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v16, v4

    check-cast v16, Lcom/opera/android/custom_views/OperaTextInputEditText;

    if-eqz v16, :cond_e7

    const v1, 0x7f0a0ba7

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v17, v4

    check-cast v17, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v17, :cond_e7

    const v1, 0x7f0a0c64

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v18, v4

    check-cast v18, Lcom/opera/android/custom_views/OperaTextInputEditText;

    if-eqz v18, :cond_e7

    new-instance v5, Lcr2;

    move-object v6, v2

    check-cast v6, Landroid/widget/LinearLayout;

    invoke-direct/range {v5 .. v18}, Lcr2;-><init>(Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;Landroidx/constraintlayout/widget/ConstraintLayout;Landroid/widget/ImageView;Lcom/opera/android/custom_views/StylingTextView;Lcom/google/android/material/textfield/TextInputLayout;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/StylingTextView;Landroid/widget/ImageButton;Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;Lcom/opera/android/custom_views/OperaTextInputEditText;Lcom/google/android/material/textfield/TextInputLayout;Lcom/opera/android/custom_views/OperaTextInputEditText;)V

    move-object/from16 v4, v17

    iput-object v5, v0, Lss7;->t:Lcr2;

    iput-boolean v3, v4, Lcom/google/android/material/textfield/TextInputLayout;->x0:Z

    iput-boolean v3, v11, Lcom/google/android/material/textfield/TextInputLayout;->x0:Z

    new-instance v1, Lpc5;

    const/4 v2, 0x5

    invoke-direct {v1, v0, v2}, Lpc5;-><init>(Ljava/lang/Object;B)V

    invoke-static {v12}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v2

    if-eqz v2, :cond_ce

    invoke-static {v2, v12, v1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_ce
    invoke-virtual {v0}, Lss7;->O0()V

    iget-object v1, v0, Lss7;->t:Lcr2;

    iget-object v1, v1, Lcr2;->n:Landroid/view/View;

    check-cast v1, Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;

    new-instance v2, Lrs7;

    invoke-direct {v2, v0, v3}, Lrs7;-><init>(Lss7;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, v0, Lss7;->A:Li53;

    iget-object v0, v0, Lss7;->r:Ldl3;

    invoke-virtual {v1, v0}, Li53;->a(Lql3;)V

    return-void

    :cond_e7
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

.method public final x0(Litd;)V
    .registers 4

    const v0, 0x7f0a02c9

    invoke-virtual {p1, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    if-eqz v1, :cond_17

    invoke-virtual {p1, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iget-object p0, p0, Lss7;->x:Lole;

    if-eqz p0, :cond_13

    const/4 p0, 0x1

    goto :goto_14

    :cond_13
    const/4 p0, 0x0

    :goto_14
    invoke-interface {p1, p0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_17
    return-void
.end method
