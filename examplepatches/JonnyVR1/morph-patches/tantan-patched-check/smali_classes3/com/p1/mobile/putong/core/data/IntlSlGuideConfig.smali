.class public Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;
.super Lcom/tantanapp/common/data/ValueObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "intlslguideconfig"


# instance fields
.field public intl_card_user_last_active_limit_time:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public intl_pop_0_20_men:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public intl_pop_0_20_women:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public intl_pop_0_30_men:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public intl_pop_0_30_women:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public intl_sl_card_guide_dlg_men:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public intl_sl_card_guide_dlg_women:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->clone()Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_sl_card_guide_dlg_men:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_sl_card_guide_dlg_men:I

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_sl_card_guide_dlg_women:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_sl_card_guide_dlg_women:I

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_20_men:F

    .line 15
    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_20_men:F

    .line 17
    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_20_women:F

    .line 19
    .line 20
    iput v1, v0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_20_women:F

    .line 21
    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_30_men:F

    .line 23
    .line 24
    iput v1, v0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_30_men:F

    .line 25
    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_30_women:F

    .line 27
    .line 28
    iput v1, v0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_30_women:F

    .line 29
    .line 30
    iget p0, p0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_card_user_last_active_limit_time:I

    .line 31
    .line 32
    iput p0, v0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_card_user_last_active_limit_time:I

    .line 33
    .line 34
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->clone()Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_sl_card_guide_dlg_men:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_sl_card_guide_dlg_men:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_sl_card_guide_dlg_women:I

    .line 20
    .line 21
    iget v3, p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_sl_card_guide_dlg_women:I

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_20_men:F

    .line 26
    .line 27
    iget v3, p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_20_men:F

    .line 28
    .line 29
    cmpl-float v1, v1, v3

    .line 30
    .line 31
    if-nez v1, :cond_2

    .line 32
    .line 33
    iget v1, p0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_20_women:F

    .line 34
    .line 35
    iget v3, p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_20_women:F

    .line 36
    .line 37
    cmpl-float v1, v1, v3

    .line 38
    .line 39
    if-nez v1, :cond_2

    .line 40
    .line 41
    iget v1, p0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_30_men:F

    .line 42
    .line 43
    iget v3, p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_30_men:F

    .line 44
    .line 45
    cmpl-float v1, v1, v3

    .line 46
    .line 47
    if-nez v1, :cond_2

    .line 48
    .line 49
    iget v1, p0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_30_women:F

    .line 50
    .line 51
    iget v3, p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_30_women:F

    .line 52
    .line 53
    cmpl-float v1, v1, v3

    .line 54
    .line 55
    if-nez v1, :cond_2

    .line 56
    .line 57
    iget p0, p0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_card_user_last_active_limit_time:I

    .line 58
    .line 59
    iget p1, p1, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_card_user_last_active_limit_time:I

    .line 60
    .line 61
    if-ne p0, p1, :cond_2

    .line 62
    .line 63
    return v0

    .line 64
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "intlslguideconfig"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_sl_card_guide_dlg_men:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget v1, p0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_sl_card_guide_dlg_women:I

    .line 13
    .line 14
    add-int/2addr v0, v1

    .line 15
    mul-int/lit8 v0, v0, 0x29

    .line 16
    .line 17
    iget v1, p0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_20_men:F

    .line 18
    .line 19
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    add-int/2addr v0, v1

    .line 24
    mul-int/lit8 v0, v0, 0x29

    .line 25
    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_20_women:F

    .line 27
    .line 28
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    add-int/2addr v0, v1

    .line 33
    mul-int/lit8 v0, v0, 0x29

    .line 34
    .line 35
    iget v1, p0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_30_men:F

    .line 36
    .line 37
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    add-int/2addr v0, v1

    .line 42
    mul-int/lit8 v0, v0, 0x29

    .line 43
    .line 44
    iget v1, p0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_pop_0_30_women:F

    .line 45
    .line 46
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    add-int/2addr v0, v1

    .line 51
    mul-int/lit8 v0, v0, 0x29

    .line 52
    .line 53
    iget v1, p0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->intl_card_user_last_active_limit_time:I

    .line 54
    .line 55
    add-int/2addr v0, v1

    .line 56
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 57
    .line 58
    :cond_0
    return v0
.end method

.method public nullCheck()V
    .locals 0

    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/IntlSlGuideConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
