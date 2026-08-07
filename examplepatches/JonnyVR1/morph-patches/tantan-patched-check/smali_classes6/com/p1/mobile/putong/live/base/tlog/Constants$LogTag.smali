.class public final enum Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

.field public static final enum longLinkTrace:Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

.field public static final enum multiLinkTrace:Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

.field public static final enum pkTrace:Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

.field public static final enum playerTrace:Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

.field public static final enum publisherTrace:Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

.field public static final enum trace:Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;


# instance fields
.field public value:I


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;->trace:Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;->playerTrace:Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;->publisherTrace:Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;->pkTrace:Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

    .line 8
    .line 9
    sget-object v4, Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;->multiLinkTrace:Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

    .line 10
    .line 11
    sget-object v5, Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;->longLinkTrace:Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

    .line 12
    .line 13
    filled-new-array/range {v0 .. v5}, [Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

    .line 2
    .line 3
    const-string v1, "trace"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;->trace:Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

    .line 11
    .line 12
    new-instance v0, Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

    .line 13
    .line 14
    const-string v1, "playerTrace"

    .line 15
    .line 16
    const/4 v2, 0x2

    .line 17
    invoke-direct {v0, v1, v3, v2}, Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;->playerTrace:Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

    .line 21
    .line 22
    new-instance v0, Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

    .line 23
    .line 24
    const-string v1, "publisherTrace"

    .line 25
    .line 26
    const/4 v3, 0x3

    .line 27
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v0, Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;->publisherTrace:Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

    .line 31
    .line 32
    new-instance v0, Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

    .line 33
    .line 34
    const-string v1, "pkTrace"

    .line 35
    .line 36
    const/4 v2, 0x4

    .line 37
    invoke-direct {v0, v1, v3, v2}, Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;-><init>(Ljava/lang/String;II)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;->pkTrace:Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

    .line 41
    .line 42
    new-instance v0, Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

    .line 43
    .line 44
    const-string v1, "multiLinkTrace"

    .line 45
    .line 46
    const/4 v3, 0x5

    .line 47
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;-><init>(Ljava/lang/String;II)V

    .line 48
    .line 49
    .line 50
    sput-object v0, Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;->multiLinkTrace:Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

    .line 51
    .line 52
    new-instance v0, Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

    .line 53
    .line 54
    const-string v1, "longLinkTrace"

    .line 55
    .line 56
    const/4 v2, 0x6

    .line 57
    invoke-direct {v0, v1, v3, v2}, Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;-><init>(Ljava/lang/String;II)V

    .line 58
    .line 59
    .line 60
    sput-object v0, Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;->longLinkTrace:Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

    .line 61
    .line 62
    invoke-static {}, Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;->$values()[Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    sput-object v0, Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;->$VALUES:[Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

    .line 67
    .line 68
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
    iput p3, p0, Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;->$VALUES:[Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/live/base/tlog/Constants$LogTag;

    .line 8
    .line 9
    return-object v0
.end method
