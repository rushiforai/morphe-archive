.class public final Lsba;
.super Llz3;
.source "SourceFile"


# instance fields
.field public f:Z

.field public g:Z


# direct methods
.method public constructor <init>(Lqba;)V
    .registers 8

    iget-object v1, p1, Lqba;->a:Landroid/view/ViewGroup;

    iget v2, p1, Lqba;->g:I

    new-instance v5, Ll11;

    iget-object v0, p1, Lqba;->b:Landroid/view/View;

    iget-byte v3, p1, Lqba;->d:B

    iget v4, p1, Lqba;->c:I

    invoke-direct {v5, v0, v3, v4}, Ll11;-><init>(Landroid/view/View;II)V

    const-wide/16 v3, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Llz3;-><init>(Landroid/view/ViewGroup;IJLhxj;)V

    iget-object p0, v0, Llz3;->b:Lcom/opera/android/bubbleview/BubbleView;

    const v1, 0x7f0a06b5

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    iget-object v1, p1, Lqba;->e:Lsxh;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v1, v2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p1, Lqba;->h:Loc;

    if-eqz p0, :cond_55

    iget-object v1, v0, Llz3;->b:Lcom/opera/android/bubbleview/BubbleView;

    const v2, 0x7f0a0046

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    if-eqz v1, :cond_55

    iget-object p0, p0, Loc;->a:Lrxh;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {p0, v2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance p0, Ljf7;

    const/16 v2, 0xb

    invoke-direct {p0, v0, p1, v2}, Ljf7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_55
    iget-object p0, p1, Lqba;->f:Lrba;

    if-nez p0, :cond_5e

    iget-boolean p0, p1, Lqba;->i:Z

    if-nez p0, :cond_5e

    return-void

    :cond_5e
    new-instance p0, Lpba;

    invoke-direct {p0, v0, p1}, Lpba;-><init>(Lsba;Lqba;)V

    invoke-virtual {v0, p0}, Llz3;->a(Lkz3;)V

    return-void
.end method
