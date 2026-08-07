.class public Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;
.super Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView<",
        "Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lv/VFrame;

.field public d:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaBgRelativeLayout;

.field public e:Landroid/view/View;

.field public f:Landroid/view/View;

.field public g:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

.field public h:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

.field public i:Landroid/widget/LinearLayout;

.field public j:Landroid/widget/FrameLayout;

.field public k:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

.field public l:Landroid/view/View;

.field public m:Landroid/widget/FrameLayout;

.field public n:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

.field public o:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "[",
            "Ll/aog;",
            ">;"
        }
    .end annotation
.end field

.field public p:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;",
            ">;"
        }
    .end annotation
.end field

.field public q:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public r:I

.field public s:I

.field public t:I

.field public u:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaItemVoteStatus;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 54
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;-><init>(Landroid/content/Context;)V

    .line 55
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->o:Ljava/util/Map;

    const/4 p1, -0x1

    .line 56
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->r:I

    const/high16 p1, 0x41400000    # 12.0f

    .line 57
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result v0

    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->s:I

    .line 58
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    mul-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->t:I

    .line 59
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->u:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->o:Ljava/util/Map;

    .line 10
    .line 11
    const/4 p2, -0x1

    .line 12
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->r:I

    .line 13
    .line 14
    const/high16 p2, 0x41400000    # 12.0f

    .line 15
    .line 16
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->s:I

    .line 21
    .line 22
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    mul-int/lit8 p2, p2, 0x2

    .line 27
    .line 28
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->t:I

    .line 29
    .line 30
    new-instance p2, Ljava/util/HashMap;

    .line 31
    .line 32
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->u:Ljava/util/Map;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->K(Landroid/content/Context;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 41
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 42
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->o:Ljava/util/Map;

    const/4 p2, -0x1

    .line 43
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->r:I

    const/high16 p2, 0x41400000    # 12.0f

    .line 44
    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result p3

    iput p3, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->s:I

    .line 45
    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result p2

    mul-int/lit8 p2, p2, 0x2

    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->t:I

    .line 46
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->u:Ljava/util/Map;

    .line 47
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->K(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 48
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 49
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->o:Ljava/util/Map;

    const/4 p1, -0x1

    .line 50
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->r:I

    const/high16 p1, 0x41400000    # 12.0f

    .line 51
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p2

    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->s:I

    .line 52
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    mul-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->t:I

    .line 53
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->u:Ljava/util/Map;

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->k0(Ljava/lang/Integer;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;Ll/l1i;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->j0(Ll/l1i;)V

    return-void
.end method

.method private b0(II)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->c0(II)D

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

.method private c0(II)D
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

.method private f0(II)I
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->r:I

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->t:I

    .line 4
    .line 5
    sub-int/2addr v0, v1

    .line 6
    int-to-double v0, v0

    .line 7
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->g0(II)D

    .line 8
    .line 9
    .line 10
    move-result-wide p0

    .line 11
    mul-double/2addr v0, p0

    .line 12
    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    .line 13
    .line 14
    .line 15
    move-result-wide p0

    .line 16
    long-to-int p0, p0

    .line 17
    return p0
.end method

.method private g0(II)D
    .locals 4

    .line 1
    int-to-double p0, p1

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    mul-double/2addr p0, v0

    int-to-double v2, p2

    mul-double/2addr v2, v0

    div-double/2addr p0, v2

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
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    .line 6
    .line 7
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->a:Landroid/widget/ImageView;

    .line 8
    .line 9
    const/16 v2, 0x8

    .line 10
    .line 11
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->X(Landroid/view/View;I)V

    .line 12
    .line 13
    .line 14
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->b:Landroid/widget/TextView;

    .line 15
    .line 16
    sget-object v2, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 17
    .line 18
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    sget v3, Ll/k9c0;->D:I

    .line 23
    .line 24
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, Ll/l1i;->c()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->Z(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    sget v2, Ll/lbc0;->Z3:I

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 42
    .line 43
    .line 44
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->c:Landroid/widget/TextView;

    .line 45
    .line 46
    sget-object v2, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 47
    .line 48
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    sget v3, Ll/k9c0;->D:I

    .line 53
    .line 54
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1}, Ll/l1i;->b()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    invoke-virtual {p1}, Ll/l1i;->a()I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    invoke-direct {p0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->f0(II)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    invoke-virtual {p1}, Ll/l1i;->c()I

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->Z(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    filled-new-array {v2}, [Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-static {v1, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 86
    .line 87
    .line 88
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->c:Landroid/widget/TextView;

    .line 89
    .line 90
    invoke-virtual {p1}, Ll/l1i;->b()I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    invoke-virtual {p1}, Ll/l1i;->a()I

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    invoke-direct {p0, v2, v3}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->b0(II)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    .line 104
    .line 105
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->c:Landroid/widget/TextView;

    .line 106
    .line 107
    const/4 v2, 0x1

    .line 108
    new-array v2, v2, [Landroid/view/View;

    .line 109
    .line 110
    const/4 v3, 0x0

    .line 111
    aput-object v1, v2, v3

    .line 112
    .line 113
    const/4 v1, -0x2

    .line 114
    invoke-static {v1, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p1}, Ll/l1i;->c()I

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->e0(Ll/l1i;)I

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    invoke-virtual {p0, v1, p1, v0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->p0(IILandroid/view/View;)V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public E(Ll/l1i;)V
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->B(Ll/l1i;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    .line 6
    .line 7
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->a:Landroid/widget/ImageView;

    .line 8
    .line 9
    const/16 v2, 0x8

    .line 10
    .line 11
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->X(Landroid/view/View;I)V

    .line 12
    .line 13
    .line 14
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->c:Landroid/widget/TextView;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/l1i;->b()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-virtual {p1}, Ll/l1i;->a()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    invoke-direct {p0, v2, v3}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->b0(II)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->b:Landroid/widget/TextView;

    .line 32
    .line 33
    const-string v2, "#66000000"

    .line 34
    .line 35
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1}, Ll/l1i;->c()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->Z(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    const/4 v3, 0x0

    .line 51
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 52
    .line 53
    .line 54
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->c:Landroid/widget/TextView;

    .line 55
    .line 56
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1}, Ll/l1i;->b()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    invoke-virtual {p1}, Ll/l1i;->a()I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    invoke-direct {p0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->f0(II)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    const/high16 v2, 0x42100000    # 36.0f

    .line 76
    .line 77
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    add-int/2addr v1, v2

    .line 82
    invoke-virtual {p1}, Ll/l1i;->c()I

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->Z(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    filled-new-array {v2}, [Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-static {v1, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 95
    .line 96
    .line 97
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->c:Landroid/widget/TextView;

    .line 98
    .line 99
    const/4 v2, 0x1

    .line 100
    new-array v2, v2, [Landroid/view/View;

    .line 101
    .line 102
    aput-object v1, v2, v3

    .line 103
    .line 104
    const/4 v1, -0x2

    .line 105
    invoke-static {v1, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1}, Ll/l1i;->c()I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->Z(I)Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    sget v2, Ll/lbc0;->X3:I

    .line 117
    .line 118
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p1}, Ll/l1i;->c()I

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->e0(Ll/l1i;)I

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    invoke-virtual {p0, v1, p1, v0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->p0(IILandroid/view/View;)V

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public G(Ll/l1i;)V
    .locals 5

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->B(Ll/l1i;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/l1i;->c()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->Z(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    sget v2, Ll/lbc0;->X3:I

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->getNoVoteBgWidth()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    invoke-virtual {p1}, Ll/l1i;->c()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->Z(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    filled-new-array {v2}, [Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-static {v1, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->i:Landroid/widget/LinearLayout;

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 43
    .line 44
    .line 45
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->c:Landroid/widget/TextView;

    .line 46
    .line 47
    const/4 v3, 0x1

    .line 48
    new-array v4, v3, [Landroid/view/View;

    .line 49
    .line 50
    aput-object v1, v4, v2

    .line 51
    .line 52
    invoke-static {v3, v4}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 53
    .line 54
    .line 55
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->b:Landroid/widget/TextView;

    .line 56
    .line 57
    sget-object v3, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 58
    .line 59
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    sget v4, Ll/k9c0;->e:I

    .line 64
    .line 65
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 70
    .line 71
    .line 72
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->a:Landroid/widget/ImageView;

    .line 73
    .line 74
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->X(Landroid/view/View;I)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1}, Ll/l1i;->c()I

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    invoke-virtual {p0, p1, v2, v0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->p0(IILandroid/view/View;)V

    .line 82
    .line 83
    .line 84
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
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->R(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->d:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaBgRelativeLayout;

    .line 16
    .line 17
    new-instance v0, Ll/gub0;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/gub0;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaBgRelativeLayout;->setIsViewIsSelect(Ll/qcj;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->h0()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public bridge synthetic N(Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaItemVoteStatus;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->l0(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaItemVoteStatus;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public R(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/oub0;->b(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public S(Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;Ll/aog;)V
    .locals 11

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->B(Ll/l1i;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->c:Landroid/widget/TextView;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1, v1}, Landroid/view/View;->measure(II)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$e;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->B(Ll/l1i;)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    .line 20
    .line 21
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->c:Landroid/widget/TextView;

    .line 22
    .line 23
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    const/4 v3, 0x1

    .line 28
    invoke-direct {v0, p0, v3, v2, p2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$e;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;IILcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;)V

    .line 29
    .line 30
    .line 31
    new-instance v2, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$f;

    .line 32
    .line 33
    invoke-direct {v2, p0, v1, v3, p2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$f;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;IILcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;)V

    .line 34
    .line 35
    .line 36
    new-instance v3, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$g;

    .line 37
    .line 38
    const/high16 v4, 0x41c00000    # 24.0f

    .line 39
    .line 40
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    invoke-direct {v3, p0, v4, v1, p2}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$g;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;IILcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;)V

    .line 45
    .line 46
    .line 47
    new-instance v5, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$h;

    .line 48
    .line 49
    const/4 v7, 0x1

    .line 50
    const/4 v8, 0x0

    .line 51
    move-object v6, p0

    .line 52
    move-object v9, p1

    .line 53
    move-object v10, p2

    .line 54
    invoke-direct/range {v5 .. v10}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$h;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;IILl/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p3, v0}, Ll/aog;->g(Ll/cog;)Ll/aog;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0, v2}, Ll/aog;->d(Ll/bog;)Ll/aog;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0, v3}, Ll/aog;->g(Ll/cog;)Ll/aog;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0, v5}, Ll/aog;->g(Ll/cog;)Ll/aog;

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public T(Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;Ll/cog;)Ll/aog;
    .locals 8

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->a:Landroid/widget/ImageView;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    new-instance v2, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$i;

    .line 9
    .line 10
    const/4 v4, 0x0

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->e0(Ll/l1i;)I

    .line 12
    .line 13
    .line 14
    move-result v5

    .line 15
    move-object v3, p0

    .line 16
    move-object v6, p1

    .line 17
    move-object v7, p2

    .line 18
    invoke-direct/range {v2 .. v7}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$i;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;IILl/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;)V

    .line 19
    .line 20
    .line 21
    new-instance p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$j;

    .line 22
    .line 23
    invoke-virtual {v3}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->getNoVoteBgWidth()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    invoke-virtual {v6}, Ll/l1i;->b()I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    invoke-virtual {v6}, Ll/l1i;->a()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-direct {v3, p2, v0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->f0(II)I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    const/high16 v0, 0x42100000    # 36.0f

    .line 40
    .line 41
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p2, v0

    .line 46
    invoke-direct {p0, v3, p1, p2, v6}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$j;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;IILl/l1i;)V

    .line 47
    .line 48
    .line 49
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$k;

    .line 50
    .line 51
    const-string p2, "#cc000000"

    .line 52
    .line 53
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    const-string v0, "#66000000"

    .line 58
    .line 59
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    invoke-direct {p1, v3, p2, v0, v7}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$k;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;IILcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p3, p1}, Ll/aog;->g(Ll/cog;)Ll/aog;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p1, p0}, Ll/aog;->g(Ll/cog;)Ll/aog;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0, v2}, Ll/aog;->g(Ll/cog;)Ll/aog;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0
.end method

.method public V(Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;ZLl/cog;)Ll/aog;
    .locals 8

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$l;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->getNoVoteBgWidth()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/l1i;->b()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    add-int/lit8 v2, v2, 0x1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p1}, Ll/l1i;->b()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    :goto_0
    if-eqz p3, :cond_1

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/l1i;->a()I

    .line 23
    .line 24
    .line 25
    move-result p3

    .line 26
    add-int/lit8 p3, p3, 0x1

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_1
    invoke-virtual {p1}, Ll/l1i;->a()I

    .line 30
    .line 31
    .line 32
    move-result p3

    .line 33
    :goto_1
    invoke-direct {p0, v2, p3}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->f0(II)I

    .line 34
    .line 35
    .line 36
    move-result p3

    .line 37
    invoke-direct {v0, p0, v1, p3, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$l;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;IILl/l1i;)V

    .line 38
    .line 39
    .line 40
    new-instance v2, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$a;

    .line 41
    .line 42
    const/4 v4, 0x0

    .line 43
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->e0(Ll/l1i;)I

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    move-object v3, p0

    .line 48
    move-object v6, p1

    .line 49
    move-object v7, p2

    .line 50
    invoke-direct/range {v2 .. v7}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;IILl/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;)V

    .line 51
    .line 52
    .line 53
    new-instance p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$b;

    .line 54
    .line 55
    const-string p1, "#f7f7f8"

    .line 56
    .line 57
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    const-string p2, "#ffe5d2"

    .line 62
    .line 63
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    invoke-direct {p0, v3, p1, p2, v6}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$b;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;IILl/l1i;)V

    .line 68
    .line 69
    .line 70
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$c;

    .line 71
    .line 72
    const-string p2, "#cc000000"

    .line 73
    .line 74
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    const-string p3, "#fe7e1d"

    .line 79
    .line 80
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    move-result p3

    .line 84
    invoke-direct {p1, v3, p2, p3, v7}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$c;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;IILcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p4, v0}, Ll/aog;->g(Ll/cog;)Ll/aog;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    invoke-virtual {p2, p0}, Ll/aog;->g(Ll/cog;)Ll/aog;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0, p1}, Ll/aog;->g(Ll/cog;)Ll/aog;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {p0, v2}, Ll/aog;->g(Ll/cog;)Ll/aog;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    return-object p0
.end method

.method public W(Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;)V
    .locals 1

    .line 1
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->c:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/l1i;->b()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p1}, Ll/l1i;->a()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-direct {p0, v0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->b0(II)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public X(Landroid/view/View;I)V
    .locals 1

    .line 1
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->k:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->a:Landroid/widget/ImageView;

    .line 7
    .line 8
    if-ne p1, v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->g:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->a:Landroid/widget/ImageView;

    .line 13
    .line 14
    invoke-virtual {p0, p2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->h:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->a:Landroid/widget/ImageView;

    .line 21
    .line 22
    invoke-virtual {p0, p2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public Y(Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;Z)I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->u:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/l1i;->i()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    xor-int/2addr p0, v1

    .line 15
    return p0

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->u:Ljava/util/Map;

    .line 17
    .line 18
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget-object v2, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaItemVoteStatus;->NO_VOTE:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaItemVoteStatus;

    .line 23
    .line 24
    const/4 v3, 0x0

    .line 25
    if-ne v0, v2, :cond_1

    .line 26
    .line 27
    invoke-virtual {p1}, Ll/l1i;->i()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    :cond_1
    if-eqz p3, :cond_3

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/l1i;->h()Z

    .line 36
    .line 37
    .line 38
    move-result p3

    .line 39
    if-eqz p3, :cond_3

    .line 40
    .line 41
    :cond_2
    return v3

    .line 42
    :cond_3
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->u:Ljava/util/Map;

    .line 43
    .line 44
    invoke-interface {p3, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p3

    .line 48
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaItemVoteStatus;->HAVE_VOTE_NOT_BE_VOTING:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaItemVoteStatus;

    .line 49
    .line 50
    if-eq p3, v0, :cond_5

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->u:Ljava/util/Map;

    .line 53
    .line 54
    invoke-interface {p0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    if-ne p0, v2, :cond_4

    .line 59
    .line 60
    invoke-virtual {p1}, Ll/l1i;->i()Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-nez p0, :cond_4

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_4
    return v3

    .line 68
    :cond_5
    :goto_0
    return v1
.end method

.method public Z(I)Landroid/view/View;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->e:Landroid/view/View;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->f:Landroid/view/View;

    .line 7
    .line 8
    return-object p0
.end method

.method public a0(I)Landroid/view/View;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->g:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->a:Landroid/widget/ImageView;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->h:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->a:Landroid/widget/ImageView;

    .line 11
    .line 12
    return-object p0
.end method

.method public e0(Ll/l1i;)I
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->B(Ll/l1i;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Landroid/view/ViewGroup;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, v0, v0}, Landroid/view/View;->measure(II)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->a:Landroid/widget/ImageView;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    const/high16 v1, 0x41a00000    # 20.0f

    .line 26
    .line 27
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    move v1, v0

    .line 33
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->c:Landroid/widget/TextView;

    .line 34
    .line 35
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    const/4 v3, 0x1

    .line 40
    if-ne v2, v3, :cond_1

    .line 41
    .line 42
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->c:Landroid/widget/TextView;

    .line 43
    .line 44
    invoke-virtual {v2, v0, v0}, Landroid/view/View;->measure(II)V

    .line 45
    .line 46
    .line 47
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->c:Landroid/widget/TextView;

    .line 48
    .line 49
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    sub-int/2addr v1, v2

    .line 54
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    sub-int/2addr p1, p0

    .line 63
    add-int/2addr p1, v1

    .line 64
    div-int/lit8 p1, p1, 0x2

    .line 65
    .line 66
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    return p0
.end method

.method public getAnimTime()I
    .locals 0

    const/16 p0, 0x190

    return p0
.end method

.method public getNoVoteBgWidth()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->r:I

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->s:I

    .line 4
    .line 5
    sub-int/2addr v0, v1

    .line 6
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->t:I

    .line 7
    .line 8
    sub-int/2addr v0, p0

    .line 9
    div-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    return v0
.end method

.method public getQaTopicVoteViewList()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->p:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->p:Ljava/util/List;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->k:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    .line 13
    .line 14
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->p:Ljava/util/List;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->n:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    .line 20
    .line 21
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->p:Ljava/util/List;

    .line 25
    .line 26
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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->i:Landroid/widget/LinearLayout;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->q:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->q:Ljava/util/List;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->j:Landroid/widget/FrameLayout;

    .line 13
    .line 14
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->q:Ljava/util/List;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->m:Landroid/widget/FrameLayout;

    .line 20
    .line 21
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->q:Ljava/util/List;

    .line 25
    .line 26
    return-object p0
.end method

.method public final h0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->g:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->a:Landroid/widget/ImageView;

    .line 4
    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->X(Landroid/view/View;I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->h:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->a:Landroid/widget/ImageView;

    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->X(Landroid/view/View;I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->g:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->a:Landroid/widget/ImageView;

    .line 20
    .line 21
    sget v1, Ll/lbc0;->d4:I

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->h:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->a:Landroid/widget/ImageView;

    .line 29
    .line 30
    sget v0, Ll/lbc0;->e4:I

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic j0(Ll/l1i;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->z(Ll/l1i;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic k0(Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->u:Ljava/util/Map;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->p:Ljava/util/List;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget-object p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaItemVoteStatus;->HAVE_VOTE_BE_VOTING:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaItemVoteStatus;

    .line 18
    .line 19
    if-ne p0, p1, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public l0(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaItemVoteStatus;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->u:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m0(Ll/l1i;I[Ll/aog;Ll/aog;)V
    .locals 0

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    const/4 p3, 0x2

    .line 4
    new-array p3, p3, [Ll/aog;

    .line 5
    .line 6
    aput-object p4, p3, p2

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->o:Ljava/util/Map;

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/l1i;->c()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-interface {p0, p1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    aput-object p4, p3, p2

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->o:Ljava/util/Map;

    .line 25
    .line 26
    invoke-virtual {p1}, Ll/l1i;->c()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-interface {p0, p1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final o0(Ll/l1i;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/l1i;->c()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x4

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->g:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->b:Landroid/widget/TextView;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->g:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->b:Landroid/widget/TextView;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/l1i;->d()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->h:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->b:Landroid/widget/TextView;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->h:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->b:Landroid/widget/TextView;

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/l1i;->d()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
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
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->r:I

    .line 9
    .line 10
    return-void
.end method

.method public p0(IILandroid/view/View;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-static {p3, p2}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-static {p3, p2}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public q0(Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/l1i;->i()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p2, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->c:Landroid/widget/TextView;

    .line 8
    .line 9
    const-string p1, "#fe7e1d"

    .line 10
    .line 11
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object p0, p2, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->c:Landroid/widget/TextView;

    .line 20
    .line 21
    const-string p1, "#66000000"

    .line 22
    .line 23
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 28
    .line 29
    .line 30
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
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    .line 6
    .line 7
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->W(Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->u:Ljava/util/Map;

    .line 11
    .line 12
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sget-object v2, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaItemVoteStatus;->HAVE_VOTE_BE_VOTING:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaItemVoteStatus;

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    const/4 v4, 0x1

    .line 20
    if-ne v1, v2, :cond_0

    .line 21
    .line 22
    move v1, v4

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move v1, v3

    .line 25
    :goto_0
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->Y(Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;Z)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->o:Ljava/util/Map;

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/l1i;->c()I

    .line 32
    .line 33
    .line 34
    move-result v6

    .line 35
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    check-cast v5, [Ll/aog;

    .line 44
    .line 45
    if-eqz v5, :cond_1

    .line 46
    .line 47
    array-length v6, v5

    .line 48
    if-le v6, v2, :cond_1

    .line 49
    .line 50
    aget-object v6, v5, v2

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    const/4 v6, 0x0

    .line 54
    :goto_1
    if-eqz v6, :cond_2

    .line 55
    .line 56
    invoke-virtual {p1}, Ll/l1i;->h()Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    invoke-virtual {v6, p0}, Ll/aog;->e(Z)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_2
    new-instance v6, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$d;

    .line 65
    .line 66
    invoke-direct {v6, p0, v4, v3, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView$d;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;IILl/l1i;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, p1, v2, v5, v6}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->m0(Ll/l1i;I[Ll/aog;Ll/aog;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1}, Ll/l1i;->i()Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-nez v2, :cond_4

    .line 77
    .line 78
    if-eqz v1, :cond_3

    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_3
    invoke-virtual {p0, p1, v0, v6}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->T(Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;Ll/cog;)Ll/aog;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    goto :goto_3

    .line 86
    :cond_4
    :goto_2
    invoke-virtual {p0, p1, v0, v1, v6}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->V(Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;ZLl/cog;)Ll/aog;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    :goto_3
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->S(Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;Ll/aog;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1}, Ll/l1i;->h()Z

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    invoke-virtual {v6, p0}, Ll/aog;->e(Z)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public z(Ll/l1i;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->r:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    new-instance v0, Ll/hub0;

    .line 7
    .line 8
    invoke-direct {v0, p0, p1}, Ll/hub0;-><init>(Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;Ll/l1i;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->z(Ll/l1i;)V

    .line 16
    .line 17
    .line 18
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTopicVoteListGroupView;->B(Ll/l1i;)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;

    .line 23
    .line 24
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;->b:Landroid/widget/TextView;

    .line 25
    .line 26
    invoke-virtual {p1}, Ll/l1i;->d()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Ll/l1i;->h()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-nez v1, :cond_1

    .line 38
    .line 39
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->q0(Ll/l1i;Lcom/p1/mobile/putong/feed/newui/topic/qatopic/FeedQaTwoOptionTopicItem;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicTowOptionVoteView;->o0(Ll/l1i;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method
