.class public final Le/e/a/TabRecovery244;
.super Ljava/lang/Object;
.source "TabRecovery244.java"


# static fields
.field static final UPDATE:I = 0x5f51

.field static final notices:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Le/e/a/MultiTabs227$Host;",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 5
    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    sput-object v0, Le/e/a/TabRecovery244;->notices:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static clear(Le/e/a/MultiTabs227$Host;)V
    .registers 2

    .line 10
    sget-object v0, Le/e/a/TabRecovery244;->notices:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    if-eqz p0, :cond_1b

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_1b

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_1b
    return-void
.end method

.method static synthetic lambda$0(Landroid/app/Activity;Landroid/view/MenuItem;)Z
    .registers 2

    .line 8
    invoke-static {p0}, Le/e/a/TabRecovery244;->refresh(Landroid/app/Activity;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$1(Le/e/a/SavedTabs227$Tab;ILe/e/a/MultiTabs227$Host;Landroid/view/View;)V
    .registers 5

    .line 11
    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object p3

    iget-object v0, p0, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {p3, v0}, Le/e/a/SavedTabs227;->find(Ljava/lang/String;)Le/e/a/SavedTabs227$Tab;

    move-result-object p3

    if-nez p3, :cond_3c

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object p3

    iget-object p3, p3, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p3

    const/16 v0, 0x40

    if-ge p3, v0, :cond_3c

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object p3

    iget-object p3, p3, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v0

    iget-object v0, v0, Le/e/a/SavedTabs227;->tabs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-virtual {p3, p1, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    invoke-static {}, Le/e/a/MultiTabs227;->save()V

    iget-object p0, p0, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {p2, p0}, Le/e/a/MultiTabs227$Host;->select(Ljava/lang/String;)V

    invoke-virtual {p2}, Le/e/a/MultiTabs227$Host;->bar()V

    :cond_3c
    invoke-static {p2}, Le/e/a/TabRecovery244;->clear(Le/e/a/MultiTabs227$Host;)V

    return-void
.end method

.method static synthetic lambda$2(Le/e/a/MultiTabs227$Host;Landroid/widget/LinearLayout;)V
    .registers 3

    .line 11
    sget-object v0, Le/e/a/TabRecovery244;->notices:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_b

    invoke-static {p0}, Le/e/a/TabRecovery244;->clear(Le/e/a/MultiTabs227$Host;)V

    :cond_b
    return-void
.end method

.method public static menu(Landroid/app/Activity;Landroid/view/Menu;)V
    .registers 7

    .line 8
    invoke-static {}, Le/e/a/MultiTabs227;->enabled()Z

    move-result v0

    if-eqz v0, :cond_2f

    invoke-static {p0}, Le/e/a/TabRoutes228;->supported(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_d

    goto :goto_2f

    :cond_d
    const/16 v0, 0x5f51

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_24

    const-string v1, "Refresh"

    const-string v3, "\u91cd\u65b0\u6574\u7406"

    const-string v4, "\u66f4\u65b0"

    invoke-static {p0, v4, v1, v3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v1

    :cond_24
    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setShowAsAction(I)V

    new-instance p1, Le/e/a/TabRecovery244$$ExternalSyntheticLambda5;

    invoke-direct {p1, p0}, Le/e/a/TabRecovery244$$ExternalSyntheticLambda5;-><init>(Landroid/app/Activity;)V

    invoke-interface {v1, p1}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    :cond_2f
    :goto_2f
    return-void
.end method

.method static present(Landroid/view/View;)V
    .registers 2

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationX(F)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Landroid/view/View;->bringToFront()V

    return-void
.end method

.method static refresh(Landroid/app/Activity;)V
    .registers 8

    .line 9
    sget-object v0, Le/e/a/MultiTabs227;->HOSTS:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/MultiTabs227$Host;

    if-nez v0, :cond_b

    return-void

    :cond_b
    const/4 v1, 0x1

    :try_start_c
    invoke-static {p0}, Le/e/a/TabPager233;->destroy(Landroid/app/Activity;)V

    iget v2, v0, Le/e/a/MultiTabs227$Host;->generation:I

    add-int/2addr v2, v1

    iput v2, v0, Le/e/a/MultiTabs227$Host;->generation:I

    invoke-virtual {v0}, Le/e/a/MultiTabs227$Host;->capture()V

    sget-object v2, Le/e/a/TabPreview235;->CACHE:Landroid/util/LruCache;

    iget-object v3, v0, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/util/LruCache;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p0}, Le/e/a/MultiTabs227;->lists(Landroid/app/Activity;)Z

    move-result v2

    if-nez v2, :cond_28

    invoke-virtual {p0}, Landroid/app/Activity;->recreate()V

    return-void

    :cond_28
    iget-object v2, v0, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v3

    invoke-virtual {v3, v2}, Le/e/a/SavedTabs227;->find(Ljava/lang/String;)Le/e/a/SavedTabs227$Tab;

    move-result-object v3

    if-nez v3, :cond_38

    invoke-virtual {p0}, Landroid/app/Activity;->recreate()V

    return-void

    :cond_38
    invoke-virtual {v0, v2}, Le/e/a/MultiTabs227$Host;->removePage(Ljava/lang/String;)V

    const-string v3, "i"

    const/4 v4, 0x0

    new-array v5, v4, [Ljava/lang/Class;

    new-array v6, v4, [Ljava/lang/Object;

    invoke-static {p0, v3, v5, v6}, Le/e/a/MultiTabs227;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    const-string v5, "n"

    new-array v6, v4, [Ljava/lang/Class;

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v3, v5, v6, v4}, Le/e/a/MultiTabs227;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0, v2}, Le/e/a/MultiTabs227$Host;->activate(Ljava/lang/String;)V

    invoke-static {}, Le/e/a/MultiTabs227;->save()V
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_55} :catch_56

    goto :goto_6f

    :catch_56
    move-exception v0

    const-string v2, "nicoid-tabs"

    const-string v3, "Selected tab recovery failed"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const-string v0, "Unable to refresh. Try again"

    const-string v2, "\u7121\u6cd5\u91cd\u65b0\u6574\u7406\uff0c\u8acb\u91cd\u8a66"

    const-string v3, "\u66f4\u65b0\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u3082\u3046\u4e00\u5ea6\u304a\u8a66\u3057\u304f\u3060\u3055\u3044"

    invoke-static {p0, v3, v0, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :goto_6f
    return-void
.end method

.method static related(Landroid/content/Intent;)Z
    .registers 3

    .line 6
    const/4 v0, 0x0

    if-eqz p0, :cond_15

    const-string v1, "type"

    invoke-virtual {p0, v1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    invoke-virtual {p0}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Le/e/a/TabUiRules244;->related(ILjava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_15

    const/4 p0, 0x1

    return p0

    :cond_15
    return v0
.end method

.method static undo(Le/e/a/MultiTabs227$Host;Le/e/a/SavedTabs227$Tab;I)V
    .registers 12

    .line 11
    invoke-static {p0}, Le/e/a/TabRecovery244;->clear(Le/e/a/MultiTabs227$Host;)V

    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const v1, 0x1020002

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    if-nez v0, :cond_11

    return-void

    :cond_11
    new-instance v1, Landroid/widget/LinearLayout;

    iget-object v2, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-direct {v1, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v2, 0x10

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v2, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {v2}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    iget-object v2, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const/16 v3, 0xc

    invoke-static {v2, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    iget-object v3, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const/16 v4, 0x8

    invoke-static {v3, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4, v3, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget-object v2, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    iget-object v3, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const-string v5, "Tab closed"

    const-string v6, "\u5df2\u95dc\u9589\u5206\u9801"

    const-string v7, "\u30bf\u30d6\u3092\u9589\u3058\u307e\u3057\u305f"

    invoke-static {v3, v7, v5, v6}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/16 v5, 0xd

    invoke-static {v2, v3, v5}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v2

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x2

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-direct {v3, v4, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v2, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    iget-object v3, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const-string v6, "Undo"

    const-string v7, "\u5fa9\u539f"

    const-string v8, "\u5143\u306b\u623b\u3059"

    invoke-static {v3, v8, v6, v7}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v5}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v2

    iget-object v3, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {v3}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    sget-object v3, Le/e/a/TabRecovery244;->notices:Ljava/util/Map;

    invoke-interface {v3, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    iget-object v5, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const/16 v6, 0x30

    invoke-static {v5, v6}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    const/16 v6, 0x50

    const/4 v7, -0x1

    invoke-direct {v3, v7, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-static {}, Le/e/a/MiniSession225;->showing()Z

    move-result v5

    if-eqz v5, :cond_9a

    iget-object v4, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const/16 v5, 0x40

    invoke-static {v4, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    :cond_9a
    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    invoke-virtual {v0, v1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Le/e/a/TabRecovery244$$ExternalSyntheticLambda3;

    invoke-direct {v0, p1, p2, p0}, Le/e/a/TabRecovery244$$ExternalSyntheticLambda3;-><init>(Le/e/a/SavedTabs227$Tab;ILe/e/a/MultiTabs227$Host;)V

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Le/e/a/TabRecovery244$$ExternalSyntheticLambda4;

    invoke-direct {p1, p0, v1}, Le/e/a/TabRecovery244$$ExternalSyntheticLambda4;-><init>(Le/e/a/MultiTabs227$Host;Landroid/widget/LinearLayout;)V

    const-wide/16 v2, 0x1770

    invoke-virtual {v1, p1, v2, v3}, Landroid/widget/LinearLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
