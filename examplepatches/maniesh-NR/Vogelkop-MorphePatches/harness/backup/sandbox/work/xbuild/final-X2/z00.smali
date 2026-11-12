.class public final Lz00;
.super Lc10;
.source "SourceFile"


# instance fields
.field public final d:Lcom/opera/android/custom_views/SmoothProgressBar;

.field public final e:Landroid/widget/TextView;

.field public final synthetic f:La10;


# direct methods
.method public constructor <init>(La10;ILjava/lang/String;Landroid/view/View;)V
    .registers 5

    iput-object p1, p0, Lz00;->f:La10;

    invoke-direct {p0, p4, p3}, Lc10;-><init>(Landroid/view/View;Ljava/lang/String;)V

    sget-object p1, Lr5n;->a:Ljava/util/WeakHashMap;

    const p1, 0x7f0a00ba

    invoke-static {p4, p1}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/SmoothProgressBar;

    iput-object p1, p0, Lz00;->d:Lcom/opera/android/custom_views/SmoothProgressBar;

    const p3, 0x7f0a00bb

    invoke-static {p4, p3}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/view/View;

    check-cast p3, Landroid/widget/TextView;

    iput-object p3, p0, Lz00;->e:Landroid/widget/TextView;

    invoke-virtual {p4}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const/high16 p4, 0x7f030000

    invoke-virtual {p0, p4}, Landroid/content/res/Resources;->getIntArray(I)[I

    move-result-object p0

    array-length p4, p0

    rem-int/2addr p2, p4

    aget p0, p0, p2

    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-static {p2, p0}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {p1, p2}, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setTextColor(I)V

    return-void
.end method


# virtual methods
.method public final a(ZZZ)V
    .registers 6

    invoke-super {p0, p1, p2, p3}, Lc10;->a(ZZZ)V

    iget-object p3, p0, Lz00;->f:La10;

    iget-object v0, p3, La10;->L:Ljava/util/HashMap;

    if-eqz v0, :cond_1d

    if-eqz p2, :cond_11

    iget-object v0, p0, Lc10;->c:Landroid/widget/TextView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    :cond_11
    iget-object v0, p3, La10;->L:Ljava/util/HashMap;

    iget-object v1, p0, Lc10;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-nez v0, :cond_1e

    :cond_1d
    return-void

    :cond_1e
    iget-object v1, p0, Lz00;->d:Lcom/opera/android/custom_views/SmoothProgressBar;

    invoke-virtual {v1, p2}, Landroid/view/View;->setSelected(Z)V

    const/4 p2, 0x0

    invoke-virtual {v1, p2}, Landroid/view/View;->setVisibility(I)V

    iput-boolean p1, v1, Lcom/opera/android/custom_views/SmoothProgressBar;->a:Z

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v1, p1}, Lcom/opera/android/custom_views/SmoothProgressBar;->setProgress(I)V

    iget-object p0, p0, Lz00;->e:Landroid/widget/TextView;

    invoke-virtual {p0, p2}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p3, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f1405cf

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object p3

    invoke-virtual {p1, p2, p3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
