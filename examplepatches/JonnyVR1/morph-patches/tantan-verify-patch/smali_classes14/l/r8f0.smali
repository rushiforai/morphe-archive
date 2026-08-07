.class public Ll/r8f0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/r8f0$a;
    }
.end annotation


# instance fields
.field public volatile a:Z

.field public b:Ll/wyd0;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/r8f0;->a:Z

    .line 6
    .line 7
    new-instance v0, Ll/wyd0;

    .line 8
    .line 9
    const-string v1, "shuzilm"

    .line 10
    .line 11
    const-string v2, ""

    .line 12
    .line 13
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/r8f0;->b:Ll/wyd0;

    .line 17
    .line 18
    return-void
.end method

.method public synthetic constructor <init>(Ll/s8f0;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ll/r8f0;-><init>()V

    return-void
.end method

.method public static synthetic a(Ll/r8f0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r8f0;->m(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic b(Ll/r8f0;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r8f0;->k(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic c(Ll/r8f0;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r8f0;->l(Landroid/content/Context;)V

    return-void
.end method

.method public static f()Ll/r8f0;
    .locals 1

    .line 1
    invoke-static {}, Ll/r8f0$a;->a()Ll/r8f0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public final d([B)Ljava/lang/String;
    .locals 4

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    :goto_0
    array-length v1, p1

    .line 8
    if-ge v0, v1, :cond_1

    .line 9
    .line 10
    aget-byte v1, p1, v0

    .line 11
    .line 12
    and-int/lit16 v1, v1, 0xff

    .line 13
    .line 14
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    const/4 v3, 0x1

    .line 23
    if-ne v2, v3, :cond_0

    .line 24
    .line 25
    const-string v2, "0"

    .line 26
    .line 27
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    :cond_0
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    add-int/lit8 v0, v0, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public final e(Ll/x20;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r8f0;->b:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/CharSequence;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const-string p0, ""

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    iget-object p0, p0, Ll/r8f0;->b:Ll/wyd0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Ljava/lang/String;

    .line 25
    .line 26
    return-object p0
.end method

.method public final h(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    :try_start_0
    const-string v0, "SHA-256"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "UTF-8"

    .line 8
    .line 9
    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {v0, p1}, Ljava/security/MessageDigest;->update([B)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Ll/r8f0;->d([B)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    return-object p0

    .line 25
    :catch_0
    const-string p0, ""

    .line 26
    .line 27
    return-object p0
.end method

.method public i(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "shumeng_init"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->s(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ll/o8f0;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1}, Ll/o8f0;-><init>(Ll/r8f0;Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0}, Ll/xhi0;->a(Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final j(Landroid/content/Context;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/r8f0;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string v0, "MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAL4szl55NvT7HnkNUx+cajHpmP4Faq20eof6TQf9Vcfh5aQ6kuZevv6sdALJFFfrUgROjGQI0Y4eobL2x7uetKcCAwEAAQ=="

    .line 7
    .line 8
    invoke-static {p1, v0}, Lcn/shuzilm/core/Main;->init(Landroid/content/Context;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object p1, Ll/lhl;->INSTANCE:Ll/lhl;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/lhl;->d()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    const-string v0, "url"

    .line 18
    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    const-string p1, "pco-sm-log.tantantribe.com"

    .line 22
    .line 23
    invoke-static {v0, p1}, Lcn/shuzilm/core/Main;->setConfig(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const-string p1, "pco-sm-log.tantanapp.com"

    .line 28
    .line 29
    invoke-static {v0, p1}, Lcn/shuzilm/core/Main;->setConfig(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    :goto_0
    const-string p1, "pkglist"

    .line 33
    .line 34
    const-string v0, "1"

    .line 35
    .line 36
    invoke-static {p1, v0}, Lcn/shuzilm/core/Main;->setConfig(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    const-string p1, "cdlmt"

    .line 40
    .line 41
    invoke-static {p1, v0}, Lcn/shuzilm/core/Main;->setConfig(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    const-string p1, "bluetooth"

    .line 45
    .line 46
    invoke-static {p1, v0}, Lcn/shuzilm/core/Main;->setConfig(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    const-string p1, "storage"

    .line 50
    .line 51
    invoke-static {p1, v0}, Lcn/shuzilm/core/Main;->setConfig(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    const/4 p1, 0x1

    .line 55
    iput-boolean p1, p0, Ll/r8f0;->a:Z

    .line 56
    .line 57
    return-void
.end method

.method public final synthetic k(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/r8f0;->j(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-interface {v0}, Ll/bn5;->signedIn_()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/r8f0;->p(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {p0, p1}, Ll/r8f0;->q(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic l(Landroid/content/Context;)V
    .locals 1

    .line 1
    new-instance v0, Ll/p8f0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/p8f0;-><init>(Ll/r8f0;Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/r8f0;->e(Ll/x20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic m(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r8f0;->b:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "{\"public_uid\": \"%s\", \"sha256\": \"%s\"}"

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {p0, p2}, Ll/r8f0;->h(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    filled-new-array {p1, p0}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :cond_1
    :goto_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    if-eqz p2, :cond_2

    .line 49
    .line 50
    const-string p1, ""

    .line 51
    .line 52
    :cond_2
    invoke-virtual {p0, p3}, Ll/r8f0;->h(Ljava/lang/String;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    filled-new-array {p1, p0}, [Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0
.end method

.method public final o(Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 2

    .line 1
    iget-object p3, p0, Ll/r8f0;->b:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {p3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    check-cast p3, Ljava/lang/CharSequence;

    .line 8
    .line 9
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    const-string v0, ""

    .line 14
    .line 15
    if-eqz p3, :cond_0

    .line 16
    .line 17
    sget-object p3, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 18
    .line 19
    new-instance v1, Ll/q8f0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/q8f0;-><init>(Ll/r8f0;)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    invoke-static {p3, v0, p2, p0, v1}, Lcn/shuzilm/core/Main;->getQueryID(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILcn/shuzilm/core/Listener;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    invoke-static {p1, v0, p2}, Lcn/shuzilm/core/Main;->report(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final p(Landroid/content/Context;)V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bn5;->queryMe()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, ""

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 13
    .line 14
    :goto_0
    sget-object v1, Ll/uqb0;->c0:Ll/bn5;

    .line 15
    .line 16
    invoke-interface {v1}, Ll/bn5;->accessToken()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const-string v2, "2918efe07"

    .line 21
    .line 22
    invoke-virtual {p0, v0, v1, v2}, Ll/r8f0;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-virtual {p0, p1, v0, v1}, Ll/r8f0;->o(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final q(Landroid/content/Context;)V
    .locals 2

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    const-string v1, "2918efe07"

    .line 4
    .line 5
    invoke-virtual {p0, v0, v0, v1}, Ll/r8f0;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p0, p1, v0, v1}, Ll/r8f0;->o(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
