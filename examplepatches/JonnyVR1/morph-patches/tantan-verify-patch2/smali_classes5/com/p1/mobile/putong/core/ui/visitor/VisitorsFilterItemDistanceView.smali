.class public Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VText;

.field public b:Lv/VSlider;

.field public c:Lv/VSlider$b;


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

.method public static synthetic a(F)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    float-to-int p0, p0

    .line 7
    add-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 10
    .line 11
    .line 12
    const-string p0, "km"

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/lhm0;->a(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c()I
    .locals 1

    .line 1
    invoke-static {}, Ll/afm0;->b()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {}, Ll/afm0;->c()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    sub-int/2addr p0, v0

    .line 10
    div-int/lit16 p0, p0, 0x3e8

    .line 11
    .line 12
    return p0
.end method

.method public d(Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;)V
    .locals 3

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->distance:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView;->a:Lv/VText;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/visitor/e;->b(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView;->e(I)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    int-to-float v1, v0

    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView;->b:Lv/VSlider;

    .line 18
    .line 19
    invoke-virtual {v2}, Lv/VSlider;->getValue()F

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    cmpl-float v2, v1, v2

    .line 24
    .line 25
    if-nez v2, :cond_0

    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView;->b:Lv/VSlider;

    .line 28
    .line 29
    add-int/lit8 v0, v0, 0x1

    .line 30
    .line 31
    int-to-float v0, v0

    .line 32
    invoke-virtual {v2, v0}, Lv/VSlider;->setValue(F)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView;->b:Lv/VSlider;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView;->c()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    int-to-float v2, v2

    .line 42
    invoke-virtual {v0, v2}, Lv/VSlider;->setValueTo(F)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView;->b:Lv/VSlider;

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Lv/VSlider;->setValue(F)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView;->b:Lv/VSlider;

    .line 51
    .line 52
    new-instance v1, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView$a;

    .line 53
    .line 54
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView$a;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView;Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Lv/VSlider;->f(Ll/cp50;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView;->b:Lv/VSlider;

    .line 61
    .line 62
    new-instance v1, Ll/khm0;

    .line 63
    .line 64
    invoke-direct {v1}, Ll/khm0;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v1}, Lv/VSlider;->setLabelFormatter(Ll/ozk0;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView;->c:Lv/VSlider$b;

    .line 71
    .line 72
    if-nez v0, :cond_1

    .line 73
    .line 74
    new-instance v0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView$b;

    .line 75
    .line 76
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView$b;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView;Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;)V

    .line 77
    .line 78
    .line 79
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView;->c:Lv/VSlider$b;

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView;->b:Lv/VSlider;

    .line 83
    .line 84
    invoke-virtual {p1, v0}, Lv/VSlider;->Q(Ll/dok0;)V

    .line 85
    .line 86
    .line 87
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView;->b:Lv/VSlider;

    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView;->c:Lv/VSlider$b;

    .line 90
    .line 91
    invoke-virtual {p1, p0}, Lv/VSlider;->g(Ll/dok0;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public e(I)I
    .locals 0

    .line 1
    invoke-static {}, Ll/afm0;->c()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    sub-int/2addr p1, p0

    .line 6
    div-int/lit16 p1, p1, 0x3e8

    .line 7
    .line 8
    return p1
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
