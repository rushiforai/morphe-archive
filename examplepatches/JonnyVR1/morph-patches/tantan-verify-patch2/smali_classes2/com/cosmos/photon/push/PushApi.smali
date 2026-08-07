.class public Lcom/cosmos/photon/push/PushApi;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final ACTION_REG:Ljava/lang/String; = "reg"

.field private static final ACTION_REGWITHALIAS:Ljava/lang/String; = "regwithalias"

.field private static final API:Ljava/lang/String; = "https://paas-push-api.immomo.com/push/index/"

.field private static final API_PREFIX:Ljava/lang/String; = "https://paas-push-api.immomo.com/push/"

.field private static final DATA:Ljava/lang/String; = "data"

.field private static final EC:Ljava/lang/String; = "ec"

.field private static final EM:Ljava/lang/String; = "em"

.field private static final LOG_API_PREFIX:Ljava/lang/String; = "https://paas-push-api-log.immomo.com/push/"

.field private static final PARAMS_AIDS:Ljava/lang/String; = "aIds"

.field private static final PARAMS_ALIAS:Ljava/lang/String; = "alias"

.field private static final PARAMS_APP_ID:Ljava/lang/String; = "app_id"

.field private static final PARAMS_DEVICE_ID:Ljava/lang/String; = "device_id"

.field private static final PARAMS_MSC:Ljava/lang/String; = "msc"

.field private static final PARAMS_MZIP:Ljava/lang/String; = "mzip"

.field private static final PARAMS_NBAR:Ljava/lang/String; = "n_bar"

.field private static final PARAMS_NBAR_CHANNELS:Ljava/lang/String; = "channels"

.field private static final PARAMS_NBAR_CHANNELS_CONFIG:Ljava/lang/String; = "config"

.field private static final PARAMS_NBAR_CHANNELS_ID:Ljava/lang/String; = "id"

.field private static final PARAMS_NBAR_CHANNELS_OPEN:Ljava/lang/String; = "open"

.field private static final PARAMS_NBAR_OPEN:Ljava/lang/String; = "open"

.field private static final PARAMS_SHA1:Ljava/lang/String; = "keystore_sha1"

.field private static final PARAMS_SN:Ljava/lang/String; = "sn"

.field private static final PARAMS_TAG:Ljava/lang/String; = "tag"

.field private static final PARAMS_TOKEN:Ljava/lang/String; = "token"

.field private static final PARAMS_UNIQ_DID:Ljava/lang/String; = "uniq_did"

.field private static final PARAMS_VENDOR_TOKEN:Ljava/lang/String; = "vendor_token"

.field private static final PARAMS_VENDOR_TYPE:Ljava/lang/String; = "vendor_type"

.field private static final TAG_API:Ljava/lang/String; = "https://paas-push-api.immomo.com/push/tag/"

.field private static final TIMEOUT_READ:I = 0x5

.field private static final TIMEOUT_WRITE:I = 0xf

.field private static final TOKEN:Ljava/lang/String; = "token"

.field private static final client:Ll/rg50;

.field private static logoutPath:Ljava/lang/String;

.field private static unAliasPath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ll/rg50$b;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/rg50$b;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lcom/cosmos/photon/push/dns/RequestEventListener;

    .line 7
    .line 8
    invoke-direct {v1}, Lcom/cosmos/photon/push/dns/RequestEventListener;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/rg50$b;->k(Ll/t4f;)Ll/rg50$b;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Lcom/cosmos/photon/push/dns/PushHttpDns;

    .line 16
    .line 17
    const-string v2, "8701b0b5e66f551562c78781b1dc88c3"

    .line 18
    .line 19
    invoke-direct {v1, v2}, Lcom/cosmos/photon/push/dns/PushHttpDns;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ll/rg50$b;->j(Ll/o6e;)Ll/rg50$b;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Lcom/cosmos/photon/push/PushApi$1;

    .line 27
    .line 28
    invoke-direct {v1}, Lcom/cosmos/photon/push/PushApi$1;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ll/rg50$b;->a(Ll/azm;)Ll/rg50$b;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-wide/16 v1, 0xf

    .line 36
    .line 37
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 38
    .line 39
    invoke-virtual {v0, v1, v2, v3}, Ll/rg50$b;->y(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-wide/16 v1, 0x5

    .line 44
    .line 45
    invoke-virtual {v0, v1, v2, v3}, Ll/rg50$b;->u(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Ll/rg50$b;->c()Ll/rg50;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    sput-object v0, Lcom/cosmos/photon/push/PushApi;->client:Ll/rg50;

    .line 54
    .line 55
    new-instance v0, Ljava/io/File;

    .line 56
    .line 57
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getContext()Landroid/content/Context;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    const-string v2, "unalias"

    .line 66
    .line 67
    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    sput-object v0, Lcom/cosmos/photon/push/PushApi;->unAliasPath:Ljava/lang/String;

    .line 75
    .line 76
    new-instance v0, Ljava/io/File;

    .line 77
    .line 78
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getContext()Landroid/content/Context;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    const-string v2, "logout"

    .line 87
    .line 88
    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    sput-object v0, Lcom/cosmos/photon/push/PushApi;->logoutPath:Ljava/lang/String;

    .line 96
    .line 97
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

.method public static synthetic access$000(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Lcom/cosmos/photon/push/PushApi;->request(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic access$100()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/cosmos/photon/push/PushApi;->unAliasPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$200()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/cosmos/photon/push/PushApi;->logoutPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$300(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Lcom/cosmos/photon/push/PushApi;->doPost(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static alias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/cosmos/photon/push/PushApi$3;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/cosmos/photon/push/PushApi$3;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/cosmos/photon/push/util/ThreadUtils;->execute(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static checkUnSendData()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/cosmos/photon/push/util/NetUtil;->isNetworkAvailable()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    new-instance v0, Ljava/io/File;

    .line 8
    .line 9
    sget-object v1, Lcom/cosmos/photon/push/PushApi;->unAliasPath:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-static {}, Lcom/cosmos/photon/push/PushApi;->unAliasFromFile()V

    .line 21
    .line 22
    .line 23
    :cond_0
    new-instance v0, Ljava/io/File;

    .line 24
    .line 25
    sget-object v1, Lcom/cosmos/photon/push/PushApi;->logoutPath:Ljava/lang/String;

    .line 26
    .line 27
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-static {}, Lcom/cosmos/photon/push/PushApi;->logoutFromFile()V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method private static doPost(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const-string v0, "doPost: %s params\uff1a%s"

    .line 2
    .line 3
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "MoPush-API"

    .line 8
    .line 9
    invoke-static {v2, v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Lorg/json/JSONObject;

    .line 13
    .line 14
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-eqz v3, :cond_0

    .line 30
    .line 31
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    check-cast v3, Ljava/lang/String;

    .line 36
    .line 37
    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    new-instance p1, Ll/l1j$a;

    .line 46
    .line 47
    invoke-direct {p1}, Ll/l1j$a;-><init>()V

    .line 48
    .line 49
    .line 50
    const/16 v1, 0xc

    .line 51
    .line 52
    invoke-static {v1}, Lcom/cosmos/photon/push/util/ENCUtils;->random(I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-static {v3}, Lcom/cosmos/photon/push/util/ENCUtils;->RSAEncode([B)[B

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-static {v3}, Lcom/cosmos/photon/push/util/Base64;->encode([B)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    const-string v4, "msc"

    .line 69
    .line 70
    invoke-virtual {p1, v4, v3}, Ll/l1j$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/l1j$a;

    .line 71
    .line 72
    .line 73
    invoke-static {}, Lcom/cosmos/photon/push/util/ENCUtils;->getInstance()Lcom/cosmos/photon/push/util/ENCUtils;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-static {v0}, Lcom/cosmos/photon/push/util/Base64;->encode([B)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {v3, v0, v1}, Lcom/cosmos/photon/push/util/ENCUtils;->encrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    const-string v3, "mzip"

    .line 94
    .line 95
    invoke-virtual {p1, v3, v0}, Ll/l1j$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/l1j$a;

    .line 96
    .line 97
    .line 98
    new-instance v0, Ll/x1d0$a;

    .line 99
    .line 100
    invoke-direct {v0}, Ll/x1d0$a;-><init>()V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {p1}, Ll/l1j$a;->b()Ll/l1j;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {v0, p1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    const-string v0, "User-Agent"

    .line 116
    .line 117
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getUserAgent()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    invoke-virtual {p1, v0, v4}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-virtual {p1}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    sget-object v0, Lcom/cosmos/photon/push/PushApi;->client:Ll/rg50;

    .line 130
    .line 131
    invoke-virtual {v0, p1}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-interface {p1}, Ll/ry3;->execute()Ll/i5d0;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-virtual {p1}, Ll/i5d0;->k()Ll/k5d0;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-virtual {p1}, Ll/k5d0;->bytes()[B

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    new-instance v0, Ljava/lang/String;

    .line 148
    .line 149
    const-string v4, "UTF-8"

    .line 150
    .line 151
    invoke-direct {v0, p1, v4}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 152
    .line 153
    .line 154
    new-instance p1, Lorg/json/JSONObject;

    .line 155
    .line 156
    invoke-direct {p1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    const-string v4, "ec"

    .line 160
    .line 161
    const/4 v5, -0x1

    .line 162
    invoke-virtual {p1, v4, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 163
    .line 164
    .line 165
    move-result v4

    .line 166
    if-nez v4, :cond_1

    .line 167
    .line 168
    const-string v4, "data"

    .line 169
    .line 170
    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 171
    .line 172
    .line 173
    move-result-object v5

    .line 174
    if-eqz v5, :cond_1

    .line 175
    .line 176
    invoke-virtual {v5, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v3

    .line 180
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 181
    .line 182
    .line 183
    move-result v5

    .line 184
    if-nez v5, :cond_1

    .line 185
    .line 186
    new-instance v0, Lorg/json/JSONObject;

    .line 187
    .line 188
    invoke-static {}, Lcom/cosmos/photon/push/util/ENCUtils;->getInstance()Lcom/cosmos/photon/push/util/ENCUtils;

    .line 189
    .line 190
    .line 191
    move-result-object v5

    .line 192
    invoke-virtual {v5, v3, v1}, Lcom/cosmos/photon/push/util/ENCUtils;->decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {p1, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 200
    .line 201
    .line 202
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    :cond_1
    const-string p1, "url: %s response\uff1a%s"

    .line 207
    .line 208
    filled-new-array {p0, v0}, [Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    invoke-static {v2, p1, p0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 213
    .line 214
    .line 215
    return-object v0
.end method

.method private static getChannelConfigs(Landroid/app/NotificationChannel;)Ljava/lang/String;
    .locals 3
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x1a
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/fy40;->a(Landroid/app/NotificationChannel;)I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ","

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-static {p0}, Ll/blb0;->a(Landroid/app/NotificationChannel;)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-static {p0}, Ll/clb0;->a(Landroid/app/NotificationChannel;)I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-static {p0}, Ll/dlb0;->a(Landroid/app/NotificationChannel;)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-static {p0}, Ll/elb0;->a(Landroid/app/NotificationChannel;)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0
.end method

.method private static getNBarParams()Lorg/json/JSONObject;
    .locals 8

    .line 1
    const-string v0, "open"

    .line 2
    .line 3
    new-instance v1, Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-static {v2}, Ll/c050;->e(Landroid/content/Context;)Ll/c050;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    :try_start_0
    invoke-virtual {v2}, Ll/c050;->a()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 21
    .line 22
    .line 23
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 24
    .line 25
    const/16 v3, 0x1a

    .line 26
    .line 27
    if-lt v2, v3, :cond_2

    .line 28
    .line 29
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    const-string v3, "notification"

    .line 34
    .line 35
    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Landroid/app/NotificationManager;

    .line 40
    .line 41
    invoke-static {v2}, Ll/flb0;->a(Landroid/app/NotificationManager;)Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    if-eqz v3, :cond_2

    .line 50
    .line 51
    new-instance v3, Lorg/json/JSONArray;

    .line 52
    .line 53
    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    if-eqz v4, :cond_1

    .line 65
    .line 66
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    invoke-static {v4}, Ll/glb0;->a(Ljava/lang/Object;)Landroid/app/NotificationChannel;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    new-instance v5, Lorg/json/JSONObject;

    .line 75
    .line 76
    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 77
    .line 78
    .line 79
    const-string v6, "id"

    .line 80
    .line 81
    invoke-static {v4}, Ll/hlb0;->a(Landroid/app/NotificationChannel;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v7

    .line 85
    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 86
    .line 87
    .line 88
    invoke-static {v4}, Ll/fy40;->a(Landroid/app/NotificationChannel;)I

    .line 89
    .line 90
    .line 91
    move-result v6

    .line 92
    if-eqz v6, :cond_0

    .line 93
    .line 94
    const/4 v6, 0x1

    .line 95
    goto :goto_1

    .line 96
    :cond_0
    const/4 v6, 0x0

    .line 97
    :goto_1
    invoke-virtual {v5, v0, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 98
    .line 99
    .line 100
    const-string v6, "config"

    .line 101
    .line 102
    invoke-static {v4}, Lcom/cosmos/photon/push/PushApi;->getChannelConfigs(Landroid/app/NotificationChannel;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    invoke-virtual {v5, v6, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 110
    .line 111
    .line 112
    goto :goto_0

    .line 113
    :catch_0
    move-exception v0

    .line 114
    goto :goto_2

    .line 115
    :cond_1
    const-string v0, "channels"

    .line 116
    .line 117
    invoke-virtual {v1, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 118
    .line 119
    .line 120
    goto :goto_3

    .line 121
    :goto_2
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 122
    .line 123
    .line 124
    :cond_2
    :goto_3
    const-string v0, "n_bar"

    .line 125
    .line 126
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    invoke-static {v0, v2}, Lcom/cosmos/mdlog/MDLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    return-object v1
.end method

.method public static log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "http post log : %s"

    .line 2
    .line 3
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "MoPush-API"

    .line 8
    .line 9
    invoke-static {v2, v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Lcom/cosmos/photon/push/PushApi$11;

    .line 13
    .line 14
    invoke-direct {v0, p0, p1, p2}, Lcom/cosmos/photon/push/PushApi$11;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v0}, Lcom/cosmos/photon/push/util/ThreadUtils;->execute(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static logout(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/cosmos/photon/push/PushApi$7;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/cosmos/photon/push/PushApi$7;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/cosmos/photon/push/util/ThreadUtils;->execute(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private static logoutFromFile()V
    .locals 2

    .line 1
    const-string v0, "MoPush-API"

    .line 2
    .line 3
    const-string v1, "logoutFromFile"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Lcom/cosmos/photon/push/PushApi$10;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/cosmos/photon/push/PushApi$10;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-static {v0}, Lcom/cosmos/photon/push/util/ThreadUtils;->execute(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static regVendor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/cosmos/photon/push/PushApi$6;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/cosmos/photon/push/PushApi$6;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/cosmos/photon/push/util/ThreadUtils;->execute(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static register(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 16
    invoke-static {p0, p1, v0, v0}, Lcom/cosmos/photon/push/PushApi;->register(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static register(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 15
    invoke-static {p0, p1, p2, p3, v0}, Lcom/cosmos/photon/push/PushApi;->register(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method public static register(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 6

    .line 1
    new-instance v0, Lcom/cosmos/photon/push/PushApi$2;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move-object v4, p3

    .line 7
    move v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Lcom/cosmos/photon/push/PushApi$2;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, Lcom/cosmos/photon/push/util/ThreadUtils;->execute(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private static request(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const-string v0, "action: %s request\uff1a%s"

    .line 2
    .line 3
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "MoPush-API"

    .line 8
    .line 9
    invoke-static {v2, v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Lorg/json/JSONObject;

    .line 13
    .line 14
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-eqz v3, :cond_0

    .line 30
    .line 31
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    check-cast v3, Ljava/lang/String;

    .line 36
    .line 37
    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    const-string p1, "reg"

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    const-string v3, "regwithalias"

    .line 52
    .line 53
    if-nez v1, :cond_1

    .line 54
    .line 55
    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_2

    .line 60
    .line 61
    :cond_1
    const-string v1, "n_bar"

    .line 62
    .line 63
    invoke-static {}, Lcom/cosmos/photon/push/PushApi;->getNBarParams()Lorg/json/JSONObject;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    invoke-virtual {v0, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 68
    .line 69
    .line 70
    invoke-static {}, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->getInstance()Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v1}, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->getUniqueId()Lorg/json/JSONObject;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    const-string v4, "aIds"

    .line 79
    .line 80
    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 81
    .line 82
    .line 83
    invoke-static {}, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->getInstance()Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-virtual {v1}, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->getPushID()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    const-string v4, "uniq_did"

    .line 92
    .line 93
    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 94
    .line 95
    .line 96
    :cond_2
    new-instance v1, Ll/l1j$a;

    .line 97
    .line 98
    invoke-direct {v1}, Ll/l1j$a;-><init>()V

    .line 99
    .line 100
    .line 101
    const/16 v4, 0xc

    .line 102
    .line 103
    invoke-static {v4}, Lcom/cosmos/photon/push/util/ENCUtils;->random(I)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    .line 108
    .line 109
    .line 110
    move-result-object v5

    .line 111
    invoke-static {v5}, Lcom/cosmos/photon/push/util/ENCUtils;->RSAEncode([B)[B

    .line 112
    .line 113
    .line 114
    move-result-object v5

    .line 115
    invoke-static {v5}, Lcom/cosmos/photon/push/util/Base64;->encode([B)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v5

    .line 119
    const-string v6, "msc"

    .line 120
    .line 121
    invoke-virtual {v1, v6, v5}, Ll/l1j$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/l1j$a;

    .line 122
    .line 123
    .line 124
    invoke-static {}, Lcom/cosmos/photon/push/util/ENCUtils;->getInstance()Lcom/cosmos/photon/push/util/ENCUtils;

    .line 125
    .line 126
    .line 127
    move-result-object v5

    .line 128
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-static {v0}, Lcom/cosmos/photon/push/util/Base64;->encode([B)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-virtual {v5, v0, v4}, Lcom/cosmos/photon/push/util/ENCUtils;->encrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    const-string v5, "mzip"

    .line 145
    .line 146
    invoke-virtual {v1, v5, v0}, Ll/l1j$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/l1j$a;

    .line 147
    .line 148
    .line 149
    new-instance v0, Ll/x1d0$a;

    .line 150
    .line 151
    invoke-direct {v0}, Ll/x1d0$a;-><init>()V

    .line 152
    .line 153
    .line 154
    const-string v6, "https://paas-push-api.immomo.com/push/index/"

    .line 155
    .line 156
    invoke-virtual {v6, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v6

    .line 160
    invoke-virtual {v0, v6}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-virtual {v1}, Ll/l1j$a;->b()Ll/l1j;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    invoke-virtual {v0, v1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    const-string v1, "User-Agent"

    .line 173
    .line 174
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getUserAgent()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v6

    .line 178
    invoke-virtual {v0, v1, v6}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    sget-object v1, Lcom/cosmos/photon/push/PushApi;->client:Ll/rg50;

    .line 187
    .line 188
    invoke-virtual {v1, v0}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-interface {v0}, Ll/ry3;->execute()Ll/i5d0;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-virtual {v0}, Ll/i5d0;->k()Ll/k5d0;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    invoke-virtual {v0}, Ll/k5d0;->bytes()[B

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    new-instance v1, Ljava/lang/String;

    .line 205
    .line 206
    const-string v6, "UTF-8"

    .line 207
    .line 208
    invoke-direct {v1, v0, v6}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 209
    .line 210
    .line 211
    const-string v0, "action: %s response\uff1a%s"

    .line 212
    .line 213
    filled-new-array {p0, v1}, [Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    move-result-object v6

    .line 217
    invoke-static {v2, v0, v6}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 221
    .line 222
    .line 223
    move-result p1

    .line 224
    if-nez p1, :cond_3

    .line 225
    .line 226
    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 227
    .line 228
    .line 229
    move-result p0

    .line 230
    if-eqz p0, :cond_4

    .line 231
    .line 232
    :cond_3
    new-instance p0, Lorg/json/JSONObject;

    .line 233
    .line 234
    invoke-direct {p0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    const-string p1, "ec"

    .line 238
    .line 239
    const/4 v0, -0x1

    .line 240
    invoke-virtual {p0, p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 241
    .line 242
    .line 243
    move-result p1

    .line 244
    if-nez p1, :cond_4

    .line 245
    .line 246
    const-string p1, "data"

    .line 247
    .line 248
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 249
    .line 250
    .line 251
    move-result-object v0

    .line 252
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    new-instance v1, Lorg/json/JSONObject;

    .line 257
    .line 258
    invoke-static {}, Lcom/cosmos/photon/push/util/ENCUtils;->getInstance()Lcom/cosmos/photon/push/util/ENCUtils;

    .line 259
    .line 260
    .line 261
    move-result-object v2

    .line 262
    invoke-virtual {v2, v0, v4}, Lcom/cosmos/photon/push/util/ENCUtils;->decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v0

    .line 266
    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 267
    .line 268
    .line 269
    invoke-virtual {p0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 270
    .line 271
    .line 272
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object p0

    .line 276
    return-object p0

    .line 277
    :cond_4
    return-object v1
.end method

.method public static tags(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/cosmos/photon/push/PushApi$8;

    .line 2
    .line 3
    invoke-direct {v0, p1, p0, p2, p3}, Lcom/cosmos/photon/push/PushApi$8;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/cosmos/photon/push/util/ThreadUtils;->execute(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static unAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/cosmos/photon/push/PushApi$5;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/cosmos/photon/push/PushApi$5;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/cosmos/photon/push/util/ThreadUtils;->execute(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private static unAliasFromFile()V
    .locals 2

    .line 1
    const-string v0, "MoPush-API"

    .line 2
    .line 3
    const-string v1, "unAliasFromFile"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Lcom/cosmos/photon/push/PushApi$4;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/cosmos/photon/push/PushApi$4;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-static {v0}, Lcom/cosmos/photon/push/util/ThreadUtils;->execute(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static unTags(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/cosmos/photon/push/PushApi$9;

    .line 2
    .line 3
    invoke-direct {v0, p1, p0, p2, p3}, Lcom/cosmos/photon/push/PushApi$9;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/cosmos/photon/push/util/ThreadUtils;->execute(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static uploadLogFile(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Z
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_2

    .line 7
    .line 8
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_2

    .line 13
    .line 14
    if-eqz p2, :cond_2

    .line 15
    .line 16
    invoke-interface {p2}, Ljava/util/Map;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-gtz v0, :cond_0

    .line 21
    .line 22
    goto/16 :goto_1

    .line 23
    .line 24
    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    .line 25
    .line 26
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v2, "token"

    .line 30
    .line 31
    invoke-virtual {v0, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 32
    .line 33
    .line 34
    const-string p0, "app_id"

    .line 35
    .line 36
    invoke-virtual {v0, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 37
    .line 38
    .line 39
    const/16 p0, 0xc

    .line 40
    .line 41
    invoke-static {p0}, Lcom/cosmos/photon/push/util/ENCUtils;->random(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-static {p1}, Lcom/cosmos/photon/push/util/ENCUtils;->RSAEncode([B)[B

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-static {p1}, Lcom/cosmos/photon/push/util/Base64;->encode([B)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-static {}, Lcom/cosmos/photon/push/util/ENCUtils;->getInstance()Lcom/cosmos/photon/push/util/ENCUtils;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-static {v0}, Lcom/cosmos/photon/push/util/Base64;->encode([B)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v2, v0, p0}, Lcom/cosmos/photon/push/util/ENCUtils;->encrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    new-instance v0, Ll/ku10$a;

    .line 78
    .line 79
    const-string v2, "---------------------------7da2137580612"

    .line 80
    .line 81
    invoke-direct {v0, v2}, Ll/ku10$a;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    const-string v2, "multipart/form-data; boundary=---------------------------7da2137580612"

    .line 85
    .line 86
    invoke-static {v2}, Ll/e7y;->d(Ljava/lang/String;)Ll/e7y;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-virtual {v0, v2}, Ll/ku10$a;->f(Ll/e7y;)Ll/ku10$a;

    .line 91
    .line 92
    .line 93
    new-instance v2, Lorg/json/JSONArray;

    .line 94
    .line 95
    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 103
    .line 104
    .line 105
    move-result-object p2

    .line 106
    move v3, v1

    .line 107
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 108
    .line 109
    .line 110
    move-result v4

    .line 111
    const/4 v5, 0x1

    .line 112
    if-eqz v4, :cond_1

    .line 113
    .line 114
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v4

    .line 118
    check-cast v4, Ljava/util/Map$Entry;

    .line 119
    .line 120
    const-string v6, "application/octet-stream"

    .line 121
    .line 122
    invoke-static {v6}, Ll/e7y;->d(Ljava/lang/String;)Ll/e7y;

    .line 123
    .line 124
    .line 125
    move-result-object v6

    .line 126
    new-instance v7, Ljava/io/File;

    .line 127
    .line 128
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v8

    .line 132
    check-cast v8, Ljava/lang/String;

    .line 133
    .line 134
    invoke-direct {v7, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    invoke-static {v6, v7}, Ll/z1d0;->create(Ll/e7y;Ljava/io/File;)Ll/z1d0;

    .line 138
    .line 139
    .line 140
    move-result-object v6

    .line 141
    new-instance v7, Ljava/lang/StringBuilder;

    .line 142
    .line 143
    const-string v8, "mmfile_"

    .line 144
    .line 145
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v7

    .line 155
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object v4

    .line 159
    check-cast v4, Ljava/lang/String;

    .line 160
    .line 161
    invoke-static {v7, v4, v6}, Ll/ku10$b;->c(Ljava/lang/String;Ljava/lang/String;Ll/z1d0;)Ll/ku10$b;

    .line 162
    .line 163
    .line 164
    move-result-object v4

    .line 165
    invoke-virtual {v0, v4}, Ll/ku10$a;->d(Ll/ku10$b;)Ll/ku10$a;

    .line 166
    .line 167
    .line 168
    new-instance v4, Lorg/json/JSONObject;

    .line 169
    .line 170
    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 171
    .line 172
    .line 173
    new-instance v6, Ljava/lang/StringBuilder;

    .line 174
    .line 175
    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v6

    .line 185
    const-string v7, "key"

    .line 186
    .line 187
    invoke-virtual {v4, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 188
    .line 189
    .line 190
    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 191
    .line 192
    .line 193
    add-int/2addr v3, v5

    .line 194
    goto :goto_0

    .line 195
    :cond_1
    const-string p2, "msc"

    .line 196
    .line 197
    invoke-virtual {v0, p2, p1}, Ll/ku10$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ku10$a;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    const-string p2, "mzip"

    .line 202
    .line 203
    invoke-virtual {p1, p2, p0}, Ll/ku10$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ku10$a;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    const-string p1, "mmfile"

    .line 208
    .line 209
    invoke-virtual {v2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object p2

    .line 213
    invoke-virtual {p0, p1, p2}, Ll/ku10$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ku10$a;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    invoke-virtual {p0}, Ll/ku10$a;->e()Ll/ku10;

    .line 218
    .line 219
    .line 220
    move-result-object p0

    .line 221
    new-instance p1, Ll/x1d0$a;

    .line 222
    .line 223
    invoke-direct {p1}, Ll/x1d0$a;-><init>()V

    .line 224
    .line 225
    .line 226
    const-string p2, "https://paas-push-api-log.immomo.com/push/log/upload"

    .line 227
    .line 228
    invoke-virtual {p1, p2}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    const-string p2, "User-Agent"

    .line 233
    .line 234
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getUserAgent()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    invoke-virtual {p1, p2, v0}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 239
    .line 240
    .line 241
    move-result-object p1

    .line 242
    invoke-virtual {p1, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 243
    .line 244
    .line 245
    move-result-object p0

    .line 246
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 247
    .line 248
    .line 249
    move-result-object p0

    .line 250
    sget-object p1, Lcom/cosmos/photon/push/PushApi;->client:Ll/rg50;

    .line 251
    .line 252
    invoke-virtual {p1, p0}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 253
    .line 254
    .line 255
    move-result-object p0

    .line 256
    invoke-interface {p0}, Ll/ry3;->execute()Ll/i5d0;

    .line 257
    .line 258
    .line 259
    move-result-object p0

    .line 260
    invoke-virtual {p0}, Ll/i5d0;->I()Z

    .line 261
    .line 262
    .line 263
    move-result p1

    .line 264
    if-eqz p1, :cond_2

    .line 265
    .line 266
    invoke-virtual {p0}, Ll/i5d0;->k()Ll/k5d0;

    .line 267
    .line 268
    .line 269
    move-result-object p0

    .line 270
    invoke-virtual {p0}, Ll/k5d0;->bytes()[B

    .line 271
    .line 272
    .line 273
    move-result-object p0

    .line 274
    new-instance p1, Ljava/lang/String;

    .line 275
    .line 276
    const-string p2, "UTF-8"

    .line 277
    .line 278
    invoke-direct {p1, p0, p2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 279
    .line 280
    .line 281
    new-instance p0, Lorg/json/JSONObject;

    .line 282
    .line 283
    invoke-direct {p0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 284
    .line 285
    .line 286
    const-string p1, "ec"

    .line 287
    .line 288
    const/4 p2, -0x1

    .line 289
    invoke-virtual {p0, p1, p2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 290
    .line 291
    .line 292
    move-result p1

    .line 293
    const-string p2, "log/upload"

    .line 294
    .line 295
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object p0

    .line 299
    filled-new-array {p2, p0}, [Ljava/lang/Object;

    .line 300
    .line 301
    .line 302
    move-result-object p0

    .line 303
    const-string p2, "MoPush-API"

    .line 304
    .line 305
    const-string v0, "action: %s response\uff1a%s"

    .line 306
    .line 307
    invoke-static {p2, v0, p0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 308
    .line 309
    .line 310
    if-nez p1, :cond_2

    .line 311
    .line 312
    return v5

    .line 313
    :cond_2
    :goto_1
    return v1
.end method
