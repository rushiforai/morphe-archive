.class public abstract Lbu8;
.super Lo43;
.source "SourceFile"

# interfaces
.implements Lxa2;
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final f:Lnrl;

.field public g:I

.field public final h:I


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 5

    invoke-direct {p0, p1}, Lo43;-><init>(Landroid/view/View;)V

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    const v0, 0x7f0a042f

    invoke-static {p1, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    check-cast v0, Lcom/opera/android/widget/ClickAwareCardView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v1, 0x7f0408e0

    const v2, 0x7f0705df

    invoke-static {v1, p1, v2}, Lf03;->w(ILandroid/content/Context;I)I

    move-result p1

    iput p1, p0, Lbu8;->h:I

    iput-object p0, v0, Lcom/opera/android/widget/ClickAwareCardView;->q:Landroid/view/View$OnClickListener;

    new-instance p1, Lnrl;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lnrl;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lbu8;->f:Lnrl;

    return-void
.end method


# virtual methods
.method public J(Lwa2;)V
    .registers 6

    iget-object p1, p1, Lwa2;->b:Landroid/graphics/Rect;

    iget v0, p1, Landroid/graphics/Rect;->left:I

    iget v1, p1, Landroid/graphics/Rect;->right:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iget v1, p0, Lbu8;->h:I

    add-int/2addr v0, v1

    iget-object v1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    check-cast v1, Lcom/opera/android/custom_views/CardView;

    iget v2, p0, Lbu8;->g:I

    if-eq v2, v0, :cond_22

    invoke-virtual {v1}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    invoke-virtual {v1}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    invoke-virtual {v1, v0, v2, v0, v3}, Landroid/view/View;->setPadding(IIII)V

    iput v0, p0, Lbu8;->g:I

    :cond_22
    const/4 p0, 0x0

    iput p0, p1, Landroid/graphics/Rect;->right:I

    iput p0, p1, Landroid/graphics/Rect;->left:I

    return-void
.end method

.method public final b0()I
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public f0()Lyz;
    .registers 1

    invoke-virtual {p0}, Lo43;->Z()Lmq;

    move-result-object p0

    iget-object p0, p0, Lmq;->d:Lyz;

    return-object p0
.end method

.method public g0(Landroid/view/View;)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public i(Z)V
    .registers 2

    iget-object p0, p0, Lbu8;->f:Lnrl;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 3

    invoke-virtual {p0}, Lo43;->e0()Lmq;

    move-result-object v0

    if-eqz v0, :cond_16

    invoke-virtual {p0, p1}, Lbu8;->g0(Landroid/view/View;)Z

    move-result p0

    if-nez p0, :cond_16

    iget-object p0, v0, Lmq;->d:Lyz;

    if-eqz p0, :cond_17

    invoke-virtual {p0}, Lyz;->s()Z

    move-result p0

    if-eqz p0, :cond_17

    :cond_16
    return-void

    :cond_17
    invoke-virtual {v0}, Lmq;->k()V

    return-void
.end method

.method public final q(Z)V
    .registers 2

    invoke-super {p0, p1}, Lo43;->q(Z)V

    iget-object p0, p0, Lbu8;->f:Lnrl;

    invoke-virtual {p0, p1}, Lnrl;->q(Z)V

    return-void
.end method
