.class public Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/eam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView$d;
    }
.end annotation


# instance fields
.field public final a:Landroid/widget/ImageButton;

.field public final b:Landroid/widget/ImageButton;

.field public final c:Lv/VProgressBar;

.field public d:Z

.field public e:Lv/VTexturePlayer;

.field public f:Lv/VDraweeView;

.field public final g:Landroid/widget/ImageButton;

.field public final h:Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView$d;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 140
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 139
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 5
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->d:Z

    .line 6
    .line 7
    new-instance p2, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView$c;

    .line 8
    .line 9
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView$c;-><init>(Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;)V

    .line 10
    .line 11
    .line 12
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->h:Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView$d;

    .line 13
    .line 14
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    sget v0, Ll/nec0;->x:I

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-virtual {p3, v0, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p3

    .line 25
    sget v0, Ll/cdc0;->X:I

    .line 26
    .line 27
    invoke-virtual {p3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Landroid/widget/FrameLayout;

    .line 32
    .line 33
    sget v2, Ll/cdc0;->F:I

    .line 34
    .line 35
    invoke-virtual {p3, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Landroid/widget/ImageButton;

    .line 40
    .line 41
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->a:Landroid/widget/ImageButton;

    .line 42
    .line 43
    sget v3, Ll/cdc0;->V:I

    .line 44
    .line 45
    invoke-virtual {p3, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    check-cast v3, Lv/VDraweeView;

    .line 50
    .line 51
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->f:Lv/VDraweeView;

    .line 52
    .line 53
    sget v3, Ll/cdc0;->E:I

    .line 54
    .line 55
    invoke-virtual {p3, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    check-cast v3, Landroid/widget/ImageButton;

    .line 60
    .line 61
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->b:Landroid/widget/ImageButton;

    .line 62
    .line 63
    sget v4, Ll/cdc0;->h:I

    .line 64
    .line 65
    invoke-virtual {p3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    check-cast v4, Landroid/widget/ImageButton;

    .line 70
    .line 71
    iput-object v4, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->g:Landroid/widget/ImageButton;

    .line 72
    .line 73
    sget v4, Ll/cdc0;->I:I

    .line 74
    .line 75
    invoke-virtual {p3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object p3

    .line 79
    check-cast p3, Lv/VProgressBar;

    .line 80
    .line 81
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->c:Lv/VProgressBar;

    .line 82
    .line 83
    new-instance p3, Lv/VTexturePlayer;

    .line 84
    .line 85
    invoke-direct {p3, p1, p2}, Lv/VTexturePlayer;-><init>(Landroid/content/Context;Lv/VTexturePlayer$b;)V

    .line 86
    .line 87
    .line 88
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->e:Lv/VTexturePlayer;

    .line 89
    .line 90
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->generateDefaultLayoutParams()Landroid/widget/FrameLayout$LayoutParams;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {v0, p3, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->e:Lv/VTexturePlayer;

    .line 98
    .line 99
    invoke-virtual {p1, v1}, Lv/VTexturePlayer;->setIfUseTTDynamicCache(Z)V

    .line 100
    .line 101
    .line 102
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->e:Lv/VTexturePlayer;

    .line 103
    .line 104
    invoke-virtual {p1, v1}, Lv/VTexturePlayer;->k(Z)V

    .line 105
    .line 106
    .line 107
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->e:Lv/VTexturePlayer;

    .line 108
    .line 109
    new-instance p2, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView$a;

    .line 110
    .line 111
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView$a;-><init>(Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p1, p2}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->e:Lv/VTexturePlayer;

    .line 118
    .line 119
    invoke-virtual {p1, v1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 120
    .line 121
    .line 122
    new-instance p1, Ll/aa0;

    .line 123
    .line 124
    invoke-direct {p1, p0}, Ll/aa0;-><init>(Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 128
    .line 129
    .line 130
    new-instance p1, Ll/ba0;

    .line 131
    .line 132
    invoke-direct {p1, p0}, Ll/ba0;-><init>(Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v3, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 136
    .line 137
    .line 138
    return-void
.end method

.method public static synthetic a(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->i(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ljava/lang/Object;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget p0, Lcom/p1/mobile/putong/core/card/R$string;->a:I

    .line 10
    .line 11
    invoke-static {p0}, Ll/o1j0;->n(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic e(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {}, Ll/cbl0;->n()Ll/cbl0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/cbl0;->u(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->j(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;)Lv/VProgressBar;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->c:Lv/VProgressBar;

    return-object p0
.end method

.method private synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->e:Lv/VTexturePlayer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lv/VTexturePlayer;->r()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->e:Lv/VTexturePlayer;

    .line 2
    .line 3
    iget-object p1, p1, Lv/VTexturePlayer;->t:Ll/azl;

    .line 4
    .line 5
    invoke-interface {p1}, Ll/azl;->start()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->h:Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView$d;

    .line 9
    .line 10
    invoke-interface {p0}, Lv/VTexturePlayer$b;->y()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private l()V
    .locals 3

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    const-string v0, "audio"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Landroid/media/AudioManager;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x3

    .line 18
    const/4 v1, 0x1

    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-virtual {p0, v2, v0, v1}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method


# virtual methods
.method public b(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->e:Lv/VTexturePlayer;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-virtual {p0, p1}, Lv/VTexturePlayer;->i(Z)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Lv/VTexturePlayer;->r()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public k(Ljava/lang/String;F)V
    .locals 10

    .line 1
    const/4 v0, 0x1

    .line 2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->e:Lv/VTexturePlayer;

    .line 3
    .line 4
    invoke-virtual {v1, v0}, Lv/VTexturePlayer;->setIsInABGroup(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->e:Lv/VTexturePlayer;

    .line 8
    .line 9
    new-instance v1, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView$b;

    .line 10
    .line 11
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView$b;-><init>(Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lv/VTexturePlayer;->setOnBufferListener(Lv/VTexturePlayer$c;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->e:Lv/VTexturePlayer;

    .line 18
    .line 19
    new-instance v1, Ll/ca0;

    .line 20
    .line 21
    invoke-direct {v1, p1}, Ll/ca0;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v1, v2}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const/high16 v2, -0x40800000    # -1.0f

    .line 37
    .line 38
    const/4 v3, 0x0

    .line 39
    invoke-virtual {v0, v3, v1, v2}, Lv/VTexturePlayer;->w(Lv/VTexturePlayer$a;Lrx/c;F)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->e:Lv/VTexturePlayer;

    .line 43
    .line 44
    new-instance v1, Ll/da0;

    .line 45
    .line 46
    invoke-direct {v1}, Ll/da0;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lv/VTexturePlayer;->setNetErrorListener(Ll/y20;)V

    .line 50
    .line 51
    .line 52
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->e:Lv/VTexturePlayer;

    .line 53
    .line 54
    invoke-static {p1}, Ll/uqb0;->d0(Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    float-to-double v4, p2

    .line 63
    sget v8, Lcom/p1/mobile/putong/core/card/R$string;->a:I

    .line 64
    .line 65
    sget v9, Lcom/p1/mobile/putong/core/card/R$string;->e:I

    .line 66
    .line 67
    const/4 v7, 0x0

    .line 68
    move-object v6, p1

    .line 69
    invoke-virtual/range {v2 .. v9}, Lv/VTexturePlayer;->s(Landroid/net/Uri;DLjava/lang/String;ZII)V

    .line 70
    .line 71
    .line 72
    invoke-static {}, Ll/cbl0;->n()Ll/cbl0;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p1, v6}, Ll/cbl0;->q(Ljava/lang/String;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    invoke-virtual {p1, p2}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    new-instance p2, Ll/ea0;

    .line 89
    .line 90
    invoke-direct {p2}, Ll/ea0;-><init>()V

    .line 91
    .line 92
    .line 93
    new-instance v0, Ll/fa0;

    .line 94
    .line 95
    invoke-direct {v0}, Ll/fa0;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-static {p2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 103
    .line 104
    .line 105
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->l()V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public m()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->b:Landroid/widget/ImageButton;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->a:Landroid/widget/ImageButton;

    .line 8
    .line 9
    const/4 v1, 0x4

    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->c:Lv/VProgressBar;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->d:Z

    .line 20
    .line 21
    return-void
.end method

.method public n()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->b:Landroid/widget/ImageButton;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->a:Landroid/widget/ImageButton;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->c:Lv/VProgressBar;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/advertisingcard/AdvertisPlayVideoView;->d:Z

    .line 19
    .line 20
    return-void
.end method
