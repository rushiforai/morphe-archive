.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;

.field public b:Landroid/widget/RelativeLayout;

.field public c:Lv/VImage;

.field public d:Lv/VLinear;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;

.field public g:Lv/VImage;

.field public h:Lcom/p1/mobile/putong/feed/data/PoiGuide;

.field public i:Lcom/p1/mobile/android/app/Act;

.field public j:Ll/fmj;

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/String;


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

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 7
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/ui/permission/PermissionHelper$PermissionDeniedReason;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;Ll/z80;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->i(Ll/z80;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->h()V

    return-void
.end method

.method public static synthetic d(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->j(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method private getGuideInfoValue()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->k:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->h:Lcom/p1/mobile/putong/feed/data/PoiGuide;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, v1, Lcom/p1/mobile/putong/feed/data/PoiGuide;->guide:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->k:Ljava/lang/String;

    .line 14
    .line 15
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    iget-object p0, v1, Lcom/p1/mobile/putong/feed/data/PoiGuide;->guide:Ljava/lang/String;

    .line 25
    .line 26
    return-object p0
.end method


# virtual methods
.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/mqh;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "android.permission.ACCESS_FINE_LOCATION"

    .line 6
    .line 7
    const-string v2, "android.permission.ACCESS_COARSE_LOCATION"

    .line 8
    .line 9
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/iqh;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/iqh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;)V

    .line 30
    .line 31
    .line 32
    new-instance v2, Ll/jqh;

    .line 33
    .line 34
    invoke-direct {v2}, Ll/jqh;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->m(Ll/x20;Ll/y20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->i:Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final synthetic h()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->m()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic i(Ll/z80;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_2

    .line 4
    :cond_0
    invoke-virtual {p1}, Ll/z80;->a()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Ll/z80;->f()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ll/z80;->c()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Ll/z80;->f()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->k:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_3

    .line 24
    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Ll/z80;->b()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    const-string v2, ""

    .line 39
    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    move-object v1, v2

    .line 43
    goto :goto_0

    .line 44
    :cond_1
    invoke-virtual {p1}, Ll/z80;->b()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1}, Ll/z80;->c()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_2

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    invoke-virtual {p1}, Ll/z80;->c()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    :goto_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->k:Ljava/lang/String;

    .line 74
    .line 75
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->k:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_4

    .line 82
    .line 83
    invoke-virtual {p1}, Ll/z80;->a()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->k:Ljava/lang/String;

    .line 88
    .line 89
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->f:Landroid/widget/TextView;

    .line 90
    .line 91
    if-nez p1, :cond_5

    .line 92
    .line 93
    :goto_2
    return-void

    .line 94
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->l:Ljava/lang/String;

    .line 95
    .line 96
    const/4 v0, 0x0

    .line 97
    invoke-static {p1, v0}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    const-string v0, "poiname"

    .line 102
    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->k:Ljava/lang/String;

    .line 104
    .line 105
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    filled-new-array {v0}, [Ll/pf60;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    const-string v1, "e_poi_lighten"

    .line 114
    .line 115
    invoke-static {v1, p1, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 116
    .line 117
    .line 118
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->f:Landroid/widget/TextView;

    .line 119
    .line 120
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->getGuideInfoValue()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 125
    .line 126
    .line 127
    return-void
.end method

.method public final synthetic j(Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->h:Lcom/p1/mobile/putong/feed/data/PoiGuide;

    .line 2
    .line 3
    if-eqz p2, :cond_2

    .line 4
    .line 5
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/PoiGuide;->mPoiGuidePopWindow:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 6
    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p2, 0x0

    .line 11
    invoke-static {p1, p2}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string p2, "poiname"

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->k:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {p2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    filled-new-array {p2}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    const-string v0, "e_poi_lighten"

    .line 28
    .line 29
    invoke-static {v0, p1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Ll/rkh;->d()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->m()V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->g()V

    .line 43
    .line 44
    .line 45
    :cond_2
    :goto_0
    return-void
.end method

.method public final k(DD)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->j:Ll/fmj;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->i:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-static {v0, v1}, Ll/fmj;->c(Ll/ner;Z)Ll/fmj;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->j:Ll/fmj;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->j:Ll/fmj;

    .line 15
    .line 16
    invoke-virtual {v0, p1, p2, p3, p4}, Ll/fmj;->d(DD)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance p2, Ll/kqh;

    .line 21
    .line 22
    invoke-direct {p2, p0}, Ll/kqh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;)V

    .line 23
    .line 24
    .line 25
    new-instance p0, Ll/lqh;

    .line 26
    .line 27
    invoke-direct {p0}, Ll/lqh;-><init>()V

    .line 28
    .line 29
    .line 30
    const/4 p3, 0x0

    .line 31
    invoke-static {p2, p0, p3}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public l(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/PoiGuide;Ljava/lang/String;I)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->i:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->l:Ljava/lang/String;

    .line 4
    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;

    .line 9
    .line 10
    if-nez p4, :cond_1

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    .line 13
    .line 14
    .line 15
    move-result p4

    .line 16
    sget v0, Ll/qa00;->c:I

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/view/View;->getPaddingRight()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;

    .line 25
    .line 26
    invoke-virtual {v2}, Landroid/view/View;->getPaddingBottom()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    invoke-virtual {p1, p4, v0, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    .line 35
    .line 36
    .line 37
    move-result p4

    .line 38
    const/high16 v0, 0x40e00000    # 7.0f

    .line 39
    .line 40
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;

    .line 45
    .line 46
    invoke-virtual {v1}, Landroid/view/View;->getPaddingRight()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;

    .line 51
    .line 52
    invoke-virtual {v2}, Landroid/view/View;->getPaddingBottom()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    invoke-virtual {p1, p4, v0, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 57
    .line 58
    .line 59
    :goto_0
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->h:Lcom/p1/mobile/putong/feed/data/PoiGuide;

    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->e:Landroid/widget/TextView;

    .line 62
    .line 63
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/PoiGuide;->title:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->f:Landroid/widget/TextView;

    .line 69
    .line 70
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->getGuideInfoValue()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->k:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-eqz p1, :cond_2

    .line 84
    .line 85
    sget-object p1, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 86
    .line 87
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/a;->q()Lcom/p1/mobile/putong/location/Location;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    if-eqz p2, :cond_2

    .line 96
    .line 97
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 98
    .line 99
    .line 100
    move-result-wide v0

    .line 101
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 102
    .line 103
    .line 104
    move-result-wide p1

    .line 105
    invoke-virtual {p0, v0, v1, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->k(DD)V

    .line 106
    .line 107
    .line 108
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->b:Landroid/widget/RelativeLayout;

    .line 109
    .line 110
    new-instance p2, Ll/hqh;

    .line 111
    .line 112
    invoke-direct {p2, p0, p3}, Ll/hqh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public m()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->h:Lcom/p1/mobile/putong/feed/data/PoiGuide;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/PoiGuide;->mPoiGuidePopWindow:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->type:Lcom/p1/mobile/putong/feed/data/PoiGuidePopType;

    .line 6
    .line 7
    const-string v1, "poi"

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    const/4 v2, 0x0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->i:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->h:Lcom/p1/mobile/putong/feed/data/PoiGuide;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/PoiGuide;->mPoiGuidePopWindow:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 22
    .line 23
    invoke-static {v0, p0, v2, v1}, Ll/xh80;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;ZLl/uul;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->h:Lcom/p1/mobile/putong/feed/data/PoiGuide;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/PoiGuide;->mPoiGuidePopWindow:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->type:Lcom/p1/mobile/putong/feed/data/PoiGuidePopType;

    .line 32
    .line 33
    const-string v3, "share"

    .line 34
    .line 35
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->i:Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->h:Lcom/p1/mobile/putong/feed/data/PoiGuide;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/PoiGuide;->mPoiGuidePopWindow:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 46
    .line 47
    invoke-static {v0, p0, v2, v1}, Ll/xh80;->c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;ZLl/uul;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiGuideView;->f(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
