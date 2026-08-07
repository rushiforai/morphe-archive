.class Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getDataClass()Ljava/lang/Class;
    .locals 0

    .line 1
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;",
            "Ljava/lang/String;",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/tantanapp/common/data/BaseData;",
            ">;",
            "Lcom/tantanapp/common/data/DataChecker;",
            ")Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 p4, 0x0

    .line 9
    const/4 p5, 0x1

    .line 10
    const/4 p6, -0x1

    .line 11
    sparse-switch p0, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto/16 :goto_0

    .line 15
    .line 16
    :sswitch_0
    const-string p0, "captureHeight"

    .line 17
    .line 18
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-nez p0, :cond_0

    .line 23
    .line 24
    goto/16 :goto_0

    .line 25
    .line 26
    :cond_0
    const/16 p6, 0x8

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "downGrade"

    .line 31
    .line 32
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-nez p0, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/4 p6, 0x7

    .line 40
    goto :goto_0

    .line 41
    :sswitch_2
    const-string p0, "pushHeight"

    .line 42
    .line 43
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-nez p0, :cond_2

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    const/4 p6, 0x6

    .line 51
    goto :goto_0

    .line 52
    :sswitch_3
    const-string p0, "captureWidth"

    .line 53
    .line 54
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-nez p0, :cond_3

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_3
    const/4 p6, 0x5

    .line 62
    goto :goto_0

    .line 63
    :sswitch_4
    const-string p0, "pushBitrate"

    .line 64
    .line 65
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-nez p0, :cond_4

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_4
    const/4 p6, 0x4

    .line 73
    goto :goto_0

    .line 74
    :sswitch_5
    const-string p0, "pushFps"

    .line 75
    .line 76
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-nez p0, :cond_5

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_5
    const/4 p6, 0x3

    .line 84
    goto :goto_0

    .line 85
    :sswitch_6
    const-string p0, "captureFps"

    .line 86
    .line 87
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    if-nez p0, :cond_6

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_6
    const/4 p6, 0x2

    .line 95
    goto :goto_0

    .line 96
    :sswitch_7
    const-string p0, "pushWidth"

    .line 97
    .line 98
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    if-nez p0, :cond_7

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_7
    move p6, p5

    .line 106
    goto :goto_0

    .line 107
    :sswitch_8
    const-string p0, "videoCodecType"

    .line 108
    .line 109
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    if-nez p0, :cond_8

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_8
    move p6, p4

    .line 117
    :goto_0
    packed-switch p6, :pswitch_data_0

    .line 118
    .line 119
    .line 120
    return p4

    .line 121
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->captureHeight:I

    .line 126
    .line 127
    return p5

    .line 128
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 129
    .line 130
    .line 131
    move-result p0

    .line 132
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->downGrade:Z

    .line 133
    .line 134
    return p5

    .line 135
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->pushHeight:I

    .line 140
    .line 141
    return p5

    .line 142
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 143
    .line 144
    .line 145
    move-result p0

    .line 146
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->captureWidth:I

    .line 147
    .line 148
    return p5

    .line 149
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 150
    .line 151
    .line 152
    move-result p0

    .line 153
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->pushBitrate:I

    .line 154
    .line 155
    return p5

    .line 156
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 157
    .line 158
    .line 159
    move-result p0

    .line 160
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->pushFps:I

    .line 161
    .line 162
    return p5

    .line 163
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 164
    .line 165
    .line 166
    move-result p0

    .line 167
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->captureFps:I

    .line 168
    .line 169
    return p5

    .line 170
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 171
    .line 172
    .line 173
    move-result p0

    .line 174
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->pushWidth:I

    .line 175
    .line 176
    return p5

    .line 177
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 178
    .line 179
    .line 180
    move-result p0

    .line 181
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->videoCodecType:I

    .line 182
    .line 183
    return p5

    .line 184
    nop

    .line 185
    :sswitch_data_0
    .sparse-switch
        -0x302101cb -> :sswitch_8
        -0x2e461134 -> :sswitch_7
        -0x20b8403d -> :sswitch_6
        -0xd1a2891 -> :sswitch_5
        -0xb08ed0d -> :sswitch_4
        0x2d431220 -> :sswitch_3
        0x4bb4f0e1 -> :sswitch_2
        0x4c364055 -> :sswitch_1
        0x6150380d -> :sswitch_0
    .end sparse-switch

    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic parseField(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 185
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string p0, "captureWidth"

    .line 2
    .line 3
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->captureWidth:I

    .line 4
    .line 5
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 6
    .line 7
    .line 8
    const-string p0, "captureHeight"

    .line 9
    .line 10
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->captureHeight:I

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    const-string p0, "captureFps"

    .line 16
    .line 17
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->captureFps:I

    .line 18
    .line 19
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 20
    .line 21
    .line 22
    const-string p0, "pushWidth"

    .line 23
    .line 24
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->pushWidth:I

    .line 25
    .line 26
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    const-string p0, "pushHeight"

    .line 30
    .line 31
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->pushHeight:I

    .line 32
    .line 33
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 34
    .line 35
    .line 36
    const-string p0, "pushBitrate"

    .line 37
    .line 38
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->pushBitrate:I

    .line 39
    .line 40
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 41
    .line 42
    .line 43
    const-string p0, "pushFps"

    .line 44
    .line 45
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->pushFps:I

    .line 46
    .line 47
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 48
    .line 49
    .line 50
    const-string p0, "downGrade"

    .line 51
    .line 52
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->downGrade:Z

    .line 53
    .line 54
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 55
    .line 56
    .line 57
    const-string p0, "videoCodecType"

    .line 58
    .line 59
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->videoCodecType:I

    .line 60
    .line 61
    invoke-virtual {p2, p0, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 65
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
