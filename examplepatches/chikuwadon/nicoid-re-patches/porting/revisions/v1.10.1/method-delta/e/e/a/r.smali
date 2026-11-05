.class public Le/e/a/r;
.super Landroid/widget/BaseAdapter;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/r$a;
    }
.end annotation


# instance fields
.field public a:Landroid/view/LayoutInflater;

.field public b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/q;",
            ">;"
        }
    .end annotation
.end field

.field public c:Landroid/content/Context;


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 9

    iget-object v0, p0, Le/e/a/r;->b:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/q;

    const/4 v0, 0x0

    if-nez p2, :cond_39

    iget-object p2, p0, Le/e/a/r;->a:Landroid/view/LayoutInflater;

    const v1, 0x7f0b0028

    invoke-virtual {p2, v1, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    new-instance p3, Le/e/a/r$a;

    invoke-direct {p3, p0}, Le/e/a/r$a;-><init>(Le/e/a/r;)V

    const v1, 0x7f0801b4

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p3, Le/e/a/r$a;->a:Landroid/widget/TextView;

    const v1, 0x7f0801b3

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p3, Le/e/a/r$a;->b:Landroid/widget/TextView;

    const v1, 0x7f080068

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    invoke-virtual {p2, p3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto :goto_3f

    :cond_39
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Le/e/a/r$a;

    :goto_3f
    iget-object v1, p3, Le/e/a/r$a;->a:Landroid/widget/TextView;

    iget-object p3, p3, Le/e/a/r$a;->b:Landroid/widget/TextView;

    iget-boolean v2, p1, Le/e/a/q;->o:Z

    if-eqz v2, :cond_55

    iget-object v2, p0, Le/e/a/r;->c:Landroid/content/Context;

    const v3, 0x7f0f00a5

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static/range {v2 .. v2}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_57

    :cond_55
    iget-object v2, p1, Le/e/a/q;->a:Ljava/lang/String;

    :goto_57
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setSingleLine(Z)V

    invoke-static {p2, p1}, Le/e/a/CommentListExtras;->row(Landroid/view/View;Ljava/lang/Object;)V

    iget-object p1, p1, Le/e/a/q;->d:Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    div-int/lit8 p1, p1, 0x64

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    .line 1
    div-int/lit8 v4, p1, 0x3c

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v0

    rem-int/lit8 p1, p1, 0x3c

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v3, v2

    const-string p1, "%1$02d:%2$02d"

    invoke-static {p1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 2
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {p2}, Le/e/a/DynamicTheme;->commentTextColor(Landroid/view/View;)I

    move-result p1

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setTextColor(I)V

    return-object p2
.end method
