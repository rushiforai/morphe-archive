.class public Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:Z

.field public c:Ljava/lang/Runnable;

.field public d:Lv/VImage;

.field public e:Lv/VImage;


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
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->a:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->b:Z

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->c:Ljava/lang/Runnable;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->j()V

    .line 13
    .line 14
    .line 15
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

    .line 16
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 17
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->a:Z

    .line 18
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->b:Z

    const/4 p1, 0x0

    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->c:Ljava/lang/Runnable;

    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->j()V

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

    .line 21
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 22
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->a:Z

    .line 23
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->b:Z

    const/4 p1, 0x0

    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->c:Ljava/lang/Runnable;

    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->j()V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->k()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->l(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;)Lv/VImage;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->e:Lv/VImage;

    return-object p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;)Lv/VImage;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->d:Lv/VImage;

    return-object p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->b:Z

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->h()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->i()V

    return-void
.end method


# virtual methods
.method public final h()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->c:Ljava/lang/Runnable;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->c:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final i()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->a:Z

    .line 8
    .line 9
    new-instance v0, Ll/kof;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/kof;-><init>(Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;)V

    .line 12
    .line 13
    .line 14
    const-wide/16 v1, 0xc8

    .line 15
    .line 16
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final j()V
    .locals 6

    .line 1
    new-instance v0, Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->e:Lv/VImage;

    .line 11
    .line 12
    sget v1, Ll/dbc0;->q7:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 15
    .line 16
    .line 17
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 18
    .line 19
    const/4 v1, -0x1

    .line 20
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 21
    .line 22
    .line 23
    const/16 v1, 0x11

    .line 24
    .line 25
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->e:Lv/VImage;

    .line 28
    .line 29
    invoke-virtual {p0, v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 30
    .line 31
    .line 32
    new-instance v0, Lcom/tantan/library/svga/SVGAnimationView;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-direct {v0, v2}, Lcom/tantan/library/svga/SVGAnimationView;-><init>(Landroid/content/Context;)V

    .line 39
    .line 40
    .line 41
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 42
    .line 43
    const/high16 v3, 0x43200000    # 160.0f

    .line 44
    .line 45
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    invoke-direct {v2, v4, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 54
    .line 55
    .line 56
    iput v1, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 57
    .line 58
    sget-object v4, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    .line 59
    .line 60
    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 64
    .line 65
    .line 66
    new-instance v2, Lv/VImage;

    .line 67
    .line 68
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    invoke-direct {v2, v4}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 73
    .line 74
    .line 75
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->d:Lv/VImage;

    .line 76
    .line 77
    sget v4, Ll/dbc0;->Q:I

    .line 78
    .line 79
    invoke-virtual {v2, v4}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 80
    .line 81
    .line 82
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 83
    .line 84
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 85
    .line 86
    .line 87
    move-result v4

    .line 88
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    invoke-direct {v2, v4, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 93
    .line 94
    .line 95
    iput v1, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 96
    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->d:Lv/VImage;

    .line 98
    .line 99
    invoke-virtual {p0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-static {v1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    const-string v2, "https://auto.tancdn.com/v1/raw/16ab1413-99de-4d28-a582-e907181e063814.svga"

    .line 111
    .line 112
    invoke-virtual {v1, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    const/4 v2, 0x1

    .line 117
    invoke-virtual {v1, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    new-instance v3, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout$b;

    .line 122
    .line 123
    invoke-direct {v3, p0}, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout$b;-><init>(Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v1, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    new-instance v3, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout$a;

    .line 131
    .line 132
    invoke-direct {v3, p0}, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout$a;-><init>(Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v1, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->loadCallback(Lcom/tantan/library/svga/data/request/RequestCallback;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-virtual {v1, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-virtual {v1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 144
    .line 145
    .line 146
    new-instance v0, Ll/jof;

    .line 147
    .line 148
    invoke-direct {v0, p0}, Ll/jof;-><init>(Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;)V

    .line 149
    .line 150
    .line 151
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 152
    .line 153
    .line 154
    new-instance v0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout$c;

    .line 155
    .line 156
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout$c;-><init>(Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;)V

    .line 157
    .line 158
    .line 159
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->c:Ljava/lang/Runnable;

    .line 160
    .line 161
    const-wide/16 v1, 0x352

    .line 162
    .line 163
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 164
    .line 165
    .line 166
    return-void
.end method

.method public final synthetic k()V
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

.method public final synthetic l(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->b:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->c:Ljava/lang/Runnable;

    .line 6
    .line 7
    const-wide/16 v0, 0x226

    .line 8
    .line 9
    invoke-virtual {p0, p1, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/view/ExpandedSplashLayout;->i()V

    .line 14
    .line 15
    .line 16
    return-void
.end method
