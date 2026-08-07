.class public final enum Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/PartialListOpt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "RefreshReason"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

.field public static final enum CLEAR_OLD_DATA:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

.field public static final enum DO_BEFORE_LIKE:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

.field public static final enum INIT:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

.field public static final enum INSERT_LOCAL_BREAK:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

.field public static final enum INSERT_LOCAL_FINAL:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

.field public static final enum INSERT_USER_CARD:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

.field public static final enum INSERT_USER_SILENTLY:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

.field public static final enum INSERT_VIRTUAL_CARD:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

.field public static final enum NOTIFY_INNER:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

.field public static final enum NOTIFY_OUTER:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

.field public static final enum REMOVE_BY_BIFROST:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

.field public static final enum REMOVE_LOCAL_CARD:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

.field public static final enum REMOVE_TOP:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

.field public static final enum RENDER_DONE:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

.field public static final enum SUGGEST_LOAD:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

.field public static final enum checkCardOnce:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

.field public static final enum clearSuggestedData:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

.field public static final enum debugRefreshLoad:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

.field public static final enum removePeiLiaoUsersByIdIfNeed:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

.field public static final enum removeUserFromSuggested:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

.field public static final enum removeUserWhenOnlineMatchSuccess:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

.field public static final enum removeUsersById:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

.field public static final enum riggerCardGuide:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

.field public static final enum tryRemoveInsertedPicksUser:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;


# instance fields
.field reason:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;
    .locals 25

    .line 1
    sget-object v1, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->INIT:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 2
    .line 3
    sget-object v2, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->RENDER_DONE:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 4
    .line 5
    sget-object v3, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->SUGGEST_LOAD:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 6
    .line 7
    sget-object v4, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->DO_BEFORE_LIKE:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 8
    .line 9
    sget-object v5, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->CLEAR_OLD_DATA:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 10
    .line 11
    sget-object v6, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->INSERT_VIRTUAL_CARD:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 12
    .line 13
    sget-object v7, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->INSERT_USER_CARD:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 14
    .line 15
    sget-object v8, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->NOTIFY_INNER:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 16
    .line 17
    sget-object v9, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->INSERT_LOCAL_BREAK:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 18
    .line 19
    sget-object v10, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->INSERT_LOCAL_FINAL:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 20
    .line 21
    sget-object v11, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->REMOVE_LOCAL_CARD:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 22
    .line 23
    sget-object v12, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->REMOVE_TOP:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 24
    .line 25
    sget-object v13, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->REMOVE_BY_BIFROST:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 26
    .line 27
    sget-object v14, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->INSERT_USER_SILENTLY:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 28
    .line 29
    sget-object v15, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->removeUsersById:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 30
    .line 31
    sget-object v16, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->removePeiLiaoUsersByIdIfNeed:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 32
    .line 33
    sget-object v17, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->removeUserWhenOnlineMatchSuccess:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 34
    .line 35
    sget-object v18, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->clearSuggestedData:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 36
    .line 37
    sget-object v19, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->removeUserFromSuggested:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 38
    .line 39
    sget-object v20, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->tryRemoveInsertedPicksUser:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 40
    .line 41
    sget-object v21, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->checkCardOnce:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 42
    .line 43
    sget-object v22, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->riggerCardGuide:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 44
    .line 45
    sget-object v23, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->NOTIFY_OUTER:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 46
    .line 47
    sget-object v24, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->debugRefreshLoad:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 48
    .line 49
    filled-new-array/range {v1 .. v24}, [Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "init"

    .line 5
    .line 6
    const-string v3, "INIT"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->INIT:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 12
    .line 13
    new-instance v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    const-string v2, "render_done"

    .line 17
    .line 18
    const-string v3, "RENDER_DONE"

    .line 19
    .line 20
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->RENDER_DONE:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 24
    .line 25
    new-instance v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    const-string v2, "suggest_load"

    .line 29
    .line 30
    const-string v3, "SUGGEST_LOAD"

    .line 31
    .line 32
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->SUGGEST_LOAD:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 36
    .line 37
    new-instance v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 38
    .line 39
    const/4 v1, 0x3

    .line 40
    const-string v2, "doBeforeLike"

    .line 41
    .line 42
    const-string v3, "DO_BEFORE_LIKE"

    .line 43
    .line 44
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sput-object v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->DO_BEFORE_LIKE:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 48
    .line 49
    new-instance v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 50
    .line 51
    const/4 v1, 0x4

    .line 52
    const-string v2, "clearOldData"

    .line 53
    .line 54
    const-string v3, "CLEAR_OLD_DATA"

    .line 55
    .line 56
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->CLEAR_OLD_DATA:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 60
    .line 61
    new-instance v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 62
    .line 63
    const/4 v1, 0x5

    .line 64
    const-string v2, "insertVirtualCard"

    .line 65
    .line 66
    const-string v3, "INSERT_VIRTUAL_CARD"

    .line 67
    .line 68
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 69
    .line 70
    .line 71
    sput-object v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->INSERT_VIRTUAL_CARD:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 72
    .line 73
    new-instance v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 74
    .line 75
    const/4 v1, 0x6

    .line 76
    const-string v2, "insertUserCard"

    .line 77
    .line 78
    const-string v3, "INSERT_USER_CARD"

    .line 79
    .line 80
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 81
    .line 82
    .line 83
    sput-object v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->INSERT_USER_CARD:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 84
    .line 85
    new-instance v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 86
    .line 87
    const/4 v1, 0x7

    .line 88
    const-string v2, "notifyInner"

    .line 89
    .line 90
    const-string v3, "NOTIFY_INNER"

    .line 91
    .line 92
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 93
    .line 94
    .line 95
    sput-object v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->NOTIFY_INNER:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 96
    .line 97
    new-instance v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 98
    .line 99
    const/16 v1, 0x8

    .line 100
    .line 101
    const-string v2, "insert_local_break"

    .line 102
    .line 103
    const-string v3, "INSERT_LOCAL_BREAK"

    .line 104
    .line 105
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 106
    .line 107
    .line 108
    sput-object v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->INSERT_LOCAL_BREAK:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 109
    .line 110
    new-instance v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 111
    .line 112
    const/16 v1, 0x9

    .line 113
    .line 114
    const-string v2, "insert_local_final"

    .line 115
    .line 116
    const-string v3, "INSERT_LOCAL_FINAL"

    .line 117
    .line 118
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 119
    .line 120
    .line 121
    sput-object v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->INSERT_LOCAL_FINAL:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 122
    .line 123
    new-instance v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 124
    .line 125
    const/16 v1, 0xa

    .line 126
    .line 127
    const-string v2, "remove_local_card"

    .line 128
    .line 129
    const-string v3, "REMOVE_LOCAL_CARD"

    .line 130
    .line 131
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 132
    .line 133
    .line 134
    sput-object v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->REMOVE_LOCAL_CARD:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 135
    .line 136
    new-instance v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 137
    .line 138
    const/16 v1, 0xb

    .line 139
    .line 140
    const-string v2, "remove_top_card"

    .line 141
    .line 142
    const-string v3, "REMOVE_TOP"

    .line 143
    .line 144
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 145
    .line 146
    .line 147
    sput-object v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->REMOVE_TOP:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 148
    .line 149
    new-instance v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 150
    .line 151
    const/16 v1, 0xc

    .line 152
    .line 153
    const-string v2, "remove_by_bifrost"

    .line 154
    .line 155
    const-string v3, "REMOVE_BY_BIFROST"

    .line 156
    .line 157
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 158
    .line 159
    .line 160
    sput-object v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->REMOVE_BY_BIFROST:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 161
    .line 162
    new-instance v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 163
    .line 164
    const/16 v1, 0xd

    .line 165
    .line 166
    const-string v2, "insertUserSilently"

    .line 167
    .line 168
    const-string v3, "INSERT_USER_SILENTLY"

    .line 169
    .line 170
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 171
    .line 172
    .line 173
    sput-object v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->INSERT_USER_SILENTLY:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 174
    .line 175
    new-instance v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 176
    .line 177
    const-string v1, "removeUsersById"

    .line 178
    .line 179
    const/16 v2, 0xe

    .line 180
    .line 181
    invoke-direct {v0, v1, v2, v1}, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 182
    .line 183
    .line 184
    sput-object v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->removeUsersById:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 185
    .line 186
    new-instance v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 187
    .line 188
    const-string v1, "removePeiLiaoUsersByIdIfNeed"

    .line 189
    .line 190
    const/16 v2, 0xf

    .line 191
    .line 192
    invoke-direct {v0, v1, v2, v1}, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 193
    .line 194
    .line 195
    sput-object v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->removePeiLiaoUsersByIdIfNeed:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 196
    .line 197
    new-instance v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 198
    .line 199
    const-string v1, "removeUserWhenOnlineMatchSuccess"

    .line 200
    .line 201
    const/16 v2, 0x10

    .line 202
    .line 203
    invoke-direct {v0, v1, v2, v1}, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 204
    .line 205
    .line 206
    sput-object v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->removeUserWhenOnlineMatchSuccess:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 207
    .line 208
    new-instance v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 209
    .line 210
    const-string v1, "clearSuggestedData"

    .line 211
    .line 212
    const/16 v2, 0x11

    .line 213
    .line 214
    invoke-direct {v0, v1, v2, v1}, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 215
    .line 216
    .line 217
    sput-object v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->clearSuggestedData:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 218
    .line 219
    new-instance v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 220
    .line 221
    const-string v1, "removeUserFromSuggested"

    .line 222
    .line 223
    const/16 v2, 0x12

    .line 224
    .line 225
    invoke-direct {v0, v1, v2, v1}, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 226
    .line 227
    .line 228
    sput-object v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->removeUserFromSuggested:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 229
    .line 230
    new-instance v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 231
    .line 232
    const-string v1, "tryRemoveInsertedPicksUser"

    .line 233
    .line 234
    const/16 v2, 0x13

    .line 235
    .line 236
    invoke-direct {v0, v1, v2, v1}, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 237
    .line 238
    .line 239
    sput-object v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->tryRemoveInsertedPicksUser:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 240
    .line 241
    new-instance v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 242
    .line 243
    const-string v1, "checkCardOnce"

    .line 244
    .line 245
    const/16 v2, 0x14

    .line 246
    .line 247
    invoke-direct {v0, v1, v2, v1}, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 248
    .line 249
    .line 250
    sput-object v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->checkCardOnce:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 251
    .line 252
    new-instance v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 253
    .line 254
    const-string v1, "riggerCardGuide"

    .line 255
    .line 256
    const/16 v2, 0x15

    .line 257
    .line 258
    invoke-direct {v0, v1, v2, v1}, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 259
    .line 260
    .line 261
    sput-object v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->riggerCardGuide:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 262
    .line 263
    new-instance v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 264
    .line 265
    const-string v1, "NOTIFY_OUTER"

    .line 266
    .line 267
    const/16 v2, 0x16

    .line 268
    .line 269
    invoke-direct {v0, v1, v2, v1}, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 270
    .line 271
    .line 272
    sput-object v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->NOTIFY_OUTER:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 273
    .line 274
    new-instance v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 275
    .line 276
    const-string v1, "debugRefreshLoad"

    .line 277
    .line 278
    const/16 v2, 0x17

    .line 279
    .line 280
    invoke-direct {v0, v1, v2, v1}, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 281
    .line 282
    .line 283
    sput-object v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->debugRefreshLoad:Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 284
    .line 285
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->$values()[Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    sput-object v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->$VALUES:[Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 290
    .line 291
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->reason:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->$VALUES:[Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getReason()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PartialListOpt$RefreshReason;->reason:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
