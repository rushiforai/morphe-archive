.class public Lcom/immomo/momomediaext/b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/momomediaext/b$c;
    }
.end annotation


# instance fields
.field private a:I

.field private b:I

.field private c:Ljava/util/Timer;

.field private d:I

.field private e:Ljava/lang/String;

.field private f:Landroid/graphics/Bitmap;

.field private g:Lcom/immomo/momomediaext/b$c;

.field private h:Lcom/momo/mcamera/mask/Sticker;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/immomo/momomediaext/b;->a:I

    .line 6
    .line 7
    iput v0, p0, Lcom/immomo/momomediaext/b;->b:I

    .line 8
    .line 9
    iput v0, p0, Lcom/immomo/momomediaext/b;->d:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/immomo/momomediaext/b;->f:Landroid/graphics/Bitmap;

    .line 13
    .line 14
    iput-object p1, p0, Lcom/immomo/momomediaext/b;->e:Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic a(Lcom/immomo/momomediaext/b;)Lcom/momo/mcamera/mask/Sticker;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/b;->h:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/immomo/momomediaext/b;)Lcom/immomo/momomediaext/b$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/b;->g:Lcom/immomo/momomediaext/b$c;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Lcom/immomo/momomediaext/b;)Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/momomediaext/b;->f:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method

.method private d(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    new-instance p0, Landroid/graphics/BitmapFactory$Options;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 8
    .line 9
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 10
    .line 11
    iput-object v0, p0, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 12
    .line 13
    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method


# virtual methods
.method public e()Z
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/b;->e:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const-string v2, "WaterMarkManager"

    .line 9
    .line 10
    if-gtz v0, :cond_0

    .line 11
    .line 12
    const-string p0, "initSticker: water image path is empty"

    .line 13
    .line 14
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    return v1

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/immomo/momomediaext/b;->e:Ljava/lang/String;

    .line 19
    .line 20
    invoke-direct {p0, v0}, Lcom/immomo/momomediaext/b;->d(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lcom/immomo/momomediaext/b;->f:Landroid/graphics/Bitmap;

    .line 25
    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    const-string p0, "initSticker: water image is null"

    .line 29
    .line 30
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    return v1

    .line 34
    :cond_1
    new-instance v0, Lcom/momo/mcamera/mask/Sticker;

    .line 35
    .line 36
    invoke-direct {v0}, Lcom/momo/mcamera/mask/Sticker;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Lcom/immomo/momomediaext/b;->h:Lcom/momo/mcamera/mask/Sticker;

    .line 40
    .line 41
    const-wide/16 v1, 0x1b58

    .line 42
    .line 43
    invoke-virtual {v0, v1, v2}, Lcom/momo/mcamera/mask/Sticker;->setDuration(J)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/immomo/momomediaext/b;->h:Lcom/momo/mcamera/mask/Sticker;

    .line 47
    .line 48
    const/4 v1, 0x1

    .line 49
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/Sticker;->setAlwaysShow(Z)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/immomo/momomediaext/b;->h:Lcom/momo/mcamera/mask/Sticker;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/Sticker;->setShowTop(Z)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/immomo/momomediaext/b;->h:Lcom/momo/mcamera/mask/Sticker;

    .line 58
    .line 59
    const-string v2, "0"

    .line 60
    .line 61
    invoke-virtual {v0, v2}, Lcom/momo/mcamera/mask/Sticker;->setStickerType(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/immomo/momomediaext/b;->h:Lcom/momo/mcamera/mask/Sticker;

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/Sticker;->setFrameNumber(I)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/immomo/momomediaext/b;->h:Lcom/momo/mcamera/mask/Sticker;

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/Sticker;->setPreMultiAlpha(Z)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/immomo/momomediaext/b;->h:Lcom/momo/mcamera/mask/Sticker;

    .line 75
    .line 76
    new-instance v2, Lcom/immomo/momomediaext/b$b;

    .line 77
    .line 78
    invoke-direct {v2, p0}, Lcom/immomo/momomediaext/b$b;-><init>(Lcom/immomo/momomediaext/b;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v2}, Lcom/momo/mcamera/mask/Sticker;->setImageProvider(Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/immomo/momomediaext/b;->h:Lcom/momo/mcamera/mask/Sticker;

    .line 85
    .line 86
    const/4 v2, 0x5

    .line 87
    invoke-virtual {v0, v2}, Lcom/momo/mcamera/mask/Sticker;->setType(I)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lcom/immomo/momomediaext/b;->f:Landroid/graphics/Bitmap;

    .line 91
    .line 92
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    int-to-float v0, v0

    .line 97
    const/high16 v2, 0x41600000    # 14.0f

    .line 98
    .line 99
    mul-float/2addr v0, v2

    .line 100
    iget-object v3, p0, Lcom/immomo/momomediaext/b;->f:Landroid/graphics/Bitmap;

    .line 101
    .line 102
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    int-to-float v3, v3

    .line 107
    div-float/2addr v0, v3

    .line 108
    float-to-int v0, v0

    .line 109
    new-instance v3, Lcom/momo/mcamera/mask/bean/AbsolutePosition;

    .line 110
    .line 111
    invoke-direct {v3}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;-><init>()V

    .line 112
    .line 113
    .line 114
    new-instance v4, Lcom/momo/mcamera/mask/bean/ObjectRegion;

    .line 115
    .line 116
    invoke-direct {v4}, Lcom/momo/mcamera/mask/bean/ObjectRegion;-><init>()V

    .line 117
    .line 118
    .line 119
    iput v2, v4, Lcom/momo/mcamera/mask/bean/ObjectRegion;->h:F

    .line 120
    .line 121
    int-to-float v2, v0

    .line 122
    iput v2, v4, Lcom/momo/mcamera/mask/bean/ObjectRegion;->w:F

    .line 123
    .line 124
    const/high16 v5, 0x40000000    # 2.0f

    .line 125
    .line 126
    div-float/2addr v2, v5

    .line 127
    const/high16 v5, 0x43ce0000    # 412.0f

    .line 128
    .line 129
    sub-float/2addr v5, v2

    .line 130
    const/high16 v2, 0x41200000    # 10.0f

    .line 131
    .line 132
    sub-float/2addr v5, v2

    .line 133
    const/high16 v2, 0x44070000    # 540.0f

    .line 134
    .line 135
    div-float/2addr v5, v2

    .line 136
    iput v5, v4, Lcom/momo/mcamera/mask/bean/ObjectRegion;->x:F

    .line 137
    .line 138
    const v2, 0x3d733333    # 0.059375f

    .line 139
    .line 140
    .line 141
    iput v2, v4, Lcom/momo/mcamera/mask/bean/ObjectRegion;->y:F

    .line 142
    .line 143
    invoke-virtual {v3, v4}, Lcom/momo/mcamera/mask/bean/AbsolutePosition;->setCenter(Lcom/momo/mcamera/mask/bean/ObjectRegion;)V

    .line 144
    .line 145
    .line 146
    iget-object v2, p0, Lcom/immomo/momomediaext/b;->h:Lcom/momo/mcamera/mask/Sticker;

    .line 147
    .line 148
    invoke-virtual {v2, v3}, Lcom/momo/mcamera/mask/Sticker;->setAbsolutePos(Lcom/momo/mcamera/mask/bean/AbsolutePosition;)V

    .line 149
    .line 150
    .line 151
    iget-object v2, p0, Lcom/immomo/momomediaext/b;->h:Lcom/momo/mcamera/mask/Sticker;

    .line 152
    .line 153
    invoke-virtual {v2, v0}, Lcom/momo/mcamera/mask/Sticker;->setImageWidth(I)V

    .line 154
    .line 155
    .line 156
    iget-object p0, p0, Lcom/immomo/momomediaext/b;->h:Lcom/momo/mcamera/mask/Sticker;

    .line 157
    .line 158
    const/16 v0, 0xe

    .line 159
    .line 160
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/mask/Sticker;->setImageHeight(I)V

    .line 161
    .line 162
    .line 163
    return v1
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/b;->c:Ljava/util/Timer;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lcom/immomo/momomediaext/b;->h:Lcom/momo/mcamera/mask/Sticker;

    .line 8
    .line 9
    return-void
.end method

.method public g(ILcom/immomo/momomediaext/b$c;)V
    .locals 6

    .line 1
    iput p1, p0, Lcom/immomo/momomediaext/b;->d:I

    .line 2
    .line 3
    iput-object p2, p0, Lcom/immomo/momomediaext/b;->g:Lcom/immomo/momomediaext/b$c;

    .line 4
    .line 5
    new-instance v0, Ljava/util/Timer;

    .line 6
    .line 7
    const-string p2, "momolivemedia-WatermarkTimerManager"

    .line 8
    .line 9
    invoke-direct {v0, p2}, Ljava/util/Timer;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/immomo/momomediaext/b;->c:Ljava/util/Timer;

    .line 13
    .line 14
    new-instance v1, Lcom/immomo/momomediaext/b$a;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Lcom/immomo/momomediaext/b$a;-><init>(Lcom/immomo/momomediaext/b;)V

    .line 17
    .line 18
    .line 19
    const-wide/16 v2, 0x0

    .line 20
    .line 21
    int-to-long v4, p1

    .line 22
    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
