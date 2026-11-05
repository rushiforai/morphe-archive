.class public final Le/e/a/ListDividers191;
.super Ljava/lang/Object;
.source "ListDividers191.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static color(Landroid/content/Context;)I
    .registers 5

    .line 5
    invoke-static {p0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_9

    const-string v0, "nicoid_list_divider_dark"

    goto :goto_b

    :cond_9
    const-string v0, "nicoid_list_divider_light"

    :goto_b
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "color"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_29

    invoke-static {p0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_25

    const p0, 0x22eeeeee

    goto :goto_31

    :cond_25
    const p0, 0x22202124

    goto :goto_31

    :cond_29
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result p0

    :goto_31
    return p0
.end method

.method public static tree(Landroid/view/View;)V
    .registers 5

    .line 6
    if-eqz p0, :cond_8d

    invoke-static {p0}, Le/e/a/UiTheme191;->media(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_a

    goto/16 :goto_8d

    :cond_a
    const-string v0, "nicoid-list-divider"

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_35

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ListDividers191;->color(Landroid/content/Context;)I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    instance-of v1, v1, Landroid/graphics/drawable/ColorDrawable;

    if-eqz v1, :cond_32

    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/ColorDrawable;->getColor()I

    move-result v1

    if-eq v1, v0, :cond_35

    :cond_32
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    :cond_35
    instance-of v0, p0, Landroid/widget/ListView;

    if-eqz v0, :cond_75

    move-object v0, p0

    check-cast v0, Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getDivider()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_75

    invoke-virtual {v0}, Landroid/widget/ListView;->getDivider()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    instance-of v1, v1, Landroid/graphics/drawable/ColorDrawable;

    if-eqz v1, :cond_5e

    invoke-virtual {v0}, Landroid/widget/ListView;->getDivider()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/ColorDrawable;->getColor()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Le/e/a/ListDividers191;->color(Landroid/content/Context;)I

    move-result v2

    if-eq v1, v2, :cond_75

    :cond_5e
    invoke-virtual {v0}, Landroid/widget/ListView;->getDividerHeight()I

    move-result v1

    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Le/e/a/ListDividers191;->color(Landroid/content/Context;)I

    move-result v3

    invoke-direct {v2, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setDividerHeight(I)V

    :cond_75
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_8d

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_7c
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-lt v0, v1, :cond_83

    goto :goto_8d

    :cond_83
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Le/e/a/ListDividers191;->tree(Landroid/view/View;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_7c

    :cond_8d
    :goto_8d
    return-void
.end method
