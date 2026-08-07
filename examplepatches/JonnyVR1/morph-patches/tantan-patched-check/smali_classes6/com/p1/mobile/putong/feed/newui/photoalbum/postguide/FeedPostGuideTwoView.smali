.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VRelative;

.field public d:Lv/VDraweeView;

.field public e:Lv/VText;

.field public f:Lv/VLinear;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lcom/p1/mobile/android/app/Act;

.field public j:Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;->R(Landroid/content/Context;)V

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
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;->R(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;->R(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;->S(Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method private R(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;->Q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;->e:Lv/VText;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;->g:Lv/VText;

    .line 20
    .line 21
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 22
    .line 23
    .line 24
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;->i:Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;->i:Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    invoke-static {p0, p3}, Ll/kuh;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x2

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
    invoke-static {p0, p1, p2}, Ll/tuh;->b(Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public T(Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;Ljava/lang/String;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;->j:Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;->picture:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;->d:Lv/VDraweeView;

    .line 14
    .line 15
    sget v2, Ll/lbc0;->H3:I

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;->d:Lv/VDraweeView;

    .line 24
    .line 25
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;->picture:Ljava/lang/String;

    .line 26
    .line 27
    sget v3, Ll/qa00;->E:I

    .line 28
    .line 29
    invoke-virtual {v0, v1, v2, v3, v3}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 30
    .line 31
    .line 32
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;->g:Lv/VText;

    .line 33
    .line 34
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;->title:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;->h:Lv/VText;

    .line 40
    .line 41
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;->subtitle:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;->e:Lv/VText;

    .line 47
    .line 48
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;->buttonText:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    new-instance v0, Ll/suh;

    .line 54
    .line 55
    invoke-direct {v0, p0, p1, p2}, Ll/suh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideTwoView;Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method
