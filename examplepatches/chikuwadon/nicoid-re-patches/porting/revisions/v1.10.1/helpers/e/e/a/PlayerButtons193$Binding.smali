.class final Le/e/a/PlayerButtons193$Binding;
.super Ljava/lang/Object;
.source "PlayerButtons193.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/PlayerButtons193;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Binding"
.end annotation


# instance fields
.field final prefs:Landroid/content/SharedPreferences;

.field final root:Landroid/view/View;

.field final row:Landroid/widget/LinearLayout;

.field updating:Z


# direct methods
.method constructor <init>(Landroid/view/View;Landroid/widget/LinearLayout;)V
    .registers 3

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PlayerButtons193$Binding;->root:Landroid/view/View;

    iput-object p2, p0, Le/e/a/PlayerButtons193$Binding;->row:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Le/e/a/PlayerButtons193$Binding;->prefs:Landroid/content/SharedPreferences;

    return-void
.end method


# virtual methods
.method synthetic lambda$0$e-e-a-PlayerButtons193$Binding(Landroid/view/View;)Z
    .registers 4

    .line 45
    sget-object p1, Le/e/a/PlayerButtons193;->IDS:[Ljava/lang/String;

    array-length p1, p1

    new-array p1, p1, [Ljava/lang/CharSequence;

    const/4 v0, 0x0

    :goto_6
    sget-object v1, Le/e/a/PlayerButtons193;->IDS:[Ljava/lang/String;

    array-length v1, v1

    if-lt v0, v1, :cond_35

    iget-object v0, p0, Le/e/a/PlayerButtons193$Binding;->root:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u30d7\u30ec\u30a4\u30e4\u30fc\u64cd\u4f5c"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Le/e/a/PlayerButtons193$Binding$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Le/e/a/PlayerButtons193$Binding$$ExternalSyntheticLambda0;-><init>(Le/e/a/PlayerButtons193$Binding;)V

    invoke-virtual {v0, p1, v1}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-static {p1}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    const/4 p1, 0x1

    return p1

    :cond_35
    sget-object v1, Le/e/a/PlayerButtons193;->LABELS:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, p1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_6
.end method

.method synthetic lambda$1$e-e-a-PlayerButtons193$Binding(Landroid/content/DialogInterface;I)V
    .registers 4

    .line 45
    iget-object p1, p0, Le/e/a/PlayerButtons193$Binding;->root:Landroid/view/View;

    sget-object v0, Le/e/a/PlayerButtons193;->IDS:[Ljava/lang/String;

    aget-object p2, v0, p2

    invoke-static {p1, p2}, Le/e/a/PlayerButtons193;->button(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_f

    invoke-virtual {p1}, Landroid/view/View;->performClick()Z

    :cond_f
    return-void
.end method

.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 3

    .line 47
    const-string p1, "player_button_order_v1"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_10

    const-string p1, "player_buttons_hidden_v1"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1a

    :cond_10
    iget-object p1, p0, Le/e/a/PlayerButtons193$Binding;->root:Landroid/view/View;

    new-instance p2, Le/e/a/PlayerButtons193$Binding$$ExternalSyntheticLambda1;

    invoke-direct {p2, p0}, Le/e/a/PlayerButtons193$Binding$$ExternalSyntheticLambda1;-><init>(Le/e/a/PlayerButtons193$Binding;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_1a
    return-void
.end method

.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 2

    .line 48
    iget-object p1, p0, Le/e/a/PlayerButtons193$Binding;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {p1, p0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    invoke-virtual {p0}, Le/e/a/PlayerButtons193$Binding;->update()V

    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 2

    .line 49
    iget-object p1, p0, Le/e/a/PlayerButtons193$Binding;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {p1, p0}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    return-void
.end method

.method update()V
    .registers 11

    .line 41
    iget-boolean v0, p0, Le/e/a/PlayerButtons193$Binding;->updating:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/PlayerButtons193$Binding;->updating:Z

    const/4 v0, 0x0

    :try_start_9
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    iget-object v2, p0, Le/e/a/PlayerButtons193$Binding;->row:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    sget-object v3, Le/e/a/PlayerButtons193;->IDS:[Ljava/lang/String;

    array-length v4, v3

    const/4 v5, 0x0

    :goto_18
    if-lt v5, v4, :cond_e6

    .line 42
    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_22
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_d9

    iget-object v3, p0, Le/e/a/PlayerButtons193$Binding;->prefs:Landroid/content/SharedPreferences;

    invoke-static {v3}, Le/e/a/PlayerButtons193;->hidden(Landroid/content/SharedPreferences;)Ljava/util/Set;

    move-result-object v3

    iget-object v4, p0, Le/e/a/PlayerButtons193$Binding;->prefs:Landroid/content/SharedPreferences;

    invoke-static {v4}, Le/e/a/PlayerButtons193;->order(Landroid/content/SharedPreferences;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_38
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_af

    .line 43
    iget-object v2, p0, Le/e/a/PlayerButtons193$Binding;->row:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0, v0, v0, v0}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget-object v2, p0, Le/e/a/PlayerButtons193$Binding;->row:Landroid/widget/LinearLayout;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setWeightSum(F)V

    iget-object v2, p0, Le/e/a/PlayerButtons193$Binding;->row:Landroid/widget/LinearLayout;

    const v3, 0x800015

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/4 v2, 0x0

    :goto_52
    iget-object v3, p0, Le/e/a/PlayerButtons193$Binding;->row:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v3

    if-lt v2, v3, :cond_9b

    .line 44
    iget-object v1, p0, Le/e/a/PlayerButtons193$Binding;->row:Landroid/widget/LinearLayout;

    invoke-static {v1}, Le/e/a/PlayerButtons192;->wrap(Landroid/widget/LinearLayout;)Landroid/widget/HorizontalScrollView;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/HorizontalScrollView;->setFillViewport(Z)V

    invoke-virtual {v1}, Landroid/widget/HorizontalScrollView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iget-object v3, p0, Le/e/a/PlayerButtons193$Binding;->root:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    const/16 v4, 0x30

    invoke-static {v3, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    iput v3, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v1, v0, v0, v0, v0}, Landroid/widget/HorizontalScrollView;->setPadding(IIII)V

    .line 45
    iget-object v1, p0, Le/e/a/PlayerButtons193$Binding;->root:Landroid/view/View;

    const-string v2, "infobutton"

    invoke-static {v1, v2}, Le/e/a/PlayerButtons193;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Le/e/a/PlayerButtons193$Binding;->root:Landroid/view/View;

    const-string v3, "titlebartext"

    invoke-static {v2, v3}, Le/e/a/PlayerButtons193;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    new-instance v3, Le/e/a/PlayerButtons193$Binding$$ExternalSyntheticLambda2;

    invoke-direct {v3, p0}, Le/e/a/PlayerButtons193$Binding$$ExternalSyntheticLambda2;-><init>(Le/e/a/PlayerButtons193$Binding;)V

    if-eqz v1, :cond_92

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    :cond_92
    if-eqz v2, :cond_98

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    :try_end_97
    .catchall {:try_start_9 .. :try_end_97} :catchall_109

    .line 46
    nop

    :cond_98
    iput-boolean v0, p0, Le/e/a/PlayerButtons193$Binding;->updating:Z

    return-void

    .line 43
    :cond_9b
    :try_start_9b
    iget-object v3, p0, Le/e/a/PlayerButtons193$Binding;->row:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Map;->containsValue(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_ac

    const-string v4, "extra"

    invoke-static {v3, v4}, Le/e/a/ControlSizing193;->item(Landroid/view/View;Ljava/lang/String;)V

    :cond_ac
    add-int/lit8 v2, v2, 0x1

    goto :goto_52

    .line 42
    :cond_af
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v1, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/View;

    if-nez v6, :cond_bf

    goto/16 :goto_38

    :cond_bf
    iget-object v7, p0, Le/e/a/PlayerButtons193$Binding;->row:Landroid/widget/LinearLayout;

    add-int/lit8 v8, v2, 0x1

    invoke-virtual {v7, v6, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    invoke-static {v6, v5}, Le/e/a/ControlSizing193;->item(Landroid/view/View;Ljava/lang/String;)V

    invoke-interface {v3, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d2

    const/16 v2, 0x8

    goto :goto_d3

    :cond_d2
    const/4 v2, 0x0

    :goto_d3
    invoke-virtual {v6, v2}, Landroid/view/View;->setVisibility(I)V

    move v2, v8

    goto/16 :goto_38

    :cond_d9
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    iget-object v5, p0, Le/e/a/PlayerButtons193$Binding;->row:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v4}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    goto/16 :goto_22

    .line 41
    :cond_e6
    aget-object v6, v3, v5

    iget-object v7, p0, Le/e/a/PlayerButtons193$Binding;->root:Landroid/view/View;

    invoke-static {v7, v6}, Le/e/a/PlayerButtons193;->button(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v7

    if-eqz v7, :cond_105

    invoke-virtual {v7}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v8

    iget-object v9, p0, Le/e/a/PlayerButtons193$Binding;->row:Landroid/widget/LinearLayout;

    if-ne v8, v9, :cond_105

    invoke-interface {v1, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v6, p0, Le/e/a/PlayerButtons193$Binding;->row:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v7}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v6

    invoke-static {v2, v6}, Ljava/lang/Math;->min(II)I

    move-result v2
    :try_end_105
    .catchall {:try_start_9b .. :try_end_105} :catchall_109

    :cond_105
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_18

    .line 46
    :catchall_109
    move-exception v1

    iput-boolean v0, p0, Le/e/a/PlayerButtons193$Binding;->updating:Z

    throw v1
.end method
