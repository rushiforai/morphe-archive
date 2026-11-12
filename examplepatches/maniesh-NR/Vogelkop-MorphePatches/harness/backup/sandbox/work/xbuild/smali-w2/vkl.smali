.class public final synthetic Lvkl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field public final synthetic a:Landroid/widget/TextView;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Landroid/widget/TextView;I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvkl;->a:Landroid/widget/TextView;

    iput p2, p0, Lvkl;->b:I

    return-void
.end method


# virtual methods
.method public final onGlobalLayout()V
    .registers 6

    iget-object v0, p0, Lvkl;->a:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v1

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v2

    sub-int/2addr v1, v2

    iget p0, p0, Lvkl;->b:I

    const/4 v2, 0x1

    invoke-static {v0, p0, v2}, Lna2;->G(Landroid/widget/TextView;II)Landroid/text/StaticLayout;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/text/StaticLayout;->getLineForVertical(I)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/text/Layout;->getLineBottom(I)I

    move-result v3

    if-gt v3, v1, :cond_23

    add-int/lit8 v4, v4, 0x1

    :cond_23
    invoke-static {v4, v2, p0}, Ldjh;->c(III)I

    move-result p0

    invoke-virtual {v0}, Landroid/widget/TextView;->getMaxLines()I

    move-result v1

    if-eq p0, v1, :cond_30

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setMaxLines(I)V

    :cond_30
    return-void
.end method
