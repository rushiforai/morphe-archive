.class public Ll/qhe0;
.super Ll/o2n;
.source "SourceFile"


# instance fields
.field public final h:Ljava/lang/String;

.field public i:Ll/kcg0;

.field public j:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/o2n;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "ca-app-pub-6567608331519569/1585731172"

    .line 5
    .line 6
    iput-object v0, p0, Ll/qhe0;->h:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/qhe0;->i:Ll/kcg0;

    .line 10
    .line 11
    return-void
.end method

.method private synthetic i(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/android/app/c;->c:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p0, Ll/o2n;->a:Ll/md20;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/o2n;->a:Ll/md20;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/md20;->a()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p1, p0, Ll/qhe0;->i:Ll/kcg0;

    .line 17
    .line 18
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    iget-object p0, p0, Ll/qhe0;->i:Ll/kcg0;

    .line 25
    .line 26
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public static synthetic k(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Ll/qhe0;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qhe0;->i(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic n(Ll/qhe0;Lcom/p1/mobile/android/app/Act;Ll/x20;Landroid/util/Pair;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/qhe0;->r(Lcom/p1/mobile/android/app/Act;Ll/x20;Landroid/util/Pair;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic o(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic p(Landroid/widget/ImageView;Landroid/view/View;Ll/bkj0;)V
    .locals 3

    .line 1
    iget-object v0, p2, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/graphics/Bitmap;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p2, Ll/bkj0;->b:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast p0, Ljava/lang/Integer;

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    iget-object p2, p2, Ll/bkj0;->c:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast p2, Ljava/lang/Integer;

    .line 19
    .line 20
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    filled-new-array {p0, p2}, [I

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0}, Ll/u2n;->i([I)Landroid/graphics/drawable/GradientDrawable;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    sget p2, Ll/qa00;->i:I

    .line 33
    .line 34
    int-to-float p2, p2

    .line 35
    const/16 v0, 0x8

    .line 36
    .line 37
    new-array v0, v0, [F

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    const/4 v2, 0x0

    .line 41
    aput v2, v0, v1

    .line 42
    .line 43
    const/4 v1, 0x1

    .line 44
    aput v2, v0, v1

    .line 45
    .line 46
    const/4 v1, 0x2

    .line 47
    aput v2, v0, v1

    .line 48
    .line 49
    const/4 v1, 0x3

    .line 50
    aput v2, v0, v1

    .line 51
    .line 52
    const/4 v1, 0x4

    .line 53
    aput p2, v0, v1

    .line 54
    .line 55
    const/4 v1, 0x5

    .line 56
    aput p2, v0, v1

    .line 57
    .line 58
    const/4 v1, 0x6

    .line 59
    aput p2, v0, v1

    .line 60
    .line 61
    const/4 v1, 0x7

    .line 62
    aput p2, v0, v1

    .line 63
    .line 64
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method private q(Lcom/p1/mobile/android/app/Act;Ll/md20;Ll/x20;)Landroid/view/View;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget v2, Ll/kec0;->y3:I

    .line 10
    .line 11
    invoke-virtual {v1, v2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/google/android/gms/ads/nativead/NativeAdView;

    .line 16
    .line 17
    sget v1, Ll/adc0;->l:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/nativead/NativeAdView;->setHeadlineView(Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    sget v1, Ll/adc0;->g:I

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/nativead/NativeAdView;->setBodyView(Landroid/view/View;)V

    .line 33
    .line 34
    .line 35
    sget v1, Ll/adc0;->n:I

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Lcom/google/android/gms/ads/nativead/MediaView;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/nativead/NativeAdView;->setMediaView(Lcom/google/android/gms/ads/nativead/MediaView;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getHeadlineView()Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Landroid/widget/TextView;

    .line 51
    .line 52
    invoke-virtual {p2}, Ll/md20;->d()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p2}, Ll/md20;->b()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    if-nez v1, :cond_1

    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getBodyView()Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    const/4 v2, 0x0

    .line 70
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    invoke-virtual {v0}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getBodyView()Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    const/4 v2, 0x1

    .line 79
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getBodyView()Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    check-cast v1, Landroid/widget/TextView;

    .line 87
    .line 88
    invoke-virtual {p2}, Ll/md20;->b()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    .line 94
    .line 95
    :goto_0
    invoke-virtual {p2}, Ll/md20;->f()Ll/dsx;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-interface {v1}, Ll/dsx;->b()Landroid/graphics/drawable/Drawable;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    sget v2, Ll/adc0;->A6:I

    .line 104
    .line 105
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    check-cast v2, Landroid/widget/ImageView;

    .line 110
    .line 111
    sget v3, Ll/adc0;->x0:I

    .line 112
    .line 113
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    sget v4, Ll/adc0;->j:I

    .line 118
    .line 119
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 120
    .line 121
    .line 122
    move-result-object v4

    .line 123
    iput-object v4, p0, Ll/qhe0;->j:Landroid/view/View;

    .line 124
    .line 125
    if-eqz v1, :cond_2

    .line 126
    .line 127
    invoke-direct {p0, p1, v1, v3, v2}, Ll/qhe0;->t(Lcom/p1/mobile/android/app/Act;Landroid/graphics/drawable/Drawable;Landroid/view/View;Landroid/widget/ImageView;)V

    .line 128
    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_2
    const-string p1, "#FFEDE5"

    .line 132
    .line 133
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    invoke-virtual {v2, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 138
    .line 139
    .line 140
    sget p1, Ll/dbc0;->Pr:I

    .line 141
    .line 142
    invoke-virtual {v3, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 143
    .line 144
    .line 145
    :goto_1
    iget-object p0, p0, Ll/qhe0;->j:Landroid/view/View;

    .line 146
    .line 147
    new-instance p1, Ll/nhe0;

    .line 148
    .line 149
    invoke-direct {p1, p3}, Ll/nhe0;-><init>(Ll/x20;)V

    .line 150
    .line 151
    .line 152
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v0, p2}, Lcom/google/android/gms/ads/nativead/NativeAdView;->setNativeAd(Ll/md20;)V

    .line 156
    .line 157
    .line 158
    return-object v0
.end method

.method private synthetic r(Lcom/p1/mobile/android/app/Act;Ll/x20;Landroid/util/Pair;)Landroid/view/View;
    .locals 1

    .line 1
    iget-object v0, p3, Landroid/util/Pair;->first:Ljava/lang/Object;

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
    iget-object p3, p3, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p3, Ll/md20;

    .line 12
    .line 13
    iput-object p3, p0, Ll/o2n;->a:Ll/md20;

    .line 14
    .line 15
    invoke-direct {p0, p1, p3, p2}, Ll/qhe0;->q(Lcom/p1/mobile/android/app/Act;Ll/md20;Ll/x20;)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method private s(Landroid/content/Context;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Landroid/util/Pair<",
            "Ll/md20;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/qhe0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/qhe0$a;-><init>(Ll/qhe0;Landroid/content/Context;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method private t(Lcom/p1/mobile/android/app/Act;Landroid/graphics/drawable/Drawable;Landroid/view/View;Landroid/widget/ImageView;)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    const-string v1, "#bb000000"

    .line 3
    .line 4
    const/16 v2, 0x19

    .line 5
    .line 6
    invoke-static {p2, v2, v0, v1}, Ll/u2n;->r(Landroid/graphics/drawable/Drawable;IZLjava/lang/String;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    new-instance p2, Ll/ohe0;

    .line 15
    .line 16
    invoke-direct {p2, p4, p3}, Ll/ohe0;-><init>(Landroid/widget/ImageView;Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    new-instance p3, Ll/v60;

    .line 20
    .line 21
    invoke-direct {p3}, Ll/v60;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {p2, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Ll/qhe0;->i:Ll/kcg0;

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;Ll/x20;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/x20;",
            ")",
            "Lrx/c<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/n70;->g()Ll/n70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/n70;->f()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-static {v1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_0
    invoke-virtual {p0, p1, v1}, Ll/qhe0;->h(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)V

    .line 18
    .line 19
    .line 20
    const-string v0, "ca-app-pub-6567608331519569/1585731172"

    .line 21
    .line 22
    invoke-direct {p0, p1, v0}, Ll/qhe0;->s(Landroid/content/Context;Ljava/lang/String;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ll/mhe0;

    .line 39
    .line 40
    invoke-direct {v1, p0, p1, p2}, Ll/mhe0;-><init>(Ll/qhe0;Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method public h(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/o2n;->h(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    new-instance p2, Ll/jhe0;

    .line 9
    .line 10
    invoke-direct {p2}, Ll/jhe0;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance p2, Ll/khe0;

    .line 18
    .line 19
    invoke-direct {p2, p0}, Ll/khe0;-><init>(Ll/qhe0;)V

    .line 20
    .line 21
    .line 22
    new-instance p0, Ll/lhe0;

    .line 23
    .line 24
    invoke-direct {p0}, Ll/lhe0;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method
