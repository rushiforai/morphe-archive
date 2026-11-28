.class Le/e/a/TabSearch228$1;
.super Landroid/content/ContextWrapper;
.source "TabSearch228.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/TabSearch228;->open(Le/e/a/MultiTabs227$Host;Le/e/a/SavedTabs227$Tab;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field accepted:Z

.field private final synthetic val$existing:Le/e/a/SavedTabs227$Tab;

.field private final synthetic val$ref:Ljava/lang/ref/WeakReference;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/ref/WeakReference;Le/e/a/SavedTabs227$Tab;)V
    .registers 4

    .line 9
    iput-object p2, p0, Le/e/a/TabSearch228$1;->val$ref:Ljava/lang/ref/WeakReference;

    iput-object p3, p0, Le/e/a/TabSearch228$1;->val$existing:Le/e/a/SavedTabs227$Tab;

    invoke-direct {p0, p1}, Landroid/content/ContextWrapper;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public startActivity(Landroid/content/Intent;)V
    .registers 8

    .line 11
    iget-object v0, p0, Le/e/a/TabSearch228$1;->val$ref:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/MultiTabs227$Host;

    iget-boolean v1, p0, Le/e/a/TabSearch228$1;->accepted:Z

    if-nez v1, :cond_7

    if-eqz v0, :cond_7

    iget-object v1, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_7

    invoke-static {}, Le/e/a/MultiTabs227;->enabled()Z

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_2

    .line 12
    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    if-nez v1, :cond_1

    invoke-super {p0, p1}, Landroid/content/ContextWrapper;->startActivity(Landroid/content/Intent;)V

    return-void

    :cond_1
    const/4 v1, 0x1

    iput-boolean v1, p0, Le/e/a/TabSearch228$1;->accepted:Z

    .line 13
    iget-object v2, p0, Le/e/a/TabSearch228$1;->val$existing:Le/e/a/SavedTabs227$Tab;

    if-nez v2, :cond_2

    new-instance v2, Le/e/a/SavedTabs227$Tab;

    invoke-direct {v2}, Le/e/a/SavedTabs227$Tab;-><init>()V

    goto :goto_0

    :cond_2
    iget-object v2, p0, Le/e/a/TabSearch228$1;->val$existing:Le/e/a/SavedTabs227$Tab;

    :goto_0
    invoke-virtual {p1}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Le/e/a/SavedTabs227$Tab;->url:Ljava/lang/String;

    const/4 v3, 0x0

    iput v3, v2, Le/e/a/SavedTabs227$Tab;->kind:I

    const-string v4, "list"

    iput-object v4, v2, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    const-string v4, "type"

    invoke-virtual {p1, v4, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    iput v4, v2, Le/e/a/SavedTabs227$Tab;->type:I

    iput v3, v2, Le/e/a/SavedTabs227$Tab;->position:I

    iput v3, v2, Le/e/a/SavedTabs227$Tab;->top:I

    .line 14
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    const-string v4, "keyword"

    invoke-virtual {p1, v4}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_3

    const-string v4, "tag"

    invoke-virtual {p1, v4}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :cond_3
    if-nez v4, :cond_4

    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v4

    :cond_4
    if-nez v4, :cond_5

    const-string/jumbo v4, "\u691c\u7d22"

    :cond_5
    iput-object v4, v2, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    .line 15
    iget-object p1, p0, Le/e/a/TabSearch228$1;->val$existing:Le/e/a/SavedTabs227$Tab;

    if-nez p1, :cond_6

    invoke-virtual {v0, v2}, Le/e/a/MultiTabs227$Host;->addTab(Le/e/a/SavedTabs227$Tab;)V

    goto :goto_1

    :cond_6
    iget p1, v0, Le/e/a/MultiTabs227$Host;->generation:I

    add-int/2addr p1, v1

    iput p1, v0, Le/e/a/MultiTabs227$Host;->generation:I

    iget-object p1, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {p1}, Le/e/a/TabPager233;->destroy(Landroid/app/Activity;)V

    sget-object p1, Le/e/a/TabPreview235;->CACHE:Landroid/util/LruCache;

    iget-object v1, v2, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/util/LruCache;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, v2, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {v0, p1}, Le/e/a/MultiTabs227$Host;->removePage(Ljava/lang/String;)V

    :try_start_0
    iget-object p1, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const-string v1, "i"

    new-array v4, v3, [Ljava/lang/Class;

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {p1, v1, v4, v5}, Le/e/a/MultiTabs227;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    const-string v1, "n"

    new-array v4, v3, [Ljava/lang/Class;

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p1, v1, v4, v3}, Le/e/a/MultiTabs227;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, v2, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {v0, p1}, Le/e/a/MultiTabs227$Host;->activate(Ljava/lang/String;)V

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object p1

    iget-object v1, v2, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    iput-object v1, p1, Le/e/a/SavedTabs227;->selected:Ljava/lang/String;

    invoke-static {}, Le/e/a/MultiTabs227;->save()V

    invoke-virtual {v0}, Le/e/a/MultiTabs227$Host;->bar()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    const-string v0, "nicoid-tabs"

    const-string v1, "Cannot reload edited search"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 16
    :goto_1
    return-void

    .line 11
    :cond_7
    :goto_2
    return-void
.end method
