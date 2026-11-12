.class public final Lvcj;
.super Ldej;
.source "SourceFile"

# interfaces
.implements Lsni;


# instance fields
.field public final c:Lmej;

.field public final d:Landroid/content/Intent;

.field public final e:Lqn;

.field public final f:Lrii;

.field public final g:Ldt1;

.field public final h:Ldt1;

.field public final i:I

.field public j:Lpt1;

.field public k:Lp1j;


# direct methods
.method public constructor <init>(Lmej;Landroid/content/Intent;Ljava/util/ArrayList;Lqn;Lrii;)V
    .registers 9

    invoke-direct {p0, p1}, Ldej;-><init>(Lmej;)V

    iput-object p1, p0, Lvcj;->c:Lmej;

    iput-object p2, p0, Lvcj;->d:Landroid/content/Intent;

    iput-object p4, p0, Lvcj;->e:Lqn;

    iput-object p5, p0, Lvcj;->f:Lrii;

    new-instance p4, Ldt1;

    invoke-direct {p4}, Ldt1;-><init>()V

    invoke-virtual {p0, p4}, Lvcj;->d(Ldt1;)V

    iput-object p4, p0, Lvcj;->g:Ldt1;

    new-instance p4, Ldt1;

    invoke-direct {p4}, Ldt1;-><init>()V

    invoke-virtual {p0, p4}, Lvcj;->d(Ldt1;)V

    iput-object p4, p0, Lvcj;->h:Ldt1;

    sget-object p4, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-interface {p1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    iget-object p1, p1, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p1, p1, Lxv1;->Q0:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lzcj;

    iget-object p4, p0, Ldej;->b:Lmej;

    invoke-interface {p4}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p4

    invoke-virtual {p4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p4

    const p5, 0x7f0c0082

    invoke-virtual {p4, p5}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p4

    iput p4, p0, Lvcj;->i:I

    iget-object p4, p0, Lvcj;->k:Lp1j;

    const/4 p5, 0x0

    if-eqz p4, :cond_50

    invoke-virtual {p4, p5}, Lp1j;->cancel(Z)Z

    :cond_50
    new-instance p4, Lzzh;

    const/4 v0, 0x7

    invoke-direct {p4, p0, v0}, Lzzh;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p3}, Lzcj;->d(Ljava/util/ArrayList;)Ljava/util/HashMap;

    move-result-object p3

    iget-object v0, p1, Lzcj;->c:Lqie;

    iget-object v1, p1, Lzcj;->b:Lumi;

    new-instance v2, Lycj;

    invoke-direct {v2, p1, p2, p3, p5}, Lycj;-><init>(Lzcj;Landroid/content/Intent;Ljava/util/HashMap;B)V

    invoke-interface {v1, v2}, Ltcl;->b(Lesk;)Lnml;

    move-result-object p1

    new-instance p2, Ltxi;

    const/4 p3, 0x2

    invoke-direct {p2, p4, p3}, Ltxi;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, p2}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p2

    invoke-virtual {p1, p2}, Lnml;->b(Lnml;)V

    new-instance p2, Loml;

    invoke-direct {p2, p1}, Loml;-><init>(Lnml;)V

    const/4 p1, 0x0

    invoke-virtual {v0, p2, p1}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    move-result-object p1

    iput-object p1, p0, Lvcj;->k:Lp1j;

    return-void
.end method


# virtual methods
.method public final Y(Z)V
    .registers 6

    iget-object p1, p0, Ldej;->b:Lmej;

    invoke-interface {p1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0700a7

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iget-object v0, p0, Lvcj;->j:Lpt1;

    const/4 v1, 0x0

    if-nez v0, :cond_17

    move-object v0, v1

    :cond_17
    iget-object v0, v0, Lpt1;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/theme/ThemeableRecyclerView;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    invoke-virtual {v0, p1, v2, p1, v3}, Landroid/view/View;->setPadding(IIII)V

    iget-object p0, p0, Lvcj;->j:Lpt1;

    if-eqz p0, :cond_2b

    move-object v1, p0

    :cond_2b
    iget-object p0, v1, Lpt1;->g:Landroid/view/View;

    check-cast p0, Lcom/opera/android/theme/ThemeableRecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v1

    invoke-virtual {p0, p1, v0, p1, v1}, Landroid/view/View;->setPadding(IIII)V

    return-void
.end method

.method public final a(Landroid/content/Context;)Landroid/view/View;
    .registers 13

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v0, 0x7f0d039a

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const v0, 0x7f0a0514

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Landroid/widget/RelativeLayout;

    if-eqz v5, :cond_f5

    const v0, 0x7f0a0322

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    if-eqz v1, :cond_f5

    const v0, 0x7f0a0a3c

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Lcom/opera/android/theme/ThemeableRecyclerView;

    if-eqz v6, :cond_f5

    const v0, 0x7f0a0a3d

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Lcom/opera/android/theme/ThemeableRecyclerView;

    if-eqz v7, :cond_f5

    const v0, 0x7f0a0a41

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v8, :cond_f5

    const v0, 0x7f0a0a42

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v9, :cond_f5

    new-instance v3, Lpt1;

    move-object v4, p1

    check-cast v4, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    const/16 v10, 0x13

    invoke-direct/range {v3 .. v10}, Lpt1;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/View;Landroid/view/View;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingTextView;B)V

    iput-object v3, p0, Lvcj;->j:Lpt1;

    new-instance p1, Ltk;

    const/4 v0, 0x2

    invoke-direct {p1, p0, v0}, Ltk;-><init>(Ljava/lang/Object;B)V

    iget-object v0, p0, Lvcj;->c:Lmej;

    invoke-interface {v0, p1}, Lmej;->x(Lsni;)V

    iget-object p1, p0, Lvcj;->j:Lpt1;

    if-nez p1, :cond_70

    move-object p1, v2

    :cond_70
    iget-object p1, p1, Lpt1;->f:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/theme/ThemeableRecyclerView;

    iget-object v0, p0, Lvcj;->g:Ldt1;

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    iget v1, p0, Lvcj;->i:I

    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(I)V

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    iget-object p1, p0, Lvcj;->j:Lpt1;

    if-nez p1, :cond_88

    move-object p1, v2

    :cond_88
    iget-object p1, p1, Lpt1;->g:Landroid/view/View;

    check-cast p1, Lcom/opera/android/theme/ThemeableRecyclerView;

    iget-object v0, p0, Lvcj;->h:Ldt1;

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(I)V

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    const-string p1, "android.intent.extra.TITLE"

    iget-object v0, p0, Lvcj;->d:Landroid/content/Intent;

    invoke-virtual {v0, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0}, Locp;->j(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x8

    if-eqz p1, :cond_bc

    invoke-static {p1}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_bc

    iget-object v3, p0, Lvcj;->j:Lpt1;

    if-nez v3, :cond_b4

    move-object v3, v2

    :cond_b4
    iget-object v3, v3, Lpt1;->b:Landroid/view/View;

    check-cast v3, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_c8

    :cond_bc
    iget-object p1, p0, Lvcj;->j:Lpt1;

    if-nez p1, :cond_c1

    move-object p1, v2

    :cond_c1
    iget-object p1, p1, Lpt1;->b:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    :goto_c8
    iget-object p1, p0, Lvcj;->j:Lpt1;

    if-eqz v0, :cond_e1

    if-nez p1, :cond_cf

    move-object p1, v2

    :cond_cf
    iget-object p1, p1, Lpt1;->c:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    new-instance v1, Ldkl;

    invoke-direct {v1, v0}, Ldkl;-><init>(Ljava/lang/String;)V

    new-instance v0, Lwkl;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1, v1, v0}, Lna2;->R(Landroid/widget/TextView;Lcgh;Ledf;)V

    goto :goto_eb

    :cond_e1
    if-nez p1, :cond_e4

    move-object p1, v2

    :cond_e4
    iget-object p1, p1, Lpt1;->e:Ljava/lang/Object;

    check-cast p1, Landroid/widget/RelativeLayout;

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    :goto_eb
    iget-object p0, p0, Lvcj;->j:Lpt1;

    if-eqz p0, :cond_f0

    move-object v2, p0

    :cond_f0
    iget-object p0, v2, Lpt1;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    return-object p0

    :cond_f5
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v2
.end method

.method public final c(Lhjm;)V
    .registers 3

    invoke-super {p0, p1}, Ldej;->c(Lhjm;)V

    iget-object p1, p0, Lvcj;->k:Lp1j;

    if-eqz p1, :cond_e

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lp1j;->cancel(Z)Z

    const/4 p1, 0x0

    iput-object p1, p0, Lvcj;->k:Lp1j;

    :cond_e
    return-void
.end method

.method public final d(Ldt1;)V
    .registers 7

    new-instance v0, Lqcj;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lqcj;-><init>(Lvcj;B)V

    new-instance v1, La3j;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, La3j;-><init>(B)V

    new-instance v2, La3j;

    const/4 v3, 0x4

    invoke-direct {v2, v3}, La3j;-><init>(B)V

    const-class v4, Ltcj;

    invoke-virtual {p1, v4, v0, v1, v2}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    new-instance v0, Lqcj;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lqcj;-><init>(Lvcj;B)V

    new-instance p0, La3j;

    const/4 v1, 0x3

    invoke-direct {p0, v1}, La3j;-><init>(B)V

    new-instance v1, La3j;

    invoke-direct {v1, v3}, La3j;-><init>(B)V

    const-class v2, Lrcj;

    invoke-virtual {p1, v2, v0, p0, v1}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    return-void
.end method
