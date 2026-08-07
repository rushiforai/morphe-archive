.class public Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# static fields
.field public static k:Ljava/lang/String; = ""


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VDraweeView;

.field public c:Lv/VFrame;

.field public d:Lv/VImage;

.field public e:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public f:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;

.field public g:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public h:I

.field public i:[Lv/VDraweeView;

.field public j:Landroid/animation/ValueAnimator;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

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
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->h:I

    .line 6
    .line 7
    const/4 p1, 0x2

    .line 8
    new-array p1, p1, [Lv/VDraweeView;

    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->i:[Lv/VDraweeView;

    .line 11
    .line 12
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

    .line 13
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->h:I

    const/4 p1, 0x2

    .line 15
    new-array p1, p1, [Lv/VDraweeView;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->i:[Lv/VDraweeView;

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

    .line 16
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->h:I

    const/4 p1, 0x2

    .line 18
    new-array p1, p1, [Lv/VDraweeView;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->i:[Lv/VDraweeView;

    return-void
.end method

.method public static synthetic a(IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;Lcom/tantan/library/svga/SVGAnimationView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->l(Lcom/tantan/library/svga/SVGAnimationView;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->n()V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->m(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;)[Lv/VDraweeView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->i:[Lv/VDraweeView;

    return-object p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;Landroid/view/View;F)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->p(Landroid/view/View;F)V

    return-void
.end method

.method public static i()V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    sput-object v0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->k:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method

.method public static k(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/vx6;->b(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profile180()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method


# virtual methods
.method public final g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/xk30;->a(Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public h()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public final j(Ljava/lang/String;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "moments_user_id"

    .line 7
    .line 8
    invoke-static {v1, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    new-array v1, v1, [Ll/sfj0$a;

    .line 20
    .line 21
    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, [Ll/sfj0$a;

    .line 26
    .line 27
    const-string v1, "e_new_match_notification"

    .line 28
    .line 29
    const-string v2, "p_messages_view"

    .line 30
    .line 31
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 32
    .line 33
    .line 34
    new-instance v0, Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .line 38
    .line 39
    const-string v1, "other_user_id"

    .line 40
    .line 41
    invoke-static {v1, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    const-string v1, "no_chat_entrance_type"

    .line 49
    .line 50
    const-string v3, "new_match"

    .line 51
    .line 52
    invoke-static {v1, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    new-array v1, v1, [Ll/sfj0$a;

    .line 64
    .line 65
    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, [Ll/sfj0$a;

    .line 70
    .line 71
    const-string v1, "e_nochat_match_entrance"

    .line 72
    .line 73
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    const/4 v1, 0x0

    .line 81
    const/16 v2, 0x1a

    .line 82
    .line 83
    invoke-static {v0, p1, v1, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l2(Landroid/content/Context;Ljava/lang/String;ZZI)Landroid/content/Intent;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 92
    .line 93
    new-instance v0, Ll/wk30;

    .line 94
    .line 95
    invoke-direct {v0}, Ll/wk30;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public final synthetic l(Lcom/tantan/library/svga/SVGAnimationView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->r(Lcom/p1/mobile/putong/data/User;Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->j(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic n()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->f:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lcom/tantan/library/svga/SVGAnimationView;)V
    .locals 3

    return-void

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->h()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    iget-object v2, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p1, v0, v1}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    new-instance v0, Ll/tk30;

    .line 20
    .line 21
    invoke-direct {v0, p0, p3}, Ll/tk30;-><init>(Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 25
    .line 26
    .line 27
    move-result-object p3

    .line 28
    invoke-virtual {p1, p3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    new-instance p1, Ll/uk30;

    .line 32
    .line 33
    invoke-direct {p1, p0, p2}, Ll/uk30;-><init>(Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 34
    .line 35
    .line 36
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public onFinishInflate()V
    .locals 6

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->g(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->i:[Lv/VDraweeView;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->a:Lv/VDraweeView;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    aput-object v1, v0, v2

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->b:Lv/VDraweeView;

    .line 15
    .line 16
    const/4 v3, 0x1

    .line 17
    aput-object v1, v0, v3

    .line 18
    .line 19
    new-instance v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 20
    .line 21
    const v1, 0xffffff

    .line 22
    .line 23
    .line 24
    const v4, -0x4d000001

    .line 25
    .line 26
    .line 27
    filled-new-array {v1, v4, v1}, [I

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const/4 v4, 0x3

    .line 32
    new-array v4, v4, [F

    .line 33
    .line 34
    fill-array-data v4, :array_0

    .line 35
    .line 36
    .line 37
    invoke-direct {v0, v1, v4}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;-><init>([I[F)V

    .line 38
    .line 39
    .line 40
    const/high16 v1, 0x41700000    # 15.0f

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->n(F)Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const/high16 v4, 0x41f00000    # 30.0f

    .line 47
    .line 48
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->p(I)Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    const-wide/16 v4, 0x4b0

    .line 57
    .line 58
    invoke-virtual {v1, v4, v5}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->l(J)Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->o(I)Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->f:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;

    .line 66
    .line 67
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->setShimmerConfig(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)V

    .line 68
    .line 69
    .line 70
    invoke-static {}, Ll/gra;->d3()Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_0

    .line 75
    .line 76
    const/high16 v0, 0x42c00000    # 96.0f

    .line 77
    .line 78
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    invoke-static {p0, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->a:Lv/VDraweeView;

    .line 86
    .line 87
    const/high16 v1, 0x41800000    # 16.0f

    .line 88
    .line 89
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    invoke-static {v0, v4}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->b:Lv/VDraweeView;

    .line 97
    .line 98
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->c:Lv/VFrame;

    .line 106
    .line 107
    const/high16 v1, 0x42580000    # 54.0f

    .line 108
    .line 109
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 114
    .line 115
    .line 116
    :cond_0
    invoke-static {}, Ll/gra;->z()Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-eqz v0, :cond_1

    .line 121
    .line 122
    sget v0, Ll/sj6;->Q:I

    .line 123
    .line 124
    sget v1, Ll/qa00;->g:I

    .line 125
    .line 126
    add-int/2addr v1, v0

    .line 127
    new-array v4, v3, [Landroid/view/View;

    .line 128
    .line 129
    aput-object p0, v4, v2

    .line 130
    .line 131
    invoke-static {v1, v4}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 132
    .line 133
    .line 134
    sget v1, Ll/qa00;->R:I

    .line 135
    .line 136
    invoke-static {p0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 137
    .line 138
    .line 139
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->a:Lv/VDraweeView;

    .line 140
    .line 141
    sget v4, Ll/qa00;->m:I

    .line 142
    .line 143
    invoke-static {v1, v4}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 144
    .line 145
    .line 146
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->b:Lv/VDraweeView;

    .line 147
    .line 148
    invoke-static {v1, v4}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 149
    .line 150
    .line 151
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->a:Lv/VDraweeView;

    .line 152
    .line 153
    new-array v4, v3, [Landroid/view/View;

    .line 154
    .line 155
    aput-object v1, v4, v2

    .line 156
    .line 157
    invoke-static {v0, v4}, Ll/ue6;->v(I[Landroid/view/View;)V

    .line 158
    .line 159
    .line 160
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->b:Lv/VDraweeView;

    .line 161
    .line 162
    new-array v3, v3, [Landroid/view/View;

    .line 163
    .line 164
    aput-object v1, v3, v2

    .line 165
    .line 166
    invoke-static {v0, v3}, Ll/ue6;->v(I[Landroid/view/View;)V

    .line 167
    .line 168
    .line 169
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->c:Lv/VFrame;

    .line 170
    .line 171
    const/high16 v1, 0x42820000    # 65.0f

    .line 172
    .line 173
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 178
    .line 179
    .line 180
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->g:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 181
    .line 182
    const/high16 v0, -0x1000000

    .line 183
    .line 184
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 185
    .line 186
    .line 187
    :cond_1
    return-void

    .line 188
    nop

    .line 189
    :array_0
    .array-data 4
        0x0
        0x3f000000    # 0.5f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final p(Landroid/view/View;F)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, p2}, Landroid/view/View;->setScaleX(F)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1, p2}, Landroid/view/View;->setScaleY(F)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final q(Lcom/tantan/library/svga/SVGAnimationView;)V
    .locals 2

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->h()Lcom/p1/mobile/putong/app/PutongAct;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "https://auto.tancdn.com/v1/raw/a551cbdf-edb0-4613-bdae-86bb8bf034e814.svga"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout$b;

    .line 21
    .line 22
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout$b;-><init>(Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const/4 v0, 0x1

    .line 30
    invoke-virtual {p0, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final r(Lcom/p1/mobile/putong/data/User;Lcom/tantan/library/svga/SVGAnimationView;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->k:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->i:[Lv/VDraweeView;

    .line 12
    .line 13
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->h:I

    .line 14
    .line 15
    aget-object v1, v1, v2

    .line 16
    .line 17
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->k(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->i:[Lv/VDraweeView;

    .line 25
    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->h:I

    .line 27
    .line 28
    aget-object v0, v0, v1

    .line 29
    .line 30
    const/high16 v1, 0x3f800000    # 1.0f

    .line 31
    .line 32
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->p(Landroid/view/View;F)V

    .line 33
    .line 34
    .line 35
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->h:I

    .line 36
    .line 37
    add-int/lit8 v0, v0, 0x1

    .line 38
    .line 39
    rem-int/lit8 v0, v0, 0x2

    .line 40
    .line 41
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->h:I

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->i:[Lv/VDraweeView;

    .line 44
    .line 45
    aget-object v0, v1, v0

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->p(Landroid/view/View;F)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->q(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 52
    .line 53
    .line 54
    iget-object p2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->t(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    sget-object p2, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->k:Ljava/lang/String;

    .line 61
    .line 62
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 63
    .line 64
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    if-eqz p2, :cond_1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    iget-object p2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->t(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->i:[Lv/VDraweeView;

    .line 79
    .line 80
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->h:I

    .line 81
    .line 82
    aget-object v0, v0, v1

    .line 83
    .line 84
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->k(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {p2, v0, v1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 89
    .line 90
    .line 91
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->h:I

    .line 92
    .line 93
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->s(I)V

    .line 94
    .line 95
    .line 96
    iget p2, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->h:I

    .line 97
    .line 98
    add-int/lit8 p2, p2, 0x1

    .line 99
    .line 100
    rem-int/lit8 p2, p2, 0x2

    .line 101
    .line 102
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->h:I

    .line 103
    .line 104
    :goto_0
    iget-object p2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 105
    .line 106
    sput-object p2, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->k:Ljava/lang/String;

    .line 107
    .line 108
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->g:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 109
    .line 110
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 111
    .line 112
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public final s(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->i:[Lv/VDraweeView;

    .line 2
    .line 3
    aget-object v0, v0, p1

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->i:[Lv/VDraweeView;

    .line 10
    .line 11
    aget-object v0, v0, p1

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->i:[Lv/VDraweeView;

    .line 17
    .line 18
    aget-object v0, v0, p1

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 21
    .line 22
    .line 23
    add-int/lit8 v0, p1, 0x1

    .line 24
    .line 25
    const/4 v1, 0x2

    .line 26
    rem-int/2addr v0, v1

    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->j:Landroid/animation/ValueAnimator;

    .line 28
    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_0

    .line 36
    .line 37
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->j:Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->cancel()V

    .line 40
    .line 41
    .line 42
    :cond_0
    new-array v1, v1, [F

    .line 43
    .line 44
    fill-array-data v1, :array_0

    .line 45
    .line 46
    .line 47
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->j:Landroid/animation/ValueAnimator;

    .line 52
    .line 53
    const-wide/16 v2, 0x172

    .line 54
    .line 55
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->j:Landroid/animation/ValueAnimator;

    .line 59
    .line 60
    new-instance v2, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout$a;

    .line 61
    .line 62
    invoke-direct {v2, p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout$a;-><init>(Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;II)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->j:Landroid/animation/ValueAnimator;

    .line 69
    .line 70
    new-instance v0, Ll/vk30;

    .line 71
    .line 72
    invoke-direct {v0, p0}, Ll/vk30;-><init>(Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;)V

    .line 73
    .line 74
    .line 75
    invoke-static {p1, v0}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->j:Landroid/animation/ValueAnimator;

    .line 79
    .line 80
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    nop

    .line 85
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final t(Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "moments_user_id"

    .line 7
    .line 8
    invoke-static {v0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    new-array v0, v0, [Ll/sfj0$a;

    .line 20
    .line 21
    invoke-interface {p0, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, [Ll/sfj0$a;

    .line 26
    .line 27
    const-string v0, "e_new_match_notification"

    .line 28
    .line 29
    const-string v1, "p_messages_view"

    .line 30
    .line 31
    invoke-static {v0, v1, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 32
    .line 33
    .line 34
    const-string p0, "new_match"

    .line 35
    .line 36
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_0

    .line 41
    .line 42
    new-instance v0, Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 45
    .line 46
    .line 47
    const-string v2, "other_user_id"

    .line 48
    .line 49
    invoke-static {v2, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    const-string p1, "no_chat_entrance_type"

    .line 57
    .line 58
    invoke-static {p1, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    new-array p0, p0, [Ll/sfj0$a;

    .line 70
    .line 71
    invoke-interface {v0, p0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    check-cast p0, [Ll/sfj0$a;

    .line 76
    .line 77
    const-string p1, "e_nochat_match_entrance"

    .line 78
    .line 79
    invoke-static {p1, v1, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 80
    .line 81
    .line 82
    :cond_0
    return-void
.end method
