.class public final Ln2c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lm2c;


# instance fields
.field public final a:Lo2c;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 72
    iput-object v0, p0, Ln2c;->a:Lo2c;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lmhh;->c:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result p2

    const/4 v0, 0x0

    if-nez p2, :cond_14

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_44

    :cond_14
    const/16 p2, 0x8

    const/16 v1, -0x1388

    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    move-result p2

    const/4 v2, 0x7

    invoke-virtual {p1, v2, v1}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    move-result v2

    const/4 v3, 0x6

    const/4 v4, 0x0

    invoke-virtual {p1, v3, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v3

    const/4 v5, 0x5

    invoke-virtual {p1, v5, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v4

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    if-ne p2, v1, :cond_37

    if-ne v2, v1, :cond_37

    if-nez v3, :cond_37

    if-eqz v4, :cond_44

    :cond_37
    new-instance v0, Lo2c;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput p2, v0, Lo2c;->a:I

    iput v2, v0, Lo2c;->b:I

    iput-boolean v3, v0, Lo2c;->c:Z

    iput-boolean v4, v0, Lo2c;->d:Z

    :cond_44
    :goto_44
    iput-object v0, p0, Ln2c;->a:Lo2c;

    return-void
.end method

.method public constructor <init>(Ln2c;)V
    .registers 4

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    iget-object p1, p1, Ln2c;->a:Lo2c;

    if-eqz p1, :cond_23

    .line 75
    new-instance v0, Lo2c;

    .line 76
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    const/16 v1, -0x1388

    .line 77
    iput v1, v0, Lo2c;->a:I

    .line 78
    iput v1, v0, Lo2c;->b:I

    .line 79
    iget v1, p1, Lo2c;->a:I

    iput v1, v0, Lo2c;->a:I

    .line 80
    iget v1, p1, Lo2c;->b:I

    iput v1, v0, Lo2c;->b:I

    .line 81
    iget-boolean v1, p1, Lo2c;->c:Z

    iput-boolean v1, v0, Lo2c;->c:Z

    .line 82
    iget-boolean p1, p1, Lo2c;->d:Z

    iput-boolean p1, v0, Lo2c;->d:Z

    goto :goto_24

    :cond_23
    const/4 v0, 0x0

    .line 83
    :goto_24
    iput-object v0, p0, Ln2c;->a:Lo2c;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;Lk2c;)V
    .registers 5

    iget-object p0, p0, Ln2c;->a:Lo2c;

    if-nez p0, :cond_5

    return-void

    :cond_5
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    instance-of v0, p2, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v0, :cond_25

    check-cast p2, Landroid/widget/LinearLayout$LayoutParams;

    iget v0, p2, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    invoke-virtual {p0, v0}, Lo2c;->a(I)I

    move-result v0

    invoke-virtual {p0, p2}, Lo2c;->b(Landroid/view/ViewGroup$MarginLayoutParams;)Z

    move-result v1

    if-nez v1, :cond_1f

    iget v1, p2, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    if-eq v0, v1, :cond_50

    :cond_1f
    iput v0, p2, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_50

    :cond_25
    instance-of v0, p2, Landroid/widget/FrameLayout$LayoutParams;

    if-eqz v0, :cond_41

    check-cast p2, Landroid/widget/FrameLayout$LayoutParams;

    iget v0, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    invoke-virtual {p0, v0}, Lo2c;->a(I)I

    move-result v0

    invoke-virtual {p0, p2}, Lo2c;->b(Landroid/view/ViewGroup$MarginLayoutParams;)Z

    move-result v1

    if-nez v1, :cond_3b

    iget v1, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    if-eq v0, v1, :cond_50

    :cond_3b
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_50

    :cond_41
    instance-of v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_50

    check-cast p2, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {p0, p2}, Lo2c;->b(Landroid/view/ViewGroup$MarginLayoutParams;)Z

    move-result v0

    if-eqz v0, :cond_50

    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_50
    :goto_50
    const/16 p1, -0x1388

    iput p1, p0, Lo2c;->a:I

    iput p1, p0, Lo2c;->b:I

    return-void
.end method
