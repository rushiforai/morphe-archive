.class Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;",
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
    const-class p0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig$2;->newInstance()Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;",
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
    goto :goto_0

    .line 15
    :sswitch_0
    const-string p0, "intl_pop_0_20_women"

    .line 16
    .line 17
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p6, 0x6

    .line 25
    goto :goto_0

    .line 26
    :sswitch_1
    const-string p0, "intl_card_user_last_active_limit_time"

    .line 27
    .line 28
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-nez p0, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 p6, 0x5

    .line 36
    goto :goto_0

    .line 37
    :sswitch_2
    const-string p0, "intl_sl_card_guide_dlg_men"

    .line 38
    .line 39
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-nez p0, :cond_2

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    const/4 p6, 0x4

    .line 47
    goto :goto_0

    .line 48
    :sswitch_3
    const-string p0, "intl_sl_card_guide_dlg_women"

    .line 49
    .line 50
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-nez p0, :cond_3

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_3
    const/4 p6, 0x3

    .line 58
    goto :goto_0

    .line 59
    :sswitch_4
    const-string p0, "intl_pop_0_30_women"

    .line 60
    .line 61
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-nez p0, :cond_4

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_4
    const/4 p6, 0x2

    .line 69
    goto :goto_0

    .line 70
    :sswitch_5
    const-string p0, "intl_pop_0_30_men"

    .line 71
    .line 72
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-nez p0, :cond_5

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_5
    move p6, p5

    .line 80
    goto :goto_0

    .line 81
    :sswitch_6
    const-string p0, "intl_pop_0_20_men"

    .line 82
    .line 83
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    if-nez p0, :cond_6

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_6
    move p6, p4

    .line 91
    :goto_0
    packed-switch p6, :pswitch_data_0

    .line 92
    .line 93
    .line 94
    return p4

    .line 95
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 96
    .line 97
    .line 98
    move-result-wide p2

    .line 99
    double-to-float p0, p2

    .line 100
    iput p0, p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_20_women:F

    .line 101
    .line 102
    return p5

    .line 103
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    iput p0, p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_card_user_last_active_limit_time:I

    .line 108
    .line 109
    return p5

    .line 110
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 111
    .line 112
    .line 113
    move-result p0

    .line 114
    iput p0, p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_sl_card_guide_dlg_men:I

    .line 115
    .line 116
    return p5

    .line 117
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    iput p0, p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_sl_card_guide_dlg_women:I

    .line 122
    .line 123
    return p5

    .line 124
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 125
    .line 126
    .line 127
    move-result-wide p2

    .line 128
    double-to-float p0, p2

    .line 129
    iput p0, p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_30_women:F

    .line 130
    .line 131
    return p5

    .line 132
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 133
    .line 134
    .line 135
    move-result-wide p2

    .line 136
    double-to-float p0, p2

    .line 137
    iput p0, p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_30_men:F

    .line 138
    .line 139
    return p5

    .line 140
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 141
    .line 142
    .line 143
    move-result-wide p2

    .line 144
    double-to-float p0, p2

    .line 145
    iput p0, p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_20_men:F

    .line 146
    .line 147
    return p5

    .line 148
    nop

    .line 149
    :sswitch_data_0
    .sparse-switch
        -0x33d57fec -> :sswitch_6
        -0x3220a74d -> :sswitch_5
        -0x2c028865 -> :sswitch_4
        -0x2b7705d0 -> :sswitch_3
        0xb247c88 -> :sswitch_2
        0x1db5b228 -> :sswitch_1
        0x6c1c4abc -> :sswitch_0
    .end sparse-switch

    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    :pswitch_data_0
    .packed-switch 0x0
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

    .line 149
    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig$2;->parseField(Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;",
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

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x1

    .line 9
    const/4 v2, -0x1

    .line 10
    sparse-switch v0, :sswitch_data_0

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :sswitch_0
    const-string v0, "intl_pop_0_20_women"

    .line 15
    .line 16
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v2, 0x6

    .line 24
    goto :goto_0

    .line 25
    :sswitch_1
    const-string v0, "intl_card_user_last_active_limit_time"

    .line 26
    .line 27
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const/4 v2, 0x5

    .line 35
    goto :goto_0

    .line 36
    :sswitch_2
    const-string v0, "intl_sl_card_guide_dlg_men"

    .line 37
    .line 38
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_2

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    const/4 v2, 0x4

    .line 46
    goto :goto_0

    .line 47
    :sswitch_3
    const-string v0, "intl_sl_card_guide_dlg_women"

    .line 48
    .line 49
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_3

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    const/4 v2, 0x3

    .line 57
    goto :goto_0

    .line 58
    :sswitch_4
    const-string v0, "intl_pop_0_30_women"

    .line 59
    .line 60
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_4

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_4
    const/4 v2, 0x2

    .line 68
    goto :goto_0

    .line 69
    :sswitch_5
    const-string v0, "intl_pop_0_30_men"

    .line 70
    .line 71
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_5

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_5
    move v2, v1

    .line 79
    goto :goto_0

    .line 80
    :sswitch_6
    const-string v0, "intl_pop_0_20_men"

    .line 81
    .line 82
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-nez v0, :cond_6

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_6
    const/4 v2, 0x0

    .line 90
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 91
    .line 92
    .line 93
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    return p0

    .line 98
    :pswitch_0
    return v1

    .line 99
    :sswitch_data_0
    .sparse-switch
        -0x33d57fec -> :sswitch_6
        -0x3220a74d -> :sswitch_5
        -0x2c028865 -> :sswitch_4
        -0x2b7705d0 -> :sswitch_3
        0xb247c88 -> :sswitch_2
        0x1db5b228 -> :sswitch_1
        0x6c1c4abc -> :sswitch_0
    .end sparse-switch

    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0

    .line 99
    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig$2;->parseFieldCheck(Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string p0, "intl_sl_card_guide_dlg_men"

    .line 2
    .line 3
    iget v0, p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_sl_card_guide_dlg_men:I

    .line 4
    .line 5
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 6
    .line 7
    .line 8
    const-string p0, "intl_sl_card_guide_dlg_women"

    .line 9
    .line 10
    iget v0, p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_sl_card_guide_dlg_women:I

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    const-string p0, "intl_pop_0_20_men"

    .line 16
    .line 17
    iget v0, p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_20_men:F

    .line 18
    .line 19
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 20
    .line 21
    .line 22
    const-string p0, "intl_pop_0_20_women"

    .line 23
    .line 24
    iget v0, p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_20_women:F

    .line 25
    .line 26
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 27
    .line 28
    .line 29
    const-string p0, "intl_pop_0_30_men"

    .line 30
    .line 31
    iget v0, p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_30_men:F

    .line 32
    .line 33
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 34
    .line 35
    .line 36
    const-string p0, "intl_pop_0_30_women"

    .line 37
    .line 38
    iget v0, p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_30_women:F

    .line 39
    .line 40
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 41
    .line 42
    .line 43
    const-string p0, "intl_card_user_last_active_limit_time"

    .line 44
    .line 45
    iget p1, p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_card_user_last_active_limit_time:I

    .line 46
    .line 47
    invoke-virtual {p2, p0, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 51
    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig$2;->serializeFields(Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
