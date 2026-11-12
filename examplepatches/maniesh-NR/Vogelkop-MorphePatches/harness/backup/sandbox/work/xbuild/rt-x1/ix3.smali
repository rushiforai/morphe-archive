.class public final Lix3;
.super Lf2c;
.source "SourceFile"


# instance fields
.field public final b:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 20
    invoke-direct {p0}, Lf2c;-><init>()V

    const/4 v0, 0x0

    .line 21
    iput v0, p0, Lix3;->b:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Lf2c;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    sget-object v0, Lkhh;->P:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2, p2}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result p2

    iput p2, p0, Lix3;->b:I

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$LayoutParams;)V
    .registers 2

    .line 22
    invoke-direct {p0, p1}, Lf2c;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 p1, 0x0

    .line 23
    iput p1, p0, Lix3;->b:I

    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$MarginLayoutParams;)V
    .registers 2

    .line 24
    invoke-direct {p0, p1}, Lf2c;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    const/4 p1, 0x0

    .line 25
    iput p1, p0, Lix3;->b:I

    return-void
.end method

.method public constructor <init>(Landroid/widget/FrameLayout$LayoutParams;)V
    .registers 2

    .line 26
    invoke-direct {p0, p1}, Lf2c;-><init>(Landroid/widget/FrameLayout$LayoutParams;)V

    const/4 p1, 0x0

    .line 27
    iput p1, p0, Lix3;->b:I

    return-void
.end method

.method public constructor <init>(Lf2c;)V
    .registers 2

    .line 28
    invoke-direct {p0, p1}, Lf2c;-><init>(Lf2c;)V

    const/4 p1, 0x0

    .line 29
    iput p1, p0, Lix3;->b:I

    return-void
.end method

.method public constructor <init>(Lix3;)V
    .registers 2

    .line 30
    invoke-direct {p0, p1}, Lf2c;-><init>(Lf2c;)V

    .line 31
    iget p1, p1, Lix3;->b:I

    iput p1, p0, Lix3;->b:I

    return-void
.end method
