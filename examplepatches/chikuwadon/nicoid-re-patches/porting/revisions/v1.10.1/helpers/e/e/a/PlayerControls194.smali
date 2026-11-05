.class public final Le/e/a/PlayerControls194;
.super Ljava/lang/Object;
.source "PlayerControls194.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/PlayerControls194$Binding;
    }
.end annotation


# static fields
.field static final BINDINGS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Le/e/a/PlayerControls194$Binding;",
            ">;"
        }
    .end annotation
.end field

.field static final IDS:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .line 5
    const-string v6, "comments"

    const-string v7, "fullscreen"

    const-string v0, "speed"

    const-string v1, "quality"

    const-string v2, "popup"

    const-string v3, "background"

    const-string v4, "mute"

    const-string v5, "repeat"

    filled-new-array/range {v0 .. v7}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/PlayerControls194;->IDS:[Ljava/lang/String;

    .line 6
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/PlayerControls194;->BINDINGS:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static apply(Ljava/lang/Object;Landroid/view/View;)V
    .registers 12

    .line 10
    const-string v0, "topmenulay"

    invoke-static {p1, v0}, Le/e/a/PlayerControls194;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    instance-of v1, v0, Landroid/widget/LinearLayout;

    if-nez v1, :cond_e

    invoke-static {p1}, Le/e/a/Revision201;->watchButtons(Landroid/view/View;)V

    return-void

    :cond_e
    check-cast v0, Landroid/widget/LinearLayout;

    const-string v1, "mute"

    const-string v2, "background"

    filled-new-array {v2, v1}, [Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_1a
    const/4 v5, 0x2

    if-lt v4, v5, :cond_59

    .line 11
    sget-object p0, Le/e/a/PlayerControls194;->BINDINGS:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_37

    new-instance p0, Le/e/a/PlayerControls194$Binding;

    invoke-direct {p0, p1, v0}, Le/e/a/PlayerControls194$Binding;-><init>(Landroid/view/View;Landroid/widget/LinearLayout;)V

    sget-object v1, Le/e/a/PlayerControls194;->BINDINGS:Ljava/util/Map;

    invoke-interface {v1, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1, p0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    iget-object v1, p0, Le/e/a/PlayerControls194$Binding;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v1, p0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    :cond_37
    invoke-static {v0, p1}, Le/e/a/PlayerControls194;->arrange(Landroid/widget/LinearLayout;Landroid/view/View;)V

    .line 12
    const-string p0, "infobutton"

    invoke-static {p1, p0}, Le/e/a/PlayerControls194;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    const-string v0, "titlebartext"

    invoke-static {p1, v0}, Le/e/a/PlayerControls194;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    new-instance v1, Le/e/a/PlayerControls194$$ExternalSyntheticLambda2;

    invoke-direct {v1, p1}, Le/e/a/PlayerControls194$$ExternalSyntheticLambda2;-><init>(Landroid/view/View;)V

    if-eqz p0, :cond_50

    invoke-virtual {p0, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    :cond_50
    if-eqz v0, :cond_55

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 13
    :cond_55
    invoke-static {p1}, Le/e/a/Revision201;->watchButtons(Landroid/view/View;)V

    return-void

    .line 10
    :cond_59
    aget-object v5, v1, v4

    invoke-static {p1, v5}, Le/e/a/PlayerControls194;->button(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v6

    if-nez v6, :cond_d4

    new-instance v6, Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-direct {v6, v7}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "player-"

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_85

    const-string v7, "\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u518d\u751f"

    goto :goto_87

    :cond_85
    const-string v7, "\u30df\u30e5\u30fc\u30c8"

    :goto_87
    invoke-static {v7}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_97

    const-string v7, "headphones"

    goto :goto_99

    :cond_97
    const-string v7, "volume"

    :goto_99
    invoke-static {v6, v7}, Le/e/a/PlayerIcons;->symbol(Landroid/view/View;Ljava/lang/String;)V

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_ab

    new-instance v5, Le/e/a/PlayerControls194$$ExternalSyntheticLambda0;

    invoke-direct {v5, p0, p1}, Le/e/a/PlayerControls194$$ExternalSyntheticLambda0;-><init>(Ljava/lang/Object;Landroid/view/View;)V

    invoke-virtual {v6, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_ba

    :cond_ab
    const/4 v5, 0x1

    new-array v5, v5, [F

    const/high16 v7, 0x3f800000    # 1.0f

    aput v7, v5, v3

    new-instance v7, Le/e/a/PlayerControls194$$ExternalSyntheticLambda1;

    invoke-direct {v7, p0, v6, v5}, Le/e/a/PlayerControls194$$ExternalSyntheticLambda1;-><init>(Ljava/lang/Object;Landroid/view/View;[F)V

    invoke-virtual {v6, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :goto_ba
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    const/16 v8, 0x24

    invoke-static {v7, v8}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9, v8}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-direct {v5, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v6, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_d4
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_1a
.end method

.method public static arrange(Landroid/widget/LinearLayout;Landroid/view/View;)V
    .registers 14

    .line 14
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "player_buttons_hidden_v1"

    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v1

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    new-instance v3, Ljava/util/LinkedHashMap;

    invoke-direct {v3}, Ljava/util/LinkedHashMap;-><init>()V

    sget-object v4, Le/e/a/PlayerControls194;->IDS:[Ljava/lang/String;

    array-length v5, v4

    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_20
    if-lt v7, v5, :cond_100

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_2a
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_f5

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getWidth()I

    move-result v4

    if-gtz v4, :cond_40

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v4, v4, Landroid/util/DisplayMetrics;->widthPixels:I

    :cond_40
    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    const/4 v7, 0x0

    :cond_49
    :goto_49
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-nez v8, :cond_e5

    add-int/lit8 v7, v7, 0x2

    const/4 v5, 0x1

    invoke-static {v5, v7}, Ljava/lang/Math;->max(II)I

    move-result v5

    div-int/2addr v4, v5

    const/16 v5, 0x20

    invoke-static {v5, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    const/16 v8, 0x24

    invoke-static {v8, v4}, Ljava/lang/Math;->min(II)I

    move-result v9

    invoke-static {v0}, Le/e/a/PlayerControls194;->order(Landroid/content/SharedPreferences;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_6b
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_7c

    .line 15
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setWeightSum(F)V

    const p1, 0x800015

    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 16
    return-void

    .line 14
    :cond_7c
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    if-nez v4, :cond_8b

    goto :goto_6b

    :cond_8b
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    const-string v11, "speed"

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_a4

    const-string v11, "quality"

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_a2

    goto :goto_a4

    :cond_a2
    move v11, v9

    goto :goto_a6

    :cond_a4
    :goto_a4
    const/16 v11, 0x30

    :goto_a6
    invoke-static {v7, v11}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v11

    invoke-static {v11, v8}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v11

    invoke-direct {v5, v7, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    add-int/lit8 v7, v2, 0x1

    invoke-virtual {p0, v4, v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    invoke-interface {v1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c3

    const/16 v0, 0x8

    goto :goto_c4

    :cond_c3
    const/4 v0, 0x0

    :goto_c4
    invoke-virtual {v4, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v4, v6}, Landroid/view/View;->setMinimumWidth(I)V

    invoke-virtual {v4, v6}, Landroid/view/View;->setMinimumHeight(I)V

    invoke-virtual {v4, v6, v6, v6, v6}, Landroid/view/View;->setPadding(IIII)V

    instance-of v0, v4, Landroid/widget/TextView;

    if-eqz v0, :cond_e3

    check-cast v4, Landroid/widget/TextView;

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setMinWidth(I)V

    const/high16 v0, 0x41400000    # 12.0f

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setTextSize(F)V

    const/16 v0, 0x11

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setGravity(I)V

    :cond_e3
    move v2, v7

    goto :goto_6b

    :cond_e5
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-interface {v1, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_49

    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_49

    :cond_f5
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    invoke-virtual {p0, v4}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    goto/16 :goto_2a

    :cond_100
    aget-object v8, v4, v7

    invoke-static {p1, v8}, Le/e/a/PlayerControls194;->button(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v9

    if-eqz v9, :cond_119

    invoke-virtual {v9}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v10

    if-ne v10, p0, :cond_119

    invoke-virtual {v3, v8, v9}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, v9}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v8

    invoke-static {v2, v8}, Ljava/lang/Math;->min(II)I

    move-result v2

    :cond_119
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_20
.end method

.method static button(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .registers 4

    .line 8
    invoke-static {p0, p1}, Le/e/a/FullscreenScreen203;->button(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_7

    return-object v0

    :cond_7
    const-string v0, "speed"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5f

    const-string v0, "quality"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    goto :goto_5f

    :cond_18
    const-string v0, "background"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_57

    const-string v0, "mute"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_29

    goto :goto_57

    :cond_29
    const-string v0, "comments"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    const-string p1, "commentbutton"

    goto :goto_52

    :cond_34
    const-string v0, "fullscreen"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3f

    const-string p1, "fullscbutton"

    goto :goto_52

    :cond_3f
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p1, "button"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_52
    invoke-static {p0, p1}, Le/e/a/PlayerControls194;->find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    goto :goto_72

    :cond_57
    :goto_57
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "player-"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_66

    :cond_5f
    :goto_5f
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "modern-"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_66
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object p0

    :goto_72
    return-object p0
.end method

.method static find(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;
    .registers 5

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "id"

    invoke-virtual {v0, p1, v2, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$0(Ljava/lang/Object;Landroid/view/View;Landroid/view/View;)V
    .registers 9

    .line 10
    :try_start_0
    const-string p2, "e.e.a.PlayerButtons192"

    invoke-static {p2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p2

    const-string v0, "background"

    const/4 v1, 0x2

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-class v3, Landroid/view/View;

    const/4 v5, 0x1

    aput-object v3, v2, v5

    invoke-virtual {p2, v0, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p2

    new-array v0, v1, [Ljava/lang/Object;

    aput-object p0, v0, v4

    aput-object p1, v0, v5

    const/4 p0, 0x0

    invoke-virtual {p2, p0, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_23} :catch_24

    goto :goto_2c

    :catch_24
    move-exception p0

    const-string p1, "nicoid-player"

    const-string p2, "Background switch failed"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_2c
    return-void
.end method

.method static synthetic lambda$1(Ljava/lang/Object;Landroid/view/View;[FLandroid/view/View;)V
    .registers 10

    .line 10
    :try_start_0
    const-string p3, "a0"

    invoke-static {p0, p3}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    move-result p3
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_a} :catch_5a

    const/4 v0, 0x1

    xor-int/2addr p3, v0

    const/4 v1, 0x0

    if-eqz p3, :cond_2b

    :try_start_f
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "getVolume"

    new-array v4, v1, [Ljava/lang/Class;

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    new-array v3, v1, [Ljava/lang/Object;

    invoke-virtual {v2, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->floatValue()F

    move-result v2

    aput v2, p2, v1
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_29} :catch_2a

    goto :goto_2b

    :catch_2a
    move-exception v2

    :cond_2b
    :goto_2b
    :try_start_2b
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "setVolume"

    new-array v4, v0, [Ljava/lang/Class;

    sget-object v5, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v5, v4, v1

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    new-array v0, v0, [Ljava/lang/Object;

    if-eqz p3, :cond_41

    const/4 p2, 0x0

    goto :goto_43

    :cond_41
    aget p2, p2, v1

    :goto_43
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    aput-object p2, v0, v1

    invoke-virtual {v2, p0, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1, p3}, Landroid/view/View;->setSelected(Z)V

    if-eqz p3, :cond_54

    const-string p0, "muted"

    goto :goto_56

    :cond_54
    const-string p0, "volume"

    :goto_56
    invoke-static {p1, p0}, Le/e/a/PlayerIcons;->symbol(Landroid/view/View;Ljava/lang/String;)V
    :try_end_59
    .catch Ljava/lang/Exception; {:try_start_2b .. :try_end_59} :catch_5a

    goto :goto_62

    :catch_5a
    move-exception p0

    const-string p1, "nicoid-player"

    const-string p2, "Mute failed"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_62
    return-void
.end method

.method static synthetic lambda$2(Landroid/view/View;Landroid/view/View;)Z
    .registers 10

    .line 12
    const-string v6, "\u30b3\u30e1\u30f3\u30c8\u8868\u793a"

    const-string v7, "\u5168\u753b\u9762\u8868\u793a"

    const-string v0, "\u518d\u751f\u901f\u5ea6"

    const-string v1, "\u753b\u8cea"

    const-string v2, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u518d\u751f"

    const-string v3, "\u30d0\u30c3\u30af\u30b0\u30e9\u30a6\u30f3\u30c9\u518d\u751f"

    const-string v4, "\u30df\u30e5\u30fc\u30c8"

    const-string v5, "\u30ea\u30d4\u30fc\u30c8"

    filled-new-array/range {v0 .. v7}, [Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    :goto_15
    const/16 v1, 0x8

    if-lt v0, v1, :cond_41

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

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

    new-instance v1, Le/e/a/PlayerControls194$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Le/e/a/PlayerControls194$$ExternalSyntheticLambda3;-><init>(Landroid/view/View;)V

    invoke-virtual {v0, p1, v1}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    const/4 p0, 0x1

    return p0

    :cond_41
    aget-object v1, p1, v0

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, p1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_15
.end method

.method static synthetic lambda$3(Landroid/view/View;Landroid/content/DialogInterface;I)V
    .registers 3

    .line 12
    sget-object p1, Le/e/a/PlayerControls194;->IDS:[Ljava/lang/String;

    aget-object p1, p1, p2

    invoke-static {p0, p1}, Le/e/a/PlayerControls194;->button(Landroid/view/View;Ljava/lang/String;)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_d

    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    :cond_d
    return-void
.end method

.method static order(Landroid/content/SharedPreferences;)Ljava/util/List;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/SharedPreferences;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 9
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    :try_start_6
    new-instance v2, Lorg/json/JSONArray;

    const-string v3, "player_button_order_v1"

    const-string v4, "[]"

    invoke-interface {p0, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v2, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    const/4 p0, 0x0

    :goto_14
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-lt p0, v3, :cond_1b

    goto :goto_38

    :cond_1b
    invoke-virtual {v2, p0}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Le/e/a/PlayerControls194;->IDS:[Ljava/lang/String;

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_34

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_34

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_34} :catch_37

    :cond_34
    add-int/lit8 p0, p0, 0x1

    goto :goto_14

    :catch_37
    move-exception p0

    :goto_38
    const-string v8, "fullscreen"

    const-string v9, "repeat"

    const-string v2, "speed"

    const-string v3, "quality"

    const-string v4, "popup"

    const-string v5, "background"

    const-string v6, "mute"

    const-string v7, "comments"

    filled-new-array/range {v2 .. v9}, [Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_59

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_59
    sget-object p0, Le/e/a/PlayerControls194;->IDS:[Ljava/lang/String;

    array-length v2, p0

    :goto_5c
    if-lt v1, v2, :cond_5f

    return-object v0

    :cond_5f
    aget-object v3, p0, v1

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6a

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_6a
    add-int/lit8 v1, v1, 0x1

    goto :goto_5c
.end method
