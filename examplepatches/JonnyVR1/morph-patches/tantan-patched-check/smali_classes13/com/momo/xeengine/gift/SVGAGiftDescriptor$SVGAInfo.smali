.class Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/gift/SVGAGiftDescriptor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SVGAInfo"
.end annotation


# instance fields
.field private itemsList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;",
            ">;"
        }
    .end annotation
.end field

.field private positionType:Lcom/momo/xeengine/gift/SVGAPositionType;

.field private scaleType:Lcom/momo/xeengine/gift/SVGAScaleType;

.field private svgaPath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/momo/xeengine/gift/SVGAPositionType;->CENTER:Lcom/momo/xeengine/gift/SVGAPositionType;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/momo/xeengine/gift/SVGAPositionType;->getValue()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const-string v1, "positionType"

    .line 11
    .line 12
    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-static {v0}, Lcom/momo/xeengine/gift/SVGAPositionType;->fromValue(I)Lcom/momo/xeengine/gift/SVGAPositionType;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;->positionType:Lcom/momo/xeengine/gift/SVGAPositionType;

    .line 21
    .line 22
    sget-object v0, Lcom/momo/xeengine/gift/SVGAScaleType;->NONE:Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/momo/xeengine/gift/SVGAScaleType;->getValue()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const-string v1, "scaleType"

    .line 29
    .line 30
    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-static {v0}, Lcom/momo/xeengine/gift/SVGAScaleType;->fromValue(I)Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;->scaleType:Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 39
    .line 40
    sget-object v1, Lcom/momo/xeengine/gift/SVGAScaleType;->ASPECT_FILL:Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 41
    .line 42
    if-ne v0, v1, :cond_1

    .line 43
    .line 44
    iget-object v0, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;->positionType:Lcom/momo/xeengine/gift/SVGAPositionType;

    .line 45
    .line 46
    sget-object v1, Lcom/momo/xeengine/gift/SVGAPositionType;->TOP:Lcom/momo/xeengine/gift/SVGAPositionType;

    .line 47
    .line 48
    if-eq v0, v1, :cond_0

    .line 49
    .line 50
    sget-object v1, Lcom/momo/xeengine/gift/SVGAPositionType;->BOTTOM:Lcom/momo/xeengine/gift/SVGAPositionType;

    .line 51
    .line 52
    if-ne v0, v1, :cond_1

    .line 53
    .line 54
    :cond_0
    sget-object v0, Lcom/momo/xeengine/gift/SVGAScaleType;->ASPECT_FIT:Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 55
    .line 56
    iput-object v0, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;->scaleType:Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 57
    .line 58
    :cond_1
    const-string v0, "itemslist"

    .line 59
    .line 60
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    if-eqz p1, :cond_4

    .line 65
    .line 66
    new-instance v0, Ljava/util/ArrayList;

    .line 67
    .line 68
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 69
    .line 70
    .line 71
    iput-object v0, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;->itemsList:Ljava/util/List;

    .line 72
    .line 73
    const/4 v0, 0x0

    .line 74
    move v1, v0

    .line 75
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-ge v1, v2, :cond_4

    .line 80
    .line 81
    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    if-nez v2, :cond_2

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :cond_2
    new-instance v3, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;

    .line 89
    .line 90
    invoke-direct {v3}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;-><init>()V

    .line 91
    .line 92
    .line 93
    const-string v4, "key"

    .line 94
    .line 95
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    invoke-static {v3, v4}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->access$002(Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;Ljava/lang/String;)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    const-string v4, "isCircle"

    .line 103
    .line 104
    invoke-virtual {v2, v4, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 105
    .line 106
    .line 107
    move-result v4

    .line 108
    if-eqz v4, :cond_3

    .line 109
    .line 110
    const/4 v4, 0x1

    .line 111
    goto :goto_1

    .line 112
    :cond_3
    move v4, v0

    .line 113
    :goto_1
    invoke-static {v3, v4}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->access$102(Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;Z)Z

    .line 114
    .line 115
    .line 116
    const-string v4, "type"

    .line 117
    .line 118
    const/4 v5, -0x1

    .line 119
    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 120
    .line 121
    .line 122
    move-result v4

    .line 123
    invoke-static {v3, v4}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->access$202(Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;I)I

    .line 124
    .line 125
    .line 126
    const-string v4, "text"

    .line 127
    .line 128
    const-string v5, ""

    .line 129
    .line 130
    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v4

    .line 134
    invoke-static {v3, v4}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->access$302(Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;Ljava/lang/String;)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    const-string v4, "isBold"

    .line 138
    .line 139
    invoke-virtual {v2, v4, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 140
    .line 141
    .line 142
    move-result v4

    .line 143
    invoke-static {v3, v4}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->access$402(Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;Z)Z

    .line 144
    .line 145
    .line 146
    const-string v4, "textSize"

    .line 147
    .line 148
    invoke-virtual {v2, v4, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 149
    .line 150
    .line 151
    move-result v4

    .line 152
    invoke-static {v3, v4}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->access$502(Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;I)I

    .line 153
    .line 154
    .line 155
    const-string v4, "textAlignType"

    .line 156
    .line 157
    invoke-virtual {v2, v4, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 158
    .line 159
    .line 160
    move-result v4

    .line 161
    invoke-static {v3, v4}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->access$602(Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;I)I

    .line 162
    .line 163
    .line 164
    const-string v4, "textColor"

    .line 165
    .line 166
    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v4

    .line 170
    invoke-static {v4}, Lcom/momo/xeengine/svgaplayer/utils/SafeKit;->parseColor(Ljava/lang/String;)I

    .line 171
    .line 172
    .line 173
    move-result v4

    .line 174
    invoke-static {v3, v4}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->access$702(Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;I)I

    .line 175
    .line 176
    .line 177
    const-string v4, "isClick"

    .line 178
    .line 179
    invoke-virtual {v2, v4, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 180
    .line 181
    .line 182
    move-result v2

    .line 183
    invoke-static {v3, v2}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;->access$802(Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;I)I

    .line 184
    .line 185
    .line 186
    iget-object v2, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;->itemsList:Ljava/util/List;

    .line 187
    .line 188
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 192
    .line 193
    goto :goto_0

    .line 194
    :cond_4
    return-void
.end method

.method public static synthetic access$902(Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;->svgaPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method


# virtual methods
.method public getItemsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/xeengine/gift/SVGAGiftDescriptor$Item;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;->itemsList:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPositionType()Lcom/momo/xeengine/gift/SVGAPositionType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;->positionType:Lcom/momo/xeengine/gift/SVGAPositionType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getScaleType()Lcom/momo/xeengine/gift/SVGAScaleType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;->scaleType:Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSvgaPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;->svgaPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setPositionType(Lcom/momo/xeengine/gift/SVGAPositionType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;->positionType:Lcom/momo/xeengine/gift/SVGAPositionType;

    .line 2
    .line 3
    return-void
.end method

.method public setScaleType(Lcom/momo/xeengine/gift/SVGAScaleType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;->scaleType:Lcom/momo/xeengine/gift/SVGAScaleType;

    .line 2
    .line 3
    return-void
.end method
