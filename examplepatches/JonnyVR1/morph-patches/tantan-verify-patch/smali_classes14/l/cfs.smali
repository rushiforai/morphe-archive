.class public Ll/cfs;
.super Ll/o2n;
.source "SourceFile"


# instance fields
.field public h:Z

.field public i:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/o2n;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/cfs;->h:Z

    .line 6
    .line 7
    const-string v0, "ca-app-pub-6567608331519569/1458100059"

    .line 8
    .line 9
    iput-object v0, p0, Ll/cfs;->i:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic k(Ll/cfs;Lcom/p1/mobile/android/app/Act;Landroid/util/Pair;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cfs;->n(Lcom/p1/mobile/android/app/Act;Landroid/util/Pair;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic l(Landroid/widget/ImageView;Landroid/view/View;Ll/bkj0;)V
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


# virtual methods
.method public b()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public c(Lcom/p1/mobile/android/app/Act;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
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
    iget-boolean v0, p0, Ll/cfs;->h:Z

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0, p1, v1}, Ll/o2n;->h(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    iget-object v0, p0, Ll/cfs;->i:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p0, p1, v0}, Ll/cfs;->o(Landroid/content/Context;Ljava/lang/String;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/zes;

    .line 43
    .line 44
    invoke-direct {v1, p0, p1}, Ll/zes;-><init>(Ll/cfs;Lcom/p1/mobile/android/app/Act;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0
.end method

.method public final m(Lcom/p1/mobile/android/app/Act;Ll/md20;)Landroid/view/View;
    .locals 6

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
    sget v2, Ll/kec0;->A3:I

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
    sget v1, Ll/adc0;->i8:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Lcom/google/android/gms/ads/nativead/MediaView;

    .line 24
    .line 25
    sget v2, Ll/adc0;->Q7:I

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Landroid/widget/TextView;

    .line 32
    .line 33
    sget v3, Ll/adc0;->Yc:I

    .line 34
    .line 35
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    check-cast v3, Landroid/widget/TextView;

    .line 40
    .line 41
    sget v4, Ll/adc0;->q0:I

    .line 42
    .line 43
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    check-cast v4, Landroid/widget/ImageView;

    .line 48
    .line 49
    sget v5, Ll/adc0;->A0:I

    .line 50
    .line 51
    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    invoke-virtual {v0, v2}, Lcom/google/android/gms/ads/nativead/NativeAdView;->setHeadlineView(Landroid/view/View;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v3}, Lcom/google/android/gms/ads/nativead/NativeAdView;->setBodyView(Landroid/view/View;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/nativead/NativeAdView;->setMediaView(Lcom/google/android/gms/ads/nativead/MediaView;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getHeadlineView()Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    check-cast v1, Landroid/widget/TextView;

    .line 69
    .line 70
    invoke-virtual {p2}, Ll/md20;->d()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p2}, Ll/md20;->b()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    if-nez v1, :cond_1

    .line 82
    .line 83
    invoke-virtual {v0}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getBodyView()Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    const/4 v2, 0x0

    .line 88
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_1
    invoke-virtual {v0}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getBodyView()Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    const/4 v2, 0x1

    .line 97
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getBodyView()Landroid/view/View;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    check-cast v1, Landroid/widget/TextView;

    .line 105
    .line 106
    invoke-virtual {p2}, Ll/md20;->b()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 111
    .line 112
    .line 113
    :goto_0
    invoke-virtual {p2}, Ll/md20;->f()Ll/dsx;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-interface {v1}, Ll/dsx;->b()Landroid/graphics/drawable/Drawable;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    if-eqz v1, :cond_2

    .line 122
    .line 123
    invoke-virtual {p0, p1, v1, v4, v5}, Ll/cfs;->p(Lcom/p1/mobile/android/app/Act;Landroid/graphics/drawable/Drawable;Landroid/widget/ImageView;Landroid/view/View;)V

    .line 124
    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_2
    const-string p0, "#FFEDE5"

    .line 128
    .line 129
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    invoke-virtual {v4, p0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 134
    .line 135
    .line 136
    :goto_1
    invoke-virtual {v0, p2}, Lcom/google/android/gms/ads/nativead/NativeAdView;->setNativeAd(Ll/md20;)V

    .line 137
    .line 138
    .line 139
    return-object v0
.end method

.method public final synthetic n(Lcom/p1/mobile/android/app/Act;Landroid/util/Pair;)Landroid/view/View;
    .locals 1

    .line 1
    iget-object v0, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/o2n;->a:Ll/md20;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/o2n;->a:Ll/md20;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/md20;->a()V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p2, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast p2, Ll/md20;

    .line 25
    .line 26
    iput-object p2, p0, Ll/o2n;->a:Ll/md20;

    .line 27
    .line 28
    invoke-virtual {p0, p1, p2}, Ll/cfs;->m(Lcom/p1/mobile/android/app/Act;Ll/md20;)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_1
    const/4 p0, 0x0

    .line 34
    return-object p0
.end method

.method public final o(Landroid/content/Context;Ljava/lang/String;)Lrx/c;
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
    new-instance v0, Ll/cfs$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/cfs$a;-><init>(Ll/cfs;Landroid/content/Context;Ljava/lang/String;)V

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

.method public final p(Lcom/p1/mobile/android/app/Act;Landroid/graphics/drawable/Drawable;Landroid/widget/ImageView;Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p0, 0x1

    .line 2
    const-string v0, "#bb000000"

    .line 3
    .line 4
    const/16 v1, 0x19

    .line 5
    .line 6
    invoke-static {p2, v1, p0, v0}, Ll/u2n;->r(Landroid/graphics/drawable/Drawable;IZLjava/lang/String;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance p1, Ll/afs;

    .line 15
    .line 16
    invoke-direct {p1, p3, p4}, Ll/afs;-><init>(Landroid/widget/ImageView;Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method
