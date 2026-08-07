.class public Ll/qk20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/asl;


# static fields
.field private static a:Ljava/lang/String; = "InitDeviceIntl"

.field private static b:Ljava/lang/String; = "OcrDeviceIntl"

.field private static c:Ljava/lang/String; = "VerifyDeviceIntl"

.field private static d:Ljava/lang/String; = "UploadDeviceInfosIntl"

.field private static e:Ljava/lang/String; = "UpdateOcrCardInfosIntl"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
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

.method public static synthetic c()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/qk20;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static d(Lcom/idv/identity/platform/model/ZimInitContent;)Lcom/idv/identity/platform/config/OSSConfig;
    .locals 5
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Lcom/idv/identity/platform/config/OSSConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/idv/identity/platform/config/OSSConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/idv/identity/platform/model/ZimInitContent;->getAccessKeyId()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iput-object v1, v0, Lcom/idv/identity/platform/config/OSSConfig;->AccessKeyId:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/idv/identity/platform/model/ZimInitContent;->getAccessKeySecret()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iput-object v1, v0, Lcom/idv/identity/platform/config/OSSConfig;->AccessKeySecret:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/idv/identity/platform/model/ZimInitContent;->getSecurityToken()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, v0, Lcom/idv/identity/platform/config/OSSConfig;->SecurityToken:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/idv/identity/platform/model/ZimInitContent;->getBucketName()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iput-object v1, v0, Lcom/idv/identity/platform/config/OSSConfig;->BucketName:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/idv/identity/platform/model/ZimInitContent;->getFileName()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, v0, Lcom/idv/identity/platform/config/OSSConfig;->FileNamePrefix:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/idv/identity/platform/model/ZimInitContent;->getOssEndPoint()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iput-object v1, v0, Lcom/idv/identity/platform/config/OSSConfig;->OssEndPoint:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/idv/identity/platform/model/ZimInitContent;->getProductCode()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v2, v1}, Ll/afm;->O1(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {p0}, Lcom/idv/identity/platform/model/ZimInitContent;->getImageCount()I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    invoke-virtual {v1, v2}, Ll/afm;->f1(I)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/idv/identity/platform/model/ZimInitContent;->getDocType()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {v2, v1}, Ll/afm;->T0(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/idv/identity/platform/model/ZimInitContent;->getDocPageTotalNum()I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {v2, v1}, Ll/afm;->S0(I)V

    .line 84
    .line 85
    .line 86
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {p0}, Lcom/idv/identity/platform/model/ZimInitContent;->getPictureMaxWidth()F

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    invoke-virtual {p0}, Lcom/idv/identity/platform/model/ZimInitContent;->getAlbumMaxWidth()F

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    invoke-virtual {p0}, Lcom/idv/identity/platform/model/ZimInitContent;->getOriPicMaxWidth()F

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    invoke-virtual {p0}, Lcom/idv/identity/platform/model/ZimInitContent;->getPictureQuality()F

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    invoke-virtual {v1, v2, v3, v4, p0}, Ll/afm;->N1(FFFF)V

    .line 107
    .line 108
    .line 109
    return-object v0
.end method

.method private static e(Ljava/lang/String;Ljava/util/Map;Ll/h5g$a;Ll/wk80;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ll/h5g$a;",
            "Ll/wk80;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/afm;->K()Ll/tj20;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string p0, " the networkENV can not be read "

    .line 12
    .line 13
    invoke-static {p0}, Ll/o6r0;->c(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object v1, v0, Ll/tj20;->a:Ljava/lang/String;

    .line 18
    .line 19
    sput-object v1, Ll/xk80;->b:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v0, v0, Ll/tj20;->e:Ljava/lang/String;

    .line 22
    .line 23
    sput-object v0, Ll/xk80;->a:Ljava/lang/String;

    .line 24
    .line 25
    new-instance v0, Ll/h5g;

    .line 26
    .line 27
    invoke-direct {v0, p2}, Ll/h5g;-><init>(Ll/h5g$a;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0}, Ll/xk80;->e(Ll/h5g;)V

    .line 31
    .line 32
    .line 33
    new-instance p2, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v1, "FallbackUrls"

    .line 36
    .line 37
    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ll/h5g;->a()Ll/h5g$a;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-interface {v1}, Ll/h5g$a;->b()Ljava/util/List;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v1, " FallbackHosts"

    .line 52
    .line 53
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Ll/h5g;->a()Ll/h5g$a;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-interface {v0}, Ll/h5g$a;->a()Ljava/util/List;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    const-string v0, "FallbackConfigManager"

    .line 72
    .line 73
    invoke-static {v0, p2}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    const-string p2, "2022-08-09"

    .line 77
    .line 78
    invoke-static {p0, p2, p1, p3}, Ll/xk80;->f(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ll/wk80;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public static f(Ljava/lang/String;Ljava/lang/String;ZLl/kpq0;)V
    .locals 5

    .line 1
    new-instance p2, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 11
    .line 12
    const-string v2, "certifyId"

    .line 13
    .line 14
    const-string v3, "metaInfo"

    .line 15
    .line 16
    filled-new-array {v2, p0, v3, p1}, [Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    const-string v4, "initSmartDevice"

    .line 21
    .line 22
    invoke-virtual {v0, v1, v4, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    new-instance v0, Lcom/alibaba/fastjson/JSONObject;

    .line 26
    .line 27
    invoke-direct {v0}, Lcom/alibaba/fastjson/JSONObject;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v3, p1}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSON;->toJSONString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-static {p1, p0}, Lcom/idv/identity/util/IdentityUtils;->se([BLjava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    :cond_0
    const-string v0, "RequestData"

    .line 48
    .line 49
    invoke-interface {p2, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    const-string p1, "CertifyId"

    .line 53
    .line 54
    invoke-interface {p2, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    const-string p1, "AppVersion"

    .line 58
    .line 59
    const-string v0, "2022-08-09"

    .line 60
    .line 61
    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    sget-object p1, Ll/qk20;->a:Ljava/lang/String;

    .line 65
    .line 66
    new-instance v0, Ll/eum;

    .line 67
    .line 68
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v1}, Ll/afm;->K()Ll/tj20;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-direct {v0, v1}, Ll/eum;-><init>(Ll/tj20;)V

    .line 77
    .line 78
    .line 79
    new-instance v1, Ll/qk20$a;

    .line 80
    .line 81
    invoke-direct {v1, p0, p3}, Ll/qk20$a;-><init>(Ljava/lang/String;Ll/kpq0;)V

    .line 82
    .line 83
    .line 84
    invoke-static {p1, p2, v0, v1}, Ll/qk20;->e(Ljava/lang/String;Ljava/util/Map;Ll/h5g$a;Ll/wk80;)V

    .line 85
    .line 86
    .line 87
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p0}, Lcom/idv/identity/platform/log/RecordService;->flush()V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public static g(Ljava/util/Map;Z[BLl/kfm;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z[B",
            "Ll/kfm;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ll/afm;->n()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    new-instance v2, Lcom/alibaba/fastjson/JSONObject;

    .line 15
    .line 16
    invoke-direct {v2}, Lcom/alibaba/fastjson/JSONObject;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    if-eqz v4, :cond_0

    .line 32
    .line 33
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    check-cast v4, Ljava/util/Map$Entry;

    .line 38
    .line 39
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    check-cast v5, Ljava/lang/String;

    .line 44
    .line 45
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    invoke-virtual {v2, v5, v4}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    if-nez p1, :cond_1

    .line 54
    .line 55
    const-string p1, "nfcFileName"

    .line 56
    .line 57
    invoke-interface {p0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    if-eqz v3, :cond_1

    .line 62
    .line 63
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    if-eqz v3, :cond_1

    .line 68
    .line 69
    if-eqz p2, :cond_1

    .line 70
    .line 71
    new-instance v3, Lcom/alibaba/fastjson/JSONObject;

    .line 72
    .line 73
    invoke-direct {v3}, Lcom/alibaba/fastjson/JSONObject;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    check-cast p0, Ljava/lang/String;

    .line 81
    .line 82
    invoke-static {p2}, Ll/ac00;->a([B)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {v3, p0, p1}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    const-string p0, "base64Info"

    .line 90
    .line 91
    invoke-virtual {v3}, Lcom/alibaba/fastjson/JSON;->toJSONString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {v2, p0, p1}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    :cond_1
    invoke-virtual {v2}, Lcom/alibaba/fastjson/JSON;->toJSONString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    if-eqz p0, :cond_2

    .line 103
    .line 104
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-static {p0, v1}, Lcom/idv/identity/util/IdentityUtils;->se([BLjava/lang/String;)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    :cond_2
    const-string p1, "RequestData"

    .line 113
    .line 114
    invoke-interface {v0, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    const-string p0, "AppVersion"

    .line 118
    .line 119
    const-string p1, "2022-08-09"

    .line 120
    .line 121
    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    const-string p0, "CertifyId"

    .line 125
    .line 126
    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-virtual {p0}, Ll/afm;->K()Ll/tj20;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-virtual {p1}, Ll/afm;->s0()Z

    .line 142
    .line 143
    .line 144
    move-result p1

    .line 145
    sget-object p2, Ll/qk20;->e:Ljava/lang/String;

    .line 146
    .line 147
    new-instance v2, Ll/z5l0;

    .line 148
    .line 149
    invoke-direct {v2, p0, p1}, Ll/z5l0;-><init>(Ll/tj20;Z)V

    .line 150
    .line 151
    .line 152
    new-instance p0, Ll/qk20$e;

    .line 153
    .line 154
    invoke-direct {p0, v1, p3}, Ll/qk20$e;-><init>(Ljava/lang/String;Ll/kfm;)V

    .line 155
    .line 156
    .line 157
    invoke-static {p2, v0, v2, p0}, Ll/qk20;->e(Ljava/lang/String;Ljava/util/Map;Ll/h5g$a;Ll/wk80;)V

    .line 158
    .line 159
    .line 160
    return-void
.end method

.method public static h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BLjava/lang/String;ZZLl/jfm;)V
    .locals 12

    .line 1
    move-object/from16 v0, p4

    .line 2
    .line 3
    new-instance v1, Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v2}, Ll/afm;->Z()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v8

    .line 16
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    sget-object v11, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 21
    .line 22
    const-string v7, "fileOriginName"

    .line 23
    .line 24
    const-string v9, "side"

    .line 25
    .line 26
    const-string v3, "certifyId"

    .line 27
    .line 28
    const-string v5, "fileName"

    .line 29
    .line 30
    move-object v4, p0

    .line 31
    move-object v6, p1

    .line 32
    move-object v10, p2

    .line 33
    filled-new-array/range {v3 .. v10}, [Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    const-string v5, "ocrSmartDevice"

    .line 38
    .line 39
    invoke-virtual {v2, v11, v5, v3}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    new-instance v2, Lcom/alibaba/fastjson/JSONObject;

    .line 43
    .line 44
    invoke-direct {v2}, Lcom/alibaba/fastjson/JSONObject;-><init>()V

    .line 45
    .line 46
    .line 47
    const-string v3, "fileName"

    .line 48
    .line 49
    invoke-virtual {v2, v3, p1}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    const-string v3, "fileOriginName"

    .line 53
    .line 54
    invoke-virtual {v2, v3, v8}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    const-string v3, "side"

    .line 58
    .line 59
    invoke-virtual {v2, v3, p2}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    if-eqz p6, :cond_0

    .line 63
    .line 64
    new-instance v3, Lcom/alibaba/fastjson/JSONObject;

    .line 65
    .line 66
    invoke-direct {v3}, Lcom/alibaba/fastjson/JSONObject;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-static {p3}, Ll/ac00;->a([B)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p3

    .line 73
    invoke-virtual {v3, p1, p3}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    const-string p1, "base64Info"

    .line 77
    .line 78
    invoke-virtual {v3}, Lcom/alibaba/fastjson/JSON;->toJSONString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p3

    .line 82
    invoke-virtual {v2, p1, p3}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    :cond_0
    if-eqz v0, :cond_1

    .line 86
    .line 87
    const-string p1, "encryptKey"

    .line 88
    .line 89
    invoke-virtual {v2, p1, v0}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    const-string p1, "encryptVersion"

    .line 93
    .line 94
    const-string p3, "NATIVE_E1"

    .line 95
    .line 96
    invoke-virtual {v2, p1, p3}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    :cond_1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p1}, Ll/afm;->f()Z

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    const-string p3, "imageSource"

    .line 108
    .line 109
    if-eqz p1, :cond_2

    .line 110
    .line 111
    const-string p1, "album"

    .line 112
    .line 113
    invoke-virtual {v2, p3, p1}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_2
    const-string p1, "snap"

    .line 118
    .line 119
    invoke-virtual {v2, p3, p1}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    :goto_0
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-virtual {p1}, Ll/afm;->i0()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    sget-object p3, Ll/ffm;->f:Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {p3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    if-eqz p1, :cond_6

    .line 137
    .line 138
    const-string p1, "OCR_ID_FACE"

    .line 139
    .line 140
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    const/4 p3, 0x1

    .line 145
    if-eqz p1, :cond_3

    .line 146
    .line 147
    goto :goto_1

    .line 148
    :cond_3
    const-string p1, "OCR_ID_BACK"

    .line 149
    .line 150
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result p1

    .line 154
    if-eqz p1, :cond_4

    .line 155
    .line 156
    const/4 p3, 0x2

    .line 157
    goto :goto_1

    .line 158
    :cond_4
    const-string p1, "OCR_ID_THIRD"

    .line 159
    .line 160
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    if-eqz p1, :cond_5

    .line 165
    .line 166
    const/4 p3, 0x3

    .line 167
    :cond_5
    :goto_1
    const-string p1, "pageNo"

    .line 168
    .line 169
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 170
    .line 171
    .line 172
    move-result-object p2

    .line 173
    invoke-virtual {v2, p1, p2}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    :cond_6
    invoke-virtual {v2}, Lcom/alibaba/fastjson/JSON;->toJSONString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    if-eqz p1, :cond_7

    .line 181
    .line 182
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    invoke-static {p1, p0}, Lcom/idv/identity/util/IdentityUtils;->se([BLjava/lang/String;)Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    :cond_7
    const-string p2, "RequestData"

    .line 191
    .line 192
    invoke-interface {v1, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    const-string p1, "CertifyId"

    .line 196
    .line 197
    invoke-interface {v1, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    const-string p1, "AppVersion"

    .line 201
    .line 202
    const-string p2, "2022-08-09"

    .line 203
    .line 204
    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    invoke-virtual {p1}, Ll/afm;->K()Ll/tj20;

    .line 212
    .line 213
    .line 214
    move-result-object p1

    .line 215
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 216
    .line 217
    .line 218
    move-result-object p2

    .line 219
    invoke-virtual {p2}, Ll/afm;->s0()Z

    .line 220
    .line 221
    .line 222
    move-result p2

    .line 223
    sget-object p3, Ll/qk20;->b:Ljava/lang/String;

    .line 224
    .line 225
    new-instance v0, Ll/z5l0;

    .line 226
    .line 227
    invoke-direct {v0, p1, p2}, Ll/z5l0;-><init>(Ll/tj20;Z)V

    .line 228
    .line 229
    .line 230
    new-instance p1, Ll/qk20$b;

    .line 231
    .line 232
    move-object/from16 p2, p7

    .line 233
    .line 234
    invoke-direct {p1, p2, p0}, Ll/qk20$b;-><init>(Ll/jfm;Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    invoke-static {p3, v1, v0, p1}, Ll/qk20;->e(Ljava/lang/String;Ljava/util/Map;Ll/h5g$a;Ll/wk80;)V

    .line 238
    .line 239
    .line 240
    return-void
.end method

.method private static i(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    sget v0, Ll/t0g0;->b:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/t0g0;->e(ILjava/lang/String;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/t0g0;->f()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/afm;->s()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    const/16 v2, 0x7d0

    .line 31
    .line 32
    if-le v1, v2, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    return-object v0

    .line 36
    :cond_1
    :goto_0
    invoke-static {p0}, Ll/t0g0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method

.method public static j(Ljava/util/List;ZLl/n3k0;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z",
            "Ll/n3k0;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-gtz p1, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    new-instance p1, Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v0, "BizType"

    .line 14
    .line 15
    const-string v1, "SMART_CLOUD_AUTH"

    .line 16
    .line 17
    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    const-string v0, "AppVersion"

    .line 21
    .line 22
    const-string v1, "2022-08-09"

    .line 23
    .line 24
    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    new-instance v0, Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_1

    .line 41
    .line 42
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    check-cast v2, Ljava/lang/String;

    .line 47
    .line 48
    :try_start_0
    invoke-static {v2}, Lcom/alibaba/fastjson/JSON;->parseObject(Ljava/lang/String;)Lcom/alibaba/fastjson/JSONObject;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :catch_0
    move-exception v2

    .line 57
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-gtz v1, :cond_2

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    invoke-static {v0}, Ll/ac00;->h(Ljava/lang/Object;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-eqz v1, :cond_3

    .line 77
    .line 78
    :goto_1
    return-void

    .line 79
    :cond_3
    const-string v1, "UploadInfos"

    .line 80
    .line 81
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v0}, Ll/afm;->K()Ll/tj20;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v1}, Ll/afm;->s0()Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    new-instance v2, Ll/z5l0;

    .line 101
    .line 102
    invoke-direct {v2, v0, v1}, Ll/z5l0;-><init>(Ll/tj20;Z)V

    .line 103
    .line 104
    .line 105
    sget-object v0, Ll/qk20;->d:Ljava/lang/String;

    .line 106
    .line 107
    new-instance v1, Ll/qk20$d;

    .line 108
    .line 109
    invoke-direct {v1, p2, p0}, Ll/qk20$d;-><init>(Ll/n3k0;Ljava/util/List;)V

    .line 110
    .line 111
    .line 112
    invoke-static {v0, p1, v2, v1}, Ll/qk20;->e(Ljava/lang/String;Ljava/util/Map;Ll/h5g$a;Ll/wk80;)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public static k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLl/lfm;)V
    .locals 5

    .line 1
    sget p4, Ll/t0g0$a;->i:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p4, v0}, Ll/t0g0;->e(ILjava/lang/String;)V

    .line 5
    .line 6
    .line 7
    new-instance p4, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-direct {p4}, Ljava/util/HashMap;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 17
    .line 18
    const-string v2, "certifyId"

    .line 19
    .line 20
    const-string v3, "certifyData"

    .line 21
    .line 22
    filled-new-array {v2, p0, v3, p2}, [Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    const-string v4, "VALIDATION_REQUEST"

    .line 27
    .line 28
    invoke-virtual {v0, v1, v4, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const-string v0, "CertifyId"

    .line 32
    .line 33
    invoke-interface {p4, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    const-string v0, "AppVersion"

    .line 37
    .line 38
    const-string v1, "2022-08-09"

    .line 39
    .line 40
    invoke-interface {p4, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    new-instance v0, Lcom/alibaba/fastjson/JSONObject;

    .line 44
    .line 45
    invoke-direct {v0}, Lcom/alibaba/fastjson/JSONObject;-><init>()V

    .line 46
    .line 47
    .line 48
    if-eqz p1, :cond_0

    .line 49
    .line 50
    const-string v1, "\"{}\""

    .line 51
    .line 52
    invoke-virtual {p1, v1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_0

    .line 57
    .line 58
    const-string v1, "ocrData"

    .line 59
    .line 60
    invoke-virtual {v0, v1, p1}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    :cond_0
    invoke-virtual {v0, v3, p2}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    const-string p1, "deviceToken"

    .line 67
    .line 68
    invoke-static {p0}, Ll/qk20;->i(Ljava/lang/String;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    invoke-virtual {v0, p1, p2}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    if-eqz p3, :cond_1

    .line 76
    .line 77
    const-string p1, "encryptKey"

    .line 78
    .line 79
    invoke-virtual {v0, p1, p3}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    const-string p1, "encryptVersion"

    .line 83
    .line 84
    const-string p2, "NATIVE_E1"

    .line 85
    .line 86
    invoke-virtual {v0, p1, p2}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    :cond_1
    if-eqz p5, :cond_4

    .line 90
    .line 91
    new-instance p1, Lcom/alibaba/fastjson/JSONObject;

    .line 92
    .line 93
    invoke-direct {p1}, Lcom/alibaba/fastjson/JSONObject;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    invoke-virtual {p2}, Ll/afm;->m()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 105
    .line 106
    .line 107
    move-result-object p3

    .line 108
    invoke-virtual {p3}, Ll/afm;->A()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p3

    .line 112
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 113
    .line 114
    .line 115
    move-result-object p5

    .line 116
    invoke-virtual {p5}, Ll/afm;->z()[B

    .line 117
    .line 118
    .line 119
    move-result-object p5

    .line 120
    if-eqz p5, :cond_2

    .line 121
    .line 122
    invoke-static {p5}, Ll/ac00;->a([B)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p5

    .line 126
    invoke-virtual {p1, p3, p5}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    :cond_2
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 130
    .line 131
    .line 132
    move-result-object p3

    .line 133
    invoke-virtual {p3}, Ll/afm;->F()I

    .line 134
    .line 135
    .line 136
    move-result p3

    .line 137
    const/4 p5, 0x2

    .line 138
    if-ne p3, p5, :cond_3

    .line 139
    .line 140
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 141
    .line 142
    .line 143
    move-result-object p3

    .line 144
    invoke-virtual {p3}, Ll/afm;->l()[B

    .line 145
    .line 146
    .line 147
    move-result-object p3

    .line 148
    if-eqz p3, :cond_3

    .line 149
    .line 150
    invoke-static {p3}, Ll/ac00;->a([B)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p3

    .line 154
    invoke-virtual {p1, p2, p3}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    :cond_3
    invoke-virtual {p1}, Lcom/alibaba/fastjson/JSON;->toJSONString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    const-string p2, "base64Info"

    .line 162
    .line 163
    invoke-virtual {v0, p2, p1}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    :cond_4
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSON;->toJSONString()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    if-eqz p1, :cond_5

    .line 171
    .line 172
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-static {p1, p0}, Lcom/idv/identity/util/IdentityUtils;->se([BLjava/lang/String;)Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    :cond_5
    const-string p2, "RequestData"

    .line 181
    .line 182
    invoke-interface {p4, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    invoke-virtual {p1}, Ll/afm;->K()Ll/tj20;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 194
    .line 195
    .line 196
    move-result-object p2

    .line 197
    invoke-virtual {p2}, Ll/afm;->s0()Z

    .line 198
    .line 199
    .line 200
    move-result p2

    .line 201
    sget-object p3, Ll/qk20;->c:Ljava/lang/String;

    .line 202
    .line 203
    new-instance p5, Ll/z5l0;

    .line 204
    .line 205
    invoke-direct {p5, p1, p2}, Ll/z5l0;-><init>(Ll/tj20;Z)V

    .line 206
    .line 207
    .line 208
    new-instance p1, Ll/qk20$c;

    .line 209
    .line 210
    invoke-direct {p1, p6, p0}, Ll/qk20$c;-><init>(Ll/lfm;Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    invoke-static {p3, p4, p5, p1}, Ll/qk20;->e(Ljava/lang/String;Ljava/util/Map;Ll/h5g$a;Ll/wk80;)V

    .line 214
    .line 215
    .line 216
    return-void
.end method


# virtual methods
.method public a(Ljava/util/Map;Ll/l1;)Z
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ll/l1<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)Z"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    const-string v0, "NULL"

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    if-eqz p1, :cond_6

    .line 6
    .line 7
    const-string v2, "ossConfig"

    .line 8
    .line 9
    invoke-interface {p1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    if-nez v3, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    instance-of v3, v2, Lcom/idv/identity/platform/config/OSSConfig;

    .line 21
    .line 22
    if-nez v3, :cond_2

    .line 23
    .line 24
    if-eqz p2, :cond_1

    .line 25
    .line 26
    invoke-interface {p2, v1, v0, v1}, Ll/l1;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return p0

    .line 30
    :cond_2
    check-cast v2, Lcom/idv/identity/platform/config/OSSConfig;

    .line 31
    .line 32
    const-string p0, "fileName"

    .line 33
    .line 34
    invoke-interface {p1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    move-object v8, p0

    .line 39
    check-cast v8, Ljava/lang/String;

    .line 40
    .line 41
    const-string p0, "fileContent"

    .line 42
    .line 43
    invoke-interface {p1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    move-object v9, p0

    .line 48
    check-cast v9, [B

    .line 49
    .line 50
    iget-object v3, v2, Lcom/idv/identity/platform/config/OSSConfig;->OssEndPoint:Ljava/lang/String;

    .line 51
    .line 52
    iget-object v4, v2, Lcom/idv/identity/platform/config/OSSConfig;->AccessKeyId:Ljava/lang/String;

    .line 53
    .line 54
    iget-object v5, v2, Lcom/idv/identity/platform/config/OSSConfig;->AccessKeySecret:Ljava/lang/String;

    .line 55
    .line 56
    iget-object v6, v2, Lcom/idv/identity/platform/config/OSSConfig;->SecurityToken:Ljava/lang/String;

    .line 57
    .line 58
    iget-object v7, v2, Lcom/idv/identity/platform/config/OSSConfig;->BucketName:Ljava/lang/String;

    .line 59
    .line 60
    invoke-static/range {v3 .. v9}, Ll/o850;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[B)Ll/o850$a;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    if-eqz p0, :cond_4

    .line 65
    .line 66
    if-eqz p2, :cond_5

    .line 67
    .line 68
    iget-boolean p1, p0, Ll/o850$a;->a:Z

    .line 69
    .line 70
    if-eqz p1, :cond_3

    .line 71
    .line 72
    invoke-interface {p2, v1}, Ll/l1;->onSuccess(Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_3
    iget-object p0, p0, Ll/o850$a;->b:Ljava/lang/String;

    .line 77
    .line 78
    invoke-interface {p2, v1, p0, v1}, Ll/l1;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_4
    if-eqz p2, :cond_5

    .line 83
    .line 84
    iget-object p0, p0, Ll/o850$a;->b:Ljava/lang/String;

    .line 85
    .line 86
    invoke-interface {p2, v1, p0, v1}, Ll/l1;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :cond_5
    :goto_0
    const/4 p0, 0x1

    .line 90
    return p0

    .line 91
    :cond_6
    :goto_1
    if-eqz p2, :cond_7

    .line 92
    .line 93
    invoke-interface {p2, v1, v0, v1}, Ll/l1;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    :cond_7
    return p0
.end method

.method public b(Landroid/content/Context;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method
