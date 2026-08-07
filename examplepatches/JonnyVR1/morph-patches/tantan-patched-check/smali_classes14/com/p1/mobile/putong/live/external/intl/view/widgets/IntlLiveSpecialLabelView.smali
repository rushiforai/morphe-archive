.class public Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;->b(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;->b(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;Lcom/p1/mobile/putong/live/base/data/BLiveLabel;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLabel;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;->templateId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method


# virtual methods
.method public final b(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Ll/xec0;->P:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {p1, v0, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    sget p1, Ll/ldc0;->e2:I

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lv/VText;

    .line 18
    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;->a:Lv/VText;

    .line 20
    .line 21
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V
    .locals 4
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;->c()V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveLabels:Ljava/util/List;

    .line 8
    .line 9
    new-instance v0, Ll/m1o;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Ll/m1o;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p2, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveLabel;

    .line 19
    .line 20
    if-eqz p2, :cond_1

    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;->a:Lv/VText;

    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;->value:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveLabel;->textColor:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p1}, Ll/ynp0;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;->a:Lv/VText;

    .line 40
    .line 41
    iget v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveLabel;->textSize:I

    .line 42
    .line 43
    int-to-float v1, v1

    .line 44
    const/4 v2, 0x2

    .line 45
    invoke-virtual {v0, v2, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTextSize(IF)V

    .line 46
    .line 47
    .line 48
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;->a:Lv/VText;

    .line 53
    .line 54
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveLabel;->background:Lcom/p1/mobile/putong/live/base/data/BLiveBackground;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBackground;->startColor:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {p1}, Ll/ynp0;->B(Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveLabel;->background:Lcom/p1/mobile/putong/live/base/data/BLiveBackground;

    .line 66
    .line 67
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBackground;->endColor:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {v0}, Ll/ynp0;->B(Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    const/4 v1, 0x6

    .line 74
    invoke-static {p1, v0, v1}, Ll/fc2;->j(III)Landroid/graphics/drawable/GradientDrawable;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;->a:Lv/VText;

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 81
    .line 82
    .line 83
    iget-wide v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveLabel;->alpha:D

    .line 84
    .line 85
    const-wide v2, 0x406fe00000000000L    # 255.0

    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    mul-double/2addr v0, v2

    .line 91
    double-to-int p0, v0

    .line 92
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/GradientDrawable;->setAlpha(I)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveSpecialLabelView;->c()V

    .line 97
    .line 98
    .line 99
    return-void
.end method
