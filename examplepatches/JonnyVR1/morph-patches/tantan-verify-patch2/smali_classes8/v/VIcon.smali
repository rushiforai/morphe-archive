.class public Lv/VIcon;
.super Lv/VBaseIcon;
.source "SourceFile"


# instance fields
.field public d:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 34
    invoke-direct {p0, p1, v0}, Lv/VIcon;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 33
    invoke-direct {p0, p1, p2, v0}, Lv/VIcon;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VBaseIcon;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lv/VIcon;->d:I

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    sget-object v1, Ll/hhc0;->L3:[I

    .line 10
    .line 11
    invoke-virtual {p1, p2, v1, p3, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    sget p2, Ll/hhc0;->M3:I

    .line 16
    .line 17
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p2}, Lv/VIcon;->setIconStyle(I)V

    .line 25
    .line 26
    .line 27
    :cond_0
    sget-object p1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public onMeasure(II)V
    .locals 2

    .line 1
    iget v0, p0, Lv/VIcon;->d:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    const/high16 v1, -0x80000000

    .line 18
    .line 19
    if-eq p1, v1, :cond_1

    .line 20
    .line 21
    if-eqz p1, :cond_3

    .line 22
    .line 23
    const/high16 v0, 0x40000000    # 2.0f

    .line 24
    .line 25
    if-eq p1, v0, :cond_2

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    if-ge p2, v0, :cond_3

    .line 30
    .line 31
    :cond_2
    move v0, p2

    .line 32
    :cond_3
    :goto_0
    invoke-virtual {p0, v0, v0}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public setIconStyle(I)V
    .locals 0

    .line 1
    packed-switch p1, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lv/VIcon;->d:I

    .line 6
    .line 7
    return-void

    .line 8
    :pswitch_0
    const/high16 p1, 0x42100000    # 36.0f

    .line 9
    .line 10
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iput p1, p0, Lv/VIcon;->d:I

    .line 15
    .line 16
    return-void

    .line 17
    :pswitch_1
    const/high16 p1, 0x42300000    # 44.0f

    .line 18
    .line 19
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    iput p1, p0, Lv/VIcon;->d:I

    .line 24
    .line 25
    return-void

    .line 26
    :pswitch_2
    sget p1, Ll/qa00;->J:I

    .line 27
    .line 28
    iput p1, p0, Lv/VIcon;->d:I

    .line 29
    .line 30
    return-void

    .line 31
    :pswitch_3
    sget p1, Ll/qa00;->G:I

    .line 32
    .line 33
    iput p1, p0, Lv/VIcon;->d:I

    .line 34
    .line 35
    return-void

    .line 36
    :pswitch_4
    sget p1, Ll/qa00;->E:I

    .line 37
    .line 38
    iput p1, p0, Lv/VIcon;->d:I

    .line 39
    .line 40
    return-void

    .line 41
    :pswitch_5
    sget p1, Ll/qa00;->A:I

    .line 42
    .line 43
    iput p1, p0, Lv/VIcon;->d:I

    .line 44
    .line 45
    return-void

    .line 46
    :pswitch_6
    sget p1, Ll/qa00;->y:I

    .line 47
    .line 48
    iput p1, p0, Lv/VIcon;->d:I

    .line 49
    .line 50
    return-void

    .line 51
    :pswitch_7
    sget p1, Ll/qa00;->v:I

    .line 52
    .line 53
    iput p1, p0, Lv/VIcon;->d:I

    .line 54
    .line 55
    return-void

    .line 56
    :pswitch_8
    sget p1, Ll/qa00;->q:I

    .line 57
    .line 58
    iput p1, p0, Lv/VIcon;->d:I

    .line 59
    .line 60
    return-void

    .line 61
    :pswitch_9
    sget p1, Ll/qa00;->m:I

    .line 62
    .line 63
    iput p1, p0, Lv/VIcon;->d:I

    .line 64
    .line 65
    return-void

    .line 66
    :pswitch_a
    sget p1, Ll/qa00;->j:I

    .line 67
    .line 68
    iput p1, p0, Lv/VIcon;->d:I

    .line 69
    .line 70
    return-void

    .line 71
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
