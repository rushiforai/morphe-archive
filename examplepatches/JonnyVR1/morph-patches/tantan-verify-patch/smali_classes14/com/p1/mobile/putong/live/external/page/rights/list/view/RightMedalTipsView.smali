.class public Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;

.field public b:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public c:Lv/VText;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lv/VText;

.field public f:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

.field public g:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

.field public h:Landroid/widget/TextView;

.field public i:Landroid/widget/TextView;

.field public final j:I

.field public final k:I

.field public final l:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x40800000    # 4.0f

    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->j:I

    .line 11
    .line 12
    const/high16 p1, 0x40c00000    # 6.0f

    .line 13
    .line 14
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->k:I

    .line 19
    .line 20
    const/high16 p1, 0x41600000    # 14.0f

    .line 21
    .line 22
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iput p1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->l:I

    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 29
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 p1, 0x40800000    # 4.0f

    .line 30
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->j:I

    const/high16 p1, 0x40c00000    # 6.0f

    .line 31
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->k:I

    const/high16 p1, 0x41600000    # 14.0f

    .line 32
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->l:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 33
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p1, 0x40800000    # 4.0f

    .line 34
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->j:I

    const/high16 p1, 0x40c00000    # 6.0f

    .line 35
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->k:I

    const/high16 p1, 0x41600000    # 14.0f

    .line 36
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->l:I

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;)I
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->updatedTimeInSeconds:J

    .line 2
    .line 3
    iget-wide p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->updatedTimeInSeconds:J

    .line 4
    .line 5
    sub-long/2addr v0, p0

    .line 6
    long-to-int p0, v0

    .line 7
    return p0
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bcd0;->a(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final c(Ll/zbd0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->d:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->d:Landroid/widget/LinearLayout;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->h:Landroid/widget/TextView;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->d(I)Landroid/widget/LinearLayout$LayoutParams;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Ll/zbd0;->I()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->d:Landroid/widget/LinearLayout;

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->i:Landroid/widget/TextView;

    .line 31
    .line 32
    iget v1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->j:I

    .line 33
    .line 34
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->d(I)Landroid/widget/LinearLayout$LayoutParams;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p1, v0, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    const/4 v1, 0x1

    .line 43
    if-ne v0, v1, :cond_3

    .line 44
    .line 45
    invoke-virtual {p1}, Ll/zbd0;->I()Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->d:Landroid/widget/LinearLayout;

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->i:Landroid/widget/TextView;

    .line 55
    .line 56
    iget v1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->j:I

    .line 57
    .line 58
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->d(I)Landroid/widget/LinearLayout$LayoutParams;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p1, v0, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 63
    .line 64
    .line 65
    :cond_3
    :goto_0
    return-void
.end method

.method public final d(I)Landroid/widget/LinearLayout$LayoutParams;
    .locals 2

    .line 1
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 2
    .line 3
    const/4 v1, -0x2

    .line 4
    iget p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->l:I

    .line 5
    .line 6
    invoke-direct {v0, v1, p0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 7
    .line 8
    .line 9
    if-lez p1, :cond_0

    .line 10
    .line 11
    iput p1, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 12
    .line 13
    :cond_0
    return-object v0
.end method

.method public final e(I)Landroid/widget/TextView;
    .locals 2

    .line 1
    new-instance v0, Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 11
    .line 12
    .line 13
    iget p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->k:I

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-virtual {v0, p0, p1, p0, p1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 17
    .line 18
    .line 19
    const-string p0, "#ffffff"

    .line 20
    .line 21
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 26
    .line 27
    .line 28
    const/high16 p0, 0x41200000    # 10.0f

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 31
    .line 32
    .line 33
    sget p0, Ll/mbc0;->e:I

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 36
    .line 37
    .line 38
    return-object v0
.end method

.method public final f()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->f:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 11
    .line 12
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->g:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 22
    .line 23
    sget v0, Lcom/p1/mobile/putong/live/base/R$string;->Z0:I

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->e(I)Landroid/widget/TextView;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->h:Landroid/widget/TextView;

    .line 30
    .line 31
    sget v0, Lcom/p1/mobile/putong/live/base/R$string;->a1:I

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->e(I)Landroid/widget/TextView;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->i:Landroid/widget/TextView;

    .line 38
    .line 39
    return-void
.end method

.method public final g(Ll/zbd0;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ll/zbd0;->H()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v2, "/"

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ll/zbd0;->I()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    const/4 p1, 0x1

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 p1, 0x2

    .line 31
    :goto_0
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->e:Lv/VText;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    sget v3, Lcom/p1/mobile/putong/live/base/R$string;->c1:I

    .line 45
    .line 46
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-static {v2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->e:Lv/VText;

    .line 62
    .line 63
    if-lez v0, :cond_1

    .line 64
    .line 65
    const-string p1, "#212121"

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_1
    const-string p1, "#999999"

    .line 69
    .line 70
    :goto_1
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final h(Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->getThumbnailUrl()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->dynamicUrl:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-static {p2, v0, p0, p1}, Ll/biv;->i(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;ILjava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final i(Ll/zbd0;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ll/zbd0;->H()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->d:Landroid/widget/LinearLayout;

    .line 10
    .line 11
    invoke-virtual {v2}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 12
    .line 13
    .line 14
    new-instance v2, Ll/acd0;

    .line 15
    .line 16
    invoke-direct {v2}, Ll/acd0;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 20
    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    const/4 v3, 0x1

    .line 24
    if-ne v1, v3, :cond_0

    .line 25
    .line 26
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->f:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 33
    .line 34
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->h(Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->d:Landroid/widget/LinearLayout;

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->f:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 40
    .line 41
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->d(I)Landroid/widget/LinearLayout$LayoutParams;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const/4 v4, 0x2

    .line 50
    if-ne v1, v4, :cond_1

    .line 51
    .line 52
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 57
    .line 58
    iget-object v4, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->f:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 59
    .line 60
    invoke-virtual {p0, v1, v4}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->h(Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;)V

    .line 61
    .line 62
    .line 63
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->g:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 70
    .line 71
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->h(Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->d:Landroid/widget/LinearLayout;

    .line 75
    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->f:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 77
    .line 78
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->d(I)Landroid/widget/LinearLayout$LayoutParams;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->d:Landroid/widget/LinearLayout;

    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->g:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 88
    .line 89
    iget v2, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->j:I

    .line 90
    .line 91
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->d(I)Landroid/widget/LinearLayout$LayoutParams;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 96
    .line 97
    .line 98
    :cond_1
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->c(Ll/zbd0;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public final j()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->c:Lv/VText;

    .line 2
    .line 3
    invoke-static {}, Ll/mbs;->J()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public k(Ll/zbd0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->j()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->i(Ll/zbd0;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->g(Ll/zbd0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightMedalTipsView;->f()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
