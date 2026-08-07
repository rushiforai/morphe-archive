.class public Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;
.super Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView<",
        "Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lv/VFrame;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

.field public f:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

.field public g:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

.field public h:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

.field public i:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

.field public j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public l:I

.field public m:Landroid/graphics/drawable/Drawable;

.field public n:I

.field public o:I

.field public p:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/l1i;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->p:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 15
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->p:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 16
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 17
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->p:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 13
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->p:Ljava/util/List;

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;DLandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->f0(Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;DLandroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->g0(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->h0(Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;)V

    return-void
.end method

.method public static bridge synthetic S(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->m:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method public static bridge synthetic T(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->p:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic V(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->o:I

    return-void
.end method

.method private a0(II)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->b0(II)D

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    cmpl-double p2, p0, v0

    .line 8
    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    const-string p0, "0%"

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    new-instance p2, Ljava/text/DecimalFormat;

    .line 15
    .line 16
    const-string v0, "##%"

    .line 17
    .line 18
    invoke-direct {p2, v0}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2, p0, p1}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method private b0(II)D
    .locals 4

    .line 1
    if-nez p2, :cond_0

    const-wide/16 p0, 0x0

    return-wide p0

    :cond_0
    int-to-double p0, p1

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    mul-double/2addr p0, v0

    int-to-double v2, p2

    mul-double/2addr v2, v0

    div-double/2addr p0, v2

    return-wide p0
.end method

.method private c0(II)I
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->l:I

    .line 2
    .line 3
    int-to-double v0, v0

    .line 4
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->e0(II)D

    .line 5
    .line 6
    .line 7
    move-result-wide p0

    .line 8
    mul-double/2addr v0, p0

    .line 9
    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    .line 10
    .line 11
    .line 12
    move-result-wide p0

    .line 13
    long-to-int p0, p0

    .line 14
    return p0
.end method

.method private e0(II)D
    .locals 4

    .line 1
    int-to-double p0, p1

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    mul-double/2addr p0, v0

    int-to-double v2, p2

    mul-double/2addr v2, v0

    div-double/2addr p0, v2

    const-wide v2, 0x3fef5c28f5c28f5cL    # 0.98

    cmpl-double p2, p0, v2

    if-lez p2, :cond_0

    cmpg-double p2, p0, v0

    if-gez p2, :cond_0

    return-wide v2

    :cond_0
    return-wide p0
.end method


# virtual methods
.method public C(Ll/l1i;)V
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->B(Ll/l1i;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->k0(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->c:Landroid/widget/TextView;

    .line 12
    .line 13
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    sget v2, Ll/k9c0;->n:I

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->b:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;

    .line 29
    .line 30
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 31
    .line 32
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    sget v2, Ll/k9c0;->O:I

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->setColor(I)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    sget v1, Ll/lbc0;->c4:I

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->m:Landroid/graphics/drawable/Drawable;

    .line 56
    .line 57
    const/16 v1, 0xff

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->m:Landroid/graphics/drawable/Drawable;

    .line 63
    .line 64
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->n:I

    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->m:Landroid/graphics/drawable/Drawable;

    .line 71
    .line 72
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->m:Landroid/graphics/drawable/Drawable;

    .line 77
    .line 78
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    const/4 v3, 0x0

    .line 83
    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->c:Landroid/widget/TextView;

    .line 87
    .line 88
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->m:Landroid/graphics/drawable/Drawable;

    .line 89
    .line 90
    const/4 v1, 0x0

    .line 91
    invoke-virtual {v0, p0, v1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 92
    .line 93
    .line 94
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->d:Lv/VText;

    .line 95
    .line 96
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 97
    .line 98
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    sget v0, Ll/k9c0;->n:I

    .line 103
    .line 104
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public E(Ll/l1i;)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->B(Ll/l1i;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->b:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    sget v2, Ll/k9c0;->H:I

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->setColor(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->c:Landroid/widget/TextView;

    .line 25
    .line 26
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 27
    .line 28
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    sget v2, Ll/k9c0;->P:I

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->c:Landroid/widget/TextView;

    .line 42
    .line 43
    const/4 v1, 0x0

    .line 44
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->d:Lv/VText;

    .line 48
    .line 49
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 50
    .line 51
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    sget v2, Ll/k9c0;->j:I

    .line 56
    .line 57
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 62
    .line 63
    .line 64
    const/4 v0, 0x0

    .line 65
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->k0(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;Z)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public F(Ll/l1i;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->F(Ll/l1i;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->B(Ll/l1i;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->d:Lv/VText;

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->b:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;

    .line 17
    .line 18
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public G(Ll/l1i;)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->B(Ll/l1i;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->c:Landroid/widget/TextView;

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    sget v2, Ll/k9c0;->d:I

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->c:Landroid/widget/TextView;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->d:Lv/VText;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->b:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;

    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->k0(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;Z)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->a:Landroid/widget/RelativeLayout;

    .line 45
    .line 46
    sget p1, Ll/lbc0;->Q5:I

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public K(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->K(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->W(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    const/high16 p1, 0x41200000    # 10.0f

    .line 16
    .line 17
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-static {p0, p1}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->getQaTopicVoteViewList()Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

    .line 43
    .line 44
    const/high16 v0, 0x40c00000    # 6.0f

    .line 45
    .line 46
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    invoke-static {p1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    return-void
.end method

.method public bridge synthetic N(Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaItemVoteStatus;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->j0(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaItemVoteStatus;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public W(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/xsb0;->b(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public X(Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;)V
    .locals 3

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->d:Lv/VText;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->c:Landroid/widget/TextView;

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->o:I

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/l1i;->c()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-ne v1, v2, :cond_0

    .line 17
    .line 18
    const-string v1, "#fe7e1d"

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const-string v1, "#66000000"

    .line 22
    .line 23
    :goto_0
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const-string v2, "#cc000000"

    .line 28
    .line 29
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    filled-new-array {v1, v2}, [I

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const-string v2, "textColor"

    .line 38
    .line 39
    invoke-static {v0, v2, v1}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-wide/16 v1, 0x320

    .line 44
    .line 45
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 46
    .line 47
    .line 48
    new-instance v1, Landroid/animation/ArgbEvaluator;

    .line 49
    .line 50
    invoke-direct {v1}, Landroid/animation/ArgbEvaluator;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 57
    .line 58
    .line 59
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->o:I

    .line 60
    .line 61
    invoke-virtual {p1}, Ll/l1i;->c()I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-ne v0, p1, :cond_1

    .line 66
    .line 67
    const p1, 0x33fe7e1d

    .line 68
    .line 69
    .line 70
    const/high16 v0, 0x7000000

    .line 71
    .line 72
    filled-new-array {p1, v0}, [I

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    const-wide/16 v0, 0xc8

    .line 81
    .line 82
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 83
    .line 84
    .line 85
    new-instance v0, Ll/wsb0;

    .line 86
    .line 87
    invoke-direct {v0, p0, p2}, Ll/wsb0;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 91
    .line 92
    .line 93
    new-instance p0, Landroid/animation/ArgbEvaluator;

    .line 94
    .line 95
    invoke-direct {p0}, Landroid/animation/ArgbEvaluator;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 102
    .line 103
    .line 104
    :cond_1
    return-void
.end method

.method public Y(Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;I)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/l1i;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->o:I

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/l1i;->c()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-ne v0, p1, :cond_1

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    if-nez p3, :cond_0

    .line 17
    .line 18
    iget-object p0, p2, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->c:Landroid/widget/TextView;

    .line 19
    .line 20
    invoke-virtual {p0, p1, p1, p1, p1}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget v1, Ll/lbc0;->c4:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->Z(I)D

    .line 35
    .line 36
    .line 37
    move-result-wide v1

    .line 38
    double-to-int p0, v1

    .line 39
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    .line 40
    .line 41
    .line 42
    move-result p3

    .line 43
    const/4 v1, 0x0

    .line 44
    invoke-virtual {v0, v1, v1, p0, p3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p2, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->c:Landroid/widget/TextView;

    .line 48
    .line 49
    invoke-virtual {p0, v0, p1, p1, p1}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method public final Z(I)D
    .locals 1

    .line 1
    const v0, 0x3c8ad8f3

    .line 2
    .line 3
    .line 4
    int-to-float p1, p1

    .line 5
    mul-float/2addr p1, v0

    .line 6
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->n:I

    .line 7
    .line 8
    int-to-float v0, p0

    .line 9
    mul-float/2addr p1, v0

    .line 10
    const v0, 0x3f2aaaab

    .line 11
    .line 12
    .line 13
    int-to-float p0, p0

    .line 14
    mul-float/2addr p0, v0

    .line 15
    sub-float/2addr p1, p0

    .line 16
    float-to-double p0, p1

    .line 17
    return-wide p0
.end method

.method public final synthetic f0(Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;DLandroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    invoke-virtual {p5}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p5

    .line 5
    check-cast p5, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p5

    .line 11
    invoke-virtual {p0, p1, p2, p5}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->Y(Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;I)V

    .line 12
    .line 13
    .line 14
    int-to-double v0, p5

    .line 15
    mul-double/2addr v0, p3

    .line 16
    iget p3, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->l:I

    .line 17
    .line 18
    int-to-double p3, p3

    .line 19
    mul-double/2addr v0, p3

    .line 20
    const-wide/high16 p3, 0x4059000000000000L    # 100.0

    .line 21
    .line 22
    div-double/2addr v0, p3

    .line 23
    double-to-int p3, v0

    .line 24
    iget-object p4, p2, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->b:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;

    .line 25
    .line 26
    invoke-virtual {p4, p3}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->setLikedWidth(I)V

    .line 27
    .line 28
    .line 29
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->d:Lv/VText;

    .line 30
    .line 31
    int-to-float p3, p5

    .line 32
    const/high16 p4, 0x42c80000    # 100.0f

    .line 33
    .line 34
    div-float/2addr p3, p4

    .line 35
    invoke-virtual {p1}, Ll/l1i;->b()I

    .line 36
    .line 37
    .line 38
    move-result p4

    .line 39
    int-to-float p4, p4

    .line 40
    mul-float/2addr p3, p4

    .line 41
    float-to-int p3, p3

    .line 42
    invoke-virtual {p1}, Ll/l1i;->a()I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    invoke-direct {p0, p3, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->a0(II)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final synthetic g0(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->getRadius()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    int-to-float p0, p0

    .line 15
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 16
    .line 17
    .line 18
    const/4 p0, -0x1

    .line 19
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Ljava/lang/Integer;

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    const/high16 p2, 0x40400000    # 3.0f

    .line 33
    .line 34
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    invoke-virtual {v0, p2, p0}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->a:Landroid/widget/RelativeLayout;

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public getAnimTime()I
    .locals 0

    const/16 p0, 0x2bc

    return p0
.end method

.method public getQaTopicVoteViewList()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->j:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->j:Ljava/util/List;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->e:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

    .line 13
    .line 14
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->j:Ljava/util/List;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->f:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

    .line 20
    .line 21
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->j:Ljava/util/List;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->g:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

    .line 27
    .line 28
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->j:Ljava/util/List;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->h:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

    .line 34
    .line 35
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->j:Ljava/util/List;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->i:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

    .line 41
    .line 42
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->j:Ljava/util/List;

    .line 46
    .line 47
    return-object p0
.end method

.method public getRadius()I
    .locals 0

    .line 1
    const/high16 p0, 0x41600000    # 14.0f

    .line 2
    .line 3
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getView()Landroid/view/View;
    .locals 0

    return-object p0
.end method

.method public getVoteListContainer()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->d:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVoteViewContainerList()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->k:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->k:Ljava/util/List;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->e:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

    .line 13
    .line 14
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->k:Ljava/util/List;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->f:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

    .line 20
    .line 21
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->k:Ljava/util/List;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->g:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

    .line 27
    .line 28
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->k:Ljava/util/List;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->h:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

    .line 34
    .line 35
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->k:Ljava/util/List;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->i:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

    .line 41
    .line 42
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->k:Ljava/util/List;

    .line 46
    .line 47
    return-object p0
.end method

.method public final synthetic h0(Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->l0(Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j0(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaItemVoteStatus;)V
    .locals 0

    .line 1
    return-void
.end method

.method public k0(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;Z)V
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->b:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/widget/RelativeLayout;

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Landroid/view/View;->setSelected(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public l0(Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->z(Ll/l1i;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/l1i;->g()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->d:Lv/VText;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/l1i;->b()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {p1}, Ll/l1i;->a()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-direct {p0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->a0(II)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->b:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/l1i;->b()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-virtual {p1}, Ll/l1i;->a()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    invoke-direct {p0, v0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->c0(II)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicVoteBgView;->setLikedWidth(I)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->l:I

    .line 9
    .line 10
    return-void
.end method

.method public v(Ll/l1i;)V
    .locals 7

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->B(Ll/l1i;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    move-object v4, v0

    .line 6
    check-cast v4, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/l1i;->b()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/16 v1, 0x64

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iget-object v0, v4, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->d:Lv/VText;

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/l1i;->b()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    invoke-direct {p0, v2, v1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->a0(II)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Ll/l1i;->h()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->p:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->w(Ll/l1i;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    invoke-virtual {p1}, Ll/l1i;->b()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    invoke-virtual {p1}, Ll/l1i;->a()I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    invoke-direct {p0, v0, v2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->e0(II)D

    .line 54
    .line 55
    .line 56
    move-result-wide v5

    .line 57
    invoke-virtual {p1}, Ll/l1i;->h()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    const/4 v2, 0x0

    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    filled-new-array {v1, v2}, [I

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    goto :goto_0

    .line 73
    :cond_2
    filled-new-array {v2, v1}, [I

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    :goto_0
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 82
    .line 83
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->getAnimTime()I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    int-to-long v1, v1

    .line 94
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 95
    .line 96
    .line 97
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView$a;

    .line 98
    .line 99
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;Ll/l1i;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 103
    .line 104
    .line 105
    new-instance v1, Ll/vsb0;

    .line 106
    .line 107
    move-object v2, p0

    .line 108
    move-object v3, p1

    .line 109
    invoke-direct/range {v1 .. v6}, Ll/vsb0;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;D)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v3}, Ll/l1i;->h()Z

    .line 119
    .line 120
    .line 121
    move-result p0

    .line 122
    if-eqz p0, :cond_3

    .line 123
    .line 124
    invoke-virtual {v2, v3, v4}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->X(Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;)V

    .line 125
    .line 126
    .line 127
    :cond_3
    return-void
.end method

.method public z(Ll/l1i;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->B(Ll/l1i;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->l:I

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    new-instance v1, Ll/usb0;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1, v0}, Ll/usb0;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->l0(Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;)V

    .line 21
    .line 22
    .line 23
    :goto_0
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicItem;->c:Landroid/widget/TextView;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/l1i;->d()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Ll/l1i;->g()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/l1i;->e()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicMultiOptionVoteView;->o:I

    .line 43
    .line 44
    :cond_1
    return-void
.end method
