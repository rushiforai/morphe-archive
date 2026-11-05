.class public Lcom/sauzask/nicoid/NicoidUserVideoListFragment$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->b(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;

.field public final synthetic b:Lcom/sauzask/nicoid/NicoidUserVideoListFragment;


# virtual methods
.method public run()V
    .registers 4

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment$b;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_3c

    :try_start_8
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment$b;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_22

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment$b;->b:Lcom/sauzask/nicoid/NicoidUserVideoListFragment;

    .line 1
    iget-object v2, v2, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->g0:Ljava/util/ArrayList;

    .line 2
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_e

    :cond_22
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment$b;->b:Lcom/sauzask/nicoid/NicoidUserVideoListFragment;

    .line 3
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->Y:Landroid/view/View;

    const v1, 0x7f0800e8

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 4
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment$b;->b:Lcom/sauzask/nicoid/NicoidUserVideoListFragment;

    .line 5
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->e0:Le/e/a/x0;

    .line 6
    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_3b} :catch_53

    goto :goto_53

    :cond_3c
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment$b;->b:Lcom/sauzask/nicoid/NicoidUserVideoListFragment;

    .line 7
    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->b0:Landroid/app/Activity;

    const v2, 0x7f0f021e

    .line 8
    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/sauzask/nicoid/NicoidUserVideoListFragment;->a(Ljava/lang/String;Ljava/lang/Boolean;)V

    :catch_53
    :goto_53
    invoke-static {p0}, Le/e/a/MylistFollow190;->userFolders(Ljava/lang/Object;)V

    return-void
.end method
