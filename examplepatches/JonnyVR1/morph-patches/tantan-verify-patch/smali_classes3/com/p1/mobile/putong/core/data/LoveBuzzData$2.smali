.class Lcom/p1/mobile/putong/core/data/LoveBuzzData$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/LoveBuzzData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/core/data/LoveBuzzData;",
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
    const-class p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/core/data/LoveBuzzData;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/LoveBuzzData;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/LoveBuzzData$2;->newInstance()Lcom/p1/mobile/putong/core/data/LoveBuzzData;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/core/data/LoveBuzzData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/LoveBuzzData;",
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

    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, -0x1

    sparse-switch p0, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    const-string p0, "videoBuzzReactTimeout"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    goto/16 :goto_0

    :cond_0
    const/16 v2, 0x2a

    goto/16 :goto_0

    :sswitch_1
    const-string p0, "rateLimited"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    goto/16 :goto_0

    :cond_1
    const/16 v2, 0x29

    goto/16 :goto_0

    :sswitch_2
    const-string p0, "videoBuzzConnectTimeout"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2

    goto/16 :goto_0

    :cond_2
    const/16 v2, 0x28

    goto/16 :goto_0

    :sswitch_3
    const-string p0, "potentialPremium"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3

    goto/16 :goto_0

    :cond_3
    const/16 v2, 0x27

    goto/16 :goto_0

    :sswitch_4
    const-string p0, "memojiBuzzToggle"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4

    goto/16 :goto_0

    :cond_4
    const/16 v2, 0x26

    goto/16 :goto_0

    :sswitch_5
    const-string p0, "remainingTextBuzz"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5

    goto/16 :goto_0

    :cond_5
    const/16 v2, 0x25

    goto/16 :goto_0

    :sswitch_6
    const-string p0, "voiceBuzzRTCVendor"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6

    goto/16 :goto_0

    :cond_6
    const/16 v2, 0x24

    goto/16 :goto_0

    :sswitch_7
    const-string p0, "memojiBuzzPairFailHintTimeout"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7

    goto/16 :goto_0

    :cond_7
    const/16 v2, 0x23

    goto/16 :goto_0

    :sswitch_8
    const-string p0, "remainingBonus"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8

    goto/16 :goto_0

    :cond_8
    const/16 v2, 0x22

    goto/16 :goto_0

    :sswitch_9
    const-string p0, "memojiBuzzReactTimeout"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_9

    goto/16 :goto_0

    :cond_9
    const/16 v2, 0x21

    goto/16 :goto_0

    :sswitch_a
    const-string p0, "textBuzzPairFailHintTimeout"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_a

    goto/16 :goto_0

    :cond_a
    const/16 v2, 0x20

    goto/16 :goto_0

    :sswitch_b
    const-string p0, "prolongDuration"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_b

    goto/16 :goto_0

    :cond_b
    const/16 v2, 0x1f

    goto/16 :goto_0

    :sswitch_c
    const-string p0, "videoBuzzWaitingTimeout"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_c

    goto/16 :goto_0

    :cond_c
    const/16 v2, 0x1e

    goto/16 :goto_0

    :sswitch_d
    const-string p0, "recommendResolution"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_d

    goto/16 :goto_0

    :cond_d
    const/16 v2, 0x1d

    goto/16 :goto_0

    :sswitch_e
    const-string p0, "remainingVoiceBuzz"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_e

    goto/16 :goto_0

    :cond_e
    const/16 v2, 0x1c

    goto/16 :goto_0

    :sswitch_f
    const-string p0, "voiceBuzzReactTimeout"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_f

    goto/16 :goto_0

    :cond_f
    const/16 v2, 0x1b

    goto/16 :goto_0

    :sswitch_10
    const-string p0, "matched"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_10

    goto/16 :goto_0

    :cond_10
    const/16 v2, 0x1a

    goto/16 :goto_0

    :sswitch_11
    const-string p0, "memojiBuzzConnectTimeout"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_11

    goto/16 :goto_0

    :cond_11
    const/16 v2, 0x19

    goto/16 :goto_0

    :sswitch_12
    const-string p0, "videoBuzzPairFailHintTimeout"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_12

    goto/16 :goto_0

    :cond_12
    const/16 v2, 0x18

    goto/16 :goto_0

    :sswitch_13
    const-string p0, "bonusThreshold"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_13

    goto/16 :goto_0

    :cond_13
    const/16 v2, 0x17

    goto/16 :goto_0

    :sswitch_14
    const-string p0, "allowedMCCSwitchList"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_14

    goto/16 :goto_0

    :cond_14
    const/16 v2, 0x16

    goto/16 :goto_0

    :sswitch_15
    const-string p0, "mcc"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_15

    goto/16 :goto_0

    :cond_15
    const/16 v2, 0x15

    goto/16 :goto_0

    :sswitch_16
    const-string p0, "memojiBuzzWaitingTimeout"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_16

    goto/16 :goto_0

    :cond_16
    const/16 v2, 0x14

    goto/16 :goto_0

    :sswitch_17
    const-string p0, "voiceBuzzConnectTimeout"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_17

    goto/16 :goto_0

    :cond_17
    const/16 v2, 0x13

    goto/16 :goto_0

    :sswitch_18
    const-string p0, "voiceBuzzToggle"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_18

    goto/16 :goto_0

    :cond_18
    const/16 v2, 0x12

    goto/16 :goto_0

    :sswitch_19
    const-string p0, "isTextBuzzBoosted"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_19

    goto/16 :goto_0

    :cond_19
    const/16 v2, 0x11

    goto/16 :goto_0

    :sswitch_1a
    const-string p0, "bonusEnabledBuzz"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1a

    goto/16 :goto_0

    :cond_1a
    const/16 v2, 0x10

    goto/16 :goto_0

    :sswitch_1b
    const-string p0, "isBoosted"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1b

    goto/16 :goto_0

    :cond_1b
    const/16 v2, 0xf

    goto/16 :goto_0

    :sswitch_1c
    const-string p0, "videoBuzzToggle"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1c

    goto/16 :goto_0

    :cond_1c
    const/16 v2, 0xe

    goto/16 :goto_0

    :sswitch_1d
    const-string p0, "voiceBuzzWaitingTimeout"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1d

    goto/16 :goto_0

    :cond_1d
    const/16 v2, 0xd

    goto/16 :goto_0

    :sswitch_1e
    const-string p0, "userId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1e

    goto/16 :goto_0

    :cond_1e
    const/16 v2, 0xc

    goto/16 :goto_0

    :sswitch_1f
    const-string p0, "isTextBuzzExhausted"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1f

    goto/16 :goto_0

    :cond_1f
    const/16 v2, 0xb

    goto/16 :goto_0

    :sswitch_20
    const-string p0, "remainingVideoBuzz"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_20

    goto/16 :goto_0

    :cond_20
    const/16 v2, 0xa

    goto/16 :goto_0

    :sswitch_21
    const-string p0, "remainingMemojiBuzz"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_21

    goto/16 :goto_0

    :cond_21
    const/16 v2, 0x9

    goto/16 :goto_0

    :sswitch_22
    const-string p0, "enabledBuzz"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_22

    goto/16 :goto_0

    :cond_22
    const/16 v2, 0x8

    goto/16 :goto_0

    :sswitch_23
    const-string p0, "conversationId"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_23

    goto :goto_0

    :cond_23
    const/4 v2, 0x7

    goto :goto_0

    :sswitch_24
    const-string p0, "voiceBuzzPairFailHintTimeout"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_24

    goto :goto_0

    :cond_24
    const/4 v2, 0x6

    goto :goto_0

    :sswitch_25
    const-string p0, "videoBuzzRTCVendor"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_25

    goto :goto_0

    :cond_25
    const/4 v2, 0x5

    goto :goto_0

    :sswitch_26
    const-string p0, "remainingProlongCount"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_26

    goto :goto_0

    :cond_26
    const/4 v2, 0x4

    goto :goto_0

    :sswitch_27
    const-string p0, "textBuzzToggle"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_27

    goto :goto_0

    :cond_27
    const/4 v2, 0x3

    goto :goto_0

    :sswitch_28
    const-string p0, "showedPassiveModeBuzz"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_28

    goto :goto_0

    :cond_28
    const/4 v2, 0x2

    goto :goto_0

    :sswitch_29
    const-string p0, "totalDuration"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_29

    goto :goto_0

    :cond_29
    move v2, v1

    goto :goto_0

    :sswitch_2a
    const-string p0, "memojiBuzzRTCVendor"

    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2a

    goto :goto_0

    :cond_2a
    move v2, v0

    :goto_0
    packed-switch v2, :pswitch_data_0

    return v0

    .line 2
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzReactTimeout:I

    return v1

    .line 3
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/core/data/RateLimited;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 4
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/RateLimited;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->rateLimited:Lcom/p1/mobile/putong/core/data/RateLimited;

    return v1

    .line 5
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzConnectTimeout:I

    return v1

    .line 6
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->potentialPremium:Z

    return v1

    .line 7
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzToggle:Z

    return v1

    .line 8
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingTextBuzz:I

    return v1

    .line 9
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzRTCVendor:Ljava/lang/String;

    return v1

    .line 10
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzPairFailHintTimeout:I

    return v1

    .line 11
    :pswitch_8
    sget-object p0, Lcom/p1/mobile/putong/core/data/RemainingBonus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 12
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/RemainingBonus;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingBonus:Lcom/p1/mobile/putong/core/data/RemainingBonus;

    return v1

    .line 13
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzReactTimeout:I

    return v1

    .line 14
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->textBuzzPairFailHintTimeout:I

    return v1

    .line 15
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->prolongDuration:I

    return v1

    .line 16
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzWaitingTimeout:I

    return v1

    .line 17
    :pswitch_d
    sget-object p0, Lcom/p1/mobile/putong/core/data/BuzzResolution;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 18
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/BuzzResolution;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->recommendResolution:Lcom/p1/mobile/putong/core/data/BuzzResolution;

    return v1

    .line 19
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingVoiceBuzz:I

    return v1

    .line 20
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzReactTimeout:I

    return v1

    .line 21
    :pswitch_10
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->matched:Z

    return v1

    .line 22
    :pswitch_11
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzConnectTimeout:I

    return v1

    .line 23
    :pswitch_12
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzPairFailHintTimeout:I

    return v1

    .line 24
    :pswitch_13
    sget-object p0, Lcom/p1/mobile/putong/core/data/BonusThreshold;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 25
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/core/data/BonusThreshold;

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusThreshold:Lcom/p1/mobile/putong/core/data/BonusThreshold;

    return v1

    .line 26
    :pswitch_14
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 27
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->allowedMCCSwitchList:Ljava/util/List;

    return v1

    .line 28
    :pswitch_15
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->mcc:I

    return v1

    .line 29
    :pswitch_16
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzWaitingTimeout:I

    return v1

    .line 30
    :pswitch_17
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzConnectTimeout:I

    return v1

    .line 31
    :pswitch_18
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzToggle:Z

    return v1

    .line 32
    :pswitch_19
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->isTextBuzzBoosted:Z

    return v1

    .line 33
    :pswitch_1a
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 34
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusEnabledBuzz:Ljava/util/List;

    return v1

    .line 35
    :pswitch_1b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->isBoosted:Z

    return v1

    .line 36
    :pswitch_1c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzToggle:Z

    return v1

    .line 37
    :pswitch_1d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzWaitingTimeout:I

    return v1

    .line 38
    :pswitch_1e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->userId:Ljava/lang/String;

    return v1

    .line 39
    :pswitch_1f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->isTextBuzzExhausted:Z

    return v1

    .line 40
    :pswitch_20
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingVideoBuzz:I

    return v1

    .line 41
    :pswitch_21
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingMemojiBuzz:I

    return v1

    .line 42
    :pswitch_22
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 43
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->enabledBuzz:Ljava/util/List;

    return v1

    .line 44
    :pswitch_23
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->conversationId:Ljava/lang/String;

    return v1

    .line 45
    :pswitch_24
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzPairFailHintTimeout:I

    return v1

    .line 46
    :pswitch_25
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzRTCVendor:Ljava/lang/String;

    return v1

    .line 47
    :pswitch_26
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingProlongCount:I

    return v1

    .line 48
    :pswitch_27
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    move-result p0

    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->textBuzzToggle:Z

    return v1

    .line 49
    :pswitch_28
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 50
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->showedPassiveModeBuzz:Ljava/util/List;

    return v1

    .line 51
    :pswitch_29
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    move-result p0

    iput p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->totalDuration:I

    return v1

    .line 52
    :pswitch_2a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzRTCVendor:Ljava/lang/String;

    return v1

    nop

    :sswitch_data_0
    .sparse-switch
        -0x7af90a03 -> :sswitch_2a
        -0x7527f708 -> :sswitch_29
        -0x740df49f -> :sswitch_28
        -0x700762ec -> :sswitch_27
        -0x6b90f704 -> :sswitch_26
        -0x68d6ff45 -> :sswitch_25
        -0x667d92c3 -> :sswitch_24
        -0x63e72f02 -> :sswitch_23
        -0x54fa364c -> :sswitch_22
        -0x3b0412fe -> :sswitch_21
        -0x39f61368 -> :sswitch_20
        -0x36498e81 -> :sswitch_1f
        -0x31d4d1ba -> :sswitch_1e
        -0x2fbe4b27 -> :sswitch_1d
        -0x2295dd1e -> :sswitch_1c
        -0x1eafe508 -> :sswitch_1b
        -0x1d9aa7eb -> :sswitch_1a
        -0x19d964c8 -> :sswitch_19
        -0xf264927 -> :sswitch_18
        -0xa72e864 -> :sswitch_17
        -0x5bef420 -> :sswitch_16
        0x1a58d -> :sswitch_15
        0x1344f297 -> :sswitch_14
        0x14e3970c -> :sswitch_13
        0x18cd97d4 -> :sswitch_12
        0x1f8c6ea3 -> :sswitch_11
        0x321e8924 -> :sswitch_10
        0x3960b2a7 -> :sswitch_f
        0x39d985cf -> :sswitch_e
        0x3a08aa88 -> :sswitch_d
        0x420e07e2 -> :sswitch_c
        0x49e3535d -> :sswitch_b
        0x4c66bee2 -> :sswitch_a
        0x4f881f6e -> :sswitch_9
        0x5129cbc9 -> :sswitch_8
        0x58736296 -> :sswitch_7
        0x5c9cd564 -> :sswitch_6
        0x5c9e69b6 -> :sswitch_5
        0x612804e0 -> :sswitch_4
        0x6164e859 -> :sswitch_3
        0x67596aa5 -> :sswitch_2
        0x763c649a -> :sswitch_1
        0x770833f0 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
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

    .line 53
    check-cast p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/LoveBuzzData$2;->parseField(Lcom/p1/mobile/putong/core/data/LoveBuzzData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/core/data/LoveBuzzData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/LoveBuzzData;",
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
    const-string v0, "videoBuzzReactTimeout"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_0

    :cond_0
    const/16 v2, 0x2a

    goto/16 :goto_0

    :sswitch_1
    const-string v0, "rateLimited"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto/16 :goto_0

    :cond_1
    const/16 v2, 0x29

    goto/16 :goto_0

    :sswitch_2
    const-string v0, "videoBuzzConnectTimeout"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto/16 :goto_0

    :cond_2
    const/16 v2, 0x28

    goto/16 :goto_0

    :sswitch_3
    const-string v0, "potentialPremium"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    goto/16 :goto_0

    :cond_3
    const/16 v2, 0x27

    goto/16 :goto_0

    :sswitch_4
    const-string v0, "memojiBuzzToggle"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    goto/16 :goto_0

    :cond_4
    const/16 v2, 0x26

    goto/16 :goto_0

    :sswitch_5
    const-string v0, "remainingTextBuzz"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    goto/16 :goto_0

    :cond_5
    const/16 v2, 0x25

    goto/16 :goto_0

    :sswitch_6
    const-string v0, "voiceBuzzRTCVendor"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    goto/16 :goto_0

    :cond_6
    const/16 v2, 0x24

    goto/16 :goto_0

    :sswitch_7
    const-string v0, "memojiBuzzPairFailHintTimeout"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    goto/16 :goto_0

    :cond_7
    const/16 v2, 0x23

    goto/16 :goto_0

    :sswitch_8
    const-string v0, "remainingBonus"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    goto/16 :goto_0

    :cond_8
    const/16 v2, 0x22

    goto/16 :goto_0

    :sswitch_9
    const-string v0, "memojiBuzzReactTimeout"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    goto/16 :goto_0

    :cond_9
    const/16 v2, 0x21

    goto/16 :goto_0

    :sswitch_a
    const-string v0, "textBuzzPairFailHintTimeout"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    goto/16 :goto_0

    :cond_a
    const/16 v2, 0x20

    goto/16 :goto_0

    :sswitch_b
    const-string v0, "prolongDuration"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    goto/16 :goto_0

    :cond_b
    const/16 v2, 0x1f

    goto/16 :goto_0

    :sswitch_c
    const-string v0, "videoBuzzWaitingTimeout"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    goto/16 :goto_0

    :cond_c
    const/16 v2, 0x1e

    goto/16 :goto_0

    :sswitch_d
    const-string v0, "recommendResolution"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    goto/16 :goto_0

    :cond_d
    const/16 v2, 0x1d

    goto/16 :goto_0

    :sswitch_e
    const-string v0, "remainingVoiceBuzz"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    goto/16 :goto_0

    :cond_e
    const/16 v2, 0x1c

    goto/16 :goto_0

    :sswitch_f
    const-string v0, "voiceBuzzReactTimeout"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f

    goto/16 :goto_0

    :cond_f
    const/16 v2, 0x1b

    goto/16 :goto_0

    :sswitch_10
    const-string v0, "matched"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    goto/16 :goto_0

    :cond_10
    const/16 v2, 0x1a

    goto/16 :goto_0

    :sswitch_11
    const-string v0, "memojiBuzzConnectTimeout"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_11

    goto/16 :goto_0

    :cond_11
    const/16 v2, 0x19

    goto/16 :goto_0

    :sswitch_12
    const-string v0, "videoBuzzPairFailHintTimeout"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    goto/16 :goto_0

    :cond_12
    const/16 v2, 0x18

    goto/16 :goto_0

    :sswitch_13
    const-string v0, "bonusThreshold"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_13

    goto/16 :goto_0

    :cond_13
    const/16 v2, 0x17

    goto/16 :goto_0

    :sswitch_14
    const-string v0, "allowedMCCSwitchList"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    goto/16 :goto_0

    :cond_14
    const/16 v2, 0x16

    goto/16 :goto_0

    :sswitch_15
    const-string v0, "mcc"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_15

    goto/16 :goto_0

    :cond_15
    const/16 v2, 0x15

    goto/16 :goto_0

    :sswitch_16
    const-string v0, "memojiBuzzWaitingTimeout"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    goto/16 :goto_0

    :cond_16
    const/16 v2, 0x14

    goto/16 :goto_0

    :sswitch_17
    const-string v0, "voiceBuzzConnectTimeout"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_17

    goto/16 :goto_0

    :cond_17
    const/16 v2, 0x13

    goto/16 :goto_0

    :sswitch_18
    const-string v0, "voiceBuzzToggle"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    goto/16 :goto_0

    :cond_18
    const/16 v2, 0x12

    goto/16 :goto_0

    :sswitch_19
    const-string v0, "isTextBuzzBoosted"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_19

    goto/16 :goto_0

    :cond_19
    const/16 v2, 0x11

    goto/16 :goto_0

    :sswitch_1a
    const-string v0, "bonusEnabledBuzz"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1a

    goto/16 :goto_0

    :cond_1a
    const/16 v2, 0x10

    goto/16 :goto_0

    :sswitch_1b
    const-string v0, "isBoosted"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1b

    goto/16 :goto_0

    :cond_1b
    const/16 v2, 0xf

    goto/16 :goto_0

    :sswitch_1c
    const-string v0, "videoBuzzToggle"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    goto/16 :goto_0

    :cond_1c
    const/16 v2, 0xe

    goto/16 :goto_0

    :sswitch_1d
    const-string v0, "voiceBuzzWaitingTimeout"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1d

    goto/16 :goto_0

    :cond_1d
    const/16 v2, 0xd

    goto/16 :goto_0

    :sswitch_1e
    const-string v0, "userId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    goto/16 :goto_0

    :cond_1e
    const/16 v2, 0xc

    goto/16 :goto_0

    :sswitch_1f
    const-string v0, "isTextBuzzExhausted"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1f

    goto/16 :goto_0

    :cond_1f
    const/16 v2, 0xb

    goto/16 :goto_0

    :sswitch_20
    const-string v0, "remainingVideoBuzz"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    goto/16 :goto_0

    :cond_20
    const/16 v2, 0xa

    goto/16 :goto_0

    :sswitch_21
    const-string v0, "remainingMemojiBuzz"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_21

    goto/16 :goto_0

    :cond_21
    const/16 v2, 0x9

    goto/16 :goto_0

    :sswitch_22
    const-string v0, "enabledBuzz"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_22

    goto/16 :goto_0

    :cond_22
    const/16 v2, 0x8

    goto/16 :goto_0

    :sswitch_23
    const-string v0, "conversationId"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_23

    goto :goto_0

    :cond_23
    const/4 v2, 0x7

    goto :goto_0

    :sswitch_24
    const-string v0, "voiceBuzzPairFailHintTimeout"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_24

    goto :goto_0

    :cond_24
    const/4 v2, 0x6

    goto :goto_0

    :sswitch_25
    const-string v0, "videoBuzzRTCVendor"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_25

    goto :goto_0

    :cond_25
    const/4 v2, 0x5

    goto :goto_0

    :sswitch_26
    const-string v0, "remainingProlongCount"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_26

    goto :goto_0

    :cond_26
    const/4 v2, 0x4

    goto :goto_0

    :sswitch_27
    const-string v0, "textBuzzToggle"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_27

    goto :goto_0

    :cond_27
    const/4 v2, 0x3

    goto :goto_0

    :sswitch_28
    const-string v0, "showedPassiveModeBuzz"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_28

    goto :goto_0

    :cond_28
    const/4 v2, 0x2

    goto :goto_0

    :sswitch_29
    const-string v0, "totalDuration"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_29

    goto :goto_0

    :cond_29
    move v2, v1

    goto :goto_0

    :sswitch_2a
    const-string v0, "memojiBuzzRTCVendor"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2a

    goto :goto_0

    :cond_2a
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
        -0x7af90a03 -> :sswitch_2a
        -0x7527f708 -> :sswitch_29
        -0x740df49f -> :sswitch_28
        -0x700762ec -> :sswitch_27
        -0x6b90f704 -> :sswitch_26
        -0x68d6ff45 -> :sswitch_25
        -0x667d92c3 -> :sswitch_24
        -0x63e72f02 -> :sswitch_23
        -0x54fa364c -> :sswitch_22
        -0x3b0412fe -> :sswitch_21
        -0x39f61368 -> :sswitch_20
        -0x36498e81 -> :sswitch_1f
        -0x31d4d1ba -> :sswitch_1e
        -0x2fbe4b27 -> :sswitch_1d
        -0x2295dd1e -> :sswitch_1c
        -0x1eafe508 -> :sswitch_1b
        -0x1d9aa7eb -> :sswitch_1a
        -0x19d964c8 -> :sswitch_19
        -0xf264927 -> :sswitch_18
        -0xa72e864 -> :sswitch_17
        -0x5bef420 -> :sswitch_16
        0x1a58d -> :sswitch_15
        0x1344f297 -> :sswitch_14
        0x14e3970c -> :sswitch_13
        0x18cd97d4 -> :sswitch_12
        0x1f8c6ea3 -> :sswitch_11
        0x321e8924 -> :sswitch_10
        0x3960b2a7 -> :sswitch_f
        0x39d985cf -> :sswitch_e
        0x3a08aa88 -> :sswitch_d
        0x420e07e2 -> :sswitch_c
        0x49e3535d -> :sswitch_b
        0x4c66bee2 -> :sswitch_a
        0x4f881f6e -> :sswitch_9
        0x5129cbc9 -> :sswitch_8
        0x58736296 -> :sswitch_7
        0x5c9cd564 -> :sswitch_6
        0x5c9e69b6 -> :sswitch_5
        0x612804e0 -> :sswitch_4
        0x6164e859 -> :sswitch_3
        0x67596aa5 -> :sswitch_2
        0x763c649a -> :sswitch_1
        0x770833f0 -> :sswitch_0
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
    .end packed-switch
.end method

.method public bridge synthetic parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0

    .line 3
    check-cast p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/LoveBuzzData$2;->parseFieldCheck(Lcom/p1/mobile/putong/core/data/LoveBuzzData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/core/data/LoveBuzzData;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->userId:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "userId"

    .line 6
    .line 7
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    const-string p0, "mcc"

    .line 11
    .line 12
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->mcc:I

    .line 13
    .line 14
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 15
    .line 16
    .line 17
    const-string p0, "textBuzzToggle"

    .line 18
    .line 19
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->textBuzzToggle:Z

    .line 20
    .line 21
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->conversationId:Ljava/lang/String;

    .line 25
    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    const-string v0, "conversationId"

    .line 29
    .line 30
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    const-string p0, "isTextBuzzExhausted"

    .line 34
    .line 35
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->isTextBuzzExhausted:Z

    .line 36
    .line 37
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 38
    .line 39
    .line 40
    const-string p0, "isBoosted"

    .line 41
    .line 42
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->isBoosted:Z

    .line 43
    .line 44
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 45
    .line 46
    .line 47
    const-string p0, "remainingVoiceBuzz"

    .line 48
    .line 49
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingVoiceBuzz:I

    .line 50
    .line 51
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 52
    .line 53
    .line 54
    const-string p0, "remainingProlongCount"

    .line 55
    .line 56
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingProlongCount:I

    .line 57
    .line 58
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 59
    .line 60
    .line 61
    const-string p0, "matched"

    .line 62
    .line 63
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->matched:Z

    .line 64
    .line 65
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 66
    .line 67
    .line 68
    const-string p0, "totalDuration"

    .line 69
    .line 70
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->totalDuration:I

    .line 71
    .line 72
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 73
    .line 74
    .line 75
    const-string p0, "prolongDuration"

    .line 76
    .line 77
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->prolongDuration:I

    .line 78
    .line 79
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzRTCVendor:Ljava/lang/String;

    .line 83
    .line 84
    if-eqz p0, :cond_2

    .line 85
    .line 86
    const-string v0, "voiceBuzzRTCVendor"

    .line 87
    .line 88
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    :cond_2
    const-string p0, "isTextBuzzBoosted"

    .line 92
    .line 93
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->isTextBuzzBoosted:Z

    .line 94
    .line 95
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 96
    .line 97
    .line 98
    const-string p0, "remainingVideoBuzz"

    .line 99
    .line 100
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingVideoBuzz:I

    .line 101
    .line 102
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 103
    .line 104
    .line 105
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzRTCVendor:Ljava/lang/String;

    .line 106
    .line 107
    if-eqz p0, :cond_3

    .line 108
    .line 109
    const-string v0, "videoBuzzRTCVendor"

    .line 110
    .line 111
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->enabledBuzz:Ljava/util/List;

    .line 115
    .line 116
    if-eqz p0, :cond_4

    .line 117
    .line 118
    const-string p0, "enabledBuzz"

    .line 119
    .line 120
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->enabledBuzz:Ljava/util/List;

    .line 124
    .line 125
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 126
    .line 127
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 128
    .line 129
    .line 130
    :cond_4
    const-string p0, "remainingTextBuzz"

    .line 131
    .line 132
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingTextBuzz:I

    .line 133
    .line 134
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 135
    .line 136
    .line 137
    const-string p0, "textBuzzPairFailHintTimeout"

    .line 138
    .line 139
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->textBuzzPairFailHintTimeout:I

    .line 140
    .line 141
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 142
    .line 143
    .line 144
    const-string p0, "voiceBuzzPairFailHintTimeout"

    .line 145
    .line 146
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzPairFailHintTimeout:I

    .line 147
    .line 148
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 149
    .line 150
    .line 151
    const-string p0, "videoBuzzPairFailHintTimeout"

    .line 152
    .line 153
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzPairFailHintTimeout:I

    .line 154
    .line 155
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 156
    .line 157
    .line 158
    const-string p0, "voiceBuzzToggle"

    .line 159
    .line 160
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzToggle:Z

    .line 161
    .line 162
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 163
    .line 164
    .line 165
    const-string p0, "videoBuzzToggle"

    .line 166
    .line 167
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzToggle:Z

    .line 168
    .line 169
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 170
    .line 171
    .line 172
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->showedPassiveModeBuzz:Ljava/util/List;

    .line 173
    .line 174
    if-eqz p0, :cond_5

    .line 175
    .line 176
    const-string p0, "showedPassiveModeBuzz"

    .line 177
    .line 178
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->showedPassiveModeBuzz:Ljava/util/List;

    .line 182
    .line 183
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 184
    .line 185
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 186
    .line 187
    .line 188
    :cond_5
    const-string p0, "voiceBuzzConnectTimeout"

    .line 189
    .line 190
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzConnectTimeout:I

    .line 191
    .line 192
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 193
    .line 194
    .line 195
    const-string p0, "videoBuzzConnectTimeout"

    .line 196
    .line 197
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzConnectTimeout:I

    .line 198
    .line 199
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 200
    .line 201
    .line 202
    const-string p0, "voiceBuzzReactTimeout"

    .line 203
    .line 204
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzReactTimeout:I

    .line 205
    .line 206
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 207
    .line 208
    .line 209
    const-string p0, "videoBuzzReactTimeout"

    .line 210
    .line 211
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzReactTimeout:I

    .line 212
    .line 213
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 214
    .line 215
    .line 216
    const-string p0, "voiceBuzzWaitingTimeout"

    .line 217
    .line 218
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzWaitingTimeout:I

    .line 219
    .line 220
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 221
    .line 222
    .line 223
    const-string p0, "videoBuzzWaitingTimeout"

    .line 224
    .line 225
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzWaitingTimeout:I

    .line 226
    .line 227
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 228
    .line 229
    .line 230
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingBonus:Lcom/p1/mobile/putong/core/data/RemainingBonus;

    .line 231
    .line 232
    const/4 v0, 0x1

    .line 233
    if-eqz p0, :cond_6

    .line 234
    .line 235
    const-string p0, "remainingBonus"

    .line 236
    .line 237
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 238
    .line 239
    .line 240
    sget-object p0, Lcom/p1/mobile/putong/core/data/RemainingBonus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 241
    .line 242
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingBonus:Lcom/p1/mobile/putong/core/data/RemainingBonus;

    .line 243
    .line 244
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 245
    .line 246
    .line 247
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->rateLimited:Lcom/p1/mobile/putong/core/data/RateLimited;

    .line 248
    .line 249
    if-eqz p0, :cond_7

    .line 250
    .line 251
    const-string p0, "rateLimited"

    .line 252
    .line 253
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    sget-object p0, Lcom/p1/mobile/putong/core/data/RateLimited;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 257
    .line 258
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->rateLimited:Lcom/p1/mobile/putong/core/data/RateLimited;

    .line 259
    .line 260
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 261
    .line 262
    .line 263
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusThreshold:Lcom/p1/mobile/putong/core/data/BonusThreshold;

    .line 264
    .line 265
    if-eqz p0, :cond_8

    .line 266
    .line 267
    const-string p0, "bonusThreshold"

    .line 268
    .line 269
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 270
    .line 271
    .line 272
    sget-object p0, Lcom/p1/mobile/putong/core/data/BonusThreshold;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 273
    .line 274
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusThreshold:Lcom/p1/mobile/putong/core/data/BonusThreshold;

    .line 275
    .line 276
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 277
    .line 278
    .line 279
    :cond_8
    const-string p0, "memojiBuzzToggle"

    .line 280
    .line 281
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzToggle:Z

    .line 282
    .line 283
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 284
    .line 285
    .line 286
    const-string p0, "memojiBuzzConnectTimeout"

    .line 287
    .line 288
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzConnectTimeout:I

    .line 289
    .line 290
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 291
    .line 292
    .line 293
    const-string p0, "memojiBuzzPairFailHintTimeout"

    .line 294
    .line 295
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzPairFailHintTimeout:I

    .line 296
    .line 297
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 298
    .line 299
    .line 300
    const-string p0, "memojiBuzzReactTimeout"

    .line 301
    .line 302
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzReactTimeout:I

    .line 303
    .line 304
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 305
    .line 306
    .line 307
    const-string p0, "memojiBuzzWaitingTimeout"

    .line 308
    .line 309
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzWaitingTimeout:I

    .line 310
    .line 311
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 312
    .line 313
    .line 314
    const-string p0, "remainingMemojiBuzz"

    .line 315
    .line 316
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingMemojiBuzz:I

    .line 317
    .line 318
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 319
    .line 320
    .line 321
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzRTCVendor:Ljava/lang/String;

    .line 322
    .line 323
    if-eqz p0, :cond_9

    .line 324
    .line 325
    const-string v1, "memojiBuzzRTCVendor"

    .line 326
    .line 327
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 328
    .line 329
    .line 330
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->allowedMCCSwitchList:Ljava/util/List;

    .line 331
    .line 332
    if-eqz p0, :cond_a

    .line 333
    .line 334
    const-string p0, "allowedMCCSwitchList"

    .line 335
    .line 336
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 337
    .line 338
    .line 339
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->allowedMCCSwitchList:Ljava/util/List;

    .line 340
    .line 341
    sget-object v1, Lcom/tantanapp/common/data/JsonAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 342
    .line 343
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 344
    .line 345
    .line 346
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->recommendResolution:Lcom/p1/mobile/putong/core/data/BuzzResolution;

    .line 347
    .line 348
    if-eqz p0, :cond_b

    .line 349
    .line 350
    const-string p0, "recommendResolution"

    .line 351
    .line 352
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 353
    .line 354
    .line 355
    sget-object p0, Lcom/p1/mobile/putong/core/data/BuzzResolution;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 356
    .line 357
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->recommendResolution:Lcom/p1/mobile/putong/core/data/BuzzResolution;

    .line 358
    .line 359
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 360
    .line 361
    .line 362
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusEnabledBuzz:Ljava/util/List;

    .line 363
    .line 364
    if-eqz p0, :cond_c

    .line 365
    .line 366
    const-string p0, "bonusEnabledBuzz"

    .line 367
    .line 368
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 369
    .line 370
    .line 371
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusEnabledBuzz:Ljava/util/List;

    .line 372
    .line 373
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 374
    .line 375
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 376
    .line 377
    .line 378
    :cond_c
    const-string p0, "potentialPremium"

    .line 379
    .line 380
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->potentialPremium:Z

    .line 381
    .line 382
    invoke-virtual {p2, p0, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 383
    .line 384
    .line 385
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 386
    check-cast p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/LoveBuzzData$2;->serializeFields(Lcom/p1/mobile/putong/core/data/LoveBuzzData;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
