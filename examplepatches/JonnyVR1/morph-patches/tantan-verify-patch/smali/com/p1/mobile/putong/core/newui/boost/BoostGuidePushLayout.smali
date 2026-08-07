.class public Lcom/p1/mobile/putong/core/newui/boost/BoostGuidePushLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Lcom/tantan/library/svga/SVGAnimationView;

.field public c:Landroid/widget/TextView;

.field public d:Landroid/view/View;


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

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p1, "button_type"

    .line 2
    .line 3
    const-string v0, "open"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    filled-new-array {p1}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, "e_boost_pop"

    .line 14
    .line 15
    const-string v1, "p_suggest_users_home_view"

    .line 16
    .line 17
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/q83;->d()Ll/q83;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const/4 v0, 0x0

    .line 25
    iput-boolean v0, p1, Ll/q83;->f:Z

    .line 26
    .line 27
    invoke-static {}, Ll/q83;->d()Ll/q83;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Ll/q83;->b()V

    .line 32
    .line 33
    .line 34
    const-string p1, "p_home,accelerate_banner"

    .line 35
    .line 36
    invoke-static {p0, v0, p1}, Ll/y9;->c(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static synthetic b(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p0, "button_type"

    .line 2
    .line 3
    const-string v0, "close"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    filled-new-array {p0}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "e_boost_pop"

    .line 14
    .line 15
    const-string v1, "p_suggest_users_home_view"

    .line 16
    .line 17
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/q83;->d()Ll/q83;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const/4 v0, 0x0

    .line 25
    iput-boolean v0, p0, Ll/q83;->b:Z

    .line 26
    .line 27
    invoke-static {}, Ll/q83;->d()Ll/q83;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/q83;->b()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static synthetic c(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p0, "button_type"

    .line 2
    .line 3
    const-string v0, "close"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    filled-new-array {p0}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "e_boost_pop"

    .line 14
    .line 15
    const-string v1, "p_suggest_users_home_view"

    .line 16
    .line 17
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/q83;->d()Ll/q83;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const/4 v0, 0x0

    .line 25
    iput-boolean v0, p0, Ll/q83;->f:Z

    .line 26
    .line 27
    invoke-static {}, Ll/q83;->d()Ll/q83;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/q83;->b()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p1, "button_type"

    .line 2
    .line 3
    const-string v0, "open"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    filled-new-array {p1}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, "e_boost_pop"

    .line 14
    .line 15
    const-string v1, "p_suggest_users_home_view"

    .line 16
    .line 17
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/q83;->d()Ll/q83;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const/4 v0, 0x0

    .line 25
    iput-boolean v0, p1, Ll/q83;->b:Z

    .line 26
    .line 27
    invoke-static {}, Ll/q83;->d()Ll/q83;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Ll/q83;->b()V

    .line 32
    .line 33
    .line 34
    const-string p1, "p_suggest_users_home_view,e_boost_pop,click"

    .line 35
    .line 36
    invoke-static {p0, v0, p1}, Ll/v83;->f(Landroid/content/Context;ZLjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method


# virtual methods
.method public e(Lcom/p1/mobile/android/app/Act;)V
    .locals 8

    .line 1
    invoke-static {}, Ll/ric0;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/boost/BoostGuidePushLayout;->c:Landroid/widget/TextView;

    .line 6
    .line 7
    const-string v2, "p_suggest_users_home_view"

    .line 8
    .line 9
    const-string v3, "e_boost_pop"

    .line 10
    .line 11
    const/4 v4, 0x1

    .line 12
    const-string v5, "https://auto.tancdn.com/v1/raw/41db580d-31c8-4180-8063-c656e986409212.svga"

    .line 13
    .line 14
    const-string v6, "\u4f7f\u7528"

    .line 15
    .line 16
    const-string v7, "\u83b7\u53d6"

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-static {}, Ll/joa;->S3()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    move-object v6, v7

    .line 27
    :cond_0
    invoke-static {v1, v6}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0, v5}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0, v4}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/boost/BoostGuidePushLayout;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v3, v2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/boost/BoostGuidePushLayout;->c:Landroid/widget/TextView;

    .line 55
    .line 56
    new-instance v1, Ll/r83;

    .line 57
    .line 58
    invoke-direct {v1, p1}, Ll/r83;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/boost/BoostGuidePushLayout;->d:Landroid/view/View;

    .line 65
    .line 66
    new-instance p1, Ll/s83;

    .line 67
    .line 68
    invoke-direct {p1}, Ll/s83;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_1
    invoke-static {}, Ll/a5i0;->v()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_2

    .line 80
    .line 81
    move-object v6, v7

    .line 82
    :cond_2
    invoke-static {v1, v6}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v0, v5}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {v0, v4}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/boost/BoostGuidePushLayout;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 104
    .line 105
    .line 106
    invoke-static {v3, v2}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/boost/BoostGuidePushLayout;->c:Landroid/widget/TextView;

    .line 110
    .line 111
    new-instance v1, Ll/t83;

    .line 112
    .line 113
    invoke-direct {v1, p1}, Ll/t83;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 114
    .line 115
    .line 116
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 117
    .line 118
    .line 119
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/boost/BoostGuidePushLayout;->d:Landroid/view/View;

    .line 120
    .line 121
    new-instance p1, Ll/u83;

    .line 122
    .line 123
    invoke-direct {p1}, Ll/u83;-><init>()V

    .line 124
    .line 125
    .line 126
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    return-void

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/adc0;->ve:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/TextView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/boost/BoostGuidePushLayout;->a:Landroid/widget/TextView;

    .line 13
    .line 14
    sget v0, Ll/adc0;->r0:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/tantan/library/svga/SVGAnimationView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/boost/BoostGuidePushLayout;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 23
    .line 24
    sget v0, Ll/adc0;->f9:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Landroid/widget/TextView;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/boost/BoostGuidePushLayout;->c:Landroid/widget/TextView;

    .line 33
    .line 34
    sget v0, Ll/adc0;->A1:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/boost/BoostGuidePushLayout;->d:Landroid/view/View;

    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/boost/BoostGuidePushLayout;->a:Landroid/widget/TextView;

    .line 43
    .line 44
    const/4 v1, 0x1

    .line 45
    invoke-static {v1}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/boost/BoostGuidePushLayout;->c:Landroid/widget/TextView;

    .line 53
    .line 54
    invoke-static {v1}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method
