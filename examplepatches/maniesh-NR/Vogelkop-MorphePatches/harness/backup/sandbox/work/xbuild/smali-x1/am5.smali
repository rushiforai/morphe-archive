.class public Lam5;
.super Llj;
.source "SourceFile"


# instance fields
.field public r:Lxl5;

.field public s:Lbf9;


# direct methods
.method public constructor <init>()V
    .registers 3

    const v0, 0x7f1404ab

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Llj;-><init>(II)V

    return-void
.end method


# virtual methods
.method public final onDestroyView()V
    .registers 3

    iget-object v0, p0, Lam5;->s:Lbf9;

    iget-object v1, p0, Lam5;->r:Lxl5;

    invoke-virtual {v0, v1}, Lbf9;->D(Lhxl;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lam5;->s:Lbf9;

    iput-object v0, p0, Lam5;->r:Lxl5;

    invoke-super {p0}, Lltl;->onDestroyView()V

    return-void
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 5

    const v0, 0x7f0d00d3

    invoke-virtual {p1, v0, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0a08c0

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    new-instance p2, Lxl5;

    invoke-direct {p2, p0}, Lxl5;-><init>(Lam5;)V

    iput-object p2, p0, Lam5;->r:Lxl5;

    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/d;->setHasStableIds(Z)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p2

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/opera/android/OperaApplication;

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->s()Lbf9;

    move-result-object p2

    iput-object p2, p0, Lam5;->s:Lbf9;

    iget-object v1, p0, Lam5;->r:Lxl5;

    invoke-virtual {p2, v1}, Lbf9;->b(Lhxl;)V

    iget-object p2, p0, Lam5;->r:Lxl5;

    invoke-virtual {p2}, Lxl5;->G()V

    new-instance p2, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    const/4 v1, 0x0

    invoke-direct {p2, v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(IZ)V

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    iget-object p0, p0, Lam5;->r:Lxl5;

    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    return-void
.end method
