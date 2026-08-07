.class public final enum Lcom/immomo/push/pb/PbPacketBody$DataCase;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Lcom/google/protobuf/l$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/push/pb/PbPacketBody;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "DataCase"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/immomo/push/pb/PbPacketBody$DataCase;",
        ">;",
        "Lcom/google/protobuf/l$c;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/immomo/push/pb/PbPacketBody$DataCase;

.field public static final enum DATA_NOT_SET:Lcom/immomo/push/pb/PbPacketBody$DataCase;

.field public static final enum DISCONN:Lcom/immomo/push/pb/PbPacketBody$DataCase;

.field public static final enum MSG:Lcom/immomo/push/pb/PbPacketBody$DataCase;

.field public static final enum MSGACK:Lcom/immomo/push/pb/PbPacketBody$DataCase;

.field public static final enum MSGFIN:Lcom/immomo/push/pb/PbPacketBody$DataCase;

.field public static final enum MSGPSH:Lcom/immomo/push/pb/PbPacketBody$DataCase;

.field public static final enum MSGSYN:Lcom/immomo/push/pb/PbPacketBody$DataCase;

.field public static final enum MSGV2:Lcom/immomo/push/pb/PbPacketBody$DataCase;

.field public static final enum NOTIFY:Lcom/immomo/push/pb/PbPacketBody$DataCase;

.field public static final enum NOTIFYV2:Lcom/immomo/push/pb/PbPacketBody$DataCase;

.field public static final enum RET:Lcom/immomo/push/pb/PbPacketBody$DataCase;

.field public static final enum SAUTH:Lcom/immomo/push/pb/PbPacketBody$DataCase;

.field public static final enum SAUTHRET:Lcom/immomo/push/pb/PbPacketBody$DataCase;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .line 1
    new-instance v0, Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 2
    .line 3
    const-string v1, "RET"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x2

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lcom/immomo/push/pb/PbPacketBody$DataCase;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/immomo/push/pb/PbPacketBody$DataCase;->RET:Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 11
    .line 12
    new-instance v1, Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 13
    .line 14
    const-string v4, "SAUTH"

    .line 15
    .line 16
    const/4 v5, 0x1

    .line 17
    const/4 v6, 0x3

    .line 18
    invoke-direct {v1, v4, v5, v6}, Lcom/immomo/push/pb/PbPacketBody$DataCase;-><init>(Ljava/lang/String;II)V

    .line 19
    .line 20
    .line 21
    sput-object v1, Lcom/immomo/push/pb/PbPacketBody$DataCase;->SAUTH:Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 22
    .line 23
    new-instance v4, Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 24
    .line 25
    const-string v5, "SAUTHRET"

    .line 26
    .line 27
    const/4 v7, 0x4

    .line 28
    invoke-direct {v4, v5, v3, v7}, Lcom/immomo/push/pb/PbPacketBody$DataCase;-><init>(Ljava/lang/String;II)V

    .line 29
    .line 30
    .line 31
    sput-object v4, Lcom/immomo/push/pb/PbPacketBody$DataCase;->SAUTHRET:Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 32
    .line 33
    new-instance v3, Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 34
    .line 35
    const-string v5, "MSGPSH"

    .line 36
    .line 37
    const/4 v8, 0x5

    .line 38
    invoke-direct {v3, v5, v6, v8}, Lcom/immomo/push/pb/PbPacketBody$DataCase;-><init>(Ljava/lang/String;II)V

    .line 39
    .line 40
    .line 41
    sput-object v3, Lcom/immomo/push/pb/PbPacketBody$DataCase;->MSGPSH:Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 42
    .line 43
    move-object v5, v4

    .line 44
    new-instance v4, Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 45
    .line 46
    const-string v6, "MSGSYN"

    .line 47
    .line 48
    const/4 v9, 0x6

    .line 49
    invoke-direct {v4, v6, v7, v9}, Lcom/immomo/push/pb/PbPacketBody$DataCase;-><init>(Ljava/lang/String;II)V

    .line 50
    .line 51
    .line 52
    sput-object v4, Lcom/immomo/push/pb/PbPacketBody$DataCase;->MSGSYN:Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 53
    .line 54
    move-object v6, v5

    .line 55
    new-instance v5, Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 56
    .line 57
    const-string v7, "MSGACK"

    .line 58
    .line 59
    const/4 v10, 0x7

    .line 60
    invoke-direct {v5, v7, v8, v10}, Lcom/immomo/push/pb/PbPacketBody$DataCase;-><init>(Ljava/lang/String;II)V

    .line 61
    .line 62
    .line 63
    sput-object v5, Lcom/immomo/push/pb/PbPacketBody$DataCase;->MSGACK:Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 64
    .line 65
    move-object v7, v6

    .line 66
    new-instance v6, Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 67
    .line 68
    const-string v8, "MSGFIN"

    .line 69
    .line 70
    const/16 v11, 0x8

    .line 71
    .line 72
    invoke-direct {v6, v8, v9, v11}, Lcom/immomo/push/pb/PbPacketBody$DataCase;-><init>(Ljava/lang/String;II)V

    .line 73
    .line 74
    .line 75
    sput-object v6, Lcom/immomo/push/pb/PbPacketBody$DataCase;->MSGFIN:Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 76
    .line 77
    move-object v8, v7

    .line 78
    new-instance v7, Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 79
    .line 80
    const-string v9, "DISCONN"

    .line 81
    .line 82
    const/16 v12, 0x9

    .line 83
    .line 84
    invoke-direct {v7, v9, v10, v12}, Lcom/immomo/push/pb/PbPacketBody$DataCase;-><init>(Ljava/lang/String;II)V

    .line 85
    .line 86
    .line 87
    sput-object v7, Lcom/immomo/push/pb/PbPacketBody$DataCase;->DISCONN:Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 88
    .line 89
    move-object v9, v8

    .line 90
    new-instance v8, Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 91
    .line 92
    const-string v10, "MSG"

    .line 93
    .line 94
    const/16 v13, 0xa

    .line 95
    .line 96
    invoke-direct {v8, v10, v11, v13}, Lcom/immomo/push/pb/PbPacketBody$DataCase;-><init>(Ljava/lang/String;II)V

    .line 97
    .line 98
    .line 99
    sput-object v8, Lcom/immomo/push/pb/PbPacketBody$DataCase;->MSG:Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 100
    .line 101
    move-object v10, v9

    .line 102
    new-instance v9, Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 103
    .line 104
    const-string v11, "NOTIFY"

    .line 105
    .line 106
    const/16 v14, 0xb

    .line 107
    .line 108
    invoke-direct {v9, v11, v12, v14}, Lcom/immomo/push/pb/PbPacketBody$DataCase;-><init>(Ljava/lang/String;II)V

    .line 109
    .line 110
    .line 111
    sput-object v9, Lcom/immomo/push/pb/PbPacketBody$DataCase;->NOTIFY:Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 112
    .line 113
    move-object v11, v10

    .line 114
    new-instance v10, Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 115
    .line 116
    const-string v12, "MSGV2"

    .line 117
    .line 118
    const/16 v15, 0xc

    .line 119
    .line 120
    invoke-direct {v10, v12, v13, v15}, Lcom/immomo/push/pb/PbPacketBody$DataCase;-><init>(Ljava/lang/String;II)V

    .line 121
    .line 122
    .line 123
    sput-object v10, Lcom/immomo/push/pb/PbPacketBody$DataCase;->MSGV2:Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 124
    .line 125
    move-object v12, v11

    .line 126
    new-instance v11, Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 127
    .line 128
    const-string v13, "NOTIFYV2"

    .line 129
    .line 130
    const/16 v2, 0xd

    .line 131
    .line 132
    invoke-direct {v11, v13, v14, v2}, Lcom/immomo/push/pb/PbPacketBody$DataCase;-><init>(Ljava/lang/String;II)V

    .line 133
    .line 134
    .line 135
    sput-object v11, Lcom/immomo/push/pb/PbPacketBody$DataCase;->NOTIFYV2:Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 136
    .line 137
    move-object v2, v12

    .line 138
    new-instance v12, Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 139
    .line 140
    const-string v13, "DATA_NOT_SET"

    .line 141
    .line 142
    const/4 v14, 0x0

    .line 143
    invoke-direct {v12, v13, v15, v14}, Lcom/immomo/push/pb/PbPacketBody$DataCase;-><init>(Ljava/lang/String;II)V

    .line 144
    .line 145
    .line 146
    sput-object v12, Lcom/immomo/push/pb/PbPacketBody$DataCase;->DATA_NOT_SET:Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 147
    .line 148
    filled-new-array/range {v0 .. v12}, [Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    sput-object v0, Lcom/immomo/push/pb/PbPacketBody$DataCase;->$VALUES:[Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 153
    .line 154
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/immomo/push/pb/PbPacketBody$DataCase;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static forNumber(I)Lcom/immomo/push/pb/PbPacketBody$DataCase;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    packed-switch p0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return-object p0

    .line 8
    :pswitch_0
    sget-object p0, Lcom/immomo/push/pb/PbPacketBody$DataCase;->NOTIFYV2:Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 9
    .line 10
    return-object p0

    .line 11
    :pswitch_1
    sget-object p0, Lcom/immomo/push/pb/PbPacketBody$DataCase;->MSGV2:Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 12
    .line 13
    return-object p0

    .line 14
    :pswitch_2
    sget-object p0, Lcom/immomo/push/pb/PbPacketBody$DataCase;->NOTIFY:Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 15
    .line 16
    return-object p0

    .line 17
    :pswitch_3
    sget-object p0, Lcom/immomo/push/pb/PbPacketBody$DataCase;->MSG:Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 18
    .line 19
    return-object p0

    .line 20
    :pswitch_4
    sget-object p0, Lcom/immomo/push/pb/PbPacketBody$DataCase;->DISCONN:Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 21
    .line 22
    return-object p0

    .line 23
    :pswitch_5
    sget-object p0, Lcom/immomo/push/pb/PbPacketBody$DataCase;->MSGFIN:Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 24
    .line 25
    return-object p0

    .line 26
    :pswitch_6
    sget-object p0, Lcom/immomo/push/pb/PbPacketBody$DataCase;->MSGACK:Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 27
    .line 28
    return-object p0

    .line 29
    :pswitch_7
    sget-object p0, Lcom/immomo/push/pb/PbPacketBody$DataCase;->MSGSYN:Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 30
    .line 31
    return-object p0

    .line 32
    :pswitch_8
    sget-object p0, Lcom/immomo/push/pb/PbPacketBody$DataCase;->MSGPSH:Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 33
    .line 34
    return-object p0

    .line 35
    :pswitch_9
    sget-object p0, Lcom/immomo/push/pb/PbPacketBody$DataCase;->SAUTHRET:Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 36
    .line 37
    return-object p0

    .line 38
    :pswitch_a
    sget-object p0, Lcom/immomo/push/pb/PbPacketBody$DataCase;->SAUTH:Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 39
    .line 40
    return-object p0

    .line 41
    :pswitch_b
    sget-object p0, Lcom/immomo/push/pb/PbPacketBody$DataCase;->RET:Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 42
    .line 43
    return-object p0

    .line 44
    :cond_0
    sget-object p0, Lcom/immomo/push/pb/PbPacketBody$DataCase;->DATA_NOT_SET:Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 45
    .line 46
    return-object p0

    .line 47
    :pswitch_data_0
    .packed-switch 0x2
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

.method public static valueOf(I)Lcom/immomo/push/pb/PbPacketBody$DataCase;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 10
    invoke-static {p0}, Lcom/immomo/push/pb/PbPacketBody$DataCase;->forNumber(I)Lcom/immomo/push/pb/PbPacketBody$DataCase;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/immomo/push/pb/PbPacketBody$DataCase;
    .locals 1

    .line 1
    const-class v0, Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/immomo/push/pb/PbPacketBody$DataCase;
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/push/pb/PbPacketBody$DataCase;->$VALUES:[Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/immomo/push/pb/PbPacketBody$DataCase;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/immomo/push/pb/PbPacketBody$DataCase;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getNumber()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/push/pb/PbPacketBody$DataCase;->value:I

    .line 2
    .line 3
    return p0
.end method
