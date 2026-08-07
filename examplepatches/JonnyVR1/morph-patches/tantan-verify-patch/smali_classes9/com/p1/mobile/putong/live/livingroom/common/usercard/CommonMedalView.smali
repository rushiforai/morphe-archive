.class public Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$c;
    }
.end annotation


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Lcom/tantan/library/svga/SVGAnimationView;

.field public f:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$c;

.field public g:I

.field public h:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x41600000    # 14.0f

    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->g:I

    .line 11
    .line 12
    const/4 p1, 0x3

    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->h:I

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->init()V

    .line 16
    .line 17
    .line 18
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

    .line 19
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 p1, 0x41600000    # 14.0f

    .line 20
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->g:I

    const/4 p1, 0x3

    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->h:I

    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->init()V

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

    .line 23
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p1, 0x41600000    # 14.0f

    .line 24
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->g:I

    const/4 p1, 0x3

    .line 25
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->h:I

    .line 26
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->init()V

    return-void
.end method

.method public static bridge synthetic h0(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;)Lv/VDraweeView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->d:Lv/VDraweeView;

    return-object p0
.end method

.method public static bridge synthetic i0(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->g:I

    return p0
.end method

.method private init()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/yec0;->j0:I

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    sget v0, Ll/mdc0;->f6:I

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lv/VDraweeView;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->d:Lv/VDraweeView;

    .line 24
    .line 25
    sget v0, Ll/mdc0;->l1:I

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lcom/tantan/library/svga/SVGAnimationView;

    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->d:Lv/VDraweeView;

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 42
    .line 43
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    return-void
.end method


# virtual methods
.method public j0()V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->f:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$c;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$c;->b()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x1

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 12
    .line 13
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->d:Lv/VDraweeView;

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->f:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$c;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$c;->b:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->l0(Lcom/tantan/library/svga/SVGAnimationView;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->f:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$c;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$c;->c()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->d:Lv/VDraweeView;

    .line 44
    .line 45
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 49
    .line 50
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->d:Lv/VDraweeView;

    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->f:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$c;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$c;->c()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    iget v6, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->g:I

    .line 62
    .line 63
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->h:I

    .line 64
    .line 65
    mul-int v5, v6, v0

    .line 66
    .line 67
    new-instance v10, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$a;

    .line 68
    .line 69
    invoke-direct {v10, p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;)V

    .line 70
    .line 71
    .line 72
    const-string v2, "context_livingAct"

    .line 73
    .line 74
    const/4 v7, 0x0

    .line 75
    const/4 v8, 0x0

    .line 76
    const/4 v9, 0x0

    .line 77
    invoke-static/range {v2 .. v10}, Ll/izs;->v(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZZZLl/fn2;)V

    .line 78
    .line 79
    .line 80
    :cond_1
    return-void
.end method

.method public k0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->f:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$c;->a()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->d:Lv/VDraweeView;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    invoke-virtual {p0, v0}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final l0(Lcom/tantan/library/svga/SVGAnimationView;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$b;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGAnimationView;->setRequestCallback(Lcom/tantan/library/svga/data/request/RequestCallback;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/4 p2, -0x1

    .line 22
    invoke-virtual {p0, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/4 p2, 0x1

    .line 27
    invoke-virtual {p0, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public m0(ILjava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->g:I

    .line 4
    .line 5
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->f:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$c;

    .line 6
    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$c;->a:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->f:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$c;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$c;->b:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p1, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->f:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$c;

    .line 29
    .line 30
    if-nez p1, :cond_2

    .line 31
    .line 32
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$c;

    .line 33
    .line 34
    invoke-direct {p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->f:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$c;

    .line 38
    .line 39
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->f:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$c;

    .line 40
    .line 41
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    const-string v1, ""

    .line 46
    .line 47
    if-eqz v0, :cond_3

    .line 48
    .line 49
    move-object p2, v1

    .line 50
    :cond_3
    iput-object p2, p1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$c;->a:Ljava/lang/String;

    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->f:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$c;

    .line 53
    .line 54
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    if-eqz p2, :cond_4

    .line 59
    .line 60
    move-object p3, v1

    .line 61
    :cond_4
    iput-object p3, p1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView$c;->b:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->j0()V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public setImageResource(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;->d:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
