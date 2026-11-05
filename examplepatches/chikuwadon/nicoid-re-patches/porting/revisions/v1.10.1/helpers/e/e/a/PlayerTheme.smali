.class public final Le/e/a/PlayerTheme;
.super Ljava/lang/Object;
.source "PlayerTheme.java"


# static fields
.field private static final DETAILS:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/view/View;",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation
.end field

.field static final TAG_MODE:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 6
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/PlayerTheme;->DETAILS:Ljava/util/WeakHashMap;

    .line 8
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/PlayerTheme;->TAG_MODE:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static apply(Landroid/view/View;)V
    .registers 11

    .line 27
    invoke-static {p0}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 29
    const-string v8, "videomenulist"

    const-string v9, "infoscroll"

    const-string v1, "info"

    const-string v2, "tabinfo"

    const-string v3, "pager_title_strip"

    const-string v4, "pager"

    const-string v5, "scrollView1"

    const-string v6, "loadstatuslay"

    const-string v7, "videoinfotitlelay"

    filled-new-array/range {v1 .. v9}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    :goto_1e
    const/16 v3, 0x9

    if-lt v2, v3, :cond_23

    .line 39
    return-void

    .line 29
    :cond_23
    aget-object v3, v1, v2

    .line 30
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const-string v5, "id"

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v3, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v4

    .line 31
    if-nez v4, :cond_37

    const/4 v4, 0x0

    goto :goto_3b

    :cond_37
    invoke-virtual {p0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 32
    :goto_3b
    if-eqz v4, :cond_75

    .line 33
    invoke-static {v4}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    const-string v5, "pager"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4b

    invoke-static {v4}, Le/e/a/UiTheme191;->surface(Landroid/view/View;)V

    .line 34
    :cond_4b
    const-string v5, "pager_title_strip"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_75

    .line 35
    :try_start_53
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v5, "setTextColor"

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v6}, [Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    invoke-static {v4}, Le/e/a/ThemeChoice;->textColor(Landroid/view/View;)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_72
    .catch Ljava/lang/Exception; {:try_start_53 .. :try_end_72} :catch_73

    goto :goto_74

    .line 36
    :catch_73
    move-exception v3

    :goto_74
    nop

    .line 29
    :cond_75
    add-int/lit8 v2, v2, 0x1

    goto :goto_1e
.end method

.method static detailItem(Landroid/view/View;)V
    .registers 6

    .line 7
    if-eqz p0, :cond_67

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_d

    goto :goto_67

    :cond_d
    sget-object v0, Le/e/a/PlayerTheme;->DETAILS:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-ne v0, v1, :cond_20

    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_20

    return-void

    :cond_20
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "color"

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "nicoid_detail_item_dark"

    invoke-virtual {v1, v4, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_3a

    const v1, -0xd6d4cf

    goto :goto_42

    :cond_3a
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    :goto_42
    new-instance v2, Landroid/graphics/drawable/RippleDrawable;

    invoke-static {v0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v0

    const v3, 0xffffff

    and-int/2addr v0, v3

    const/high16 v3, 0x22000000

    or-int/2addr v0, v3

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v3, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    const/4 v1, 0x0

    invoke-direct {v2, v0, v3, v1}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v1}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {p0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    sget-object v0, Le/e/a/PlayerTheme;->DETAILS:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_67
    :goto_67
    return-void
.end method

.method public static detailRows(Landroid/view/View;)V
    .registers 6

    .line 12
    if-nez p0, :cond_3

    return-void

    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "userinfo"

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "id"

    invoke-virtual {v1, v2, v4, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v3, "taglist"

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v3, v4, v0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eqz v1, :cond_2e

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Le/e/a/PlayerTheme;->detailItem(Landroid/view/View;)V

    :cond_2e
    if-nez v0, :cond_32

    const/4 p0, 0x0

    goto :goto_36

    :cond_32
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    :goto_36
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_3f

    check-cast p0, Landroid/view/ViewGroup;

    invoke-static {p0}, Le/e/a/PlayerTheme;->tagRows(Landroid/view/ViewGroup;)V

    :cond_3f
    return-void
.end method

.method public static information(Landroid/view/View;)V
    .registers 8

    .line 14
    if-nez p0, :cond_3

    return-void

    .line 15
    :cond_3
    const-string v0, "nicoid_short_metadata"

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_14

    invoke-virtual {p0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    return-void

    .line 16
    :cond_14
    invoke-static {p0}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    invoke-static {p0}, Le/e/a/UiTheme191;->surface(Landroid/view/View;)V

    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 18
    const-string v2, "scrollView1"

    const-string v3, "userinfo"

    const-string v4, "info"

    const-string v5, "tabinfo"

    filled-new-array {v4, v5, v2, v3}, [Ljava/lang/String;

    move-result-object v2

    :goto_2a
    const/4 v3, 0x4

    if-lt v1, v3, :cond_4b

    .line 23
    const v0, 0x7f08007a

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    .line 24
    if-eqz p0, :cond_4a

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/View;

    if-eqz v0, :cond_4a

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    invoke-static {p0}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    invoke-static {p0}, Le/e/a/ThemeChoice;->tree(Landroid/view/View;)V

    .line 25
    :cond_4a
    return-void

    .line 18
    :cond_4b
    aget-object v3, v2, v1

    .line 19
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const-string v5, "id"

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v3, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    .line 20
    if-nez v3, :cond_5f

    const/4 v3, 0x0

    goto :goto_63

    :cond_5f
    invoke-virtual {p0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 21
    :goto_63
    if-eqz v3, :cond_6b

    invoke-static {v3}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    invoke-static {v3}, Le/e/a/ThemeChoice;->tree(Landroid/view/View;)V

    .line 18
    :cond_6b
    add-int/lit8 v1, v1, 0x1

    goto :goto_2a
.end method

.method private static tagGap(Landroid/view/View;I)V
    .registers 4

    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v1, :cond_13

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    if-eq v1, p1, :cond_13

    iput p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_13
    return-void
.end method

.method static tagItem(Landroid/view/View;Z)V
    .registers 9

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v1

    sget-object v2, Le/e/a/PlayerTheme;->TAG_MODE:Ljava/util/Map;

    invoke-interface {v2, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_2d

    sget-object v2, Le/e/a/PlayerTheme;->TAG_MODE:Ljava/util/Map;

    invoke-interface {v2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-ne v2, v1, :cond_2d

    sget-object v2, Le/e/a/PlayerTheme;->DETAILS:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    if-ne v2, v4, :cond_2d

    move v2, v3

    goto :goto_2e

    :cond_2d
    const/4 v2, 0x1

    :goto_2e
    if-eqz v2, :cond_84

    if-eqz v1, :cond_35

    const-string v2, "nicoid_tag_item_dark"

    goto :goto_37

    :cond_35
    const-string v2, "nicoid_tag_item_light"

    :goto_37
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const-string v5, "color"

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v2, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_51

    if-eqz v1, :cond_4d

    const v2, -0xdbd9d5

    goto :goto_59

    :cond_4d
    const v2, -0xf0f10

    goto :goto_59

    :cond_51
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    :goto_59
    new-instance v4, Landroid/graphics/drawable/RippleDrawable;

    invoke-static {v0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v5

    const v6, 0xffffff

    and-int/2addr v5, v6

    const/high16 v6, 0x33000000

    or-int/2addr v5, v6

    invoke-static {v5}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v5

    new-instance v6, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v6, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    const/4 v2, 0x0

    invoke-direct {v4, v5, v6, v2}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-static {p0, v4}, Le/e/a/FlatUi191;->replaceBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    sget-object v2, Le/e/a/PlayerTheme;->DETAILS:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p0, v4}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v2, Le/e/a/PlayerTheme;->TAG_MODE:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v2, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_84
    invoke-static {p0}, Le/e/a/FlatUi191;->tagDepth(Landroid/view/View;)V

    if-eqz p1, :cond_8a

    goto :goto_8f

    :cond_8a
    const/4 p1, 0x4

    invoke-static {v0, p1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    :goto_8f
    invoke-static {p0, v3}, Le/e/a/PlayerTheme;->tagGap(Landroid/view/View;I)V

    return-void
.end method

.method static tagRows(Landroid/view/ViewGroup;)V
    .registers 6

    .line 11
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1a

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v2, v0, Landroid/graphics/drawable/ColorDrawable;

    if-eqz v2, :cond_17

    check-cast v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/ColorDrawable;->getColor()I

    move-result v0

    if-eqz v0, :cond_1a

    :cond_17
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->setBackgroundColor(I)V

    :cond_1a
    move v0, v1

    :goto_1b
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-lt v0, v2, :cond_22

    return-void

    :cond_22
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v3, v2, Landroid/widget/Button;

    if-nez v3, :cond_39

    instance-of v3, v2, Landroid/widget/TextView;

    if-eqz v3, :cond_2f

    goto :goto_39

    :cond_2f
    instance-of v3, v2, Landroid/view/ViewGroup;

    if-eqz v3, :cond_46

    check-cast v2, Landroid/view/ViewGroup;

    invoke-static {v2}, Le/e/a/PlayerTheme;->tagRows(Landroid/view/ViewGroup;)V

    goto :goto_46

    :cond_39
    :goto_39
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    if-ne v0, v3, :cond_42

    goto :goto_43

    :cond_42
    move v4, v1

    :goto_43
    invoke-static {v2, v4}, Le/e/a/PlayerTheme;->tagItem(Landroid/view/View;Z)V

    :cond_46
    :goto_46
    add-int/lit8 v0, v0, 0x1

    goto :goto_1b
.end method
