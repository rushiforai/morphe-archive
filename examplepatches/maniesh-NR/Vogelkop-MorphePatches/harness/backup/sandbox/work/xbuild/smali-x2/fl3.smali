.class public final Lfl3;
.super Llj;
.source "SourceFile"


# instance fields
.field public A:Ljava/util/ArrayList;

.field public B:Z

.field public final C:Li53;

.field public final D:Ldl3;

.field public final r:Lwx;

.field public s:Ljl3;

.field public t:Lkl3;

.field public u:Lel3;

.field public v:Landroid/content/Context;

.field public w:Lcom/opera/android/custom_views/FadingRecyclerView;

.field public x:Lpq3;

.field public y:Landroid/view/MenuItem;

.field public z:Los1;


# direct methods
.method public constructor <init>(Li53;Lcom/opera/api/Callback;)V
    .registers 5

    new-instance v0, Lwx;

    const/16 v1, 0x11

    invoke-direct {v0, p1, p2, v1}, Lwx;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {}, Lu7k;->e()Lu7k;

    move-result-object p2

    iget-object p2, p2, Lu7k;->a:Ljava/lang/Object;

    check-cast p2, Litl;

    const v1, 0x7f100021

    iput v1, p2, Litl;->b:I

    const/4 v1, 0x1

    iput v1, p2, Litl;->k:I

    invoke-direct {p0, p2}, Lltl;-><init>(Litl;)V

    iput-object v0, p0, Lfl3;->r:Lwx;

    new-instance p2, Ldl3;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Ldl3;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Lfl3;->D:Ldl3;

    iput-object p1, p0, Lfl3;->C:Li53;

    return-void
.end method

.method public static G0(Ljava/util/List;Lml3;I)Landroid/os/Bundle;
    .registers 7

    if-eqz p1, :cond_b

    invoke-interface {p1}, Lal3;->getId()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    goto :goto_d

    :cond_b
    const-string p1, ""

    :goto_d
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_18

    const v0, 0x7f140391

    goto :goto_1b

    :cond_18
    const v0, 0x7f1407b4

    :goto_1b
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    const-string v3, "initial_folder_id"

    invoke-virtual {v2, v3, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "select_button_text"

    invoke-virtual {v2, p1, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    and-int/2addr p2, v1

    const/4 p1, 0x0

    if-eq p2, v1, :cond_2f

    move v1, p1

    :cond_2f
    const-string p2, "folders_only"

    invoke-virtual {v2, p2, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p2

    new-array p2, p2, [J

    :goto_3a
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_4f

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lal3;

    invoke-interface {v0}, Lal3;->getId()J

    move-result-wide v0

    aput-wide v0, p2, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_3a

    :cond_4f
    const-string p0, "folder_exclude_list"

    invoke-virtual {v2, p0, p2}, Landroid/os/BaseBundle;->putLongArray(Ljava/lang/String;[J)V

    return-object v2
.end method


# virtual methods
.method public final B0(Landroid/view/LayoutInflater;Lcom/opera/android/custom_views/FadingRecyclerView;)V
    .registers 4

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lfl3;->v:Landroid/content/Context;

    iput-object p2, p0, Lfl3;->w:Lcom/opera/android/custom_views/FadingRecyclerView;

    new-instance p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    const/4 p1, 0x1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(IZ)V

    invoke-virtual {p2, p0}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    return-void
.end method

.method public final H0()Z
    .registers 2

    iget-object v0, p0, Lfl3;->s:Ljl3;

    iget-object v0, v0, Lll3;->a:Lal3;

    check-cast v0, Lml3;

    invoke-interface {v0}, Lml3;->h()Z

    move-result v0

    if-nez v0, :cond_19

    iget-object v0, p0, Lfl3;->s:Ljl3;

    invoke-virtual {v0}, Ljl3;->f()Ljl3;

    move-result-object v0

    iput-object v0, p0, Lfl3;->s:Ljl3;

    invoke-virtual {p0}, Lfl3;->J0()V

    const/4 p0, 0x1

    return p0

    :cond_19
    const/4 p0, 0x0

    return p0
.end method

.method public final I0(Lll3;)Z
    .registers 4

    iget-object p0, p0, Lfl3;->t:Lkl3;

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    const/4 v0, 0x1

    if-nez p0, :cond_19

    invoke-virtual {p1}, Lll3;->d()I

    move-result p0

    const/4 v1, 0x2

    if-ne p0, v1, :cond_13

    check-cast p1, Ljl3;

    return v0

    :cond_13
    invoke-virtual {p1}, Lll3;->d()I

    move-result p0

    if-eq p0, v0, :cond_1a

    :cond_19
    return v0

    :cond_1a
    const/4 p0, 0x0

    return p0
.end method

.method public final J0()V
    .registers 6

    iget-object v0, p0, Lfl3;->s:Ljl3;

    iget-object v0, v0, Lll3;->a:Lal3;

    check-cast v0, Lml3;

    invoke-interface {v0}, Lml3;->h()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1e

    iget-object v0, p0, Lfl3;->v:Landroid/content/Context;

    const v2, 0x7f080522

    invoke-static {v2, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const v2, 0x7f140387

    invoke-virtual {p0, v2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_41

    :cond_1e
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    iget-object v2, p0, Lfl3;->v:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    const v3, 0x7f040003

    invoke-virtual {v2, v3, v0, v1}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget-object v2, p0, Lfl3;->v:Landroid/content/Context;

    iget v0, v0, Landroid/util/TypedValue;->resourceId:I

    invoke-static {v0, v2}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v2, p0, Lfl3;->s:Ljl3;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v2, v3}, Lll3;->c(Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v2

    :goto_41
    iget-object v3, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    iget-object v4, p0, Lfl3;->v:Landroid/content/Context;

    invoke-static {v4}, Lf03;->v(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v4

    invoke-static {v0, v4}, Lj14;->o0(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    invoke-virtual {v3, v0}, Landroidx/appcompat/widget/Toolbar;->A(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/Toolbar;->D(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lfl3;->u:Lel3;

    iget-object v2, p0, Lfl3;->s:Ljl3;

    invoke-virtual {v0, v2}, Lel3;->H(Ljl3;)V

    iget-object v0, p0, Lfl3;->s:Ljl3;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lfl3;->y:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    iget-object p0, p0, Lfl3;->x:Lpq3;

    iget-object p0, p0, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0, v1}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method

.method public final l0(Z)V
    .registers 3

    invoke-virtual {p0}, Lfl3;->H0()Z

    move-result v0

    if-nez v0, :cond_9

    invoke-super {p0, p1}, Lk24;->l0(Z)V

    :cond_9
    return-void
.end method

.method public final onDestroyView()V
    .registers 3

    iget-object v0, p0, Lfl3;->z:Los1;

    if-eqz v0, :cond_9

    sget-object v1, Lhjm;->b:Lhjm;

    invoke-virtual {v0, v1}, Ld63;->finish(Lhjm;)V

    :cond_9
    invoke-super {p0}, Lltl;->onDestroyView()V

    iget-object v0, p0, Lfl3;->C:Li53;

    iget-object p0, p0, Lfl3;->D:Ldl3;

    invoke-virtual {v0, p0}, Li53;->f(Lql3;)V

    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 3

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a0755

    if-ne p1, v0, :cond_22

    iget-object p1, p0, Lfl3;->z:Los1;

    if-nez p1, :cond_22

    iget-object p1, p0, Lfl3;->v:Landroid/content/Context;

    invoke-static {p1}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object p1

    new-instance v0, Los1;

    invoke-direct {v0, p0}, Los1;-><init>(Lfl3;)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {p1, v0, p0}, Lr22;->b(Ljjm;Lijm;)V

    const/4 p0, 0x1

    return p0

    :cond_22
    const/4 p0, 0x0

    return p0
.end method

.method public final onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4

    invoke-super {p0, p1}, Landroidx/fragment/app/i;->onSaveInstanceState(Landroid/os/Bundle;)V

    iget-object p0, p0, Lfl3;->s:Ljl3;

    iget-object p0, p0, Lll3;->a:Lal3;

    invoke-interface {p0}, Lal3;->getId()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p0

    const-string v0, "initial_folder_id"

    invoke-virtual {p1, v0, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 13

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const-string p1, "initial_folder_id"

    if-nez p2, :cond_10

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireArguments()Landroid/os/Bundle;

    move-result-object p2

    invoke-virtual {p2, p1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_14

    :cond_10
    invoke-virtual {p2, p1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :goto_14
    invoke-static {p1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iget-object p2, p0, Lfl3;->C:Li53;

    move-object v2, p2

    check-cast v2, Lcom/opera/android/bookmarks/h;

    const/4 v3, 0x1

    invoke-virtual {v2, v0, v1, v3}, Lcom/opera/android/bookmarks/h;->m(JZ)Lal3;

    move-result-object v0

    check-cast v0, Lml3;

    const/4 v1, 0x0

    if-eqz v0, :cond_31

    new-instance p1, Ljl3;

    invoke-direct {p1, v0, p2, v3}, Ljl3;-><init>(Lml3;Li53;Z)V

    goto :goto_43

    :cond_31
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    new-instance v4, Lkkj;

    const/4 v8, 0x0

    const-string v7, ""

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Lkkj;-><init>(JLjava/lang/String;Ljava/lang/String;Z)V

    new-instance p1, Ljl3;

    invoke-direct {p1, v4, p2, v1}, Ljl3;-><init>(Lml3;Li53;Z)V

    :goto_43
    iput-object p1, p0, Lfl3;->s:Ljl3;

    iget-boolean v0, p1, Ljl3;->c:Z

    if-nez v0, :cond_55

    invoke-virtual {v2}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object p1

    new-instance v0, Ljl3;

    invoke-direct {v0, p1, p2, v3}, Ljl3;-><init>(Lml3;Li53;Z)V

    iput-object v0, p0, Lfl3;->s:Ljl3;

    move-object p1, v0

    :cond_55
    new-instance p2, Lel3;

    iget-boolean v0, p0, Lfl3;->B:Z

    invoke-direct {p2, p0, p1, v0}, Lel3;-><init>(Lfl3;Ljl3;Z)V

    iput-object p2, p0, Lfl3;->u:Lel3;

    iget-object p1, p0, Lfl3;->w:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    invoke-virtual {p0}, Lfl3;->J0()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string p2, "folder_exclude_list"

    invoke-virtual {p1, p2}, Landroid/os/BaseBundle;->getLongArray(Ljava/lang/String;)[J

    move-result-object p1

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireArguments()Landroid/os/Bundle;

    move-result-object p2

    const-string v0, "folders_only"

    invoke-virtual {p2, v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    iput-boolean p2, p0, Lfl3;->B:Z

    new-instance p2, Ljava/util/ArrayList;

    array-length v0, p1

    invoke-direct {p2, v0}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p2, p0, Lfl3;->A:Ljava/util/ArrayList;

    :goto_84
    array-length p2, p1

    iget-object v0, p0, Lfl3;->C:Li53;

    if-ge v1, p2, :cond_a1

    aget-wide v4, p1, v1

    check-cast v0, Lcom/opera/android/bookmarks/h;

    invoke-virtual {v0, v4, v5, v3}, Lcom/opera/android/bookmarks/h;->m(JZ)Lal3;

    move-result-object p2

    if-eqz p2, :cond_9e

    instance-of v0, p2, Lml3;

    if-eqz v0, :cond_9e

    iget-object v0, p0, Lfl3;->A:Ljava/util/ArrayList;

    check-cast p2, Lml3;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_9e
    add-int/lit8 v1, v1, 0x1

    goto :goto_84

    :cond_a1
    iget-object p0, p0, Lfl3;->D:Ldl3;

    invoke-virtual {v0, p0}, Li53;->a(Lql3;)V

    return-void
.end method

.method public final u0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 5

    invoke-static {p1, p2}, Lpq3;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lpq3;

    move-result-object p1

    iput-object p1, p0, Lfl3;->x:Lpq3;

    iget-object p1, p1, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireArguments()Landroid/os/Bundle;

    move-result-object p2

    const-string v0, "select_button_text"

    const v1, 0x7f1407b4

    invoke-virtual {p2, v0, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p0, Lfl3;->x:Lpq3;

    iget-object p1, p1, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Lx5m;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lx5m;-><init>(Lfl3;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lfl3;->x:Lpq3;

    iget-object p1, p1, Lpq3;->c:Lcom/google/android/material/button/MaterialButton;

    const p2, 0x7f1403bf

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p0, Lfl3;->x:Lpq3;

    iget-object p1, p1, Lpq3;->c:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Lx5m;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Lx5m;-><init>(Lfl3;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final x0(Litd;)V
    .registers 3

    const v0, 0x7f0a0755

    invoke-virtual {p1, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lfl3;->y:Landroid/view/MenuItem;

    return-void
.end method
