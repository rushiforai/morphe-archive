.class public Lcom/p1/mobile/putong/core/data/ComplimentMessage;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentAdditionalData;,
        Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentType;,
        Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;
    }
.end annotation


# static fields
.field public static final MSG_TYPE:Ljava/lang/String; = "picture_compliment"


# instance fields
.field public additionalData:Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentAdditionalData;

.field public media:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;",
            ">;"
        }
    .end annotation
.end field

.field public msgType:Ljava/lang/String;

.field public roomId:Ljava/lang/String;

.field public value:Ljava/lang/String;

.field public voiceFrom:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "picture_compliment"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ComplimentMessage;->msgType:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method private static convertMedia(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;
    .locals 7

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;->url:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-string v1, "image/jpeg"

    .line 16
    .line 17
    :goto_0
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;->mediaType:Ljava/lang/String;

    .line 18
    .line 19
    instance-of v1, p0, Lcom/p1/mobile/putong/data/Video;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    move-object v3, p0

    .line 25
    check-cast v3, Lcom/p1/mobile/putong/data/Video;

    .line 26
    .line 27
    iget v3, v3, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 28
    .line 29
    float-to-int v3, v3

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    move v3, v2

    .line 32
    :goto_1
    iput v3, v0, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;->duration:I

    .line 33
    .line 34
    iget-boolean v3, p0, Lcom/p1/mobile/putong/data/Media;->isPortrait:Z

    .line 35
    .line 36
    iput-boolean v3, v0, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;->isPortrait:Z

    .line 37
    .line 38
    iget-object v3, p0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 39
    .line 40
    if-eqz v3, :cond_2

    .line 41
    .line 42
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    goto :goto_2

    .line 47
    :cond_2
    const-string v3, "normal"

    .line 48
    .line 49
    :goto_2
    iput-object v3, v0, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;->status:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v3, p0, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 52
    .line 53
    if-eqz v3, :cond_3

    .line 54
    .line 55
    new-instance v3, Ljava/util/ArrayList;

    .line 56
    .line 57
    iget-object v4, p0, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 58
    .line 59
    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 60
    .line 61
    .line 62
    goto :goto_3

    .line 63
    :cond_3
    new-instance v3, Ljava/util/ArrayList;

    .line 64
    .line 65
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 66
    .line 67
    .line 68
    :goto_3
    iput-object v3, v0, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;->tags:Ljava/util/List;

    .line 69
    .line 70
    instance-of v3, p0, Lcom/p1/mobile/putong/data/Picture;

    .line 71
    .line 72
    const/16 v4, 0x438

    .line 73
    .line 74
    const/4 v5, 0x1

    .line 75
    const/4 v6, 0x2

    .line 76
    if-eqz v3, :cond_6

    .line 77
    .line 78
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 79
    .line 80
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 81
    .line 82
    new-array v3, v6, [I

    .line 83
    .line 84
    if-eqz v1, :cond_4

    .line 85
    .line 86
    iget v4, v1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 87
    .line 88
    aput v4, v3, v2

    .line 89
    .line 90
    iget v1, v1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 91
    .line 92
    aput v1, v3, v5

    .line 93
    .line 94
    goto :goto_4

    .line 95
    :cond_4
    aput v4, v3, v2

    .line 96
    .line 97
    aput v4, v3, v5

    .line 98
    .line 99
    :goto_4
    iput-object v3, v0, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;->size:[I

    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Picture;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 102
    .line 103
    new-array v1, v6, [I

    .line 104
    .line 105
    if-eqz p0, :cond_5

    .line 106
    .line 107
    iget v3, p0, Lcom/p1/mobile/putong/data/AIPosition;->x:I

    .line 108
    .line 109
    aput v3, v1, v2

    .line 110
    .line 111
    iget p0, p0, Lcom/p1/mobile/putong/data/AIPosition;->y:I

    .line 112
    .line 113
    aput p0, v1, v5

    .line 114
    .line 115
    goto :goto_5

    .line 116
    :cond_5
    aput v2, v1, v2

    .line 117
    .line 118
    aput v2, v1, v5

    .line 119
    .line 120
    :goto_5
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;->aiPosition:[I

    .line 121
    .line 122
    return-object v0

    .line 123
    :cond_6
    if-eqz v1, :cond_8

    .line 124
    .line 125
    check-cast p0, Lcom/p1/mobile/putong/data/Video;

    .line 126
    .line 127
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 128
    .line 129
    new-array v1, v6, [I

    .line 130
    .line 131
    if-eqz p0, :cond_7

    .line 132
    .line 133
    iget v3, p0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 134
    .line 135
    aput v3, v1, v2

    .line 136
    .line 137
    iget p0, p0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 138
    .line 139
    aput p0, v1, v5

    .line 140
    .line 141
    goto :goto_6

    .line 142
    :cond_7
    aput v4, v1, v2

    .line 143
    .line 144
    aput v4, v1, v5

    .line 145
    .line 146
    :goto_6
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;->size:[I

    .line 147
    .line 148
    filled-new-array {v2, v2}, [I

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;->aiPosition:[I

    .line 153
    .line 154
    return-object v0

    .line 155
    :cond_8
    filled-new-array {v4, v4}, [I

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;->size:[I

    .line 160
    .line 161
    filled-new-array {v2, v2}, [I

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;->aiPosition:[I

    .line 166
    .line 167
    return-object v0
.end method

.method public static fromMedia(Ljava/lang/String;Ljava/util/List;ZLjava/lang/String;)Lcom/p1/mobile/putong/core/data/ComplimentMessage;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;Z",
            "Ljava/lang/String;",
            ")",
            "Lcom/p1/mobile/putong/core/data/ComplimentMessage;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ComplimentMessage;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ComplimentMessage;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/ComplimentMessage;->value:Ljava/lang/String;

    .line 7
    .line 8
    new-instance p0, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentAdditionalData;

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentAdditionalData;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/ComplimentMessage;->additionalData:Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentAdditionalData;

    .line 14
    .line 15
    new-instance v1, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentType;

    .line 16
    .line 17
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentType;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentAdditionalData;->compliment:Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentType;

    .line 21
    .line 22
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/ComplimentMessage;->additionalData:Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentAdditionalData;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentAdditionalData;->compliment:Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentType;

    .line 25
    .line 26
    if-eqz p2, :cond_0

    .line 27
    .line 28
    const-string p2, "paid"

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const-string p2, "free"

    .line 32
    .line 33
    :goto_0
    iput-object p2, p0, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentType;->type:Ljava/lang/String;

    .line 34
    .line 35
    new-instance p0, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/ComplimentMessage;->media:Ljava/util/List;

    .line 41
    .line 42
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-nez p0, :cond_1

    .line 47
    .line 48
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 63
    .line 64
    iget-object p2, v0, Lcom/p1/mobile/putong/core/data/ComplimentMessage;->media:Ljava/util/List;

    .line 65
    .line 66
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/ComplimentMessage;->convertMedia(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_1
    :try_start_0
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-nez p0, :cond_2

    .line 79
    .line 80
    const-string p0, ":"

    .line 81
    .line 82
    invoke-virtual {p3, p0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    array-length p1, p0

    .line 87
    const/4 p2, 0x2

    .line 88
    if-lt p1, p2, :cond_2

    .line 89
    .line 90
    const/4 p1, 0x0

    .line 91
    aget-object p1, p0, p1

    .line 92
    .line 93
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/ComplimentMessage;->voiceFrom:Ljava/lang/String;

    .line 94
    .line 95
    const/4 p1, 0x1

    .line 96
    aget-object p0, p0, p1

    .line 97
    .line 98
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/ComplimentMessage;->roomId:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    .line 100
    :catch_0
    :cond_2
    return-object v0
.end method

.method private static mediaToJson(Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;)Lorg/json/JSONObject;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;->url:Ljava/lang/String;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const-string v1, ""

    .line 12
    .line 13
    :goto_0
    const-string v2, "url"

    .line 14
    .line 15
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;->mediaType:Ljava/lang/String;

    .line 19
    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_1
    const-string v1, "image/jpeg"

    .line 24
    .line 25
    :goto_1
    const-string v2, "mediaType"

    .line 26
    .line 27
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 28
    .line 29
    .line 30
    const-string v1, "duration"

    .line 31
    .line 32
    iget v2, p0, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;->duration:I

    .line 33
    .line 34
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 35
    .line 36
    .line 37
    const-string v1, "isPortrait"

    .line 38
    .line 39
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;->isPortrait:Z

    .line 40
    .line 41
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;->status:Ljava/lang/String;

    .line 45
    .line 46
    if-eqz v1, :cond_2

    .line 47
    .line 48
    goto :goto_2

    .line 49
    :cond_2
    const-string v1, "normal"

    .line 50
    .line 51
    :goto_2
    const-string v2, "status"

    .line 52
    .line 53
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;->tags:Ljava/util/List;

    .line 57
    .line 58
    if-eqz v1, :cond_3

    .line 59
    .line 60
    new-instance v1, Lorg/json/JSONArray;

    .line 61
    .line 62
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;->tags:Ljava/util/List;

    .line 63
    .line 64
    invoke-direct {v1, v2}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    .line 65
    .line 66
    .line 67
    goto :goto_3

    .line 68
    :cond_3
    new-instance v1, Lorg/json/JSONArray;

    .line 69
    .line 70
    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 71
    .line 72
    .line 73
    :goto_3
    const-string v2, "tags"

    .line 74
    .line 75
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 76
    .line 77
    .line 78
    new-instance v1, Lorg/json/JSONArray;

    .line 79
    .line 80
    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 81
    .line 82
    .line 83
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;->size:[I

    .line 84
    .line 85
    const/4 v3, 0x1

    .line 86
    const/4 v4, 0x2

    .line 87
    const/4 v5, 0x0

    .line 88
    if-eqz v2, :cond_4

    .line 89
    .line 90
    array-length v6, v2

    .line 91
    if-lt v6, v4, :cond_4

    .line 92
    .line 93
    aget v2, v2, v5

    .line 94
    .line 95
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    .line 96
    .line 97
    .line 98
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;->size:[I

    .line 99
    .line 100
    aget v2, v2, v3

    .line 101
    .line 102
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    .line 103
    .line 104
    .line 105
    goto :goto_4

    .line 106
    :cond_4
    const/16 v2, 0x438

    .line 107
    .line 108
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    .line 112
    .line 113
    .line 114
    :goto_4
    const-string v2, "size"

    .line 115
    .line 116
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 117
    .line 118
    .line 119
    new-instance v1, Lorg/json/JSONArray;

    .line 120
    .line 121
    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 122
    .line 123
    .line 124
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;->aiPosition:[I

    .line 125
    .line 126
    if-eqz v2, :cond_5

    .line 127
    .line 128
    array-length v6, v2

    .line 129
    if-lt v6, v4, :cond_5

    .line 130
    .line 131
    aget v2, v2, v5

    .line 132
    .line 133
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    .line 134
    .line 135
    .line 136
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;->aiPosition:[I

    .line 137
    .line 138
    aget p0, p0, v3

    .line 139
    .line 140
    invoke-virtual {v1, p0}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    .line 141
    .line 142
    .line 143
    goto :goto_5

    .line 144
    :cond_5
    invoke-virtual {v1, v5}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    .line 145
    .line 146
    .line 147
    invoke-virtual {v1, v5}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    .line 148
    .line 149
    .line 150
    :goto_5
    const-string p0, "aiPosition"

    .line 151
    .line 152
    invoke-virtual {v0, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 153
    .line 154
    .line 155
    return-object v0
.end method


# virtual methods
.method public toJson()Ljava/lang/String;
    .locals 4

    .line 1
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "msgType"

    .line 7
    .line 8
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/ComplimentMessage;->msgType:Ljava/lang/String;

    .line 9
    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const-string v2, "picture_compliment"

    .line 14
    .line 15
    :goto_0
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 16
    .line 17
    .line 18
    const-string v1, "value"

    .line 19
    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/ComplimentMessage;->value:Ljava/lang/String;

    .line 21
    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_1
    const-string v2, ""

    .line 26
    .line 27
    :goto_1
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ComplimentMessage;->voiceFrom:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-nez v1, :cond_2

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ComplimentMessage;->roomId:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-nez v1, :cond_2

    .line 45
    .line 46
    const-string v1, "localLikeFrom"

    .line 47
    .line 48
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/ComplimentMessage;->voiceFrom:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 51
    .line 52
    .line 53
    new-instance v1, Lorg/json/JSONObject;

    .line 54
    .line 55
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 56
    .line 57
    .line 58
    const-string v2, "roomID"

    .line 59
    .line 60
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/ComplimentMessage;->roomId:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 63
    .line 64
    .line 65
    const-string v2, "extensions"

    .line 66
    .line 67
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 68
    .line 69
    .line 70
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ComplimentMessage;->additionalData:Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentAdditionalData;

    .line 71
    .line 72
    if-eqz v1, :cond_4

    .line 73
    .line 74
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentAdditionalData;->compliment:Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentType;

    .line 75
    .line 76
    if-eqz v1, :cond_4

    .line 77
    .line 78
    new-instance v1, Lorg/json/JSONObject;

    .line 79
    .line 80
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 81
    .line 82
    .line 83
    const-string v2, "type"

    .line 84
    .line 85
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/ComplimentMessage;->additionalData:Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentAdditionalData;

    .line 86
    .line 87
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentAdditionalData;->compliment:Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentType;

    .line 88
    .line 89
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentType;->type:Ljava/lang/String;

    .line 90
    .line 91
    if-eqz v3, :cond_3

    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_3
    const-string v3, "free"

    .line 95
    .line 96
    :goto_2
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 97
    .line 98
    .line 99
    new-instance v2, Lorg/json/JSONObject;

    .line 100
    .line 101
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 102
    .line 103
    .line 104
    const-string v3, "compliment"

    .line 105
    .line 106
    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 107
    .line 108
    .line 109
    const-string v1, "additionalData"

    .line 110
    .line 111
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 112
    .line 113
    .line 114
    :cond_4
    new-instance v1, Lorg/json/JSONArray;

    .line 115
    .line 116
    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 117
    .line 118
    .line 119
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/ComplimentMessage;->media:Ljava/util/List;

    .line 120
    .line 121
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 122
    .line 123
    .line 124
    move-result v2

    .line 125
    if-nez v2, :cond_5

    .line 126
    .line 127
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ComplimentMessage;->media:Ljava/util/List;

    .line 128
    .line 129
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    :goto_3
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 134
    .line 135
    .line 136
    move-result v2

    .line 137
    if-eqz v2, :cond_5

    .line 138
    .line 139
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    check-cast v2, Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;

    .line 144
    .line 145
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/ComplimentMessage;->mediaToJson(Lcom/p1/mobile/putong/core/data/ComplimentMessage$ComplimentMessageMedia;)Lorg/json/JSONObject;

    .line 146
    .line 147
    .line 148
    move-result-object v2

    .line 149
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 150
    .line 151
    .line 152
    goto :goto_3

    .line 153
    :cond_5
    const-string p0, "media"

    .line 154
    .line 155
    invoke-virtual {v0, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 162
    return-object p0

    .line 163
    :catch_0
    move-exception p0

    .line 164
    const-string v0, "ComplimentMessage.toJson failed"

    .line 165
    .line 166
    invoke-static {v0, p0}, Ll/vtq0;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 167
    .line 168
    .line 169
    const/4 p0, 0x0

    .line 170
    return-object p0
.end method
