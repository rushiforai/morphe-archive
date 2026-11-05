.class final Le/e/a/PlayerButtons192$Binding;
.super Ljava/lang/Object;
.source "PlayerButtons192.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/PlayerButtons192;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Binding"
.end annotation


# instance fields
.field final fragment:Ljava/lang/Object;

.field final prefs:Landroid/content/SharedPreferences;

.field final root:Landroid/view/View;

.field final row:Landroid/widget/LinearLayout;

.field updating:Z


# direct methods
.method constructor <init>(Ljava/lang/Object;Landroid/view/View;Landroid/widget/LinearLayout;)V
    .registers 4

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PlayerButtons192$Binding;->fragment:Ljava/lang/Object;

    iput-object p2, p0, Le/e/a/PlayerButtons192$Binding;->root:Landroid/view/View;

    iput-object p3, p0, Le/e/a/PlayerButtons192$Binding;->row:Landroid/widget/LinearLayout;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Le/e/a/PlayerButtons192$Binding;->prefs:Landroid/content/SharedPreferences;

    return-void
.end method


# virtual methods
.method alternatives()V
    .registers 5

    .line 16
    sget-object v0, Le/e/a/PlayerButtons192;->IDS:[Ljava/lang/String;

    array-length v0, v0

    new-array v1, v0, [Ljava/lang/CharSequence;

    const/4 v2, 0x0

    :goto_6
    if-lt v2, v0, :cond_31

    iget-object v0, p0, Le/e/a/PlayerButtons192$Binding;->root:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v2, "\u30d7\u30ec\u30a4\u30e4\u30fc\u64cd\u4f5c"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v2, Le/e/a/PlayerButtons192$Binding$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0}, Le/e/a/PlayerButtons192$Binding$$ExternalSyntheticLambda1;-><init>(Le/e/a/PlayerButtons192$Binding;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void

    :cond_31
    sget-object v3, Le/e/a/PlayerButtons192;->LABELS:[Ljava/lang/String;

    aget-object v3, v3, v2

    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_6
.end method

.method synthetic lambda$0$e-e-a-PlayerButtons192$Binding(Landroid/view/View;)Z
    .registers 2

    .line 16
    invoke-virtual {p0}, Le/e/a/PlayerButtons192$Binding;->alternatives()V

    const/4 p1, 0x1

    return p1
.end method

.method synthetic lambda$1$e-e-a-PlayerButtons192$Binding(Landroid/view/View;)Z
    .registers 2

    .line 16
    invoke-virtual {p0}, Le/e/a/PlayerButtons192$Binding;->alternatives()V

    const/4 p1, 0x1

    return p1
.end method

.method synthetic lambda$2$e-e-a-PlayerButtons192$Binding(Landroid/content/DialogInterface;I)V
    .registers 4

    .line 16
    iget-object p1, p0, Le/e/a/PlayerButtons192$Binding;->root:Landroid/view/View;

    sget-object v0, Le/e/a/PlayerButtons192;->IDS:[Ljava/lang/String;

    aget-object p2, v0, p2

    invoke-static {p1, p2}, Le/e/a/PlayerButtons192;->button(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_f

    invoke-virtual {p1}, Landroid/view/View;->performClick()Z

    :cond_f
    return-void
.end method

.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 3

    .line 16
    const-string p1, "player_button_order_v1"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_10

    const-string p1, "player_buttons_hidden_v1"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1a

    :cond_10
    iget-object p1, p0, Le/e/a/PlayerButtons192$Binding;->root:Landroid/view/View;

    new-instance p2, Le/e/a/PlayerButtons192$Binding$$ExternalSyntheticLambda0;

    invoke-direct {p2, p0}, Le/e/a/PlayerButtons192$Binding$$ExternalSyntheticLambda0;-><init>(Le/e/a/PlayerButtons192$Binding;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_1a
    return-void
.end method

.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 2

    .line 16
    iget-object p1, p0, Le/e/a/PlayerButtons192$Binding;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {p1, p0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    invoke-virtual {p0}, Le/e/a/PlayerButtons192$Binding;->update()V

    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 2

    .line 16
    iget-object p1, p0, Le/e/a/PlayerButtons192$Binding;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {p1, p0}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    return-void
.end method

.method update()V
    .registers 11

    .line 16
    iget-boolean v0, p0, Le/e/a/PlayerButtons192$Binding;->updating:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/PlayerButtons192$Binding;->updating:Z

    const/4 v0, 0x0

    :try_start_9
    iget-object v1, p0, Le/e/a/PlayerButtons192$Binding;->prefs:Landroid/content/SharedPreferences;

    invoke-static {v1}, Le/e/a/PlayerButtons192;->order(Landroid/content/SharedPreferences;)Ljava/util/List;

    move-result-object v1

    iget-object v2, p0, Le/e/a/PlayerButtons192$Binding;->prefs:Landroid/content/SharedPreferences;

    invoke-static {v2}, Le/e/a/PlayerButtons192;->hidden(Landroid/content/SharedPreferences;)Ljava/util/Set;

    move-result-object v2

    iget-object v3, p0, Le/e/a/PlayerButtons192$Binding;->row:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v3

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1f
    :goto_1f
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_10b

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_29
    :goto_29
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/16 v5, 0x30

    if-nez v4, :cond_97

    iget-object v1, p0, Le/e/a/PlayerButtons192$Binding;->row:Landroid/widget/LinearLayout;

    const v2, 0x800015

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v1, p0, Le/e/a/PlayerButtons192$Binding;->row:Landroid/widget/LinearLayout;

    invoke-static {v1}, Le/e/a/PlayerButtons192;->wrap(Landroid/widget/LinearLayout;)Landroid/widget/HorizontalScrollView;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/HorizontalScrollView;->setFillViewport(Z)V

    invoke-virtual {v1}, Landroid/widget/HorizontalScrollView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iget v2, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    iget-object v3, p0, Le/e/a/PlayerButtons192$Binding;->root:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    if-eq v2, v3, :cond_67

    invoke-virtual {v1}, Landroid/widget/HorizontalScrollView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iget-object v3, p0, Le/e/a/PlayerButtons192$Binding;->root:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    iput v3, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v1}, Landroid/widget/HorizontalScrollView;->requestLayout()V

    :cond_67
    iget-object v1, p0, Le/e/a/PlayerButtons192$Binding;->root:Landroid/view/View;

    const-string v2, "titlebartext"

    invoke-static {v1, v2}, Le/e/a/PlayerVisibility192;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_82

    new-instance v2, Le/e/a/PlayerButtons192$Binding$$ExternalSyntheticLambda2;

    invoke-direct {v2, p0}, Le/e/a/PlayerButtons192$Binding$$ExternalSyntheticLambda2;-><init>(Le/e/a/PlayerButtons192$Binding;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    const-string v2, "\u9577\u62bc\u3057\u3067\u30d7\u30ec\u30a4\u30e4\u30fc\u64cd\u4f5c"

    invoke-static {v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_82
    iget-object v1, p0, Le/e/a/PlayerButtons192$Binding;->root:Landroid/view/View;

    const-string v2, "infobutton"

    invoke-static {v1, v2}, Le/e/a/PlayerVisibility192;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_94

    new-instance v2, Le/e/a/PlayerButtons192$Binding$$ExternalSyntheticLambda3;

    invoke-direct {v2, p0}, Le/e/a/PlayerButtons192$Binding$$ExternalSyntheticLambda3;-><init>(Le/e/a/PlayerButtons192$Binding;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    :try_end_94
    .catchall {:try_start_9 .. :try_end_94} :catchall_12d

    :cond_94
    iput-boolean v0, p0, Le/e/a/PlayerButtons192$Binding;->updating:Z

    return-void

    :cond_97
    :try_start_97
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iget-object v6, p0, Le/e/a/PlayerButtons192$Binding;->root:Landroid/view/View;

    invoke-static {v6, v4}, Le/e/a/PlayerButtons192;->button(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_29

    invoke-virtual {v6}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v7

    iget-object v8, p0, Le/e/a/PlayerButtons192$Binding;->row:Landroid/widget/LinearLayout;

    if-eq v7, v8, :cond_af

    goto/16 :goto_29

    :cond_af
    iget-object v7, p0, Le/e/a/PlayerButtons192$Binding;->row:Landroid/widget/LinearLayout;

    invoke-virtual {v7, v6}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v7

    if-eq v7, v3, :cond_c1

    iget-object v7, p0, Le/e/a/PlayerButtons192$Binding;->row:Landroid/widget/LinearLayout;

    invoke-virtual {v7, v6}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    iget-object v7, p0, Le/e/a/PlayerButtons192$Binding;->row:Landroid/widget/LinearLayout;

    invoke-virtual {v7, v6, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    :cond_c1
    invoke-interface {v2, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_ca

    const/16 v7, 0x8

    goto :goto_cb

    :cond_ca
    const/4 v7, 0x0

    :goto_cb
    invoke-virtual {v6, v7}, Landroid/view/View;->setVisibility(I)V

    iget-object v7, p0, Le/e/a/PlayerButtons192$Binding;->root:Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    iget-object v8, p0, Le/e/a/PlayerButtons192$Binding;->root:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v8

    const-string v9, "quality"

    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_ee

    const-string v9, "speed"

    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_f0

    :cond_ee
    const/16 v5, 0x38

    :cond_f0
    invoke-static {v8, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    iget v8, v5, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ne v8, v4, :cond_100

    iget v8, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v8, v7, :cond_107

    :cond_100
    iput v4, v5, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v7, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v6, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_107
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_29

    :cond_10b
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    iget-object v6, p0, Le/e/a/PlayerButtons192$Binding;->root:Landroid/view/View;

    invoke-static {v6, v5}, Le/e/a/PlayerButtons192;->button(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_1f

    invoke-virtual {v5}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v6

    iget-object v7, p0, Le/e/a/PlayerButtons192$Binding;->row:Landroid/widget/LinearLayout;

    if-ne v6, v7, :cond_1f

    iget-object v6, p0, Le/e/a/PlayerButtons192$Binding;->row:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v5}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v5

    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    move-result v3
    :try_end_12b
    .catchall {:try_start_97 .. :try_end_12b} :catchall_12d

    goto/16 :goto_1f

    :catchall_12d
    move-exception v1

    iput-boolean v0, p0, Le/e/a/PlayerButtons192$Binding;->updating:Z

    throw v1
.end method
