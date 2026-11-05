.class public Le/e/a/i0;
.super Landroid/widget/BaseAdapter;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/i0$a;
    }
.end annotation


# instance fields
.field public a:Landroid/view/LayoutInflater;

.field public b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/h0;",
            ">;"
        }
    .end annotation
.end field

.field public c:Landroid/content/Context;


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 7

    iget-object v0, p0, Le/e/a/i0;->b:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/h0;

    if-nez p2, :cond_39

    iget-object p2, p0, Le/e/a/i0;->a:Landroid/view/LayoutInflater;

    const v0, 0x7f0b006c

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    new-instance p3, Le/e/a/i0$a;

    invoke-direct {p3, p0}, Le/e/a/i0$a;-><init>(Le/e/a/i0;)V

    const v0, 0x7f0801b4

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p3, Le/e/a/i0$a;->a:Landroid/widget/TextView;

    const v0, 0x7f080198

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p3, Le/e/a/i0$a;->b:Landroid/widget/TextView;

    const v0, 0x7f080068

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    invoke-virtual {p2, p3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto :goto_3f

    :cond_39
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Le/e/a/i0$a;

    :goto_3f
    iget-object v0, p3, Le/e/a/i0$a;->b:Landroid/widget/TextView;

    iget v1, p1, Le/e/a/h0;->a:I

    if-eqz v1, :cond_5a

    const/4 v2, 0x1

    if-eq v1, v2, :cond_54

    const/4 v2, 0x2

    if-eq v1, v2, :cond_4e

    const-string v1, ""

    goto :goto_67

    :cond_4e
    iget-object v1, p0, Le/e/a/i0;->c:Landroid/content/Context;

    const v2, 0x7f0f01d6

    goto :goto_5f

    :cond_54
    iget-object v1, p0, Le/e/a/i0;->c:Landroid/content/Context;

    const v2, 0x7f0f0037

    goto :goto_5f

    :cond_5a
    iget-object v1, p0, Le/e/a/i0;->c:Landroid/content/Context;

    const v2, 0x7f0f0038

    :goto_5f
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static/range {v1 .. v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_67
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p3, p3, Le/e/a/i0$a;->a:Landroid/widget/TextView;

    iget-object p1, p1, Le/e/a/h0;->b:Ljava/lang/String;

    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 p1, -0x1000000

    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-static {p2}, Le/e/a/ThemeChoice;->tree(Landroid/view/View;)V

    return-object p2
.end method
