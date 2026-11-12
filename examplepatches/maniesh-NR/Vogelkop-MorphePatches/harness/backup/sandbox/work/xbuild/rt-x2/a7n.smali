.class public final La7n;
.super Lab2;
.source "SourceFile"

# interfaces
.implements Lev8;


# instance fields
.field public final d:Landroid/view/ViewGroup;

.field public final e:Lpde;

.field public final f:Lgjm;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Landroid/widget/TextView;Landroid/widget/TextView;Lpde;Lgjm;Lpde;)V
    .registers 8

    invoke-direct {p0, p1}, Lab2;-><init>(Landroid/view/View;)V

    iput-object p1, p0, La7n;->d:Landroid/view/ViewGroup;

    iput-object p4, p0, La7n;->e:Lpde;

    iput-object p5, p0, La7n;->f:Lgjm;

    invoke-static {p1}, Lp37;->z(Landroid/view/View;)Lkze;

    move-result-object p1

    new-instance p5, Lj6n;

    const/4 v0, 0x0

    invoke-direct {p5, p0, v0}, Lj6n;-><init>(La7n;B)V

    invoke-static {p4, p1, p5}, La26;->T(Lekc;Likc;Lf7f;)V

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p4

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p5

    const v0, 0x7f1401b7

    invoke-virtual {p5, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p5

    filled-new-array {p5}, [Ljava/lang/Object;

    move-result-object p5

    const v0, 0x7f140d53

    invoke-virtual {p4, v0, p5}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    const p4, 0x7f140d54

    invoke-virtual {p2, p4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    new-instance p4, Lilm;

    const/4 p5, 0x6

    invoke-direct {p4, p0, p5}, Lilm;-><init>(Ljava/lang/Object;B)V

    invoke-static {p3, p2, p4}, Lphj;->b0(Landroid/widget/TextView;Ljava/lang/String;Lcom/opera/api/Callback;)V

    new-instance p2, Lj6n;

    const/4 p3, 0x1

    invoke-direct {p2, p0, p3}, Lj6n;-><init>(La7n;B)V

    invoke-static {p6, p1, p2}, La26;->T(Lekc;Likc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final b0()V
    .registers 9

    iget-object v0, p0, La7n;->e:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v3

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v5

    const/4 v6, 0x0

    const/16 v7, 0xa

    iget-object v2, p0, La7n;->d:Landroid/view/ViewGroup;

    const/4 v4, 0x0

    invoke-static/range {v2 .. v7}, Lp37;->o0(Landroid/view/View;IIIII)V

    return-void
.end method

.method public final c0(Lbz3;)I
    .registers 5

    invoke-virtual {p0}, La7n;->b0()V

    iget-object p0, p0, La7n;->d:Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/4 v1, -0x2

    const/4 v2, 0x0

    if-eq v0, v1, :cond_1f

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1f

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/high16 v0, 0x40000000    # 2.0f

    invoke-static {p1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    goto :goto_3d

    :cond_1f
    iget p1, p1, Lbz3;->a:I

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v1, :cond_2c

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    goto :goto_2d

    :cond_2c
    const/4 v0, 0x0

    :goto_2d
    if-nez v0, :cond_31

    move v1, v2

    goto :goto_36

    :cond_31
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v1, v0

    :goto_36
    sub-int/2addr p1, v1

    const/high16 v0, -0x80000000

    invoke-static {p1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    :goto_3d
    invoke-virtual {p0, p1, v2}, Landroid/view/View;->measure(II)V

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result p1

    invoke-static {p0}, Lp37;->D0(Landroid/view/View;)I

    move-result p0

    add-int/2addr p0, p1

    return p0
.end method
