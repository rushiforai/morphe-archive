.class public Ll/fsb0;
.super Ll/am2;
.source "SourceFile"


# static fields
.field public static g:Z


# instance fields
.field public final f:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Ll/fsb0;->S()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sput-boolean v0, Ll/fsb0;->g:Z

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Ll/rg50$b;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/fsb0;->a0(Ll/rg50$b;)Ll/rg50;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/fsb0$a;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/fsb0$a;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, p1, v0}, Ll/am2;-><init>(Ll/rg50;Ll/cy3;)V

    .line 11
    .line 12
    .line 13
    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    .line 14
    .line 15
    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Ll/fsb0;->f:Ljava/util/concurrent/ConcurrentHashMap;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic A(Landroid/view/View;Landroid/graphics/Bitmap;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-direct {v0, v1, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    :goto_0
    return-void
.end method

.method public static bridge synthetic B(Ll/fsb0;Lv/VDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/io/InputStream;II)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/fsb0;->h0(Lv/VDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/io/InputStream;II)V

    return-void
.end method

.method public static bridge synthetic C()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/fsb0;->g:Z

    return v0
.end method

.method public static S()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "Putong_ImageLoader_init"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 18
    .line 19
    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const-string v0, "enableReportError"

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    return v0

    .line 29
    :catch_0
    move-exception v0

    .line 30
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    const/4 v0, 0x0

    .line 34
    return v0
.end method

.method public static T()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "Putong_ImageLoader_init"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 18
    .line 19
    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const-string v0, "enableTrustAllCertificate"

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    return v0

    .line 29
    :catch_0
    move-exception v0

    .line 30
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    const/4 v0, 0x0

    .line 34
    return v0
.end method

.method public static W(Ljava/lang/Throwable;)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    if-eqz p0, :cond_1

    .line 4
    .line 5
    const/16 v2, 0xa

    .line 6
    .line 7
    if-gt v1, v2, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const-class v3, Ljava/io/IOException;

    .line 14
    .line 15
    if-ne v2, v3, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-nez v3, :cond_0

    .line 26
    .line 27
    const-string v3, "Canceled"

    .line 28
    .line 29
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_0

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    goto :goto_0

    .line 44
    :cond_1
    return v0
.end method

.method public static a0(Ll/rg50$b;)Ll/rg50;
    .locals 5

    .line 1
    invoke-static {}, Ll/fsb0;->T()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    :try_start_0
    const-string v0, "SSL"

    .line 8
    .line 9
    invoke-static {v0}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/fsb0$b;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/fsb0$b;-><init>()V

    .line 16
    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    new-array v2, v2, [Ljavax/net/ssl/TrustManager;

    .line 20
    .line 21
    const/4 v3, 0x0

    .line 22
    aput-object v1, v2, v3

    .line 23
    .line 24
    new-instance v3, Ljava/security/SecureRandom;

    .line 25
    .line 26
    invoke-direct {v3}, Ljava/security/SecureRandom;-><init>()V

    .line 27
    .line 28
    .line 29
    const/4 v4, 0x0

    .line 30
    invoke-virtual {v0, v4, v2, v3}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0, v0, v1}, Ll/rg50$b;->x(Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;)Ll/rg50$b;

    .line 38
    .line 39
    .line 40
    new-instance v0, Ll/csb0;

    .line 41
    .line 42
    invoke-direct {v0}, Ll/csb0;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v0}, Ll/rg50$b;->o(Ljavax/net/ssl/HostnameVerifier;)Ll/rg50$b;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :catchall_0
    move-exception v0

    .line 50
    new-instance v1, Lcom/p1/mobile/putong/api/fresco/FrescoImageTrustManagerException;

    .line 51
    .line 52
    invoke-direct {v1, v0}, Lcom/p1/mobile/putong/api/fresco/FrescoImageTrustManagerException;-><init>(Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    :goto_0
    new-instance v0, Ll/j9j;

    .line 59
    .line 60
    invoke-direct {v0}, Ll/j9j;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, v0}, Ll/rg50$b;->a(Ll/azm;)Ll/rg50$b;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ll/rg50$b;->c()Ll/rg50;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0
.end method

.method public static b0(II)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    if-lez p0, :cond_1

    .line 3
    .line 4
    if-gtz p1, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    int-to-float p1, p1

    .line 8
    int-to-float p0, p0

    .line 9
    div-float/2addr p1, p0

    .line 10
    const p0, 0x3faccccd    # 1.35f

    .line 11
    .line 12
    .line 13
    cmpg-float p0, p1, p0

    .line 14
    .line 15
    if-gez p0, :cond_1

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_1
    :goto_0
    return v0
.end method

.method public static d0(Lv/fresco/photodraweeview/PhotoDraweeView;)Z
    .locals 5

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Lv/VDraweeView;->getOriginalWidth()F

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    cmpl-float v0, v0, v1

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    const/4 v2, 0x1

    .line 14
    const/high16 v3, 0x40000000    # 2.0f

    .line 15
    .line 16
    if-lez v0, :cond_1

    .line 17
    .line 18
    invoke-static {}, Ll/bnl0;->y0()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    int-to-float v0, v0

    .line 23
    invoke-virtual {p0}, Lv/VDraweeView;->getOriginalWidth()F

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    div-float/2addr v0, v4

    .line 28
    invoke-virtual {p0}, Lv/VDraweeView;->getOriginalHeight()F

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    mul-float/2addr v0, v4

    .line 33
    invoke-static {}, Ll/bnl0;->w0()I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    mul-int/lit8 v4, v4, 0x2

    .line 38
    .line 39
    int-to-float v4, v4

    .line 40
    cmpl-float v0, v0, v4

    .line 41
    .line 42
    if-lez v0, :cond_0

    .line 43
    .line 44
    invoke-virtual {p0}, Lv/VDraweeView;->getOriginalHeight()F

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    invoke-static {}, Ll/bnl0;->w0()I

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    int-to-float v4, v4

    .line 53
    cmpl-float v0, v0, v4

    .line 54
    .line 55
    if-lez v0, :cond_0

    .line 56
    .line 57
    invoke-virtual {p0}, Lv/VDraweeView;->getOriginalHeight()F

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    invoke-virtual {p0}, Lv/VDraweeView;->getOriginalWidth()F

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    div-float/2addr v0, p0

    .line 66
    invoke-static {}, Ll/bnl0;->w0()I

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    int-to-float p0, p0

    .line 71
    invoke-static {}, Ll/bnl0;->y0()I

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    int-to-float v4, v4

    .line 76
    div-float/2addr p0, v4

    .line 77
    mul-float/2addr p0, v3

    .line 78
    cmpl-float p0, v0, p0

    .line 79
    .line 80
    if-lez p0, :cond_0

    .line 81
    .line 82
    return v2

    .line 83
    :cond_0
    return v1

    .line 84
    :cond_1
    invoke-virtual {p0}, Lv/VDraweeView;->getOriginalHeight()F

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    invoke-static {}, Ll/bnl0;->w0()I

    .line 89
    .line 90
    .line 91
    move-result v4

    .line 92
    mul-int/lit8 v4, v4, 0x2

    .line 93
    .line 94
    int-to-float v4, v4

    .line 95
    cmpl-float v0, v0, v4

    .line 96
    .line 97
    if-lez v0, :cond_2

    .line 98
    .line 99
    invoke-virtual {p0}, Lv/VDraweeView;->getOriginalHeight()F

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    invoke-virtual {p0}, Lv/VDraweeView;->getOriginalWidth()F

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    div-float/2addr v0, p0

    .line 108
    invoke-static {}, Ll/bnl0;->w0()I

    .line 109
    .line 110
    .line 111
    move-result p0

    .line 112
    int-to-float p0, p0

    .line 113
    invoke-static {}, Ll/bnl0;->y0()I

    .line 114
    .line 115
    .line 116
    move-result v4

    .line 117
    int-to-float v4, v4

    .line 118
    div-float/2addr p0, v4

    .line 119
    mul-float/2addr p0, v3

    .line 120
    cmpl-float p0, v0, p0

    .line 121
    .line 122
    if-lez p0, :cond_2

    .line 123
    .line 124
    return v2

    .line 125
    :cond_2
    return v1
.end method

.method public static o0(Lv/fresco/photodraweeview/PhotoDraweeView;Lv/fresco/subscaleview/SubsamplingScaleImageView;Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;Lcom/p1/mobile/putong/data/Picture$ImageUri;II)V
    .locals 1

    .line 1
    invoke-interface {p3}, Ll/qim;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-interface {p3}, Ll/qim;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    invoke-virtual {p0, p2, p3}, Lv/fresco/photodraweeview/PhotoDraweeView;->w(II)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lv/VDraweeView;->getOriginalHeight()F

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    invoke-virtual {p0}, Lv/VDraweeView;->getOriginalWidth()F

    .line 17
    .line 18
    .line 19
    move-result p3

    .line 20
    cmpl-float p2, p2, p3

    .line 21
    .line 22
    if-lez p2, :cond_3

    .line 23
    .line 24
    invoke-virtual {p0}, Lv/VDraweeView;->getOriginalHeight()F

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    invoke-virtual {p0}, Lv/VDraweeView;->getOriginalWidth()F

    .line 29
    .line 30
    .line 31
    move-result p3

    .line 32
    div-float/2addr p2, p3

    .line 33
    int-to-float p3, p7

    .line 34
    int-to-float p4, p6

    .line 35
    div-float v0, p3, p4

    .line 36
    .line 37
    cmpl-float p2, p2, v0

    .line 38
    .line 39
    if-lez p2, :cond_3

    .line 40
    .line 41
    invoke-static {p6, p7}, Ll/fsb0;->b0(II)Z

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    if-nez p2, :cond_3

    .line 46
    .line 47
    invoke-virtual {p0}, Lv/VDraweeView;->getOriginalWidth()F

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    mul-float/2addr p2, p3

    .line 52
    invoke-virtual {p0}, Lv/VDraweeView;->getOriginalHeight()F

    .line 53
    .line 54
    .line 55
    move-result p3

    .line 56
    div-float/2addr p2, p3

    .line 57
    div-float/2addr p4, p2

    .line 58
    invoke-virtual {p0}, Lv/fresco/photodraweeview/PhotoDraweeView;->getMaximumScale()F

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    cmpl-float p2, p4, p2

    .line 63
    .line 64
    if-lez p2, :cond_0

    .line 65
    .line 66
    invoke-virtual {p0, p4}, Lv/fresco/photodraweeview/PhotoDraweeView;->setMaximumScale(F)V

    .line 67
    .line 68
    .line 69
    :cond_0
    const p2, 0x3f8ccccd    # 1.1f

    .line 70
    .line 71
    .line 72
    cmpl-float p2, p4, p2

    .line 73
    .line 74
    if-lez p2, :cond_1

    .line 75
    .line 76
    invoke-virtual {p0, p4}, Lv/fresco/photodraweeview/PhotoDraweeView;->setDoubleTapScale(F)V

    .line 77
    .line 78
    .line 79
    :cond_1
    invoke-virtual {p0}, Lv/fresco/photodraweeview/PhotoDraweeView;->getMaximumScale()F

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    cmpl-float p2, p4, p2

    .line 84
    .line 85
    if-lez p2, :cond_2

    .line 86
    .line 87
    invoke-virtual {p0}, Lv/fresco/photodraweeview/PhotoDraweeView;->getMaximumScale()F

    .line 88
    .line 89
    .line 90
    move-result p4

    .line 91
    :cond_2
    const/4 p2, 0x1

    .line 92
    const/4 p3, 0x0

    .line 93
    invoke-virtual {p0, p4, p3, p3, p2}, Lv/fresco/photodraweeview/PhotoDraweeView;->v(FFFZ)V

    .line 94
    .line 95
    .line 96
    :cond_3
    sget-object p2, Ll/uqb0;->s:Ljava/lang/String;

    .line 97
    .line 98
    invoke-static {p0}, Ll/fsb0;->d0(Lv/fresco/photodraweeview/PhotoDraweeView;)Z

    .line 99
    .line 100
    .line 101
    move-result p2

    .line 102
    if-eqz p2, :cond_4

    .line 103
    .line 104
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 105
    .line 106
    invoke-virtual {p2, p5}, Ll/fsb0;->Z(Lcom/p1/mobile/putong/data/Picture$ImageUri;)Ljava/io/File;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result p3

    .line 114
    if-eqz p3, :cond_4

    .line 115
    .line 116
    new-instance p3, Ll/trb0;

    .line 117
    .line 118
    invoke-direct {p3, p1, p6, p0, p2}, Ll/trb0;-><init>(Lv/fresco/subscaleview/SubsamplingScaleImageView;ILv/fresco/photodraweeview/PhotoDraweeView;Ljava/io/File;)V

    .line 119
    .line 120
    .line 121
    invoke-static {p3}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 122
    .line 123
    .line 124
    :cond_4
    return-void
.end method

.method public static synthetic q(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    instance-of p1, p0, Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    check-cast p0, Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 8
    .line 9
    invoke-interface {p2}, Ll/qim;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-interface {p2}, Ll/qim;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    invoke-virtual {p0, p1, p2}, Lv/fresco/photodraweeview/PhotoDraweeView;->w(II)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static synthetic r(Ll/fsb0;Lv/fresco/subscaleview/SubsamplingScaleImageView;Lv/fresco/photodraweeview/PhotoDraweeView;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/fsb0;->f0(Lv/fresco/subscaleview/SubsamplingScaleImageView;Lv/fresco/photodraweeview/PhotoDraweeView;Ljava/io/File;)V

    return-void
.end method

.method public static synthetic s(Ll/fsb0;Ljava/lang/String;Ll/gcg0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/fsb0;->e0(Ljava/lang/String;Ll/gcg0;)V

    return-void
.end method

.method public static synthetic t(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V
    .locals 0

    .line 1
    instance-of p1, p0, Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    check-cast p0, Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 6
    .line 7
    invoke-interface {p2}, Ll/qim;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-interface {p2}, Ll/qim;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    invoke-virtual {p0, p1, p2}, Lv/fresco/photodraweeview/PhotoDraweeView;->w(II)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public static synthetic u(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public static synthetic v(Lv/fresco/subscaleview/SubsamplingScaleImageView;ILv/fresco/photodraweeview/PhotoDraweeView;Ljava/io/File;)V
    .locals 9

    .line 1
    new-instance v0, Ll/fsb0$i;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p0}, Ll/fsb0$i;-><init>(ILv/fresco/photodraweeview/PhotoDraweeView;Lv/fresco/subscaleview/SubsamplingScaleImageView;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->setOnImageEventListener(Lv/fresco/subscaleview/SubsamplingScaleImageView$h;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/16 v0, 0x2d0

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    if-ge p1, v0, :cond_0

    .line 17
    .line 18
    :try_start_0
    invoke-virtual {p3}, Ljava/io/File;->length()J

    .line 19
    .line 20
    .line 21
    move-result-wide v3

    .line 22
    const-wide/32 v5, 0x32000

    .line 23
    .line 24
    .line 25
    cmp-long p1, v3, v5

    .line 26
    .line 27
    if-lez p1, :cond_0

    .line 28
    .line 29
    new-instance v3, Ll/sim;

    .line 30
    .line 31
    invoke-virtual {p3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-static {p1}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    sget v5, Ll/sim;->n:I

    .line 40
    .line 41
    sget-object v7, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 42
    .line 43
    const/4 v8, 0x1

    .line 44
    const/4 v6, 0x0

    .line 45
    invoke-direct/range {v3 .. v8}, Ll/sim;-><init>(Ljava/lang/String;IILandroid/graphics/Bitmap$CompressFormat;Z)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v3}, Ll/sim;->d()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-static {p1}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iget-object p1, v3, Ll/sim;->d:[I

    .line 57
    .line 58
    aget p1, p1, v2

    .line 59
    .line 60
    int-to-float p1, p1

    .line 61
    invoke-virtual {p2, p1}, Lv/VDraweeView;->setOriginalWidth(F)V

    .line 62
    .line 63
    .line 64
    iget-object p1, v3, Ll/sim;->d:[I

    .line 65
    .line 66
    const/4 p3, 0x1

    .line 67
    aget p1, p1, p3

    .line 68
    .line 69
    int-to-float p1, p1

    .line 70
    invoke-virtual {p2, p1}, Lv/VDraweeView;->setOriginalHeight(F)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :catch_0
    move-exception v0

    .line 75
    move-object p1, v0

    .line 76
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 77
    .line 78
    .line 79
    :cond_0
    :goto_0
    invoke-static {v1}, Ll/qkm;->m(Ljava/lang/String;)Ll/qkm;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p0, p1}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->setImage(Ll/qkm;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 87
    .line 88
    .line 89
    const/4 p1, 0x0

    .line 90
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public static synthetic w(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    instance-of p1, p0, Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    check-cast p0, Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 8
    .line 9
    invoke-interface {p2}, Ll/qim;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-interface {p2}, Ll/qim;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    invoke-virtual {p0, p1, p2}, Lv/fresco/photodraweeview/PhotoDraweeView;->w(II)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static synthetic x(Ll/fsb0;Lcom/facebook/drawee/view/DraweeView;Lv/fresco/subscaleview/SubsamplingScaleImageView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/fsb0;->g0(Lcom/facebook/drawee/view/DraweeView;Lv/fresco/subscaleview/SubsamplingScaleImageView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V

    return-void
.end method

.method public static synthetic y(Ll/by3;)Z
    .locals 1

    .line 1
    invoke-interface {p0}, Ll/by3;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "FrameKey"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public static synthetic z(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V
    .locals 0

    .line 1
    instance-of p1, p0, Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    check-cast p0, Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 6
    .line 7
    invoke-interface {p2}, Ll/qim;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-interface {p2}, Ll/qim;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    invoke-virtual {p0, p1, p2}, Lv/fresco/photodraweeview/PhotoDraweeView;->w(II)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method


# virtual methods
.method public A0(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/kl40;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/fsb0;->r0(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget-object v0, Lcom/facebook/imagepipeline/common/Priority;->MEDIUM:Lcom/facebook/imagepipeline/common/Priority;

    .line 12
    .line 13
    invoke-virtual {p0, p1, v0}, Ll/fsb0;->y0(Ljava/lang/String;Lcom/facebook/imagepipeline/common/Priority;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public B0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/fsb0;->C0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ll/fn2;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public C0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ll/fn2;)V
    .locals 6

    .line 1
    const/4 v4, 0x0

    .line 2
    const-string v5, ""

    .line 3
    .line 4
    move-object v0, p0

    .line 5
    move-object v1, p1

    .line 6
    move-object v2, p2

    .line 7
    move-object v3, p3

    .line 8
    invoke-virtual/range {v0 .. v5}, Ll/fsb0;->D0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ll/fn2;Lv/fresco/subscaleview/SubsamplingScaleImageView;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public D(Landroid/view/View;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Ll/fsb0;->E(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p0, p2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance p2, Ll/zrb0;

    .line 14
    .line 15
    invoke-direct {p2, p1}, Ll/zrb0;-><init>(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public D0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ll/fn2;Lv/fresco/subscaleview/SubsamplingScaleImageView;Ljava/lang/String;)V
    .locals 7

    .line 1
    const/4 v6, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move-object v4, p4

    .line 7
    move-object v5, p5

    .line 8
    invoke-virtual/range {v0 .. v6}, Ll/fsb0;->E0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ll/fn2;Lv/fresco/subscaleview/SubsamplingScaleImageView;Ljava/lang/String;Landroid/util/Pair;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public E(Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/bsb0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/bsb0;-><init>(Ll/fsb0;Ljava/lang/String;)V

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

.method public E0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ll/fn2;Lv/fresco/subscaleview/SubsamplingScaleImageView;Ljava/lang/String;Landroid/util/Pair;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/drawee/view/DraweeView;",
            "Lcom/p1/mobile/putong/data/Picture$ImageUri;",
            "Ll/fn2;",
            "Lv/fresco/subscaleview/SubsamplingScaleImageView;",
            "Ljava/lang/String;",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0, p5}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->X(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-virtual {p0, p1}, Ll/am2;->g(Lcom/facebook/drawee/view/DraweeView;)Ll/lq70;

    .line 17
    .line 18
    .line 19
    move-result-object p5

    .line 20
    invoke-virtual {p0, p2}, Ll/fsb0;->X0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-eqz p6, :cond_1

    .line 25
    .line 26
    new-instance v1, Ll/bkq;

    .line 27
    .line 28
    iget-object v2, p6, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v2, Ljava/lang/Integer;

    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    iget-object v3, p6, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast v3, Ljava/lang/Integer;

    .line 39
    .line 40
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    invoke-direct {v1, v2, v3}, Ll/bkq;-><init>(II)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->K(Ll/fm80;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 48
    .line 49
    .line 50
    :cond_1
    iget-boolean v1, p2, Lcom/p1/mobile/putong/data/Picture$ImageUri;->isLocal:Z

    .line 51
    .line 52
    if-nez v1, :cond_b

    .line 53
    .line 54
    iget-object v1, p0, Ll/fsb0;->f:Ljava/util/concurrent/ConcurrentHashMap;

    .line 55
    .line 56
    iget-object v2, p2, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {v2}, Lcom/p1/mobile/putong/data/Media;->URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->contains(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-nez v1, :cond_b

    .line 67
    .line 68
    iget-object v1, p0, Ll/am2;->a:Ll/rjm;

    .line 69
    .line 70
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-static {v2}, Lcom/p1/mobile/putong/data/Media;->URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {v1, v2}, Ll/rjm;->q(Landroid/net/Uri;)Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-nez v1, :cond_b

    .line 87
    .line 88
    iget v1, p2, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatType:I

    .line 89
    .line 90
    const/4 v2, 0x2

    .line 91
    if-ne v1, v2, :cond_2

    .line 92
    .line 93
    sget-object v1, Lcom/p1/mobile/putong/data/Picture;->SQUARE_SIZES:[I

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_2
    sget-object v1, Lcom/p1/mobile/putong/data/Picture;->SIZES:[I

    .line 97
    .line 98
    :goto_0
    array-length v2, v1

    .line 99
    const/4 v3, 0x1

    .line 100
    sub-int/2addr v2, v3

    .line 101
    const/4 v4, -0x1

    .line 102
    move v5, v4

    .line 103
    :goto_1
    if-ltz v2, :cond_5

    .line 104
    .line 105
    aget v6, v1, v2

    .line 106
    .line 107
    iget-object v7, p0, Ll/am2;->a:Ll/rjm;

    .line 108
    .line 109
    invoke-virtual {p2, v6}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted(I)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v8

    .line 113
    invoke-static {v8}, Lcom/p1/mobile/putong/data/Media;->URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v8

    .line 117
    invoke-static {v8}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 118
    .line 119
    .line 120
    move-result-object v8

    .line 121
    invoke-virtual {v7, v8}, Ll/rjm;->q(Landroid/net/Uri;)Z

    .line 122
    .line 123
    .line 124
    move-result v7

    .line 125
    if-eqz v7, :cond_4

    .line 126
    .line 127
    iget v5, p2, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatWidth:I

    .line 128
    .line 129
    if-ge v6, v5, :cond_3

    .line 130
    .line 131
    move v5, v6

    .line 132
    goto :goto_2

    .line 133
    :cond_3
    move v5, v6

    .line 134
    :cond_4
    add-int/lit8 v2, v2, -0x1

    .line 135
    .line 136
    goto :goto_1

    .line 137
    :cond_5
    :goto_2
    if-eq v5, v4, :cond_6

    .line 138
    .line 139
    invoke-virtual {p2, v5}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->copy(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    goto :goto_3

    .line 144
    :cond_6
    const/4 v1, 0x0

    .line 145
    :goto_3
    if-eqz v1, :cond_a

    .line 146
    .line 147
    invoke-virtual {p5, v3}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->F(Z)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0, v1}, Ll/fsb0;->X0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    iget v2, p2, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatWidth:I

    .line 155
    .line 156
    if-le v5, v2, :cond_8

    .line 157
    .line 158
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    if-lez v2, :cond_8

    .line 163
    .line 164
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    if-lez v2, :cond_8

    .line 169
    .line 170
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->checkUrlBeanAvailable()Z

    .line 171
    .line 172
    .line 173
    move-result v2

    .line 174
    if-eqz v2, :cond_7

    .line 175
    .line 176
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 177
    .line 178
    .line 179
    move-result v2

    .line 180
    iget v3, p2, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatWidth:I

    .line 181
    .line 182
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    .line 183
    .line 184
    .line 185
    move-result v2

    .line 186
    new-instance v3, Ll/q3d0;

    .line 187
    .line 188
    iget-object v4, p2, Lcom/p1/mobile/putong/data/Picture$ImageUri;->orignalDimen:Lcom/p1/mobile/putong/data/Dimension;

    .line 189
    .line 190
    iget v5, v4, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 191
    .line 192
    mul-int/2addr v5, v2

    .line 193
    iget v4, v4, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 194
    .line 195
    div-int/2addr v5, v4

    .line 196
    invoke-direct {v3, v2, v5}, Ll/q3d0;-><init>(II)V

    .line 197
    .line 198
    .line 199
    goto :goto_4

    .line 200
    :cond_7
    new-instance v3, Ll/q3d0;

    .line 201
    .line 202
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 203
    .line 204
    .line 205
    move-result v2

    .line 206
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 207
    .line 208
    .line 209
    move-result v4

    .line 210
    invoke-direct {v3, v2, v4}, Ll/q3d0;-><init>(II)V

    .line 211
    .line 212
    .line 213
    :goto_4
    invoke-virtual {v1, v3}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->O(Ll/q3d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 214
    .line 215
    .line 216
    :cond_8
    if-eqz p6, :cond_9

    .line 217
    .line 218
    new-instance v2, Ll/bkq;

    .line 219
    .line 220
    iget-object v3, p6, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 221
    .line 222
    check-cast v3, Ljava/lang/Integer;

    .line 223
    .line 224
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 225
    .line 226
    .line 227
    move-result v3

    .line 228
    iget-object p6, p6, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 229
    .line 230
    check-cast p6, Ljava/lang/Integer;

    .line 231
    .line 232
    invoke-virtual {p6}, Ljava/lang/Integer;->intValue()I

    .line 233
    .line 234
    .line 235
    move-result p6

    .line 236
    invoke-direct {v2, v3, p6}, Ll/bkq;-><init>(II)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {v1, v2}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->K(Ll/fm80;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 240
    .line 241
    .line 242
    :cond_9
    sget-object p6, Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;->DISK_CACHE:Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;

    .line 243
    .line 244
    invoke-virtual {v1, p6}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->J(Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 245
    .line 246
    .line 247
    move-result-object p6

    .line 248
    invoke-virtual {p6}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 249
    .line 250
    .line 251
    move-result-object p6

    .line 252
    invoke-virtual {p5, p6}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->D(Ljava/lang/Object;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 253
    .line 254
    .line 255
    goto :goto_5

    .line 256
    :cond_a
    invoke-virtual {v0, v3}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->L(Z)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 257
    .line 258
    .line 259
    goto :goto_5

    .line 260
    :cond_b
    const/4 p6, 0x0

    .line 261
    invoke-virtual {v0, p6}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->L(Z)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 262
    .line 263
    .line 264
    :goto_5
    new-instance p6, Ll/yrb0;

    .line 265
    .line 266
    invoke-direct {p6, p0, p1, p4, p2}, Ll/yrb0;-><init>(Ll/fsb0;Lcom/facebook/drawee/view/DraweeView;Lv/fresco/subscaleview/SubsamplingScaleImageView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 267
    .line 268
    .line 269
    invoke-static {p3, p6}, Ll/fn2;->i(Ll/fn2;Ll/a30;)Ll/fn2;

    .line 270
    .line 271
    .line 272
    move-result-object p3

    .line 273
    const-string p4, "progress"

    .line 274
    .line 275
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object p6

    .line 279
    invoke-static {p4, p6, p1, p3}, Ll/tkm;->a(Ljava/lang/String;Ljava/lang/String;Landroid/view/View;Ll/fn2;)Ll/fn2;

    .line 280
    .line 281
    .line 282
    move-result-object p3

    .line 283
    new-instance p4, Ll/fsb0$f;

    .line 284
    .line 285
    invoke-direct {p4, p0, p3, p2}, Ll/fsb0$f;-><init>(Ll/fsb0;Ll/fn2;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {p5, p4}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->B(Ll/v36;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 289
    .line 290
    .line 291
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 292
    .line 293
    .line 294
    move-result-object p0

    .line 295
    invoke-virtual {p5, p0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->C(Ljava/lang/Object;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 296
    .line 297
    .line 298
    invoke-virtual {p5}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->c()Ll/c7;

    .line 299
    .line 300
    .line 301
    move-result-object p0

    .line 302
    invoke-virtual {p1, p0}, Lcom/facebook/drawee/view/DraweeView;->setController(Ll/lde;)V

    .line 303
    .line 304
    .line 305
    return-void
.end method

.method public F(Lcom/facebook/imagepipeline/request/ImageRequest;Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/imagepipeline/request/ImageRequest;",
            "Ll/y20<",
            "Landroid/graphics/Bitmap;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/am2;->a:Ll/rjm;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 4
    .line 5
    invoke-virtual {v0, p1, v1}, Ll/rjm;->h(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;)Ll/i6c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/fsb0$d;

    .line 10
    .line 11
    invoke-direct {v0, p0, p2}, Ll/fsb0$d;-><init>(Ll/fsb0;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/f94;->k()Ll/f94;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p1, v0, p0}, Ll/i6c;->f(Ll/s6c;Ljava/util/concurrent/Executor;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public F0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/String;Ll/fn2;)V
    .locals 6

    .line 1
    const/4 v4, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move-object v5, p3

    .line 6
    move-object v3, p4

    .line 7
    invoke-virtual/range {v0 .. v5}, Ll/fsb0;->D0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ll/fn2;Lv/fresco/subscaleview/SubsamplingScaleImageView;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public G(Lcom/p1/mobile/putong/data/Picture$ImageUri;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Picture$ImageUri;",
            "Ll/y20<",
            "Landroid/graphics/Bitmap;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/fsb0;->H(Lcom/p1/mobile/putong/data/Picture$ImageUri;Ll/y20;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public G0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fsb0;->f:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public H(Lcom/p1/mobile/putong/data/Picture$ImageUri;Ll/y20;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Picture$ImageUri;",
            "Ll/y20<",
            "Landroid/graphics/Bitmap;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/fsb0;->X0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    sget-object p3, Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;->DISK_CACHE:Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object p3, Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;->FULL_FETCH:Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;

    .line 11
    .line 12
    :goto_0
    invoke-virtual {p1, p3}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->J(Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1, p2}, Ll/fsb0;->F(Lcom/facebook/imagepipeline/request/ImageRequest;Ll/y20;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public H0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;II)Lcom/facebook/imagepipeline/request/ImageRequest;
    .locals 10

    .line 1
    const/4 v6, 0x0

    .line 2
    const/4 v7, 0x0

    .line 3
    const/4 v3, 0x0

    .line 4
    const/4 v4, 0x1

    .line 5
    const/4 v5, 0x0

    .line 6
    move-object v0, p0

    .line 7
    move-object v1, p1

    .line 8
    move-object v2, p2

    .line 9
    move v8, p3

    .line 10
    move v9, p4

    .line 11
    invoke-virtual/range {v0 .. v9}, Ll/fsb0;->V0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;ZZLl/q3d0;Ll/fn2;Ll/y20;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public I(Ljava/lang/String;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Landroid/graphics/Bitmap;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/am2;->n(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1, p2}, Ll/fsb0;->F(Lcom/facebook/imagepipeline/request/ImageRequest;Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;
    .locals 10

    .line 1
    const/4 v6, 0x0

    .line 2
    const/4 v7, 0x0

    .line 3
    const/4 v3, 0x0

    .line 4
    const/4 v4, 0x1

    .line 5
    const/4 v5, 0x0

    .line 6
    move-object v0, p0

    .line 7
    move-object v1, p1

    .line 8
    move-object v2, p2

    .line 9
    move v8, p3

    .line 10
    move v9, p4

    .line 11
    invoke-virtual/range {v0 .. v9}, Ll/fsb0;->W0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZZLl/q3d0;Ll/fn2;Ll/y20;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public J(Ljava/lang/String;Ll/y20;II)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Landroid/graphics/Bitmap;",
            ">;II)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->y(Landroid/net/Uri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/bkq;

    .line 10
    .line 11
    invoke-direct {v0, p3, p4}, Ll/bkq;-><init>(II)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->K(Ll/fm80;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1, p2}, Ll/fsb0;->F(Lcom/facebook/imagepipeline/request/ImageRequest;Ll/y20;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V
    .locals 7

    .line 1
    const/4 v5, 0x0

    .line 2
    const/4 v6, 0x0

    .line 3
    const/4 v4, 0x1

    .line 4
    move-object v0, p0

    .line 5
    move-object v1, p1

    .line 6
    move-object v2, p2

    .line 7
    move v3, p3

    .line 8
    invoke-virtual/range {v0 .. v6}, Ll/fsb0;->K0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;ZZLl/q3d0;Ll/fn2;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public K(Lcom/facebook/drawee/view/SimpleDraweeView;III)V
    .locals 6

    .line 1
    new-instance v5, Ll/q3d0;

    .line 2
    .line 3
    sget v0, Ll/sim;->n:I

    .line 4
    .line 5
    invoke-direct {v5, v0, v0}, Ll/q3d0;-><init>(II)V

    .line 6
    .line 7
    .line 8
    move-object v0, p0

    .line 9
    move-object v1, p1

    .line 10
    move v2, p2

    .line 11
    move v3, p3

    .line 12
    move v4, p4

    .line 13
    invoke-virtual/range {v0 .. v5}, Ll/fsb0;->L(Lcom/facebook/drawee/view/SimpleDraweeView;IIILl/q3d0;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public K0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;ZZLl/q3d0;Ll/fn2;)V
    .locals 8

    .line 1
    const/4 v7, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    move-object v5, p5

    .line 8
    move-object v6, p6

    .line 9
    invoke-virtual/range {v0 .. v7}, Ll/fsb0;->T0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;ZZLl/q3d0;Ll/fn2;Ll/y20;)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public L(Lcom/facebook/drawee/view/SimpleDraweeView;IIILl/q3d0;)V
    .locals 1

    .line 1
    invoke-static {p2}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->x(I)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz p5, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p5}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->O(Ll/q3d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 8
    .line 9
    .line 10
    :cond_0
    if-eqz p5, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0, p5}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->O(Ll/q3d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 13
    .line 14
    .line 15
    :cond_1
    new-instance p5, Ll/bkq;

    .line 16
    .line 17
    invoke-direct {p5, p3, p4}, Ll/bkq;-><init>(II)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p5}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->K(Ll/fm80;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 21
    .line 22
    .line 23
    move-result-object p3

    .line 24
    invoke-virtual {p3}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 25
    .line 26
    .line 27
    move-result-object p3

    .line 28
    new-instance p4, Ll/xrb0;

    .line 29
    .line 30
    invoke-direct {p4, p1}, Ll/xrb0;-><init>(Lcom/facebook/drawee/view/SimpleDraweeView;)V

    .line 31
    .line 32
    .line 33
    const/4 p5, 0x0

    .line 34
    invoke-static {p5, p4}, Ll/fn2;->i(Ll/fn2;Ll/a30;)Ll/fn2;

    .line 35
    .line 36
    .line 37
    move-result-object p4

    .line 38
    invoke-static {p2}, Ll/i4k0;->g(I)Landroid/net/Uri;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    const-string p5, "blurLocalFile2"

    .line 47
    .line 48
    invoke-static {p5, p2, p1, p4}, Ll/tkm;->a(Ljava/lang/String;Ljava/lang/String;Landroid/view/View;Ll/fn2;)Ll/fn2;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    invoke-virtual {p0, p1}, Ll/am2;->g(Lcom/facebook/drawee/view/DraweeView;)Ll/lq70;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0, p3}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->C(Ljava/lang/Object;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    check-cast p0, Ll/lq70;

    .line 61
    .line 62
    new-instance p3, Ll/am2$b;

    .line 63
    .line 64
    invoke-direct {p3, p2}, Ll/am2$b;-><init>(Ll/fn2;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, p3}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->B(Ll/v36;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    check-cast p0, Ll/lq70;

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->c()Ll/c7;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p1, p0}, Lcom/facebook/drawee/view/DraweeView;->setController(Ll/lde;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/fsb0;->N0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public M(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V
    .locals 6

    .line 1
    new-instance v5, Ll/q3d0;

    .line 2
    .line 3
    sget v0, Ll/sim;->n:I

    .line 4
    .line 5
    invoke-direct {v5, v0, v0}, Ll/q3d0;-><init>(II)V

    .line 6
    .line 7
    .line 8
    move-object v0, p0

    .line 9
    move-object v1, p1

    .line 10
    move-object v2, p2

    .line 11
    move v3, p3

    .line 12
    move v4, p4

    .line 13
    invoke-virtual/range {v0 .. v5}, Ll/fsb0;->N(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IILl/q3d0;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public M0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/fn2;)V
    .locals 7

    .line 1
    const/4 v4, 0x1

    .line 2
    const/4 v5, 0x0

    .line 3
    const/4 v3, 0x0

    .line 4
    move-object v0, p0

    .line 5
    move-object v1, p1

    .line 6
    move-object v2, p2

    .line 7
    move-object v6, p3

    .line 8
    invoke-virtual/range {v0 .. v6}, Ll/fsb0;->O0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZZLl/q3d0;Ll/fn2;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public N(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IILl/q3d0;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p2}, Ll/am2;->n(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz p5, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p5}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->O(Ll/q3d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 8
    .line 9
    .line 10
    :cond_0
    new-instance p5, Ll/bkq;

    .line 11
    .line 12
    invoke-direct {p5, p3, p4}, Ll/bkq;-><init>(II)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p5}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->K(Ll/fm80;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    invoke-virtual {p3}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    new-instance p4, Ll/esb0;

    .line 24
    .line 25
    invoke-direct {p4, p1}, Ll/esb0;-><init>(Lcom/facebook/drawee/view/SimpleDraweeView;)V

    .line 26
    .line 27
    .line 28
    const/4 p5, 0x0

    .line 29
    invoke-static {p5, p4}, Ll/fn2;->i(Ll/fn2;Ll/a30;)Ll/fn2;

    .line 30
    .line 31
    .line 32
    move-result-object p4

    .line 33
    const-string p5, "blurLocalFile"

    .line 34
    .line 35
    invoke-static {p5, p2, p1, p4}, Ll/tkm;->a(Ljava/lang/String;Ljava/lang/String;Landroid/view/View;Ll/fn2;)Ll/fn2;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-virtual {p0, p1}, Ll/am2;->g(Lcom/facebook/drawee/view/DraweeView;)Ll/lq70;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0, p3}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->C(Ljava/lang/Object;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    check-cast p0, Ll/lq70;

    .line 48
    .line 49
    new-instance p3, Ll/am2$b;

    .line 50
    .line 51
    invoke-direct {p3, p2}, Ll/am2$b;-><init>(Ll/fn2;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, p3}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->B(Ll/v36;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    check-cast p0, Ll/lq70;

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->c()Ll/c7;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p1, p0}, Lcom/facebook/drawee/view/DraweeView;->setController(Ll/lde;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public N0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Z)V
    .locals 7

    .line 1
    const/4 v5, 0x0

    .line 2
    const/4 v6, 0x0

    .line 3
    const/4 v3, 0x0

    .line 4
    move-object v0, p0

    .line 5
    move-object v1, p1

    .line 6
    move-object v2, p2

    .line 7
    move v4, p3

    .line 8
    invoke-virtual/range {v0 .. v6}, Ll/fsb0;->O0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZZLl/q3d0;Ll/fn2;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V
    .locals 6

    .line 1
    const/4 v5, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    invoke-virtual/range {v0 .. v5}, Ll/fsb0;->P(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;III)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public O0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZZLl/q3d0;Ll/fn2;)V
    .locals 8

    .line 1
    const/4 v7, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    move-object v5, p5

    .line 8
    move-object v6, p6

    .line 9
    invoke-virtual/range {v0 .. v7}, Ll/fsb0;->U0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZZLl/q3d0;Ll/fn2;Ll/y20;)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public P(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;III)V
    .locals 1

    .line 1
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->y(Landroid/net/Uri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p5, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/ckq;

    .line 12
    .line 13
    invoke-direct {v0, p3, p4}, Ll/ckq;-><init>(II)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p5}, Ll/ckq;->g(I)Ll/ckq;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    new-instance p5, Ll/bkq;

    .line 22
    .line 23
    invoke-direct {p5, p3, p4}, Ll/bkq;-><init>(II)V

    .line 24
    .line 25
    .line 26
    move-object p3, p5

    .line 27
    :goto_0
    invoke-virtual {p0, p3}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->K(Ll/fm80;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string p3, "blurRemote1"

    .line 36
    .line 37
    const/4 p4, 0x0

    .line 38
    invoke-static {p3, p2, p1, p4}, Ll/tkm;->a(Ljava/lang/String;Ljava/lang/String;Landroid/view/View;Ll/fn2;)Ll/fn2;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-static {}, Ll/f9j;->g()Ll/lq70;

    .line 43
    .line 44
    .line 45
    move-result-object p3

    .line 46
    new-instance p4, Ll/am2$b;

    .line 47
    .line 48
    invoke-direct {p4, p2}, Ll/am2$b;-><init>(Ll/fn2;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p3, p4}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->B(Ll/v36;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    check-cast p2, Ll/lq70;

    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/facebook/drawee/view/DraweeView;->getController()Ll/lde;

    .line 58
    .line 59
    .line 60
    move-result-object p3

    .line 61
    invoke-virtual {p2, p3}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->E(Ll/lde;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    check-cast p2, Ll/lq70;

    .line 66
    .line 67
    invoke-virtual {p2, p0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->C(Ljava/lang/Object;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    check-cast p0, Ll/lq70;

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->c()Ll/c7;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p1, p0}, Lcom/facebook/drawee/view/DraweeView;->setController(Ll/lde;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public P0(Lv/VDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;II)V
    .locals 7

    .line 1
    invoke-virtual {p0, p2}, Ll/fsb0;->X0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/facebook/imagepipeline/common/Priority;->MEDIUM:Lcom/facebook/imagepipeline/common/Priority;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->N(Lcom/facebook/imagepipeline/common/Priority;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/am2;->a:Ll/rjm;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-virtual {v1, v0, v2}, Ll/rjm;->k(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;)Ll/i6c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/fsb0$h;

    .line 23
    .line 24
    move-object v2, p0

    .line 25
    move-object v3, p1

    .line 26
    move-object v4, p2

    .line 27
    move v5, p3

    .line 28
    move v6, p4

    .line 29
    invoke-direct/range {v1 .. v6}, Ll/fsb0$h;-><init>(Ll/fsb0;Lv/VDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;II)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Ll/esj0;->v()Ll/esj0;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-interface {v0, v1, p0}, Ll/i6c;->f(Ll/s6c;Ljava/util/concurrent/Executor;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public Q(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIILl/fn2;)V
    .locals 1

    .line 1
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->y(Landroid/net/Uri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p5, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/ckq;

    .line 12
    .line 13
    invoke-direct {v0, p3, p4}, Ll/ckq;-><init>(II)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p5}, Ll/ckq;->g(I)Ll/ckq;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    new-instance p5, Ll/bkq;

    .line 22
    .line 23
    invoke-direct {p5, p3, p4}, Ll/bkq;-><init>(II)V

    .line 24
    .line 25
    .line 26
    move-object p3, p5

    .line 27
    :goto_0
    invoke-virtual {p0, p3}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->K(Ll/fm80;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string p3, "blurRemote2"

    .line 36
    .line 37
    invoke-static {p3, p2, p1, p6}, Ll/tkm;->a(Ljava/lang/String;Ljava/lang/String;Landroid/view/View;Ll/fn2;)Ll/fn2;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-static {}, Ll/f9j;->g()Ll/lq70;

    .line 42
    .line 43
    .line 44
    move-result-object p3

    .line 45
    invoke-virtual {p1}, Lcom/facebook/drawee/view/DraweeView;->getController()Ll/lde;

    .line 46
    .line 47
    .line 48
    move-result-object p4

    .line 49
    invoke-virtual {p3, p4}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->E(Ll/lde;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 50
    .line 51
    .line 52
    move-result-object p3

    .line 53
    check-cast p3, Ll/lq70;

    .line 54
    .line 55
    invoke-virtual {p3, p0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->C(Ljava/lang/Object;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    check-cast p0, Ll/lq70;

    .line 60
    .line 61
    new-instance p3, Ll/am2$b;

    .line 62
    .line 63
    invoke-direct {p3, p2}, Ll/am2$b;-><init>(Ll/fn2;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, p3}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->B(Ll/v36;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    check-cast p0, Ll/lq70;

    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->c()Ll/c7;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p1, p0}, Lcom/facebook/drawee/view/DraweeView;->setController(Ll/lde;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public R(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/am2;->a:Ll/rjm;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/data/Media;->URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Ll/rjm;->d(Landroid/net/Uri;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public R0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/String;)V
    .locals 8

    .line 1
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0, p3}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->X(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    new-instance v7, Ll/fsb0$g;

    .line 17
    .line 18
    invoke-direct {v7, p0, p2}, Ll/fsb0$g;-><init>(Ll/fsb0;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 19
    .line 20
    .line 21
    const/4 v5, 0x1

    .line 22
    const/4 v6, 0x0

    .line 23
    const/4 v4, 0x1

    .line 24
    move-object v1, p0

    .line 25
    move-object v2, p1

    .line 26
    move-object v3, p2

    .line 27
    invoke-virtual/range {v1 .. v7}, Ll/fsb0;->K0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;ZZLl/q3d0;Ll/fn2;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public S0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V
    .locals 7

    .line 1
    const/4 v5, 0x0

    .line 2
    const/4 v6, 0x0

    .line 3
    const/4 v3, 0x1

    .line 4
    const/4 v4, 0x0

    .line 5
    move-object v0, p0

    .line 6
    move-object v1, p1

    .line 7
    move-object v2, p2

    .line 8
    invoke-virtual/range {v0 .. v6}, Ll/fsb0;->O0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZZLl/q3d0;Ll/fn2;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public T0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;ZZLl/q3d0;Ll/fn2;Ll/y20;)Lcom/facebook/imagepipeline/request/ImageRequest;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/drawee/view/SimpleDraweeView;",
            "Lcom/p1/mobile/putong/data/Picture$ImageUri;",
            "ZZ",
            "Ll/q3d0;",
            "Ll/fn2;",
            "Ll/y20<",
            "Lcom/facebook/imagepipeline/request/ImageRequestBuilder;",
            ">;)",
            "Lcom/facebook/imagepipeline/request/ImageRequest;"
        }
    .end annotation

    .line 1
    const/4 v8, 0x0

    .line 2
    const/4 v9, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move v3, p3

    .line 7
    move v4, p4

    .line 8
    move-object v5, p5

    .line 9
    move-object/from16 v6, p6

    .line 10
    .line 11
    move-object/from16 v7, p7

    .line 12
    .line 13
    invoke-virtual/range {v0 .. v9}, Ll/fsb0;->V0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;ZZLl/q3d0;Ll/fn2;Ll/y20;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public U(Ljava/util/Set;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Lcom/facebook/imagepipeline/request/ImageRequest;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 23
    .line 24
    iget-object v1, p0, Ll/am2;->a:Ll/rjm;

    .line 25
    .line 26
    invoke-virtual {v1}, Ll/rjm;->o()Ll/cy3;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-interface {v1, v0, v2}, Ll/cy3;->c(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;)Ll/by3;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequest;->w()Landroid/net/Uri;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    iget-object v2, p0, Ll/am2;->a:Ll/rjm;

    .line 46
    .line 47
    invoke-virtual {v2, v0}, Ll/rjm;->r(Lcom/facebook/imagepipeline/request/ImageRequest;)Z

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/am2;->a:Ll/rjm;

    .line 51
    .line 52
    invoke-interface {v1}, Ll/by3;->a()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Ll/rjm;->g(Landroid/net/Uri;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    :goto_1
    return-void
.end method

.method public U0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZZLl/q3d0;Ll/fn2;Ll/y20;)Lcom/facebook/imagepipeline/request/ImageRequest;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/drawee/view/SimpleDraweeView;",
            "Ljava/lang/String;",
            "ZZ",
            "Ll/q3d0;",
            "Ll/fn2;",
            "Ll/y20<",
            "Lcom/facebook/imagepipeline/request/ImageRequestBuilder;",
            ">;)",
            "Lcom/facebook/imagepipeline/request/ImageRequest;"
        }
    .end annotation

    .line 1
    const/4 v8, 0x0

    .line 2
    const/4 v9, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move v3, p3

    .line 7
    move v4, p4

    .line 8
    move-object v5, p5

    .line 9
    move-object/from16 v6, p6

    .line 10
    .line 11
    move-object/from16 v7, p7

    .line 12
    .line 13
    invoke-virtual/range {v0 .. v9}, Ll/fsb0;->W0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZZLl/q3d0;Ll/fn2;Ll/y20;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public V()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/am2;->a:Ll/rjm;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rjm;->n()Ll/mpy;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ll/asb0;

    .line 14
    .line 15
    invoke-direct {v0}, Ll/asb0;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-interface {p0, v0}, Ll/mpy;->d(Ll/up80;)I

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public V0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;ZZLl/q3d0;Ll/fn2;Ll/y20;II)Lcom/facebook/imagepipeline/request/ImageRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/drawee/view/SimpleDraweeView;",
            "Lcom/p1/mobile/putong/data/Picture$ImageUri;",
            "ZZ",
            "Ll/q3d0;",
            "Ll/fn2;",
            "Ll/y20<",
            "Lcom/facebook/imagepipeline/request/ImageRequestBuilder;",
            ">;II)",
            "Lcom/facebook/imagepipeline/request/ImageRequest;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p2}, Ll/fsb0;->X0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    sget-object p3, Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;->SMALL:Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object p3, Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;->DEFAULT:Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;

    .line 11
    .line 12
    :goto_0
    invoke-virtual {v0, p3}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->B(Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    if-eqz p5, :cond_1

    .line 17
    .line 18
    invoke-virtual {p3, p5}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->O(Ll/q3d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 19
    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_1
    if-nez p8, :cond_2

    .line 23
    .line 24
    if-eqz p9, :cond_3

    .line 25
    .line 26
    :cond_2
    new-instance p5, Ll/q3d0;

    .line 27
    .line 28
    invoke-direct {p5, p8, p9}, Ll/q3d0;-><init>(II)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p3, p5}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->O(Ll/q3d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 32
    .line 33
    .line 34
    :cond_3
    :goto_1
    if-eqz p7, :cond_4

    .line 35
    .line 36
    invoke-interface {p7, p3}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    :cond_4
    invoke-virtual {p3}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 40
    .line 41
    .line 42
    move-result-object p3

    .line 43
    const-string p5, "remote2"

    .line 44
    .line 45
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-static {p5, p2, p1, p6}, Ll/tkm;->a(Ljava/lang/String;Ljava/lang/String;Landroid/view/View;Ll/fn2;)Ll/fn2;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    invoke-virtual {p0, p1, p3, p4, p2}, Ll/fsb0;->X(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/facebook/imagepipeline/request/ImageRequest;ZLl/fn2;)Ll/c7;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p1, p0}, Lcom/facebook/drawee/view/DraweeView;->setController(Ll/lde;)V

    .line 58
    .line 59
    .line 60
    return-object p3
.end method

.method public W0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZZLl/q3d0;Ll/fn2;Ll/y20;II)Lcom/facebook/imagepipeline/request/ImageRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/drawee/view/SimpleDraweeView;",
            "Ljava/lang/String;",
            "ZZ",
            "Ll/q3d0;",
            "Ll/fn2;",
            "Ll/y20<",
            "Lcom/facebook/imagepipeline/request/ImageRequestBuilder;",
            ">;II)",
            "Lcom/facebook/imagepipeline/request/ImageRequest;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p2}, Ll/am2;->n(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    sget-object p3, Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;->SMALL:Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object p3, Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;->DEFAULT:Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;

    .line 11
    .line 12
    :goto_0
    invoke-virtual {v0, p3}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->B(Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    if-eqz p5, :cond_1

    .line 17
    .line 18
    invoke-virtual {p3, p5}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->O(Ll/q3d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 19
    .line 20
    .line 21
    goto :goto_2

    .line 22
    :cond_1
    if-nez p8, :cond_3

    .line 23
    .line 24
    if-eqz p9, :cond_2

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 28
    .line 29
    .line 30
    move-result p5

    .line 31
    if-eqz p5, :cond_4

    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 34
    .line 35
    .line 36
    move-result p5

    .line 37
    if-eqz p5, :cond_4

    .line 38
    .line 39
    new-instance p5, Ll/q3d0;

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 42
    .line 43
    .line 44
    move-result p8

    .line 45
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 46
    .line 47
    .line 48
    move-result p9

    .line 49
    invoke-direct {p5, p8, p9}, Ll/q3d0;-><init>(II)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p3, p5}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->O(Ll/q3d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 53
    .line 54
    .line 55
    goto :goto_2

    .line 56
    :cond_3
    :goto_1
    new-instance p5, Ll/q3d0;

    .line 57
    .line 58
    invoke-direct {p5, p8, p9}, Ll/q3d0;-><init>(II)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p3, p5}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->O(Ll/q3d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 62
    .line 63
    .line 64
    :cond_4
    :goto_2
    if-eqz p7, :cond_5

    .line 65
    .line 66
    invoke-interface {p7, p3}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    :cond_5
    invoke-virtual {p3}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 70
    .line 71
    .line 72
    move-result-object p3

    .line 73
    const-string p5, "remote"

    .line 74
    .line 75
    invoke-static {p5, p2, p1, p6}, Ll/tkm;->a(Ljava/lang/String;Ljava/lang/String;Landroid/view/View;Ll/fn2;)Ll/fn2;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    invoke-virtual {p0, p1, p3, p4, p2}, Ll/fsb0;->X(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/facebook/imagepipeline/request/ImageRequest;ZLl/fn2;)Ll/c7;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p1, p0}, Lcom/facebook/drawee/view/DraweeView;->setController(Ll/lde;)V

    .line 84
    .line 85
    .line 86
    return-object p3
.end method

.method public X(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/facebook/imagepipeline/request/ImageRequest;ZLl/fn2;)Ll/c7;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p3}, Ll/am2;->h(Lcom/facebook/drawee/view/DraweeView;Z)Ll/lq70;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance p1, Ll/am2$b;

    .line 6
    .line 7
    invoke-direct {p1, p4}, Ll/am2$b;-><init>(Ll/fn2;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->B(Ll/v36;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Ll/lq70;

    .line 15
    .line 16
    invoke-virtual {p0, p2}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->C(Ljava/lang/Object;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Ll/lq70;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->c()Ll/c7;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public X0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;
    .locals 2

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/Picture$ImageUri;->isLocal:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p1, v0}, Ll/fsb0;->n0(Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/fsb0;->f:Ljava/util/concurrent/ConcurrentHashMap;

    .line 13
    .line 14
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v1}, Lcom/p1/mobile/putong/data/Media;->URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ljava/lang/String;

    .line 25
    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Ll/am2;->n(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_1
    invoke-virtual {p0, p1, v0}, Ll/fsb0;->n0(Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public Y(Lcom/facebook/imagepipeline/request/ImageRequest;)Ljava/io/File;
    .locals 3

    .line 1
    iget-object p0, p0, Ll/am2;->a:Ll/rjm;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rjm;->o()Ll/cy3;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-interface {p0, p1, v0}, Ll/cy3;->b(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;)Ll/by3;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequest;->v()Ljava/io/File;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {}, Ll/vjm;->m()Ll/vjm;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/vjm;->g()Ll/a7h0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Ll/a7h0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Ll/g4e;

    .line 30
    .line 31
    invoke-interface {v0}, Ll/g4e;->e()Ll/iii;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {}, Ll/vjm;->m()Ll/vjm;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Ll/vjm;->g()Ll/a7h0;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-interface {v1}, Ll/a7h0;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Ll/g4e;

    .line 48
    .line 49
    invoke-interface {v1}, Ll/g4e;->a()Ll/iii;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-interface {v0, p0}, Ll/iii;->b(Ll/by3;)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_0

    .line 58
    .line 59
    invoke-interface {v0, p0}, Ll/iii;->c(Ll/by3;)Ll/dy2;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    if-eqz v2, :cond_0

    .line 64
    .line 65
    invoke-interface {v0, p0}, Ll/iii;->c(Ll/by3;)Ll/dy2;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    goto :goto_0

    .line 70
    :cond_0
    invoke-interface {v1, p0}, Ll/iii;->b(Ll/by3;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_1

    .line 75
    .line 76
    invoke-interface {v1, p0}, Ll/iii;->c(Ll/by3;)Ll/dy2;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    if-eqz v0, :cond_1

    .line 81
    .line 82
    invoke-interface {v1, p0}, Ll/iii;->c(Ll/by3;)Ll/dy2;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    goto :goto_0

    .line 87
    :cond_1
    const/4 p0, 0x0

    .line 88
    :goto_0
    if-eqz p0, :cond_2

    .line 89
    .line 90
    check-cast p0, Ll/hii;

    .line 91
    .line 92
    invoke-virtual {p0}, Ll/hii;->d()Ljava/io/File;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    return-object p0

    .line 97
    :cond_2
    return-object p1
.end method

.method public Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V
    .locals 2

    .line 1
    new-instance v0, Landroid/net/Uri$Builder;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "res"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {v0, p2}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-virtual {p2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    const/4 v0, 0x1

    .line 25
    invoke-virtual {p0, p1, v0}, Ll/am2;->h(Lcom/facebook/drawee/view/DraweeView;Z)Ll/lq70;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p0, p2}, Ll/am2;->n(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, p0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->C(Ljava/lang/Object;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    check-cast p0, Ll/lq70;

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->c()Ll/c7;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p1, p0}, Lcom/facebook/drawee/view/DraweeView;->setController(Ll/lde;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public Z(Lcom/p1/mobile/putong/data/Picture$ImageUri;)Ljava/io/File;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fsb0;->X0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ll/fsb0;->Y(Lcom/facebook/imagepipeline/request/ImageRequest;)Ljava/io/File;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/am2;->g(Lcom/facebook/drawee/view/DraweeView;)Ll/lq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, p2}, Ll/am2;->n(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->C(Ljava/lang/Object;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ll/lq70;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->c()Ll/c7;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Lcom/facebook/drawee/view/DraweeView;->setController(Ll/lde;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final c0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Picture$ImageUri;->orignalDimen:Lcom/p1/mobile/putong/data/Dimension;

    .line 8
    .line 9
    if-nez p0, :cond_1

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget p0, p1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    iget p0, p1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 18
    .line 19
    if-nez p0, :cond_2

    .line 20
    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :cond_1
    iget p0, p1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 24
    .line 25
    if-nez p0, :cond_2

    .line 26
    .line 27
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 28
    .line 29
    const-string p1, "local image must have valid local url"

    .line 30
    .line 31
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    :cond_2
    const/4 p0, 0x1

    .line 38
    return p0
.end method

.method public e(Ll/rg50;)Ll/ug50;
    .locals 1

    .line 1
    new-instance v0, Ll/ug50;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/ug50;-><init>(Ll/rg50;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ll/fsb0$c;

    .line 7
    .line 8
    invoke-direct {p1, p0}, Ll/fsb0$c;-><init>(Ll/fsb0;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ll/ug50;->o(Ll/ukm;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public final synthetic e0(Ljava/lang/String;Ll/gcg0;)V
    .locals 1

    .line 1
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/vrb0;

    .line 5
    .line 6
    invoke-direct {v0, p2}, Ll/vrb0;-><init>(Ll/gcg0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1, v0}, Ll/fsb0;->I(Ljava/lang/String;Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic f0(Lv/fresco/subscaleview/SubsamplingScaleImageView;Lv/fresco/photodraweeview/PhotoDraweeView;Ljava/io/File;)V
    .locals 8

    .line 1
    new-instance v0, Ll/fsb0$e;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p1}, Ll/fsb0$e;-><init>(Ll/fsb0;Lv/fresco/photodraweeview/PhotoDraweeView;Lv/fresco/subscaleview/SubsamplingScaleImageView;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->setOnImageEventListener(Lv/fresco/subscaleview/SubsamplingScaleImageView$h;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v1, 0x0

    .line 14
    :try_start_0
    invoke-static {}, Ll/bnl0;->y0()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/16 v2, 0x2d0

    .line 19
    .line 20
    if-ge v0, v2, :cond_0

    .line 21
    .line 22
    invoke-virtual {p3}, Ljava/io/File;->length()J

    .line 23
    .line 24
    .line 25
    move-result-wide v2

    .line 26
    const-wide/32 v4, 0x32000

    .line 27
    .line 28
    .line 29
    cmp-long v0, v2, v4

    .line 30
    .line 31
    if-lez v0, :cond_0

    .line 32
    .line 33
    new-instance v2, Ll/sim;

    .line 34
    .line 35
    invoke-virtual {p3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p3

    .line 39
    invoke-static {p3}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    sget v4, Ll/sim;->n:I

    .line 44
    .line 45
    sget-object v6, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 46
    .line 47
    const/4 v7, 0x1

    .line 48
    const/4 v5, 0x0

    .line 49
    invoke-direct/range {v2 .. v7}, Ll/sim;-><init>(Ljava/lang/String;IILandroid/graphics/Bitmap$CompressFormat;Z)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2}, Ll/sim;->d()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p3

    .line 56
    invoke-static {p3}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    iget-object p3, v2, Ll/sim;->d:[I

    .line 61
    .line 62
    aget p3, p3, v1

    .line 63
    .line 64
    int-to-float p3, p3

    .line 65
    invoke-virtual {p2, p3}, Lv/VDraweeView;->setOriginalWidth(F)V

    .line 66
    .line 67
    .line 68
    iget-object p3, v2, Ll/sim;->d:[I

    .line 69
    .line 70
    const/4 v0, 0x1

    .line 71
    aget p3, p3, v0

    .line 72
    .line 73
    int-to-float p3, p3

    .line 74
    invoke-virtual {p2, p3}, Lv/VDraweeView;->setOriginalHeight(F)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :catch_0
    move-exception v0

    .line 79
    move-object p2, v0

    .line 80
    invoke-static {p2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 81
    .line 82
    .line 83
    :cond_0
    :goto_0
    invoke-static {p0}, Ll/qkm;->m(Ljava/lang/String;)Ll/qkm;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p1, p0}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->setImage(Ll/qkm;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 91
    .line 92
    .line 93
    const/4 p0, 0x0

    .line 94
    invoke-virtual {p1, p0}, Landroid/view/View;->setAlpha(F)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public final synthetic g0(Lcom/facebook/drawee/view/DraweeView;Lv/fresco/subscaleview/SubsamplingScaleImageView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V
    .locals 0

    .line 1
    instance-of p4, p1, Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 2
    .line 3
    if-eqz p4, :cond_4

    .line 4
    .line 5
    check-cast p1, Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 6
    .line 7
    invoke-interface {p5}, Ll/qim;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result p4

    .line 11
    invoke-interface {p5}, Ll/qim;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result p5

    .line 15
    invoke-virtual {p1, p4, p5}, Lv/fresco/photodraweeview/PhotoDraweeView;->w(II)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Lv/VDraweeView;->getOriginalHeight()F

    .line 19
    .line 20
    .line 21
    move-result p4

    .line 22
    invoke-virtual {p1}, Lv/VDraweeView;->getOriginalWidth()F

    .line 23
    .line 24
    .line 25
    move-result p5

    .line 26
    cmpl-float p4, p4, p5

    .line 27
    .line 28
    if-lez p4, :cond_3

    .line 29
    .line 30
    invoke-virtual {p1}, Lv/VDraweeView;->getOriginalHeight()F

    .line 31
    .line 32
    .line 33
    move-result p4

    .line 34
    invoke-virtual {p1}, Lv/VDraweeView;->getOriginalWidth()F

    .line 35
    .line 36
    .line 37
    move-result p5

    .line 38
    div-float/2addr p4, p5

    .line 39
    invoke-static {}, Ll/bnl0;->w0()I

    .line 40
    .line 41
    .line 42
    move-result p5

    .line 43
    int-to-float p5, p5

    .line 44
    invoke-static {}, Ll/bnl0;->y0()I

    .line 45
    .line 46
    .line 47
    move-result p6

    .line 48
    int-to-float p6, p6

    .line 49
    div-float/2addr p5, p6

    .line 50
    cmpl-float p4, p4, p5

    .line 51
    .line 52
    if-lez p4, :cond_3

    .line 53
    .line 54
    invoke-virtual {p1}, Lv/VDraweeView;->getOriginalWidth()F

    .line 55
    .line 56
    .line 57
    move-result p4

    .line 58
    invoke-static {}, Ll/bnl0;->w0()I

    .line 59
    .line 60
    .line 61
    move-result p5

    .line 62
    int-to-float p5, p5

    .line 63
    mul-float/2addr p4, p5

    .line 64
    invoke-virtual {p1}, Lv/VDraweeView;->getOriginalHeight()F

    .line 65
    .line 66
    .line 67
    move-result p5

    .line 68
    div-float/2addr p4, p5

    .line 69
    invoke-static {}, Ll/bnl0;->y0()I

    .line 70
    .line 71
    .line 72
    move-result p5

    .line 73
    int-to-float p5, p5

    .line 74
    div-float/2addr p5, p4

    .line 75
    invoke-virtual {p1}, Lv/fresco/photodraweeview/PhotoDraweeView;->getMaximumScale()F

    .line 76
    .line 77
    .line 78
    move-result p4

    .line 79
    cmpl-float p4, p5, p4

    .line 80
    .line 81
    if-lez p4, :cond_0

    .line 82
    .line 83
    invoke-virtual {p1, p5}, Lv/fresco/photodraweeview/PhotoDraweeView;->setMaximumScale(F)V

    .line 84
    .line 85
    .line 86
    :cond_0
    const p4, 0x3f8ccccd    # 1.1f

    .line 87
    .line 88
    .line 89
    cmpl-float p4, p5, p4

    .line 90
    .line 91
    if-lez p4, :cond_1

    .line 92
    .line 93
    invoke-virtual {p1, p5}, Lv/fresco/photodraweeview/PhotoDraweeView;->setDoubleTapScale(F)V

    .line 94
    .line 95
    .line 96
    :cond_1
    invoke-virtual {p1}, Lv/fresco/photodraweeview/PhotoDraweeView;->getMaximumScale()F

    .line 97
    .line 98
    .line 99
    move-result p4

    .line 100
    cmpl-float p4, p5, p4

    .line 101
    .line 102
    if-lez p4, :cond_2

    .line 103
    .line 104
    invoke-virtual {p1}, Lv/fresco/photodraweeview/PhotoDraweeView;->getMaximumScale()F

    .line 105
    .line 106
    .line 107
    move-result p5

    .line 108
    :cond_2
    const/4 p4, 0x1

    .line 109
    const/4 p6, 0x0

    .line 110
    invoke-virtual {p1, p5, p6, p6, p4}, Lv/fresco/photodraweeview/PhotoDraweeView;->v(FFFZ)V

    .line 111
    .line 112
    .line 113
    :cond_3
    invoke-static {p1}, Ll/fsb0;->d0(Lv/fresco/photodraweeview/PhotoDraweeView;)Z

    .line 114
    .line 115
    .line 116
    move-result p4

    .line 117
    if-eqz p4, :cond_4

    .line 118
    .line 119
    if-eqz p2, :cond_4

    .line 120
    .line 121
    invoke-virtual {p0, p3}, Ll/fsb0;->Z(Lcom/p1/mobile/putong/data/Picture$ImageUri;)Ljava/io/File;

    .line 122
    .line 123
    .line 124
    move-result-object p3

    .line 125
    if-eqz p3, :cond_4

    .line 126
    .line 127
    new-instance p4, Ll/urb0;

    .line 128
    .line 129
    invoke-direct {p4, p0, p2, p1, p3}, Ll/urb0;-><init>(Ll/fsb0;Lv/fresco/subscaleview/SubsamplingScaleImageView;Lv/fresco/photodraweeview/PhotoDraweeView;Ljava/io/File;)V

    .line 130
    .line 131
    .line 132
    invoke-static {p4}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 133
    .line 134
    .line 135
    :cond_4
    return-void
.end method

.method public final h0(Lv/VDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/io/InputStream;II)V
    .locals 6

    .line 1
    :try_start_0
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Picture$ImageUri;->orignalDimen:Lcom/p1/mobile/putong/data/Dimension;

    .line 2
    .line 3
    iget v1, v0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 4
    .line 5
    iget v0, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 6
    .line 7
    div-int/2addr v1, v0

    .line 8
    int-to-float v0, v1

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {p3, v1}, Landroid/graphics/BitmapRegionDecoder;->newInstance(Ljava/io/InputStream;Z)Landroid/graphics/BitmapRegionDecoder;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Landroid/graphics/BitmapRegionDecoder;->getWidth()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-virtual {v1}, Landroid/graphics/BitmapRegionDecoder;->getHeight()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    new-instance v4, Landroid/graphics/Rect;

    .line 23
    .line 24
    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    .line 25
    .line 26
    .line 27
    int-to-float p4, p4

    .line 28
    int-to-float p5, p5

    .line 29
    div-float/2addr p4, p5

    .line 30
    const/high16 p5, 0x3f800000    # 1.0f

    .line 31
    .line 32
    cmpl-float v5, v0, p5

    .line 33
    .line 34
    if-lez v5, :cond_0

    .line 35
    .line 36
    iput v2, v4, Landroid/graphics/Rect;->right:I

    .line 37
    .line 38
    int-to-float v0, v2

    .line 39
    div-float/2addr v0, p4

    .line 40
    float-to-int p4, v0

    .line 41
    iput p4, v4, Landroid/graphics/Rect;->bottom:I

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catchall_0
    move-exception p0

    .line 45
    goto :goto_1

    .line 46
    :cond_0
    cmpg-float v0, v0, p5

    .line 47
    .line 48
    if-gez v0, :cond_1

    .line 49
    .line 50
    int-to-float v0, v3

    .line 51
    mul-float/2addr v0, p4

    .line 52
    float-to-int p4, v0

    .line 53
    iput p4, v4, Landroid/graphics/Rect;->right:I

    .line 54
    .line 55
    iput v3, v4, Landroid/graphics/Rect;->bottom:I

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    iput v2, v4, Landroid/graphics/Rect;->right:I

    .line 59
    .line 60
    iput v3, v4, Landroid/graphics/Rect;->bottom:I

    .line 61
    .line 62
    :goto_0
    const/4 p4, 0x0

    .line 63
    invoke-virtual {v1, v4, p4}, Landroid/graphics/BitmapRegionDecoder;->decodeRegion(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 64
    .line 65
    .line 66
    move-result-object p4

    .line 67
    invoke-virtual {p1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Ll/wlj;

    .line 72
    .line 73
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    .line 74
    .line 75
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-direct {v1, v2, p4}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 80
    .line 81
    .line 82
    const/4 p4, 0x1

    .line 83
    invoke-virtual {v0, v1, p5, p4}, Ll/wlj;->f(Landroid/graphics/drawable/Drawable;FZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 84
    .line 85
    .line 86
    invoke-static {p3}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :catch_0
    :try_start_1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    invoke-virtual {p0, p1, p2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 95
    .line 96
    .line 97
    invoke-static {p3}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :goto_1
    invoke-static {p3}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 102
    .line 103
    .line 104
    throw p0
.end method

.method public i0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ll/q3d0;

    .line 2
    .line 3
    sget v1, Ll/sim;->n:I

    .line 4
    .line 5
    invoke-direct {v0, v1, v1}, Ll/q3d0;-><init>(II)V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {p0, p1, p2, v0, v1}, Ll/fsb0;->j0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/q3d0;Landroid/graphics/Bitmap$Config;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public j0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/q3d0;Landroid/graphics/Bitmap$Config;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Ll/am2;->n(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2, p3}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->O(Ll/q3d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 8
    .line 9
    .line 10
    :cond_0
    if-eqz p4, :cond_1

    .line 11
    .line 12
    invoke-static {}, Ll/phm;->b()Ll/qhm;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    invoke-virtual {p3, p4}, Ll/qhm;->p(Landroid/graphics/Bitmap$Config;)Ll/qhm;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    invoke-virtual {p3}, Ll/qhm;->a()Ll/phm;

    .line 21
    .line 22
    .line 23
    move-result-object p3

    .line 24
    invoke-virtual {p2, p3}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->G(Ll/phm;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 25
    .line 26
    .line 27
    :cond_1
    invoke-static {}, Ll/qmd0;->e()Ll/qmd0;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    invoke-virtual {p2, p3}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->Q(Ll/qmd0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p2}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    new-instance p3, Ll/wrb0;

    .line 39
    .line 40
    invoke-direct {p3, p1}, Ll/wrb0;-><init>(Lcom/facebook/drawee/view/SimpleDraweeView;)V

    .line 41
    .line 42
    .line 43
    const/4 p4, 0x0

    .line 44
    invoke-static {p4, p3}, Ll/fn2;->i(Ll/fn2;Ll/a30;)Ll/fn2;

    .line 45
    .line 46
    .line 47
    move-result-object p3

    .line 48
    invoke-virtual {p0, p1}, Ll/am2;->g(Lcom/facebook/drawee/view/DraweeView;)Ll/lq70;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0, p2}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->C(Ljava/lang/Object;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Ll/lq70;

    .line 57
    .line 58
    new-instance p2, Ll/am2$b;

    .line 59
    .line 60
    invoke-direct {p2, p3}, Ll/am2$b;-><init>(Ll/fn2;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, p2}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->B(Ll/v36;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    check-cast p0, Ll/lq70;

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->c()Ll/c7;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p1, p0}, Lcom/facebook/drawee/view/DraweeView;->setController(Ll/lde;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public k0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/fsb0;->l0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/fn2;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public l0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/fn2;)V
    .locals 4

    .line 1
    invoke-virtual {p0, p2}, Ll/am2;->n(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->L(Z)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v2, Ll/q3d0;

    .line 11
    .line 12
    sget v3, Ll/sim;->n:I

    .line 13
    .line 14
    invoke-direct {v2, v3, v3}, Ll/q3d0;-><init>(II)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v2}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->O(Ll/q3d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {}, Ll/bnl0;->y0()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    div-int/lit8 v2, v2, 0x4

    .line 30
    .line 31
    invoke-virtual {p0, p2}, Ll/am2;->n(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    new-instance v3, Ll/q3d0;

    .line 36
    .line 37
    invoke-direct {v3, v2, v2}, Ll/q3d0;-><init>(II)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p2, v3}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->O(Ll/q3d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-virtual {p2, v1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->z(Z)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-virtual {p2}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    new-instance v1, Ll/dsb0;

    .line 53
    .line 54
    invoke-direct {v1, p1}, Ll/dsb0;-><init>(Lcom/facebook/drawee/view/SimpleDraweeView;)V

    .line 55
    .line 56
    .line 57
    invoke-static {p3, v1}, Ll/fn2;->i(Ll/fn2;Ll/a30;)Ll/fn2;

    .line 58
    .line 59
    .line 60
    move-result-object p3

    .line 61
    invoke-virtual {p0, p1}, Ll/am2;->g(Lcom/facebook/drawee/view/DraweeView;)Ll/lq70;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0, p2}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->D(Ljava/lang/Object;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    check-cast p0, Ll/lq70;

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->C(Ljava/lang/Object;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    check-cast p0, Ll/lq70;

    .line 76
    .line 77
    new-instance p2, Ll/am2$b;

    .line 78
    .line 79
    invoke-direct {p2, p3}, Ll/am2$b;-><init>(Ll/fn2;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0, p2}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->B(Ll/v36;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    check-cast p0, Ll/lq70;

    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->c()Ll/c7;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p1, p0}, Lcom/facebook/drawee/view/DraweeView;->setController(Ll/lde;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public m0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    div-int/lit8 v0, v0, 0x4

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Ll/am2;->n(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    new-instance v1, Ll/q3d0;

    .line 12
    .line 13
    invoke-direct {v1, v0, v0}, Ll/q3d0;-><init>(II)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p2, v1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->O(Ll/q3d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    const/4 v0, 0x1

    .line 21
    invoke-virtual {p2, v0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->z(Z)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p2}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {p0, p1}, Ll/am2;->g(Lcom/facebook/drawee/view/DraweeView;)Ll/lq70;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0, p2}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->C(Ljava/lang/Object;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Ll/lq70;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->c()Ll/c7;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p1, p0}, Lcom/facebook/drawee/view/DraweeView;->setController(Ll/lde;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final n0(Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;
    .locals 8

    .line 1
    invoke-virtual {p0, p2}, Ll/am2;->n(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget v0, p1, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatType:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    if-ne v0, v1, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/fsb0;->c0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    new-instance p0, Ll/sim;

    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v0}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-direct {p0, v0}, Ll/sim;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    new-instance v1, Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 28
    .line 29
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    .line 30
    .line 31
    new-instance v3, Lcom/p1/mobile/putong/data/Dimension;

    .line 32
    .line 33
    iget-object p0, p0, Ll/sim;->d:[I

    .line 34
    .line 35
    invoke-direct {v3, p0}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 36
    .line 37
    .line 38
    iget-object v4, p1, Lcom/p1/mobile/putong/data/Picture$ImageUri;->fileType:Ljava/lang/String;

    .line 39
    .line 40
    iget v5, p1, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatType:I

    .line 41
    .line 42
    iget v6, p1, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatWidth:I

    .line 43
    .line 44
    iget-boolean v7, p1, Lcom/p1/mobile/putong/data/Picture$ImageUri;->isLocal:Z

    .line 45
    .line 46
    invoke-direct/range {v1 .. v7}, Lcom/p1/mobile/putong/data/Picture$ImageUri;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/Dimension;Ljava/lang/String;IIZ)V

    .line 47
    .line 48
    .line 49
    move-object p1, v1

    .line 50
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Picture$ImageUri;->orignalDimen:Lcom/p1/mobile/putong/data/Dimension;

    .line 51
    .line 52
    iget p0, p0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 53
    .line 54
    if-lez p0, :cond_2

    .line 55
    .line 56
    new-instance p0, Ll/q3d0;

    .line 57
    .line 58
    iget v0, p1, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatWidth:I

    .line 59
    .line 60
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Picture$ImageUri;->orignalDimen:Lcom/p1/mobile/putong/data/Dimension;

    .line 61
    .line 62
    iget v1, p1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 63
    .line 64
    mul-int/2addr v1, v0

    .line 65
    iget p1, p1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 66
    .line 67
    div-int/2addr v1, p1

    .line 68
    invoke-direct {p0, v0, v1}, Ll/q3d0;-><init>(II)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p2, p0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->O(Ll/q3d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0

    .line 76
    :cond_1
    const/4 p0, 0x2

    .line 77
    if-ne v0, p0, :cond_2

    .line 78
    .line 79
    new-instance p0, Ll/q3d0;

    .line 80
    .line 81
    iget p1, p1, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatWidth:I

    .line 82
    .line 83
    invoke-direct {p0, p1, p1}, Ll/q3d0;-><init>(II)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p2, p0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->O(Ll/q3d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    return-object p0

    .line 91
    :cond_2
    return-object p2
.end method

.method public p0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)Ll/i6c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Picture$ImageUri;",
            ")",
            "Ll/i6c<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/facebook/imagepipeline/common/Priority;->MEDIUM:Lcom/facebook/imagepipeline/common/Priority;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, p1, v0, v1, v1}, Ll/fsb0;->q0(Lcom/p1/mobile/putong/data/Picture$ImageUri;Lcom/facebook/imagepipeline/common/Priority;Ljava/lang/String;Ll/j2d0;)Ll/i6c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public q0(Lcom/p1/mobile/putong/data/Picture$ImageUri;Lcom/facebook/imagepipeline/common/Priority;Ljava/lang/String;Ll/j2d0;)Ll/i6c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Picture$ImageUri;",
            "Lcom/facebook/imagepipeline/common/Priority;",
            "Ljava/lang/String;",
            "Ll/j2d0;",
            ")",
            "Ll/i6c<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0, p3}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->X(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-virtual {p0, p1}, Ll/fsb0;->X0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1, p2}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->N(Lcom/facebook/imagepipeline/common/Priority;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1, p4}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->M(Ll/j2d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object p0, p0, Ll/am2;->a:Ll/rjm;

    .line 33
    .line 34
    const/4 p2, 0x0

    .line 35
    invoke-virtual {p0, p1, p2}, Ll/rjm;->w(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;)Ll/i6c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public r0(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0, p1}, Ll/am2;->n(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget-object v0, Lcom/facebook/imagepipeline/common/Priority;->MEDIUM:Lcom/facebook/imagepipeline/common/Priority;

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->N(Lcom/facebook/imagepipeline/common/Priority;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object p0, p0, Ll/am2;->a:Ll/rjm;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-virtual {p0, p1, v0}, Ll/rjm;->w(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;)Ll/i6c;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public s0(Lcom/p1/mobile/putong/data/Picture$ImageUri;Lcom/facebook/imagepipeline/common/Priority;Ljava/lang/String;Ll/j2d0;)Ll/i6c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Picture$ImageUri;",
            "Lcom/facebook/imagepipeline/common/Priority;",
            "Ljava/lang/String;",
            "Ll/j2d0;",
            ")",
            "Ll/i6c<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0, p3}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->X(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-virtual {p0, p1}, Ll/fsb0;->X0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1, p2}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->N(Lcom/facebook/imagepipeline/common/Priority;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1, p4}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->M(Ll/j2d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object p0, p0, Ll/am2;->a:Ll/rjm;

    .line 33
    .line 34
    const/4 p2, 0x0

    .line 35
    invoke-virtual {p0, p1, p2}, Ll/rjm;->u(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;)Ll/i6c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public t0(Lcom/p1/mobile/putong/data/Picture$ImageUri;Lcom/facebook/imagepipeline/common/Priority;Ljava/lang/String;Ll/j2d0;Z)Ll/i6c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Picture$ImageUri;",
            "Lcom/facebook/imagepipeline/common/Priority;",
            "Ljava/lang/String;",
            "Ll/j2d0;",
            "Z)",
            "Ll/i6c<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 1
    if-eqz p5, :cond_0

    .line 2
    .line 3
    const/4 p5, 0x3

    .line 4
    iput p5, p1, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatType:I

    .line 5
    .line 6
    :cond_0
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result p5

    .line 10
    if-nez p5, :cond_1

    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p5

    .line 18
    invoke-static {p5, p3}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->X(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    invoke-virtual {p0, p1}, Ll/fsb0;->X0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1, p2}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->N(Lcom/facebook/imagepipeline/common/Priority;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1, p4}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->M(Ll/j2d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iget-object p0, p0, Ll/am2;->a:Ll/rjm;

    .line 38
    .line 39
    const/4 p2, 0x0

    .line 40
    invoke-virtual {p0, p1, p2}, Ll/rjm;->u(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;)Ll/i6c;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public u0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/facebook/imagepipeline/common/Priority;->MEDIUM:Lcom/facebook/imagepipeline/common/Priority;

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Ll/fsb0;->v0(Lcom/p1/mobile/putong/data/Picture$ImageUri;Lcom/facebook/imagepipeline/common/Priority;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v0(Lcom/p1/mobile/putong/data/Picture$ImageUri;Lcom/facebook/imagepipeline/common/Priority;)V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, v0}, Ll/fsb0;->w0(Lcom/p1/mobile/putong/data/Picture$ImageUri;Lcom/facebook/imagepipeline/common/Priority;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public w0(Lcom/p1/mobile/putong/data/Picture$ImageUri;Lcom/facebook/imagepipeline/common/Priority;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/fsb0;->s0(Lcom/p1/mobile/putong/data/Picture$ImageUri;Lcom/facebook/imagepipeline/common/Priority;Ljava/lang/String;Ll/j2d0;)Ll/i6c;

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public x0(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/facebook/imagepipeline/common/Priority;->MEDIUM:Lcom/facebook/imagepipeline/common/Priority;

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Ll/fsb0;->y0(Ljava/lang/String;Lcom/facebook/imagepipeline/common/Priority;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public y0(Ljava/lang/String;Lcom/facebook/imagepipeline/common/Priority;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/am2;->n(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1, p2}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->N(Lcom/facebook/imagepipeline/common/Priority;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object p0, p0, Ll/am2;->a:Ll/rjm;

    .line 14
    .line 15
    const/4 p2, 0x0

    .line 16
    invoke-virtual {p0, p1, p2}, Ll/rjm;->u(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;)Ll/i6c;

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public z0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/kl40;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/fsb0;->p0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)Ll/i6c;

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0, p1}, Ll/fsb0;->u0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
