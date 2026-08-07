.class public Lcom/ss/bytertc/engine/PublisherConfiguration;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "PublisherConfiguration"


# instance fields
.field private mJsonObject:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 179
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private constructor <init>(Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 5
    .line 6
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/ss/bytertc/engine/PublisherConfiguration;->mJsonObject:Lorg/json/JSONObject;

    .line 10
    .line 11
    const-string v1, "owner"

    .line 12
    .line 13
    invoke-static {p1}, Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;->access$000(Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;)Lcom/ss/bytertc/engine/PublisherParameters;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    iget-boolean v2, v2, Lcom/ss/bytertc/engine/PublisherParameters;->owner:Z

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/ss/bytertc/engine/PublisherConfiguration;->mJsonObject:Lorg/json/JSONObject;

    .line 23
    .line 24
    const-string v1, "lifecycle"

    .line 25
    .line 26
    invoke-static {p1}, Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;->access$000(Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;)Lcom/ss/bytertc/engine/PublisherParameters;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    iget v2, v2, Lcom/ss/bytertc/engine/PublisherParameters;->lifecycle:I

    .line 31
    .line 32
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/ss/bytertc/engine/PublisherConfiguration;->mJsonObject:Lorg/json/JSONObject;

    .line 36
    .line 37
    const-string v1, "defaultLayout"

    .line 38
    .line 39
    invoke-static {p1}, Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;->access$000(Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;)Lcom/ss/bytertc/engine/PublisherParameters;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    iget v2, v2, Lcom/ss/bytertc/engine/PublisherParameters;->defaultLayout:I

    .line 44
    .line 45
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/ss/bytertc/engine/PublisherConfiguration;->mJsonObject:Lorg/json/JSONObject;

    .line 49
    .line 50
    const-string v1, "width"

    .line 51
    .line 52
    invoke-static {p1}, Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;->access$000(Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;)Lcom/ss/bytertc/engine/PublisherParameters;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    iget v2, v2, Lcom/ss/bytertc/engine/PublisherParameters;->width:I

    .line 57
    .line 58
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/ss/bytertc/engine/PublisherConfiguration;->mJsonObject:Lorg/json/JSONObject;

    .line 62
    .line 63
    const-string v1, "height"

    .line 64
    .line 65
    invoke-static {p1}, Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;->access$000(Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;)Lcom/ss/bytertc/engine/PublisherParameters;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    iget v2, v2, Lcom/ss/bytertc/engine/PublisherParameters;->height:I

    .line 70
    .line 71
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/ss/bytertc/engine/PublisherConfiguration;->mJsonObject:Lorg/json/JSONObject;

    .line 75
    .line 76
    const-string v1, "framerate"

    .line 77
    .line 78
    invoke-static {p1}, Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;->access$000(Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;)Lcom/ss/bytertc/engine/PublisherParameters;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    iget v2, v2, Lcom/ss/bytertc/engine/PublisherParameters;->framerate:I

    .line 83
    .line 84
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/ss/bytertc/engine/PublisherConfiguration;->mJsonObject:Lorg/json/JSONObject;

    .line 88
    .line 89
    const-string v1, "bitrate"

    .line 90
    .line 91
    invoke-static {p1}, Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;->access$000(Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;)Lcom/ss/bytertc/engine/PublisherParameters;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    iget v2, v2, Lcom/ss/bytertc/engine/PublisherParameters;->kBitrate:I

    .line 96
    .line 97
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Lcom/ss/bytertc/engine/PublisherConfiguration;->mJsonObject:Lorg/json/JSONObject;

    .line 101
    .line 102
    const-string v1, "mosaicStream"

    .line 103
    .line 104
    invoke-static {p1}, Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;->access$000(Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;)Lcom/ss/bytertc/engine/PublisherParameters;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    iget-object v2, v2, Lcom/ss/bytertc/engine/PublisherParameters;->mosaicStream:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/ss/bytertc/engine/PublisherConfiguration;->mJsonObject:Lorg/json/JSONObject;

    .line 114
    .line 115
    const-string v1, "extraInfo"

    .line 116
    .line 117
    invoke-static {p1}, Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;->access$000(Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;)Lcom/ss/bytertc/engine/PublisherParameters;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    iget-object v2, v2, Lcom/ss/bytertc/engine/PublisherParameters;->extraInfo:Ljava/lang/String;

    .line 122
    .line 123
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Lcom/ss/bytertc/engine/PublisherConfiguration;->mJsonObject:Lorg/json/JSONObject;

    .line 127
    .line 128
    const-string v1, "audiosamplerate"

    .line 129
    .line 130
    invoke-static {p1}, Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;->access$000(Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;)Lcom/ss/bytertc/engine/PublisherParameters;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    iget v2, v2, Lcom/ss/bytertc/engine/PublisherParameters;->audiosamplerate:I

    .line 135
    .line 136
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Lcom/ss/bytertc/engine/PublisherConfiguration;->mJsonObject:Lorg/json/JSONObject;

    .line 140
    .line 141
    const-string v1, "audiobitrate"

    .line 142
    .line 143
    invoke-static {p1}, Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;->access$000(Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;)Lcom/ss/bytertc/engine/PublisherParameters;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    iget v2, v2, Lcom/ss/bytertc/engine/PublisherParameters;->audioKBitrate:I

    .line 148
    .line 149
    mul-int/lit16 v2, v2, 0x3e8

    .line 150
    .line 151
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 152
    .line 153
    .line 154
    iget-object v0, p0, Lcom/ss/bytertc/engine/PublisherConfiguration;->mJsonObject:Lorg/json/JSONObject;

    .line 155
    .line 156
    const-string v1, "audiochannels"

    .line 157
    .line 158
    invoke-static {p1}, Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;->access$000(Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;)Lcom/ss/bytertc/engine/PublisherParameters;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    iget p1, p1, Lcom/ss/bytertc/engine/PublisherParameters;->audiochannels:I

    .line 163
    .line 164
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 165
    .line 166
    .line 167
    return-void

    .line 168
    :catch_0
    const/4 p1, 0x0

    .line 169
    iput-object p1, p0, Lcom/ss/bytertc/engine/PublisherConfiguration;->mJsonObject:Lorg/json/JSONObject;

    .line 170
    .line 171
    const-string p0, "PublisherConfiguration"

    .line 172
    .line 173
    const-string p1, "failed to create PublisherConfiguration"

    .line 174
    .line 175
    invoke-static {p0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    return-void
.end method

.method public synthetic constructor <init>(Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;Lcom/ss/bytertc/engine/PublisherConfiguration$1;)V
    .locals 0

    .line 180
    invoke-direct {p0, p1}, Lcom/ss/bytertc/engine/PublisherConfiguration;-><init>(Lcom/ss/bytertc/engine/PublisherConfiguration$Builder;)V

    return-void
.end method


# virtual methods
.method public toJsonString()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/PublisherConfiguration;->validate()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/ss/bytertc/engine/PublisherConfiguration;->mJsonObject:Lorg/json/JSONObject;

    .line 8
    .line 9
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public validate()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/PublisherConfiguration;->mJsonObject:Lorg/json/JSONObject;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method
