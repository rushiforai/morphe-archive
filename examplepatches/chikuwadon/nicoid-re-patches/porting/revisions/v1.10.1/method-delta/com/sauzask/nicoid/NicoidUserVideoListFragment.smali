.class public Lcom/sauzask/nicoid/NicoidUserVideoListFragment;
.super Landroidx/fragment/app/Fragment;
.source ""


# instance fields
.field public Y:Landroid/view/View;

.field public Z:Ljava/lang/String;

.field public a0:Ljava/lang/String;

.field public b0:Landroid/app/Activity;

.field public c0:Le/e/a/l3/g;

.field public d0:Landroid/widget/ListView;

.field public e0:Le/e/a/x0;

.field public f0:Landroid/os/Handler;

.field public g0:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field public h0:Z


# virtual methods
.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 7

    const/4 p2, 0x0

    const p3, 0x7f0b006e

    invoke-virtual {p1, p3, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->Y:Landroid/view/View;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->k()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->b0:Landroid/app/Activity;

    .line 1
    iget-object p1, p0, Landroidx/fragment/app/Fragment;->f:Landroid/os/Bundle;

    const-string v0, "url"

    .line 2
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->Z:Ljava/lang/String;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->Z:Ljava/lang/String;

    const-string v0, "^.+?/user/([0-9]+)[^$]*"

    const-string v1, "$1"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->a0:Ljava/lang/String;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->b0:Landroid/app/Activity;

    const-string v0, "layout_inflater"

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/LayoutInflater;

    invoke-virtual {p1, p3, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->Y:Landroid/view/View;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->Y:Landroid/view/View;

    invoke-static {p1}, Le/e/a/DynamicTheme;->background(Landroid/view/View;)V

    new-instance p1, Le/e/a/x0;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->b0:Landroid/app/Activity;

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->g0:Ljava/util/ArrayList;

    const/4 v0, 0x1

    invoke-direct {p1, p2, p3, v0}, Le/e/a/x0;-><init>(Landroid/content/Context;Ljava/util/ArrayList;I)V

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->e0:Le/e/a/x0;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->Y:Landroid/view/View;

    const p2, 0x7f0800e5

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ListView;

    iput-object p1, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->d0:Landroid/widget/ListView;

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->d0:Landroid/widget/ListView;

    iget-object p2, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->e0:Le/e/a/x0;

    invoke-virtual {p1, p2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->d0:Landroid/widget/ListView;

    new-instance p2, Lcom/sauzask/nicoid/NicoidUserVideoListFragment$a;

    invoke-direct {p2, p0}, Lcom/sauzask/nicoid/NicoidUserVideoListFragment$a;-><init>(Lcom/sauzask/nicoid/NicoidUserVideoListFragment;)V

    invoke-virtual {p1, p2}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->g0:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ge p1, v0, :cond_100

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->a0:Ljava/lang/String;

    const/4 p2, 0x0

    .line 3
    iput-boolean p2, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->h0:Z

    :try_start_72
    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->b0:Landroid/app/Activity;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    const-string v2, "com.sauzask.nicoid.NicoidUserVideoListActivity"

    invoke-virtual {v1, v2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    if-ne p3, v1, :cond_8f

    iput-boolean v0, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->h0:Z
    :try_end_8a
    .catch Ljava/lang/ClassNotFoundException; {:try_start_72 .. :try_end_8a} :catch_8b

    goto :goto_8f

    :catch_8b
    move-exception p3

    invoke-virtual {p3}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    :cond_8f
    :goto_8f
    iget-boolean p3, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->h0:Z

    if-nez p3, :cond_a3

    iget-object p3, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->Y:Landroid/view/View;

    const v0, 0x7f0801b7

    invoke-virtual {p3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/LinearLayout;

    const/16 v0, 0x8

    invoke-virtual {p3, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    :cond_a3
    const-string p3, "user/"

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->b0:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "uploader_name"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_ca

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_ca

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    :cond_ca
    invoke-static {p3, p1}, Le/b/a/a/a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 4
    iget-boolean v0, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->h0:Z

    if-eqz v0, :cond_dc

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->b0:Landroid/app/Activity;

    check-cast v0, Lcom/sauzask/nicoid/NicoidUserVideoListActivity;

    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidUserVideoListActivity;->y:Landroidx/appcompat/app/ActionBar;

    invoke-virtual {v0, p3}, Landroidx/appcompat/app/ActionBar;->b(Ljava/lang/CharSequence;)V

    goto :goto_ea

    :cond_dc
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->Y:Landroid/view/View;

    const v1, 0x7f080074

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 5
    :goto_ea
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    const-string p3, ""

    invoke-virtual {p0, p3, p2}, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->a(Ljava/lang/String;Ljava/lang/Boolean;)V

    new-instance p2, Ljava/lang/Thread;

    new-instance p3, Le/e/a/z0;

    invoke-direct {p3, p0, p1}, Le/e/a/z0;-><init>(Lcom/sauzask/nicoid/NicoidUserVideoListFragment;Ljava/lang/String;)V

    invoke-direct {p2, p3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p2}, Ljava/lang/Thread;->start()V

    .line 6
    :cond_100
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->Y:Landroid/view/View;

    return-object p1
.end method
