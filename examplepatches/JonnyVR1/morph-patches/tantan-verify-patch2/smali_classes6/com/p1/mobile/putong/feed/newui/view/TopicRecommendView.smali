.class public Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;
.super Lv/VRelative;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;
    }
.end annotation


# instance fields
.field public d:Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;

.field public g:Lcom/p1/mobile/putong/feed/newui/topic/VBannerPager;

.field public h:Landroid/widget/LinearLayout;

.field public i:I

.field public j:I

.field public k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field public l:Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;

.field public m:I

.field public n:I

.field public o:I

.field public p:I

.field public q:Z

.field public r:Ll/h80;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VRelative;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x2

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->i:I

    .line 6
    .line 7
    new-instance p1, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->k:Ljava/util/List;

    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->n:I

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->p:I

    .line 19
    .line 20
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$a;

    .line 21
    .line 22
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;)V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->r:Ll/h80;

    .line 26
    .line 27
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 28
    invoke-direct {p0, p1, p2}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x2

    .line 29
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->i:I

    .line 30
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->k:Ljava/util/List;

    const/4 p1, 0x1

    .line 31
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->n:I

    const/4 p1, 0x0

    .line 32
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->p:I

    .line 33
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->r:Ll/h80;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 34
    invoke-direct {p0, p1, p2, p3}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x2

    .line 35
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->i:I

    .line 36
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->k:Ljava/util/List;

    const/4 p1, 0x1

    .line 37
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->n:I

    const/4 p1, 0x0

    .line 38
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->p:I

    .line 39
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->r:Ll/h80;

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;)Ll/h80;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->r:Ll/h80;

    return-object p0
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->j:I

    return p0
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->m:I

    return p0
.end method

.method public static bridge synthetic L(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->n:I

    return-void
.end method

.method public static bridge synthetic M(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->p:I

    return-void
.end method

.method public static bridge synthetic O(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->act()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic P(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->getPageId()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic Q(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->Z(I)V

    return-void
.end method

.method public static bridge synthetic R(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->c0(Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;)V

    return-void
.end method

.method private V()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/ksg;->J0(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->getPageId()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->T(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/jka;->vd()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private synthetic W(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->V()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private X(Ljava/util/List;Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/CategoryTopic;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 3
    .line 4
    .line 5
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->i:I

    .line 10
    .line 11
    rem-int/2addr v1, v2

    .line 12
    const/4 v2, 0x1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->i:I

    .line 20
    .line 21
    div-int/2addr v1, v3

    .line 22
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->j:I

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->i:I

    .line 30
    .line 31
    div-int/2addr v1, v3

    .line 32
    add-int/2addr v1, v2

    .line 33
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->j:I

    .line 34
    .line 35
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->k:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->h:Landroid/widget/LinearLayout;

    .line 41
    .line 42
    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 43
    .line 44
    .line 45
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->j:I

    .line 46
    .line 47
    if-le v1, v2, :cond_1

    .line 48
    .line 49
    :goto_1
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->j:I

    .line 50
    .line 51
    if-ge v0, v1, :cond_2

    .line 52
    .line 53
    new-instance v1, Landroid/widget/ImageView;

    .line 54
    .line 55
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->act()Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-direct {v1, v2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 60
    .line 61
    .line 62
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 63
    .line 64
    const/high16 v3, 0x41000000    # 8.0f

    .line 65
    .line 66
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    const/4 v4, -0x2

    .line 71
    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 72
    .line 73
    .line 74
    const/high16 v3, 0x41100000    # 9.0f

    .line 75
    .line 76
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    div-int/lit8 v3, v3, 0x2

    .line 81
    .line 82
    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 83
    .line 84
    const/16 v3, 0x15

    .line 85
    .line 86
    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 87
    .line 88
    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 89
    .line 90
    .line 91
    sget-object v2, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    .line 92
    .line 93
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 94
    .line 95
    .line 96
    sget v2, Ll/lbc0;->u5:I

    .line 97
    .line 98
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 99
    .line 100
    .line 101
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->h:Landroid/widget/LinearLayout;

    .line 102
    .line 103
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 104
    .line 105
    .line 106
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->k:Ljava/util/List;

    .line 107
    .line 108
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    add-int/lit8 v0, v0, 0x1

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->d:Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;

    .line 115
    .line 116
    const/high16 v1, 0x43610000    # 225.0f

    .line 117
    .line 118
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 123
    .line 124
    .line 125
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->l:Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;

    .line 126
    .line 127
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->s(Ljava/util/List;Ljava/util/List;)V

    .line 128
    .line 129
    .line 130
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->g:Lcom/p1/mobile/putong/feed/newui/topic/VBannerPager;

    .line 131
    .line 132
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->p:I

    .line 133
    .line 134
    invoke-virtual {p1, p2}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 135
    .line 136
    .line 137
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->p:I

    .line 138
    .line 139
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->Z(I)V

    .line 140
    .line 141
    .line 142
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

.method private getPageId()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/cmg;->s()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->m:I

    .line 8
    .line 9
    const/16 v0, 0xe

    .line 10
    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    const-string p0, "p_discover_dating"

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    const/16 v0, 0xf

    .line 17
    .line 18
    if-ne p0, v0, :cond_1

    .line 19
    .line 20
    const-string p0, "p_discover_discussion"

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    const-string p0, "p_follow"

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_2
    const-string p0, "p_nearby"

    .line 27
    .line 28
    return-object p0
.end method

.method private getTopicBannerTrackingParis()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->o:I

    .line 7
    .line 8
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const-string v2, "below_moment_position"

    .line 13
    .line 14
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->n:I

    .line 22
    .line 23
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v1, "topic_page_seq"

    .line 28
    .line 29
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    return-object v0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->W(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic q(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->i:I

    return p0
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;)Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->l:Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;

    return-object p0
.end method


# virtual methods
.method public final S(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/waj0;->a(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public T(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->getTopicBannerTrackingParis()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    new-array v0, v0, [Ll/pf60;

    .line 7
    .line 8
    invoke-interface {p0, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, [Ll/pf60;

    .line 13
    .line 14
    const-string v0, "e_discover_topic_list"

    .line 15
    .line 16
    invoke-static {v0, p1, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public Y(Ll/pf60;Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/CategoryTopic;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;",
            "Ljava/lang/String;",
            "II)V"
        }
    .end annotation

    .line 1
    iput p3, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->o:I

    .line 2
    .line 3
    iput p4, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->m:I

    .line 4
    .line 5
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->e:Landroid/widget/TextView;

    .line 6
    .line 7
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    iget-object p2, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast p2, Ljava/util/List;

    .line 13
    .line 14
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast p1, Ljava/util/List;

    .line 17
    .line 18
    invoke-direct {p0, p2, p1}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->X(Ljava/util/List;Ljava/util/List;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final Z(I)V
    .locals 4

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->j:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-le v0, v1, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move v2, v0

    .line 8
    :goto_0
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->j:I

    .line 9
    .line 10
    if-ge v2, v3, :cond_1

    .line 11
    .line 12
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->k:Ljava/util/List;

    .line 13
    .line 14
    if-ne v2, p1, :cond_0

    .line 15
    .line 16
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    check-cast v3, Landroid/widget/ImageView;

    .line 21
    .line 22
    invoke-virtual {v3, v1}, Landroid/widget/ImageView;->setSelected(Z)V

    .line 23
    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_0
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    check-cast v3, Landroid/widget/ImageView;

    .line 31
    .line 32
    invoke-virtual {v3, v0}, Landroid/widget/ImageView;->setSelected(Z)V

    .line 33
    .line 34
    .line 35
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->q:Z

    .line 3
    .line 4
    return-void
.end method

.method public b0(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->getTopicBannerTrackingParis()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    new-array v0, v0, [Ll/pf60;

    .line 7
    .line 8
    invoke-interface {p0, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, [Ll/pf60;

    .line 13
    .line 14
    const-string v0, "e_discover_topic_list"

    .line 15
    .line 16
    invoke-static {v0, p1, p0}, Ll/i4g0;->w(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final c0(Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->n:I

    .line 7
    .line 8
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const-string v2, "topic_page_seq"

    .line 13
    .line 14
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    const-string v1, "topic_id"

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    const-string p1, "topic_colume_name"

    .line 33
    .line 34
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->getPageId()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const/4 p1, 0x0

    .line 46
    new-array p1, p1, [Ll/pf60;

    .line 47
    .line 48
    invoke-interface {v0, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, [Ll/pf60;

    .line 53
    .line 54
    const-string p2, "e_discover_topic_item"

    .line 55
    .line 56
    invoke-static {p2, p0, p1}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->S(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;-><init>(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->l:Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->g:Lcom/p1/mobile/putong/feed/newui/topic/VBannerPager;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->g:Lcom/p1/mobile/putong/feed/newui/topic/VBannerPager;

    .line 20
    .line 21
    const/high16 v1, 0x41400000    # 12.0f

    .line 22
    .line 23
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setPageMargin(I)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->g:Lcom/p1/mobile/putong/feed/newui/topic/VBannerPager;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->l:Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->f:Landroid/widget/TextView;

    .line 38
    .line 39
    new-instance v1, Ll/uaj0;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/uaj0;-><init>(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method
