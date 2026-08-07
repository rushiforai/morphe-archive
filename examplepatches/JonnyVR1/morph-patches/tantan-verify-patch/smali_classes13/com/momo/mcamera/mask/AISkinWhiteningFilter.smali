.class public Lcom/momo/mcamera/mask/AISkinWhiteningFilter;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private mCXSkinWhiteningFilter:Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;

.field private mContext:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private mFaceLightingFilter:Lcom/momo/mcamera/mask/FaceLightingFilter;

.field private mType:Lcom/momo/mcamera/mask/VersionType$CXSkinVersion;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/momo/mcamera/mask/AISkinWhiteningFilter;->mContext:Ljava/lang/ref/WeakReference;

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public getSkinWhiteningFilter(Landroid/content/Context;Lcom/momo/mcamera/mask/VersionType$CXSkinVersion;)Ll/jt2;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/mcamera/mask/AISkinWhiteningFilter;->mContext:Ljava/lang/ref/WeakReference;

    .line 7
    .line 8
    iput-object p2, p0, Lcom/momo/mcamera/mask/AISkinWhiteningFilter;->mType:Lcom/momo/mcamera/mask/VersionType$CXSkinVersion;

    .line 9
    .line 10
    sget-object v0, Lcom/momo/mcamera/mask/VersionType$CXSkinVersion;->VersionType1:Lcom/momo/mcamera/mask/VersionType$CXSkinVersion;

    .line 11
    .line 12
    if-ne p2, v0, :cond_4

    .line 13
    .line 14
    const/4 p2, 0x0

    .line 15
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "cax_color_enhancement_curve.png"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    .line 22
    .line 23
    .line 24
    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 25
    :try_start_1
    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    .line 26
    .line 27
    .line 28
    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    :try_start_2
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 32
    .line 33
    .line 34
    goto :goto_2

    .line 35
    :catch_0
    move-exception v0

    .line 36
    goto :goto_1

    .line 37
    :catchall_0
    move-exception v1

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    :try_start_3
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catchall_1
    move-exception v0

    .line 45
    :try_start_4
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :catch_1
    move-exception v0

    .line 50
    move-object v1, p2

    .line 51
    goto :goto_1

    .line 52
    :cond_0
    :goto_0
    throw v1
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 53
    :goto_1
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 54
    .line 55
    .line 56
    :cond_1
    :goto_2
    :try_start_5
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    const-string v0, "cax_color_enhancement_lookup.png"

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    .line 63
    .line 64
    .line 65
    move-result-object p1
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    .line 66
    :try_start_6
    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    .line 67
    .line 68
    .line 69
    move-result-object p2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 70
    if-eqz p1, :cond_3

    .line 71
    .line 72
    :try_start_7
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_2

    .line 73
    .line 74
    .line 75
    goto :goto_5

    .line 76
    :catch_2
    move-exception p1

    .line 77
    goto :goto_4

    .line 78
    :catchall_2
    move-exception v0

    .line 79
    if-eqz p1, :cond_2

    .line 80
    .line 81
    :try_start_8
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 82
    .line 83
    .line 84
    goto :goto_3

    .line 85
    :catchall_3
    move-exception p1

    .line 86
    :try_start_9
    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 87
    .line 88
    .line 89
    :cond_2
    :goto_3
    throw v0
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_2

    .line 90
    :goto_4
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 91
    .line 92
    .line 93
    :cond_3
    :goto_5
    new-instance p1, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;

    .line 94
    .line 95
    invoke-direct {p1}, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;-><init>()V

    .line 96
    .line 97
    .line 98
    iput-object p1, p0, Lcom/momo/mcamera/mask/AISkinWhiteningFilter;->mCXSkinWhiteningFilter:Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;

    .line 99
    .line 100
    invoke-virtual {p1, v1, p2}, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 101
    .line 102
    .line 103
    iget-object p0, p0, Lcom/momo/mcamera/mask/AISkinWhiteningFilter;->mCXSkinWhiteningFilter:Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;

    .line 104
    .line 105
    return-object p0

    .line 106
    :cond_4
    sget-object p1, Lcom/momo/mcamera/mask/VersionType$CXSkinVersion;->VersionType2:Lcom/momo/mcamera/mask/VersionType$CXSkinVersion;

    .line 107
    .line 108
    if-ne p2, p1, :cond_5

    .line 109
    .line 110
    new-instance p1, Lcom/momo/mcamera/mask/FaceLightingFilter;

    .line 111
    .line 112
    sget-object p2, Lcom/momo/mcamera/mask/FaceLightingFilter$WhiteningVersionEnum;->_8version:Lcom/momo/mcamera/mask/FaceLightingFilter$WhiteningVersionEnum;

    .line 113
    .line 114
    invoke-direct {p1, p2}, Lcom/momo/mcamera/mask/FaceLightingFilter;-><init>(Lcom/momo/mcamera/mask/FaceLightingFilter$WhiteningVersionEnum;)V

    .line 115
    .line 116
    .line 117
    iput-object p1, p0, Lcom/momo/mcamera/mask/AISkinWhiteningFilter;->mFaceLightingFilter:Lcom/momo/mcamera/mask/FaceLightingFilter;

    .line 118
    .line 119
    goto :goto_6

    .line 120
    :cond_5
    sget-object p1, Lcom/momo/mcamera/mask/VersionType$CXSkinVersion;->VersionType3:Lcom/momo/mcamera/mask/VersionType$CXSkinVersion;

    .line 121
    .line 122
    if-ne p2, p1, :cond_6

    .line 123
    .line 124
    new-instance p1, Lcom/momo/mcamera/mask/FaceLightingFilter;

    .line 125
    .line 126
    sget-object p2, Lcom/momo/mcamera/mask/FaceLightingFilter$WhiteningVersionEnum;->originWhiten:Lcom/momo/mcamera/mask/FaceLightingFilter$WhiteningVersionEnum;

    .line 127
    .line 128
    invoke-direct {p1, p2}, Lcom/momo/mcamera/mask/FaceLightingFilter;-><init>(Lcom/momo/mcamera/mask/FaceLightingFilter$WhiteningVersionEnum;)V

    .line 129
    .line 130
    .line 131
    iput-object p1, p0, Lcom/momo/mcamera/mask/AISkinWhiteningFilter;->mFaceLightingFilter:Lcom/momo/mcamera/mask/FaceLightingFilter;

    .line 132
    .line 133
    :cond_6
    :goto_6
    iget-object p0, p0, Lcom/momo/mcamera/mask/AISkinWhiteningFilter;->mFaceLightingFilter:Lcom/momo/mcamera/mask/FaceLightingFilter;

    .line 134
    .line 135
    return-object p0
.end method

.method public setSkinLightLevel(F)V
    .locals 2

    .line 1
    invoke-static {}, Ll/mpc0;->a()Ll/mpc0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Ll/mpc0;->d(F)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/mcamera/mask/AISkinWhiteningFilter;->mType:Lcom/momo/mcamera/mask/VersionType$CXSkinVersion;

    .line 9
    .line 10
    sget-object v1, Lcom/momo/mcamera/mask/VersionType$CXSkinVersion;->VersionType1:Lcom/momo/mcamera/mask/VersionType$CXSkinVersion;

    .line 11
    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/momo/mcamera/mask/AISkinWhiteningFilter;->mCXSkinWhiteningFilter:Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/CXSkinWhiteningFilter;->setAlpha(F)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/AISkinWhiteningFilter;->mFaceLightingFilter:Lcom/momo/mcamera/mask/FaceLightingFilter;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/FaceLightingFilter;->setSkinLightingScale(F)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method
