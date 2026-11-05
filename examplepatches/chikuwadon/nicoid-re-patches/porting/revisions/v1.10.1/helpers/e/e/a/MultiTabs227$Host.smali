.class final Le/e/a/MultiTabs227$Host;
.super Ljava/lang/Object;
.source "MultiTabs227.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/MultiTabs227;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Host"
.end annotation


# instance fields
.field final a:Landroid/app/Activity;

.field bar:Landroid/view/View;

.field barKey:Ljava/lang/String;

.field body:Landroid/view/View;

.field bodyParams:Landroid/view/ViewGroup$LayoutParams;

.field current:Ljava/lang/Object;

.field currentId:Ljava/lang/String;

.field frame:I

.field generation:I

.field orientation:I

.field final pages:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field parent:Landroid/widget/LinearLayout;

.field preserveStrip:Z

.field restoreSelection:Z

.field started:Z

.field strip:Landroid/widget/LinearLayout;

.field stripX:I

.field tabScroll:Landroid/widget/HorizontalScrollView;


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v0, Ljava/util/LinkedHashMap;

    const/4 v1, 0x4

    const/high16 v2, 0x3f400000    # 0.75f

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    iput-object v0, p0, Le/e/a/MultiTabs227$Host;->pages:Ljava/util/LinkedHashMap;

    .line 41
    iput-object p1, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {p1}, Le/e/a/MultiTabs227;->lists(Landroid/app/Activity;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_91

    const-string v0, "F"

    invoke-static {p1, v0}, Le/e/a/MultiTabs227;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Le/e/a/MultiTabs227$Host;->current:Ljava/lang/Object;

    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->current:Ljava/lang/Object;

    new-array v2, v1, [Ljava/lang/Class;

    new-array v4, v1, [Ljava/lang/Object;

    const-string v5, "V"

    invoke-static {v0, v5, v2, v4}, Le/e/a/MultiTabs227;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_89

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Landroid/view/View;

    if-eqz v2, :cond_89

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v0

    iput v0, p0, Le/e/a/MultiTabs227$Host;->frame:I

    sget-object v0, Le/e/a/MultiTabs227;->listHost:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    sget-object v2, Le/e/a/MultiTabs227;->HOSTS:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/MultiTabs227$Host;

    if-eqz v2, :cond_81

    if-eq v0, p1, :cond_81

    new-instance v0, Ljava/util/ArrayList;

    iget-object v4, v2, Le/e/a/MultiTabs227$Host;->pages:Ljava/util/LinkedHashMap;

    invoke-virtual {v4}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_66
    :goto_66
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_6d

    goto :goto_81

    :cond_6d
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iget-object v5, v2, Le/e/a/MultiTabs227$Host;->pages:Ljava/util/LinkedHashMap;

    invoke-virtual {v5, v4}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    iget-object v6, v2, Le/e/a/MultiTabs227$Host;->current:Ljava/lang/Object;

    if-eq v5, v6, :cond_66

    invoke-virtual {v2, v4}, Le/e/a/MultiTabs227$Host;->removePage(Ljava/lang/String;)V

    goto :goto_66

    :cond_81
    :goto_81
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Le/e/a/MultiTabs227;->listHost:Ljava/lang/ref/WeakReference;

    goto :goto_91

    :cond_89
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "List Fragment not ready"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_91
    :goto_91
    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v0

    iget-object v0, v0, Le/e/a/SavedTabs227;->selected:Ljava/lang/String;

    sget-boolean v2, Le/e/a/MultiTabs227;->restoreFirstHost:Z

    const-string v4, "nicoid_saved_tab_id"

    if-eqz v2, :cond_a8

    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_a8

    goto :goto_a9

    :cond_a8
    const/4 v3, 0x0

    :goto_a9
    iput-boolean v3, p0, Le/e/a/MultiTabs227$Host;->restoreSelection:Z

    sput-boolean v1, Le/e/a/MultiTabs227;->restoreFirstHost:Z

    invoke-static {p1}, Le/e/a/MultiTabs227;->describe(Landroid/app/Activity;)Le/e/a/SavedTabs227$Tab;

    move-result-object v1

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v2

    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v3, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Le/e/a/SavedTabs227;->find(Ljava/lang/String;)Le/e/a/SavedTabs227$Tab;

    move-result-object v2

    if-nez v2, :cond_c7

    invoke-static {v1}, Le/e/a/MultiTabs227;->match(Le/e/a/SavedTabs227$Tab;)Le/e/a/SavedTabs227$Tab;

    move-result-object v2

    :cond_c7
    if-nez v2, :cond_e1

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v2

    iget-object v2, v2, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/16 v3, 0x40

    if-lt v2, v3, :cond_d9

    const/4 v1, 0x0

    goto :goto_e2

    :cond_d9
    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v2

    invoke-virtual {v2, v1}, Le/e/a/SavedTabs227;->add(Le/e/a/SavedTabs227$Tab;)V

    goto :goto_e2

    :cond_e1
    move-object v1, v2

    :goto_e2
    if-nez v1, :cond_e7

    const-string v1, ""

    goto :goto_e9

    :cond_e7
    iget-object v1, v1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    :goto_e9
    iput-object v1, p0, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->current:Ljava/lang/Object;

    if-eqz v1, :cond_f8

    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->pages:Ljava/util/LinkedHashMap;

    iget-object v2, p0, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    iget-object v3, p0, Le/e/a/MultiTabs227$Host;->current:Ljava/lang/Object;

    invoke-virtual {v1, v2, v3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_f8
    iget-boolean v1, p0, Le/e/a/MultiTabs227$Host;->restoreSelection:Z

    if-eqz v1, :cond_10d

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v1

    invoke-virtual {v1, v0}, Le/e/a/SavedTabs227;->find(Ljava/lang/String;)Le/e/a/SavedTabs227$Tab;

    move-result-object v1

    if-eqz v1, :cond_10d

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v1

    iput-object v0, v1, Le/e/a/SavedTabs227;->selected:Ljava/lang/String;

    goto :goto_115

    :cond_10d
    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v0

    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    iput-object v1, v0, Le/e/a/SavedTabs227;->selected:Ljava/lang/String;

    :goto_115
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    invoke-virtual {p1, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {}, Le/e/a/MultiTabs227;->save()V

    return-void
.end method


# virtual methods
.method actions(Le/e/a/SavedTabs227$Tab;)V
    .registers 2

    .line 51
    invoke-static {p0, p1}, Le/e/a/TabPlayback110;->actions(Le/e/a/MultiTabs227$Host;Le/e/a/SavedTabs227$Tab;)V

    return-void
.end method

.method activate(Ljava/lang/String;)V
    .registers 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 57
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v2

    invoke-virtual {v2, v1}, Le/e/a/SavedTabs227;->find(Ljava/lang/String;)Le/e/a/SavedTabs227$Tab;

    move-result-object v2

    if-nez v2, :cond_f

    return-void

    :cond_f
    const-string v3, "list"

    iget-object v4, v2, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1f6

    iget-object v3, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {v3}, Le/e/a/MultiTabs227;->lists(Landroid/app/Activity;)Z

    move-result v3

    if-nez v3, :cond_23

    goto/16 :goto_1f6

    :cond_23
    iget-object v3, v0, Le/e/a/MultiTabs227$Host;->pages:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const/4 v4, 0x0

    const-string v5, "V"

    const/4 v6, 0x0

    if-eqz v3, :cond_3d

    new-array v7, v6, [Ljava/lang/Class;

    new-array v8, v6, [Ljava/lang/Object;

    invoke-static {v3, v5, v7, v8}, Le/e/a/MultiTabs227;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-nez v7, :cond_3d

    invoke-virtual/range {p0 .. p1}, Le/e/a/MultiTabs227$Host;->removePage(Ljava/lang/String;)V

    move-object v3, v4

    :cond_3d
    iget-object v7, v0, Le/e/a/MultiTabs227$Host;->current:Ljava/lang/Object;

    if-ne v3, v7, :cond_6a

    if-eqz v3, :cond_6a

    new-array v7, v6, [Ljava/lang/Class;

    new-array v8, v6, [Ljava/lang/Object;

    invoke-static {v3, v5, v7, v8}, Le/e/a/MultiTabs227;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_6a

    iput-object v1, v0, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    new-array v4, v6, [Ljava/lang/Class;

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v3, v5, v4, v6}, Le/e/a/MultiTabs227;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    invoke-static {v3}, Le/e/a/TabRecovery244;->present(Landroid/view/View;)V

    iget-object v3, v0, Le/e/a/MultiTabs227$Host;->current:Ljava/lang/Object;

    invoke-static {v3, v2}, Le/e/a/TabChrome228;->restore(Ljava/lang/Object;Le/e/a/SavedTabs227$Tab;)V

    invoke-virtual/range {p0 .. p0}, Le/e/a/MultiTabs227$Host;->bar()V

    iget-object v2, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {v2, v1}, Le/e/a/PlaybackNavigation114;->browsed(Landroid/app/Activity;Ljava/lang/String;)V

    return-void

    :cond_6a
    iget-object v7, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    new-array v8, v6, [Ljava/lang/Class;

    new-array v9, v6, [Ljava/lang/Object;

    const-string v10, "i"

    invoke-static {v7, v10, v8, v9}, Le/e/a/MultiTabs227;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    new-array v8, v6, [Ljava/lang/Class;

    new-array v9, v6, [Ljava/lang/Object;

    const-string v10, "a"

    invoke-static {v7, v10, v8, v9}, Le/e/a/MultiTabs227;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    iget-object v9, v0, Le/e/a/MultiTabs227$Host;->current:Ljava/lang/Object;

    if-eqz v9, :cond_8f

    iget-object v9, v0, Le/e/a/MultiTabs227$Host;->current:Ljava/lang/Object;

    invoke-virtual {v0, v9}, Le/e/a/MultiTabs227$Host;->clearSelection(Ljava/lang/Object;)V

    const/4 v9, 0x4

    iget-object v11, v0, Le/e/a/MultiTabs227$Host;->current:Ljava/lang/Object;

    invoke-virtual {v0, v8, v9, v11}, Le/e/a/MultiTabs227$Host;->op(Ljava/lang/Object;ILjava/lang/Object;)V

    :cond_8f
    const/4 v9, 0x1

    if-nez v3, :cond_94

    const/4 v11, 0x1

    goto :goto_95

    :cond_94
    const/4 v11, 0x0

    :goto_95
    const/4 v12, 0x3

    if-eqz v11, :cond_12a

    const-string v3, "com.sauzask.nicoid.NicoidVideoListFragment"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    new-array v13, v6, [Ljava/lang/Class;

    invoke-virtual {v3, v13}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v3

    new-array v13, v6, [Ljava/lang/Object;

    invoke-virtual {v3, v13}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    new-instance v13, Landroid/os/Bundle;

    invoke-direct {v13}, Landroid/os/Bundle;-><init>()V

    const-string v14, "url"

    iget-object v15, v2, Le/e/a/SavedTabs227$Tab;->url:Ljava/lang/String;

    invoke-virtual {v13, v14, v15}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v14, "type"

    iget v15, v2, Le/e/a/SavedTabs227$Tab;->type:I

    invoke-virtual {v13, v14, v15}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v14, "folderid"

    iget v15, v2, Le/e/a/SavedTabs227$Tab;->folder:I

    invoke-virtual {v13, v14, v15}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v14, "name"

    iget-object v15, v2, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    invoke-virtual {v13, v14, v15}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v14, "item"

    iget-object v15, v2, Le/e/a/SavedTabs227$Tab;->item:Ljava/lang/String;

    invoke-virtual {v13, v14, v15}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v14, "subtitle"

    iget-object v15, v2, Le/e/a/SavedTabs227$Tab;->subtitle:Ljava/lang/String;

    invoke-virtual {v13, v14, v15}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    new-array v14, v9, [Ljava/lang/Class;

    const-class v15, Landroid/os/Bundle;

    aput-object v15, v14, v6

    new-array v15, v9, [Ljava/lang/Object;

    aput-object v13, v15, v6

    const-string v13, "f"

    invoke-static {v3, v13, v14, v15}, Le/e/a/MultiTabs227;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v13

    const-string v14, "androidx.fragment.app.Fragment"

    invoke-static {v14}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v14

    new-array v15, v12, [Ljava/lang/Class;

    sget-object v16, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v16, v15, v6

    aput-object v14, v15, v9

    const-class v14, Ljava/lang/String;

    const/16 v16, 0x2

    aput-object v14, v15, v16

    invoke-virtual {v13, v10, v15}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v10

    iget v13, v0, Le/e/a/MultiTabs227$Host;->frame:I

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    new-instance v14, Ljava/lang/StringBuilder;

    const-string v15, "saved-tab-"

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    new-array v15, v12, [Ljava/lang/Object;

    aput-object v13, v15, v6

    aput-object v3, v15, v9

    aput-object v14, v15, v16

    invoke-virtual {v10, v8, v15}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v9, v0, Le/e/a/MultiTabs227$Host;->pages:Ljava/util/LinkedHashMap;

    invoke-virtual {v9, v1, v3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_12e

    :cond_12a
    const/4 v9, 0x5

    invoke-virtual {v0, v8, v9, v3}, Le/e/a/MultiTabs227$Host;->op(Ljava/lang/Object;ILjava/lang/Object;)V

    :goto_12e
    iput-object v3, v0, Le/e/a/MultiTabs227$Host;->current:Ljava/lang/Object;

    iput-object v1, v0, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    iget-object v9, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const-string v10, "F"

    invoke-static {v9, v10, v3}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v9, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const-string v10, "A"

    iget-object v13, v2, Le/e/a/SavedTabs227$Tab;->url:Ljava/lang/String;

    invoke-static {v9, v10, v13}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v9, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const-string v10, "B"

    iget-object v13, v2, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    invoke-static {v9, v10, v13}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v9, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const-string v10, "C"

    iget-object v13, v2, Le/e/a/SavedTabs227$Tab;->item:Ljava/lang/String;

    invoke-static {v9, v10, v13}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v9, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    iget v10, v2, Le/e/a/SavedTabs227$Tab;->folder:I

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const-string v13, "D"

    invoke-static {v9, v13, v10}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v9, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    iget v10, v2, Le/e/a/SavedTabs227$Tab;->type:I

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const-string v13, "E"

    invoke-static {v9, v13, v10}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v9, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    iget-object v10, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {v10, v2}, Le/e/a/MultiTabs227;->intent(Landroid/app/Activity;Le/e/a/SavedTabs227$Tab;)Landroid/content/Intent;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V

    new-array v9, v6, [Ljava/lang/Class;

    new-array v10, v6, [Ljava/lang/Object;

    const-string v13, "b"

    invoke-static {v8, v13, v9, v10}, Le/e/a/MultiTabs227;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    new-array v8, v6, [Ljava/lang/Class;

    new-array v9, v6, [Ljava/lang/Object;

    const-string v10, "n"

    invoke-static {v7, v10, v8, v9}, Le/e/a/MultiTabs227;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    new-array v7, v6, [Ljava/lang/Class;

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v3, v5, v7, v6}, Le/e/a/MultiTabs227;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    if-eqz v5, :cond_1ee

    invoke-static {v5}, Le/e/a/TabRecovery244;->present(Landroid/view/View;)V

    :goto_19a
    iget-object v5, v0, Le/e/a/MultiTabs227$Host;->pages:Ljava/util/LinkedHashMap;

    invoke-virtual {v5}, Ljava/util/LinkedHashMap;->size()I

    move-result v5

    if-gt v5, v12, :cond_1a3

    :goto_1a2
    goto :goto_1c4

    :cond_1a3
    iget-object v5, v0, Le/e/a/MultiTabs227$Host;->pages:Ljava/util/LinkedHashMap;

    invoke-virtual {v5}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1ad
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_1b5

    move-object v6, v4

    goto :goto_1c1

    :cond_1b5
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1ad

    :goto_1c1
    if-nez v6, :cond_1ea

    goto :goto_1a2

    :goto_1c4
    invoke-static {v3, v2}, Le/e/a/TabChrome228;->restore(Ljava/lang/Object;Le/e/a/SavedTabs227$Tab;)V

    iget-object v4, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {v4, v1}, Le/e/a/TabPlayback110;->apply(Landroid/app/Activity;Ljava/lang/String;)V

    iget-object v4, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->invalidateOptionsMenu()V

    invoke-virtual/range {p0 .. p0}, Le/e/a/MultiTabs227$Host;->bar()V

    iget-object v4, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {v4, v1}, Le/e/a/PlaybackNavigation114;->browsed(Landroid/app/Activity;Ljava/lang/String;)V

    if-eqz v11, :cond_1e9

    iget v1, v2, Le/e/a/SavedTabs227$Tab;->position:I

    if-lez v1, :cond_1e9

    sget-object v1, Le/e/a/MultiTabs227;->MAIN:Landroid/os/Handler;

    new-instance v4, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda14;

    invoke-direct {v4, v0, v3, v2}, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda14;-><init>(Le/e/a/MultiTabs227$Host;Ljava/lang/Object;Le/e/a/SavedTabs227$Tab;)V

    invoke-virtual {v1, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_1e9
    return-void

    :cond_1ea
    invoke-virtual {v0, v6}, Le/e/a/MultiTabs227$Host;->removePage(Ljava/lang/String;)V

    goto :goto_19a

    :cond_1ee
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Selected tab has no view"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_1f6
    :goto_1f6
    invoke-static {v0, v2}, Le/e/a/TabRoutes228;->open(Le/e/a/MultiTabs227$Host;Le/e/a/SavedTabs227$Tab;)V

    return-void
.end method

.method add()V
    .registers 7

    .line 48
    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {v0}, Le/e/a/TabRoutes228;->addLabels(Landroid/app/Activity;)[Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {v1}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-object v2, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const-string v3, "Add tab"

    const-string v4, "\u65b0\u589e\u5206\u9801"

    const-string v5, "\u30bf\u30d6\u3092\u8ffd\u52a0"

    invoke-static {v2, v5, v3, v4}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda13;

    invoke-direct {v2, p0, v0}, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda13;-><init>(Le/e/a/MultiTabs227$Host;[Ljava/lang/String;)V

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/high16 v1, 0x1040000

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void
.end method

.method addTab(Le/e/a/SavedTabs227$Tab;)V
    .registers 6

    .line 50
    :try_start_0
    iget v0, p1, Le/e/a/SavedTabs227$Tab;->kind:I

    if-nez v0, :cond_6

    const/4 v0, 0x0

    goto :goto_a

    :cond_6
    invoke-static {p1}, Le/e/a/MultiTabs227;->match(Le/e/a/SavedTabs227$Tab;)Le/e/a/SavedTabs227$Tab;

    move-result-object v0

    :goto_a
    if-eqz v0, :cond_12

    iget-object p1, v0, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {p0, p1}, Le/e/a/MultiTabs227$Host;->select(Ljava/lang/String;)V

    return-void

    :cond_12
    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v0

    invoke-virtual {v0, p1}, Le/e/a/SavedTabs227;->add(Le/e/a/SavedTabs227$Tab;)V

    invoke-static {}, Le/e/a/MultiTabs227;->save()V

    iget-object p1, p1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {p0, p1}, Le/e/a/MultiTabs227$Host;->select(Ljava/lang/String;)V
    :try_end_21
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_21} :catch_22

    goto :goto_39

    :catch_22
    move-exception p1

    iget-object p1, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const-string v1, "Up to 64 tabs can be saved"

    const-string v2, "\u6700\u591a\u53ef\u5132\u5b5864\u500b\u5206\u9801"

    const-string v3, "\u30bf\u30d6\u306f64\u500b\u307e\u3067\u4fdd\u5b58\u3067\u304d\u307e\u3059"

    invoke-static {v0, v3, v1, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :goto_39
    return-void
.end method

.method bar()V
    .registers 17

    .line 44
    move-object/from16 v0, p0

    invoke-static {}, Le/e/a/MultiTabs227;->enabled()Z

    move-result v1

    if-eqz v1, :cond_341

    iget-object v1, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_341

    iget-object v1, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-eqz v1, :cond_1a

    goto/16 :goto_341

    :cond_1a
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Configuration;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {v2}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v2

    iget-object v2, v2, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_45
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_326

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v2

    iget-object v2, v2, Le/e/a/SavedTabs227;->selected:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v0, Le/e/a/MultiTabs227$Host;->bar:Landroid/view/View;

    if-eqz v2, :cond_68

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, v0, Le/e/a/MultiTabs227$Host;->barKey:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_68

    invoke-virtual/range {p0 .. p0}, Le/e/a/MultiTabs227$Host;->refreshSelected()V

    return-void

    :cond_68
    invoke-virtual/range {p0 .. p0}, Le/e/a/MultiTabs227$Host;->removeBar()V

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Le/e/a/MultiTabs227$Host;->barKey:Ljava/lang/String;

    iget-object v1, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const v2, 0x7f0800dd

    invoke-virtual {v1, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    instance-of v2, v1, Landroid/widget/LinearLayout;

    if-nez v2, :cond_7f

    return-void

    :cond_7f
    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, v0, Le/e/a/MultiTabs227$Host;->parent:Landroid/widget/LinearLayout;

    iget-object v1, v0, Le/e/a/MultiTabs227$Host;->parent:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v1

    iput v1, v0, Le/e/a/MultiTabs227$Host;->orientation:I

    iget-object v1, v0, Le/e/a/MultiTabs227$Host;->parent:Landroid/widget/LinearLayout;

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v1, v0, Le/e/a/MultiTabs227$Host;->parent:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    const/4 v4, 0x0

    const/4 v5, 0x0

    if-nez v1, :cond_9d

    move-object v1, v4

    goto :goto_a3

    :cond_9d
    iget-object v1, v0, Le/e/a/MultiTabs227$Host;->parent:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    :goto_a3
    iput-object v1, v0, Le/e/a/MultiTabs227$Host;->body:Landroid/view/View;

    iget-object v1, v0, Le/e/a/MultiTabs227$Host;->body:Landroid/view/View;

    const/high16 v6, 0x3f800000    # 1.0f

    if-eqz v1, :cond_c3

    iget-object v1, v0, Le/e/a/MultiTabs227$Host;->body:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iput-object v1, v0, Le/e/a/MultiTabs227$Host;->bodyParams:Landroid/view/ViewGroup$LayoutParams;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v2, v0, Le/e/a/MultiTabs227$Host;->bodyParams:Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    iput v5, v1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    iput v6, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    iget-object v2, v0, Le/e/a/MultiTabs227$Host;->body:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_c3
    new-instance v7, Landroid/widget/LinearLayout;

    iget-object v1, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-direct {v7, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v7, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v1, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {v1}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v7, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    const/4 v1, 0x0

    invoke-virtual {v7, v1}, Landroid/widget/LinearLayout;->setElevation(F)V

    new-instance v8, Landroid/widget/HorizontalScrollView;

    iget-object v1, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-direct {v8, v1}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    iput-object v8, v0, Le/e/a/MultiTabs227$Host;->tabScroll:Landroid/widget/HorizontalScrollView;

    invoke-virtual {v8, v5}, Landroid/widget/HorizontalScrollView;->setHorizontalScrollBarEnabled(Z)V

    new-instance v1, Landroid/widget/LinearLayout;

    iget-object v2, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-direct {v1, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Le/e/a/MultiTabs227$Host;->strip:Landroid/widget/LinearLayout;

    iget-object v1, v0, Le/e/a/MultiTabs227$Host;->strip:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    const/4 v9, -0x2

    const/4 v10, -0x1

    invoke-direct {v2, v9, v10}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v1, v2}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v5, v10, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v7, v8, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v1

    iget-object v1, v1, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_10d
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/16 v2, 0x11

    if-nez v1, :cond_186

    new-instance v1, Landroid/widget/TextView;

    iget-object v3, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-direct {v1, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v3, "\uff0b"

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v3, 0x41a80000    # 21.0f

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v3, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {v3}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setGravity(I)V

    iget-object v2, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const-string v3, "Add tab"

    const-string v4, "\u65b0\u589e\u5206\u9801"

    const-string v6, "\u30bf\u30d6\u3092\u8ffd\u52a0"

    invoke-static {v2, v6, v3, v4}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v3, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const/16 v4, 0x28

    invoke-static {v3, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-direct {v2, v3, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda10;

    invoke-direct {v2, v0}, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda10;-><init>(Le/e/a/MultiTabs227$Host;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v7, v0, Le/e/a/MultiTabs227$Host;->bar:Landroid/view/View;

    iget-object v1, v0, Le/e/a/MultiTabs227$Host;->bar:Landroid/view/View;

    const-string v2, "nicoid-video-tabs"

    invoke-virtual {v1, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    iget-object v1, v0, Le/e/a/MultiTabs227$Host;->parent:Landroid/widget/LinearLayout;

    iget-object v2, v0, Le/e/a/MultiTabs227$Host;->bar:Landroid/view/View;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v4, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const/16 v6, 0x20

    invoke-static {v4, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-direct {v3, v10, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v5, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    iget-boolean v1, v0, Le/e/a/MultiTabs227$Host;->preserveStrip:Z

    iput-boolean v5, v0, Le/e/a/MultiTabs227$Host;->preserveStrip:Z

    new-instance v2, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda11;

    invoke-direct {v2, v0, v8, v1}, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda11;-><init>(Le/e/a/MultiTabs227$Host;Landroid/widget/HorizontalScrollView;Z)V

    invoke-virtual {v8, v2}, Landroid/widget/HorizontalScrollView;->post(Ljava/lang/Runnable;)Z

    invoke-static/range {p0 .. p0}, Le/e/a/TabPreview235;->schedule(Le/e/a/MultiTabs227$Host;)V

    return-void

    :cond_186
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/SavedTabs227$Tab;

    new-instance v12, Landroid/widget/LinearLayout;

    iget-object v13, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-direct {v12, v13}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v12, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v13, Landroid/widget/TextView;

    iget-object v14, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-direct {v13, v14}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iget-object v14, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {v14, v1}, Le/e/a/CreatorTitles119;->tabLabel(Landroid/app/Activity;Le/e/a/SavedTabs227$Tab;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v14, 0x41400000    # 12.0f

    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setTextSize(F)V

    sget-object v14, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v13, v14, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    invoke-static {v13}, Le/e/a/ThemeChoice;->textColor(Landroid/view/View;)I

    move-result v14

    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v13, v2}, Landroid/widget/TextView;->setGravity(I)V

    invoke-virtual {v13, v3}, Landroid/widget/TextView;->setSingleLine(Z)V

    iget-object v14, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const/16 v15, 0xb4

    invoke-static {v14, v15}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v14

    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setMaxWidth(I)V

    sget-object v14, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    iget-object v14, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const/16 v15, 0xc

    invoke-static {v14, v15}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v14

    iget-object v6, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {v6, v15}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-virtual {v13, v14, v5, v6, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    invoke-static {v1}, Le/e/a/MultiTabs227;->badge(Le/e/a/SavedTabs227$Tab;)I

    move-result v6

    const/4 v14, 0x2

    const-string v15, ": "

    if-eqz v6, :cond_244

    new-instance v5, Le/e/a/MultiTabs227$TabBadge;

    invoke-virtual {v13}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result v2

    iget-object v9, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const/16 v10, 0xe

    invoke-static {v9, v10}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-direct {v5, v6, v2, v9}, Le/e/a/MultiTabs227$TabBadge;-><init>(III)V

    invoke-virtual {v13, v5, v4, v4, v4}, Landroid/widget/TextView;->setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    iget-object v2, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const/4 v5, 0x4

    invoke-static {v2, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v13, v2}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    if-ne v6, v3, :cond_214

    iget-object v2, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const-string v5, "Search"

    const-string v6, "\u641c\u5c0b"

    const-string v9, "\u691c\u7d22"

    :goto_20f
    invoke-static {v2, v9, v5, v6}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_227

    :cond_214
    const/4 v2, 0x3

    if-ne v6, v2, :cond_21e

    const-string v2, "\u6295\u7a3f\u52d5\u753b"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_227

    :cond_21e
    iget-object v2, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const-string v5, "Ranking"

    const-string v6, "\u6392\u884c\u699c"

    const-string v9, "\u30e9\u30f3\u30ad\u30f3\u30b0"

    goto :goto_20f

    :goto_227
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v5, v1, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v12, v2}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setImportantForAccessibility(I)V

    :cond_244
    new-instance v2, Landroid/widget/LinearLayout;

    iget-object v5, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-direct {v2, v5}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v5, 0x10

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x2

    const/4 v9, -0x1

    invoke-direct {v5, v6, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v13, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v5, v1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v6

    iget-object v6, v6, Le/e/a/SavedTabs227;->selected:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2c4

    new-instance v5, Landroid/widget/TextView;

    iget-object v6, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-direct {v5, v6}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v6, "\u00d7"

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v6, 0x41900000    # 18.0f

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v13}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    const/16 v6, 0x11

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setGravity(I)V

    new-instance v6, Ljava/lang/StringBuilder;

    iget-object v9, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const-string v10, "Close tab"

    const-string v13, "\u95dc\u9589\u5206\u9801"

    const-string v3, "\u30bf\u30d6\u3092\u9589\u3058\u308b"

    invoke-static {v9, v3, v10, v13}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v6, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v6, v1, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v6, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const/16 v9, 0x1c

    invoke-static {v6, v9}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    const/4 v9, -0x1

    invoke-direct {v3, v6, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v5, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda8;

    invoke-direct {v3, v0, v1}, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda8;-><init>(Le/e/a/MultiTabs227$Host;Le/e/a/SavedTabs227$Tab;)V

    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_2c4
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, -0x2

    const/4 v9, 0x0

    invoke-direct {v3, v6, v9, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v12, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/view/View;

    iget-object v3, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v3

    iget-object v3, v3, Le/e/a/SavedTabs227;->selected:Ljava/lang/String;

    iget-object v6, v1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2ec

    iget-object v3, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {v3}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v3

    goto :goto_2ed

    :cond_2ec
    const/4 v3, 0x0

    :goto_2ed
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundColor(I)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v6, v0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {v6, v14}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    const/4 v10, -0x1

    invoke-direct {v3, v10, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v12, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v3, v0, Le/e/a/MultiTabs227$Host;->strip:Landroid/widget/LinearLayout;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v13, -0x2

    invoke-direct {v6, v13, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v12, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v3, v1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {v12, v3}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    const-string v3, "tab-underline"

    invoke-virtual {v2, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    new-instance v2, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda9;

    invoke-direct {v2, v0, v1}, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda9;-><init>(Le/e/a/MultiTabs227$Host;Le/e/a/SavedTabs227$Tab;)V

    invoke-virtual {v12, v2}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static {v0, v12, v1, v8}, Le/e/a/TabDrag228;->install(Le/e/a/MultiTabs227$Host;Landroid/view/View;Le/e/a/SavedTabs227$Tab;Landroid/widget/HorizontalScrollView;)V

    const/4 v3, 0x1

    const/4 v5, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v9, -0x2

    goto/16 :goto_10d

    :cond_326
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/SavedTabs227$Tab;

    iget-object v4, v3, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v3, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v3}, Le/e/a/MultiTabs227;->badge(Le/e/a/SavedTabs227$Tab;)I

    move-result v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto/16 :goto_45

    :cond_341
    :goto_341
    return-void
.end method

.method capture()V
    .registers 4

    .line 43
    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->current:Ljava/lang/Object;

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v0

    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Le/e/a/SavedTabs227;->find(Ljava/lang/String;)Le/e/a/SavedTabs227$Tab;

    move-result-object v0

    if-nez v0, :cond_12

    return-void

    :cond_12
    :try_start_12
    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->current:Ljava/lang/Object;

    const-string v2, "b0"

    invoke-static {v1, v2}, Le/e/a/MultiTabs227;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    invoke-virtual {v1}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v2

    iput v2, v0, Le/e/a/SavedTabs227$Tab;->position:I

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    if-nez v1, :cond_2a

    goto :goto_2e

    :cond_2a
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v2

    :goto_2e
    iput v2, v0, Le/e/a/SavedTabs227$Tab;->top:I

    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->current:Ljava/lang/Object;

    const-string v2, "d0"

    invoke-static {v1, v2}, Le/e/a/MultiTabs227;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "https://"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_57

    iget v2, v0, Le/e/a/SavedTabs227$Tab;->kind:I

    if-nez v2, :cond_57

    iput-object v1, v0, Le/e/a/SavedTabs227$Tab;->url:Ljava/lang/String;

    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    iget-object v2, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {v2, v0}, Le/e/a/MultiTabs227;->intent(Landroid/app/Activity;Le/e/a/SavedTabs227$Tab;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_55} :catch_56

    goto :goto_57

    :catch_56
    move-exception v0

    :cond_57
    :goto_57
    return-void
.end method

.method clearSelection(Ljava/lang/Object;)V
    .registers 4

    .line 55
    :try_start_0
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v1, "k0"

    invoke-static {p1, v1}, Le/e/a/MultiTabs227;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    invoke-static {p1}, Le/e/a/BulkSelection;->done(Ljava/lang/Object;)V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_11} :catch_12

    goto :goto_13

    :catch_12
    move-exception p1

    :cond_13
    :goto_13
    return-void
.end method

.method close(Le/e/a/SavedTabs227$Tab;)V
    .registers 6

    .line 52
    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v0

    iget-object v1, p1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Le/e/a/SavedTabs227;->find(Ljava/lang/String;)Le/e/a/SavedTabs227$Tab;

    move-result-object v0

    if-nez v0, :cond_d

    return-void

    :cond_d
    invoke-virtual {p0}, Le/e/a/MultiTabs227$Host;->capture()V

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v0

    iget-object v0, v0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    iget-object v1, p1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    iget-object v2, p0, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v2

    iget-object v3, p1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {v2, v3}, Le/e/a/SavedTabs227;->remove(Ljava/lang/String;)V

    if-eqz v1, :cond_70

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v1

    iget-object v1, v1, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_58

    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->pages:Ljava/util/LinkedHashMap;

    iget-object v2, p1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, ""

    if-eqz v1, :cond_4a

    iget-object v3, p0, Le/e/a/MultiTabs227$Host;->pages:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, v2, v1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4a
    iput-object v2, p0, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "nicoid_saved_tab_id"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    goto :goto_75

    :cond_58
    :try_start_58
    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v1

    iget-object v1, v1, Le/e/a/SavedTabs227;->selected:Ljava/lang/String;

    invoke-virtual {p0, v1}, Le/e/a/MultiTabs227$Host;->activate(Ljava/lang/String;)V

    iget-object v1, p1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {p0, v1}, Le/e/a/MultiTabs227$Host;->removePage(Ljava/lang/String;)V
    :try_end_66
    .catch Ljava/lang/Exception; {:try_start_58 .. :try_end_66} :catch_67

    goto :goto_75

    :catch_67
    move-exception v1

    const-string v2, "nicoid-tabs"

    const-string v3, "Cannot select tab after close"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_75

    :cond_70
    iget-object v1, p1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {p0, v1}, Le/e/a/MultiTabs227$Host;->removePage(Ljava/lang/String;)V

    :goto_75
    sget-object v1, Le/e/a/TabPreview235;->CACHE:Landroid/util/LruCache;

    iget-object v2, p1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/util/LruCache;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Le/e/a/MultiTabs227;->save()V

    invoke-virtual {p0}, Le/e/a/MultiTabs227$Host;->bar()V

    invoke-static {p0, p1, v0}, Le/e/a/TabRecovery244;->undo(Le/e/a/MultiTabs227$Host;Le/e/a/SavedTabs227$Tab;I)V

    return-void
.end method

.method synthetic lambda$0$e-e-a-MultiTabs227$Host(Le/e/a/SavedTabs227$Tab;Landroid/view/View;)V
    .registers 3

    .line 44
    invoke-virtual {p0, p1}, Le/e/a/MultiTabs227$Host;->close(Le/e/a/SavedTabs227$Tab;)V

    return-void
.end method

.method synthetic lambda$1$e-e-a-MultiTabs227$Host(Le/e/a/SavedTabs227$Tab;Landroid/view/View;)V
    .registers 3

    .line 44
    iget-object p1, p1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {p0, p1}, Le/e/a/MultiTabs227$Host;->select(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$2$e-e-a-MultiTabs227$Host(Landroid/view/View;)V
    .registers 2

    .line 44
    invoke-virtual {p0}, Le/e/a/MultiTabs227$Host;->add()V

    return-void
.end method

.method synthetic lambda$3$e-e-a-MultiTabs227$Host(Landroid/widget/HorizontalScrollView;Z)V
    .registers 5

    .line 44
    iget v0, p0, Le/e/a/MultiTabs227$Host;->stripX:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/widget/HorizontalScrollView;->scrollTo(II)V

    if-nez p2, :cond_b

    invoke-virtual {p0}, Le/e/a/MultiTabs227$Host;->revealSelected()V

    :cond_b
    return-void
.end method

.method synthetic lambda$4$e-e-a-MultiTabs227$Host([Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .registers 4

    .line 48
    if-nez p3, :cond_7

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Le/e/a/MultiTabs227$Host;->query(Le/e/a/SavedTabs227$Tab;)V

    goto :goto_12

    :cond_7
    iget-object p2, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    aget-object p1, p1, p3

    invoke-static {p2, p3, p1}, Le/e/a/TabRoutes228;->choice(Landroid/app/Activity;ILjava/lang/String;)Le/e/a/SavedTabs227$Tab;

    move-result-object p1

    invoke-virtual {p0, p1}, Le/e/a/MultiTabs227$Host;->addTab(Le/e/a/SavedTabs227$Tab;)V

    :goto_12
    return-void
.end method

.method synthetic lambda$5$e-e-a-MultiTabs227$Host(ILjava/lang/String;)V
    .registers 6

    .line 53
    iget v0, p0, Le/e/a/MultiTabs227$Host;->generation:I

    if-ne p1, v0, :cond_47

    iget-object p1, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    move-result p1

    if-nez p1, :cond_47

    iget-object p1, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result p1

    if-nez p1, :cond_47

    invoke-static {}, Le/e/a/MultiTabs227;->enabled()Z

    move-result p1

    if-nez p1, :cond_1b

    goto :goto_47

    :cond_1b
    :try_start_1b
    invoke-virtual {p0, p2}, Le/e/a/MultiTabs227$Host;->activate(Ljava/lang/String;)V

    sget-object p1, Le/e/a/MultiTabs227;->MAIN:Landroid/os/Handler;

    new-instance p2, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda12;

    invoke-direct {p2}, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda12;-><init>()V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_28} :catch_29

    goto :goto_47

    :catch_29
    move-exception p1

    const-string p2, "nicoid-tabs"

    const-string v0, "Cannot switch native tab"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    iget-object p1, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    iget-object p2, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const-string v0, "Unable to open tab"

    const-string v1, "\u7121\u6cd5\u958b\u555f\u5206\u9801"

    const-string v2, "\u30bf\u30d6\u3092\u958b\u3051\u307e\u305b\u3093\u3067\u3057\u305f"

    invoke-static {p2, v2, v0, v1}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :cond_47
    :goto_47
    return-void
.end method

.method synthetic lambda$7$e-e-a-MultiTabs227$Host(Ljava/lang/Object;Le/e/a/SavedTabs227$Tab;)V
    .registers 3

    .line 57
    invoke-virtual {p0, p1, p2}, Le/e/a/MultiTabs227$Host;->restoreScroll(Ljava/lang/Object;Le/e/a/SavedTabs227$Tab;)V

    return-void
.end method

.method op(Ljava/lang/Object;ILjava/lang/Object;)V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 54
    const-string v0, "d.k.a.o$a"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "androidx.fragment.app.Fragment"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x2

    new-array v3, v2, [Ljava/lang/Class;

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const/4 v4, 0x1

    aput-object v1, v3, v4

    invoke-virtual {v0, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p2, v2, v5

    aput-object p3, v2, v4

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p3

    new-array v1, v4, [Ljava/lang/Class;

    aput-object v0, v1, v5

    const-string v0, "a"

    invoke-virtual {p3, v0, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p3

    new-array v0, v4, [Ljava/lang/Object;

    aput-object p2, v0, v5

    invoke-virtual {p3, p1, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method query(Le/e/a/SavedTabs227$Tab;)V
    .registers 2

    .line 49
    invoke-static {p0, p1}, Le/e/a/TabSearch228;->open(Le/e/a/MultiTabs227$Host;Le/e/a/SavedTabs227$Tab;)V

    return-void
.end method

.method refreshSelected()V
    .registers 6

    .line 46
    invoke-virtual {p0}, Le/e/a/MultiTabs227$Host;->revealSelected()V

    invoke-static {p0}, Le/e/a/TabPreview235;->schedule(Le/e/a/MultiTabs227$Host;)V

    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->strip:Landroid/widget/LinearLayout;

    if-nez v0, :cond_b

    return-void

    :cond_b
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_d
    iget-object v2, p0, Le/e/a/MultiTabs227$Host;->strip:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    if-lt v1, v2, :cond_16

    return-void

    :cond_16
    iget-object v2, p0, Le/e/a/MultiTabs227$Host;->strip:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    const-string v3, "tab-underline"

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_3f

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v4

    iget-object v4, v4, Le/e/a/SavedTabs227;->selected:Ljava/lang/String;

    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3b

    iget-object v2, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {v2}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v2

    goto :goto_3c

    :cond_3b
    const/4 v2, 0x0

    :goto_3c
    invoke-virtual {v3, v2}, Landroid/view/View;->setBackgroundColor(I)V

    :cond_3f
    add-int/lit8 v1, v1, 0x1

    goto :goto_d
.end method

.method removeBar()V
    .registers 4

    .line 47
    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->tabScroll:Landroid/widget/HorizontalScrollView;

    if-eqz v0, :cond_c

    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->tabScroll:Landroid/widget/HorizontalScrollView;

    invoke-virtual {v0}, Landroid/widget/HorizontalScrollView;->getScrollX()I

    move-result v0

    iput v0, p0, Le/e/a/MultiTabs227$Host;->stripX:I

    :cond_c
    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/MultiTabs227$Host;->tabScroll:Landroid/widget/HorizontalScrollView;

    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->bar:Landroid/view/View;

    if-eqz v1, :cond_2a

    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->bar:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v1, v1, Landroid/view/ViewGroup;

    if-eqz v1, :cond_2a

    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->bar:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    iget-object v2, p0, Le/e/a/MultiTabs227$Host;->bar:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_2a
    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->body:Landroid/view/View;

    if-eqz v1, :cond_39

    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->bodyParams:Landroid/view/ViewGroup$LayoutParams;

    if-eqz v1, :cond_39

    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->body:Landroid/view/View;

    iget-object v2, p0, Le/e/a/MultiTabs227$Host;->bodyParams:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_39
    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->bar:Landroid/view/View;

    if-eqz v1, :cond_48

    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->parent:Landroid/widget/LinearLayout;

    if-eqz v1, :cond_48

    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->parent:Landroid/widget/LinearLayout;

    iget v2, p0, Le/e/a/MultiTabs227$Host;->orientation:I

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    :cond_48
    iput-object v0, p0, Le/e/a/MultiTabs227$Host;->bar:Landroid/view/View;

    iput-object v0, p0, Le/e/a/MultiTabs227$Host;->body:Landroid/view/View;

    iput-object v0, p0, Le/e/a/MultiTabs227$Host;->bodyParams:Landroid/view/ViewGroup$LayoutParams;

    return-void
.end method

.method removePage(Ljava/lang/String;)V
    .registers 7

    .line 56
    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->pages:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_9

    return-void

    :cond_9
    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->current:Ljava/lang/Object;

    if-ne p1, v0, :cond_10

    invoke-virtual {p0, p1}, Le/e/a/MultiTabs227$Host;->clearSelection(Ljava/lang/Object;)V

    :cond_10
    :try_start_10
    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const-string v1, "i"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    new-array v4, v2, [Ljava/lang/Object;

    invoke-static {v0, v1, v3, v4}, Le/e/a/MultiTabs227;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "a"

    new-array v3, v2, [Ljava/lang/Class;

    new-array v4, v2, [Ljava/lang/Object;

    invoke-static {v0, v1, v3, v4}, Le/e/a/MultiTabs227;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1, p1}, Le/e/a/MultiTabs227$Host;->op(Ljava/lang/Object;ILjava/lang/Object;)V

    const-string v1, "b"

    new-array v3, v2, [Ljava/lang/Class;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v1, v3, v2}, Le/e/a/MultiTabs227;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->current:Ljava/lang/Object;

    if-ne p1, v0, :cond_44

    const/4 p1, 0x0

    iput-object p1, p0, Le/e/a/MultiTabs227$Host;->current:Ljava/lang/Object;
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_3b} :catch_3c

    goto :goto_44

    :catch_3c
    move-exception p1

    const-string v0, "nicoid-tabs"

    const-string v1, "Cannot remove cached tab"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_44
    :goto_44
    return-void
.end method

.method restoreScroll(Ljava/lang/Object;Le/e/a/SavedTabs227$Tab;)V
    .registers 5

    .line 58
    :try_start_0
    const-string v0, "b0"

    invoke-static {p1, v0}, Le/e/a/MultiTabs227;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    new-instance v1, Le/e/a/MultiTabs227$Host$1;

    invoke-direct {v1, p0, p1, v0, p2}, Le/e/a/MultiTabs227$Host$1;-><init>(Le/e/a/MultiTabs227$Host;Ljava/lang/Object;Landroid/widget/ListView;Le/e/a/SavedTabs227$Tab;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_10} :catch_11

    goto :goto_12

    :catch_11
    move-exception p1

    :goto_12
    return-void
.end method

.method resume()V
    .registers 4

    .line 42
    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v0

    iget-object v0, v0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_70

    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    invoke-static {v0, v1}, Le/e/a/TabPlayback110;->apply(Landroid/app/Activity;Ljava/lang/String;)V

    iget-boolean v0, p0, Le/e/a/MultiTabs227$Host;->started:Z

    if-nez v0, :cond_42

    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/MultiTabs227$Host;->started:Z

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v0

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v1

    iget-object v1, v1, Le/e/a/SavedTabs227;->selected:Ljava/lang/String;

    invoke-virtual {v0, v1}, Le/e/a/SavedTabs227;->find(Ljava/lang/String;)Le/e/a/SavedTabs227$Tab;

    move-result-object v0

    iget-boolean v1, p0, Le/e/a/MultiTabs227$Host;->restoreSelection:Z

    if-eqz v1, :cond_42

    if-eqz v0, :cond_42

    iget-object v1, v0, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    iget-object v2, p0, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_42

    iget-object v0, v0, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {p0, v0}, Le/e/a/MultiTabs227$Host;->select(Ljava/lang/String;)V

    return-void

    :cond_42
    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v0

    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Le/e/a/SavedTabs227;->find(Ljava/lang/String;)Le/e/a/SavedTabs227$Tab;

    move-result-object v0

    if-eqz v0, :cond_6c

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v0

    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    iput-object v1, v0, Le/e/a/SavedTabs227;->selected:Ljava/lang/String;

    invoke-static {}, Le/e/a/MultiTabs227;->save()V

    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->current:Ljava/lang/Object;

    if-eqz v0, :cond_6c

    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->current:Ljava/lang/Object;

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v1

    iget-object v2, p0, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Le/e/a/SavedTabs227;->find(Ljava/lang/String;)Le/e/a/SavedTabs227$Tab;

    move-result-object v1

    invoke-static {v0, v1}, Le/e/a/TabChrome228;->restore(Ljava/lang/Object;Le/e/a/SavedTabs227$Tab;)V

    :cond_6c
    invoke-virtual {p0}, Le/e/a/MultiTabs227$Host;->bar()V

    return-void

    :cond_70
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/SavedTabs227$Tab;

    iget-object v2, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {v2, v1}, Le/e/a/CreatorTitles119;->repair(Landroid/app/Activity;Le/e/a/SavedTabs227$Tab;)V

    goto :goto_a
.end method

.method revealSelected()V
    .registers 6

    .line 45
    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->tabScroll:Landroid/widget/HorizontalScrollView;

    if-eqz v0, :cond_53

    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->strip:Landroid/widget/LinearLayout;

    if-nez v0, :cond_9

    goto :goto_53

    :cond_9
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_b
    iget-object v2, p0, Le/e/a/MultiTabs227$Host;->strip:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    if-lt v1, v2, :cond_14

    return-void

    :cond_14
    iget-object v2, p0, Le/e/a/MultiTabs227$Host;->strip:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v3

    iget-object v3, v3, Le/e/a/SavedTabs227;->selected:Ljava/lang/String;

    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_50

    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->tabScroll:Landroid/widget/HorizontalScrollView;

    invoke-virtual {v1}, Landroid/widget/HorizontalScrollView;->getScrollX()I

    move-result v1

    iget-object v3, p0, Le/e/a/MultiTabs227$Host;->tabScroll:Landroid/widget/HorizontalScrollView;

    invoke-virtual {v3}, Landroid/widget/HorizontalScrollView;->getWidth()I

    move-result v3

    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v4

    invoke-virtual {v2}, Landroid/view/View;->getRight()I

    move-result v2

    invoke-static {v1, v3, v4, v2}, Le/e/a/TabUiRules244;->reveal(IIII)I

    move-result v1

    iget-object v2, p0, Le/e/a/MultiTabs227$Host;->tabScroll:Landroid/widget/HorizontalScrollView;

    invoke-virtual {v2}, Landroid/widget/HorizontalScrollView;->getScrollX()I

    move-result v2

    if-eq v1, v2, :cond_4f

    iget-object v2, p0, Le/e/a/MultiTabs227$Host;->tabScroll:Landroid/widget/HorizontalScrollView;

    invoke-virtual {v2, v1, v0}, Landroid/widget/HorizontalScrollView;->smoothScrollTo(II)V

    :cond_4f
    return-void

    :cond_50
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    :cond_53
    :goto_53
    return-void
.end method

.method select(Ljava/lang/String;)V
    .registers 5

    .line 53
    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v0

    invoke-virtual {v0, p1}, Le/e/a/SavedTabs227;->find(Ljava/lang/String;)Le/e/a/SavedTabs227$Tab;

    move-result-object v0

    if-nez v0, :cond_b

    return-void

    :cond_b
    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    return-void

    :cond_14
    invoke-virtual {p0}, Le/e/a/MultiTabs227$Host;->capture()V

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v0

    iput-object p1, v0, Le/e/a/SavedTabs227;->selected:Ljava/lang/String;

    iget v0, p0, Le/e/a/MultiTabs227$Host;->generation:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Le/e/a/MultiTabs227$Host;->generation:I

    sget-object v1, Le/e/a/MultiTabs227;->MAIN:Landroid/os/Handler;

    new-instance v2, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda15;

    invoke-direct {v2, p0, v0, p1}, Le/e/a/MultiTabs227$Host$$ExternalSyntheticLambda15;-><init>(Le/e/a/MultiTabs227$Host;ILjava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
