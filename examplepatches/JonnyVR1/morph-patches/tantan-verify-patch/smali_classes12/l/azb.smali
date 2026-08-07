.class public Ll/azb;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/azb$a;
    }
.end annotation


# static fields
.field private static b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static c:Lcom/idv/identity/platform/config/FaceConfig;

.field public static d:Lcom/idv/identity/platform/config/OCRConfig;


# instance fields
.field private a:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/idv/identity/platform/config/FaceConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/idv/identity/platform/config/FaceConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/azb;->c:Lcom/idv/identity/platform/config/FaceConfig;

    .line 7
    .line 8
    new-instance v0, Lcom/idv/identity/platform/config/OCRConfig;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/idv/identity/platform/config/OCRConfig;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/azb;->a:Z

    .line 6
    .line 7
    return-void
.end method

.method public static a(Lcom/idv/identity/platform/IdentityAlertOverlay;Ll/azb$a;)V
    .locals 2

    .line 1
    iget v0, p1, Ll/azb$a;->a:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v1, v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setTitleColor(I)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget v0, p1, Ll/azb$a;->b:I

    .line 10
    .line 11
    if-eq v1, v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setMsgColor(I)V

    .line 14
    .line 15
    .line 16
    :cond_1
    iget v0, p1, Ll/azb$a;->c:I

    .line 17
    .line 18
    if-eq v1, v0, :cond_2

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setConfirmColor(I)V

    .line 21
    .line 22
    .line 23
    :cond_2
    iget p1, p1, Ll/azb$a;->d:I

    .line 24
    .line 25
    if-eq v1, p1, :cond_3

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setCancelColor(I)V

    .line 28
    .line 29
    .line 30
    :cond_3
    return-void
.end method

.method public static b(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-static {p0, v0}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    array-length v1, p0

    .line 7
    invoke-static {p0, v0, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    return-object p0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p0}, Lcom/idv/identity/platform/log/RecordService;->recordException(Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method public static c(Lcom/alibaba/fastjson/JSONObject;Ljava/lang/String;Ljava/lang/StringBuilder;)Z
    .locals 4

    .line 1
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 6
    .line 7
    .line 8
    move-result-wide v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    const-wide/16 v2, 0x0

    .line 10
    .line 11
    cmpl-double p0, v0, v2

    .line 12
    .line 13
    if-ltz p0, :cond_0

    .line 14
    .line 15
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 16
    .line 17
    cmpg-double p0, v0, v2

    .line 18
    .line 19
    if-gtz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :catchall_0
    :cond_0
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string p0, "illegal.\n"

    .line 27
    .line 28
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public static d(Lcom/alibaba/fastjson/JSONObject;Ljava/lang/String;Ljava/lang/StringBuilder;)Z
    .locals 2

    .line 1
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    sget-object v0, Ll/azb;->b:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :catchall_0
    :cond_1
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string p0, " Image base64 format is not supported.\n"

    .line 41
    .line 42
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const/4 p0, 0x0

    .line 46
    return p0
.end method

.method public static e(Lcom/alibaba/fastjson/JSONObject;Ljava/lang/String;Ljava/lang/StringBuilder;)Z
    .locals 0

    .line 1
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :catchall_0
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p0, "illegal.\n"

    .line 14
    .line 15
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public static f()Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    sget-object v0, Ll/azb;->c:Lcom/idv/identity/platform/config/FaceConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/idv/identity/platform/config/FaceConfig;->getExitIconBase64()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/azb;->r(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method public static g()Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    sget-object v0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/idv/identity/platform/config/OCRConfig;->getAlbumBase64()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/azb;->r(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method public static h()Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    sget-object v0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/idv/identity/platform/config/OCRConfig;->getAutoScanBase64()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/azb;->r(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method public static i()Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    sget-object v0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrResultTipIconBase64()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/azb;->r(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method public static j()Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    sget-object v0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrResultExitIconBase64()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/azb;->r(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method public static k()Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    sget-object v0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/idv/identity/platform/config/OCRConfig;->getFloodLightBase64()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/azb;->r(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method public static l()Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    sget-object v0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrGuideExitIconBase64()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/azb;->r(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method public static m()Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    sget-object v0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/idv/identity/platform/config/OCRConfig;->getExitIconBase64()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/azb;->r(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method public static n()Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    sget-object v0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/idv/identity/platform/config/OCRConfig;->getSubmitBase64()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/azb;->r(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method public static o()Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    sget-object v0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/idv/identity/platform/config/OCRConfig;->getTakePhotoBase64()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/azb;->r(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method public static p()Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    sget-object v0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/idv/identity/platform/config/OCRConfig;->getTakeShootBase64()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/azb;->r(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method public static q()Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    sget-object v0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/idv/identity/platform/config/OCRConfig;->getUnFloodLightBase64()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/azb;->r(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method public static r(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 3

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    const-string v0, ","

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    array-length v1, v0

    .line 14
    const/4 v2, 0x1

    .line 15
    if-le v1, v2, :cond_0

    .line 16
    .line 17
    aget-object p0, v0, v2

    .line 18
    .line 19
    :cond_0
    invoke-static {p0}, Ll/azb;->b(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_1
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method

.method public static s(Ljava/lang/String;)Ll/azb$a;
    .locals 5

    .line 1
    new-instance v0, Ll/azb$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/azb$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Ll/dfm;->f:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    sget-object p0, Ll/azb;->c:Lcom/idv/identity/platform/config/FaceConfig;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/idv/identity/platform/config/FaceConfig;->getDialogExitConfig()Ll/azb$a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_0
    sget-object v1, Ll/dfm;->l:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    sget-object p0, Ll/azb;->c:Lcom/idv/identity/platform/config/FaceConfig;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/idv/identity/platform/config/FaceConfig;->getDialogTooManyRetriesConfig()Ll/azb$a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0

    .line 36
    :cond_1
    const-string v1, "CODE_OVER_TIME"

    .line 37
    .line 38
    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_2

    .line 43
    .line 44
    sget-object p0, Ll/azb;->c:Lcom/idv/identity/platform/config/FaceConfig;

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/idv/identity/platform/config/FaceConfig;->getDialogTimeOutConfig()Ll/azb$a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :cond_2
    sget-object v1, Ll/dfm;->c:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    const-string v2, "TAG"

    .line 58
    .line 59
    if-nez v1, :cond_6

    .line 60
    .line 61
    sget-object v1, Ll/dfm;->e:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-nez v1, :cond_6

    .line 68
    .line 69
    sget-object v1, Ll/dfm;->d:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_3

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_3
    sget-object v1, Ll/dfm;->g:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    if-nez v1, :cond_5

    .line 85
    .line 86
    sget-object v1, Ll/dfm;->i:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    if-nez v1, :cond_5

    .line 93
    .line 94
    sget-object v1, Ll/dfm;->j:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    if-eqz p0, :cond_4

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_4
    return-object v0

    .line 104
    :cond_5
    :goto_0
    const-string p0, "The system does not support facial recognition"

    .line 105
    .line 106
    invoke-static {v2, p0}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    sget-object p0, Ll/azb;->c:Lcom/idv/identity/platform/config/FaceConfig;

    .line 110
    .line 111
    invoke-virtual {p0}, Lcom/idv/identity/platform/config/FaceConfig;->getDialogCamOpenFailedConfig()Ll/azb$a;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    return-object p0

    .line 116
    :cond_6
    :goto_1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 121
    .line 122
    const-string v3, "errCode"

    .line 123
    .line 124
    filled-new-array {v3, p0}, [Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    const-string v4, "SYSTEM_ERROR"

    .line 129
    .line 130
    invoke-virtual {v0, v1, v4, v3}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    const-string v0, "System exception  errCode+"

    .line 134
    .line 135
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-static {v2, p0}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    sget-object p0, Ll/azb;->c:Lcom/idv/identity/platform/config/FaceConfig;

    .line 143
    .line 144
    invoke-virtual {p0}, Lcom/idv/identity/platform/config/FaceConfig;->getDialogSDKErrConfig()Ll/azb$a;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    return-object p0
.end method

.method public static t(Ljava/lang/String;)Ll/azb$a;
    .locals 2

    .line 1
    new-instance v0, Ll/azb$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/azb$a;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "ocr_failed_code"

    .line 7
    .line 8
    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    sget-object p0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrDialogFailConfig()Ll/azb$a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_0
    const-string v1, "ocr_over_time_code"

    .line 22
    .line 23
    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    sget-object p0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrDialogTimeOutConfig()Ll/azb$a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0

    .line 36
    :cond_1
    const-string v1, "ocr_exit_code"

    .line 37
    .line 38
    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_2

    .line 43
    .line 44
    sget-object p0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrDialogExitConfig()Ll/azb$a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :cond_2
    const-string v1, "ocr_network_error_code"

    .line 52
    .line 53
    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_3

    .line 58
    .line 59
    sget-object p0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrDialogNTErrorConfig()Ll/azb$a;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0

    .line 66
    :cond_3
    const-string v1, "ocr_out_time_code"

    .line 67
    .line 68
    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    if-eqz v1, :cond_4

    .line 73
    .line 74
    sget-object p0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrDialogRestrictionConfig()Ll/azb$a;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    return-object p0

    .line 81
    :cond_4
    const-string v1, "ocr_msg_error_code"

    .line 82
    .line 83
    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-eqz v1, :cond_5

    .line 88
    .line 89
    sget-object p0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrDialogMessageErrorConfig()Ll/azb$a;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    return-object p0

    .line 96
    :cond_5
    const-string v1, "OCR_PERM_ERROR_CODE"

    .line 97
    .line 98
    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    if-eqz v1, :cond_6

    .line 103
    .line 104
    sget-object p0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 105
    .line 106
    invoke-virtual {p0}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrDialogPermissionGrantedConfig()Ll/azb$a;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    return-object p0

    .line 111
    :cond_6
    const-string v1, "OCR_TYPE_ERROR_CODE"

    .line 112
    .line 113
    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    if-eqz v1, :cond_7

    .line 118
    .line 119
    sget-object p0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 120
    .line 121
    invoke-virtual {p0}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrDialogTypeErrorConfig()Ll/azb$a;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    return-object p0

    .line 126
    :cond_7
    const-string v1, "ORC_RES_PAGE_EXIT_CODE"

    .line 127
    .line 128
    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    if-eqz v1, :cond_8

    .line 133
    .line 134
    sget-object p0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 135
    .line 136
    invoke-virtual {p0}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrDialogResultExitConfig()Ll/azb$a;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    return-object p0

    .line 141
    :cond_8
    const-string v1, "ORC_RES_PAGE_NET_ERROR_CODE"

    .line 142
    .line 143
    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    if-eqz v1, :cond_9

    .line 148
    .line 149
    sget-object p0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 150
    .line 151
    invoke-virtual {p0}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrDialogResultNetErrorConfig()Ll/azb$a;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    return-object p0

    .line 156
    :cond_9
    const-string v1, "ORC_RES_PAGE_INFO_EMPTY_CODE"

    .line 157
    .line 158
    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 159
    .line 160
    .line 161
    move-result p0

    .line 162
    if-eqz p0, :cond_a

    .line 163
    .line 164
    sget-object p0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 165
    .line 166
    invoke-virtual {p0}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrDialogResultInfoEmptyConfig()Ll/azb$a;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    return-object p0

    .line 171
    :cond_a
    return-object v0
.end method

.method public static u(ILjava/lang/String;)Lcom/idv/identity/platform/config/CustomUIConfig;
    .locals 12

    .line 1
    const-string v0, "paramType:"

    .line 2
    .line 3
    const-string v1, "under assets directory"

    .line 4
    .line 5
    sget v2, Ll/h8c0;->b:I

    .line 6
    .line 7
    invoke-static {v2}, Ll/z4d0;->e(I)[Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    sput-object v2, Ll/azb;->b:Ljava/util/List;

    .line 16
    .line 17
    new-instance v2, Lcom/idv/identity/platform/config/CustomUIConfig;

    .line 18
    .line 19
    invoke-direct {v2}, Lcom/idv/identity/platform/config/CustomUIConfig;-><init>()V

    .line 20
    .line 21
    .line 22
    const/4 v3, 0x1

    .line 23
    if-ne v3, p0, :cond_1

    .line 24
    .line 25
    :try_start_0
    invoke-static {}, Lcom/idv/identity/platform/api/IdentityPlatform;->getInstance()Lcom/idv/identity/platform/api/IdentityPlatform;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Lcom/idv/identity/platform/api/IdentityPlatform;->getCtx()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    if-nez p0, :cond_0

    .line 42
    .line 43
    new-instance p0, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string p1, "File does not exist"

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {v2, p0}, Lcom/idv/identity/platform/config/CustomUIConfig;->setErrMsg(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return-object v2

    .line 64
    :catchall_0
    move-exception p0

    .line 65
    goto/16 :goto_8

    .line 66
    .line 67
    :cond_0
    invoke-static {p0}, Ll/bvm;->a(Ljava/io/InputStream;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    goto :goto_0

    .line 72
    :cond_1
    if-nez p0, :cond_11

    .line 73
    .line 74
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    .line 78
    .line 79
    new-instance v0, Lcom/alibaba/fastjson/JSONObject;

    .line 80
    .line 81
    invoke-direct {v0}, Lcom/alibaba/fastjson/JSONObject;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    .line 83
    .line 84
    const/4 v0, 0x0

    .line 85
    :try_start_1
    invoke-static {p1}, Lcom/alibaba/fastjson/JSON;->parseObject(Ljava/lang/String;)Lcom/alibaba/fastjson/JSONObject;

    .line 86
    .line 87
    .line 88
    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 89
    if-eqz p1, :cond_10

    .line 90
    .line 91
    :try_start_2
    const-class v1, Lcom/idv/identity/platform/config/CustomUIConfig;

    .line 92
    .line 93
    invoke-static {p1, v1}, Lcom/alibaba/fastjson/JSON;->toJavaObject(Lcom/alibaba/fastjson/JSON;Ljava/lang/Class;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    check-cast v1, Lcom/idv/identity/platform/config/CustomUIConfig;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 98
    .line 99
    :try_start_3
    invoke-virtual {v1}, Lcom/idv/identity/platform/config/CustomUIConfig;->getOcrConfig()Lcom/idv/identity/platform/config/OCRConfig;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    if-eqz v2, :cond_2

    .line 104
    .line 105
    invoke-virtual {v1}, Lcom/idv/identity/platform/config/CustomUIConfig;->getOcrConfig()Lcom/idv/identity/platform/config/OCRConfig;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    sput-object v2, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 110
    .line 111
    goto :goto_1

    .line 112
    :catchall_1
    move-exception p1

    .line 113
    move-object v2, v1

    .line 114
    goto/16 :goto_6

    .line 115
    .line 116
    :cond_2
    :goto_1
    invoke-virtual {v1}, Lcom/idv/identity/platform/config/CustomUIConfig;->getFaceConfig()Lcom/idv/identity/platform/config/FaceConfig;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    if-eqz v2, :cond_3

    .line 121
    .line 122
    invoke-virtual {v1}, Lcom/idv/identity/platform/config/CustomUIConfig;->getFaceConfig()Lcom/idv/identity/platform/config/FaceConfig;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    sput-object v2, Ll/azb;->c:Lcom/idv/identity/platform/config/FaceConfig;

    .line 127
    .line 128
    :cond_3
    const-string v2, "faceConfig"

    .line 129
    .line 130
    invoke-virtual {p1, v2}, Lcom/alibaba/fastjson/JSONObject;->getJSONObject(Ljava/lang/String;)Lcom/alibaba/fastjson/JSONObject;

    .line 131
    .line 132
    .line 133
    move-result-object v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 134
    const-string v3, "Base64"

    .line 135
    .line 136
    const-string v4, "Alpha"

    .line 137
    .line 138
    const-string v5, "Color"

    .line 139
    .line 140
    const-string v6, "no match.\n"

    .line 141
    .line 142
    if-eqz v2, :cond_9

    .line 143
    .line 144
    :try_start_4
    const-class v7, Lcom/idv/identity/platform/config/FaceConfig;

    .line 145
    .line 146
    invoke-virtual {v7}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    .line 147
    .line 148
    .line 149
    move-result-object v7

    .line 150
    new-instance v8, Ljava/util/ArrayList;

    .line 151
    .line 152
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 153
    .line 154
    .line 155
    array-length v9, v7

    .line 156
    move v10, v0

    .line 157
    :goto_2
    if-ge v10, v9, :cond_4

    .line 158
    .line 159
    aget-object v11, v7, v10

    .line 160
    .line 161
    invoke-virtual {v11}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v11

    .line 165
    invoke-interface {v8, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    add-int/lit8 v10, v10, 0x1

    .line 169
    .line 170
    goto :goto_2

    .line 171
    :cond_4
    invoke-virtual {v2}, Lcom/alibaba/fastjson/JSONObject;->keySet()Ljava/util/Set;

    .line 172
    .line 173
    .line 174
    move-result-object v7

    .line 175
    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 176
    .line 177
    .line 178
    move-result-object v7

    .line 179
    :cond_5
    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 180
    .line 181
    .line 182
    move-result v9

    .line 183
    if-eqz v9, :cond_9

    .line 184
    .line 185
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object v9

    .line 189
    check-cast v9, Ljava/lang/String;

    .line 190
    .line 191
    invoke-interface {v8, v9}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    move-result v10

    .line 195
    if-nez v10, :cond_6

    .line 196
    .line 197
    new-instance v10, Ljava/lang/StringBuilder;

    .line 198
    .line 199
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 200
    .line 201
    .line 202
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v10

    .line 212
    invoke-virtual {p0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    :cond_6
    invoke-virtual {v9, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 216
    .line 217
    .line 218
    move-result v10

    .line 219
    if-eqz v10, :cond_7

    .line 220
    .line 221
    invoke-static {v2, v9, p0}, Ll/azb;->e(Lcom/alibaba/fastjson/JSONObject;Ljava/lang/String;Ljava/lang/StringBuilder;)Z

    .line 222
    .line 223
    .line 224
    :cond_7
    invoke-virtual {v9, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 225
    .line 226
    .line 227
    move-result v10

    .line 228
    if-eqz v10, :cond_8

    .line 229
    .line 230
    invoke-static {v2, v9, p0}, Ll/azb;->c(Lcom/alibaba/fastjson/JSONObject;Ljava/lang/String;Ljava/lang/StringBuilder;)Z

    .line 231
    .line 232
    .line 233
    :cond_8
    invoke-virtual {v9, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 234
    .line 235
    .line 236
    move-result v10

    .line 237
    if-eqz v10, :cond_5

    .line 238
    .line 239
    invoke-static {v2, v9, p0}, Ll/azb;->d(Lcom/alibaba/fastjson/JSONObject;Ljava/lang/String;Ljava/lang/StringBuilder;)Z

    .line 240
    .line 241
    .line 242
    goto :goto_3

    .line 243
    :cond_9
    new-instance v2, Ljava/util/ArrayList;

    .line 244
    .line 245
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 246
    .line 247
    .line 248
    const-string v2, "ocrConfig"

    .line 249
    .line 250
    invoke-virtual {p1, v2}, Lcom/alibaba/fastjson/JSONObject;->getJSONObject(Ljava/lang/String;)Lcom/alibaba/fastjson/JSONObject;

    .line 251
    .line 252
    .line 253
    move-result-object p1

    .line 254
    if-eqz p1, :cond_f

    .line 255
    .line 256
    const-class v2, Lcom/idv/identity/platform/config/OCRConfig;

    .line 257
    .line 258
    invoke-virtual {v2}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    .line 259
    .line 260
    .line 261
    move-result-object v2

    .line 262
    new-instance v7, Ljava/util/ArrayList;

    .line 263
    .line 264
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 265
    .line 266
    .line 267
    array-length v8, v2

    .line 268
    :goto_4
    if-ge v0, v8, :cond_a

    .line 269
    .line 270
    aget-object v9, v2, v0

    .line 271
    .line 272
    invoke-virtual {v9}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v9

    .line 276
    invoke-interface {v7, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 277
    .line 278
    .line 279
    add-int/lit8 v0, v0, 0x1

    .line 280
    .line 281
    goto :goto_4

    .line 282
    :cond_a
    invoke-virtual {p1}, Lcom/alibaba/fastjson/JSONObject;->keySet()Ljava/util/Set;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 287
    .line 288
    .line 289
    move-result-object v0

    .line 290
    :cond_b
    :goto_5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 291
    .line 292
    .line 293
    move-result v2

    .line 294
    if-eqz v2, :cond_f

    .line 295
    .line 296
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 297
    .line 298
    .line 299
    move-result-object v2

    .line 300
    check-cast v2, Ljava/lang/String;

    .line 301
    .line 302
    invoke-interface {v7, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 303
    .line 304
    .line 305
    move-result v8

    .line 306
    if-nez v8, :cond_c

    .line 307
    .line 308
    new-instance v8, Ljava/lang/StringBuilder;

    .line 309
    .line 310
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 311
    .line 312
    .line 313
    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 314
    .line 315
    .line 316
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 317
    .line 318
    .line 319
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v8

    .line 323
    invoke-virtual {p0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 324
    .line 325
    .line 326
    :cond_c
    invoke-virtual {v2, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 327
    .line 328
    .line 329
    move-result v8

    .line 330
    if-eqz v8, :cond_d

    .line 331
    .line 332
    invoke-static {p1, v2, p0}, Ll/azb;->e(Lcom/alibaba/fastjson/JSONObject;Ljava/lang/String;Ljava/lang/StringBuilder;)Z

    .line 333
    .line 334
    .line 335
    :cond_d
    invoke-virtual {v2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 336
    .line 337
    .line 338
    move-result v8

    .line 339
    if-eqz v8, :cond_e

    .line 340
    .line 341
    invoke-static {p1, v2, p0}, Ll/azb;->c(Lcom/alibaba/fastjson/JSONObject;Ljava/lang/String;Ljava/lang/StringBuilder;)Z

    .line 342
    .line 343
    .line 344
    :cond_e
    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 345
    .line 346
    .line 347
    move-result v8

    .line 348
    if-eqz v8, :cond_b

    .line 349
    .line 350
    invoke-static {p1, v2, p0}, Ll/azb;->d(Lcom/alibaba/fastjson/JSONObject;Ljava/lang/String;Ljava/lang/StringBuilder;)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 351
    .line 352
    .line 353
    goto :goto_5

    .line 354
    :cond_f
    move-object v2, v1

    .line 355
    goto :goto_7

    .line 356
    :catchall_2
    move-exception p1

    .line 357
    goto :goto_6

    .line 358
    :cond_10
    :try_start_5
    const-string p1, "Illegal format."

    .line 359
    .line 360
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 361
    .line 362
    .line 363
    invoke-virtual {v2, v0}, Lcom/idv/identity/platform/config/CustomUIConfig;->setValid(Z)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 364
    .line 365
    .line 366
    goto :goto_7

    .line 367
    :goto_6
    :try_start_6
    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 368
    .line 369
    .line 370
    move-result-object v0

    .line 371
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 372
    .line 373
    .line 374
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 375
    .line 376
    .line 377
    move-result-object v0

    .line 378
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/log/RecordService;->recordException(Ljava/lang/Throwable;)V

    .line 379
    .line 380
    .line 381
    :goto_7
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 382
    .line 383
    .line 384
    move-result-object p0

    .line 385
    invoke-virtual {v2, p0}, Lcom/idv/identity/platform/config/CustomUIConfig;->setErrMsg(Ljava/lang/String;)V

    .line 386
    .line 387
    .line 388
    return-object v2

    .line 389
    :catchall_3
    move-exception p0

    .line 390
    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 391
    .line 392
    .line 393
    move-result-object p0

    .line 394
    invoke-virtual {v2, p0}, Lcom/idv/identity/platform/config/CustomUIConfig;->setErrMsg(Ljava/lang/String;)V

    .line 395
    .line 396
    .line 397
    invoke-virtual {v2, v0}, Lcom/idv/identity/platform/config/CustomUIConfig;->setValid(Z)V

    .line 398
    .line 399
    .line 400
    return-object v2

    .line 401
    :cond_11
    new-instance p1, Ljava/lang/StringBuilder;

    .line 402
    .line 403
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 404
    .line 405
    .line 406
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 407
    .line 408
    .line 409
    const-string p0, "Parameter type is illegal"

    .line 410
    .line 411
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 412
    .line 413
    .line 414
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 415
    .line 416
    .line 417
    move-result-object p0

    .line 418
    invoke-virtual {v2, p0}, Lcom/idv/identity/platform/config/CustomUIConfig;->setErrMsg(Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 419
    .line 420
    .line 421
    return-object v2

    .line 422
    :goto_8
    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 423
    .line 424
    .line 425
    move-result-object p0

    .line 426
    invoke-virtual {v2, p0}, Lcom/idv/identity/platform/config/CustomUIConfig;->setErrMsg(Ljava/lang/String;)V

    .line 427
    .line 428
    .line 429
    return-object v2
.end method
