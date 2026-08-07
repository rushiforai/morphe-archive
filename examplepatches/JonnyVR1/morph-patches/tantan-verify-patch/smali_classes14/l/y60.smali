.class public Ll/y60;
.super Ll/o2n;
.source "SourceFile"


# static fields
.field public static final h:Ljava/lang/String; = "y60"

.field public static i:Ljava/lang/String; = "ca-app-pub-6567608331519569/3090384535"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o2n;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Ll/y60;Lcom/google/android/gms/ads/nativead/NativeAdView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y60;->r(Lcom/google/android/gms/ads/nativead/NativeAdView;)V

    return-void
.end method

.method public static synthetic l(Ll/y60;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y60;->q(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic m(Ll/y60;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y60;->p(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic n(Ll/y60;Landroid/widget/TextView;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/y60;->s(Landroid/widget/TextView;Landroid/widget/TextView;)V

    return-void
.end method

.method public static bridge synthetic o()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/y60;->h:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public h(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Ll/o2n;->h(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Ll/o2n;->c:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    sget v0, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 7
    .line 8
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 9
    .line 10
    .line 11
    sget-object p2, Ll/y60;->i:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0, p2}, Ll/y60;->t(Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    new-instance p2, Ll/r60;

    .line 22
    .line 23
    invoke-direct {p2, p0}, Ll/r60;-><init>(Ll/y60;)V

    .line 24
    .line 25
    .line 26
    new-instance v0, Ll/s60;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Ll/s60;-><init>(Ll/y60;)V

    .line 29
    .line 30
    .line 31
    invoke-static {p2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

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

.method public final synthetic p(Landroid/util/Pair;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o2n;->c:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_3

    .line 13
    .line 14
    iget-object v0, p0, Ll/o2n;->c:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    iget-object v0, p0, Ll/o2n;->c:Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    iget-object v0, p0, Ll/o2n;->c:Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/app/Activity;->isChangingConfigurations()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget-object v0, p0, Ll/o2n;->a:Ll/md20;

    .line 40
    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/md20;->a()V

    .line 44
    .line 45
    .line 46
    :cond_1
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast p1, Ll/md20;

    .line 49
    .line 50
    iput-object p1, p0, Ll/o2n;->a:Ll/md20;

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_2
    :goto_0
    iget-object p0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 54
    .line 55
    check-cast p0, Ll/md20;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/md20;->a()V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_3
    :goto_1
    iget-object p1, p0, Ll/o2n;->d:Landroid/view/ViewGroup;

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Ll/y60;->u(Landroid/view/ViewGroup;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final synthetic q(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/o2n;->c:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/o2n;->d:Landroid/view/ViewGroup;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/y60;->u(Landroid/view/ViewGroup;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic r(Lcom/google/android/gms/ads/nativead/NativeAdView;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/o2n;->a:Ll/md20;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/md20;->f()Ll/dsx;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ll/dsx;->c()F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-virtual {p1}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getMediaView()Lcom/google/android/gms/ads/nativead/MediaView;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    int-to-float v0, v0

    .line 20
    div-float/2addr v0, p0

    .line 21
    invoke-virtual {p1}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getMediaView()Lcom/google/android/gms/ads/nativead/MediaView;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    float-to-int p1, v0

    .line 26
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic s(Landroid/widget/TextView;Landroid/widget/TextView;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    mul-int/lit8 v1, v1, 0x2

    .line 10
    .line 11
    add-int/2addr v0, v1

    .line 12
    const/high16 v1, 0x42600000    # 56.0f

    .line 13
    .line 14
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    add-int/2addr v0, v1

    .line 19
    invoke-static {}, Ll/bnl0;->y0()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-le v0, v1, :cond_0

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/widget/TextView;->getTextSize()F

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-static {v0}, Ll/vnb;->u1(F)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/lit8 v0, v0, -0x1

    .line 34
    .line 35
    int-to-float v0, v0

    .line 36
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p1, p2}, Ll/y60;->v(Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public final t(Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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
    new-instance v0, Ll/y60$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/y60$a;-><init>(Ll/y60;Ljava/lang/String;)V

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

.method public u(Landroid/view/ViewGroup;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

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
    sget v1, Ll/kec0;->v3:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/google/android/gms/ads/nativead/NativeAdView;

    .line 17
    .line 18
    iget-object v1, p0, Ll/o2n;->a:Ll/md20;

    .line 19
    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    sget p0, Ll/adc0;->of:I

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Landroid/view/ViewStub;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    sget v1, Ll/adc0;->nf:I

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Landroid/view/ViewStub;

    .line 47
    .line 48
    invoke-virtual {v1}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 49
    .line 50
    .line 51
    sget v1, Ll/adc0;->n:I

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Lcom/google/android/gms/ads/nativead/MediaView;

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/nativead/NativeAdView;->setMediaView(Lcom/google/android/gms/ads/nativead/MediaView;)V

    .line 60
    .line 61
    .line 62
    sget v1, Ll/adc0;->e5:I

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/nativead/NativeAdView;->setHeadlineView(Landroid/view/View;)V

    .line 69
    .line 70
    .line 71
    sget v1, Ll/adc0;->g:I

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/nativead/NativeAdView;->setBodyView(Landroid/view/View;)V

    .line 78
    .line 79
    .line 80
    sget v1, Ll/adc0;->h:I

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/nativead/NativeAdView;->setCallToActionView(Landroid/view/View;)V

    .line 87
    .line 88
    .line 89
    sget v1, Ll/adc0;->O:I

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/nativead/NativeAdView;->setIconView(Landroid/view/View;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getHeadlineView()Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    check-cast v1, Landroid/widget/TextView;

    .line 103
    .line 104
    iget-object v2, p0, Ll/o2n;->a:Ll/md20;

    .line 105
    .line 106
    invoke-virtual {v2}, Ll/md20;->d()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 111
    .line 112
    .line 113
    sget v1, Ll/adc0;->e5:I

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    check-cast v1, Landroid/widget/TextView;

    .line 120
    .line 121
    sget v2, Ll/adc0;->ze:I

    .line 122
    .line 123
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    check-cast v2, Landroid/widget/TextView;

    .line 128
    .line 129
    invoke-virtual {p0, v1, v2}, Ll/y60;->v(Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 130
    .line 131
    .line 132
    iget-object v1, p0, Ll/o2n;->a:Ll/md20;

    .line 133
    .line 134
    invoke-virtual {v1}, Ll/md20;->f()Ll/dsx;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    const/4 v2, 0x1

    .line 143
    if-eqz v1, :cond_2

    .line 144
    .line 145
    invoke-virtual {v0}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getMediaView()Lcom/google/android/gms/ads/nativead/MediaView;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    iget-object v3, p0, Ll/o2n;->a:Ll/md20;

    .line 150
    .line 151
    invoke-virtual {v3}, Ll/md20;->f()Ll/dsx;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    invoke-virtual {v1, v3}, Lcom/google/android/gms/ads/nativead/MediaView;->setMediaContent(Ll/dsx;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v0}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getMediaView()Lcom/google/android/gms/ads/nativead/MediaView;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    new-instance v3, Ll/t60;

    .line 163
    .line 164
    invoke-direct {v3, p0, v0}, Ll/t60;-><init>(Ll/y60;Lcom/google/android/gms/ads/nativead/NativeAdView;)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v1, v3}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 168
    .line 169
    .line 170
    iget-object v1, p0, Ll/o2n;->a:Ll/md20;

    .line 171
    .line 172
    invoke-virtual {v1}, Ll/md20;->f()Ll/dsx;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    invoke-interface {v1}, Ll/dsx;->b()Landroid/graphics/drawable/Drawable;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    sget v3, Ll/adc0;->A6:I

    .line 181
    .line 182
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 183
    .line 184
    .line 185
    move-result-object v3

    .line 186
    check-cast v3, Landroid/widget/ImageView;

    .line 187
    .line 188
    if-eqz v1, :cond_1

    .line 189
    .line 190
    iget-object v4, p0, Ll/o2n;->c:Lcom/p1/mobile/android/app/Act;

    .line 191
    .line 192
    const/16 v5, 0x19

    .line 193
    .line 194
    invoke-static {v1, v5, v2}, Ll/u2n;->s(Landroid/graphics/drawable/Drawable;IZ)Lrx/c;

    .line 195
    .line 196
    .line 197
    move-result-object v1

    .line 198
    invoke-virtual {v4, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    new-instance v4, Ll/u60;

    .line 206
    .line 207
    invoke-direct {v4, v3}, Ll/u60;-><init>(Landroid/widget/ImageView;)V

    .line 208
    .line 209
    .line 210
    new-instance v5, Ll/v60;

    .line 211
    .line 212
    invoke-direct {v5}, Ll/v60;-><init>()V

    .line 213
    .line 214
    .line 215
    invoke-static {v4, v5}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 216
    .line 217
    .line 218
    move-result-object v4

    .line 219
    invoke-virtual {v1, v4}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 220
    .line 221
    .line 222
    goto :goto_0

    .line 223
    :cond_1
    const-string v1, "#FFEDE5"

    .line 224
    .line 225
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 226
    .line 227
    .line 228
    move-result v1

    .line 229
    invoke-virtual {v3, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 230
    .line 231
    .line 232
    :goto_0
    const v1, 0x3e99999a    # 0.3f

    .line 233
    .line 234
    .line 235
    invoke-virtual {v3, v1}, Landroid/view/View;->setAlpha(F)V

    .line 236
    .line 237
    .line 238
    :cond_2
    iget-object v1, p0, Ll/o2n;->a:Ll/md20;

    .line 239
    .line 240
    invoke-virtual {v1}, Ll/md20;->b()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v1

    .line 244
    const/4 v3, 0x0

    .line 245
    if-nez v1, :cond_3

    .line 246
    .line 247
    invoke-virtual {v0}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getBodyView()Landroid/view/View;

    .line 248
    .line 249
    .line 250
    move-result-object v1

    .line 251
    invoke-static {v1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 252
    .line 253
    .line 254
    goto :goto_1

    .line 255
    :cond_3
    invoke-virtual {v0}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getBodyView()Landroid/view/View;

    .line 256
    .line 257
    .line 258
    move-result-object v1

    .line 259
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 260
    .line 261
    .line 262
    invoke-virtual {v0}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getBodyView()Landroid/view/View;

    .line 263
    .line 264
    .line 265
    move-result-object v1

    .line 266
    check-cast v1, Landroid/widget/TextView;

    .line 267
    .line 268
    iget-object v4, p0, Ll/o2n;->a:Ll/md20;

    .line 269
    .line 270
    invoke-virtual {v4}, Ll/md20;->b()Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object v4

    .line 274
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 275
    .line 276
    .line 277
    :goto_1
    iget-object v1, p0, Ll/o2n;->a:Ll/md20;

    .line 278
    .line 279
    invoke-virtual {v1}, Ll/md20;->c()Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object v1

    .line 283
    if-nez v1, :cond_4

    .line 284
    .line 285
    invoke-virtual {v0}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getCallToActionView()Landroid/view/View;

    .line 286
    .line 287
    .line 288
    move-result-object v1

    .line 289
    invoke-static {v1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 290
    .line 291
    .line 292
    goto :goto_2

    .line 293
    :cond_4
    invoke-virtual {v0}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getCallToActionView()Landroid/view/View;

    .line 294
    .line 295
    .line 296
    move-result-object v1

    .line 297
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 298
    .line 299
    .line 300
    invoke-virtual {v0}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getCallToActionView()Landroid/view/View;

    .line 301
    .line 302
    .line 303
    move-result-object v1

    .line 304
    check-cast v1, Landroid/widget/TextView;

    .line 305
    .line 306
    iget-object v4, p0, Ll/o2n;->a:Ll/md20;

    .line 307
    .line 308
    invoke-virtual {v4}, Ll/md20;->c()Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    move-result-object v4

    .line 312
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 313
    .line 314
    .line 315
    :goto_2
    iget-object v1, p0, Ll/o2n;->a:Ll/md20;

    .line 316
    .line 317
    invoke-virtual {v1}, Ll/md20;->e()Ll/md20$b;

    .line 318
    .line 319
    .line 320
    move-result-object v1

    .line 321
    if-nez v1, :cond_5

    .line 322
    .line 323
    invoke-virtual {v0}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getIconView()Landroid/view/View;

    .line 324
    .line 325
    .line 326
    move-result-object v1

    .line 327
    invoke-static {v1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 328
    .line 329
    .line 330
    goto :goto_3

    .line 331
    :cond_5
    invoke-virtual {v0}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getIconView()Landroid/view/View;

    .line 332
    .line 333
    .line 334
    move-result-object v1

    .line 335
    check-cast v1, Landroid/widget/ImageView;

    .line 336
    .line 337
    iget-object v3, p0, Ll/o2n;->a:Ll/md20;

    .line 338
    .line 339
    invoke-virtual {v3}, Ll/md20;->e()Ll/md20$b;

    .line 340
    .line 341
    .line 342
    move-result-object v3

    .line 343
    invoke-virtual {v3}, Ll/md20$b;->a()Landroid/graphics/drawable/Drawable;

    .line 344
    .line 345
    .line 346
    move-result-object v3

    .line 347
    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 348
    .line 349
    .line 350
    invoke-virtual {v0}, Lcom/google/android/gms/ads/nativead/NativeAdView;->getIconView()Landroid/view/View;

    .line 351
    .line 352
    .line 353
    move-result-object v1

    .line 354
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 355
    .line 356
    .line 357
    :goto_3
    iget-object p0, p0, Ll/o2n;->a:Ll/md20;

    .line 358
    .line 359
    invoke-virtual {v0, p0}, Lcom/google/android/gms/ads/nativead/NativeAdView;->setNativeAd(Ll/md20;)V

    .line 360
    .line 361
    .line 362
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 363
    .line 364
    .line 365
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 366
    .line 367
    .line 368
    return-void
.end method

.method public final v(Landroid/widget/TextView;Landroid/widget/TextView;)V
    .locals 1

    .line 1
    new-instance v0, Ll/w60;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/w60;-><init>(Ll/y60;Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method
