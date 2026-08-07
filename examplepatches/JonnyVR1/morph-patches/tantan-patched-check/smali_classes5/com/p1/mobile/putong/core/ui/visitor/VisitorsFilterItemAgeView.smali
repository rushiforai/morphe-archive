.class public Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VText;

.field public b:Lv/VRangeSlider;

.field public c:Lv/VRangeSlider$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ghm0;->a(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;)V
    .locals 7

    .line 1
    invoke-static {}, Ll/afm0;->e()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {}, Ll/afm0;->d()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget v2, p1, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->minAge:I

    .line 10
    .line 11
    int-to-float v2, v2

    .line 12
    iget v3, p1, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->maxAge:I

    .line 13
    .line 14
    int-to-float v3, v3

    .line 15
    const/4 v4, 0x0

    .line 16
    cmpg-float v5, v2, v4

    .line 17
    .line 18
    if-gtz v5, :cond_0

    .line 19
    .line 20
    invoke-static {}, Ll/afm0;->e()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    int-to-float v2, v2

    .line 25
    :cond_0
    cmpg-float v4, v3, v4

    .line 26
    .line 27
    if-gtz v4, :cond_1

    .line 28
    .line 29
    invoke-static {}, Ll/afm0;->d()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    int-to-float v3, v3

    .line 34
    :cond_1
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView;->a:Lv/VText;

    .line 35
    .line 36
    float-to-int v5, v2

    .line 37
    float-to-int v6, v3

    .line 38
    invoke-static {v5, v6}, Lcom/p1/mobile/putong/core/ui/visitor/e;->a(II)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView;->b:Lv/VRangeSlider;

    .line 46
    .line 47
    int-to-float v0, v0

    .line 48
    invoke-virtual {v4, v0}, Lv/VRangeSlider;->setValueFrom(F)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView;->b:Lv/VRangeSlider;

    .line 52
    .line 53
    int-to-float v1, v1

    .line 54
    invoke-virtual {v0, v1}, Lv/VRangeSlider;->setValueTo(F)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView;->b:Lv/VRangeSlider;

    .line 58
    .line 59
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    filled-new-array {v1, v2}, [Ljava/lang/Float;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v0, v1}, Lv/VRangeSlider;->setValues([Ljava/lang/Float;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView;->b:Lv/VRangeSlider;

    .line 75
    .line 76
    new-instance v1, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView$a;

    .line 77
    .line 78
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView$a;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView;Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v1}, Lv/VRangeSlider;->f(Ll/cp50;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView;->c:Lv/VRangeSlider$a;

    .line 85
    .line 86
    if-nez v0, :cond_2

    .line 87
    .line 88
    new-instance v0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView$b;

    .line 89
    .line 90
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView$b;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView;Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;)V

    .line 91
    .line 92
    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView;->c:Lv/VRangeSlider$a;

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView;->b:Lv/VRangeSlider;

    .line 97
    .line 98
    invoke-virtual {p1, v0}, Lv/VRangeSlider;->Q(Ll/dok0;)V

    .line 99
    .line 100
    .line 101
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView;->b:Lv/VRangeSlider;

    .line 102
    .line 103
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView;->c:Lv/VRangeSlider$a;

    .line 104
    .line 105
    invoke-virtual {p1, p0}, Lv/VRangeSlider;->g(Ll/dok0;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
