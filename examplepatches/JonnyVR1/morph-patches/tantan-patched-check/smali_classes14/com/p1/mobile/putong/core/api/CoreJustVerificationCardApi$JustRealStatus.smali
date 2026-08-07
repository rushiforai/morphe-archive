.class public final enum Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "JustRealStatus"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

.field public static final enum CLICK_RUNNING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

.field public static final enum FINISH:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

.field public static final enum IDLE:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

.field public static final enum PRE_START:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

.field public static final enum RUNNING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

.field public static final enum TRIALING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;


# instance fields
.field public desc:Ljava/lang/String;

.field public started:Z

.field public status:Ljava/lang/String;

.field public step:I


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->IDLE:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->PRE_START:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->TRIALING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->RUNNING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 8
    .line 9
    sget-object v4, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->CLICK_RUNNING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 10
    .line 11
    sget-object v5, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->FINISH:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 12
    .line 13
    filled-new-array/range {v0 .. v5}, [Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 12

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 2
    .line 3
    const/4 v5, 0x0

    .line 4
    const-string v6, "off"

    .line 5
    .line 6
    const-string v1, "IDLE"

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    const/4 v3, 0x0

    .line 10
    const-string v4, "\u521d\u59cb\u72b6\u6001"

    .line 11
    .line 12
    invoke-direct/range {v0 .. v6}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;-><init>(Ljava/lang/String;IILjava/lang/String;ZLjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    sput-object v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->IDLE:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 16
    .line 17
    new-instance v1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 18
    .line 19
    const/4 v6, 0x1

    .line 20
    const-string v7, "trial"

    .line 21
    .line 22
    const-string v2, "PRE_START"

    .line 23
    .line 24
    const/4 v3, 0x1

    .line 25
    const/4 v4, 0x1

    .line 26
    const-string v5, "\u8bd5\u7528\u51c6\u5907\u4e2d"

    .line 27
    .line 28
    invoke-direct/range {v1 .. v7}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;-><init>(Ljava/lang/String;IILjava/lang/String;ZLjava/lang/String;)V

    .line 29
    .line 30
    .line 31
    sput-object v1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->PRE_START:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 32
    .line 33
    new-instance v2, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 34
    .line 35
    const/4 v7, 0x1

    .line 36
    const-string v8, "trial"

    .line 37
    .line 38
    const-string v3, "TRIALING"

    .line 39
    .line 40
    const/4 v4, 0x2

    .line 41
    const/4 v5, 0x2

    .line 42
    const-string v6, "\u8bd5\u7528\u4e2d"

    .line 43
    .line 44
    invoke-direct/range {v2 .. v8}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;-><init>(Ljava/lang/String;IILjava/lang/String;ZLjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sput-object v2, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->TRIALING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 48
    .line 49
    new-instance v3, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 50
    .line 51
    const/4 v8, 0x1

    .line 52
    const-string v9, "on"

    .line 53
    .line 54
    const-string v4, "RUNNING"

    .line 55
    .line 56
    const/4 v5, 0x3

    .line 57
    const/4 v6, 0x3

    .line 58
    const-string v7, "\u8ba4\u8bc1&svip\u7528\u6237\u76f4\u63a5\u4f7f\u7528"

    .line 59
    .line 60
    invoke-direct/range {v3 .. v9}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;-><init>(Ljava/lang/String;IILjava/lang/String;ZLjava/lang/String;)V

    .line 61
    .line 62
    .line 63
    sput-object v3, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->RUNNING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 64
    .line 65
    new-instance v4, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 66
    .line 67
    const/4 v9, 0x1

    .line 68
    const-string v10, "on"

    .line 69
    .line 70
    const-string v5, "CLICK_RUNNING"

    .line 71
    .line 72
    const/4 v6, 0x4

    .line 73
    const/4 v7, 0x4

    .line 74
    const-string v8, "\u8ba4\u8bc1&svip\u7528\u6237\u76f4\u63a5\u4f7f\u7528-\u5de6\u4e0a\u89d2\u70b9\u51fb\u89e6\u53d1\u7684"

    .line 75
    .line 76
    invoke-direct/range {v4 .. v10}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;-><init>(Ljava/lang/String;IILjava/lang/String;ZLjava/lang/String;)V

    .line 77
    .line 78
    .line 79
    sput-object v4, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->CLICK_RUNNING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 80
    .line 81
    new-instance v5, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 82
    .line 83
    const/4 v10, 0x0

    .line 84
    const-string v11, "off"

    .line 85
    .line 86
    const-string v6, "FINISH"

    .line 87
    .line 88
    const/4 v7, 0x5

    .line 89
    const/4 v8, 0x5

    .line 90
    const-string v9, "\u7ed3\u675f"

    .line 91
    .line 92
    invoke-direct/range {v5 .. v11}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;-><init>(Ljava/lang/String;IILjava/lang/String;ZLjava/lang/String;)V

    .line 93
    .line 94
    .line 95
    sput-object v5, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->FINISH:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 96
    .line 97
    invoke-static {}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->$values()[Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    sput-object v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->$VALUES:[Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 102
    .line 103
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IILjava/lang/String;ZLjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Z",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->step:I

    .line 5
    .line 6
    iput-object p4, p0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->desc:Ljava/lang/String;

    .line 7
    .line 8
    iput-boolean p5, p0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->started:Z

    .line 9
    .line 10
    iput-object p6, p0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->status:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->$VALUES:[Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 8
    .line 9
    return-object v0
.end method
