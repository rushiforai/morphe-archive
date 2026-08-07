.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/ai/FeedAiStoryHeadView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/RelativeLayout;

.field public b:Lv/VImage;

.field public c:Lv/VLinear;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;

.field public f:Lv/VImage;

.field public g:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/ai/FeedAiStoryHeadView;->c(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/ai/FeedAiStoryHeadView;->c(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/ai/FeedAiStoryHeadView;->c(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/photoalbum/ai/FeedAiStoryHeadView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/ai/FeedAiStoryHeadView;->f(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/photoalbum/ai/FeedAiStoryHeadView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/ai/FeedAiStoryHeadView;->e()V

    return-void
.end method


# virtual methods
.method public final c(Landroid/content/Context;)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "-10021"

    .line 6
    .line 7
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Lk(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/16 p1, 0x8

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const-string v0, "e_activity_ai_story"

    .line 20
    .line 21
    const-string v1, "p_discover_activity1"

    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/high16 v0, 0x41200000    # 10.0f

    .line 27
    .line 28
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-virtual {p0, v1, v2, v3, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 45
    .line 46
    .line 47
    move-object v0, p1

    .line 48
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/ai/FeedAiStoryHeadView;->g:Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    sget v0, Ll/tec0;->x:I

    .line 57
    .line 58
    invoke-virtual {p1, v0, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/ai/FeedAiStoryHeadView;->d()V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/ai/FeedAiStoryHeadView;->a:Landroid/widget/RelativeLayout;

    .line 65
    .line 66
    new-instance v0, Ll/jng;

    .line 67
    .line 68
    invoke-direct {v0, p0}, Ll/jng;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/ai/FeedAiStoryHeadView;)V

    .line 69
    .line 70
    .line 71
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final d()V
    .locals 1

    .line 1
    sget v0, Ll/hdc0;->B:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/RelativeLayout;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/ai/FeedAiStoryHeadView;->a:Landroid/widget/RelativeLayout;

    .line 10
    .line 11
    sget v0, Ll/hdc0;->u1:I

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lv/VImage;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/ai/FeedAiStoryHeadView;->b:Lv/VImage;

    .line 20
    .line 21
    sget v0, Ll/hdc0;->u0:I

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lv/VLinear;

    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/ai/FeedAiStoryHeadView;->c:Lv/VLinear;

    .line 30
    .line 31
    sget v0, Ll/hdc0;->t1:I

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Landroid/widget/TextView;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/ai/FeedAiStoryHeadView;->d:Landroid/widget/TextView;

    .line 40
    .line 41
    sget v0, Ll/hdc0;->s1:I

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Landroid/widget/TextView;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/ai/FeedAiStoryHeadView;->e:Landroid/widget/TextView;

    .line 50
    .line 51
    sget v0, Ll/hdc0;->y1:I

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Lv/VImage;

    .line 58
    .line 59
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/ai/FeedAiStoryHeadView;->f:Lv/VImage;

    .line 60
    .line 61
    return-void
.end method

.method public final synthetic e()V
    .locals 1

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic f(Landroid/view/View;)V
    .locals 3

    .line 1
    const-string p1, "e_activity_ai_story"

    .line 2
    .line 3
    const-string v0, "p_discover_activity1"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/ai/FeedAiStoryHeadView;->g:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    new-instance v0, Ll/kng;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/kng;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/ai/FeedAiStoryHeadView;)V

    .line 13
    .line 14
    .line 15
    const-wide/16 v1, 0x3e8

    .line 16
    .line 17
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/ai/FeedAiStoryHeadView;->g:Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    const-string p1, "tantan://ai_story?from=moment_feed_top"

    .line 23
    .line 24
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-static {p0, p1}, Ll/ryh;->b(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
