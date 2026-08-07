.class public Lcom/bytedance/realx/base/NetworkTypeUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;,
        Lcom/bytedance/realx/base/NetworkTypeUtils$CompressType;,
        Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkTypeInterceptor;
    }
.end annotation


# static fields
.field private static final DEBUG_MOBILE:Z = false

.field private static final DEFAULT_CONTENT_CHARSET:Ljava/lang/String; = "ISO-8859-1"

.field private static final NAME_VALUE_SEPARATOR:Ljava/lang/String; = "="

.field private static final PARAMETER_SEPARATOR:Ljava/lang/String; = "&"

.field private static final TAG:Ljava/lang/String; = "NetworkTypeUtils"

.field private static debugInfo:Ljava/lang/String; = ""

.field private static sNetworkTypeInterceptor:Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkTypeInterceptor;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    :try_start_0
    const-string p1, "ISO-8859-1"

    .line 5
    .line 6
    :goto_0
    invoke-static {p0, p1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    return-object p0

    .line 11
    :catch_0
    move-exception p0

    .line 12
    invoke-static {p0}, Ll/tg3;->a(Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return-object p0
.end method

.method public static format(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_2

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Landroid/util/Pair;

    .line 21
    .line 22
    iget-object v2, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v2, Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v2, p1}, Lcom/bytedance/realx/base/NetworkTypeUtils;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    iget-object v1, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v1, Ljava/lang/String;

    .line 33
    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    invoke-static {v1, p1}, Lcom/bytedance/realx/base/NetworkTypeUtils;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    goto :goto_1

    .line 41
    :cond_0
    const-string v1, ""

    .line 42
    .line 43
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-lez v3, :cond_1

    .line 48
    .line 49
    const-string v3, "&"

    .line 50
    .line 51
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    :cond_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string v2, "="

    .line 58
    .line 59
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0
.end method

.method public static getDebugInfo()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/bytedance/realx/base/NetworkTypeUtils;->debugInfo:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method private static getNetWorkTypeThroughBPEA(Landroid/content/Context;)I
    .locals 6

    .line 1
    const-string v0, "phone"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/telephony/TelephonyManager;

    .line 8
    .line 9
    const/4 v0, -0x1

    .line 10
    :try_start_0
    const-string v1, "com.bytedance.bpea.entry.api.device.info.TelephonyManagerEntry"

    .line 11
    .line 12
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const-class v2, Lcom/bytedance/bpea/basics/Cert;

    .line 17
    .line 18
    const-string v3, "com.bytedance.bpea.cert.token.TokenCert"

    .line 19
    .line 20
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    const-string v4, "getNetworkType"

    .line 25
    .line 26
    const-class v5, Landroid/telephony/TelephonyManager;

    .line 27
    .line 28
    filled-new-array {v5, v2}, [Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v1, v4, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const-string v2, "with"

    .line 37
    .line 38
    const-class v4, Ljava/lang/String;

    .line 39
    .line 40
    filled-new-array {v4}, [Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-virtual {v3, v2, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    if-eqz v1, :cond_0

    .line 49
    .line 50
    if-eqz v2, :cond_0

    .line 51
    .line 52
    const-string v3, "bpea-rtc_generic_device_info"

    .line 53
    .line 54
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    const/4 v4, 0x0

    .line 59
    invoke-virtual {v2, v4, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    filled-new-array {p0, v2}, [Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {v1, v4, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    check-cast v1, Ljava/lang/Integer;

    .line 72
    .line 73
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 74
    .line 75
    .line 76
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    :try_start_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .line 81
    .line 82
    sget-object v3, Lcom/bytedance/realx/base/NetworkTypeUtils;->debugInfo:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string v3, " getNetworkType through BPEA;"

    .line 88
    .line 89
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    sput-object v2, Lcom/bytedance/realx/base/NetworkTypeUtils;->debugInfo:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :catch_0
    move v1, v0

    .line 100
    goto :goto_0

    .line 101
    :cond_0
    move v1, v0

    .line 102
    goto :goto_1

    .line 103
    :catch_1
    :goto_0
    const-string v2, "NetworkTypeUtils"

    .line 104
    .line 105
    const-string v3, "BPEA not exist"

    .line 106
    .line 107
    invoke-static {v2, v3}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    :goto_1
    if-ne v1, v0, :cond_1

    .line 111
    .line 112
    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getDataNetworkType()I

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    new-instance p0, Ljava/lang/StringBuilder;

    .line 117
    .line 118
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 119
    .line 120
    .line 121
    sget-object v0, Lcom/bytedance/realx/base/NetworkTypeUtils;->debugInfo:Ljava/lang/String;

    .line 122
    .line 123
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    const-string v0, " getNetworkType through system;"

    .line 127
    .line 128
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    sput-object p0, Lcom/bytedance/realx/base/NetworkTypeUtils;->debugInfo:Ljava/lang/String;

    .line 136
    .line 137
    :cond_1
    return v1
.end method

.method public static getNetworkAccessType(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 35
    invoke-static {p0, v0}, Lcom/bytedance/realx/base/NetworkTypeUtils;->getNetworkType(Landroid/content/Context;Landroid/content/Intent;)Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;

    move-result-object p0

    invoke-static {p0}, Lcom/bytedance/realx/base/NetworkTypeUtils;->getNetworkAccessType(Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getNetworkAccessType(Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;)Ljava/lang/String;
    .locals 1

    .line 1
    :try_start_0
    sget-object v0, Lcom/bytedance/realx/base/NetworkTypeUtils$1;->$SwitchMap$com$bytedance$realx$base$NetworkTypeUtils$NetworkType:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    packed-switch p0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :pswitch_0
    const-string p0, "mobile"

    .line 14
    .line 15
    return-object p0

    .line 16
    :pswitch_1
    const-string p0, "5g"

    .line 17
    .line 18
    return-object p0

    .line 19
    :pswitch_2
    const-string p0, "4g"

    .line 20
    .line 21
    return-object p0

    .line 22
    :pswitch_3
    const-string p0, "3g"

    .line 23
    .line 24
    return-object p0

    .line 25
    :pswitch_4
    const-string p0, "2g"

    .line 26
    .line 27
    return-object p0

    .line 28
    :pswitch_5
    const-string p0, "wifi"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .line 30
    return-object p0

    .line 31
    :catch_0
    :goto_0
    const-string p0, ""

    .line 32
    .line 33
    return-object p0

    .line 34
    nop

    .line 35
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getNetworkType(Landroid/content/Context;Landroid/content/Intent;)Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;
    .locals 3

    .line 1
    const-string v0, "NetworkInfo type:"

    .line 2
    .line 3
    sget-object v1, Lcom/bytedance/realx/base/NetworkTypeUtils;->sNetworkTypeInterceptor:Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkTypeInterceptor;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    invoke-interface {v1}, Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkTypeInterceptor;->getNetworkType()Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    sget-object v2, Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;->NONE:Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;

    .line 12
    .line 13
    if-eq v1, v2, :cond_0

    .line 14
    .line 15
    sget-object p0, Lcom/bytedance/realx/base/NetworkTypeUtils;->sNetworkTypeInterceptor:Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkTypeInterceptor;

    .line 16
    .line 17
    invoke-interface {p0}, Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkTypeInterceptor;->getNetworkType()Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    :try_start_0
    const-string v1, "connectivity"

    .line 23
    .line 24
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Landroid/net/ConnectivityManager;

    .line 29
    .line 30
    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isAvailable()Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-nez v2, :cond_3

    .line 41
    .line 42
    :cond_1
    if-nez v1, :cond_3

    .line 43
    .line 44
    if-eqz p1, :cond_3

    .line 45
    .line 46
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/NetworkTypeUtils;->isNetWorkConnected(Landroid/content/Context;Landroid/content/Intent;)Landroid/net/NetworkInfo;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    if-eqz v1, :cond_2

    .line 51
    .line 52
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isAvailable()Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-nez p1, :cond_3

    .line 57
    .line 58
    :cond_2
    const-string p0, "NetworkTypeUtils"

    .line 59
    .line 60
    const-string p1, "-----------info is null"

    .line 61
    .line 62
    invoke-static {p0, p1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    sget-object p0, Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;->NONE:Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;

    .line 66
    .line 67
    return-object p0

    .line 68
    :cond_3
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getType()I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    new-instance v2, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    sput-object v0, Lcom/bytedance/realx/base/NetworkTypeUtils;->debugInfo:Ljava/lang/String;

    .line 85
    .line 86
    const/4 v0, 0x1

    .line 87
    if-ne v0, p1, :cond_4

    .line 88
    .line 89
    sget-object p0, Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;->WIFI:Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;

    .line 90
    .line 91
    return-object p0

    .line 92
    :cond_4
    if-nez p1, :cond_7

    .line 93
    .line 94
    const-string p1, "android.permission.READ_PHONE_STATE"

    .line 95
    .line 96
    invoke-static {p0, p1}, Ll/j26;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 100
    const-string v0, " getNetworkType through ConnectivityManager;"

    .line 101
    .line 102
    if-nez p1, :cond_5

    .line 103
    .line 104
    :try_start_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 107
    .line 108
    .line 109
    sget-object v2, Lcom/bytedance/realx/base/NetworkTypeUtils;->debugInfo:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    const-string v2, " getNetworkType through TelephoneManager;"

    .line 115
    .line 116
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    sput-object p1, Lcom/bytedance/realx/base/NetworkTypeUtils;->debugInfo:Ljava/lang/String;

    .line 124
    .line 125
    invoke-static {p0}, Lcom/bytedance/realx/base/NetworkTypeUtils;->getNetWorkTypeThroughBPEA(Landroid/content/Context;)I

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    if-nez p0, :cond_6

    .line 130
    .line 131
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getSubtype()I

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    new-instance p1, Ljava/lang/StringBuilder;

    .line 136
    .line 137
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 138
    .line 139
    .line 140
    sget-object v1, Lcom/bytedance/realx/base/NetworkTypeUtils;->debugInfo:Ljava/lang/String;

    .line 141
    .line 142
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    sput-object p1, Lcom/bytedance/realx/base/NetworkTypeUtils;->debugInfo:Ljava/lang/String;

    .line 160
    .line 161
    goto :goto_0

    .line 162
    :cond_5
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getSubtype()I

    .line 163
    .line 164
    .line 165
    move-result p0

    .line 166
    new-instance p1, Ljava/lang/StringBuilder;

    .line 167
    .line 168
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 169
    .line 170
    .line 171
    sget-object v1, Lcom/bytedance/realx/base/NetworkTypeUtils;->debugInfo:Ljava/lang/String;

    .line 172
    .line 173
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    sput-object p1, Lcom/bytedance/realx/base/NetworkTypeUtils;->debugInfo:Ljava/lang/String;

    .line 184
    .line 185
    :cond_6
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 186
    .line 187
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 188
    .line 189
    .line 190
    sget-object v0, Lcom/bytedance/realx/base/NetworkTypeUtils;->debugInfo:Ljava/lang/String;

    .line 191
    .line 192
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    const-string v0, " TelephonyManager type:"

    .line 196
    .line 197
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    sput-object p1, Lcom/bytedance/realx/base/NetworkTypeUtils;->debugInfo:Ljava/lang/String;

    .line 208
    .line 209
    packed-switch p0, :pswitch_data_0

    .line 210
    .line 211
    .line 212
    :pswitch_0
    sget-object p0, Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;->UNKNOWN:Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;

    .line 213
    .line 214
    return-object p0

    .line 215
    :pswitch_1
    sget-object p0, Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;->MOBILE_5G:Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;

    .line 216
    .line 217
    return-object p0

    .line 218
    :pswitch_2
    sget-object p0, Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;->MOBILE_4G:Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;

    .line 219
    .line 220
    return-object p0

    .line 221
    :pswitch_3
    sget-object p0, Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;->MOBILE_3G:Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;

    .line 222
    .line 223
    return-object p0

    .line 224
    :pswitch_4
    sget-object p0, Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;->MOBILE_2G:Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;

    .line 225
    .line 226
    return-object p0

    .line 227
    :pswitch_5
    sget-object p0, Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;->UNKNOWN:Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;

    .line 228
    .line 229
    return-object p0

    .line 230
    :cond_7
    sget-object p0, Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;->MOBILE:Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 231
    .line 232
    return-object p0

    .line 233
    :catchall_0
    move-exception p0

    .line 234
    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object p0

    .line 238
    sput-object p0, Lcom/bytedance/realx/base/NetworkTypeUtils;->debugInfo:Ljava/lang/String;

    .line 239
    .line 240
    sget-object p0, Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;->UNKNOWN:Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;

    .line 241
    .line 242
    return-object p0

    .line 243
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static is2G(Landroid/content/Context;)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Lcom/bytedance/realx/base/NetworkTypeUtils;->getNetworkType(Landroid/content/Context;Landroid/content/Intent;)Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    sget-object v0, Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;->MOBILE:Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;

    .line 7
    .line 8
    if-eq p0, v0, :cond_1

    .line 9
    .line 10
    sget-object v0, Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;->MOBILE_2G:Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;

    .line 11
    .line 12
    if-ne p0, v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 18
    return p0
.end method

.method public static isIpv4(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const-string v0, "^(\\d{1,2}|1\\d\\d|2[0-4]\\d|25[0-5]).(\\d{1,2}|1\\d\\d|2[0-4]\\d|25[0-5]).(\\d{1,2}|1\\d\\d|2[0-4]\\d|25[0-5]).(\\d{1,2}|1\\d\\d|2[0-4]\\d|25[0-5])$"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static isIpv6(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const-string v0, "^\\s*((([0-9A-Fa-f]{1,4}:){7}([0-9A-Fa-f]{1,4}|:))|(([0-9A-Fa-f]{1,4}:){6}(:[0-9A-Fa-f]{1,4}|((25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)(\\.(25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){5}(((:[0-9A-Fa-f]{1,4}){1,2})|:((25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)(\\.(25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){4}(((:[0-9A-Fa-f]{1,4}){1,3})|((:[0-9A-Fa-f]{1,4})?:((25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)(\\.(25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){3}(((:[0-9A-Fa-f]{1,4}){1,4})|((:[0-9A-Fa-f]{1,4}){0,2}:((25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)(\\.(25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){2}(((:[0-9A-Fa-f]{1,4}){1,5})|((:[0-9A-Fa-f]{1,4}){0,3}:((25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)(\\.(25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){1}(((:[0-9A-Fa-f]{1,4}){1,6})|((:[0-9A-Fa-f]{1,4}){0,4}:((25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)(\\.(25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)){3}))|:))|(:(((:[0-9A-Fa-f]{1,4}){1,7})|((:[0-9A-Fa-f]{1,4}){0,5}:((25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)(\\.(25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)){3}))|:)))(%.+)?\\s*$"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static isNetWorkConnected(Landroid/content/Context;Landroid/content/Intent;)Landroid/net/NetworkInfo;
    .locals 3

    .line 1
    const-string p0, "android.net.conn.CONNECTIVITY_CHANGE"

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const/4 v0, 0x0

    .line 12
    if-eqz p0, :cond_3

    .line 13
    .line 14
    const-string p0, "networkInfo"

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Landroid/net/NetworkInfo;

    .line 21
    .line 22
    if-eqz p0, :cond_3

    .line 23
    .line 24
    sget-object p1, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string v2, "NetworkTypeUtils"

    .line 31
    .line 32
    if-ne p1, v1, :cond_2

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->isAvailable()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getType()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    const/4 v0, 0x1

    .line 45
    if-eq p1, v0, :cond_1

    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getType()I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-nez p1, :cond_0

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    return-object p0

    .line 55
    :cond_1
    :goto_0
    const-string p1, "-------networkInfo wifi or mobile is connected"

    .line 56
    .line 57
    invoke-static {v2, p1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-object p0

    .line 61
    :cond_2
    const-string p0, "------networkInfo is discconnected"

    .line 62
    .line 63
    invoke-static {v2, p0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    :cond_3
    return-object v0
.end method

.method public static isNetworkAvailable(Landroid/content/Context;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    const-string v1, "connectivity"

    .line 3
    .line 4
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Landroid/net/ConnectivityManager;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->isConnected()Z

    .line 17
    .line 18
    .line 19
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :catch_0
    :cond_0
    return v0
.end method

.method public static isWifi(Landroid/content/Context;)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    const-string v1, "connectivity"

    .line 3
    .line 4
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Landroid/net/ConnectivityManager;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    if-eqz p0, :cond_3

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->isAvailable()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    sget-object v1, Lcom/bytedance/realx/base/NetworkTypeUtils;->sNetworkTypeInterceptor:Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkTypeInterceptor;

    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    if-eqz v1, :cond_2

    .line 27
    .line 28
    invoke-interface {v1}, Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkTypeInterceptor;->getNetworkType()Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    sget-object v3, Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;->NONE:Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;

    .line 33
    .line 34
    if-eq v1, v3, :cond_2

    .line 35
    .line 36
    sget-object p0, Lcom/bytedance/realx/base/NetworkTypeUtils;->sNetworkTypeInterceptor:Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkTypeInterceptor;

    .line 37
    .line 38
    invoke-interface {p0}, Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkTypeInterceptor;->getNetworkType()Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    sget-object v1, Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;->WIFI:Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;

    .line 43
    .line 44
    if-ne p0, v1, :cond_1

    .line 45
    .line 46
    return v2

    .line 47
    :cond_1
    return v0

    .line 48
    :cond_2
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getType()I

    .line 49
    .line 50
    .line 51
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    if-ne v2, p0, :cond_3

    .line 53
    .line 54
    return v2

    .line 55
    :catch_0
    :cond_3
    :goto_0
    return v0
.end method

.method public static registerReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/content/IntentFilter;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-string v1, "android.net.wifi.WIFI_STATE_CHANGED"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const-string v1, "android.net.wifi.STATE_CHANGE"

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p0, p1, v0}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public static setNetworkTypeInterceptor(Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkTypeInterceptor;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/bytedance/realx/base/NetworkTypeUtils;->sNetworkTypeInterceptor:Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkTypeInterceptor;

    .line 2
    .line 3
    return-void
.end method

.method public static unregisterReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
