.class public synthetic Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1009
    name = null
.end annotation


# static fields
.field public static final synthetic a:[I

.field public static final synthetic b:[I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/VirtualCardType;->values()[Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v0, v0

    .line 6
    new-array v0, v0, [I

    .line 7
    .line 8
    sput-object v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$a;->b:[I

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    :try_start_0
    sget-object v2, Lcom/p1/mobile/putong/core/data/VirtualCardType;->OnlineMatchBroadcastCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 12
    .line 13
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    aput v1, v0, v2
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    :catch_0
    const/4 v0, 0x2

    .line 20
    :try_start_1
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$a;->b:[I

    .line 21
    .line 22
    sget-object v3, Lcom/p1/mobile/putong/core/data/VirtualCardType;->FourSelectOneAdCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 23
    .line 24
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    aput v0, v2, v3
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    .line 29
    .line 30
    :catch_1
    const/4 v2, 0x3

    .line 31
    :try_start_2
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$a;->b:[I

    .line 32
    .line 33
    sget-object v4, Lcom/p1/mobile/putong/core/data/VirtualCardType;->SuperlikeGuideCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 34
    .line 35
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    aput v2, v3, v4
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    .line 40
    .line 41
    :catch_2
    :try_start_3
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$a;->b:[I

    .line 42
    .line 43
    sget-object v4, Lcom/p1/mobile/putong/core/data/VirtualCardType;->UndoGuideCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 44
    .line 45
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    const/4 v5, 0x4

    .line 50
    aput v5, v3, v4
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    .line 51
    .line 52
    :catch_3
    :try_start_4
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$a;->b:[I

    .line 53
    .line 54
    sget-object v4, Lcom/p1/mobile/putong/core/data/VirtualCardType;->ImpressSignalCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 55
    .line 56
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    const/4 v5, 0x5

    .line 61
    aput v5, v3, v4
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    .line 62
    .line 63
    :catch_4
    :try_start_5
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$a;->b:[I

    .line 64
    .line 65
    sget-object v4, Lcom/p1/mobile/putong/core/data/VirtualCardType;->AdCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 66
    .line 67
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    const/4 v5, 0x6

    .line 72
    aput v5, v3, v4
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    .line 73
    .line 74
    :catch_5
    :try_start_6
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$a;->b:[I

    .line 75
    .line 76
    sget-object v4, Lcom/p1/mobile/putong/core/data/VirtualCardType;->LiveLivingCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 77
    .line 78
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    const/4 v5, 0x7

    .line 83
    aput v5, v3, v4
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_6

    .line 84
    .line 85
    :catch_6
    :try_start_7
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$a;->b:[I

    .line 86
    .line 87
    sget-object v4, Lcom/p1/mobile/putong/core/data/VirtualCardType;->LiveVoiceCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 88
    .line 89
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    const/16 v5, 0x8

    .line 94
    .line 95
    aput v5, v3, v4
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_7

    .line 96
    .line 97
    :catch_7
    :try_start_8
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$a;->b:[I

    .line 98
    .line 99
    sget-object v4, Lcom/p1/mobile/putong/core/data/VirtualCardType;->LiveMultipleCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 100
    .line 101
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 102
    .line 103
    .line 104
    move-result v4

    .line 105
    const/16 v5, 0x9

    .line 106
    .line 107
    aput v5, v3, v4
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_8

    .line 108
    .line 109
    :catch_8
    :try_start_9
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$a;->b:[I

    .line 110
    .line 111
    sget-object v4, Lcom/p1/mobile/putong/core/data/VirtualCardType;->LiveVoiceNewCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 112
    .line 113
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 114
    .line 115
    .line 116
    move-result v4

    .line 117
    const/16 v5, 0xa

    .line 118
    .line 119
    aput v5, v3, v4
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_9

    .line 120
    .line 121
    :catch_9
    :try_start_a
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$a;->b:[I

    .line 122
    .line 123
    sget-object v4, Lcom/p1/mobile/putong/core/data/VirtualCardType;->LiveVoiceRoomCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 124
    .line 125
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 126
    .line 127
    .line 128
    move-result v4

    .line 129
    const/16 v5, 0xb

    .line 130
    .line 131
    aput v5, v3, v4
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_a

    .line 132
    .line 133
    :catch_a
    :try_start_b
    sget-object v3, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$a;->b:[I

    .line 134
    .line 135
    sget-object v4, Lcom/p1/mobile/putong/core/data/VirtualCardType;->IceBreakQuestionOfflineCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 136
    .line 137
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 138
    .line 139
    .line 140
    move-result v4

    .line 141
    const/16 v5, 0xc

    .line 142
    .line 143
    aput v5, v3, v4
    :try_end_b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_b .. :try_end_b} :catch_b

    .line 144
    .line 145
    :catch_b
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SwipeDirection;->values()[Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    array-length v3, v3

    .line 150
    new-array v3, v3, [I

    .line 151
    .line 152
    sput-object v3, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$a;->a:[I

    .line 153
    .line 154
    :try_start_c
    sget-object v4, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 155
    .line 156
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 157
    .line 158
    .line 159
    move-result v4

    .line 160
    aput v1, v3, v4
    :try_end_c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_c} :catch_c

    .line 161
    .line 162
    :catch_c
    :try_start_d
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$a;->a:[I

    .line 163
    .line 164
    sget-object v3, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 165
    .line 166
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    .line 167
    .line 168
    .line 169
    move-result v3

    .line 170
    aput v0, v1, v3
    :try_end_d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_d .. :try_end_d} :catch_d

    .line 171
    .line 172
    :catch_d
    :try_start_e
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/HomeStatisticsHelper$a;->a:[I

    .line 173
    .line 174
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 175
    .line 176
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 177
    .line 178
    .line 179
    move-result v1

    .line 180
    aput v2, v0, v1
    :try_end_e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_e .. :try_end_e} :catch_e

    .line 181
    .line 182
    :catch_e
    return-void
.end method
