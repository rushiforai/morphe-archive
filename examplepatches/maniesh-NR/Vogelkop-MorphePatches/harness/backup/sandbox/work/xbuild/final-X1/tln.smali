.class public final Ltln;
.super Llj;
.source "SourceFile"


# instance fields
.field public A:Lcom/opera/android/custom_views/FadingRecyclerView;

.field public B:Lqkn;

.field public final C:Lg9l;

.field public final r:Lgjm;

.field public final s:Lqln;

.field public final t:Lonn;

.field public final u:Lcom/opera/android/settings/SettingsManager;

.field public final v:Lysj;

.field public final w:Lorm;

.field public final x:Leej;

.field public final y:Lk3i;

.field public final z:Lx4i;


# direct methods
.method public constructor <init>(Lgjm;Lqln;Lonn;Lcom/opera/android/settings/SettingsManager;Lysj;Lorm;Leej;Lk3i;Lx4i;)V
    .registers 12

    invoke-static {}, Lu7k;->e()Lu7k;

    move-result-object v0

    const v1, 0x7f141450

    invoke-virtual {v0, v1}, Lu7k;->s(I)V

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    iput-object p1, p0, Ltln;->r:Lgjm;

    iput-object p2, p0, Ltln;->s:Lqln;

    iput-object p3, p0, Ltln;->t:Lonn;

    iput-object p4, p0, Ltln;->u:Lcom/opera/android/settings/SettingsManager;

    iput-object p5, p0, Ltln;->v:Lysj;

    iput-object p6, p0, Ltln;->w:Lorm;

    iput-object p7, p0, Ltln;->x:Leej;

    iput-object p8, p0, Ltln;->y:Lk3i;

    iput-object p9, p0, Ltln;->z:Lx4i;

    new-instance p1, Lg9l;

    const/16 p2, 0xe

    invoke-direct {p1, p0, p2}, Lg9l;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Ltln;->C:Lg9l;

    const/16 p0, 0xa

    check-cast p6, Lx5f;

    invoke-virtual {p6, p0}, Lx5f;->S(I)V

    return-void
.end method


# virtual methods
.method public final B0(Landroid/view/LayoutInflater;Lcom/opera/android/custom_views/FadingRecyclerView;)V
    .registers 7

    iput-object p2, p0, Ltln;->A:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {p2}, Landroid/view/View;->getPaddingLeft()I

    move-result p1

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v1, 0x41000000    # 8.0f

    invoke-static {v1, v0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v0

    invoke-virtual {p2}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v1, v3}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v1

    invoke-virtual {p2, p1, v0, v2, v1}, Landroid/view/View;->setPadding(IIII)V

    const/4 p1, 0x0

    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/RecyclerView;->setClipToPadding(Z)V

    new-instance p1, Lsvk;

    const/16 v0, 0x1b

    invoke-direct {p1, p0, v0}, Lsvk;-><init>(Ljava/lang/Object;B)V

    sget-object v0, Lq9n;->c:Ll5b;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object v0

    if-eqz v0, :cond_39

    invoke-static {v0, p2, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_39
    iget-object p1, p0, Ltln;->s:Lqln;

    iget-object v0, p1, Lqln;->f:Lami;

    iget-object v0, v0, Lami;->d:Ljava/lang/Object;

    check-cast v0, Ls14;

    iget-boolean v0, v0, Ls14;->b:Z

    if-nez v0, :cond_55

    invoke-static {p2}, Lw8h;->w(Landroidx/recyclerview/widget/RecyclerView;)V

    iget-object p1, p1, Lqln;->f:Lami;

    new-instance v0, Lnpl;

    const/16 v1, 0x1d

    invoke-direct {v0, p0, p2, v1}, Lnpl;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lami;->r(Ljava/lang/Runnable;)V

    return-void

    :cond_55
    invoke-virtual {p0, p2}, Ltln;->G0(Lcom/opera/android/custom_views/FadingRecyclerView;)V

    return-void
.end method

.method public final G0(Lcom/opera/android/custom_views/FadingRecyclerView;)V
    .registers 16

    new-instance v0, Lqkn;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v6, Lyjn;

    const/16 v2, 0x1a

    invoke-direct {v6, v1, v2}, Ln1;-><init>(Ljava/lang/Object;B)V

    iget-object v8, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    sget-object v11, Lwln;->f:Lwln;

    iget-object v12, p0, Ltln;->y:Lk3i;

    iget-object v13, p0, Ltln;->z:Lx4i;

    iget-object v1, p0, Ltln;->r:Lgjm;

    iget-object v2, p0, Ltln;->s:Lqln;

    iget-object v3, p0, Ltln;->t:Lonn;

    iget-object v4, p0, Ltln;->u:Lcom/opera/android/settings/SettingsManager;

    iget-object v7, p0, Ltln;->v:Lysj;

    iget-object v9, p0, Ltln;->w:Lorm;

    iget-object v10, p0, Ltln;->x:Leej;

    move-object v5, p1

    invoke-direct/range {v0 .. v13}, Lqkn;-><init>(Lgjm;Lqln;Lonn;Lcom/opera/android/settings/SettingsManager;Landroidx/recyclerview/widget/RecyclerView;Ln1;Lysj;Lcom/opera/android/StatusBarDrawingFrameLayout;Lorm;Leej;Lwln;Lk3i;Lx4i;)V

    iput-object v0, p0, Ltln;->B:Lqkn;

    iget-object p1, p0, Ltln;->s:Lqln;

    iget-object p1, p1, Lqln;->f:Lami;

    iget-object p1, p1, Lami;->d:Ljava/lang/Object;

    check-cast p1, Ls14;

    iget-object p1, p1, Ls14;->f:Ljava/lang/Object;

    check-cast p1, Lkze;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v0

    iget-object p0, p0, Ltln;->C:Lg9l;

    invoke-virtual {p1, v0, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method

.method public final onDestroyView()V
    .registers 3

    iget-object v0, p0, Ltln;->A:Lcom/opera/android/custom_views/FadingRecyclerView;

    if-eqz v0, :cond_8

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    :cond_8
    iget-object v0, p0, Ltln;->B:Lqkn;

    if-eqz v0, :cond_f

    invoke-virtual {v0}, Lqkn;->a()V

    :cond_f
    invoke-super {p0}, Lltl;->onDestroyView()V

    return-void
.end method
