.class public final Li0h;
.super Lj83;
.source "SourceFile"


# static fields
.field public static final f:Lcs;


# instance fields
.field public final a:Lgjm;

.field public final b:Lp0h;

.field public final c:Lx5f;

.field public final d:Lxol;

.field public e:Lq5g;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lcs;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lcs;-><init>(B)V

    sput-object v0, Li0h;->f:Lcs;

    return-void
.end method

.method public constructor <init>(Lgjm;Lp0h;Lx5f;)V
    .registers 5

    invoke-direct {p0}, Lj83;-><init>()V

    new-instance v0, Lxol;

    invoke-direct {v0, p0}, Lxol;-><init>(Li0h;)V

    iput-object v0, p0, Li0h;->d:Lxol;

    iput-object p1, p0, Li0h;->a:Lgjm;

    iput-object p2, p0, Li0h;->b:Lp0h;

    iput-object p3, p0, Li0h;->c:Lx5f;

    return-void
.end method


# virtual methods
.method public final f0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 6

    const v0, 0x7f0d034d

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0a02f4

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_48

    const p2, 0x7f0a0600

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v1, :cond_48

    const p2, 0x7f0a06b5

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    if-eqz v2, :cond_48

    const p2, 0x7f0a0828

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v2, :cond_48

    const p2, 0x7f0a06c5

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    if-eqz v2, :cond_48

    new-instance p2, Lq5g;

    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout;

    const/4 v2, 0x2

    invoke-direct {p2, p1, v0, v1, v2}, Lq5g;-><init>(Landroid/view/ViewGroup;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p2, p0, Li0h;->e:Lq5g;

    return-object p1

    :cond_48
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final onDestroyView()V
    .registers 2

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Li0h;->e:Lq5g;

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 5

    invoke-super {p0, p1, p2}, Landroidx/fragment/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p1, p0, Li0h;->b:Lp0h;

    iget-object p1, p1, Lp0h;->h:Lh42;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    new-instance v0, Lqzg;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lqzg;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2, v0}, Lekc;->j(Lndc;Lf7f;)V

    iget-object p1, p0, Li0h;->e:Lq5g;

    iget-object p1, p1, Lq5g;->d:Ljava/lang/Object;

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    new-instance p2, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    invoke-direct {p2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>()V

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    iget-object p1, p0, Li0h;->e:Lq5g;

    iget-object p1, p1, Lq5g;->d:Ljava/lang/Object;

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    iget-object p2, p0, Li0h;->d:Lxol;

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget-object p1, p0, Li0h;->e:Lq5g;

    iget-object p1, p1, Lq5g;->d:Ljava/lang/Object;

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    new-instance p2, Lkkf;

    const/4 v0, 0x5

    invoke-direct {p2, p0, v0}, Lkkf;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p0

    if-nez p0, :cond_43

    return-void

    :cond_43
    invoke-static {p0, p1, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method
