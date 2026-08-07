.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideThreeView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VLinear;

.field public d:Lv/VText;

.field public e:Lv/VLinear;

.field public f:Lcom/p1/mobile/android/app/Act;

.field public g:Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideThreeView;->R(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideThreeView;->R(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideThreeView;->R(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideThreeView;Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideThreeView;->S(Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method private R(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideThreeView;->Q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideThreeView;->f:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    return-void
.end method

.method private synthetic S(Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p3, p1, Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;->topicId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    if-nez p3, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->new_()Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;->topicId:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v0, p3, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;->topicName:Ljava/lang/String;

    .line 18
    .line 19
    iput-object v0, p3, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p3, 0x0

    .line 23
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideThreeView;->f:Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    invoke-static {p0, p3}, Ll/kuh;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x3

    .line 29
    invoke-static {p0, p1, p2}, Ll/kuh;->a(ILcom/p1/mobile/putong/feed/data/MyTabPostGuide;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public Q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ruh;->b(Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideThreeView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public T(Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;Ljava/lang/String;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideThreeView;->g:Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideThreeView;->d:Lv/VText;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;->title:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ll/quh;

    .line 11
    .line 12
    invoke-direct {v0, p0, p1, p2}, Ll/quh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideThreeView;Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
