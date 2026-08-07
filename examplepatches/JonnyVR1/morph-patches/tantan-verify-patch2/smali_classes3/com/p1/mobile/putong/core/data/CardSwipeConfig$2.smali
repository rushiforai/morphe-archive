.class Lcom/p1/mobile/putong/core/data/CardSwipeConfig$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/CardSwipeConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/core/data/CardSwipeConfig;",
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
    const-class p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/core/data/CardSwipeConfig;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CardSwipeConfig$2;->newInstance()Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/core/data/CardSwipeConfig;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/CardSwipeConfig;",
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

    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result p0

    const/4 p4, 0x0

    const/4 p5, 0x1

    const/4 p6, -0x1

    sparse-switch p0, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    const-string p0, "swipe_right_female_during"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    goto/16 :goto_0

    :cond_0
    const/16 p6, 0x2b

    goto/16 :goto_0

    :sswitch_1
    const-string p0, "swipe_trans_y_male"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    goto/16 :goto_0

    :cond_1
    const/16 p6, 0x2a

    goto/16 :goto_0

    :sswitch_2
    const-string p0, "swipe_back_female_during"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2

    goto/16 :goto_0

    :cond_2
    const/16 p6, 0x29

    goto/16 :goto_0

    :sswitch_3
    const-string p0, "female_swipe_auto_width"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3

    goto/16 :goto_0

    :cond_3
    const/16 p6, 0x28

    goto/16 :goto_0

    :sswitch_4
    const-string p0, "swipe_mine_value_male"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4

    goto/16 :goto_0

    :cond_4
    const/16 p6, 0x27

    goto/16 :goto_0

    :sswitch_5
    const-string p0, "swipe_auto_female_during"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5

    goto/16 :goto_0

    :cond_5
    const/16 p6, 0x26

    goto/16 :goto_0

    :sswitch_6
    const-string p0, "scale_use_opt_during"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6

    goto/16 :goto_0

    :cond_6
    const/16 p6, 0x25

    goto/16 :goto_0

    :sswitch_7
    const-string p0, "male_swipe_auto_rotate"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7

    goto/16 :goto_0

    :cond_7
    const/16 p6, 0x24

    goto/16 :goto_0

    :sswitch_8
    const-string p0, "swipe_scale"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8

    goto/16 :goto_0

    :cond_8
    const/16 p6, 0x23

    goto/16 :goto_0

    :sswitch_9
    const-string p0, "male_swipe_auto_factor"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9

    goto/16 :goto_0

    :cond_9
    const/16 p6, 0x22

    goto/16 :goto_0

    :sswitch_a
    const-string p0, "swipe_up_male_during"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a

    goto/16 :goto_0

    :cond_a
    const/16 p6, 0x21

    goto/16 :goto_0

    :sswitch_b
    const-string p0, "swipe_left_female_during"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b

    goto/16 :goto_0

    :cond_b
    const/16 p6, 0x20

    goto/16 :goto_0

    :sswitch_c
    const-string p0, "swipe_left_male_during"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c

    goto/16 :goto_0

    :cond_c
    const/16 p6, 0x1f

    goto/16 :goto_0

    :sswitch_d
    const-string p0, "swipe_fix_speed"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d

    goto/16 :goto_0

    :cond_d
    const/16 p6, 0x1e

    goto/16 :goto_0

    :sswitch_e
    const-string p0, "swipe_rotation_female"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e

    goto/16 :goto_0

    :cond_e
    const/16 p6, 0x1d

    goto/16 :goto_0

    :sswitch_f
    const-string p0, "swipe_out_value_male"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f

    goto/16 :goto_0

    :cond_f
    const/16 p6, 0x1c

    goto/16 :goto_0

    :sswitch_10
    const-string p0, "could_double_click"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10

    goto/16 :goto_0

    :cond_10
    const/16 p6, 0x1b

    goto/16 :goto_0

    :sswitch_11
    const-string p0, "swipe_item_diff_male"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_11

    goto/16 :goto_0

    :cond_11
    const/16 p6, 0x1a

    goto/16 :goto_0

    :sswitch_12
    const-string p0, "scale_alpha_speed"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_12

    goto/16 :goto_0

    :cond_12
    const/16 p6, 0x19

    goto/16 :goto_0

    :sswitch_13
    const-string p0, "swipe_speed_factor_male"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_13

    goto/16 :goto_0

    :cond_13
    const/16 p6, 0x18

    goto/16 :goto_0

    :sswitch_14
    const-string p0, "swipe_speed_factor_female"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_14

    goto/16 :goto_0

    :cond_14
    const/16 p6, 0x17

    goto/16 :goto_0

    :sswitch_15
    const-string p0, "female_swipe_auto_rotate"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_15

    goto/16 :goto_0

    :cond_15
    const/16 p6, 0x16

    goto/16 :goto_0

    :sswitch_16
    const-string p0, "female_swipe_auto_factor"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_16

    goto/16 :goto_0

    :cond_16
    const/16 p6, 0x15

    goto/16 :goto_0

    :sswitch_17
    const-string p0, "config_version"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_17

    goto/16 :goto_0

    :cond_17
    const/16 p6, 0x14

    goto/16 :goto_0

    :sswitch_18
    const-string p0, "swipe_rotation_male"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_18

    goto/16 :goto_0

    :cond_18
    const/16 p6, 0x13

    goto/16 :goto_0

    :sswitch_19
    const-string p0, "swipe_back_male_during"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_19

    goto/16 :goto_0

    :cond_19
    const/16 p6, 0x12

    goto/16 :goto_0

    :sswitch_1a
    const-string p0, "swipe_up_female_during"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1a

    goto/16 :goto_0

    :cond_1a
    const/16 p6, 0x11

    goto/16 :goto_0

    :sswitch_1b
    const-string p0, "swipe_scale_start_alpha"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1b

    goto/16 :goto_0

    :cond_1b
    const/16 p6, 0x10

    goto/16 :goto_0

    :sswitch_1c
    const-string p0, "swipe_type_factor"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1c

    goto/16 :goto_0

    :cond_1c
    const/16 p6, 0xf

    goto/16 :goto_0

    :sswitch_1d
    const-string p0, "swipe_speed_check_female"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1d

    goto/16 :goto_0

    :cond_1d
    const/16 p6, 0xe

    goto/16 :goto_0

    :sswitch_1e
    const-string p0, "scale_opt_during"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1e

    goto/16 :goto_0

    :cond_1e
    const/16 p6, 0xd

    goto/16 :goto_0

    :sswitch_1f
    const-string p0, "male_swipe_auto_width"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1f

    goto/16 :goto_0

    :cond_1f
    const/16 p6, 0xc

    goto/16 :goto_0

    :sswitch_20
    const-string p0, "swipe_speed_check_male"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_20

    goto/16 :goto_0

    :cond_20
    const/16 p6, 0xb

    goto/16 :goto_0

    :sswitch_21
    const-string p0, "swipe_auto_male_during"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_21

    goto/16 :goto_0

    :cond_21
    const/16 p6, 0xa

    goto/16 :goto_0

    :sswitch_22
    const-string p0, "swipe_item_diff_female"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_22

    goto/16 :goto_0

    :cond_22
    const/16 p6, 0x9

    goto/16 :goto_0

    :sswitch_23
    const-string p0, "swipe_mine_value_female"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_23

    goto/16 :goto_0

    :cond_23
    const/16 p6, 0x8

    goto/16 :goto_0

    :sswitch_24
    const-string p0, "swipe_reset_male_during"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_24

    goto :goto_0

    :cond_24
    const/4 p6, 0x7

    goto :goto_0

    :sswitch_25
    const-string p0, "scale_alpha_opt"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_25

    goto :goto_0

    :cond_25
    const/4 p6, 0x6

    goto :goto_0

    :sswitch_26
    const-string p0, "swipe_out_value_female"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_26

    goto :goto_0

    :cond_26
    const/4 p6, 0x5

    goto :goto_0

    :sswitch_27
    const-string p0, "scale_opt"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_27

    goto :goto_0

    :cond_27
    const/4 p6, 0x4

    goto :goto_0

    :sswitch_28
    const-string p0, "swipe_trans_y_female"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_28

    goto :goto_0

    :cond_28
    const/4 p6, 0x3

    goto :goto_0

    :sswitch_29
    const-string p0, "swipe_right_male_during"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_29

    goto :goto_0

    :cond_29
    const/4 p6, 0x2

    goto :goto_0

    :sswitch_2a
    const-string p0, "swipe_progress_value"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2a

    goto :goto_0

    :cond_2a
    move p6, p5

    goto :goto_0

    :sswitch_2b
    const-string p0, "swipe_reset_female_during"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2b

    goto :goto_0

    :cond_2b
    move p6, p4

    :goto_0
    packed-switch p6, :pswitch_data_0

    return p4

    .line 2
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_right_female_during:J

    return p5

    .line 3
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_trans_y_male:J

    return p5

    .line 4
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_back_female_during:J

    return p5

    .line 5
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_width:D

    return p5

    .line 6
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_mine_value_male:I

    return p5

    .line 7
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_auto_female_during:J

    return p5

    .line 8
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_use_opt_during:Z

    return p5

    .line 9
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_rotate:D

    return p5

    .line 10
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_scale:D

    return p5

    .line 11
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_factor:D

    return p5

    .line 12
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_up_male_during:J

    return p5

    .line 13
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_left_female_during:J

    return p5

    .line 14
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_left_male_during:J

    return p5

    .line 15
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_fix_speed:I

    return p5

    .line 16
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_rotation_female:D

    return p5

    .line 17
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_out_value_male:I

    return p5

    .line 18
    :pswitch_10
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->could_double_click:Z

    return p5

    .line 19
    :pswitch_11
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_item_diff_male:I

    return p5

    .line 20
    :pswitch_12
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_alpha_speed:D

    return p5

    .line 21
    :pswitch_13
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_factor_male:D

    return p5

    .line 22
    :pswitch_14
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_factor_female:D

    return p5

    .line 23
    :pswitch_15
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_rotate:D

    return p5

    .line 24
    :pswitch_16
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_factor:D

    return p5

    .line 25
    :pswitch_17
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->config_version:I

    return p5

    .line 26
    :pswitch_18
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_rotation_male:D

    return p5

    .line 27
    :pswitch_19
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_back_male_during:J

    return p5

    .line 28
    :pswitch_1a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_up_female_during:J

    return p5

    .line 29
    :pswitch_1b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_scale_start_alpha:D

    return p5

    .line 30
    :pswitch_1c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_type_factor:D

    return p5

    .line 31
    :pswitch_1d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_check_female:D

    return p5

    .line 32
    :pswitch_1e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_opt_during:J

    return p5

    .line 33
    :pswitch_1f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_width:D

    return p5

    .line 34
    :pswitch_20
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_check_male:D

    return p5

    .line 35
    :pswitch_21
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_auto_male_during:J

    return p5

    .line 36
    :pswitch_22
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_item_diff_female:I

    return p5

    .line 37
    :pswitch_23
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_mine_value_female:I

    return p5

    .line 38
    :pswitch_24
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_reset_male_during:J

    return p5

    .line 39
    :pswitch_25
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_alpha_opt:Z

    return p5

    .line 40
    :pswitch_26
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_out_value_female:I

    return p5

    .line 41
    :pswitch_27
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_opt:Z

    return p5

    .line 42
    :pswitch_28
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_trans_y_female:J

    return p5

    .line 43
    :pswitch_29
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_right_male_during:J

    return p5

    .line 44
    :pswitch_2a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_progress_value:I

    return p5

    .line 45
    :pswitch_2b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    move-result-wide p2

    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_reset_female_during:J

    return p5

    :sswitch_data_0
    .sparse-switch
        -0x7a6100e1 -> :sswitch_2b
        -0x737ccb7c -> :sswitch_2a
        -0x72de56b5 -> :sswitch_29
        -0x727ae2d2 -> :sswitch_28
        -0x6fe9cdc2 -> :sswitch_27
        -0x69c68270 -> :sswitch_26
        -0x68f4e063 -> :sswitch_25
        -0x68763002 -> :sswitch_24
        -0x5935977f -> :sswitch_23
        -0x55270001 -> :sswitch_22
        -0x45e34f78 -> :sswitch_21
        -0x403dcfbf -> :sswitch_20
        -0x3f7f0ab3 -> :sswitch_1f
        -0x3eced09e -> :sswitch_1e
        -0x33c1f780 -> :sswitch_1d
        -0x2b1bb791 -> :sswitch_1c
        -0x256e21f9 -> :sswitch_1b
        -0x2369f1ab -> :sswitch_1a
        -0x233c3c40 -> :sswitch_19
        -0x23216e17 -> :sswitch_18
        -0x1fca1b25 -> :sswitch_17
        -0x1fa579d9 -> :sswitch_16
        -0xa5e95cd -> :sswitch_15
        -0x9f27241 -> :sswitch_14
        -0x62006c0 -> :sswitch_13
        0xf9deb1 -> :sswitch_12
        0x362fb80 -> :sswitch_11
        0xd76de58 -> :sswitch_10
        0x1137a951 -> :sswitch_f
        0x13c8a028 -> :sswitch_e
        0x15cbc4d8 -> :sswitch_d
        0x1c18aee0 -> :sswitch_c
        0x21f1ad81 -> :sswitch_b
        0x284734b4 -> :sswitch_a
        0x322a22a8 -> :sswitch_9
        0x3ae9d805 -> :sswitch_8
        0x477106b4 -> :sswitch_7
        0x4839c29a -> :sswitch_6
        0x4efbe529 -> :sswitch_5
        0x5e389c82 -> :sswitch_4
        0x6306a5ee -> :sswitch_3
        0x642b0a61 -> :sswitch_2
        0x6f82986f -> :sswitch_1
        0x74a5b92c -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
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

    .line 46
    check-cast p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/CardSwipeConfig$2;->parseField(Lcom/p1/mobile/putong/core/data/CardSwipeConfig;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/core/data/CardSwipeConfig;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/CardSwipeConfig;",
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

    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, -0x1

    sparse-switch v0, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    const-string v0, "swipe_right_female_during"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_0

    :cond_0
    const/16 v2, 0x2b

    goto/16 :goto_0

    :sswitch_1
    const-string v0, "swipe_trans_y_male"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto/16 :goto_0

    :cond_1
    const/16 v2, 0x2a

    goto/16 :goto_0

    :sswitch_2
    const-string v0, "swipe_back_female_during"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto/16 :goto_0

    :cond_2
    const/16 v2, 0x29

    goto/16 :goto_0

    :sswitch_3
    const-string v0, "female_swipe_auto_width"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    goto/16 :goto_0

    :cond_3
    const/16 v2, 0x28

    goto/16 :goto_0

    :sswitch_4
    const-string v0, "swipe_mine_value_male"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    goto/16 :goto_0

    :cond_4
    const/16 v2, 0x27

    goto/16 :goto_0

    :sswitch_5
    const-string v0, "swipe_auto_female_during"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    goto/16 :goto_0

    :cond_5
    const/16 v2, 0x26

    goto/16 :goto_0

    :sswitch_6
    const-string v0, "scale_use_opt_during"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    goto/16 :goto_0

    :cond_6
    const/16 v2, 0x25

    goto/16 :goto_0

    :sswitch_7
    const-string v0, "male_swipe_auto_rotate"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    goto/16 :goto_0

    :cond_7
    const/16 v2, 0x24

    goto/16 :goto_0

    :sswitch_8
    const-string v0, "swipe_scale"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    goto/16 :goto_0

    :cond_8
    const/16 v2, 0x23

    goto/16 :goto_0

    :sswitch_9
    const-string v0, "male_swipe_auto_factor"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    goto/16 :goto_0

    :cond_9
    const/16 v2, 0x22

    goto/16 :goto_0

    :sswitch_a
    const-string v0, "swipe_up_male_during"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    goto/16 :goto_0

    :cond_a
    const/16 v2, 0x21

    goto/16 :goto_0

    :sswitch_b
    const-string v0, "swipe_left_female_during"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    goto/16 :goto_0

    :cond_b
    const/16 v2, 0x20

    goto/16 :goto_0

    :sswitch_c
    const-string v0, "swipe_left_male_during"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    goto/16 :goto_0

    :cond_c
    const/16 v2, 0x1f

    goto/16 :goto_0

    :sswitch_d
    const-string v0, "swipe_fix_speed"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    goto/16 :goto_0

    :cond_d
    const/16 v2, 0x1e

    goto/16 :goto_0

    :sswitch_e
    const-string v0, "swipe_rotation_female"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    goto/16 :goto_0

    :cond_e
    const/16 v2, 0x1d

    goto/16 :goto_0

    :sswitch_f
    const-string v0, "swipe_out_value_male"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f

    goto/16 :goto_0

    :cond_f
    const/16 v2, 0x1c

    goto/16 :goto_0

    :sswitch_10
    const-string v0, "could_double_click"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    goto/16 :goto_0

    :cond_10
    const/16 v2, 0x1b

    goto/16 :goto_0

    :sswitch_11
    const-string v0, "swipe_item_diff_male"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_11

    goto/16 :goto_0

    :cond_11
    const/16 v2, 0x1a

    goto/16 :goto_0

    :sswitch_12
    const-string v0, "scale_alpha_speed"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    goto/16 :goto_0

    :cond_12
    const/16 v2, 0x19

    goto/16 :goto_0

    :sswitch_13
    const-string v0, "swipe_speed_factor_male"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_13

    goto/16 :goto_0

    :cond_13
    const/16 v2, 0x18

    goto/16 :goto_0

    :sswitch_14
    const-string v0, "swipe_speed_factor_female"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    goto/16 :goto_0

    :cond_14
    const/16 v2, 0x17

    goto/16 :goto_0

    :sswitch_15
    const-string v0, "female_swipe_auto_rotate"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_15

    goto/16 :goto_0

    :cond_15
    const/16 v2, 0x16

    goto/16 :goto_0

    :sswitch_16
    const-string v0, "female_swipe_auto_factor"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    goto/16 :goto_0

    :cond_16
    const/16 v2, 0x15

    goto/16 :goto_0

    :sswitch_17
    const-string v0, "config_version"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_17

    goto/16 :goto_0

    :cond_17
    const/16 v2, 0x14

    goto/16 :goto_0

    :sswitch_18
    const-string v0, "swipe_rotation_male"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    goto/16 :goto_0

    :cond_18
    const/16 v2, 0x13

    goto/16 :goto_0

    :sswitch_19
    const-string v0, "swipe_back_male_during"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_19

    goto/16 :goto_0

    :cond_19
    const/16 v2, 0x12

    goto/16 :goto_0

    :sswitch_1a
    const-string v0, "swipe_up_female_during"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1a

    goto/16 :goto_0

    :cond_1a
    const/16 v2, 0x11

    goto/16 :goto_0

    :sswitch_1b
    const-string v0, "swipe_scale_start_alpha"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1b

    goto/16 :goto_0

    :cond_1b
    const/16 v2, 0x10

    goto/16 :goto_0

    :sswitch_1c
    const-string v0, "swipe_type_factor"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    goto/16 :goto_0

    :cond_1c
    const/16 v2, 0xf

    goto/16 :goto_0

    :sswitch_1d
    const-string v0, "swipe_speed_check_female"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1d

    goto/16 :goto_0

    :cond_1d
    const/16 v2, 0xe

    goto/16 :goto_0

    :sswitch_1e
    const-string v0, "scale_opt_during"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    goto/16 :goto_0

    :cond_1e
    const/16 v2, 0xd

    goto/16 :goto_0

    :sswitch_1f
    const-string v0, "male_swipe_auto_width"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1f

    goto/16 :goto_0

    :cond_1f
    const/16 v2, 0xc

    goto/16 :goto_0

    :sswitch_20
    const-string v0, "swipe_speed_check_male"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    goto/16 :goto_0

    :cond_20
    const/16 v2, 0xb

    goto/16 :goto_0

    :sswitch_21
    const-string v0, "swipe_auto_male_during"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_21

    goto/16 :goto_0

    :cond_21
    const/16 v2, 0xa

    goto/16 :goto_0

    :sswitch_22
    const-string v0, "swipe_item_diff_female"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_22

    goto/16 :goto_0

    :cond_22
    const/16 v2, 0x9

    goto/16 :goto_0

    :sswitch_23
    const-string v0, "swipe_mine_value_female"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_23

    goto/16 :goto_0

    :cond_23
    const/16 v2, 0x8

    goto/16 :goto_0

    :sswitch_24
    const-string v0, "swipe_reset_male_during"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_24

    goto :goto_0

    :cond_24
    const/4 v2, 0x7

    goto :goto_0

    :sswitch_25
    const-string v0, "scale_alpha_opt"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_25

    goto :goto_0

    :cond_25
    const/4 v2, 0x6

    goto :goto_0

    :sswitch_26
    const-string v0, "swipe_out_value_female"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_26

    goto :goto_0

    :cond_26
    const/4 v2, 0x5

    goto :goto_0

    :sswitch_27
    const-string v0, "scale_opt"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_27

    goto :goto_0

    :cond_27
    const/4 v2, 0x4

    goto :goto_0

    :sswitch_28
    const-string v0, "swipe_trans_y_female"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_28

    goto :goto_0

    :cond_28
    const/4 v2, 0x3

    goto :goto_0

    :sswitch_29
    const-string v0, "swipe_right_male_during"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_29

    goto :goto_0

    :cond_29
    const/4 v2, 0x2

    goto :goto_0

    :sswitch_2a
    const-string v0, "swipe_progress_value"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2a

    goto :goto_0

    :cond_2a
    move v2, v1

    goto :goto_0

    :sswitch_2b
    const-string v0, "swipe_reset_female_during"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2b

    goto :goto_0

    :cond_2b
    const/4 v2, 0x0

    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 2
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0

    :pswitch_0
    return v1

    :sswitch_data_0
    .sparse-switch
        -0x7a6100e1 -> :sswitch_2b
        -0x737ccb7c -> :sswitch_2a
        -0x72de56b5 -> :sswitch_29
        -0x727ae2d2 -> :sswitch_28
        -0x6fe9cdc2 -> :sswitch_27
        -0x69c68270 -> :sswitch_26
        -0x68f4e063 -> :sswitch_25
        -0x68763002 -> :sswitch_24
        -0x5935977f -> :sswitch_23
        -0x55270001 -> :sswitch_22
        -0x45e34f78 -> :sswitch_21
        -0x403dcfbf -> :sswitch_20
        -0x3f7f0ab3 -> :sswitch_1f
        -0x3eced09e -> :sswitch_1e
        -0x33c1f780 -> :sswitch_1d
        -0x2b1bb791 -> :sswitch_1c
        -0x256e21f9 -> :sswitch_1b
        -0x2369f1ab -> :sswitch_1a
        -0x233c3c40 -> :sswitch_19
        -0x23216e17 -> :sswitch_18
        -0x1fca1b25 -> :sswitch_17
        -0x1fa579d9 -> :sswitch_16
        -0xa5e95cd -> :sswitch_15
        -0x9f27241 -> :sswitch_14
        -0x62006c0 -> :sswitch_13
        0xf9deb1 -> :sswitch_12
        0x362fb80 -> :sswitch_11
        0xd76de58 -> :sswitch_10
        0x1137a951 -> :sswitch_f
        0x13c8a028 -> :sswitch_e
        0x15cbc4d8 -> :sswitch_d
        0x1c18aee0 -> :sswitch_c
        0x21f1ad81 -> :sswitch_b
        0x284734b4 -> :sswitch_a
        0x322a22a8 -> :sswitch_9
        0x3ae9d805 -> :sswitch_8
        0x477106b4 -> :sswitch_7
        0x4839c29a -> :sswitch_6
        0x4efbe529 -> :sswitch_5
        0x5e389c82 -> :sswitch_4
        0x6306a5ee -> :sswitch_3
        0x642b0a61 -> :sswitch_2
        0x6f82986f -> :sswitch_1
        0x74a5b92c -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
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

    .line 3
    check-cast p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/CardSwipeConfig$2;->parseFieldCheck(Lcom/p1/mobile/putong/core/data/CardSwipeConfig;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/core/data/CardSwipeConfig;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string p0, "swipe_left_male_during"

    .line 2
    .line 3
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_left_male_during:J

    .line 4
    .line 5
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 6
    .line 7
    .line 8
    const-string p0, "swipe_right_male_during"

    .line 9
    .line 10
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_right_male_during:J

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 13
    .line 14
    .line 15
    const-string p0, "swipe_up_male_during"

    .line 16
    .line 17
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_up_male_during:J

    .line 18
    .line 19
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 20
    .line 21
    .line 22
    const-string p0, "swipe_auto_male_during"

    .line 23
    .line 24
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_auto_male_during:J

    .line 25
    .line 26
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 27
    .line 28
    .line 29
    const-string p0, "swipe_back_male_during"

    .line 30
    .line 31
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_back_male_during:J

    .line 32
    .line 33
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 34
    .line 35
    .line 36
    const-string p0, "swipe_reset_male_during"

    .line 37
    .line 38
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_reset_male_during:J

    .line 39
    .line 40
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 41
    .line 42
    .line 43
    const-string p0, "swipe_rotation_male"

    .line 44
    .line 45
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_rotation_male:D

    .line 46
    .line 47
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 48
    .line 49
    .line 50
    const-string p0, "swipe_trans_y_male"

    .line 51
    .line 52
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_trans_y_male:J

    .line 53
    .line 54
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 55
    .line 56
    .line 57
    const-string p0, "swipe_speed_factor_male"

    .line 58
    .line 59
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_factor_male:D

    .line 60
    .line 61
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 62
    .line 63
    .line 64
    const-string p0, "swipe_speed_check_male"

    .line 65
    .line 66
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_check_male:D

    .line 67
    .line 68
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 69
    .line 70
    .line 71
    const-string p0, "swipe_left_female_during"

    .line 72
    .line 73
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_left_female_during:J

    .line 74
    .line 75
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 76
    .line 77
    .line 78
    const-string p0, "swipe_right_female_during"

    .line 79
    .line 80
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_right_female_during:J

    .line 81
    .line 82
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 83
    .line 84
    .line 85
    const-string p0, "swipe_up_female_during"

    .line 86
    .line 87
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_up_female_during:J

    .line 88
    .line 89
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 90
    .line 91
    .line 92
    const-string p0, "swipe_auto_female_during"

    .line 93
    .line 94
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_auto_female_during:J

    .line 95
    .line 96
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 97
    .line 98
    .line 99
    const-string p0, "swipe_back_female_during"

    .line 100
    .line 101
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_back_female_during:J

    .line 102
    .line 103
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 104
    .line 105
    .line 106
    const-string p0, "swipe_reset_female_during"

    .line 107
    .line 108
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_reset_female_during:J

    .line 109
    .line 110
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 111
    .line 112
    .line 113
    const-string p0, "swipe_rotation_female"

    .line 114
    .line 115
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_rotation_female:D

    .line 116
    .line 117
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 118
    .line 119
    .line 120
    const-string p0, "swipe_trans_y_female"

    .line 121
    .line 122
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_trans_y_female:J

    .line 123
    .line 124
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 125
    .line 126
    .line 127
    const-string p0, "swipe_speed_factor_female"

    .line 128
    .line 129
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_factor_female:D

    .line 130
    .line 131
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 132
    .line 133
    .line 134
    const-string p0, "swipe_speed_check_female"

    .line 135
    .line 136
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_check_female:D

    .line 137
    .line 138
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 139
    .line 140
    .line 141
    const-string p0, "swipe_item_diff_male"

    .line 142
    .line 143
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_item_diff_male:I

    .line 144
    .line 145
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 146
    .line 147
    .line 148
    const-string p0, "swipe_out_value_male"

    .line 149
    .line 150
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_out_value_male:I

    .line 151
    .line 152
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 153
    .line 154
    .line 155
    const-string p0, "swipe_mine_value_male"

    .line 156
    .line 157
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_mine_value_male:I

    .line 158
    .line 159
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 160
    .line 161
    .line 162
    const-string p0, "swipe_item_diff_female"

    .line 163
    .line 164
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_item_diff_female:I

    .line 165
    .line 166
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 167
    .line 168
    .line 169
    const-string p0, "swipe_out_value_female"

    .line 170
    .line 171
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_out_value_female:I

    .line 172
    .line 173
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 174
    .line 175
    .line 176
    const-string p0, "swipe_mine_value_female"

    .line 177
    .line 178
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_mine_value_female:I

    .line 179
    .line 180
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 181
    .line 182
    .line 183
    const-string p0, "male_swipe_auto_width"

    .line 184
    .line 185
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_width:D

    .line 186
    .line 187
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 188
    .line 189
    .line 190
    const-string p0, "female_swipe_auto_width"

    .line 191
    .line 192
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_width:D

    .line 193
    .line 194
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 195
    .line 196
    .line 197
    const-string p0, "male_swipe_auto_factor"

    .line 198
    .line 199
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_factor:D

    .line 200
    .line 201
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 202
    .line 203
    .line 204
    const-string p0, "female_swipe_auto_factor"

    .line 205
    .line 206
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_factor:D

    .line 207
    .line 208
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 209
    .line 210
    .line 211
    const-string p0, "male_swipe_auto_rotate"

    .line 212
    .line 213
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_rotate:D

    .line 214
    .line 215
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 216
    .line 217
    .line 218
    const-string p0, "female_swipe_auto_rotate"

    .line 219
    .line 220
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_rotate:D

    .line 221
    .line 222
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 223
    .line 224
    .line 225
    const-string p0, "could_double_click"

    .line 226
    .line 227
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->could_double_click:Z

    .line 228
    .line 229
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 230
    .line 231
    .line 232
    const-string p0, "swipe_type_factor"

    .line 233
    .line 234
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_type_factor:D

    .line 235
    .line 236
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 237
    .line 238
    .line 239
    const-string p0, "swipe_fix_speed"

    .line 240
    .line 241
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_fix_speed:I

    .line 242
    .line 243
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 244
    .line 245
    .line 246
    const-string p0, "swipe_scale"

    .line 247
    .line 248
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_scale:D

    .line 249
    .line 250
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 251
    .line 252
    .line 253
    const-string p0, "swipe_scale_start_alpha"

    .line 254
    .line 255
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_scale_start_alpha:D

    .line 256
    .line 257
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 258
    .line 259
    .line 260
    const-string p0, "swipe_progress_value"

    .line 261
    .line 262
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_progress_value:I

    .line 263
    .line 264
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 265
    .line 266
    .line 267
    const-string p0, "config_version"

    .line 268
    .line 269
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->config_version:I

    .line 270
    .line 271
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 272
    .line 273
    .line 274
    const-string p0, "scale_opt"

    .line 275
    .line 276
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_opt:Z

    .line 277
    .line 278
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 279
    .line 280
    .line 281
    const-string p0, "scale_opt_during"

    .line 282
    .line 283
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_opt_during:J

    .line 284
    .line 285
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 286
    .line 287
    .line 288
    const-string p0, "scale_use_opt_during"

    .line 289
    .line 290
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_use_opt_during:Z

    .line 291
    .line 292
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 293
    .line 294
    .line 295
    const-string p0, "scale_alpha_opt"

    .line 296
    .line 297
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_alpha_opt:Z

    .line 298
    .line 299
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 300
    .line 301
    .line 302
    const-string p0, "scale_alpha_speed"

    .line 303
    .line 304
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_alpha_speed:D

    .line 305
    .line 306
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 307
    .line 308
    .line 309
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 310
    check-cast p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/CardSwipeConfig$2;->serializeFields(Lcom/p1/mobile/putong/core/data/CardSwipeConfig;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
