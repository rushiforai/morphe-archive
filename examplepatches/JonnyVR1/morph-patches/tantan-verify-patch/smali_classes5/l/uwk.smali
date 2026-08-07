.class public Ll/uwk;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/uwk$a;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a([B[B[B)[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ljavax/crypto/spec/DESedeKeySpec;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ljavax/crypto/spec/DESedeKeySpec;-><init>([B)V

    .line 4
    .line 5
    .line 6
    const-string p0, "desede"

    .line 7
    .line 8
    invoke-static {p0}, Ljavax/crypto/SecretKeyFactory;->getInstance(Ljava/lang/String;)Ljavax/crypto/SecretKeyFactory;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0, v0}, Ljavax/crypto/SecretKeyFactory;->generateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "desede/CBC/PKCS5Padding"

    .line 17
    .line 18
    invoke-static {v0}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ljavax/crypto/spec/IvParameterSpec;

    .line 23
    .line 24
    invoke-direct {v1, p1}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    .line 25
    .line 26
    .line 27
    const/4 p1, 0x1

    .line 28
    invoke-virtual {v0, p1, p0, v1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p2}, Ljavax/crypto/Cipher;->doFinal([B)[B

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public static b()Ljava/lang/String;
    .locals 8

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v4

    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->accessToken()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v5

    .line 19
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v6

    .line 27
    invoke-static {v5, v4, v6}, Ll/uwk;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v7

    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v1, "MAC "

    .line 34
    .line 35
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    sget-object v1, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/tantanapp/common/data/JsonAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/JsonAdapter;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const-string v2, "12"

    .line 45
    .line 46
    const-string v3, "inappWeb1.0.0"

    .line 47
    .line 48
    filled-new-array/range {v2 .. v7}, [Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    return-object v0
.end method

.method public static c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string p0, "."

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :try_start_0
    const-string p1, "@Vlp#^xI3Gv0i4*bm*DVONIl"

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const/4 p2, 0x0

    .line 34
    const/16 v0, 0x8

    .line 35
    .line 36
    invoke-static {p1, p2, v0}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    const-string v0, "UTF-8"

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {p1, p2, p0}, Ll/uwk;->a([B[B[B)[B

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {p0}, Ll/niw;->c([B)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    return-object p0

    .line 55
    :catch_0
    move-exception p0

    .line 56
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 57
    .line 58
    .line 59
    const-string p0, ""

    .line 60
    .line 61
    return-object p0
.end method

.method public static d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/app/web/WebViewX;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance p3, Ll/do60;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p3, v0}, Ll/do60;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3, p4}, Ll/do60;->h(Ljava/lang/String;)Ll/do60;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    const/4 p4, 0x1

    .line 12
    invoke-virtual {p3, p4}, Ll/do60;->i(Z)Ll/do60;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    invoke-virtual {p3, p5}, Ll/do60;->n(Ljava/lang/String;)Ll/do60;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    invoke-virtual {p3}, Ll/do60;->a()Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    .line 21
    .line 22
    .line 23
    move-result-object p3

    .line 24
    new-instance p4, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 30
    .line 31
    .line 32
    move-result-object p5

    .line 33
    invoke-interface {p5}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p5

    .line 37
    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-static {}, Ll/pzi0;->o()J

    .line 41
    .line 42
    .line 43
    move-result-wide v1

    .line 44
    invoke-virtual {p4, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p4

    .line 51
    invoke-static {p4}, Ll/niw;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p4

    .line 55
    invoke-virtual {p3, p4}, Lcom/p1/mobile/putong/data/PaymentParam;->setPurchaseTrackId(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    new-instance p4, Ll/qeb0;

    .line 59
    .line 60
    invoke-direct {p4}, Ll/qeb0;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p4, p3}, Ll/qeb0;->b(Lcom/p1/mobile/putong/data/PurchasePaymentParam;)Ll/qeb0;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    new-instance p4, Ll/uwk$a;

    .line 68
    .line 69
    invoke-direct {p4, p1, v0}, Ll/uwk$a;-><init>(Lcom/p1/mobile/putong/app/web/WebViewX;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p3, p4}, Ll/qeb0;->c(Ll/bn50;)Ll/qeb0;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p1}, Ll/qeb0;->a()Ll/peb0;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-static {p0, p2, v0, p1}, Ll/xl60;->y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/PayMethod;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/peb0;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public static e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/app/web/WebViewX;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 1
    const-string v0, "platform"

    .line 2
    .line 3
    invoke-static {v0, p4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "purchaseShowFrom"

    .line 8
    .line 9
    const-string v2, ""

    .line 10
    .line 11
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-string v3, "productType"

    .line 16
    .line 17
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    const-string v4, "skuID"

    .line 22
    .line 23
    invoke-static {v4, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    const-string v5, "price"

    .line 28
    .line 29
    invoke-static {v5, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    filled-new-array {v0, v1, v3, v4, v2}, [Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "e_purchase_button"

    .line 38
    .line 39
    const-string v2, "p_purchase_page"

    .line 40
    .line 41
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 42
    .line 43
    .line 44
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_2

    .line 49
    .line 50
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_0

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    const-string v0, "wechat"

    .line 58
    .line 59
    invoke-virtual {v0, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_1

    .line 64
    .line 65
    invoke-static {v0}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 66
    .line 67
    .line 68
    move-result-object p4

    .line 69
    move-object v6, p3

    .line 70
    move-object p3, p2

    .line 71
    move-object p2, p4

    .line 72
    move-object p4, v6

    .line 73
    invoke-static/range {p0 .. p5}, Ll/uwk;->d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/app/web/WebViewX;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_1
    move-object v4, p3

    .line 78
    move-object p3, p2

    .line 79
    const-string p2, "alipay"

    .line 80
    .line 81
    invoke-virtual {p2, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p4

    .line 85
    if-eqz p4, :cond_2

    .line 86
    .line 87
    invoke-static {p2}, Lcom/p1/mobile/putong/data/PayMethod;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/PayMethod;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    move-object v0, p0

    .line 92
    move-object v1, p1

    .line 93
    move-object v3, p3

    .line 94
    move-object v5, p5

    .line 95
    invoke-static/range {v0 .. v5}, Ll/uwk;->d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/app/web/WebViewX;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    :cond_2
    :goto_0
    return-void
.end method
