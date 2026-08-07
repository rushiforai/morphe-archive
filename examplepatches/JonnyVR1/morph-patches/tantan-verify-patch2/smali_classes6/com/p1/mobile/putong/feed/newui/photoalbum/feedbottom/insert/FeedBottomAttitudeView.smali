.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeView;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lv/VLinear;

.field public b:Lv/VText;

.field public c:Lv/VLinear;

.field public d:Ljava/lang/String;

.field public e:Ll/n570;

.field public f:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeView;Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeView;->B(Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;Landroid/view/View;)V

    return-void
.end method

.method private r()V
    .locals 9

    .line 1
    invoke-static {}, Ll/nkh;->l()Ll/nkh;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/nkh;->f()Ljava/util/ArrayList;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeView;->a:Lv/VLinear;

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const/4 v1, 0x1

    .line 23
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeView;->c:Lv/VLinear;

    .line 27
    .line 28
    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeView;->z(Ljava/util/List;)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-ge v3, v2, :cond_2

    .line 40
    .line 41
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    check-cast v2, Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;

    .line 46
    .line 47
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeView;->act()Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-virtual {v4}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    sget v5, Ll/tec0;->O:I

    .line 56
    .line 57
    const/4 v6, 0x0

    .line 58
    invoke-virtual {v4, v5, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    check-cast v4, Lv/VLinear;

    .line 63
    .line 64
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 65
    .line 66
    const/4 v6, -0x2

    .line 67
    invoke-direct {v5, v6, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 68
    .line 69
    .line 70
    if-lez v3, :cond_1

    .line 71
    .line 72
    iput v1, v5, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 73
    .line 74
    :cond_1
    invoke-virtual {v4, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 75
    .line 76
    .line 77
    sget v5, Ll/hdc0;->f:I

    .line 78
    .line 79
    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    check-cast v5, Lv/VDraweeView;

    .line 84
    .line 85
    sget v6, Ll/hdc0;->e1:I

    .line 86
    .line 87
    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v6

    .line 91
    check-cast v6, Lv/VText;

    .line 92
    .line 93
    sget-object v7, Ll/uqb0;->G:Ll/fsb0;

    .line 94
    .line 95
    iget-object v8, v2, Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;->url:Ljava/lang/String;

    .line 96
    .line 97
    invoke-virtual {v7, v5, v8}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    iget-object v5, v2, Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;->name:Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    .line 104
    .line 105
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeView;->c:Lv/VLinear;

    .line 106
    .line 107
    invoke-virtual {v5, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 108
    .line 109
    .line 110
    new-instance v5, Ll/mrg;

    .line 111
    .line 112
    invoke-direct {v5, p0, v2}, Ll/mrg;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeView;Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;)V

    .line 113
    .line 114
    .line 115
    invoke-static {v4, v5}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 116
    .line 117
    .line 118
    add-int/lit8 v3, v3, 0x1

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_2
    return-void
.end method

.method public static synthetic s(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/i4h;->g(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final synthetic B(Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;Landroid/view/View;)V
    .locals 0

    .line 1
    iget p2, p1, Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;->id:I

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeView;->w(I)V

    .line 4
    .line 5
    .line 6
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeView;->e:Ll/n570;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeView;->f:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 9
    .line 10
    iget p1, p1, Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;->id:I

    .line 11
    .line 12
    invoke-virtual {p2, p0, p1}, Ll/n570;->t(Lcom/p1/mobile/putong/feed/data/Moment;I)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance p1, Ll/nrg;

    .line 17
    .line 18
    invoke-direct {p1}, Ll/nrg;-><init>()V

    .line 19
    .line 20
    .line 21
    new-instance p2, Ll/org;

    .line 22
    .line 23
    invoke-direct {p2}, Ll/org;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public C(Ljava/lang/String;Ll/n570;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeView;->d:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeView;->e:Ll/n570;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeView;->f:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeView;->r()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeView;->v(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeView;->b:Lv/VText;

    .line 8
    .line 9
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final v(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/prg;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public w(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeView;->d:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "attitude"

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeView;->f:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeView;->f:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const-string p0, ""

    .line 27
    .line 28
    :goto_0
    const-string v1, "moment_id"

    .line 29
    .line 30
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    filled-new-array {p1, p0}, [Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string p1, "e_attitude_guide"

    .line 39
    .line 40
    invoke-static {p1, v0, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final z(Ljava/util/List;)I
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;",
            ">;)I"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x41a80000    # 21.0f

    .line 6
    .line 7
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    sub-int/2addr v0, v1

    .line 12
    int-to-float v0, v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeView;->b:Lv/VText;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "\u6211\u89c9\u5f97"

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    sub-float/2addr v0, v1

    .line 26
    const/high16 v1, 0x41800000    # 16.0f

    .line 27
    .line 28
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    int-to-float v1, v1

    .line 33
    sub-float/2addr v0, v1

    .line 34
    const/high16 v1, 0x42800000    # 64.0f

    .line 35
    .line 36
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    int-to-float v1, v1

    .line 41
    sub-float/2addr v0, v1

    .line 42
    float-to-int v0, v0

    .line 43
    const/4 v1, 0x0

    .line 44
    move v2, v1

    .line 45
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    if-ge v1, v3, :cond_0

    .line 50
    .line 51
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    check-cast v3, Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;

    .line 56
    .line 57
    const/high16 v4, 0x41c00000    # 24.0f

    .line 58
    .line 59
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    const/high16 v5, 0x40800000    # 4.0f

    .line 64
    .line 65
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 66
    .line 67
    .line 68
    move-result v5

    .line 69
    add-int/2addr v4, v5

    .line 70
    add-int/2addr v2, v4

    .line 71
    int-to-float v2, v2

    .line 72
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedBottomAttitudeView;->b:Lv/VText;

    .line 73
    .line 74
    invoke-virtual {v4}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;->name:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v4, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    add-float/2addr v2, v3

    .line 85
    float-to-int v2, v2

    .line 86
    add-int/lit8 v1, v1, 0x1

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_0
    sub-int/2addr v0, v2

    .line 90
    div-int/lit8 v0, v0, 0x3

    .line 91
    .line 92
    return v0
.end method
