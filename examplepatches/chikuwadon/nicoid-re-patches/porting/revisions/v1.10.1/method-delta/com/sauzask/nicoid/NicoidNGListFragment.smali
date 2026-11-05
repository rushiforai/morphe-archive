.class public Lcom/sauzask/nicoid/NicoidNGListFragment;
.super Landroidx/fragment/app/Fragment;
.source ""


# instance fields
.field public Y:Landroid/view/View;

.field public Z:Landroid/view/View;

.field public a0:Landroid/app/Activity;

.field public b0:Le/e/a/v;

.field public c0:Le/e/a/g0;

.field public d0:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/h0;",
            ">;"
        }
    .end annotation
.end field

.field public e0:Landroid/widget/ListView;

.field public f0:Le/e/a/i0;


# virtual methods
.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 7

    const/4 p2, 0x0

    const p3, 0x7f0b0026

    invoke-virtual {p1, p3, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidNGListFragment;->Z:Landroid/view/View;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->k()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidNGListFragment;->a0:Landroid/app/Activity;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidNGListFragment;->b0:Le/e/a/v;

    invoke-virtual {p1}, Le/e/a/v;->c()Z

    move-result p1

    if-eqz p1, :cond_a5

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidNGListFragment;->c0:Le/e/a/g0;

    invoke-virtual {p1}, Le/e/a/g0;->b()Ljava/util/ArrayList;

    move-result-object p1

    .line 1
    invoke-virtual {p1}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidNGListFragment;->d0:Ljava/util/ArrayList;

    new-instance p1, Le/e/a/i0;

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidNGListFragment;->a0:Landroid/app/Activity;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidNGListFragment;->d0:Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {p1, p3, v0, v1}, Le/e/a/i0;-><init>(Landroid/content/Context;Ljava/util/ArrayList;I)V

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidNGListFragment;->f0:Le/e/a/i0;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidNGListFragment;->Z:Landroid/view/View;

    const p3, 0x7f0800e5

    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ListView;

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidNGListFragment;->e0:Landroid/widget/ListView;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidNGListFragment;->e0:Landroid/widget/ListView;

    .line 2
    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidNGListFragment;->Y:Landroid/view/View;

    const v0, 0x7f080055

    if-nez p3, :cond_67

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidNGListFragment;->a0:Landroid/app/Activity;

    invoke-virtual {p3}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object p3

    const v2, 0x7f0b0027

    invoke-virtual {p3, v2, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/sauzask/nicoid/NicoidNGListFragment;->Y:Landroid/view/View;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidNGListFragment;->Y:Landroid/view/View;

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    new-instance p3, Le/e/a/l0;

    invoke-direct {p3, p0}, Le/e/a/l0;-><init>(Lcom/sauzask/nicoid/NicoidNGListFragment;)V

    invoke-virtual {p2, p3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_67
    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidNGListFragment;->Y:Landroid/view/View;

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    const p3, 0x7f0f009e

    invoke-virtual {p2, p3}, Landroid/widget/Button;->setText(I)V

    invoke-static {p2}, Le/e/a/FeedbackDev10;->roundButton(Landroid/widget/Button;)V

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidNGListFragment;->Y:Landroid/view/View;

    .line 3
    invoke-virtual {p1, p2}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidNGListFragment;->e0:Landroid/widget/ListView;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidNGListFragment;->f0:Le/e/a/i0;

    invoke-virtual {p1, p2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidNGListFragment;->e0:Landroid/widget/ListView;

    invoke-virtual {p1, v1}, Landroid/widget/ListView;->setFastScrollEnabled(Z)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidNGListFragment;->c0:Le/e/a/g0;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidNGListFragment;->f0:Le/e/a/i0;

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidNGListFragment;->e0:Landroid/widget/ListView;

    .line 4
    iput-object p2, p1, Le/e/a/g0;->j:Le/e/a/i0;

    iput-object p3, p1, Le/e/a/g0;->k:Landroid/widget/ListView;

    .line 5
    new-instance p1, Le/e/a/j0;

    invoke-direct {p1, p0}, Le/e/a/j0;-><init>(Lcom/sauzask/nicoid/NicoidNGListFragment;)V

    invoke-virtual {p3, p1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidNGListFragment;->e0:Landroid/widget/ListView;

    new-instance p2, Le/e/a/k0;

    invoke-direct {p2, p0}, Le/e/a/k0;-><init>(Lcom/sauzask/nicoid/NicoidNGListFragment;)V

    invoke-virtual {p1, p2}, Landroid/widget/ListView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    .line 6
    :cond_a5
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidNGListFragment;->Z:Landroid/view/View;

    invoke-static {p0}, Le/e/a/FeedbackDev10;->installNg(Ljava/lang/Object;)V

    return-object p1
.end method
