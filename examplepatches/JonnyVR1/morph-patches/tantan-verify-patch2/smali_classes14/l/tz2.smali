.class public abstract Ll/tz2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/tz2;->a:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public abstract a(Lcom/p1/mobile/putong/core/ui/account/view/AccountSecureFunItem;Lcom/p1/mobile/putong/data/CommonData;)V
.end method

.method public b()Ljava/lang/String;
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    const-string v1, ""

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return-object v1

    .line 16
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v1, "+"

    .line 29
    .line 30
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 36
    .line 37
    iget v1, v1, Lcom/p1/mobile/putong/data/PhoneNumber;->countryCode:I

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v1, " "

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {p0}, Ll/ky;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0

    .line 65
    :cond_1
    return-object v1
.end method

.method public c(Lcom/p1/mobile/putong/data/CommonData;)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Mobile;->mobileNumber:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    new-instance p0, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v0, "+"

    .line 22
    .line 23
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 27
    .line 28
    iget v0, v0, Lcom/p1/mobile/putong/data/Mobile;->countryCode:I

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v0, " "

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Mobile;->mobileNumber:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {p1}, Ll/ky;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0

    .line 54
    :cond_0
    const-string p0, ""

    .line 55
    .line 56
    return-object p0
.end method

.method public d(Lcom/p1/mobile/putong/data/CommonData;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->email:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public e(Lcom/p1/mobile/putong/data/CommonData;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->thirdparty:Lcom/p1/mobile/putong/data/ThirdParty;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->thirdparty:Lcom/p1/mobile/putong/data/ThirdParty;

    .line 18
    .line 19
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/ThirdParty;->facebook:Z

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public f(Lcom/p1/mobile/putong/data/CommonData;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->thirdparty:Lcom/p1/mobile/putong/data/ThirdParty;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->thirdparty:Lcom/p1/mobile/putong/data/ThirdParty;

    .line 18
    .line 19
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/ThirdParty;->google:Z

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public g(Lcom/p1/mobile/putong/data/CommonData;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Mobile;->mobileNumber:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public h(Lcom/p1/mobile/putong/data/CommonData;Z)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->thirdparty:Lcom/p1/mobile/putong/data/ThirdParty;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->thirdparty:Lcom/p1/mobile/putong/data/ThirdParty;

    .line 18
    .line 19
    iget-boolean p1, p0, Lcom/p1/mobile/putong/data/ThirdParty;->wechat:Z

    .line 20
    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    iget-boolean p1, p0, Lcom/p1/mobile/putong/data/ThirdParty;->google:Z

    .line 24
    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    if-eqz p2, :cond_1

    .line 28
    .line 29
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/ThirdParty;->facebook:Z

    .line 30
    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    :cond_0
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_1
    const/4 p0, 0x0

    .line 36
    return p0
.end method
