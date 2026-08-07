.class public Ll/jvp0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static e:Lcom/tencent/mm/opensdk/openapi/IWXAPI;


# instance fields
.field public a:Ll/wc80;

.field public b:I

.field public c:Landroid/app/Activity;

.field public d:Ll/g3f0;


# direct methods
.method public constructor <init>(Ll/wc80;Landroid/app/Activity;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/jvp0;->d:Ll/g3f0;

    .line 6
    .line 7
    iput-object p1, p0, Ll/jvp0;->a:Ll/wc80;

    .line 8
    .line 9
    iput-object p2, p0, Ll/jvp0;->c:Landroid/app/Activity;

    .line 10
    .line 11
    instance-of p2, p1, Ll/kvp0;

    .line 12
    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    iput p1, p0, Ll/jvp0;->b:I

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    instance-of p1, p1, Ll/vvp0;

    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    iput p1, p0, Ll/jvp0;->b:I

    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public static synthetic a(Ll/jvp0;)Ll/g3f0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jvp0;->d:Ll/g3f0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ll/jvp0;Lcom/tencent/mm/opensdk/modelbase/BaseResp;Ll/g3f0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jvp0;->m(Lcom/tencent/mm/opensdk/modelbase/BaseResp;Ll/g3f0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static declared-synchronized g(Landroid/content/Context;)Lcom/tencent/mm/opensdk/openapi/IWXAPI;
    .locals 2

    .line 1
    const-class v0, Ll/jvp0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Ll/jvp0;->e:Lcom/tencent/mm/opensdk/openapi/IWXAPI;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    sget-object v1, Ll/cy5;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p0, v1}, Lcom/tencent/mm/opensdk/openapi/WXAPIFactory;->createWXAPI(Landroid/content/Context;Ljava/lang/String;)Lcom/tencent/mm/opensdk/openapi/IWXAPI;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sput-object p0, Ll/jvp0;->e:Lcom/tencent/mm/opensdk/openapi/IWXAPI;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    :goto_0
    sget-object p0, Ll/jvp0;->e:Lcom/tencent/mm/opensdk/openapi/IWXAPI;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    .line 21
    monitor-exit v0

    .line 22
    return-object p0

    .line 23
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    throw p0
.end method


# virtual methods
.method public final c()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public final d()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/jvp0;->c:Landroid/app/Activity;

    .line 2
    .line 3
    invoke-static {p0}, Ll/jvp0;->g(Landroid/content/Context;)Lcom/tencent/mm/opensdk/openapi/IWXAPI;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Lcom/tencent/mm/opensdk/openapi/IWXAPI;->getWXAppSupportAPI()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const v0, 0x27000d00

    .line 12
    .line 13
    .line 14
    if-lt p0, v0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public final e(Lcom/p1/mobile/share_sdk/content/Content;)Lcom/tencent/mm/opensdk/modelmsg/WXMediaMessage$IMediaObject;
    .locals 2
    .param p1    # Lcom/p1/mobile/share_sdk/content/Content;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-interface {p1}, Lcom/p1/mobile/share_sdk/content/Content;->getType()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/jvp0;->j(Lcom/p1/mobile/share_sdk/content/Content;)Lcom/tencent/mm/opensdk/modelmsg/WXMediaMessage$IMediaObject;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-interface {p1}, Lcom/p1/mobile/share_sdk/content/Content;->getType()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x2

    .line 18
    if-ne v0, v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/jvp0;->i(Lcom/p1/mobile/share_sdk/content/Content;)Lcom/tencent/mm/opensdk/modelmsg/WXMediaMessage$IMediaObject;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0

    .line 25
    :cond_1
    invoke-interface {p1}, Lcom/p1/mobile/share_sdk/content/Content;->getType()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const/4 v1, 0x3

    .line 30
    if-ne v0, v1, :cond_2

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ll/jvp0;->k(Lcom/p1/mobile/share_sdk/content/Content;)Lcom/tencent/mm/opensdk/modelmsg/WXMediaMessage$IMediaObject;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_2
    const/4 p0, 0x0

    .line 38
    return-object p0
.end method

.method public final f(Lcom/p1/mobile/share_sdk/content/Content;)Lcom/tencent/mm/opensdk/modelmsg/SendMessageToWX$Req;
    .locals 3
    .param p1    # Lcom/p1/mobile/share_sdk/content/Content;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Lcom/tencent/mm/opensdk/modelmsg/WXMediaMessage;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/mm/opensdk/modelmsg/WXMediaMessage;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Lcom/p1/mobile/share_sdk/content/Content;->getTitle()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iput-object v1, v0, Lcom/tencent/mm/opensdk/modelmsg/WXMediaMessage;->title:Ljava/lang/String;

    .line 11
    .line 12
    invoke-interface {p1}, Lcom/p1/mobile/share_sdk/content/Content;->getSummary()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iput-object v1, v0, Lcom/tencent/mm/opensdk/modelmsg/WXMediaMessage;->description:Ljava/lang/String;

    .line 17
    .line 18
    invoke-interface {p1}, Lcom/p1/mobile/share_sdk/content/Content;->getThumbBmpPath()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-static {v1}, Ll/gmk0;->a(Landroid/graphics/Bitmap;)[B

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iput-object v1, v0, Lcom/tencent/mm/opensdk/modelmsg/WXMediaMessage;->thumbData:[B

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ll/jvp0;->e(Lcom/p1/mobile/share_sdk/content/Content;)Lcom/tencent/mm/opensdk/modelmsg/WXMediaMessage$IMediaObject;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iput-object p1, v0, Lcom/tencent/mm/opensdk/modelmsg/WXMediaMessage;->mediaObject:Lcom/tencent/mm/opensdk/modelmsg/WXMediaMessage$IMediaObject;

    .line 37
    .line 38
    new-instance p1, Lcom/tencent/mm/opensdk/modelmsg/SendMessageToWX$Req;

    .line 39
    .line 40
    invoke-direct {p1}, Lcom/tencent/mm/opensdk/modelmsg/SendMessageToWX$Req;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 44
    .line 45
    .line 46
    move-result-wide v1

    .line 47
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iput-object v1, p1, Lcom/tencent/mm/opensdk/modelbase/BaseReq;->transaction:Ljava/lang/String;

    .line 52
    .line 53
    iput-object v0, p1, Lcom/tencent/mm/opensdk/modelmsg/SendMessageToWX$Req;->message:Lcom/tencent/mm/opensdk/modelmsg/WXMediaMessage;

    .line 54
    .line 55
    iget p0, p0, Ll/jvp0;->b:I

    .line 56
    .line 57
    iput p0, p1, Lcom/tencent/mm/opensdk/modelmsg/SendMessageToWX$Req;->scene:I

    .line 58
    .line 59
    return-object p1
.end method

.method public h(Landroid/content/Context;Ljava/io/File;)Ljava/lang/String;
    .locals 1

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v0, "files."

    .line 13
    .line 14
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p1, p0, p2}, Landroidx/core/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string p2, "com.tencent.mm"

    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    invoke-virtual {p1, p2, p0, v0}, Landroid/content/Context;->grantUriPermission(Ljava/lang/String;Landroid/net/Uri;I)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0

    .line 43
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 44
    return-object p0
.end method

.method public final i(Lcom/p1/mobile/share_sdk/content/Content;)Lcom/tencent/mm/opensdk/modelmsg/WXMediaMessage$IMediaObject;
    .locals 2

    .line 1
    new-instance v0, Lcom/tencent/mm/opensdk/modelmsg/WXImageObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/mm/opensdk/modelmsg/WXImageObject;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Lcom/p1/mobile/share_sdk/content/Content;->getFile()Ljava/io/File;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/jvp0;->l()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget-object v1, p0, Ll/jvp0;->c:Landroid/app/Activity;

    .line 19
    .line 20
    invoke-interface {p1}, Lcom/p1/mobile/share_sdk/content/Content;->getFile()Ljava/io/File;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, v1, p1}, Ll/jvp0;->h(Landroid/content/Context;Ljava/io/File;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Lcom/tencent/mm/opensdk/modelmsg/WXImageObject;->setImagePath(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-object v0

    .line 32
    :cond_0
    invoke-interface {p1}, Lcom/p1/mobile/share_sdk/content/Content;->getFile()Ljava/io/File;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Lcom/tencent/mm/opensdk/modelmsg/WXImageObject;->setImagePath(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-object v0

    .line 44
    :cond_1
    invoke-interface {p1}, Lcom/p1/mobile/share_sdk/content/Content;->getLargeBmpPath()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    if-eqz p0, :cond_2

    .line 49
    .line 50
    invoke-interface {p1}, Lcom/p1/mobile/share_sdk/content/Content;->getLargeBmpPath()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    iput-object p0, v0, Lcom/tencent/mm/opensdk/modelmsg/WXImageObject;->imagePath:Ljava/lang/String;

    .line 55
    .line 56
    :cond_2
    return-object v0
.end method

.method public final j(Lcom/p1/mobile/share_sdk/content/Content;)Lcom/tencent/mm/opensdk/modelmsg/WXMediaMessage$IMediaObject;
    .locals 0

    .line 1
    new-instance p0, Lcom/tencent/mm/opensdk/modelmsg/WXTextObject;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tencent/mm/opensdk/modelmsg/WXTextObject;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Lcom/p1/mobile/share_sdk/content/Content;->getSummary()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/tencent/mm/opensdk/modelmsg/WXTextObject;->text:Ljava/lang/String;

    .line 11
    .line 12
    return-object p0
.end method

.method public final k(Lcom/p1/mobile/share_sdk/content/Content;)Lcom/tencent/mm/opensdk/modelmsg/WXMediaMessage$IMediaObject;
    .locals 0

    .line 1
    new-instance p0, Lcom/tencent/mm/opensdk/modelmsg/WXWebpageObject;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tencent/mm/opensdk/modelmsg/WXWebpageObject;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Lcom/p1/mobile/share_sdk/content/Content;->getURL()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/tencent/mm/opensdk/modelmsg/WXWebpageObject;->webpageUrl:Ljava/lang/String;

    .line 11
    .line 12
    return-object p0
.end method

.method public l()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/jvp0;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/jvp0;->c()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final m(Lcom/tencent/mm/opensdk/modelbase/BaseResp;Ll/g3f0;)V
    .locals 3
    .param p2    # Ll/g3f0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget v0, p1, Lcom/tencent/mm/opensdk/modelbase/BaseResp;->errCode:I

    .line 2
    .line 3
    const/4 v1, -0x4

    .line 4
    if-eq v0, v1, :cond_3

    .line 5
    .line 6
    const/4 v1, -0x3

    .line 7
    if-eq v0, v1, :cond_2

    .line 8
    .line 9
    const/4 v1, -0x2

    .line 10
    if-eq v0, v1, :cond_1

    .line 11
    .line 12
    iget-object p0, p0, Ll/jvp0;->a:Ll/wc80;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    new-instance v0, Ljava/lang/Exception;

    .line 17
    .line 18
    new-instance v1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v2, "\u672a\u77e5\u9519\u8bef\uff0ccode\uff1a"

    .line 21
    .line 22
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget v2, p1, Lcom/tencent/mm/opensdk/modelbase/BaseResp;->errCode:I

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v2, ", message\uff1a"

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget-object p1, p1, Lcom/tencent/mm/opensdk/modelbase/BaseResp;->errStr:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-interface {p2, p0, v0}, Ll/g3f0;->a(Ll/wc80;Ljava/lang/Throwable;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    invoke-interface {p2, p0}, Ll/g3f0;->b(Ll/wc80;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    iget-object p0, p0, Ll/jvp0;->a:Ll/wc80;

    .line 56
    .line 57
    invoke-interface {p2, p0}, Ll/g3f0;->c(Ll/wc80;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_2
    iget-object p0, p0, Ll/jvp0;->a:Ll/wc80;

    .line 62
    .line 63
    new-instance p1, Ljava/lang/Exception;

    .line 64
    .line 65
    const-string v0, "\u53d1\u9001\u5931\u8d25"

    .line 66
    .line 67
    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-interface {p2, p0, p1}, Ll/g3f0;->a(Ll/wc80;Ljava/lang/Throwable;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_3
    iget-object p0, p0, Ll/jvp0;->a:Ll/wc80;

    .line 75
    .line 76
    new-instance p1, Ljava/lang/Exception;

    .line 77
    .line 78
    const-string v0, "\u7528\u6237\u62d2\u7edd\u6388\u6743"

    .line 79
    .line 80
    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-interface {p2, p0, p1}, Ll/g3f0;->a(Ll/wc80;Ljava/lang/Throwable;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public final n(Lcom/tencent/mm/opensdk/modelbase/BaseReq;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-static {p2}, Ll/jvp0;->g(Landroid/content/Context;)Lcom/tencent/mm/opensdk/openapi/IWXAPI;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Lcom/tencent/mm/opensdk/openapi/IWXAPI;->sendReq(Lcom/tencent/mm/opensdk/modelbase/BaseReq;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public o(Ll/g3f0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jvp0;->d:Ll/g3f0;

    .line 2
    .line 3
    return-void
.end method

.method public p(Lcom/p1/mobile/share_sdk/content/Content;)V
    .locals 1

    .line 1
    new-instance v0, Ll/jvp0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/jvp0$a;-><init>(Ll/jvp0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/j5f;->b(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/jvp0;->f(Lcom/p1/mobile/share_sdk/content/Content;)Lcom/tencent/mm/opensdk/modelmsg/SendMessageToWX$Req;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object v0, p0, Ll/jvp0;->c:Landroid/app/Activity;

    .line 14
    .line 15
    invoke-virtual {p0, p1, v0}, Ll/jvp0;->n(Lcom/tencent/mm/opensdk/modelbase/BaseReq;Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
