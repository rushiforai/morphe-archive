.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicItemView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VFrame;

.field public d:Lv/VDraweeView;

.field public e:Lv/VDraweeView;

.field public f:Lv/VImage;

.field public g:Landroid/widget/TextView;

.field public h:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/iaj0;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicItemView;->g:Landroid/widget/TextView;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isQATopicType()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicItemView;->h:Landroid/widget/TextView;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    iget v2, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->voteCounter:I

    .line 22
    .line 23
    invoke-static {v2}, Ll/q8g0;->u(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v2, "\u4eba\u53c2\u4e0e\u4e86\u6295\u7968"

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    iget v2, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->momentCounter:I

    .line 49
    .line 50
    invoke-static {v2}, Ll/q8g0;->u(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string v2, "\u6761\u52a8\u6001"

    .line 58
    .line 59
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 67
    .line 68
    .line 69
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicItemView;->d:Lv/VDraweeView;

    .line 70
    .line 71
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->headIcon:Ljava/lang/String;

    .line 72
    .line 73
    invoke-static {p0, p1}, Ll/ksg;->F0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/TopicRecommendTopicItemView;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
