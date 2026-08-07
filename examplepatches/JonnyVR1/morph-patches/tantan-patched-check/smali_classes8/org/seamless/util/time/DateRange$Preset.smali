.class public final enum Lorg/seamless/util/time/DateRange$Preset;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/seamless/util/time/DateRange;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Preset"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/seamless/util/time/DateRange$Preset;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/seamless/util/time/DateRange$Preset;

.field public static final enum ALL:Lorg/seamless/util/time/DateRange$Preset;

.field public static final enum LAST_MONTH:Lorg/seamless/util/time/DateRange$Preset;

.field public static final enum LAST_YEAR:Lorg/seamless/util/time/DateRange$Preset;

.field public static final enum MONTH_TO_DATE:Lorg/seamless/util/time/DateRange$Preset;

.field public static final enum YEAR_TO_DATE:Lorg/seamless/util/time/DateRange$Preset;


# instance fields
.field dateRange:Lorg/seamless/util/time/DateRange;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 1
    new-instance v0, Lorg/seamless/util/time/DateRange$Preset;

    .line 2
    .line 3
    new-instance v1, Lorg/seamless/util/time/DateRange;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v1, v2}, Lorg/seamless/util/time/DateRange;-><init>(Ljava/util/Date;)V

    .line 7
    .line 8
    .line 9
    const-string v2, "ALL"

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    invoke-direct {v0, v2, v3, v1}, Lorg/seamless/util/time/DateRange$Preset;-><init>(Ljava/lang/String;ILorg/seamless/util/time/DateRange;)V

    .line 13
    .line 14
    .line 15
    sput-object v0, Lorg/seamless/util/time/DateRange$Preset;->ALL:Lorg/seamless/util/time/DateRange$Preset;

    .line 16
    .line 17
    new-instance v1, Lorg/seamless/util/time/DateRange$Preset;

    .line 18
    .line 19
    new-instance v2, Lorg/seamless/util/time/DateRange;

    .line 20
    .line 21
    new-instance v4, Ljava/util/Date;

    .line 22
    .line 23
    invoke-static {}, Lorg/seamless/util/time/DateRange;->getCurrentYear()I

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    const/4 v6, 0x1

    .line 28
    invoke-direct {v4, v5, v3, v6}, Ljava/util/Date;-><init>(III)V

    .line 29
    .line 30
    .line 31
    invoke-direct {v2, v4}, Lorg/seamless/util/time/DateRange;-><init>(Ljava/util/Date;)V

    .line 32
    .line 33
    .line 34
    const-string v4, "YEAR_TO_DATE"

    .line 35
    .line 36
    invoke-direct {v1, v4, v6, v2}, Lorg/seamless/util/time/DateRange$Preset;-><init>(Ljava/lang/String;ILorg/seamless/util/time/DateRange;)V

    .line 37
    .line 38
    .line 39
    sput-object v1, Lorg/seamless/util/time/DateRange$Preset;->YEAR_TO_DATE:Lorg/seamless/util/time/DateRange$Preset;

    .line 40
    .line 41
    new-instance v2, Lorg/seamless/util/time/DateRange$Preset;

    .line 42
    .line 43
    new-instance v4, Lorg/seamless/util/time/DateRange;

    .line 44
    .line 45
    new-instance v5, Ljava/util/Date;

    .line 46
    .line 47
    invoke-static {}, Lorg/seamless/util/time/DateRange;->getCurrentYear()I

    .line 48
    .line 49
    .line 50
    move-result v7

    .line 51
    invoke-static {}, Lorg/seamless/util/time/DateRange;->getCurrentMonth()I

    .line 52
    .line 53
    .line 54
    move-result v8

    .line 55
    invoke-direct {v5, v7, v8, v6}, Ljava/util/Date;-><init>(III)V

    .line 56
    .line 57
    .line 58
    invoke-direct {v4, v5}, Lorg/seamless/util/time/DateRange;-><init>(Ljava/util/Date;)V

    .line 59
    .line 60
    .line 61
    const-string v5, "MONTH_TO_DATE"

    .line 62
    .line 63
    const/4 v7, 0x2

    .line 64
    invoke-direct {v2, v5, v7, v4}, Lorg/seamless/util/time/DateRange$Preset;-><init>(Ljava/lang/String;ILorg/seamless/util/time/DateRange;)V

    .line 65
    .line 66
    .line 67
    sput-object v2, Lorg/seamless/util/time/DateRange$Preset;->MONTH_TO_DATE:Lorg/seamless/util/time/DateRange$Preset;

    .line 68
    .line 69
    new-instance v4, Lorg/seamless/util/time/DateRange$Preset;

    .line 70
    .line 71
    new-instance v5, Ljava/util/Date;

    .line 72
    .line 73
    invoke-static {}, Lorg/seamless/util/time/DateRange;->getCurrentYear()I

    .line 74
    .line 75
    .line 76
    move-result v7

    .line 77
    invoke-static {}, Lorg/seamless/util/time/DateRange;->getCurrentMonth()I

    .line 78
    .line 79
    .line 80
    move-result v8

    .line 81
    sub-int/2addr v8, v6

    .line 82
    invoke-direct {v5, v7, v8, v6}, Ljava/util/Date;-><init>(III)V

    .line 83
    .line 84
    .line 85
    invoke-static {v5}, Lorg/seamless/util/time/DateRange;->getMonthOf(Ljava/util/Date;)Lorg/seamless/util/time/DateRange;

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    const-string v7, "LAST_MONTH"

    .line 90
    .line 91
    const/4 v8, 0x3

    .line 92
    invoke-direct {v4, v7, v8, v5}, Lorg/seamless/util/time/DateRange$Preset;-><init>(Ljava/lang/String;ILorg/seamless/util/time/DateRange;)V

    .line 93
    .line 94
    .line 95
    sput-object v4, Lorg/seamless/util/time/DateRange$Preset;->LAST_MONTH:Lorg/seamless/util/time/DateRange$Preset;

    .line 96
    .line 97
    new-instance v5, Lorg/seamless/util/time/DateRange$Preset;

    .line 98
    .line 99
    new-instance v7, Lorg/seamless/util/time/DateRange;

    .line 100
    .line 101
    new-instance v8, Ljava/util/Date;

    .line 102
    .line 103
    invoke-static {}, Lorg/seamless/util/time/DateRange;->getCurrentYear()I

    .line 104
    .line 105
    .line 106
    move-result v9

    .line 107
    sub-int/2addr v9, v6

    .line 108
    invoke-direct {v8, v9, v3, v6}, Ljava/util/Date;-><init>(III)V

    .line 109
    .line 110
    .line 111
    new-instance v3, Ljava/util/Date;

    .line 112
    .line 113
    invoke-static {}, Lorg/seamless/util/time/DateRange;->getCurrentYear()I

    .line 114
    .line 115
    .line 116
    move-result v9

    .line 117
    sub-int/2addr v9, v6

    .line 118
    const/16 v6, 0xb

    .line 119
    .line 120
    const/16 v10, 0x1f

    .line 121
    .line 122
    invoke-direct {v3, v9, v6, v10}, Ljava/util/Date;-><init>(III)V

    .line 123
    .line 124
    .line 125
    invoke-direct {v7, v8, v3}, Lorg/seamless/util/time/DateRange;-><init>(Ljava/util/Date;Ljava/util/Date;)V

    .line 126
    .line 127
    .line 128
    const-string v3, "LAST_YEAR"

    .line 129
    .line 130
    const/4 v6, 0x4

    .line 131
    invoke-direct {v5, v3, v6, v7}, Lorg/seamless/util/time/DateRange$Preset;-><init>(Ljava/lang/String;ILorg/seamless/util/time/DateRange;)V

    .line 132
    .line 133
    .line 134
    sput-object v5, Lorg/seamless/util/time/DateRange$Preset;->LAST_YEAR:Lorg/seamless/util/time/DateRange$Preset;

    .line 135
    .line 136
    filled-new-array {v0, v1, v2, v4, v5}, [Lorg/seamless/util/time/DateRange$Preset;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    sput-object v0, Lorg/seamless/util/time/DateRange$Preset;->$VALUES:[Lorg/seamless/util/time/DateRange$Preset;

    .line 141
    .line 142
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILorg/seamless/util/time/DateRange;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/seamless/util/time/DateRange;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lorg/seamless/util/time/DateRange$Preset;->dateRange:Lorg/seamless/util/time/DateRange;

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/seamless/util/time/DateRange$Preset;
    .locals 1

    .line 1
    const-class v0, Lorg/seamless/util/time/DateRange$Preset;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/seamless/util/time/DateRange$Preset;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lorg/seamless/util/time/DateRange$Preset;
    .locals 1

    .line 1
    sget-object v0, Lorg/seamless/util/time/DateRange$Preset;->$VALUES:[Lorg/seamless/util/time/DateRange$Preset;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lorg/seamless/util/time/DateRange$Preset;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lorg/seamless/util/time/DateRange$Preset;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getDateRange()Lorg/seamless/util/time/DateRange;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/seamless/util/time/DateRange$Preset;->dateRange:Lorg/seamless/util/time/DateRange;

    .line 2
    .line 3
    return-object p0
.end method
