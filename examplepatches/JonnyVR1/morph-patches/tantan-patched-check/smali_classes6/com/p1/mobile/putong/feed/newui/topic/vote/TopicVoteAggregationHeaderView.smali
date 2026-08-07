.class public Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationHeaderView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VFrame;

.field public f:Ll/ucj0;

.field public g:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationHeaderView;->c(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationHeaderView;->c(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationHeaderView;->c(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ndj0;->b(Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationHeaderView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationHeaderView;->f:Ll/ucj0;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/n570;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final c(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0, p0}, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationHeaderView;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    sget v0, Ll/tec0;->a1:I

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationHeaderView;->e:Lv/VFrame;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;

    .line 26
    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationHeaderView;->g:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;

    .line 28
    .line 29
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->setVoteAggregationActClickable(Z)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationHeaderView;->g:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;

    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->e:Landroid/view/View;

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    invoke-static {p1, v0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationHeaderView;->e:Lv/VFrame;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationHeaderView;->g:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;

    .line 47
    .line 48
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public d(Ll/ucj0;Lcom/p1/mobile/putong/feed/data/TopicMoment;ILjava/lang/String;)V
    .locals 2

    .line 1
    if-eqz p2, :cond_2

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationHeaderView;->f:Ll/ucj0;

    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationHeaderView;->c:Lv/VText;

    .line 9
    .line 10
    iget-wide v0, p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->createdTime:D

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->description:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationHeaderView;->d:Lv/VText;

    .line 26
    .line 27
    if-nez p1, :cond_1

    .line 28
    .line 29
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->description:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationHeaderView;->d:Lv/VText;

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/16 p1, 0x8

    .line 42
    .line 43
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 44
    .line 45
    .line 46
    :goto_0
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationHeaderView;->b(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Lcom/p1/mobile/putong/data/User;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationHeaderView;->b:Lv/VText;

    .line 51
    .line 52
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationHeaderView;->a:Lv/VDraweeView;

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationHeaderView;->g:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;

    .line 73
    .line 74
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 79
    .line 80
    invoke-virtual {p1, p2, p3, p0, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->W0(Lcom/p1/mobile/putong/feed/data/TopicMoment;ILcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :cond_2
    :goto_1
    return-void
.end method
