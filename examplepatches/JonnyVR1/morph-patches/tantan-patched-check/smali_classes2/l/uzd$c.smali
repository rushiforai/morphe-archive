.class Ll/uzd$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/uzd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:I

.field private final c:Ljava/lang/String;

.field private final d:Ljava/lang/String;

.field private final e:I

.field private final f:D

.field private final g:Ljava/lang/String;

.field private final h:Ljava/lang/String;

.field private final i:Ljava/lang/String;

.field private final j:Ljava/lang/String;

.field private final k:I

.field private final l:Ljava/lang/String;

.field private final m:D

.field private final n:Ljava/lang/String;

.field private o:I

.field private final p:Ljava/lang/String;

.field final synthetic q:Ll/uzd;


# direct methods
.method public constructor <init>(Ll/uzd;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/uzd$c;->q:Ll/uzd;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ll/uzd$c;->C()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Ll/uzd$c;->l:Ljava/lang/String;

    .line 11
    .line 12
    invoke-direct {p0}, Ll/uzd$c;->z()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Ll/uzd$c;->i:Ljava/lang/String;

    .line 17
    .line 18
    invoke-direct {p0}, Ll/uzd$c;->A()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Ll/uzd$c;->j:Ljava/lang/String;

    .line 23
    .line 24
    invoke-direct {p0}, Ll/uzd$c;->x()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Ll/uzd$c;->g:Ljava/lang/String;

    .line 29
    .line 30
    invoke-direct {p0}, Ll/uzd$c;->y()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iput-object v0, p0, Ll/uzd$c;->h:Ljava/lang/String;

    .line 35
    .line 36
    invoke-direct {p0}, Ll/uzd$c;->u()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iput-object v0, p0, Ll/uzd$c;->c:Ljava/lang/String;

    .line 41
    .line 42
    invoke-direct {p0}, Ll/uzd$c;->t()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    iput v0, p0, Ll/uzd$c;->b:I

    .line 47
    .line 48
    invoke-direct {p0}, Ll/uzd$c;->s()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Ll/uzd$c;->a:Ljava/lang/String;

    .line 53
    .line 54
    invoke-direct {p0}, Ll/uzd$c;->v()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iput-object v0, p0, Ll/uzd$c;->d:Ljava/lang/String;

    .line 59
    .line 60
    invoke-direct {p0}, Ll/uzd$c;->B()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iput v0, p0, Ll/uzd$c;->k:I

    .line 65
    .line 66
    invoke-direct {p0}, Ll/uzd$c;->D()Ll/uzd$d;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iget-wide v1, v0, Ll/uzd$d;->b:D

    .line 71
    .line 72
    iput-wide v1, p0, Ll/uzd$c;->m:D

    .line 73
    .line 74
    iget-wide v1, v0, Ll/uzd$d;->c:D

    .line 75
    .line 76
    iput-wide v1, p0, Ll/uzd$c;->f:D

    .line 77
    .line 78
    iget v0, v0, Ll/uzd$d;->a:I

    .line 79
    .line 80
    iput v0, p0, Ll/uzd$c;->e:I

    .line 81
    .line 82
    invoke-static {p1}, Ll/uzd;->c(Ll/uzd;)I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    iput p1, p0, Ll/uzd$c;->o:I

    .line 87
    .line 88
    invoke-direct {p0}, Ll/uzd$c;->w()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iput-object p1, p0, Ll/uzd$c;->p:Ljava/lang/String;

    .line 93
    .line 94
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 95
    .line 96
    const/16 v0, 0x1c

    .line 97
    .line 98
    if-lt p1, v0, :cond_0

    .line 99
    .line 100
    invoke-direct {p0}, Ll/uzd$c;->r()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    iput-object p1, p0, Ll/uzd$c;->n:Ljava/lang/String;

    .line 105
    .line 106
    return-void

    .line 107
    :cond_0
    const/4 p1, 0x0

    .line 108
    iput-object p1, p0, Ll/uzd$c;->n:Ljava/lang/String;

    .line 109
    .line 110
    return-void
.end method

.method private A()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method private B()I
    .locals 0

    .line 1
    const p0, 0x13948

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method private C()Ljava/lang/String;
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/uzd$c;->q:Ll/uzd;

    .line 2
    .line 3
    invoke-static {v0}, Ll/uzd;->i(Ll/uzd;)Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/uzd$c;->q:Ll/uzd;

    .line 12
    .line 13
    invoke-static {v1}, Ll/uzd;->i(Ll/uzd;)Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object p0, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    return-object p0

    .line 29
    :catch_0
    move-exception v0

    .line 30
    iget-object v1, p0, Ll/uzd$c;->q:Ll/uzd;

    .line 31
    .line 32
    invoke-static {v1}, Ll/uzd;->h(Ll/uzd;)Lcom/clevertap/android/sdk/Logger;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget-object p0, p0, Ll/uzd$c;->q:Ll/uzd;

    .line 37
    .line 38
    invoke-static {p0}, Ll/uzd;->e(Ll/uzd;)Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const-string v2, "Unable to get app version"

    .line 47
    .line 48
    invoke-virtual {v1, p0, v2, v0}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 49
    .line 50
    .line 51
    const/4 p0, 0x0

    .line 52
    return-object p0
.end method

.method private D()Ll/uzd$d;
    .locals 10
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/uzd$c;->q:Ll/uzd;

    .line 2
    .line 3
    invoke-static {v0}, Ll/uzd;->d(Ll/uzd;)Landroid/view/WindowManager;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/uzd$c;->q:Ll/uzd;

    .line 10
    .line 11
    invoke-static {v0}, Ll/uzd;->h(Ll/uzd;)Lcom/clevertap/android/sdk/Logger;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Ll/uzd$c;->q:Ll/uzd;

    .line 16
    .line 17
    invoke-static {p0}, Ll/uzd;->e(Ll/uzd;)Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v1, "WindowManager is null, returning zero dimension for width/height"

    .line 26
    .line 27
    invoke-virtual {v0, p0, v1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    new-instance v2, Ll/uzd$d;

    .line 31
    .line 32
    const-wide/16 v4, 0x0

    .line 33
    .line 34
    const-wide/16 v6, 0x0

    .line 35
    .line 36
    const/4 v3, 0x0

    .line 37
    invoke-direct/range {v2 .. v7}, Ll/uzd$d;-><init>(IDD)V

    .line 38
    .line 39
    .line 40
    return-object v2

    .line 41
    :cond_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 42
    .line 43
    const/16 v2, 0x1e

    .line 44
    .line 45
    if-lt v1, v2, :cond_1

    .line 46
    .line 47
    invoke-static {v0}, Ll/wzd;->a(Landroid/view/WindowManager;)Landroid/view/WindowMetrics;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-object v1, p0, Ll/uzd$c;->q:Ll/uzd;

    .line 52
    .line 53
    invoke-static {v1}, Ll/uzd;->i(Ll/uzd;)Landroid/content/Context;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-static {v0}, Ll/xzd;->a(Landroid/view/WindowMetrics;)Landroid/view/WindowInsets;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-static {}, Ll/xgq0;->a()I

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    invoke-static {v2, v3}, Ll/yzd;->a(Landroid/view/WindowInsets;I)Landroid/graphics/Insets;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-static {v0}, Ll/zzd;->a(Landroid/view/WindowMetrics;)Landroid/graphics/Rect;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    invoke-static {v2}, Ll/cde;->a(Landroid/graphics/Insets;)I

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    sub-int/2addr v3, v4

    .line 90
    invoke-static {v2}, Ll/bde;->a(Landroid/graphics/Insets;)I

    .line 91
    .line 92
    .line 93
    move-result v4

    .line 94
    sub-int/2addr v3, v4

    .line 95
    invoke-static {v0}, Ll/zzd;->a(Landroid/view/WindowMetrics;)Landroid/graphics/Rect;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    invoke-static {v2}, Ll/dde;->a(Landroid/graphics/Insets;)I

    .line 104
    .line 105
    .line 106
    move-result v4

    .line 107
    sub-int/2addr v0, v4

    .line 108
    invoke-static {v2}, Ll/ede;->a(Landroid/graphics/Insets;)I

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    sub-int/2addr v0, v2

    .line 113
    iget v1, v1, Landroid/content/res/Configuration;->densityDpi:I

    .line 114
    .line 115
    int-to-float v2, v1

    .line 116
    int-to-float v4, v1

    .line 117
    :goto_0
    move v8, v2

    .line 118
    move v2, v1

    .line 119
    move v1, v8

    .line 120
    goto :goto_1

    .line 121
    :cond_1
    new-instance v1, Landroid/util/DisplayMetrics;

    .line 122
    .line 123
    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    .line 124
    .line 125
    .line 126
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-virtual {v0, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 131
    .line 132
    .line 133
    iget v3, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 134
    .line 135
    iget v0, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 136
    .line 137
    iget v2, v1, Landroid/util/DisplayMetrics;->xdpi:F

    .line 138
    .line 139
    iget v4, v1, Landroid/util/DisplayMetrics;->ydpi:F

    .line 140
    .line 141
    iget v1, v1, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 142
    .line 143
    goto :goto_0

    .line 144
    :goto_1
    int-to-float v3, v3

    .line 145
    div-float/2addr v3, v1

    .line 146
    float-to-double v5, v3

    .line 147
    int-to-float v0, v0

    .line 148
    div-float/2addr v0, v4

    .line 149
    float-to-double v0, v0

    .line 150
    move-wide v3, v0

    .line 151
    new-instance v1, Ll/uzd$d;

    .line 152
    .line 153
    invoke-direct {p0, v5, v6}, Ll/uzd$c;->E(D)D

    .line 154
    .line 155
    .line 156
    move-result-wide v5

    .line 157
    invoke-direct {p0, v3, v4}, Ll/uzd$c;->E(D)D

    .line 158
    .line 159
    .line 160
    move-result-wide v3

    .line 161
    move-wide v8, v5

    .line 162
    move-wide v5, v3

    .line 163
    move-wide v3, v8

    .line 164
    invoke-direct/range {v1 .. v6}, Ll/uzd$d;-><init>(IDD)V

    .line 165
    .line 166
    .line 167
    return-object v1
.end method

.method private E(D)D
    .locals 2

    .line 1
    const-wide/high16 v0, 0x4059000000000000L    # 100.0

    .line 2
    .line 3
    mul-double/2addr p1, v0

    .line 4
    invoke-static {p1, p2}, Ljava/lang/Math;->round(D)J

    .line 5
    .line 6
    .line 7
    move-result-wide p0

    .line 8
    long-to-double p0, p0

    .line 9
    div-double/2addr p0, v0

    .line 10
    return-wide p0
.end method

.method public static synthetic a(Ll/uzd$c;)D
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/uzd$c;->f:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic b(Ll/uzd$c;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uzd$c;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Ll/uzd$c;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uzd$c;->n:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Ll/uzd$c;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uzd$c;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Ll/uzd$c;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uzd$c;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Ll/uzd$c;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uzd$c;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g(Ll/uzd$c;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/uzd$c;->k:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic h(Ll/uzd$c;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/uzd$c;->o:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic i(Ll/uzd$c;)I
    .locals 2

    .line 1
    iget v0, p0, Ll/uzd$c;->o:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    iput v1, p0, Ll/uzd$c;->o:I

    .line 6
    .line 7
    return v0
.end method

.method public static synthetic j(Ll/uzd$c;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uzd$c;->p:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic k(Ll/uzd$c;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uzd$c;->l:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic l(Ll/uzd$c;)D
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/uzd$c;->m:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic m(Ll/uzd$c;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uzd$c;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic n(Ll/uzd$c;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/uzd$c;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic o(Ll/uzd$c;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uzd$c;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic p(Ll/uzd$c;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uzd$c;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic q(Ll/uzd$c;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/uzd$c;->e:I

    .line 2
    .line 3
    return p0
.end method

.method private r()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x1c
    .end annotation

    .line 1
    iget-object p0, p0, Ll/uzd$c;->q:Ll/uzd;

    .line 2
    .line 3
    invoke-static {p0}, Ll/uzd;->i(Ll/uzd;)Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "usagestats"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Landroid/app/usage/UsageStatsManager;

    .line 14
    .line 15
    invoke-static {p0}, Ll/vzd;->a(Landroid/app/usage/UsageStatsManager;)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    const/16 v0, 0xa

    .line 20
    .line 21
    if-eq p0, v0, :cond_4

    .line 22
    .line 23
    const/16 v0, 0x14

    .line 24
    .line 25
    if-eq p0, v0, :cond_3

    .line 26
    .line 27
    const/16 v0, 0x1e

    .line 28
    .line 29
    if-eq p0, v0, :cond_2

    .line 30
    .line 31
    const/16 v0, 0x28

    .line 32
    .line 33
    if-eq p0, v0, :cond_1

    .line 34
    .line 35
    const/16 v0, 0x2d

    .line 36
    .line 37
    if-eq p0, v0, :cond_0

    .line 38
    .line 39
    const-string p0, ""

    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_0
    const-string p0, "restricted"

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_1
    const-string p0, "rare"

    .line 46
    .line 47
    return-object p0

    .line 48
    :cond_2
    const-string p0, "frequent"

    .line 49
    .line 50
    return-object p0

    .line 51
    :cond_3
    const-string p0, "working_set"

    .line 52
    .line 53
    return-object p0

    .line 54
    :cond_4
    const-string p0, "active"

    .line 55
    .line 56
    return-object p0
.end method

.method private s()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uzd$c;->q:Ll/uzd;

    .line 2
    .line 3
    invoke-static {v0}, Ll/uzd;->i(Ll/uzd;)Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "android.hardware.bluetooth_le"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const-string p0, "ble"

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    iget-object p0, p0, Ll/uzd$c;->q:Ll/uzd;

    .line 23
    .line 24
    invoke-static {p0}, Ll/uzd;->i(Ll/uzd;)Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string v0, "android.hardware.bluetooth"

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    const-string p0, "classic"

    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_1
    const-string p0, "none"

    .line 44
    .line 45
    return-object p0
.end method

.method private t()I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Ll/uzd$c;->q:Ll/uzd;

    .line 3
    .line 4
    invoke-static {v1}, Ll/uzd;->i(Ll/uzd;)Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iget-object v2, p0, Ll/uzd$c;->q:Ll/uzd;

    .line 13
    .line 14
    invoke-static {v2}, Ll/uzd;->i(Ll/uzd;)Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v1, v2, v0}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget p0, v1, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    return p0

    .line 29
    :catch_0
    move-exception v1

    .line 30
    iget-object v2, p0, Ll/uzd$c;->q:Ll/uzd;

    .line 31
    .line 32
    invoke-static {v2}, Ll/uzd;->h(Ll/uzd;)Lcom/clevertap/android/sdk/Logger;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    iget-object p0, p0, Ll/uzd$c;->q:Ll/uzd;

    .line 37
    .line 38
    invoke-static {p0}, Ll/uzd;->e(Ll/uzd;)Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const-string v3, "Unable to get app build"

    .line 47
    .line 48
    invoke-virtual {v2, p0, v3, v1}, Lcom/clevertap/android/sdk/Logger;->debug(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 49
    .line 50
    .line 51
    return v0
.end method

.method private u()Ljava/lang/String;
    .locals 1

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/uzd$c;->q:Ll/uzd;

    .line 2
    .line 3
    invoke-static {p0}, Ll/uzd;->i(Ll/uzd;)Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "phone"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Landroid/telephony/TelephonyManager;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getNetworkOperatorName()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    return-object p0

    .line 22
    :catch_0
    :cond_0
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method private v()Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    :try_start_0
    iget-object p0, p0, Ll/uzd$c;->q:Ll/uzd;

    .line 4
    .line 5
    invoke-static {p0}, Ll/uzd;->i(Ll/uzd;)Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v1, "phone"

    .line 10
    .line 11
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Landroid/telephony/TelephonyManager;

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getSimCountryIso()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    return-object p0

    .line 24
    :catchall_0
    :cond_0
    return-object v0
.end method

.method private w()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, ""

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    const-string p0, "xx"

    .line 18
    .line 19
    :cond_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    const-string v1, "XX"

    .line 34
    .line 35
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string p0, "_"

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0
.end method

.method private x()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method private y()Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/uzd$c;->x()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v1, ""

    .line 8
    .line 9
    invoke-virtual {v0, p0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private z()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "Android"

    .line 2
    .line 3
    return-object p0
.end method
