.class public Lcom/momo/xengine/mestatistics/StatisticalEvent;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static appPackage:Ljava/lang/String; = null

.field private static deviceHW:Ljava/lang/String; = null

.field private static deviceSW:Ljava/lang/String; = null

.field private static engineVersion:I = 0x0

.field private static magicEffectVersion:I = 0x0

.field private static mmcvVersion:I = 0x0

.field private static final platform:Ljava/lang/String; = "Android"

.field private static recorderSDKVersion:I

.field private static uid:Ljava/lang/String;


# instance fields
.field private final values:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/xengine/mestatistics/StatisticalValue;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/xengine/mestatistics/StatisticalEvent;->values:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method

.method public static setEngineVersion(I)V
    .locals 0

    .line 1
    sput p0, Lcom/momo/xengine/mestatistics/StatisticalEvent;->engineVersion:I

    .line 2
    .line 3
    return-void
.end method

.method public static setMagicEffectVersion(I)V
    .locals 0

    .line 1
    sput p0, Lcom/momo/xengine/mestatistics/StatisticalEvent;->magicEffectVersion:I

    .line 2
    .line 3
    return-void
.end method

.method public static setMmcvVersion(I)V
    .locals 0

    .line 1
    sput p0, Lcom/momo/xengine/mestatistics/StatisticalEvent;->mmcvVersion:I

    .line 2
    .line 3
    return-void
.end method

.method public static setRecorderSDKVersion(I)V
    .locals 0

    .line 1
    sput p0, Lcom/momo/xengine/mestatistics/StatisticalEvent;->recorderSDKVersion:I

    .line 2
    .line 3
    return-void
.end method

.method public static setUid(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/momo/xengine/mestatistics/StatisticalEvent;->uid:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public static setup(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sput-object p0, Lcom/momo/xengine/mestatistics/StatisticalEvent;->appPackage:Ljava/lang/String;

    .line 6
    .line 7
    sget-object p0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 8
    .line 9
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 10
    .line 11
    filled-new-array {p0, v0}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "%s_%s"

    .line 16
    .line 17
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, " "

    .line 22
    .line 23
    const-string v1, "_"

    .line 24
    .line 25
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    sput-object p0, Lcom/momo/xengine/mestatistics/StatisticalEvent;->deviceHW:Ljava/lang/String;

    .line 30
    .line 31
    new-instance p0, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v0, "Android"

    .line 34
    .line 35
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    sput-object p0, Lcom/momo/xengine/mestatistics/StatisticalEvent;->deviceSW:Ljava/lang/String;

    .line 48
    .line 49
    return-void
.end method


# virtual methods
.method public addValue(Lcom/momo/xengine/mestatistics/ReportType;Ljava/lang/String;J)V
    .locals 6

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    .line 21
    invoke-virtual/range {v0 .. v5}, Lcom/momo/xengine/mestatistics/StatisticalEvent;->addValue(Lcom/momo/xengine/mestatistics/ReportType;Ljava/lang/String;JLjava/lang/String;)V

    return-void
.end method

.method public addValue(Lcom/momo/xengine/mestatistics/ReportType;Ljava/lang/String;JLjava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/momo/xengine/mestatistics/StatisticalValue;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3, p4}, Lcom/momo/xengine/mestatistics/StatisticalValue;-><init>(Lcom/momo/xengine/mestatistics/ReportType;Ljava/lang/String;J)V

    .line 4
    .line 5
    .line 6
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0, p5}, Lcom/momo/xengine/mestatistics/StatisticalValue;->setExtend(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lcom/momo/xengine/mestatistics/StatisticalEvent;->values:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public addValue(Lcom/momo/xengine/mestatistics/StatisticalValue;)V
    .locals 0

    .line 22
    iget-object p0, p0, Lcom/momo/xengine/mestatistics/StatisticalEvent;->values:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public toJSONObject()Lorg/json/JSONObject;
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/momo/xengine/mestatistics/StatisticalEvent;->values:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return-object v1

    .line 11
    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    .line 12
    .line 13
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 14
    .line 15
    .line 16
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    sget v3, Lcom/momo/xengine/mestatistics/StatisticalEvent;->engineVersion:I

    .line 22
    .line 23
    const/16 v4, 0x5f

    .line 24
    .line 25
    if-lez v3, :cond_1

    .line 26
    .line 27
    const-string v3, "XE_"

    .line 28
    .line 29
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    sget v3, Lcom/momo/xengine/mestatistics/StatisticalEvent;->engineVersion:I

    .line 33
    .line 34
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catch_0
    move-exception p0

    .line 42
    goto/16 :goto_2

    .line 43
    .line 44
    :cond_1
    :goto_0
    sget v3, Lcom/momo/xengine/mestatistics/StatisticalEvent;->magicEffectVersion:I

    .line 45
    .line 46
    if-lez v3, :cond_2

    .line 47
    .line 48
    const-string v3, "ME_"

    .line 49
    .line 50
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    sget v3, Lcom/momo/xengine/mestatistics/StatisticalEvent;->magicEffectVersion:I

    .line 54
    .line 55
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    :cond_2
    sget v3, Lcom/momo/xengine/mestatistics/StatisticalEvent;->mmcvVersion:I

    .line 62
    .line 63
    if-lez v3, :cond_3

    .line 64
    .line 65
    const-string v3, "CV_"

    .line 66
    .line 67
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    sget v3, Lcom/momo/xengine/mestatistics/StatisticalEvent;->mmcvVersion:I

    .line 71
    .line 72
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    :cond_3
    sget v3, Lcom/momo/xengine/mestatistics/StatisticalEvent;->recorderSDKVersion:I

    .line 79
    .line 80
    if-lez v3, :cond_4

    .line 81
    .line 82
    const-string v3, "RC_"

    .line 83
    .line 84
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    sget v3, Lcom/momo/xengine/mestatistics/StatisticalEvent;->recorderSDKVersion:I

    .line 88
    .line 89
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    :cond_4
    const-string v3, "appPackage"

    .line 96
    .line 97
    sget-object v4, Lcom/momo/xengine/mestatistics/StatisticalEvent;->appPackage:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 100
    .line 101
    .line 102
    const-string v3, "platform"

    .line 103
    .line 104
    const-string v4, "Android"

    .line 105
    .line 106
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 107
    .line 108
    .line 109
    const-string v3, "deviceHW"

    .line 110
    .line 111
    sget-object v4, Lcom/momo/xengine/mestatistics/StatisticalEvent;->deviceHW:Ljava/lang/String;

    .line 112
    .line 113
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 114
    .line 115
    .line 116
    const-string v3, "deviceSW"

    .line 117
    .line 118
    sget-object v4, Lcom/momo/xengine/mestatistics/StatisticalEvent;->deviceSW:Ljava/lang/String;

    .line 119
    .line 120
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 121
    .line 122
    .line 123
    const-string v3, "sdkVersion"

    .line 124
    .line 125
    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 126
    .line 127
    .line 128
    const-string v2, "uid"

    .line 129
    .line 130
    sget-object v3, Lcom/momo/xengine/mestatistics/StatisticalEvent;->uid:Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 133
    .line 134
    .line 135
    const-string v2, "timestamp"

    .line 136
    .line 137
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 138
    .line 139
    .line 140
    move-result-wide v3

    .line 141
    const-wide/16 v5, 0x3e8

    .line 142
    .line 143
    div-long/2addr v3, v5

    .line 144
    invoke-virtual {v0, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 145
    .line 146
    .line 147
    new-instance v2, Lorg/json/JSONArray;

    .line 148
    .line 149
    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 150
    .line 151
    .line 152
    iget-object p0, p0, Lcom/momo/xengine/mestatistics/StatisticalEvent;->values:Ljava/util/List;

    .line 153
    .line 154
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 159
    .line 160
    .line 161
    move-result v3

    .line 162
    if-eqz v3, :cond_5

    .line 163
    .line 164
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object v3

    .line 168
    check-cast v3, Lcom/momo/xengine/mestatistics/StatisticalValue;

    .line 169
    .line 170
    invoke-virtual {v3}, Lcom/momo/xengine/mestatistics/StatisticalValue;->toJSONObject()Lorg/json/JSONObject;

    .line 171
    .line 172
    .line 173
    move-result-object v3

    .line 174
    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 175
    .line 176
    .line 177
    goto :goto_1

    .line 178
    :cond_5
    const-string p0, "values"

    .line 179
    .line 180
    invoke-virtual {v0, p0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 181
    .line 182
    .line 183
    return-object v0

    .line 184
    :goto_2
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 185
    .line 186
    .line 187
    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/momo/xengine/mestatistics/StatisticalEvent;->toJSONObject()Lorg/json/JSONObject;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "."

    .line 12
    .line 13
    const-string v1, "_"

    .line 14
    .line 15
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method
