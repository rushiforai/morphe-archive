.class public final enum Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

.field public static final enum ALL:Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

.field public static final enum NONE:Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

.field public static final enum STICKER_BREAK:Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

.field public static final enum TEXT_BREAK:Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;


# instance fields
.field describe:Ljava/lang/String;

.field value:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;->ALL:Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;->NONE:Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;->TEXT_BREAK:Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;->STICKER_BREAK:Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, v3}, [Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

    .line 2
    .line 3
    const-string v1, "\u5168\u90e8\u6267\u884c"

    .line 4
    .line 5
    const-string v2, "all"

    .line 6
    .line 7
    const-string v3, "ALL"

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;->ALL:Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

    .line 14
    .line 15
    new-instance v0, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

    .line 16
    .line 17
    const-string v1, "\u90fd\u4e0d\u6267\u884c"

    .line 18
    .line 19
    const-string v2, "none"

    .line 20
    .line 21
    const-string v3, "NONE"

    .line 22
    .line 23
    const/4 v4, 0x1

    .line 24
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;->NONE:Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

    .line 28
    .line 29
    new-instance v0, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

    .line 30
    .line 31
    const-string v1, "\u89e6\u53d1\u6587\u5b57\u7834\u51b0"

    .line 32
    .line 33
    const-string v2, "text"

    .line 34
    .line 35
    const-string v3, "TEXT_BREAK"

    .line 36
    .line 37
    const/4 v4, 0x2

    .line 38
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    sput-object v0, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;->TEXT_BREAK:Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

    .line 42
    .line 43
    new-instance v0, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

    .line 44
    .line 45
    const-string v1, "\u89e6\u53d1\u52a8\u56fe\u8868\u60c5\u7834\u51b0"

    .line 46
    .line 47
    const-string v2, "sticker"

    .line 48
    .line 49
    const-string v3, "STICKER_BREAK"

    .line 50
    .line 51
    const/4 v4, 0x3

    .line 52
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    sput-object v0, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;->STICKER_BREAK:Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

    .line 56
    .line 57
    invoke-static {}, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;->$values()[Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    sput-object v0, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;->$VALUES:[Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

    .line 62
    .line 63
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;->describe:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p4, p0, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;->value:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;->$VALUES:[Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;->value:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
