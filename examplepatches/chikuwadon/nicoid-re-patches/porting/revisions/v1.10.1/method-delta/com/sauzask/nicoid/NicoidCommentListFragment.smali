.class public Lcom/sauzask/nicoid/NicoidCommentListFragment;
.super Landroidx/fragment/app/Fragment;
.source ""


# instance fields
.field public Y:Landroid/view/View;

.field public Z:Landroid/view/View;

.field public a0:Landroid/app/Activity;

.field public b0:Le/e/a/l3/g;

.field public c0:Le/e/a/v;

.field public d0:Le/e/a/g0;

.field public e0:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/q;",
            ">;"
        }
    .end annotation
.end field

.field public f0:Landroid/widget/ListView;

.field public g0:Le/e/a/r;


# virtual methods
.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 4

    const p2, 0x7f0b0026

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->Z:Landroid/view/View;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->k()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->a0:Landroid/app/Activity;

    invoke-static {p0}, Le/e/a/CommentUi;->ready(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->c0:Le/e/a/v;

    if-eqz p1, :cond_26

    invoke-virtual {p1}, Le/e/a/v;->c()Z

    move-result p1

    if-eqz p1, :cond_26

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->c0:Le/e/a/v;

    invoke-virtual {p1}, Le/e/a/v;->b()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/sauzask/nicoid/NicoidCommentListFragment;->b(Ljava/util/ArrayList;)V

    :cond_26
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->b0:Le/e/a/l3/g;

    instance-of p2, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;

    if-eqz p2, :cond_35

    check-cast p1, Lcom/sauzask/nicoid/NicoidVideoFragment;

    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoFragment;->modernCommentList:Ljava/util/ArrayList;

    if-eqz p1, :cond_35

    invoke-virtual {p0, p1}, Lcom/sauzask/nicoid/NicoidCommentListFragment;->b(Ljava/util/ArrayList;)V

    :cond_35
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->Z:Landroid/view/View;

    return-object p1
.end method

.method public b(Ljava/util/ArrayList;)V
    .registers 2

    invoke-static {p0, p1}, Le/e/a/CommentUi;->list(Ljava/lang/Object;Ljava/util/ArrayList;)V

    return-void
.end method

.method public bNative(Ljava/util/ArrayList;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Le/e/a/q;",
            ">;)V"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->e0:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_11
    :goto_11
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2b

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/q;

    iget-boolean v1, v0, Le/e/a/q;->o:Z

    if-nez v1, :cond_11

    iget-boolean v1, v0, Le/e/a/q;->p:Z

    if-nez v1, :cond_11

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->e0:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_11

    :cond_2b
    new-instance p1, Le/e/a/r;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->a0:Landroid/app/Activity;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->e0:Ljava/util/ArrayList;

    const/4 v2, 0x1

    invoke-direct {p1, v0, v1, v2}, Le/e/a/r;-><init>(Landroid/content/Context;Ljava/util/ArrayList;I)V

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->g0:Le/e/a/r;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->Z:Landroid/view/View;

    const v0, 0x7f0800e5

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ListView;

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->f0:Landroid/widget/ListView;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->f0:Landroid/widget/ListView;

    invoke-virtual {p1}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p1

    if-nez p1, :cond_8b

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->f0:Landroid/widget/ListView;

    .line 1
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->Y:Landroid/view/View;

    if-nez v0, :cond_86

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->a0:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0b0027

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->Y:Landroid/view/View;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->Y:Landroid/view/View;

    const v1, 0x7f080055

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    new-instance v3, Le/e/a/s;

    invoke-direct {v3, p0}, Le/e/a/s;-><init>(Lcom/sauzask/nicoid/NicoidCommentListFragment;)V

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->Y:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    const v1, 0x7f0f00a6

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    invoke-static {v0}, Le/e/a/DynamicTheme;->button(Landroid/widget/Button;)V

    :cond_86
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->Y:Landroid/view/View;

    .line 2
    invoke-virtual {p1, v0}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;)V

    :cond_8b
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->f0:Landroid/widget/ListView;

    invoke-virtual {p1, v2}, Landroid/widget/ListView;->setFastScrollEnabled(Z)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->Z:Landroid/view/View;

    const v0, 0x7f08006b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->e0:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-gtz v0, :cond_b8

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->a0:Landroid/app/Activity;

    const v1, 0x7f0f00b4

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static/range {v0 .. v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_bd

    :cond_b8
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_bd
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->d0:Le/e/a/g0;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->g0:Le/e/a/r;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->f0:Landroid/widget/ListView;

    if-eqz p1, :cond_c9

    .line 3
    iput-object v0, p1, Le/e/a/g0;->l:Le/e/a/r;

    iput-object v1, p1, Le/e/a/g0;->m:Landroid/widget/ListView;

    .line 4
    :cond_c9
    new-instance p1, Lcom/sauzask/nicoid/NicoidCommentListFragment$a;

    invoke-direct {p1, p0}, Lcom/sauzask/nicoid/NicoidCommentListFragment$a;-><init>(Lcom/sauzask/nicoid/NicoidCommentListFragment;)V

    invoke-virtual {v1, p1}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->f0:Landroid/widget/ListView;

    new-instance v0, Lcom/sauzask/nicoid/NicoidCommentListFragment$b;

    invoke-direct {v0, p0}, Lcom/sauzask/nicoid/NicoidCommentListFragment$b;-><init>(Lcom/sauzask/nicoid/NicoidCommentListFragment;)V

    invoke-virtual {p1, v0}, Landroid/widget/ListView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->f0:Landroid/widget/ListView;

    invoke-virtual {p1}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p1

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->f0:Landroid/widget/ListView;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidCommentListFragment;->g0:Le/e/a/r;

    invoke-virtual {p1, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    invoke-static {p0}, Le/e/a/CommentListExtras;->install(Ljava/lang/Object;)V

    return-void
.end method
