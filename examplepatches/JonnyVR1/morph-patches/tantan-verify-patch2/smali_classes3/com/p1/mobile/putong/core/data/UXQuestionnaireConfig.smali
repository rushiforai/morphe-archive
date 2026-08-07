.class public Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;
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
            "Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "uxquestionnaireconfig"


# instance fields
.field public ux_questionnaire_card_interval_day:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public ux_questionnaire_card_max_time_1:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public ux_questionnaire_card_max_time_2:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public ux_questionnaire_card_register_day_1:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public ux_questionnaire_card_register_day_2:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public ux_questionnaire_card_swipe_count_1:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public ux_questionnaire_card_swipe_count_2:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public ux_questionnaire_enable:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public ux_questionnaire_last_msg_day:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public ux_questionnaire_msg_detail_interval_day:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public ux_questionnaire_msg_detail_max_time:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public ux_questionnaire_msg_detail_mm_max:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public ux_questionnaire_msg_detail_mm_min:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public ux_questionnaire_msg_detail_register_day:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public ux_questionnaire_msg_list_interval_day:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public ux_questionnaire_msg_list_max_time:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public ux_questionnaire_msg_list_register_day:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->nullCheck()V

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

    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->clone()Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_enable:Z

    .line 7
    .line 8
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_enable:Z

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_swipe_count_1:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_swipe_count_1:I

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_register_day_1:I

    .line 15
    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_register_day_1:I

    .line 17
    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_max_time_1:I

    .line 19
    .line 20
    iput v1, v0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_max_time_1:I

    .line 21
    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_interval_day:I

    .line 23
    .line 24
    iput v1, v0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_interval_day:I

    .line 25
    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_swipe_count_2:I

    .line 27
    .line 28
    iput v1, v0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_swipe_count_2:I

    .line 29
    .line 30
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_register_day_2:I

    .line 31
    .line 32
    iput v1, v0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_register_day_2:I

    .line 33
    .line 34
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_max_time_2:I

    .line 35
    .line 36
    iput v1, v0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_max_time_2:I

    .line 37
    .line 38
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_list_interval_day:I

    .line 39
    .line 40
    iput v1, v0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_list_interval_day:I

    .line 41
    .line 42
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_list_register_day:I

    .line 43
    .line 44
    iput v1, v0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_list_register_day:I

    .line 45
    .line 46
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_list_max_time:I

    .line 47
    .line 48
    iput v1, v0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_list_max_time:I

    .line 49
    .line 50
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_last_msg_day:I

    .line 51
    .line 52
    iput v1, v0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_last_msg_day:I

    .line 53
    .line 54
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_interval_day:I

    .line 55
    .line 56
    iput v1, v0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_interval_day:I

    .line 57
    .line 58
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_register_day:I

    .line 59
    .line 60
    iput v1, v0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_register_day:I

    .line 61
    .line 62
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_max_time:I

    .line 63
    .line 64
    iput v1, v0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_max_time:I

    .line 65
    .line 66
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_mm_min:I

    .line 67
    .line 68
    iput v1, v0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_mm_min:I

    .line 69
    .line 70
    iget p0, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_mm_max:I

    .line 71
    .line 72
    iput p0, v0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_mm_max:I

    .line 73
    .line 74
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->clone()Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_enable:Z

    .line 14
    .line 15
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_enable:Z

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_swipe_count_1:I

    .line 20
    .line 21
    iget v3, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_swipe_count_1:I

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_register_day_1:I

    .line 26
    .line 27
    iget v3, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_register_day_1:I

    .line 28
    .line 29
    if-ne v1, v3, :cond_2

    .line 30
    .line 31
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_max_time_1:I

    .line 32
    .line 33
    iget v3, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_max_time_1:I

    .line 34
    .line 35
    if-ne v1, v3, :cond_2

    .line 36
    .line 37
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_interval_day:I

    .line 38
    .line 39
    iget v3, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_interval_day:I

    .line 40
    .line 41
    if-ne v1, v3, :cond_2

    .line 42
    .line 43
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_swipe_count_2:I

    .line 44
    .line 45
    iget v3, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_swipe_count_2:I

    .line 46
    .line 47
    if-ne v1, v3, :cond_2

    .line 48
    .line 49
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_register_day_2:I

    .line 50
    .line 51
    iget v3, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_register_day_2:I

    .line 52
    .line 53
    if-ne v1, v3, :cond_2

    .line 54
    .line 55
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_max_time_2:I

    .line 56
    .line 57
    iget v3, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_max_time_2:I

    .line 58
    .line 59
    if-ne v1, v3, :cond_2

    .line 60
    .line 61
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_list_interval_day:I

    .line 62
    .line 63
    iget v3, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_list_interval_day:I

    .line 64
    .line 65
    if-ne v1, v3, :cond_2

    .line 66
    .line 67
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_list_register_day:I

    .line 68
    .line 69
    iget v3, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_list_register_day:I

    .line 70
    .line 71
    if-ne v1, v3, :cond_2

    .line 72
    .line 73
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_list_max_time:I

    .line 74
    .line 75
    iget v3, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_list_max_time:I

    .line 76
    .line 77
    if-ne v1, v3, :cond_2

    .line 78
    .line 79
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_last_msg_day:I

    .line 80
    .line 81
    iget v3, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_last_msg_day:I

    .line 82
    .line 83
    if-ne v1, v3, :cond_2

    .line 84
    .line 85
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_interval_day:I

    .line 86
    .line 87
    iget v3, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_interval_day:I

    .line 88
    .line 89
    if-ne v1, v3, :cond_2

    .line 90
    .line 91
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_register_day:I

    .line 92
    .line 93
    iget v3, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_register_day:I

    .line 94
    .line 95
    if-ne v1, v3, :cond_2

    .line 96
    .line 97
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_max_time:I

    .line 98
    .line 99
    iget v3, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_max_time:I

    .line 100
    .line 101
    if-ne v1, v3, :cond_2

    .line 102
    .line 103
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_mm_min:I

    .line 104
    .line 105
    iget v3, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_mm_min:I

    .line 106
    .line 107
    if-ne v1, v3, :cond_2

    .line 108
    .line 109
    iget p0, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_mm_max:I

    .line 110
    .line 111
    iget p1, p1, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_mm_max:I

    .line 112
    .line 113
    if-ne p0, p1, :cond_2

    .line 114
    .line 115
    return v0

    .line 116
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "uxquestionnaireconfig"

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
    if-nez v0, :cond_1

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_enable:Z

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const/16 v1, 0x4cf

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/16 v1, 0x4d5

    .line 15
    .line 16
    :goto_0
    add-int/2addr v0, v1

    .line 17
    mul-int/lit8 v0, v0, 0x29

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_swipe_count_1:I

    .line 20
    .line 21
    add-int/2addr v0, v1

    .line 22
    mul-int/lit8 v0, v0, 0x29

    .line 23
    .line 24
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_register_day_1:I

    .line 25
    .line 26
    add-int/2addr v0, v1

    .line 27
    mul-int/lit8 v0, v0, 0x29

    .line 28
    .line 29
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_max_time_1:I

    .line 30
    .line 31
    add-int/2addr v0, v1

    .line 32
    mul-int/lit8 v0, v0, 0x29

    .line 33
    .line 34
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_interval_day:I

    .line 35
    .line 36
    add-int/2addr v0, v1

    .line 37
    mul-int/lit8 v0, v0, 0x29

    .line 38
    .line 39
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_swipe_count_2:I

    .line 40
    .line 41
    add-int/2addr v0, v1

    .line 42
    mul-int/lit8 v0, v0, 0x29

    .line 43
    .line 44
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_register_day_2:I

    .line 45
    .line 46
    add-int/2addr v0, v1

    .line 47
    mul-int/lit8 v0, v0, 0x29

    .line 48
    .line 49
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_card_max_time_2:I

    .line 50
    .line 51
    add-int/2addr v0, v1

    .line 52
    mul-int/lit8 v0, v0, 0x29

    .line 53
    .line 54
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_list_interval_day:I

    .line 55
    .line 56
    add-int/2addr v0, v1

    .line 57
    mul-int/lit8 v0, v0, 0x29

    .line 58
    .line 59
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_list_register_day:I

    .line 60
    .line 61
    add-int/2addr v0, v1

    .line 62
    mul-int/lit8 v0, v0, 0x29

    .line 63
    .line 64
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_list_max_time:I

    .line 65
    .line 66
    add-int/2addr v0, v1

    .line 67
    mul-int/lit8 v0, v0, 0x29

    .line 68
    .line 69
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_last_msg_day:I

    .line 70
    .line 71
    add-int/2addr v0, v1

    .line 72
    mul-int/lit8 v0, v0, 0x29

    .line 73
    .line 74
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_interval_day:I

    .line 75
    .line 76
    add-int/2addr v0, v1

    .line 77
    mul-int/lit8 v0, v0, 0x29

    .line 78
    .line 79
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_register_day:I

    .line 80
    .line 81
    add-int/2addr v0, v1

    .line 82
    mul-int/lit8 v0, v0, 0x29

    .line 83
    .line 84
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_max_time:I

    .line 85
    .line 86
    add-int/2addr v0, v1

    .line 87
    mul-int/lit8 v0, v0, 0x29

    .line 88
    .line 89
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_mm_min:I

    .line 90
    .line 91
    add-int/2addr v0, v1

    .line 92
    mul-int/lit8 v0, v0, 0x29

    .line 93
    .line 94
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->ux_questionnaire_msg_detail_mm_max:I

    .line 95
    .line 96
    add-int/2addr v0, v1

    .line 97
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 98
    .line 99
    :cond_1
    return v0
.end method

.method public nullCheck()V
    .locals 0

    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/UXQuestionnaireConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
