.class public Lcom/p1/mobile/putong/core/data/CardSwipeConfig;
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
            "Lcom/p1/mobile/putong/core/data/CardSwipeConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/CardSwipeConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "cardswipeconfig"


# instance fields
.field public config_version:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x27
    .end annotation
.end field

.field public could_double_click:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x21
    .end annotation
.end field

.field public female_swipe_auto_factor:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1e
    .end annotation
.end field

.field public female_swipe_auto_rotate:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x20
    .end annotation
.end field

.field public female_swipe_auto_width:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1c
    .end annotation
.end field

.field public male_swipe_auto_factor:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1d
    .end annotation
.end field

.field public male_swipe_auto_rotate:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1f
    .end annotation
.end field

.field public male_swipe_auto_width:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1b
    .end annotation
.end field

.field public scale_alpha_opt:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2b
    .end annotation
.end field

.field public scale_alpha_speed:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2c
    .end annotation
.end field

.field public scale_opt:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x28
    .end annotation
.end field

.field public scale_opt_during:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x29
    .end annotation
.end field

.field public scale_use_opt_during:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2a
    .end annotation
.end field

.field public swipe_auto_female_during:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public swipe_auto_male_during:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public swipe_back_female_during:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public swipe_back_male_during:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public swipe_fix_speed:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x23
    .end annotation
.end field

.field public swipe_item_diff_female:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x18
    .end annotation
.end field

.field public swipe_item_diff_male:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public swipe_left_female_during:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public swipe_left_male_during:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public swipe_mine_value_female:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1a
    .end annotation
.end field

.field public swipe_mine_value_male:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field public swipe_out_value_female:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x19
    .end annotation
.end field

.field public swipe_out_value_male:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public swipe_progress_value:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x26
    .end annotation
.end field

.field public swipe_reset_female_during:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public swipe_reset_male_during:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public swipe_right_female_during:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public swipe_right_male_during:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public swipe_rotation_female:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public swipe_rotation_male:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public swipe_scale:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x24
    .end annotation
.end field

.field public swipe_scale_start_alpha:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x25
    .end annotation
.end field

.field public swipe_speed_check_female:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public swipe_speed_check_male:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public swipe_speed_factor_female:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public swipe_speed_factor_male:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public swipe_trans_y_female:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public swipe_trans_y_male:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public swipe_type_factor:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x22
    .end annotation
.end field

.field public swipe_up_female_during:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public swipe_up_male_during:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CardSwipeConfig$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CardSwipeConfig$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/CardSwipeConfig;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->nullCheck()V

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

    .line 184
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->clone()Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/CardSwipeConfig;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_left_male_during:J

    .line 7
    .line 8
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_left_male_during:J

    .line 9
    .line 10
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_right_male_during:J

    .line 11
    .line 12
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_right_male_during:J

    .line 13
    .line 14
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_up_male_during:J

    .line 15
    .line 16
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_up_male_during:J

    .line 17
    .line 18
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_auto_male_during:J

    .line 19
    .line 20
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_auto_male_during:J

    .line 21
    .line 22
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_back_male_during:J

    .line 23
    .line 24
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_back_male_during:J

    .line 25
    .line 26
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_reset_male_during:J

    .line 27
    .line 28
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_reset_male_during:J

    .line 29
    .line 30
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_rotation_male:D

    .line 31
    .line 32
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_rotation_male:D

    .line 33
    .line 34
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_trans_y_male:J

    .line 35
    .line 36
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_trans_y_male:J

    .line 37
    .line 38
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_factor_male:D

    .line 39
    .line 40
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_factor_male:D

    .line 41
    .line 42
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_check_male:D

    .line 43
    .line 44
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_check_male:D

    .line 45
    .line 46
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_left_female_during:J

    .line 47
    .line 48
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_left_female_during:J

    .line 49
    .line 50
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_right_female_during:J

    .line 51
    .line 52
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_right_female_during:J

    .line 53
    .line 54
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_up_female_during:J

    .line 55
    .line 56
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_up_female_during:J

    .line 57
    .line 58
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_auto_female_during:J

    .line 59
    .line 60
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_auto_female_during:J

    .line 61
    .line 62
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_back_female_during:J

    .line 63
    .line 64
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_back_female_during:J

    .line 65
    .line 66
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_reset_female_during:J

    .line 67
    .line 68
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_reset_female_during:J

    .line 69
    .line 70
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_rotation_female:D

    .line 71
    .line 72
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_rotation_female:D

    .line 73
    .line 74
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_trans_y_female:J

    .line 75
    .line 76
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_trans_y_female:J

    .line 77
    .line 78
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_factor_female:D

    .line 79
    .line 80
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_factor_female:D

    .line 81
    .line 82
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_check_female:D

    .line 83
    .line 84
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_check_female:D

    .line 85
    .line 86
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_item_diff_male:I

    .line 87
    .line 88
    iput v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_item_diff_male:I

    .line 89
    .line 90
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_out_value_male:I

    .line 91
    .line 92
    iput v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_out_value_male:I

    .line 93
    .line 94
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_mine_value_male:I

    .line 95
    .line 96
    iput v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_mine_value_male:I

    .line 97
    .line 98
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_item_diff_female:I

    .line 99
    .line 100
    iput v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_item_diff_female:I

    .line 101
    .line 102
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_out_value_female:I

    .line 103
    .line 104
    iput v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_out_value_female:I

    .line 105
    .line 106
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_mine_value_female:I

    .line 107
    .line 108
    iput v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_mine_value_female:I

    .line 109
    .line 110
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_width:D

    .line 111
    .line 112
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_width:D

    .line 113
    .line 114
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_width:D

    .line 115
    .line 116
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_width:D

    .line 117
    .line 118
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_factor:D

    .line 119
    .line 120
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_factor:D

    .line 121
    .line 122
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_factor:D

    .line 123
    .line 124
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_factor:D

    .line 125
    .line 126
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_rotate:D

    .line 127
    .line 128
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_rotate:D

    .line 129
    .line 130
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_rotate:D

    .line 131
    .line 132
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_rotate:D

    .line 133
    .line 134
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->could_double_click:Z

    .line 135
    .line 136
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->could_double_click:Z

    .line 137
    .line 138
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_type_factor:D

    .line 139
    .line 140
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_type_factor:D

    .line 141
    .line 142
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_fix_speed:I

    .line 143
    .line 144
    iput v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_fix_speed:I

    .line 145
    .line 146
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_scale:D

    .line 147
    .line 148
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_scale:D

    .line 149
    .line 150
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_scale_start_alpha:D

    .line 151
    .line 152
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_scale_start_alpha:D

    .line 153
    .line 154
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_progress_value:I

    .line 155
    .line 156
    iput v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_progress_value:I

    .line 157
    .line 158
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->config_version:I

    .line 159
    .line 160
    iput v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->config_version:I

    .line 161
    .line 162
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_opt:Z

    .line 163
    .line 164
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_opt:Z

    .line 165
    .line 166
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_opt_during:J

    .line 167
    .line 168
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_opt_during:J

    .line 169
    .line 170
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_use_opt_during:Z

    .line 171
    .line 172
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_use_opt_during:Z

    .line 173
    .line 174
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_alpha_opt:Z

    .line 175
    .line 176
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_alpha_opt:Z

    .line 177
    .line 178
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_alpha_speed:D

    .line 179
    .line 180
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_alpha_speed:D

    .line 181
    .line 182
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 183
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->clone()Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;

    .line 12
    .line 13
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_left_male_during:J

    .line 14
    .line 15
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_left_male_during:J

    .line 16
    .line 17
    cmp-long v1, v3, v5

    .line 18
    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_right_male_during:J

    .line 22
    .line 23
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_right_male_during:J

    .line 24
    .line 25
    cmp-long v1, v3, v5

    .line 26
    .line 27
    if-nez v1, :cond_2

    .line 28
    .line 29
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_up_male_during:J

    .line 30
    .line 31
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_up_male_during:J

    .line 32
    .line 33
    cmp-long v1, v3, v5

    .line 34
    .line 35
    if-nez v1, :cond_2

    .line 36
    .line 37
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_auto_male_during:J

    .line 38
    .line 39
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_auto_male_during:J

    .line 40
    .line 41
    cmp-long v1, v3, v5

    .line 42
    .line 43
    if-nez v1, :cond_2

    .line 44
    .line 45
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_back_male_during:J

    .line 46
    .line 47
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_back_male_during:J

    .line 48
    .line 49
    cmp-long v1, v3, v5

    .line 50
    .line 51
    if-nez v1, :cond_2

    .line 52
    .line 53
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_reset_male_during:J

    .line 54
    .line 55
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_reset_male_during:J

    .line 56
    .line 57
    cmp-long v1, v3, v5

    .line 58
    .line 59
    if-nez v1, :cond_2

    .line 60
    .line 61
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_rotation_male:D

    .line 62
    .line 63
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_rotation_male:D

    .line 64
    .line 65
    cmpl-double v1, v3, v5

    .line 66
    .line 67
    if-nez v1, :cond_2

    .line 68
    .line 69
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_trans_y_male:J

    .line 70
    .line 71
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_trans_y_male:J

    .line 72
    .line 73
    cmp-long v1, v3, v5

    .line 74
    .line 75
    if-nez v1, :cond_2

    .line 76
    .line 77
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_factor_male:D

    .line 78
    .line 79
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_factor_male:D

    .line 80
    .line 81
    cmpl-double v1, v3, v5

    .line 82
    .line 83
    if-nez v1, :cond_2

    .line 84
    .line 85
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_check_male:D

    .line 86
    .line 87
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_check_male:D

    .line 88
    .line 89
    cmpl-double v1, v3, v5

    .line 90
    .line 91
    if-nez v1, :cond_2

    .line 92
    .line 93
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_left_female_during:J

    .line 94
    .line 95
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_left_female_during:J

    .line 96
    .line 97
    cmp-long v1, v3, v5

    .line 98
    .line 99
    if-nez v1, :cond_2

    .line 100
    .line 101
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_right_female_during:J

    .line 102
    .line 103
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_right_female_during:J

    .line 104
    .line 105
    cmp-long v1, v3, v5

    .line 106
    .line 107
    if-nez v1, :cond_2

    .line 108
    .line 109
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_up_female_during:J

    .line 110
    .line 111
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_up_female_during:J

    .line 112
    .line 113
    cmp-long v1, v3, v5

    .line 114
    .line 115
    if-nez v1, :cond_2

    .line 116
    .line 117
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_auto_female_during:J

    .line 118
    .line 119
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_auto_female_during:J

    .line 120
    .line 121
    cmp-long v1, v3, v5

    .line 122
    .line 123
    if-nez v1, :cond_2

    .line 124
    .line 125
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_back_female_during:J

    .line 126
    .line 127
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_back_female_during:J

    .line 128
    .line 129
    cmp-long v1, v3, v5

    .line 130
    .line 131
    if-nez v1, :cond_2

    .line 132
    .line 133
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_reset_female_during:J

    .line 134
    .line 135
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_reset_female_during:J

    .line 136
    .line 137
    cmp-long v1, v3, v5

    .line 138
    .line 139
    if-nez v1, :cond_2

    .line 140
    .line 141
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_rotation_female:D

    .line 142
    .line 143
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_rotation_female:D

    .line 144
    .line 145
    cmpl-double v1, v3, v5

    .line 146
    .line 147
    if-nez v1, :cond_2

    .line 148
    .line 149
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_trans_y_female:J

    .line 150
    .line 151
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_trans_y_female:J

    .line 152
    .line 153
    cmp-long v1, v3, v5

    .line 154
    .line 155
    if-nez v1, :cond_2

    .line 156
    .line 157
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_factor_female:D

    .line 158
    .line 159
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_factor_female:D

    .line 160
    .line 161
    cmpl-double v1, v3, v5

    .line 162
    .line 163
    if-nez v1, :cond_2

    .line 164
    .line 165
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_check_female:D

    .line 166
    .line 167
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_check_female:D

    .line 168
    .line 169
    cmpl-double v1, v3, v5

    .line 170
    .line 171
    if-nez v1, :cond_2

    .line 172
    .line 173
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_item_diff_male:I

    .line 174
    .line 175
    iget v3, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_item_diff_male:I

    .line 176
    .line 177
    if-ne v1, v3, :cond_2

    .line 178
    .line 179
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_out_value_male:I

    .line 180
    .line 181
    iget v3, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_out_value_male:I

    .line 182
    .line 183
    if-ne v1, v3, :cond_2

    .line 184
    .line 185
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_mine_value_male:I

    .line 186
    .line 187
    iget v3, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_mine_value_male:I

    .line 188
    .line 189
    if-ne v1, v3, :cond_2

    .line 190
    .line 191
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_item_diff_female:I

    .line 192
    .line 193
    iget v3, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_item_diff_female:I

    .line 194
    .line 195
    if-ne v1, v3, :cond_2

    .line 196
    .line 197
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_out_value_female:I

    .line 198
    .line 199
    iget v3, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_out_value_female:I

    .line 200
    .line 201
    if-ne v1, v3, :cond_2

    .line 202
    .line 203
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_mine_value_female:I

    .line 204
    .line 205
    iget v3, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_mine_value_female:I

    .line 206
    .line 207
    if-ne v1, v3, :cond_2

    .line 208
    .line 209
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_width:D

    .line 210
    .line 211
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_width:D

    .line 212
    .line 213
    cmpl-double v1, v3, v5

    .line 214
    .line 215
    if-nez v1, :cond_2

    .line 216
    .line 217
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_width:D

    .line 218
    .line 219
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_width:D

    .line 220
    .line 221
    cmpl-double v1, v3, v5

    .line 222
    .line 223
    if-nez v1, :cond_2

    .line 224
    .line 225
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_factor:D

    .line 226
    .line 227
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_factor:D

    .line 228
    .line 229
    cmpl-double v1, v3, v5

    .line 230
    .line 231
    if-nez v1, :cond_2

    .line 232
    .line 233
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_factor:D

    .line 234
    .line 235
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_factor:D

    .line 236
    .line 237
    cmpl-double v1, v3, v5

    .line 238
    .line 239
    if-nez v1, :cond_2

    .line 240
    .line 241
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_rotate:D

    .line 242
    .line 243
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_rotate:D

    .line 244
    .line 245
    cmpl-double v1, v3, v5

    .line 246
    .line 247
    if-nez v1, :cond_2

    .line 248
    .line 249
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_rotate:D

    .line 250
    .line 251
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_rotate:D

    .line 252
    .line 253
    cmpl-double v1, v3, v5

    .line 254
    .line 255
    if-nez v1, :cond_2

    .line 256
    .line 257
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->could_double_click:Z

    .line 258
    .line 259
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->could_double_click:Z

    .line 260
    .line 261
    if-ne v1, v3, :cond_2

    .line 262
    .line 263
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_type_factor:D

    .line 264
    .line 265
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_type_factor:D

    .line 266
    .line 267
    cmpl-double v1, v3, v5

    .line 268
    .line 269
    if-nez v1, :cond_2

    .line 270
    .line 271
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_fix_speed:I

    .line 272
    .line 273
    iget v3, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_fix_speed:I

    .line 274
    .line 275
    if-ne v1, v3, :cond_2

    .line 276
    .line 277
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_scale:D

    .line 278
    .line 279
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_scale:D

    .line 280
    .line 281
    cmpl-double v1, v3, v5

    .line 282
    .line 283
    if-nez v1, :cond_2

    .line 284
    .line 285
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_scale_start_alpha:D

    .line 286
    .line 287
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_scale_start_alpha:D

    .line 288
    .line 289
    cmpl-double v1, v3, v5

    .line 290
    .line 291
    if-nez v1, :cond_2

    .line 292
    .line 293
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_progress_value:I

    .line 294
    .line 295
    iget v3, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_progress_value:I

    .line 296
    .line 297
    if-ne v1, v3, :cond_2

    .line 298
    .line 299
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->config_version:I

    .line 300
    .line 301
    iget v3, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->config_version:I

    .line 302
    .line 303
    if-ne v1, v3, :cond_2

    .line 304
    .line 305
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_opt:Z

    .line 306
    .line 307
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_opt:Z

    .line 308
    .line 309
    if-ne v1, v3, :cond_2

    .line 310
    .line 311
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_opt_during:J

    .line 312
    .line 313
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_opt_during:J

    .line 314
    .line 315
    cmp-long v1, v3, v5

    .line 316
    .line 317
    if-nez v1, :cond_2

    .line 318
    .line 319
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_use_opt_during:Z

    .line 320
    .line 321
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_use_opt_during:Z

    .line 322
    .line 323
    if-ne v1, v3, :cond_2

    .line 324
    .line 325
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_alpha_opt:Z

    .line 326
    .line 327
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_alpha_opt:Z

    .line 328
    .line 329
    if-ne v1, v3, :cond_2

    .line 330
    .line 331
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_alpha_speed:D

    .line 332
    .line 333
    iget-wide p0, p1, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_alpha_speed:D

    .line 334
    .line 335
    cmpl-double p0, v3, p0

    .line 336
    .line 337
    if-nez p0, :cond_2

    .line 338
    .line 339
    return v0

    .line 340
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "cardswipeconfig"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 9

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_4

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_left_male_during:J

    .line 8
    .line 9
    const/16 v3, 0x20

    .line 10
    .line 11
    ushr-long v4, v1, v3

    .line 12
    .line 13
    xor-long/2addr v1, v4

    .line 14
    long-to-int v1, v1

    .line 15
    add-int/2addr v0, v1

    .line 16
    mul-int/lit8 v0, v0, 0x29

    .line 17
    .line 18
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_right_male_during:J

    .line 19
    .line 20
    ushr-long v4, v1, v3

    .line 21
    .line 22
    xor-long/2addr v1, v4

    .line 23
    long-to-int v1, v1

    .line 24
    add-int/2addr v0, v1

    .line 25
    mul-int/lit8 v0, v0, 0x29

    .line 26
    .line 27
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_up_male_during:J

    .line 28
    .line 29
    ushr-long v4, v1, v3

    .line 30
    .line 31
    xor-long/2addr v1, v4

    .line 32
    long-to-int v1, v1

    .line 33
    add-int/2addr v0, v1

    .line 34
    mul-int/lit8 v0, v0, 0x29

    .line 35
    .line 36
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_auto_male_during:J

    .line 37
    .line 38
    ushr-long v4, v1, v3

    .line 39
    .line 40
    xor-long/2addr v1, v4

    .line 41
    long-to-int v1, v1

    .line 42
    add-int/2addr v0, v1

    .line 43
    mul-int/lit8 v0, v0, 0x29

    .line 44
    .line 45
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_back_male_during:J

    .line 46
    .line 47
    ushr-long v4, v1, v3

    .line 48
    .line 49
    xor-long/2addr v1, v4

    .line 50
    long-to-int v1, v1

    .line 51
    add-int/2addr v0, v1

    .line 52
    mul-int/lit8 v0, v0, 0x29

    .line 53
    .line 54
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_reset_male_during:J

    .line 55
    .line 56
    ushr-long v4, v1, v3

    .line 57
    .line 58
    xor-long/2addr v1, v4

    .line 59
    long-to-int v1, v1

    .line 60
    add-int/2addr v0, v1

    .line 61
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_rotation_male:D

    .line 62
    .line 63
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 64
    .line 65
    .line 66
    move-result-wide v1

    .line 67
    mul-int/lit8 v0, v0, 0x29

    .line 68
    .line 69
    ushr-long v4, v1, v3

    .line 70
    .line 71
    xor-long/2addr v1, v4

    .line 72
    long-to-int v1, v1

    .line 73
    add-int/2addr v0, v1

    .line 74
    mul-int/lit8 v0, v0, 0x29

    .line 75
    .line 76
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_trans_y_male:J

    .line 77
    .line 78
    ushr-long v4, v1, v3

    .line 79
    .line 80
    xor-long/2addr v1, v4

    .line 81
    long-to-int v1, v1

    .line 82
    add-int/2addr v0, v1

    .line 83
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_factor_male:D

    .line 84
    .line 85
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 86
    .line 87
    .line 88
    move-result-wide v1

    .line 89
    mul-int/lit8 v0, v0, 0x29

    .line 90
    .line 91
    ushr-long v4, v1, v3

    .line 92
    .line 93
    xor-long/2addr v1, v4

    .line 94
    long-to-int v1, v1

    .line 95
    add-int/2addr v0, v1

    .line 96
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_check_male:D

    .line 97
    .line 98
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 99
    .line 100
    .line 101
    move-result-wide v1

    .line 102
    mul-int/lit8 v0, v0, 0x29

    .line 103
    .line 104
    ushr-long v4, v1, v3

    .line 105
    .line 106
    xor-long/2addr v1, v4

    .line 107
    long-to-int v1, v1

    .line 108
    add-int/2addr v0, v1

    .line 109
    mul-int/lit8 v0, v0, 0x29

    .line 110
    .line 111
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_left_female_during:J

    .line 112
    .line 113
    ushr-long v4, v1, v3

    .line 114
    .line 115
    xor-long/2addr v1, v4

    .line 116
    long-to-int v1, v1

    .line 117
    add-int/2addr v0, v1

    .line 118
    mul-int/lit8 v0, v0, 0x29

    .line 119
    .line 120
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_right_female_during:J

    .line 121
    .line 122
    ushr-long v4, v1, v3

    .line 123
    .line 124
    xor-long/2addr v1, v4

    .line 125
    long-to-int v1, v1

    .line 126
    add-int/2addr v0, v1

    .line 127
    mul-int/lit8 v0, v0, 0x29

    .line 128
    .line 129
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_up_female_during:J

    .line 130
    .line 131
    ushr-long v4, v1, v3

    .line 132
    .line 133
    xor-long/2addr v1, v4

    .line 134
    long-to-int v1, v1

    .line 135
    add-int/2addr v0, v1

    .line 136
    mul-int/lit8 v0, v0, 0x29

    .line 137
    .line 138
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_auto_female_during:J

    .line 139
    .line 140
    ushr-long v4, v1, v3

    .line 141
    .line 142
    xor-long/2addr v1, v4

    .line 143
    long-to-int v1, v1

    .line 144
    add-int/2addr v0, v1

    .line 145
    mul-int/lit8 v0, v0, 0x29

    .line 146
    .line 147
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_back_female_during:J

    .line 148
    .line 149
    ushr-long v4, v1, v3

    .line 150
    .line 151
    xor-long/2addr v1, v4

    .line 152
    long-to-int v1, v1

    .line 153
    add-int/2addr v0, v1

    .line 154
    mul-int/lit8 v0, v0, 0x29

    .line 155
    .line 156
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_reset_female_during:J

    .line 157
    .line 158
    ushr-long v4, v1, v3

    .line 159
    .line 160
    xor-long/2addr v1, v4

    .line 161
    long-to-int v1, v1

    .line 162
    add-int/2addr v0, v1

    .line 163
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_rotation_female:D

    .line 164
    .line 165
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 166
    .line 167
    .line 168
    move-result-wide v1

    .line 169
    mul-int/lit8 v0, v0, 0x29

    .line 170
    .line 171
    ushr-long v4, v1, v3

    .line 172
    .line 173
    xor-long/2addr v1, v4

    .line 174
    long-to-int v1, v1

    .line 175
    add-int/2addr v0, v1

    .line 176
    mul-int/lit8 v0, v0, 0x29

    .line 177
    .line 178
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_trans_y_female:J

    .line 179
    .line 180
    ushr-long v4, v1, v3

    .line 181
    .line 182
    xor-long/2addr v1, v4

    .line 183
    long-to-int v1, v1

    .line 184
    add-int/2addr v0, v1

    .line 185
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_factor_female:D

    .line 186
    .line 187
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 188
    .line 189
    .line 190
    move-result-wide v1

    .line 191
    mul-int/lit8 v0, v0, 0x29

    .line 192
    .line 193
    ushr-long v4, v1, v3

    .line 194
    .line 195
    xor-long/2addr v1, v4

    .line 196
    long-to-int v1, v1

    .line 197
    add-int/2addr v0, v1

    .line 198
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_speed_check_female:D

    .line 199
    .line 200
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 201
    .line 202
    .line 203
    move-result-wide v1

    .line 204
    mul-int/lit8 v0, v0, 0x29

    .line 205
    .line 206
    ushr-long v4, v1, v3

    .line 207
    .line 208
    xor-long/2addr v1, v4

    .line 209
    long-to-int v1, v1

    .line 210
    add-int/2addr v0, v1

    .line 211
    mul-int/lit8 v0, v0, 0x29

    .line 212
    .line 213
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_item_diff_male:I

    .line 214
    .line 215
    add-int/2addr v0, v1

    .line 216
    mul-int/lit8 v0, v0, 0x29

    .line 217
    .line 218
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_out_value_male:I

    .line 219
    .line 220
    add-int/2addr v0, v1

    .line 221
    mul-int/lit8 v0, v0, 0x29

    .line 222
    .line 223
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_mine_value_male:I

    .line 224
    .line 225
    add-int/2addr v0, v1

    .line 226
    mul-int/lit8 v0, v0, 0x29

    .line 227
    .line 228
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_item_diff_female:I

    .line 229
    .line 230
    add-int/2addr v0, v1

    .line 231
    mul-int/lit8 v0, v0, 0x29

    .line 232
    .line 233
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_out_value_female:I

    .line 234
    .line 235
    add-int/2addr v0, v1

    .line 236
    mul-int/lit8 v0, v0, 0x29

    .line 237
    .line 238
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_mine_value_female:I

    .line 239
    .line 240
    add-int/2addr v0, v1

    .line 241
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_width:D

    .line 242
    .line 243
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 244
    .line 245
    .line 246
    move-result-wide v1

    .line 247
    mul-int/lit8 v0, v0, 0x29

    .line 248
    .line 249
    ushr-long v4, v1, v3

    .line 250
    .line 251
    xor-long/2addr v1, v4

    .line 252
    long-to-int v1, v1

    .line 253
    add-int/2addr v0, v1

    .line 254
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_width:D

    .line 255
    .line 256
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 257
    .line 258
    .line 259
    move-result-wide v1

    .line 260
    mul-int/lit8 v0, v0, 0x29

    .line 261
    .line 262
    ushr-long v4, v1, v3

    .line 263
    .line 264
    xor-long/2addr v1, v4

    .line 265
    long-to-int v1, v1

    .line 266
    add-int/2addr v0, v1

    .line 267
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_factor:D

    .line 268
    .line 269
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 270
    .line 271
    .line 272
    move-result-wide v1

    .line 273
    mul-int/lit8 v0, v0, 0x29

    .line 274
    .line 275
    ushr-long v4, v1, v3

    .line 276
    .line 277
    xor-long/2addr v1, v4

    .line 278
    long-to-int v1, v1

    .line 279
    add-int/2addr v0, v1

    .line 280
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_factor:D

    .line 281
    .line 282
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 283
    .line 284
    .line 285
    move-result-wide v1

    .line 286
    mul-int/lit8 v0, v0, 0x29

    .line 287
    .line 288
    ushr-long v4, v1, v3

    .line 289
    .line 290
    xor-long/2addr v1, v4

    .line 291
    long-to-int v1, v1

    .line 292
    add-int/2addr v0, v1

    .line 293
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->male_swipe_auto_rotate:D

    .line 294
    .line 295
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 296
    .line 297
    .line 298
    move-result-wide v1

    .line 299
    mul-int/lit8 v0, v0, 0x29

    .line 300
    .line 301
    ushr-long v4, v1, v3

    .line 302
    .line 303
    xor-long/2addr v1, v4

    .line 304
    long-to-int v1, v1

    .line 305
    add-int/2addr v0, v1

    .line 306
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->female_swipe_auto_rotate:D

    .line 307
    .line 308
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 309
    .line 310
    .line 311
    move-result-wide v1

    .line 312
    mul-int/lit8 v0, v0, 0x29

    .line 313
    .line 314
    ushr-long v4, v1, v3

    .line 315
    .line 316
    xor-long/2addr v1, v4

    .line 317
    long-to-int v1, v1

    .line 318
    add-int/2addr v0, v1

    .line 319
    mul-int/lit8 v0, v0, 0x29

    .line 320
    .line 321
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->could_double_click:Z

    .line 322
    .line 323
    const/16 v2, 0x4d5

    .line 324
    .line 325
    const/16 v4, 0x4cf

    .line 326
    .line 327
    if-eqz v1, :cond_0

    .line 328
    .line 329
    move v1, v4

    .line 330
    goto :goto_0

    .line 331
    :cond_0
    move v1, v2

    .line 332
    :goto_0
    add-int/2addr v0, v1

    .line 333
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_type_factor:D

    .line 334
    .line 335
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 336
    .line 337
    .line 338
    move-result-wide v5

    .line 339
    mul-int/lit8 v0, v0, 0x29

    .line 340
    .line 341
    ushr-long v7, v5, v3

    .line 342
    .line 343
    xor-long/2addr v5, v7

    .line 344
    long-to-int v1, v5

    .line 345
    add-int/2addr v0, v1

    .line 346
    mul-int/lit8 v0, v0, 0x29

    .line 347
    .line 348
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_fix_speed:I

    .line 349
    .line 350
    add-int/2addr v0, v1

    .line 351
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_scale:D

    .line 352
    .line 353
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 354
    .line 355
    .line 356
    move-result-wide v5

    .line 357
    mul-int/lit8 v0, v0, 0x29

    .line 358
    .line 359
    ushr-long v7, v5, v3

    .line 360
    .line 361
    xor-long/2addr v5, v7

    .line 362
    long-to-int v1, v5

    .line 363
    add-int/2addr v0, v1

    .line 364
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_scale_start_alpha:D

    .line 365
    .line 366
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 367
    .line 368
    .line 369
    move-result-wide v5

    .line 370
    mul-int/lit8 v0, v0, 0x29

    .line 371
    .line 372
    ushr-long v7, v5, v3

    .line 373
    .line 374
    xor-long/2addr v5, v7

    .line 375
    long-to-int v1, v5

    .line 376
    add-int/2addr v0, v1

    .line 377
    mul-int/lit8 v0, v0, 0x29

    .line 378
    .line 379
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->swipe_progress_value:I

    .line 380
    .line 381
    add-int/2addr v0, v1

    .line 382
    mul-int/lit8 v0, v0, 0x29

    .line 383
    .line 384
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->config_version:I

    .line 385
    .line 386
    add-int/2addr v0, v1

    .line 387
    mul-int/lit8 v0, v0, 0x29

    .line 388
    .line 389
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_opt:Z

    .line 390
    .line 391
    if-eqz v1, :cond_1

    .line 392
    .line 393
    move v1, v4

    .line 394
    goto :goto_1

    .line 395
    :cond_1
    move v1, v2

    .line 396
    :goto_1
    add-int/2addr v0, v1

    .line 397
    mul-int/lit8 v0, v0, 0x29

    .line 398
    .line 399
    iget-wide v5, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_opt_during:J

    .line 400
    .line 401
    ushr-long v7, v5, v3

    .line 402
    .line 403
    xor-long/2addr v5, v7

    .line 404
    long-to-int v1, v5

    .line 405
    add-int/2addr v0, v1

    .line 406
    mul-int/lit8 v0, v0, 0x29

    .line 407
    .line 408
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_use_opt_during:Z

    .line 409
    .line 410
    if-eqz v1, :cond_2

    .line 411
    .line 412
    move v1, v4

    .line 413
    goto :goto_2

    .line 414
    :cond_2
    move v1, v2

    .line 415
    :goto_2
    add-int/2addr v0, v1

    .line 416
    mul-int/lit8 v0, v0, 0x29

    .line 417
    .line 418
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_alpha_opt:Z

    .line 419
    .line 420
    if-eqz v1, :cond_3

    .line 421
    .line 422
    move v2, v4

    .line 423
    :cond_3
    add-int/2addr v0, v2

    .line 424
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->scale_alpha_speed:D

    .line 425
    .line 426
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 427
    .line 428
    .line 429
    move-result-wide v1

    .line 430
    mul-int/lit8 v0, v0, 0x29

    .line 431
    .line 432
    ushr-long v3, v1, v3

    .line 433
    .line 434
    xor-long/2addr v1, v3

    .line 435
    long-to-int v1, v1

    .line 436
    add-int/2addr v0, v1

    .line 437
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 438
    .line 439
    :cond_4
    return v0
.end method

.method public nullCheck()V
    .locals 0

    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/CardSwipeConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
