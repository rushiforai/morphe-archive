.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VRelative;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VImage;

.field public g:Lcom/p1/mobile/android/app/Act;

.field public h:Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;

.field public i:Landroid/animation/Animator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;->T(Landroid/content/Context;)V

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
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;->T(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;->T(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;->X()V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;->V(Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic R(Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;->W()V

    return-void
.end method

.method private T(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;->S(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;->d:Lv/VText;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/4 v1, 0x1

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;->e:Lv/VText;

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-virtual {v0, v2, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 28
    .line 29
    .line 30
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;->g:Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public S(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/puh;->b(Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic V(Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;Ljava/lang/String;Landroid/view/View;)V
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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;->g:Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    invoke-static {p0, p3}, Ll/kuh;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    invoke-static {p0, p1, p2}, Ll/kuh;->a(ILcom/p1/mobile/putong/feed/data/MyTabPostGuide;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic W()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;->f:Lv/VImage;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic X()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;->f:Lv/VImage;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;->i:Landroid/animation/Animator;

    .line 10
    .line 11
    return-void
.end method

.method public Y(Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;Ljava/lang/String;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;->h:Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;->e:Lv/VText;

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;->title:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ll/ouh;

    .line 11
    .line 12
    invoke-direct {v0, p0, p1, p2}, Ll/ouh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public Z()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;->i:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;->i:Landroid/animation/Animator;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;->f:Lv/VImage;

    .line 15
    .line 16
    new-instance v7, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 17
    .line 18
    invoke-direct {v7}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Ll/bnl0;->y0()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/high16 v2, 0x42980000    # 76.0f

    .line 26
    .line 27
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    sub-int/2addr v0, v2

    .line 32
    const/high16 v2, 0x42380000    # 46.0f

    .line 33
    .line 34
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    sub-int/2addr v0, v2

    .line 39
    int-to-float v0, v0

    .line 40
    const/4 v2, 0x2

    .line 41
    new-array v8, v2, [F

    .line 42
    .line 43
    const/4 v2, 0x0

    .line 44
    const/4 v3, 0x0

    .line 45
    aput v2, v8, v3

    .line 46
    .line 47
    const/4 v2, 0x1

    .line 48
    aput v0, v8, v2

    .line 49
    .line 50
    const-string v2, "translationX"

    .line 51
    .line 52
    const-wide/16 v3, 0xfa

    .line 53
    .line 54
    const-wide/16 v5, 0x5dc

    .line 55
    .line 56
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;->i:Landroid/animation/Animator;

    .line 61
    .line 62
    new-instance v1, Ll/muh;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/muh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v0, v1}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;->i:Landroid/animation/Animator;

    .line 71
    .line 72
    new-instance v1, Ll/nuh;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Ll/nuh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;)V

    .line 75
    .line 76
    .line 77
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/postguide/FeedPostGuideOneView;->i:Landroid/animation/Animator;

    .line 81
    .line 82
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 83
    .line 84
    .line 85
    return-void
.end method
