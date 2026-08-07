.class public Ll/t600;
.super Ll/wzh0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/wzh0<",
        "Lcom/p1/mobile/putong/core/data/Message;",
        ">;"
    }
.end annotation


# instance fields
.field public m:Ll/wzh0$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation
.end field

.field public n:Ll/wzh0$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation
.end field

.field public o:Lcom/tantanapp/common/data/orm/Filter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Filter<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V
    .locals 25
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/h9c;",
            "Ljava/lang/String;",
            "Ll/vzf0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;",
            "Ljava/util/List<",
            "Lcom/tantanapp/common/data/orm/Index;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-direct/range {p0 .. p5}, Ll/wzh0;-><init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/wzh0$a;

    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->OWNER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/orm/ValueColumn;->NEQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    const-string v3, "1"

    .line 21
    .line 22
    invoke-virtual {v1, v3}, Lcom/tantanapp/common/data/orm/OrderedColumn;->REQ(Ljava/lang/Comparable;)Lcom/tantanapp/common/data/orm/Filter;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    filled-new-array {v2, v1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-static {v1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    sget-object v7, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 35
    .line 36
    iget-object v4, v7, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 37
    .line 38
    const/16 v5, 0x32

    .line 39
    .line 40
    const/16 v6, 0x1e

    .line 41
    .line 42
    const-string v2, "receivedUserMessages"

    .line 43
    .line 44
    move-object/from16 v1, p0

    .line 45
    .line 46
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 47
    .line 48
    .line 49
    iput-object v0, v1, Ll/t600;->m:Ll/wzh0$a;

    .line 50
    .line 51
    new-instance v0, Ll/wzh0$a;

    .line 52
    .line 53
    sget-object v2, Lcom/p1/mobile/putong/core/data/Message;->LOCALNOTIFICATIONSTATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 54
    .line 55
    const-string v3, "pending"

    .line 56
    .line 57
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    const-string v4, "ongoing"

    .line 62
    .line 63
    invoke-virtual {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    filled-new-array {v3, v2}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-static {v2}, Lcom/tantanapp/common/data/orm/Filter;->OR([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    iget-object v4, v7, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 76
    .line 77
    const/4 v5, 0x0

    .line 78
    const/16 v6, 0x32

    .line 79
    .line 80
    const-string v2, "sysnotif"

    .line 81
    .line 82
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 83
    .line 84
    .line 85
    iput-object v0, v1, Ll/t600;->n:Ll/wzh0$a;

    .line 86
    .line 87
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALINCONVERSATION:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 88
    .line 89
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/BooleanColumn;->T()Lcom/tantanapp/common/data/orm/Filter;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->MESSAGETYPE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 94
    .line 95
    const-string v3, "tantan_verify_toast"

    .line 96
    .line 97
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    const-string v4, "live_vip_greet"

    .line 102
    .line 103
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    const-string v5, "local_tickle_tip"

    .line 108
    .line 109
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 110
    .line 111
    .line 112
    move-result-object v5

    .line 113
    const-string v6, "soul_test_guide"

    .line 114
    .line 115
    invoke-virtual {v0, v6}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 116
    .line 117
    .line 118
    move-result-object v6

    .line 119
    const-string v7, "soul_match_invite_upload_profile"

    .line 120
    .line 121
    invoke-virtual {v0, v7}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 122
    .line 123
    .line 124
    move-result-object v7

    .line 125
    const-string v8, "local_soul_match_like"

    .line 126
    .line 127
    invoke-virtual {v0, v8}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 128
    .line 129
    .line 130
    move-result-object v8

    .line 131
    const-string v9, "local_soul_match_profile_limit"

    .line 132
    .line 133
    invoke-virtual {v0, v9}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 134
    .line 135
    .line 136
    move-result-object v9

    .line 137
    const-string v10, "liaoliao"

    .line 138
    .line 139
    invoke-virtual {v0, v10}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 140
    .line 141
    .line 142
    move-result-object v10

    .line 143
    const-string v11, "local_soul_match_tags"

    .line 144
    .line 145
    invoke-virtual {v0, v11}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 146
    .line 147
    .line 148
    move-result-object v11

    .line 149
    const-string v12, "local_friend_comment_toast"

    .line 150
    .line 151
    invoke-virtual {v0, v12}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 152
    .line 153
    .line 154
    move-result-object v12

    .line 155
    const-string v13, "local_birthday_tip"

    .line 156
    .line 157
    invoke-virtual {v0, v13}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 158
    .line 159
    .line 160
    move-result-object v13

    .line 161
    const-string v14, "local_chat_assistant_question_new"

    .line 162
    .line 163
    invoke-virtual {v0, v14}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 164
    .line 165
    .line 166
    move-result-object v14

    .line 167
    const-string v15, "local_heart_beat_lock_tip"

    .line 168
    .line 169
    invoke-virtual {v0, v15}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 170
    .line 171
    .line 172
    move-result-object v15

    .line 173
    move-object/from16 p1, v2

    .line 174
    .line 175
    const-string v2, "local_platinum_pin_guide"

    .line 176
    .line 177
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 178
    .line 179
    .line 180
    move-result-object v16

    .line 181
    const-string v2, "local_wechat_notify_guide"

    .line 182
    .line 183
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 184
    .line 185
    .line 186
    move-result-object v17

    .line 187
    const-string v2, "common_tip"

    .line 188
    .line 189
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 190
    .line 191
    .line 192
    move-result-object v18

    .line 193
    const-string v2, "local_long_time_no_see"

    .line 194
    .line 195
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 196
    .line 197
    .line 198
    move-result-object v19

    .line 199
    const-string v2, "wanwan_tip"

    .line 200
    .line 201
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 202
    .line 203
    .line 204
    move-result-object v20

    .line 205
    const-string v2, "local_visitor_hide_footprint"

    .line 206
    .line 207
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 208
    .line 209
    .line 210
    move-result-object v21

    .line 211
    const-string v2, "local_ux_questionnaire"

    .line 212
    .line 213
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 214
    .line 215
    .line 216
    move-result-object v22

    .line 217
    const-string v2, "local_ux_questionnaire_tip"

    .line 218
    .line 219
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 220
    .line 221
    .line 222
    move-result-object v23

    .line 223
    const-string v2, "local_o_diamond_visitor_guide"

    .line 224
    .line 225
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 226
    .line 227
    .line 228
    move-result-object v24

    .line 229
    move-object/from16 v2, p1

    .line 230
    .line 231
    filled-new-array/range {v2 .. v24}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    iput-object v0, v1, Ll/t600;->o:Lcom/tantanapp/common/data/orm/Filter;

    .line 240
    .line 241
    return-void
.end method


# virtual methods
.method public A0(Lcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;Ljava/lang/String;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALNOTIFICATIONSTATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 2
    .line 3
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    filled-new-array {p2}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->HOSTID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 16
    .line 17
    invoke-virtual {v1, p3}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->CHANNEL:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 22
    .line 23
    const-string v2, "group"

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    filled-new-array {p3, v1, p1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p0, p2, p1}, Ll/wzh0;->update(Ljava/util/List;Lcom/tantanapp/common/data/orm/Filter;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public F(Ljava/lang/String;D)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "D)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 8
    .line 9
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/orm/OrderedColumn;->REQ(Ljava/lang/Comparable;)Lcom/tantanapp/common/data/orm/Filter;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-virtual {v0, p2}, Lcom/tantanapp/common/data/orm/ValueColumn;->NEQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    filled-new-array {p1, v1, p2}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object p2, v0, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 34
    .line 35
    const/16 p3, 0xa

    .line 36
    .line 37
    invoke-virtual {p0, p1, p2, p3}, Ll/wzh0;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public G(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 8
    .line 9
    const-string v1, "fake_id_"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->OWNER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 16
    .line 17
    invoke-virtual {v1, p2}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    filled-new-array {p1, v0, p2}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    sget-object p2, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 30
    .line 31
    iget-object p2, p2, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    invoke-virtual {p0, p1, p2, v0}, Ll/wzh0;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public H(Ljava/lang/String;D)V
    .locals 12

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sget-object v2, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 8
    .line 9
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-virtual {v2, v3}, Lcom/tantanapp/common/data/orm/OrderedColumn;->LEQ(Ljava/lang/Comparable;)Lcom/tantanapp/common/data/orm/Filter;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    sget-object v4, Lcom/p1/mobile/putong/core/data/Message;->MOMENT:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 18
    .line 19
    invoke-virtual {v4}, Lcom/tantanapp/common/data/orm/Column;->NULL()Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    sget-object v6, Lcom/p1/mobile/putong/core/data/Message;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 24
    .line 25
    const-string v7, "fake_id_"

    .line 26
    .line 27
    invoke-virtual {v6, v7}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 28
    .line 29
    .line 30
    move-result-object v8

    .line 31
    sget-object v9, Lcom/p1/mobile/putong/core/data/Message;->LOCALCREATEDSESSION:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 32
    .line 33
    sget-object v10, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 34
    .line 35
    invoke-virtual {v10}, Ll/azd0;->get()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v11

    .line 39
    check-cast v11, Ljava/lang/Integer;

    .line 40
    .line 41
    invoke-virtual {v9, v11}, Lcom/tantanapp/common/data/orm/OrderedColumn;->LEQ(Ljava/lang/Comparable;)Lcom/tantanapp/common/data/orm/Filter;

    .line 42
    .line 43
    .line 44
    move-result-object v11

    .line 45
    filled-new-array {v8, v11}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 46
    .line 47
    .line 48
    move-result-object v8

    .line 49
    invoke-static {v8}, Lcom/tantanapp/common/data/orm/Filter;->OR([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 50
    .line 51
    .line 52
    move-result-object v8

    .line 53
    filled-new-array {v1, v3, v5, v8}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-static {v1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {p0, v1}, Ll/wzh0;->delete(Lcom/tantanapp/common/data/orm/Filter;)V

    .line 62
    .line 63
    .line 64
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->LOCALINCONVERSATION:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 65
    .line 66
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 67
    .line 68
    invoke-static {v1, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    sget-object v3, Lcom/p1/mobile/putong/core/data/Message;->LOCALNOTIFICATIONSTATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 73
    .line 74
    const-string v5, "removed"

    .line 75
    .line 76
    invoke-static {v5}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 77
    .line 78
    .line 79
    move-result-object v5

    .line 80
    invoke-static {v3, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    filled-new-array {v1, v3}, [Ll/pf60;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    invoke-virtual {v2, p2}, Lcom/tantanapp/common/data/orm/OrderedColumn;->LEQ(Ljava/lang/Comparable;)Lcom/tantanapp/common/data/orm/Filter;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    invoke-virtual {v4}, Lcom/tantanapp/common/data/orm/Column;->NOT_NULL()Lcom/tantanapp/common/data/orm/Filter;

    .line 105
    .line 106
    .line 107
    move-result-object p3

    .line 108
    invoke-virtual {v6, v7}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {v10}, Ll/azd0;->get()Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    check-cast v2, Ljava/lang/Integer;

    .line 117
    .line 118
    invoke-virtual {v9, v2}, Lcom/tantanapp/common/data/orm/OrderedColumn;->LEQ(Ljava/lang/Comparable;)Lcom/tantanapp/common/data/orm/Filter;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    filled-new-array {v0, v2}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/Filter;->OR([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    filled-new-array {p1, p2, p3, v0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-virtual {p0, v1, p1}, Ll/wzh0;->update(Ljava/util/List;Lcom/tantanapp/common/data/orm/Filter;)V

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method public I(Ljava/lang/String;)Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "comments/"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->LOCALINMOMENT:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/tantanapp/common/data/orm/BooleanColumn;->T()Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    sget-object v3, Lcom/p1/mobile/putong/core/data/Message;->MOMENT:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 24
    .line 25
    invoke-virtual {v3, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    filled-new-array {v1, p1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    sget-object p1, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 38
    .line 39
    iget-object v4, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 40
    .line 41
    const/4 v5, 0x0

    .line 42
    const/16 v6, 0x64

    .line 43
    .line 44
    move-object v1, p0

    .line 45
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 46
    .line 47
    .line 48
    return-object v0
.end method

.method public J(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/wzh0;->delete(Lcom/tantanapp/common/data/orm/Filter;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public K()Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->MESSAGETYPE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 4
    .line 5
    const-string v2, "text"

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    filled-new-array {v1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 20
    .line 21
    iget-object v4, v1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 22
    .line 23
    const/4 v5, 0x1

    .line 24
    const/16 v6, 0x14

    .line 25
    .line 26
    const-string v2, "firsttextMessages"

    .line 27
    .line 28
    move-object v1, p0

    .line 29
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 30
    .line 31
    .line 32
    return-object v0
.end method

.method public L(Ljava/lang/String;)Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 4
    .line 5
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 6
    .line 7
    .line 8
    move-result-object v3

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 10
    .line 11
    iget-object v4, v1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 12
    .line 13
    const/4 v5, 0x1

    .line 14
    const/16 v6, 0x64

    .line 15
    .line 16
    move-object v1, p0

    .line 17
    move-object v2, p1

    .line 18
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 19
    .line 20
    .line 21
    return-object v0
.end method

.method public M(Ljava/lang/String;Ljava/lang/String;)Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "greetMessagesSent/"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->LOCALGREETINGID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 18
    .line 19
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 24
    .line 25
    invoke-virtual {v1, p2}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->OWNER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v1, v3}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    filled-new-array {p1, p2, v1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    sget-object p1, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 52
    .line 53
    iget-object v4, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 54
    .line 55
    const/4 v5, 0x1

    .line 56
    const/16 v6, 0x1e

    .line 57
    .line 58
    move-object v1, p0

    .line 59
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 60
    .line 61
    .line 62
    return-object v0
.end method

.method public N(Ljava/lang/String;)Ll/wzh0$a;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "greeting/"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, "/messages"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->LOCALGREETINGID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 23
    .line 24
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->MESSAGETYPE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 29
    .line 30
    const-string v3, "local_greeting_match_success"

    .line 31
    .line 32
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    const-string v4, "local_chat_greeting_tip"

    .line 37
    .line 38
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    const-string v5, "local_greet_send_notice"

    .line 43
    .line 44
    invoke-virtual {v1, v5}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    const-string v6, "local_greet_receive_match_tip"

    .line 49
    .line 50
    invoke-virtual {v1, v6}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 51
    .line 52
    .line 53
    move-result-object v6

    .line 54
    const-string v7, "local_send_agreematch_notice"

    .line 55
    .line 56
    invoke-virtual {v1, v7}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    filled-new-array {v5, v6, v1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-static {v1}, Lcom/tantanapp/common/data/orm/Filter;->OR([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    filled-new-array {p1, v3, v4, v1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    sget-object p1, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 77
    .line 78
    iget-object v4, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 79
    .line 80
    const/4 v5, 0x0

    .line 81
    const/16 v6, 0x64

    .line 82
    .line 83
    move-object v1, p0

    .line 84
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 85
    .line 86
    .line 87
    return-object v0
.end method

.method public O(Ljava/lang/String;Ljava/lang/String;)Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "greeting/"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, "/greetingId"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v2, "/clearedUntil"

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->LOCALGREETINGID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 31
    .line 32
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 37
    .line 38
    invoke-virtual {v1, p2}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    filled-new-array {p1, p2}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    sget-object p1, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 51
    .line 52
    iget-object v4, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 53
    .line 54
    const/4 v5, 0x1

    .line 55
    const/16 v6, 0x64

    .line 56
    .line 57
    move-object v1, p0

    .line 58
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 59
    .line 60
    .line 61
    return-object v0
.end method

.method public P(Ljava/lang/String;DJZ)Ll/wzh0$a;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "DJZ)",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p4, v0

    .line 4
    .line 5
    const-string v1, "anonymous"

    .line 6
    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->CHANNEL:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :goto_0
    move-object v2, p1

    .line 16
    move-object p1, p0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    sget-object v0, Lcom/tantanapp/common/data/orm/Filter;->TRUE:Lcom/tantanapp/common/data/orm/Filter;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :goto_1
    new-instance p0, Ll/wzh0$a;

    .line 22
    .line 23
    new-instance v3, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v4, "greeting/"

    .line 26
    .line 27
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v4, "/messagesGreaterThanClearUntil"

    .line 34
    .line 35
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v3, p2, p3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v4, "/clearUntil"

    .line 42
    .line 43
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v3, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string p4, "/anonymous"

    .line 50
    .line 51
    invoke-virtual {v3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v3, p6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p4

    .line 61
    sget-object p5, Lcom/p1/mobile/putong/core/data/Message;->LOCALGREETINGID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 62
    .line 63
    invoke-virtual {p5, v2}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    sget-object p5, Lcom/p1/mobile/putong/core/data/Message;->MESSAGETYPE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 68
    .line 69
    const-string v3, "local_greeting_match_success"

    .line 70
    .line 71
    invoke-virtual {p5, v3}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    const-string v4, "local_chat_greeting_tip"

    .line 76
    .line 77
    invoke-virtual {p5, v4}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    if-eqz p6, :cond_1

    .line 82
    .line 83
    :goto_2
    move-object v5, v0

    .line 84
    goto :goto_3

    .line 85
    :cond_1
    sget-object p5, Lcom/p1/mobile/putong/core/data/Message;->CHANNEL:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 86
    .line 87
    invoke-virtual {p5, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    goto :goto_2

    .line 92
    :goto_3
    sget-object p5, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 93
    .line 94
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 95
    .line 96
    .line 97
    move-result-object p6

    .line 98
    invoke-virtual {p5, p6}, Lcom/tantanapp/common/data/orm/OrderedColumn;->REQ(Ljava/lang/Comparable;)Lcom/tantanapp/common/data/orm/Filter;

    .line 99
    .line 100
    .line 101
    move-result-object v6

    .line 102
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 103
    .line 104
    .line 105
    move-result-object p2

    .line 106
    invoke-virtual {p5, p2}, Lcom/tantanapp/common/data/orm/ValueColumn;->NEQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 107
    .line 108
    .line 109
    move-result-object v7

    .line 110
    filled-new-array/range {v2 .. v7}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    invoke-static {p2}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 115
    .line 116
    .line 117
    move-result-object p3

    .line 118
    iget-object p2, p5, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 119
    .line 120
    const/4 p5, 0x1

    .line 121
    const/16 p6, 0x64

    .line 122
    .line 123
    move-object v8, p4

    .line 124
    move-object p4, p2

    .line 125
    move-object p2, v8

    .line 126
    invoke-direct/range {p0 .. p6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 127
    .line 128
    .line 129
    return-object p0
.end method

.method public Q(Ljava/lang/String;)Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "greeting/"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, "/messages/withoutFakeId"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->LOCALGREETINGID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 23
    .line 24
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 29
    .line 30
    const-string v3, "fake_private_question_id_"

    .line 31
    .line 32
    invoke-virtual {v1, v3}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    const-string v4, "fake_id_"

    .line 37
    .line 38
    invoke-virtual {v1, v4}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    filled-new-array {p1, v3, v1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    sget-object p1, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 51
    .line 52
    iget-object v4, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 53
    .line 54
    const/4 v5, 0x1

    .line 55
    const/16 v6, 0x64

    .line 56
    .line 57
    move-object v1, p0

    .line 58
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 59
    .line 60
    .line 61
    return-object v0
.end method

.method public R(Ljava/lang/String;DZ)Ll/wzh0$a;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "DZ)",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/tantanapp/common/data/orm/Filter;->TRUE:Lcom/tantanapp/common/data/orm/Filter;

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 6
    .line 7
    const-string v1, "fake_id_"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/t600;->o:Lcom/tantanapp/common/data/orm/Filter;

    .line 14
    .line 15
    filled-new-array {v0, v1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    :cond_0
    new-instance v1, Ll/wzh0$a;

    .line 24
    .line 25
    new-instance v2, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v3, "/filter/intlMessageListRealShow"

    .line 34
    .line 35
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2, p2, p3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v3, "/"

    .line 42
    .line 43
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    sget-object p4, Lcom/p1/mobile/putong/core/data/Message;->LOCALINCONVERSATION:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 54
    .line 55
    invoke-virtual {p4}, Lcom/tantanapp/common/data/orm/BooleanColumn;->T()Lcom/tantanapp/common/data/orm/Filter;

    .line 56
    .line 57
    .line 58
    move-result-object p4

    .line 59
    sget-object v2, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 60
    .line 61
    invoke-virtual {v2, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    sget-object v2, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 66
    .line 67
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    invoke-virtual {v2, v4}, Lcom/tantanapp/common/data/orm/OrderedColumn;->REQ(Ljava/lang/Comparable;)Lcom/tantanapp/common/data/orm/Filter;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    invoke-virtual {v2, p2}, Lcom/tantanapp/common/data/orm/ValueColumn;->NEQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    filled-new-array {v4, p2}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    invoke-static {p2}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    filled-new-array {p4, p1, p2, v0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    iget-object v5, v2, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 100
    .line 101
    const/4 v6, 0x1

    .line 102
    const/16 v7, 0x64

    .line 103
    .line 104
    move-object v2, p0

    .line 105
    invoke-direct/range {v1 .. v7}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 106
    .line 107
    .line 108
    return-object v1
.end method

.method public S(Ljava/lang/String;)V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->MOMENT:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->LOCAL_ID_INVALID:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget-object v2, Lcom/p1/mobile/putong/core/data/Message;->LOCALINMOMENT:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 10
    .line 11
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    filled-new-array {v1, v4}, [Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v1, v0}, Ll/wzh0;->update(Ljava/util/List;Lcom/tantanapp/common/data/orm/Filter;)V

    .line 30
    .line 31
    .line 32
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->LIKEOFMOMENT:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 33
    .line 34
    sget-object v1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->LOCAL_ID_INVALID:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p0, v1, p1}, Ll/wzh0;->update(Ljava/util/List;Lcom/tantanapp/common/data/orm/Filter;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public T(Ljava/lang/String;)Ljava/util/List;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALINCONVERSATION:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/BooleanColumn;->T()Lcom/tantanapp/common/data/orm/Filter;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    sget-object p1, Lcom/p1/mobile/putong/core/data/Message;->MESSAGETYPE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 14
    .line 15
    const-string v0, "tantan_verify_toast"

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    const-string v0, "live_vip_greet"

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    const-string v0, "local_tickle_tip"

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    const-string v0, "soul_test_guide"

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    const-string v0, "soul_match_invite_upload_profile"

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 42
    .line 43
    .line 44
    move-result-object v7

    .line 45
    const-string v0, "local_soul_match_like"

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 48
    .line 49
    .line 50
    move-result-object v8

    .line 51
    const-string v0, "local_soul_match_profile_limit"

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 54
    .line 55
    .line 56
    move-result-object v9

    .line 57
    const-string v0, "liaoliao"

    .line 58
    .line 59
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 60
    .line 61
    .line 62
    move-result-object v10

    .line 63
    const-string v0, "local_soul_match_tags"

    .line 64
    .line 65
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 66
    .line 67
    .line 68
    move-result-object v11

    .line 69
    const-string v0, "local_friend_comment_toast"

    .line 70
    .line 71
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 72
    .line 73
    .line 74
    move-result-object v12

    .line 75
    const-string v0, "wanwan_tip"

    .line 76
    .line 77
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 78
    .line 79
    .line 80
    move-result-object v13

    .line 81
    filled-new-array/range {v1 .. v13}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 90
    .line 91
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 92
    .line 93
    const/4 v1, 0x1

    .line 94
    invoke-virtual {p0, p1, v0, v1}, Ll/wzh0;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    return-object p0
.end method

.method public U(Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Ll/t600;->o:Lcom/tantanapp/common/data/orm/Filter;

    .line 8
    .line 9
    filled-new-array {p1, v0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-virtual {p0, p1, v0, v1}, Ll/wzh0;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public V(Ljava/lang/String;Ljava/util/List;Z)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALINMOMENT:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 2
    .line 3
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    filled-new-array {v1}, [Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    sget-object v2, Lcom/p1/mobile/putong/core/data/Message;->MOMENT:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 20
    .line 21
    invoke-virtual {v2, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    sget-object v2, Lcom/p1/mobile/putong/core/data/Message;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 26
    .line 27
    const-string v3, "fake_id_"

    .line 28
    .line 29
    invoke-virtual {v2, v3}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v2, p2}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_IN(Ljava/util/List;)Lcom/tantanapp/common/data/orm/Filter;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    invoke-virtual {v0, p3}, Lcom/tantanapp/common/data/orm/ValueColumn;->NEQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 42
    .line 43
    .line 44
    move-result-object p3

    .line 45
    filled-new-array {p1, v3, p2, p3}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p0, v1, p1}, Ll/wzh0;->update(Ljava/util/List;Lcom/tantanapp/common/data/orm/Filter;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public W(Ljava/lang/String;)Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->LOCALINCONVERSATION:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/tantanapp/common/data/orm/BooleanColumn;->T()Lcom/tantanapp/common/data/orm/Filter;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget-object v2, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 10
    .line 11
    invoke-virtual {v2, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    filled-new-array {v1, v2}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 24
    .line 25
    iget-object v4, v1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 26
    .line 27
    const/4 v5, 0x1

    .line 28
    const/16 v6, 0x64

    .line 29
    .line 30
    move-object v1, p0

    .line 31
    move-object v2, p1

    .line 32
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 33
    .line 34
    .line 35
    return-object v0
.end method

.method public X(Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Ljava/lang/String;DZ)Ll/wzh0$a;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;",
            "Ljava/lang/String;",
            "DZ)",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/tantanapp/common/data/orm/Filter;->TRUE:Lcom/tantanapp/common/data/orm/Filter;

    .line 2
    .line 3
    if-nez p6, :cond_0

    .line 4
    .line 5
    sget-object p6, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 6
    .line 7
    invoke-static {p4, p5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p6, v0}, Lcom/tantanapp/common/data/orm/OrderedColumn;->REQ(Ljava/lang/Comparable;)Lcom/tantanapp/common/data/orm/Filter;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {p4, p5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 16
    .line 17
    .line 18
    move-result-object p4

    .line 19
    invoke-virtual {p6, p4}, Lcom/tantanapp/common/data/orm/ValueColumn;->NEQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object p4

    .line 23
    filled-new-array {v0, p4}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 24
    .line 25
    .line 26
    move-result-object p4

    .line 27
    invoke-static {p4}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    :cond_0
    move-object p4, p1

    .line 32
    move-object p1, p0

    .line 33
    new-instance p0, Ll/wzh0$a;

    .line 34
    .line 35
    new-instance p5, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {p5}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p5, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string p6, "/filter/"

    .line 44
    .line 45
    invoke-virtual {p5, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p3

    .line 55
    sget-object p5, Lcom/p1/mobile/putong/core/data/Message;->LOCALINCONVERSATION:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 56
    .line 57
    invoke-virtual {p5}, Lcom/tantanapp/common/data/orm/BooleanColumn;->T()Lcom/tantanapp/common/data/orm/Filter;

    .line 58
    .line 59
    .line 60
    move-result-object p5

    .line 61
    sget-object p6, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 62
    .line 63
    invoke-virtual {p6, p4}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 64
    .line 65
    .line 66
    move-result-object p4

    .line 67
    filled-new-array {p5, p4, p2, v0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-static {p2}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    sget-object p4, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 76
    .line 77
    iget-object p4, p4, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 78
    .line 79
    const/4 p5, 0x1

    .line 80
    const/16 p6, 0x64

    .line 81
    .line 82
    move-object v1, p3

    .line 83
    move-object p3, p2

    .line 84
    move-object p2, v1

    .line 85
    invoke-direct/range {p0 .. p6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 86
    .line 87
    .line 88
    return-object p0
.end method

.method public Y(Ljava/lang/String;Ljava/lang/String;)Ll/wzh0$a;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/tantanapp/common/data/orm/Filter;->TRUE:Lcom/tantanapp/common/data/orm/Filter;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 4
    .line 5
    invoke-virtual {v0, p2}, Lcom/tantanapp/common/data/orm/OrderedColumn;->REQ(Ljava/lang/Comparable;)Lcom/tantanapp/common/data/orm/Filter;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, p2}, Lcom/tantanapp/common/data/orm/ValueColumn;->NEQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    filled-new-array {v1, v0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/wzh0$a;

    .line 22
    .line 23
    new-instance v2, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v3, "/filter/messageId/greater/than/"

    .line 32
    .line 33
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    sget-object p2, Lcom/p1/mobile/putong/core/data/Message;->LOCALINCONVERSATION:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 44
    .line 45
    invoke-virtual {p2}, Lcom/tantanapp/common/data/orm/BooleanColumn;->T()Lcom/tantanapp/common/data/orm/Filter;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    sget-object v2, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 50
    .line 51
    invoke-virtual {v2, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    filled-new-array {p2, p1, v0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    sget-object p1, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 64
    .line 65
    iget-object v5, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 66
    .line 67
    const/4 v6, 0x1

    .line 68
    const/16 v7, 0x64

    .line 69
    .line 70
    move-object v2, p0

    .line 71
    invoke-direct/range {v1 .. v7}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 72
    .line 73
    .line 74
    return-object v1
.end method

.method public Z(Ljava/lang/String;DZ)Ll/wzh0$a;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "DZ)",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/tantanapp/common/data/orm/Filter;->TRUE:Lcom/tantanapp/common/data/orm/Filter;

    .line 2
    .line 3
    if-nez p4, :cond_0

    .line 4
    .line 5
    sget-object p4, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 6
    .line 7
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p4, v0}, Lcom/tantanapp/common/data/orm/OrderedColumn;->REQ(Ljava/lang/Comparable;)Lcom/tantanapp/common/data/orm/Filter;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {p4, v1}, Lcom/tantanapp/common/data/orm/ValueColumn;->NEQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object p4

    .line 23
    filled-new-array {v0, p4}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 24
    .line 25
    .line 26
    move-result-object p4

    .line 27
    invoke-static {p4}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    :cond_0
    new-instance v1, Ll/wzh0$a;

    .line 32
    .line 33
    new-instance p4, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v2, "/filter/messageCreatedTime/greater/than/"

    .line 42
    .line 43
    invoke-virtual {p4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p4, p2, p3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    sget-object p2, Lcom/p1/mobile/putong/core/data/Message;->LOCALINCONVERSATION:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 54
    .line 55
    invoke-virtual {p2}, Lcom/tantanapp/common/data/orm/BooleanColumn;->T()Lcom/tantanapp/common/data/orm/Filter;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    sget-object p3, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 60
    .line 61
    invoke-virtual {p3, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    filled-new-array {p2, p1, v0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    sget-object p1, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 74
    .line 75
    iget-object v5, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 76
    .line 77
    const/4 v6, 0x1

    .line 78
    const/16 v7, 0x64

    .line 79
    .line 80
    move-object v2, p0

    .line 81
    invoke-direct/range {v1 .. v7}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 82
    .line 83
    .line 84
    return-object v1
.end method

.method public a0(Ljava/lang/String;)Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "messagesNotFakeReceivedByAsc/"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 18
    .line 19
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    sget-object v3, Lcom/p1/mobile/putong/core/data/Message;->OWNER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 24
    .line 25
    invoke-virtual {v3, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    sget-object v3, Lcom/p1/mobile/putong/core/data/Message;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 30
    .line 31
    const-string v4, "fake_id_"

    .line 32
    .line 33
    invoke-virtual {v3, v4}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    const-string v5, "fake_private_question_id_"

    .line 38
    .line 39
    invoke-virtual {v3, v5}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    const-string v6, "fake_conversation"

    .line 44
    .line 45
    invoke-virtual {v3, v6}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    filled-new-array {v1, p1, v4, v5, v3}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    sget-object p1, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 58
    .line 59
    iget-object v4, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->ASC:Lcom/tantanapp/common/data/orm/Order;

    .line 60
    .line 61
    const/4 v5, 0x0

    .line 62
    const/16 v6, 0x1e

    .line 63
    .line 64
    move-object v1, p0

    .line 65
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 66
    .line 67
    .line 68
    return-object v0
.end method

.method public b0(Ljava/lang/String;)Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "messagesReceived/"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 18
    .line 19
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    sget-object v3, Lcom/p1/mobile/putong/core/data/Message;->OWNER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 24
    .line 25
    invoke-virtual {v3, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    filled-new-array {v1, p1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    sget-object p1, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 38
    .line 39
    iget-object v4, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 40
    .line 41
    const/4 v5, 0x1

    .line 42
    const/16 v6, 0x1e

    .line 43
    .line 44
    move-object v1, p0

    .line 45
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 46
    .line 47
    .line 48
    return-object v0
.end method

.method public c0(Ljava/lang/String;)Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "messagesReceivedByAsc/"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 18
    .line 19
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    sget-object v3, Lcom/p1/mobile/putong/core/data/Message;->OWNER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 24
    .line 25
    invoke-virtual {v3, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    filled-new-array {v1, p1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    sget-object p1, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 38
    .line 39
    iget-object v4, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->ASC:Lcom/tantanapp/common/data/orm/Order;

    .line 40
    .line 41
    const/4 v5, 0x0

    .line 42
    const/16 v6, 0x1e

    .line 43
    .line 44
    move-object v1, p0

    .line 45
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 46
    .line 47
    .line 48
    return-object v0
.end method

.method public d0(Ljava/lang/String;)Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "messagesReceivedByAsc/"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 18
    .line 19
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    sget-object v3, Lcom/p1/mobile/putong/core/data/Message;->OWNER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 24
    .line 25
    invoke-virtual {v3, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    filled-new-array {v1, p1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    sget-object p1, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 38
    .line 39
    iget-object v4, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->ASC:Lcom/tantanapp/common/data/orm/Order;

    .line 40
    .line 41
    const/4 v5, 0x0

    .line 42
    const/16 v6, 0x1e

    .line 43
    .line 44
    move-object v1, p0

    .line 45
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 46
    .line 47
    .line 48
    return-object v0
.end method

.method public e0(Ljava/lang/String;)Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "messagesSent/"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 18
    .line 19
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->OWNER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v1, v3}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    filled-new-array {p1, v1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    sget-object p1, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 46
    .line 47
    iget-object v4, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 48
    .line 49
    const/4 v5, 0x1

    .line 50
    const/16 v6, 0x1e

    .line 51
    .line 52
    move-object v1, p0

    .line 53
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 54
    .line 55
    .line 56
    return-object v0
.end method

.method public f0(Ljava/lang/String;)Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "messagesSentWithoutLocal/"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 18
    .line 19
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->OWNER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v1, v3}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    sget-object v3, Lcom/p1/mobile/putong/core/data/Message;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 38
    .line 39
    const-string v4, "fake_id_"

    .line 40
    .line 41
    invoke-virtual {v3, v4}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    filled-new-array {p1, v1, v3}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    sget-object p1, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 54
    .line 55
    iget-object v4, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 56
    .line 57
    const/4 v5, 0x1

    .line 58
    const/16 v6, 0x1e

    .line 59
    .line 60
    move-object v1, p0

    .line 61
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 62
    .line 63
    .line 64
    return-object v0
.end method

.method public g0(Ljava/lang/String;)Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "messagesNotFakeSuccessSentByAsc/"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 18
    .line 19
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->OWNER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v1, v3}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    sget-object v3, Lcom/p1/mobile/putong/core/data/Message;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 38
    .line 39
    const-string v4, "fake_id_"

    .line 40
    .line 41
    invoke-virtual {v3, v4}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    const-string v5, "fake_private_question_id_"

    .line 46
    .line 47
    invoke-virtual {v3, v5}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    const-string v6, "fake_conversation"

    .line 52
    .line 53
    invoke-virtual {v3, v6}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    filled-new-array {p1, v1, v4, v5, v3}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    sget-object p1, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 66
    .line 67
    iget-object v4, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->ASC:Lcom/tantanapp/common/data/orm/Order;

    .line 68
    .line 69
    const/4 v5, 0x0

    .line 70
    const/16 v6, 0x1e

    .line 71
    .line 72
    move-object v1, p0

    .line 73
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 74
    .line 75
    .line 76
    return-object v0
.end method

.method public h0(Ljava/lang/String;)Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "messagesSuccessSentByAsc/"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 18
    .line 19
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->OWNER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v1, v3}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    sget-object v3, Lcom/p1/mobile/putong/core/data/Message;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 38
    .line 39
    const-string v4, "fake_id_"

    .line 40
    .line 41
    invoke-virtual {v3, v4}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    filled-new-array {p1, v1, v3}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    sget-object p1, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 54
    .line 55
    iget-object v4, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->ASC:Lcom/tantanapp/common/data/orm/Order;

    .line 56
    .line 57
    const/4 v5, 0x0

    .line 58
    const/16 v6, 0x1e

    .line 59
    .line 60
    move-object v1, p0

    .line 61
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 62
    .line 63
    .line 64
    return-object v0
.end method

.method public i0(Ljava/lang/String;)Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "messagesSuccessSentByDesc/"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 18
    .line 19
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->OWNER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v1, v3}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    sget-object v3, Lcom/p1/mobile/putong/core/data/Message;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 38
    .line 39
    const-string v4, "fake_id_"

    .line 40
    .line 41
    invoke-virtual {v3, v4}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    filled-new-array {p1, v1, v3}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    sget-object p1, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 54
    .line 55
    iget-object v4, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 56
    .line 57
    const/4 v5, 0x0

    .line 58
    const/16 v6, 0x1e

    .line 59
    .line 60
    move-object v1, p0

    .line 61
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 62
    .line 63
    .line 64
    return-object v0
.end method

.method public j0(Ljava/lang/String;)Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "messagesReceived/"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 18
    .line 19
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    sget-object v3, Lcom/p1/mobile/putong/core/data/Message;->OWNER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 24
    .line 25
    invoke-virtual {v3, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    filled-new-array {v1, p1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    sget-object p1, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 38
    .line 39
    iget-object v4, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->ASC:Lcom/tantanapp/common/data/orm/Order;

    .line 40
    .line 41
    const/4 v5, 0x1

    .line 42
    const/16 v6, 0x1e

    .line 43
    .line 44
    move-object v1, p0

    .line 45
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 46
    .line 47
    .line 48
    return-object v0
.end method

.method public k0(Ljava/lang/String;)Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v2, "/with_media"

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->LOCALINCONVERSATION:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/tantanapp/common/data/orm/BooleanColumn;->T()Lcom/tantanapp/common/data/orm/Filter;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    sget-object v3, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 27
    .line 28
    invoke-virtual {v3, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    sget-object v3, Lcom/p1/mobile/putong/core/data/Message;->MEDIA:Lcom/tantanapp/common/data/orm/Column;

    .line 33
    .line 34
    invoke-virtual {v3}, Lcom/tantanapp/common/data/orm/Column;->NOT_NULL()Lcom/tantanapp/common/data/orm/Filter;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    sget-object v4, Lcom/p1/mobile/putong/core/data/Message;->MESSAGETYPE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 39
    .line 40
    const-string v5, "exchange_picture"

    .line 41
    .line 42
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    const-string v6, "limit_time_picture"

    .line 47
    .line 48
    invoke-virtual {v4, v6}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->NEQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    filled-new-array {v1, p1, v3, v5, v4}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    sget-object p1, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 61
    .line 62
    iget-object v4, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 63
    .line 64
    const/4 v5, 0x0

    .line 65
    const/16 v6, 0x3e8

    .line 66
    .line 67
    move-object v1, p0

    .line 68
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 69
    .line 70
    .line 71
    return-object v0
.end method

.method public l0(Ljava/lang/String;)Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "message/withoutfake/"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->LOCALINCONVERSATION:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/tantanapp/common/data/orm/BooleanColumn;->T()Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    sget-object v3, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 24
    .line 25
    invoke-virtual {v3, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    sget-object v3, Lcom/p1/mobile/putong/core/data/Message;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 30
    .line 31
    const-string v4, "fake_private_question_id_"

    .line 32
    .line 33
    invoke-virtual {v3, v4}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    const-string v5, "fake_id_"

    .line 38
    .line 39
    invoke-virtual {v3, v5}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    filled-new-array {v1, p1, v4, v3}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    sget-object p1, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 52
    .line 53
    iget-object v4, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 54
    .line 55
    const/4 v5, 0x1

    .line 56
    const/16 v6, 0x64

    .line 57
    .line 58
    move-object v1, p0

    .line 59
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 60
    .line 61
    .line 62
    return-object v0
.end method

.method public m0(Ljava/lang/String;)Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "message/withoutfakeorother/"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->LOCALINCONVERSATION:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/tantanapp/common/data/orm/BooleanColumn;->T()Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    sget-object v3, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 24
    .line 25
    invoke-virtual {v3, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    sget-object v3, Lcom/p1/mobile/putong/core/data/Message;->OWNER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    invoke-virtual {v3, v4}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    sget-object v4, Lcom/p1/mobile/putong/core/data/Message;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 44
    .line 45
    const-string v5, "fake_private_question_id_"

    .line 46
    .line 47
    invoke-virtual {v4, v5}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    const-string v6, "fake_id_"

    .line 52
    .line 53
    invoke-virtual {v4, v6}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    filled-new-array {v1, p1, v3, v5, v4}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    sget-object p1, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 66
    .line 67
    iget-object v4, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 68
    .line 69
    const/4 v5, 0x1

    .line 70
    const/16 v6, 0x64

    .line 71
    .line 72
    move-object v1, p0

    .line 73
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 74
    .line 75
    .line 76
    return-object v0
.end method

.method public n0(Ljava/lang/String;I)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation

    .line 1
    const/16 v0, 0x14

    .line 2
    .line 3
    if-le p2, v0, :cond_0

    .line 4
    .line 5
    move p2, v0

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    if-ge p2, v0, :cond_1

    .line 8
    .line 9
    move p2, v0

    .line 10
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALINCONVERSATION:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/BooleanColumn;->T()Lcom/tantanapp/common/data/orm/Filter;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 17
    .line 18
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 23
    .line 24
    const-string v2, "fake_"

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    const-string v3, "local_"

    .line 31
    .line 32
    invoke-virtual {v1, v3}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget-object v3, p0, Ll/t600;->o:Lcom/tantanapp/common/data/orm/Filter;

    .line 37
    .line 38
    filled-new-array {v0, p1, v2, v1, v3}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 49
    .line 50
    invoke-virtual {p0, p1, v0, p2}, Ll/wzh0;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0
.end method

.method public o0(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALINCONVERSATION:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/BooleanColumn;->T()Lcom/tantanapp/common/data/orm/Filter;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 8
    .line 9
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->MESSAGETYPE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 14
    .line 15
    invoke-virtual {v1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    filled-new-array {v0, p1, p2}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    sget-object p2, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 28
    .line 29
    iget-object p2, p2, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 30
    .line 31
    const/4 v0, 0x1

    .line 32
    invoke-virtual {p0, p1, p2, v0}, Ll/wzh0;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public p0(Ljava/lang/String;DLjava/lang/String;)Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "D",
            "Ljava/lang/String;",
            ")",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "message/queryMessageByType/"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, "/"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const/16 v2, 0x2f

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->LOCALINCONVERSATION:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 34
    .line 35
    invoke-virtual {v1}, Lcom/tantanapp/common/data/orm/BooleanColumn;->T()Lcom/tantanapp/common/data/orm/Filter;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    sget-object v3, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 40
    .line 41
    invoke-virtual {v3, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    sget-object v3, Lcom/p1/mobile/putong/core/data/Message;->MESSAGETYPE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 46
    .line 47
    invoke-virtual {v3, p4}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 48
    .line 49
    .line 50
    move-result-object p4

    .line 51
    sget-object v3, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 52
    .line 53
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    invoke-virtual {v3, v4}, Lcom/tantanapp/common/data/orm/OrderedColumn;->REQ(Ljava/lang/Comparable;)Lcom/tantanapp/common/data/orm/Filter;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    invoke-virtual {v3, p2}, Lcom/tantanapp/common/data/orm/ValueColumn;->NEQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    filled-new-array {v4, p2}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-static {p2}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    filled-new-array {v1, p1, p4, p2}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iget-object v4, v3, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 86
    .line 87
    const/4 v5, 0x1

    .line 88
    const/16 v6, 0x64

    .line 89
    .line 90
    move-object v1, p0

    .line 91
    move-object v3, p1

    .line 92
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 93
    .line 94
    .line 95
    return-object v0
.end method

.method public q0(Ljava/lang/String;Ljava/lang/String;)Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "message/queryMessageByType/"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, "/"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->LOCALINCONVERSATION:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/tantanapp/common/data/orm/BooleanColumn;->T()Lcom/tantanapp/common/data/orm/Filter;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    sget-object v3, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 32
    .line 33
    invoke-virtual {v3, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    sget-object v3, Lcom/p1/mobile/putong/core/data/Message;->MESSAGETYPE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 38
    .line 39
    invoke-virtual {v3, p2}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    filled-new-array {v1, p1, p2}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    sget-object p1, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 52
    .line 53
    iget-object v4, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 54
    .line 55
    const/4 v5, 0x1

    .line 56
    const/16 v6, 0x64

    .line 57
    .line 58
    move-object v1, p0

    .line 59
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 60
    .line 61
    .line 62
    return-object v0
.end method

.method public r0(Ljava/lang/String;Ljava/lang/String;)Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "message_type_query_"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 21
    .line 22
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->MESSAGETYPE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 27
    .line 28
    invoke-virtual {v1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    filled-new-array {p1, p2}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    sget-object p1, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 41
    .line 42
    iget-object v4, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 43
    .line 44
    const/4 v5, 0x0

    .line 45
    const/16 v6, 0x64

    .line 46
    .line 47
    move-object v1, p0

    .line 48
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 49
    .line 50
    .line 51
    return-object v0
.end method

.method public s0(Ljava/lang/String;)Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "recentReplyMessage"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 18
    .line 19
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->OWNER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v1, v3}, Lcom/tantanapp/common/data/orm/ValueColumn;->NEQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    filled-new-array {p1, v1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    sget-object p1, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 46
    .line 47
    iget-object v4, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 48
    .line 49
    const/4 v5, 0x0

    .line 50
    const/16 v6, 0x64

    .line 51
    .line 52
    move-object v1, p0

    .line 53
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 54
    .line 55
    .line 56
    return-object v0
.end method

.method public t0(Ljava/lang/String;Ljava/lang/String;I)Ll/wzh0$a;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I)",
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">.a;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzh0$a;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "specifyCountMessages"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, "-"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 26
    .line 27
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 32
    .line 33
    const-string v3, "fake_id_"

    .line 34
    .line 35
    invoke-virtual {v1, v3}, Lcom/tantanapp/common/data/orm/StringColumn;->NOT_STARTS_WITH(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    sget-object v3, Lcom/p1/mobile/putong/core/data/Message;->OWNER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 40
    .line 41
    invoke-virtual {v3, p2}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    filled-new-array {p1, v1, p2}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    sget-object p1, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 54
    .line 55
    iget-object v4, p1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 56
    .line 57
    const/4 v5, 0x0

    .line 58
    move-object v1, p0

    .line 59
    move v6, p3

    .line 60
    invoke-direct/range {v0 .. v6}, Ll/wzh0$a;-><init>(Ll/wzh0;Ljava/lang/String;Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;II)V

    .line 61
    .line 62
    .line 63
    return-object v0
.end method

.method public u0(Lcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALNOTIFICATIONSTATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 2
    .line 3
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    filled-new-array {p2}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->LOCALGREETINGID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 16
    .line 17
    invoke-virtual {v1, p3}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    filled-new-array {p3, p1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0, p2, p1}, Ll/wzh0;->update(Ljava/util/List;Lcom/tantanapp/common/data/orm/Filter;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public v0(Ljava/lang/String;)I
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALNOTIFICATIONSTATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 2
    .line 3
    const-string v1, "pending"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "ongoing"

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    filled-new-array {v1, v0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/Filter;->OR([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->OWNER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 24
    .line 25
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    filled-new-array {v0, p1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const/4 v0, -0x1

    .line 38
    invoke-virtual {p0, p1, v0}, Ll/wzh0;->count(Lcom/tantanapp/common/data/orm/Filter;I)I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    return p0
.end method

.method public w0()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALNOTIFICATIONSTATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 2
    .line 3
    const-string v1, "pending"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "ongoing"

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    filled-new-array {v1, v0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/Filter;->OR([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 26
    .line 27
    const/16 v2, 0x3e8

    .line 28
    .line 29
    invoke-virtual {p0, v0, v1, v2}, Ll/wzh0;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public x0(Ljava/lang/String;)I
    .locals 3

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->b()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->OWNER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->NEQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->OWNER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/orm/ValueColumn;->NEQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-string v1, "-11000"

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/orm/ValueColumn;->NEQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string v2, "-11001"

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Lcom/tantanapp/common/data/orm/ValueColumn;->NEQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    filled-new-array {p1, v1, v0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALNOTIFICATIONSTATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 49
    .line 50
    const-string v1, "pending"

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    const-string v2, "ongoing"

    .line 57
    .line 58
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    filled-new-array {v1, v0}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-static {v0}, Lcom/tantanapp/common/data/orm/Filter;->OR([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    filled-new-array {v0, p1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    const/4 v0, -0x1

    .line 79
    invoke-virtual {p0, p1, v0}, Ll/wzh0;->count(Lcom/tantanapp/common/data/orm/Filter;I)I

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    return p0
.end method

.method public y0(Lcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALNOTIFICATIONSTATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 2
    .line 3
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    filled-new-array {p2}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p2, p1}, Ll/wzh0;->update(Ljava/util/List;Lcom/tantanapp/common/data/orm/Filter;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public z0(Lcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALNOTIFICATIONSTATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 2
    .line 3
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    filled-new-array {p2}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    sget-object v1, Lcom/p1/mobile/putong/core/data/Message;->OWNER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 16
    .line 17
    invoke-virtual {v1, p3}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    filled-new-array {p3, p1}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0, p2, p1}, Ll/wzh0;->update(Ljava/util/List;Lcom/tantanapp/common/data/orm/Filter;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
