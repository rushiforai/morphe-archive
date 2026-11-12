.class public final Li2c;
.super Landroid/widget/RelativeLayout$LayoutParams;
.source "SourceFile"

# interfaces
.implements Lm2c;


# instance fields
.field public final a:Ln2c;

.field public final b:I

.field public final c:I

.field public final d:Z

.field public final e:Z

.field public final f:I

.field public final g:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance v0, Ln2c;

    invoke-direct {v0, p1, p2}, Ln2c;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v0, p0, Li2c;->a:Ln2c;

    sget-object v0, Lmhh;->d:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, 0x3

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Li2c;->b:I

    invoke-virtual {p1, v0, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Li2c;->c:I

    const/4 p2, 0x2

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Li2c;->d:Z

    const/4 p2, 0x1

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Li2c;->e:Z

    const/4 p2, 0x5

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Li2c;->f:I

    const/4 p2, 0x4

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Li2c;->g:I

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;Lk2c;)V
    .registers 7

    iget-object v0, p0, Li2c;->a:Ln2c;

    invoke-virtual {v0, p1, p2}, Ln2c;->a(Landroid/view/View;Lk2c;)V

    invoke-interface {p2}, Lk2c;->b()Ll2c;

    move-result-object p2

    invoke-virtual {p2}, Ll2c;->c()I

    iget p2, p0, Li2c;->c:I

    iget v0, p0, Li2c;->b:I

    if-nez v0, :cond_14

    if-eqz p2, :cond_1e

    :cond_14
    const/16 v1, 0x12

    invoke-virtual {p0, v1, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    const/16 v0, 0x13

    invoke-virtual {p0, v0, p2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    :cond_1e
    iget-boolean p2, p0, Li2c;->e:Z

    iget-boolean v0, p0, Li2c;->d:Z

    if-nez v0, :cond_26

    if-eqz p2, :cond_3a

    :cond_26
    const/4 v1, 0x0

    const/4 v2, -0x1

    if-eqz v0, :cond_2c

    move v0, v2

    goto :goto_2d

    :cond_2c
    move v0, v1

    :goto_2d
    const/16 v3, 0x14

    invoke-virtual {p0, v3, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    if-eqz p2, :cond_35

    move v1, v2

    :cond_35
    const/16 p2, 0x15

    invoke-virtual {p0, p2, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    :cond_3a
    iget p2, p0, Li2c;->g:I

    iget v0, p0, Li2c;->f:I

    if-nez v0, :cond_42

    if-eqz p2, :cond_4c

    :cond_42
    const/16 v1, 0x10

    invoke-virtual {p0, v1, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    const/16 v0, 0x11

    invoke-virtual {p0, v0, p2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    :cond_4c
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method
