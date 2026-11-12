.class public final Lms8;
.super Les8;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final f:Lpr8;


# direct methods
.method public constructor <init>(ILfr8;Lpr8;)V
    .registers 10

    invoke-direct {p0, p2}, Les8;-><init>(Lfr8;)V

    iget-object v0, p2, Lfr8;->q:Lzu4;

    iget-object v1, p2, Lfr8;->r:Landroid/graphics/Rect;

    iput-object v1, v0, Lzu4;->c:Ljava/lang/Object;

    iget-object v2, v0, Lol7;->a:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_18

    iget v3, v1, Landroid/graphics/Rect;->left:I

    iget v4, v1, Landroid/graphics/Rect;->top:I

    iget v5, v1, Landroid/graphics/Rect;->right:I

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v2, v3, v4, v5, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    :cond_18
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    invoke-virtual {p2, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Lhs8;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lhs8;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    invoke-virtual {p2, p1}, Landroid/view/View;->setId(I)V

    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f1400e7

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/View;->setTooltipText(Ljava/lang/CharSequence;)V

    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    iput-object p3, p0, Lms8;->f:Lpr8;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-object p0, p0, Lms8;->f:Lpr8;

    check-cast p0, Lqr8;

    iget-object p0, p0, Lqr8;->b:Lgjm;

    new-instance p1, Lys;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lgjm;->e(Ln37;Z)V

    return-void
.end method
