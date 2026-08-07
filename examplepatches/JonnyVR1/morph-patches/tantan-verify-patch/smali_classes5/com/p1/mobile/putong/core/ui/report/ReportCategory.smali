.class final enum Lcom/p1/mobile/putong/core/ui/report/ReportCategory;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/core/ui/report/ReportCategory;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

.field public static final enum EXPLICIT:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

.field public static final enum FAKE_ACCOUNT:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

.field public static final enum FRAUD:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

.field public static final enum OTHER:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

.field public static final enum PROFANITY:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

.field public static final enum RECOMMEND:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

.field public static final enum SPAM:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

.field public static final enum VIOLENCE:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

.field public static final enum YOUNGER:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;


# instance fields
.field public final resId:I


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/core/ui/report/ReportCategory;
    .locals 9

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->FAKE_ACCOUNT:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->SPAM:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->FRAUD:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->EXPLICIT:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 8
    .line 9
    sget-object v4, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->PROFANITY:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 10
    .line 11
    sget-object v5, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->YOUNGER:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 12
    .line 13
    sget-object v6, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->VIOLENCE:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 14
    .line 15
    sget-object v7, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->RECOMMEND:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 16
    .line 17
    sget-object v8, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->OTHER:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 18
    .line 19
    filled-new-array/range {v0 .. v8}, [Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    sget v2, Lcom/p1/mobile/putong/core/R$string;->rm:I

    .line 5
    .line 6
    const-string v3, "FAKE_ACCOUNT"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;-><init>(Ljava/lang/String;II)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->FAKE_ACCOUNT:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 12
    .line 13
    new-instance v0, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    sget v2, Lcom/p1/mobile/putong/core/R$string;->xm:I

    .line 17
    .line 18
    const-string v3, "SPAM"

    .line 19
    .line 20
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;-><init>(Ljava/lang/String;II)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->SPAM:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 24
    .line 25
    new-instance v0, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    sget v2, Lcom/p1/mobile/putong/core/R$string;->sm:I

    .line 29
    .line 30
    const-string v3, "FRAUD"

    .line 31
    .line 32
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;-><init>(Ljava/lang/String;II)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->FRAUD:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 36
    .line 37
    new-instance v0, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 38
    .line 39
    const/4 v1, 0x3

    .line 40
    sget v2, Lcom/p1/mobile/putong/core/R$string;->qm:I

    .line 41
    .line 42
    const-string v3, "EXPLICIT"

    .line 43
    .line 44
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;-><init>(Ljava/lang/String;II)V

    .line 45
    .line 46
    .line 47
    sput-object v0, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->EXPLICIT:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 48
    .line 49
    new-instance v0, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 50
    .line 51
    const/4 v1, 0x4

    .line 52
    sget v2, Lcom/p1/mobile/putong/core/R$string;->vm:I

    .line 53
    .line 54
    const-string v3, "PROFANITY"

    .line 55
    .line 56
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;-><init>(Ljava/lang/String;II)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->PROFANITY:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 60
    .line 61
    new-instance v0, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 62
    .line 63
    const/4 v1, 0x5

    .line 64
    sget v2, Lcom/p1/mobile/putong/core/R$string;->tm:I

    .line 65
    .line 66
    const-string v3, "YOUNGER"

    .line 67
    .line 68
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;-><init>(Ljava/lang/String;II)V

    .line 69
    .line 70
    .line 71
    sput-object v0, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->YOUNGER:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 72
    .line 73
    new-instance v0, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 74
    .line 75
    const/4 v1, 0x6

    .line 76
    sget v2, Lcom/p1/mobile/putong/core/R$string;->ym:I

    .line 77
    .line 78
    const-string v3, "VIOLENCE"

    .line 79
    .line 80
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;-><init>(Ljava/lang/String;II)V

    .line 81
    .line 82
    .line 83
    sput-object v0, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->VIOLENCE:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 84
    .line 85
    new-instance v0, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 86
    .line 87
    const/4 v1, 0x7

    .line 88
    sget v2, Lcom/p1/mobile/putong/core/R$string;->wm:I

    .line 89
    .line 90
    const-string v3, "RECOMMEND"

    .line 91
    .line 92
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;-><init>(Ljava/lang/String;II)V

    .line 93
    .line 94
    .line 95
    sput-object v0, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->RECOMMEND:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 96
    .line 97
    new-instance v0, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 98
    .line 99
    const/16 v1, 0x8

    .line 100
    .line 101
    sget v2, Lcom/p1/mobile/putong/core/R$string;->um:I

    .line 102
    .line 103
    const-string v3, "OTHER"

    .line 104
    .line 105
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;-><init>(Ljava/lang/String;II)V

    .line 106
    .line 107
    .line 108
    sput-object v0, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->OTHER:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 109
    .line 110
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->$values()[Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    sput-object v0, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->$VALUES:[Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 115
    .line 116
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
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->resId:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/report/ReportCategory;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/core/ui/report/ReportCategory;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->$VALUES:[Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public isCategorised()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->OTHER:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 2
    .line 3
    if-eq p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public isGP()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method
