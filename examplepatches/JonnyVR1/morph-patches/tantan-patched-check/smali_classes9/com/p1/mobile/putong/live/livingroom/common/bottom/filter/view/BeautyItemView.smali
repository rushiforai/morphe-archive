.class public Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyItemView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VImage;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Z

.field public final e:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 28
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 27
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyItemView;->d:Z

    .line 6
    .line 7
    new-instance p1, Landroid/graphics/Paint;

    .line 8
    .line 9
    const/4 p2, 0x1

    .line 10
    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyItemView;->e:Landroid/graphics/Paint;

    .line 14
    .line 15
    const p0, -0xc600

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 19
    .line 20
    .line 21
    sget-object p0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/rv2;->a(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyItemView;->b:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->name:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyItemView;->c:Lv/VText;

    .line 9
    .line 10
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->getValue()F

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    const/high16 v3, 0x42c80000    # 100.0f

    .line 19
    .line 20
    mul-float/2addr v2, v3

    .line 21
    float-to-int v2, v2

    .line 22
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    const-string v3, "%d"

    .line 31
    .line 32
    invoke-static {v1, v3, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 40
    .line 41
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 42
    .line 43
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-static {v0, v1}, Ll/uyr;->c(ILjava/lang/String;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->isSuggested:Z

    .line 52
    .line 53
    const/4 v2, 0x0

    .line 54
    const/4 v3, 0x1

    .line 55
    if-eqz v1, :cond_0

    .line 56
    .line 57
    new-instance v1, Ll/jxd0;

    .line 58
    .line 59
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 60
    .line 61
    invoke-direct {v1, v0, v4}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Ljava/lang/Boolean;

    .line 69
    .line 70
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_0

    .line 75
    .line 76
    move v0, v3

    .line 77
    goto :goto_0

    .line 78
    :cond_0
    move v0, v2

    .line 79
    :goto_0
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyItemView;->d:Z

    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyItemView;->a:Lv/VImage;

    .line 82
    .line 83
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 84
    .line 85
    invoke-static {v1}, Ll/bv2;->a(I)I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyItemView;->a:Lv/VImage;

    .line 93
    .line 94
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->isSelected:Z

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyItemView;->b:Lv/VText;

    .line 100
    .line 101
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->isSelected:Z

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 104
    .line 105
    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyItemView;->c:Lv/VText;

    .line 107
    .line 108
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->isSelected:Z

    .line 109
    .line 110
    if-nez v0, :cond_1

    .line 111
    .line 112
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->getValue()F

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->getDefaultBeautyValue()F

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    sub-float/2addr v0, p1

    .line 121
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    float-to-double v0, p1

    .line 126
    const-wide v4, 0x3f1a36e2eb1c432dL    # 1.0E-4

    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    cmpl-double p1, v0, v4

    .line 132
    .line 133
    if-lez p1, :cond_2

    .line 134
    .line 135
    :cond_1
    move v2, v3

    .line 136
    :cond_2
    invoke-virtual {p0, v2}, Landroid/view/View;->setSelected(Z)V

    .line 137
    .line 138
    .line 139
    return-void
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyItemView;->d:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyItemView;->a:Lv/VImage;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/View;->getX()F

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyItemView;->a:Lv/VImage;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    int-to-float v1, v1

    .line 21
    add-float/2addr v0, v1

    .line 22
    sget v1, Ll/qa00;->d:I

    .line 23
    .line 24
    int-to-float v2, v1

    .line 25
    add-float/2addr v0, v2

    .line 26
    float-to-int v0, v0

    .line 27
    int-to-float v0, v0

    .line 28
    int-to-float v2, v1

    .line 29
    int-to-float v1, v1

    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyItemView;->e:Landroid/graphics/Paint;

    .line 31
    .line 32
    invoke-virtual {p1, v0, v2, v1, p0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyItemView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
