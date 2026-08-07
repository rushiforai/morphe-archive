.class public Ll/owp0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/wc80;

.field public b:Landroid/app/Activity;

.field public c:Ll/g3f0;


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
    iput-object v0, p0, Ll/owp0;->c:Ll/g3f0;

    .line 6
    .line 7
    iput-object p1, p0, Ll/owp0;->a:Ll/wc80;

    .line 8
    .line 9
    iput-object p2, p0, Ll/owp0;->b:Landroid/app/Activity;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Ll/owp0;)Ll/g3f0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/owp0;->c:Ll/g3f0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ll/owp0;Ljava/lang/Integer;Ll/g3f0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/owp0;->g(Ljava/lang/Integer;Ll/g3f0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static c(Lcom/p1/mobile/share_sdk/content/Content;)Lcom/sina/weibo/sdk/api/WeiboMultiMessage;
    .locals 3
    .param p0    # Lcom/p1/mobile/share_sdk/content/Content;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Lcom/sina/weibo/sdk/api/WeiboMultiMessage;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/sina/weibo/sdk/api/WeiboMultiMessage;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Lcom/p1/mobile/share_sdk/content/Content;->getType()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x1

    .line 11
    if-eq v1, v2, :cond_3

    .line 12
    .line 13
    const/4 v2, 0x2

    .line 14
    if-eq v1, v2, :cond_2

    .line 15
    .line 16
    const/4 v2, 0x3

    .line 17
    if-eq v1, v2, :cond_0

    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_0
    invoke-interface {p0}, Lcom/p1/mobile/share_sdk/content/Content;->getURL()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    invoke-static {p0}, Ll/owp0;->d(Lcom/p1/mobile/share_sdk/content/Content;)Lcom/sina/weibo/sdk/api/ImageObject;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iput-object v1, v0, Lcom/sina/weibo/sdk/api/WeiboMultiMessage;->imageObject:Lcom/sina/weibo/sdk/api/ImageObject;

    .line 31
    .line 32
    invoke-static {p0}, Ll/owp0;->e(Lcom/p1/mobile/share_sdk/content/Content;)Lcom/sina/weibo/sdk/api/TextObject;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    iput-object p0, v0, Lcom/sina/weibo/sdk/api/WeiboMultiMessage;->textObject:Lcom/sina/weibo/sdk/api/TextObject;

    .line 37
    .line 38
    return-object v0

    .line 39
    :cond_1
    invoke-static {p0}, Ll/owp0;->f(Lcom/p1/mobile/share_sdk/content/Content;)Lcom/sina/weibo/sdk/api/WebpageObject;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    iput-object p0, v0, Lcom/sina/weibo/sdk/api/WeiboMultiMessage;->mediaObject:Lcom/sina/weibo/sdk/api/BaseMediaObject;

    .line 44
    .line 45
    return-object v0

    .line 46
    :cond_2
    invoke-static {p0}, Ll/owp0;->d(Lcom/p1/mobile/share_sdk/content/Content;)Lcom/sina/weibo/sdk/api/ImageObject;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    iput-object p0, v0, Lcom/sina/weibo/sdk/api/WeiboMultiMessage;->imageObject:Lcom/sina/weibo/sdk/api/ImageObject;

    .line 51
    .line 52
    return-object v0

    .line 53
    :cond_3
    invoke-static {p0}, Ll/owp0;->e(Lcom/p1/mobile/share_sdk/content/Content;)Lcom/sina/weibo/sdk/api/TextObject;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    iput-object p0, v0, Lcom/sina/weibo/sdk/api/WeiboMultiMessage;->textObject:Lcom/sina/weibo/sdk/api/TextObject;

    .line 58
    .line 59
    return-object v0
.end method

.method public static d(Lcom/p1/mobile/share_sdk/content/Content;)Lcom/sina/weibo/sdk/api/ImageObject;
    .locals 2

    .line 1
    new-instance v0, Lcom/sina/weibo/sdk/api/ImageObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/sina/weibo/sdk/api/ImageObject;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Lcom/p1/mobile/share_sdk/content/Content;->getFile()Ljava/io/File;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-interface {p0}, Lcom/p1/mobile/share_sdk/content/Content;->getFile()Ljava/io/File;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    iput-object p0, v0, Lcom/sina/weibo/sdk/api/ImageObject;->imagePath:Ljava/lang/String;

    .line 21
    .line 22
    return-object v0

    .line 23
    :cond_0
    invoke-interface {p0}, Lcom/p1/mobile/share_sdk/content/Content;->getLargeBmpPath()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-interface {p0}, Lcom/p1/mobile/share_sdk/content/Content;->getLargeBmpPath()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    iput-object p0, v0, Lcom/sina/weibo/sdk/api/ImageObject;->imagePath:Ljava/lang/String;

    .line 34
    .line 35
    :cond_1
    return-object v0
.end method

.method public static e(Lcom/p1/mobile/share_sdk/content/Content;)Lcom/sina/weibo/sdk/api/TextObject;
    .locals 1

    .line 1
    new-instance v0, Lcom/sina/weibo/sdk/api/TextObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/sina/weibo/sdk/api/TextObject;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Lcom/p1/mobile/share_sdk/content/Content;->getSummary()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iput-object p0, v0, Lcom/sina/weibo/sdk/api/TextObject;->text:Ljava/lang/String;

    .line 11
    .line 12
    return-object v0
.end method

.method public static f(Lcom/p1/mobile/share_sdk/content/Content;)Lcom/sina/weibo/sdk/api/WebpageObject;
    .locals 2

    .line 1
    new-instance v0, Lcom/sina/weibo/sdk/api/WebpageObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/sina/weibo/sdk/api/WebpageObject;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/sina/weibo/sdk/utils/Utility;->generateGUID()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iput-object v1, v0, Lcom/sina/weibo/sdk/api/BaseMediaObject;->identify:Ljava/lang/String;

    .line 11
    .line 12
    invoke-interface {p0}, Lcom/p1/mobile/share_sdk/content/Content;->getTitle()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iput-object v1, v0, Lcom/sina/weibo/sdk/api/BaseMediaObject;->title:Ljava/lang/String;

    .line 17
    .line 18
    invoke-interface {p0}, Lcom/p1/mobile/share_sdk/content/Content;->getSummary()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, v0, Lcom/sina/weibo/sdk/api/BaseMediaObject;->description:Ljava/lang/String;

    .line 23
    .line 24
    invoke-interface {p0}, Lcom/p1/mobile/share_sdk/content/Content;->getThumbBmpPath()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-static {v1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-static {v1}, Ll/gmk0;->a(Landroid/graphics/Bitmap;)[B

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iput-object v1, v0, Lcom/sina/weibo/sdk/api/BaseMediaObject;->thumbData:[B

    .line 37
    .line 38
    invoke-interface {p0}, Lcom/p1/mobile/share_sdk/content/Content;->getSummary()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iput-object v1, v0, Lcom/sina/weibo/sdk/api/WebpageObject;->defaultText:Ljava/lang/String;

    .line 43
    .line 44
    invoke-interface {p0}, Lcom/p1/mobile/share_sdk/content/Content;->getURL()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    iput-object p0, v0, Lcom/sina/weibo/sdk/api/BaseMediaObject;->actionUrl:Ljava/lang/String;

    .line 49
    .line 50
    return-object v0
.end method

.method public static j(Landroid/app/Activity;Lcom/p1/mobile/share_sdk/content/Content;)V
    .locals 5

    .line 1
    :try_start_0
    invoke-static {}, Lcom/sina/weibo/sdk/WbSdk;->checkInit()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    goto :goto_0

    .line 5
    :catch_0
    new-instance v0, Lcom/sina/weibo/sdk/auth/AuthInfo;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    sget-object v2, Ll/cy5;->c:Ljava/lang/String;

    .line 12
    .line 13
    sget-object v3, Ll/cy5;->d:Ljava/lang/String;

    .line 14
    .line 15
    const-string v4, "key_scope"

    .line 16
    .line 17
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/sina/weibo/sdk/auth/AuthInfo;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-static {v1, v0}, Lcom/sina/weibo/sdk/WbSdk;->install(Landroid/content/Context;Lcom/sina/weibo/sdk/auth/AuthInfo;)V

    .line 25
    .line 26
    .line 27
    :goto_0
    new-instance v0, Lcom/sina/weibo/sdk/share/WbShareHandler;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Lcom/sina/weibo/sdk/share/WbShareHandler;-><init>(Landroid/app/Activity;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/sina/weibo/sdk/share/WbShareHandler;->registerApp()Z

    .line 33
    .line 34
    .line 35
    invoke-static {p1}, Ll/owp0;->c(Lcom/p1/mobile/share_sdk/content/Content;)Lcom/sina/weibo/sdk/api/WeiboMultiMessage;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const/4 p1, 0x1

    .line 40
    invoke-virtual {v0, p0, p1}, Lcom/sina/weibo/sdk/share/WbShareHandler;->shareMessage(Lcom/sina/weibo/sdk/api/WeiboMultiMessage;Z)V

    .line 41
    .line 42
    .line 43
    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Integer;Ll/g3f0;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/owp0;->a:Ll/wc80;

    .line 8
    .line 9
    invoke-interface {p2, p0}, Ll/g3f0;->b(Ll/wc80;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

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
    iget-object p0, p0, Ll/owp0;->a:Ll/wc80;

    .line 21
    .line 22
    new-instance p1, Ljava/lang/Exception;

    .line 23
    .line 24
    const-string v0, "ops, something wrong!!"

    .line 25
    .line 26
    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-interface {p2, p0, p1}, Ll/g3f0;->a(Ll/wc80;Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    const/4 v0, 0x1

    .line 38
    if-ne p1, v0, :cond_2

    .line 39
    .line 40
    iget-object p0, p0, Ll/owp0;->a:Ll/wc80;

    .line 41
    .line 42
    invoke-interface {p2, p0}, Ll/g3f0;->c(Ll/wc80;)V

    .line 43
    .line 44
    .line 45
    :cond_2
    return-void
.end method

.method public h(Ll/g3f0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/owp0;->c:Ll/g3f0;

    .line 2
    .line 3
    return-void
.end method

.method public i(Lcom/p1/mobile/share_sdk/content/Content;)V
    .locals 3

    .line 1
    new-instance v0, Ll/owp0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/owp0$a;-><init>(Ll/owp0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/j5f;->b(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Landroid/content/Intent;

    .line 10
    .line 11
    iget-object v1, p0, Ll/owp0;->b:Landroid/app/Activity;

    .line 12
    .line 13
    const-class v2, Lcom/p1/mobile/share_sdk/ShareEventActivity;

    .line 14
    .line 15
    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/owp0;->a:Ll/wc80;

    .line 19
    .line 20
    invoke-interface {v1}, Ll/wc80;->getName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const-string v2, "platform"

    .line 25
    .line 26
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    const-string v1, "share_data"

    .line 30
    .line 31
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/owp0;->b:Landroid/app/Activity;

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method
