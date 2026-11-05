.class public Le/e/a/x0;
.super Landroid/widget/BaseAdapter;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/x0$a;
    }
.end annotation


# instance fields
.field public a:Landroid/view/LayoutInflater;

.field public b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field public c:I


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 10

    move v5, p1

    iget-object v0, p0, Le/e/a/x0;->b:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/HashMap;

    const/4 v0, 0x0

    if-nez p2, :cond_3d

    iget-object p2, p0, Le/e/a/x0;->a:Landroid/view/LayoutInflater;

    const v1, 0x7f0b006c

    invoke-virtual {p2, v1, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    new-instance p3, Le/e/a/x0$a;

    invoke-direct {p3, p0}, Le/e/a/x0$a;-><init>(Le/e/a/x0;)V

    const v1, 0x7f0801b4

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p3, Le/e/a/x0$a;->a:Landroid/widget/TextView;

    const v1, 0x7f080198

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p3, Le/e/a/x0$a;->b:Landroid/widget/TextView;

    const v1, 0x7f080068

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p3, Le/e/a/x0$a;->c:Landroid/view/View;

    invoke-virtual {p2, p3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto :goto_43

    :cond_3d
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Le/e/a/x0$a;

    :goto_43
    const/4 v0, 0x0

    invoke-virtual {p2, v0, v0, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    move-object v3, p2

    check-cast v3, Landroid/view/ViewGroup;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, p3, Le/e/a/x0$a;->a:Landroid/widget/TextView;

    iget-object v2, p3, Le/e/a/x0$a;->b:Landroid/widget/TextView;

    iget-object p3, p3, Le/e/a/x0$a;->c:Landroid/view/View;

    const-string v3, "title"

    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "subtitle"

    invoke-virtual {p1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-eqz v4, :cond_7d

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_7d

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setMinimumHeight(I)V

    goto :goto_93

    :cond_7d
    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    const/high16 v4, 0x42400000    # 48.0f

    mul-float/2addr v3, v4

    float-to-int v3, v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setMinimumHeight(I)V

    :goto_93
    const/16 v3, 0x13

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setGravity(I)V

    invoke-virtual {v1}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    instance-of v4, v3, Landroid/widget/LinearLayout;

    if-eqz v4, :cond_a7

    check-cast v3, Landroid/widget/LinearLayout;

    const/16 v4, 0x10

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setGravity(I)V

    :cond_a7
    invoke-static {p2}, Le/e/a/DynamicTheme;->textColor(Landroid/view/View;)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    iget v1, p0, Le/e/a/x0;->c:I

    if-nez v1, :cond_b6

    invoke-static/range {p2 .. p2}, Le/e/a/UiTheme191;->surface(Landroid/view/View;)V

    return-object p2

    :cond_b6
    const-string v1, "islabel"

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    const-string v3, "type"

    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    if-eqz v1, :cond_111

    if-eqz p1, :cond_111

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_d1

    goto :goto_111

    :cond_d1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/4 v1, 0x3

    if-eq p1, v1, :cond_fc

    invoke-static {p2}, Le/e/a/DynamicTheme;->labelBackground(Landroid/view/View;)I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/view/View;->setBackgroundColor(I)V

    invoke-static {p2}, Le/e/a/DynamicTheme;->menuCategory(Landroid/view/View;)V

    move-object v3, p2

    check-cast v3, Landroid/view/ViewGroup;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result p1

    invoke-virtual {p3, p1}, Landroid/view/View;->setBackgroundColor(I)V

    const/16 p1, 0x8

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_132

    :cond_fc
    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/view/View;->setBackgroundColor(I)V

    const/16 p1, 0x66

    const/16 v0, 0xff

    const/16 v1, 0xcc

    invoke-static {p1, v0, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result p1

    invoke-virtual {p3, p1}, Landroid/view/View;->setBackgroundColor(I)V

    goto :goto_132

    :cond_111
    :goto_111
    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/view/View;->setBackgroundColor(I)V

    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result p1

    invoke-virtual {p3, p1}, Landroid/view/View;->setBackgroundColor(I)V

    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    if-nez p1, :cond_12f

    const/16 p1, 0x8

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_132

    :cond_12f
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_132
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    instance-of v0, v0, Lcom/sauzask/nicoid/NicoidTopActivity;

    if-eqz v0, :cond_167

    add-int/lit8 v5, v5, 0x1

    iget-object v0, p0, Le/e/a/x0;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v5, v1, :cond_167

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "islabel"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    if-eqz v0, :cond_167

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_167

    move-object v0, p2

    check-cast v0, Landroid/view/ViewGroup;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_167
    invoke-static/range {p2 .. p2}, Le/e/a/UiTheme191;->surface(Landroid/view/View;)V

    return-object p2
.end method

.method public isEnabled(I)Z
    .registers 4

    iget-object v0, p0, Le/e/a/x0;->b:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    const-string v1, "islabel"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Ljava/lang/Boolean;

    if-eqz v1, :cond_1c

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1c

    const/4 v0, 0x0

    return v0

    :cond_1c
    const/4 v0, 0x1

    return v0
.end method
