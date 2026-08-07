.class public final enum Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Lcom/google/protobuf/l$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/template/Template;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TemplateType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;",
        ">;",
        "Lcom/google/protobuf/l$c;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

.field public static final enum TP_CHAT_GIFT:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

.field public static final TP_CHAT_GIFT_VALUE:I = 0x3

.field public static final enum TP_CHAT_NORMAL:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

.field public static final TP_CHAT_NORMAL_VALUE:I = 0x2

.field public static final enum TP_DEFAULT:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

.field public static final TP_DEFAULT_VALUE:I = 0x0

.field public static final enum TP_ENTER_NOTICE:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

.field public static final TP_ENTER_NOTICE_VALUE:I = 0x6

.field public static final enum TP_FOLLOW:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

.field public static final TP_FOLLOW_VALUE:I = 0x4

.field public static final enum TP_JAIL:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

.field public static final TP_JAIL_VALUE:I = 0x9

.field public static final enum TP_KICK:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

.field public static final TP_KICK_VALUE:I = 0x8

.field public static final enum TP_OPENLIVE_NOTICE:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

.field public static final TP_OPENLIVE_NOTICE_VALUE:I = 0x5

.field public static final enum TP_PUNISH:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

.field public static final TP_PUNISH_VALUE:I = 0x7

.field public static final enum TP_ROOM_ENTER:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

.field public static final TP_ROOM_ENTER_VALUE:I = 0x1

.field public static final enum UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

.field private static final internalValueMap:Lcom/google/protobuf/l$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$d<",
            "Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final value:I


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;
    .locals 11

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->TP_DEFAULT:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->TP_ROOM_ENTER:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->TP_CHAT_NORMAL:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->TP_CHAT_GIFT:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 8
    .line 9
    sget-object v4, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->TP_FOLLOW:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 10
    .line 11
    sget-object v5, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->TP_OPENLIVE_NOTICE:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 12
    .line 13
    sget-object v6, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->TP_ENTER_NOTICE:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 14
    .line 15
    sget-object v7, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->TP_PUNISH:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 16
    .line 17
    sget-object v8, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->TP_KICK:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 18
    .line 19
    sget-object v9, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->TP_JAIL:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 20
    .line 21
    sget-object v10, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 22
    .line 23
    filled-new-array/range {v0 .. v10}, [Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 2
    .line 3
    const-string v1, "TP_DEFAULT"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->TP_DEFAULT:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 12
    .line 13
    const-string v1, "TP_ROOM_ENTER"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2, v2}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->TP_ROOM_ENTER:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 20
    .line 21
    new-instance v0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 22
    .line 23
    const-string v1, "TP_CHAT_NORMAL"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2, v2}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->TP_CHAT_NORMAL:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 30
    .line 31
    new-instance v0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 32
    .line 33
    const-string v1, "TP_CHAT_GIFT"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2, v2}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->TP_CHAT_GIFT:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 40
    .line 41
    new-instance v0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 42
    .line 43
    const-string v1, "TP_FOLLOW"

    .line 44
    .line 45
    const/4 v2, 0x4

    .line 46
    invoke-direct {v0, v1, v2, v2}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;-><init>(Ljava/lang/String;II)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->TP_FOLLOW:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 50
    .line 51
    new-instance v0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 52
    .line 53
    const-string v1, "TP_OPENLIVE_NOTICE"

    .line 54
    .line 55
    const/4 v2, 0x5

    .line 56
    invoke-direct {v0, v1, v2, v2}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;-><init>(Ljava/lang/String;II)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->TP_OPENLIVE_NOTICE:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 60
    .line 61
    new-instance v0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 62
    .line 63
    const-string v1, "TP_ENTER_NOTICE"

    .line 64
    .line 65
    const/4 v2, 0x6

    .line 66
    invoke-direct {v0, v1, v2, v2}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;-><init>(Ljava/lang/String;II)V

    .line 67
    .line 68
    .line 69
    sput-object v0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->TP_ENTER_NOTICE:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 70
    .line 71
    new-instance v0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 72
    .line 73
    const-string v1, "TP_PUNISH"

    .line 74
    .line 75
    const/4 v2, 0x7

    .line 76
    invoke-direct {v0, v1, v2, v2}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;-><init>(Ljava/lang/String;II)V

    .line 77
    .line 78
    .line 79
    sput-object v0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->TP_PUNISH:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 80
    .line 81
    new-instance v0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 82
    .line 83
    const-string v1, "TP_KICK"

    .line 84
    .line 85
    const/16 v2, 0x8

    .line 86
    .line 87
    invoke-direct {v0, v1, v2, v2}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;-><init>(Ljava/lang/String;II)V

    .line 88
    .line 89
    .line 90
    sput-object v0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->TP_KICK:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 91
    .line 92
    new-instance v0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 93
    .line 94
    const-string v1, "TP_JAIL"

    .line 95
    .line 96
    const/16 v2, 0x9

    .line 97
    .line 98
    invoke-direct {v0, v1, v2, v2}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;-><init>(Ljava/lang/String;II)V

    .line 99
    .line 100
    .line 101
    sput-object v0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->TP_JAIL:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 102
    .line 103
    new-instance v0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 104
    .line 105
    const/16 v1, 0xa

    .line 106
    .line 107
    const/4 v2, -0x1

    .line 108
    const-string v3, "UNRECOGNIZED"

    .line 109
    .line 110
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;-><init>(Ljava/lang/String;II)V

    .line 111
    .line 112
    .line 113
    sput-object v0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 114
    .line 115
    invoke-static {}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->$values()[Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    sput-object v0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->$VALUES:[Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 120
    .line 121
    new-instance v0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType$1;

    .line 122
    .line 123
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType$1;-><init>()V

    .line 124
    .line 125
    .line 126
    sput-object v0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->internalValueMap:Lcom/google/protobuf/l$d;

    .line 127
    .line 128
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
    iput p3, p0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static forNumber(I)Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;
    .locals 0

    .line 1
    packed-switch p0, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0

    .line 6
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->TP_JAIL:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 7
    .line 8
    return-object p0

    .line 9
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->TP_KICK:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 10
    .line 11
    return-object p0

    .line 12
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->TP_PUNISH:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 13
    .line 14
    return-object p0

    .line 15
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->TP_ENTER_NOTICE:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 16
    .line 17
    return-object p0

    .line 18
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->TP_OPENLIVE_NOTICE:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 19
    .line 20
    return-object p0

    .line 21
    :pswitch_5
    sget-object p0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->TP_FOLLOW:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->TP_CHAT_GIFT:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 25
    .line 26
    return-object p0

    .line 27
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->TP_CHAT_NORMAL:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 28
    .line 29
    return-object p0

    .line 30
    :pswitch_8
    sget-object p0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->TP_ROOM_ENTER:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 31
    .line 32
    return-object p0

    .line 33
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->TP_DEFAULT:Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 34
    .line 35
    return-object p0

    .line 36
    nop

    .line 37
    :pswitch_data_0
    .packed-switch 0x0
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

.method public static internalGetValueMap()Lcom/google/protobuf/l$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/l$d<",
            "Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->internalValueMap:Lcom/google/protobuf/l$d;

    .line 2
    .line 3
    return-object v0
.end method

.method public static valueOf(I)Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 10
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->forNumber(I)Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->$VALUES:[Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final getNumber()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/template/Template$TemplateType;->value:I

    .line 2
    .line 3
    return p0
.end method
