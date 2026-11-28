.class public final Le/e/a/MylistRefresh243;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final activity:Lcom/sauzask/nicoid/NicoidMylistGroupActivity;

.field private wrapper:Le/e/a/FeedRefresh209;


# direct methods
.method private constructor <init>(Lcom/sauzask/nicoid/NicoidMylistGroupActivity;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/MylistRefresh243;->activity:Lcom/sauzask/nicoid/NicoidMylistGroupActivity;

    return-void
.end method

.method public static install(Lcom/sauzask/nicoid/NicoidMylistGroupActivity;)V
    .registers 9

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->A:Landroid/widget/ListView;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v2, v1, Landroid/view/ViewGroup;

    if-eqz v2, :cond_2

    check-cast v1, Landroid/view/ViewGroup;

    invoke-static {v0}, Le/e/a/MylistRefresh243;->wrapper(Landroid/view/View;)Le/e/a/FeedRefresh209;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v2

    if-ltz v2, :cond_2

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    new-instance v4, Le/e/a/MylistRefresh243;

    invoke-direct {v4, p0}, Le/e/a/MylistRefresh243;-><init>(Lcom/sauzask/nicoid/NicoidMylistGroupActivity;)V

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :try_start_0
    new-instance v5, Le/e/a/FeedRefresh209;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v5, v6, v0, v4}, Le/e/a/FeedRefresh209;-><init>(Landroid/content/Context;Landroid/view/View;Ljava/lang/Runnable;)V

    iput-object v5, v4, Le/e/a/MylistRefresh243;->wrapper:Le/e/a/FeedRefresh209;

    invoke-virtual {v1, v5, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v7

    iget-object v5, v4, Le/e/a/MylistRefresh243;->wrapper:Le/e/a/FeedRefresh209;

    if-eqz v5, :cond_0

    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    instance-of v6, v5, Landroid/view/ViewGroup;

    if-eqz v6, :cond_1

    check-cast v5, Landroid/view/ViewGroup;

    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_1
    invoke-virtual {v1, v0, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    invoke-static {v7}, Le/e/a/FeedbackFixes;->log(Ljava/lang/Exception;)V

    :cond_2
    return-void
.end method

.method public static stop(Lcom/sauzask/nicoid/NicoidMylistGroupActivity;)V
    .registers 2

    iget-object p0, p0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->A:Landroid/widget/ListView;

    invoke-static {p0}, Le/e/a/MylistRefresh243;->wrapper(Landroid/view/View;)Le/e/a/FeedRefresh209;

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Le/e/a/FeedRefresh209;->setRefreshing(Z)V

    :cond_0
    return-void
.end method

.method public static stopIfDone(Lcom/sauzask/nicoid/NicoidMylistGroupActivity;Z)V
    .registers 2

    if-eqz p1, :cond_0

    invoke-static {p0}, Le/e/a/MylistRefresh243;->stop(Lcom/sauzask/nicoid/NicoidMylistGroupActivity;)V

    :cond_0
    return-void
.end method

.method private static wrapper(Landroid/view/View;)Le/e/a/FeedRefresh209;
    .registers 3

    :goto_0
    if-eqz p0, :cond_1

    instance-of v0, p0, Le/e/a/FeedRefresh209;

    if-eqz v0, :cond_0

    check-cast p0, Le/e/a/FeedRefresh209;

    return-object p0

    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v0, v1, Landroid/view/View;

    if-eqz v0, :cond_1

    move-object p0, v1

    check-cast p0, Landroid/view/View;

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public run()V
    .registers 4

    iget-object v0, p0, Le/e/a/MylistRefresh243;->activity:Lcom/sauzask/nicoid/NicoidMylistGroupActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Le/e/a/MylistRefresh243;->wrapper:Le/e/a/FeedRefresh209;

    invoke-virtual {v1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidMylistGroupActivity;->D:Le/e/a/i2;

    if-eqz v1, :cond_0

    iget-boolean v2, v1, Le/e/a/i2;->e:Z

    if-nez v2, :cond_0

    invoke-static {}, Le/e/a/PageCache;->refresh()V

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v2, v2}, Le/e/a/i2;->a(ILjava/util/ArrayList;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-static {v0}, Le/e/a/MylistRefresh243;->stop(Lcom/sauzask/nicoid/NicoidMylistGroupActivity;)V

    return-void
.end method
