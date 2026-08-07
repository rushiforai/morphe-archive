.class public final enum Lorg/seamless/util/time/DateRangeOption;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/seamless/util/time/DateRangeOption;",
        ">;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/seamless/util/time/DateRangeOption;

.field public static final enum ALL:Lorg/seamless/util/time/DateRangeOption;

.field public static final enum CUSTOM:Lorg/seamless/util/time/DateRangeOption;

.field public static final enum LAST_MONTH:Lorg/seamless/util/time/DateRangeOption;

.field public static final enum LAST_YEAR:Lorg/seamless/util/time/DateRangeOption;

.field public static final enum MONTH_TO_DATE:Lorg/seamless/util/time/DateRangeOption;

.field public static final enum YEAR_TO_DATE:Lorg/seamless/util/time/DateRangeOption;


# instance fields
.field dateRange:Lorg/seamless/util/time/DateRange;

.field label:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 1
    new-instance v0, Lorg/seamless/util/time/DateRangeOption;

    .line 2
    .line 3
    sget-object v1, Lorg/seamless/util/time/DateRange$Preset;->ALL:Lorg/seamless/util/time/DateRange$Preset;

    .line 4
    .line 5
    invoke-virtual {v1}, Lorg/seamless/util/time/DateRange$Preset;->getDateRange()Lorg/seamless/util/time/DateRange;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "ALL"

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    const-string v4, "All dates"

    .line 13
    .line 14
    invoke-direct {v0, v2, v3, v4, v1}, Lorg/seamless/util/time/DateRangeOption;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/seamless/util/time/DateRange;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lorg/seamless/util/time/DateRangeOption;->ALL:Lorg/seamless/util/time/DateRangeOption;

    .line 18
    .line 19
    new-instance v1, Lorg/seamless/util/time/DateRangeOption;

    .line 20
    .line 21
    sget-object v2, Lorg/seamless/util/time/DateRange$Preset;->MONTH_TO_DATE:Lorg/seamless/util/time/DateRange$Preset;

    .line 22
    .line 23
    invoke-virtual {v2}, Lorg/seamless/util/time/DateRange$Preset;->getDateRange()Lorg/seamless/util/time/DateRange;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const-string v3, "MONTH_TO_DATE"

    .line 28
    .line 29
    const/4 v4, 0x1

    .line 30
    const-string v5, "Month to date"

    .line 31
    .line 32
    invoke-direct {v1, v3, v4, v5, v2}, Lorg/seamless/util/time/DateRangeOption;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/seamless/util/time/DateRange;)V

    .line 33
    .line 34
    .line 35
    sput-object v1, Lorg/seamless/util/time/DateRangeOption;->MONTH_TO_DATE:Lorg/seamless/util/time/DateRangeOption;

    .line 36
    .line 37
    new-instance v2, Lorg/seamless/util/time/DateRangeOption;

    .line 38
    .line 39
    sget-object v3, Lorg/seamless/util/time/DateRange$Preset;->YEAR_TO_DATE:Lorg/seamless/util/time/DateRange$Preset;

    .line 40
    .line 41
    invoke-virtual {v3}, Lorg/seamless/util/time/DateRange$Preset;->getDateRange()Lorg/seamless/util/time/DateRange;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    const-string v4, "YEAR_TO_DATE"

    .line 46
    .line 47
    const/4 v5, 0x2

    .line 48
    const-string v6, "Year to date"

    .line 49
    .line 50
    invoke-direct {v2, v4, v5, v6, v3}, Lorg/seamless/util/time/DateRangeOption;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/seamless/util/time/DateRange;)V

    .line 51
    .line 52
    .line 53
    sput-object v2, Lorg/seamless/util/time/DateRangeOption;->YEAR_TO_DATE:Lorg/seamless/util/time/DateRangeOption;

    .line 54
    .line 55
    new-instance v3, Lorg/seamless/util/time/DateRangeOption;

    .line 56
    .line 57
    sget-object v4, Lorg/seamless/util/time/DateRange$Preset;->LAST_MONTH:Lorg/seamless/util/time/DateRange$Preset;

    .line 58
    .line 59
    invoke-virtual {v4}, Lorg/seamless/util/time/DateRange$Preset;->getDateRange()Lorg/seamless/util/time/DateRange;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    const-string v5, "LAST_MONTH"

    .line 64
    .line 65
    const/4 v6, 0x3

    .line 66
    const-string v7, "Last month"

    .line 67
    .line 68
    invoke-direct {v3, v5, v6, v7, v4}, Lorg/seamless/util/time/DateRangeOption;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/seamless/util/time/DateRange;)V

    .line 69
    .line 70
    .line 71
    sput-object v3, Lorg/seamless/util/time/DateRangeOption;->LAST_MONTH:Lorg/seamless/util/time/DateRangeOption;

    .line 72
    .line 73
    new-instance v4, Lorg/seamless/util/time/DateRangeOption;

    .line 74
    .line 75
    sget-object v5, Lorg/seamless/util/time/DateRange$Preset;->LAST_YEAR:Lorg/seamless/util/time/DateRange$Preset;

    .line 76
    .line 77
    invoke-virtual {v5}, Lorg/seamless/util/time/DateRange$Preset;->getDateRange()Lorg/seamless/util/time/DateRange;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    const-string v6, "LAST_YEAR"

    .line 82
    .line 83
    const/4 v7, 0x4

    .line 84
    const-string v8, "Last year"

    .line 85
    .line 86
    invoke-direct {v4, v6, v7, v8, v5}, Lorg/seamless/util/time/DateRangeOption;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/seamless/util/time/DateRange;)V

    .line 87
    .line 88
    .line 89
    sput-object v4, Lorg/seamless/util/time/DateRangeOption;->LAST_YEAR:Lorg/seamless/util/time/DateRangeOption;

    .line 90
    .line 91
    new-instance v5, Lorg/seamless/util/time/DateRangeOption;

    .line 92
    .line 93
    const-string v6, "Custom dates"

    .line 94
    .line 95
    const/4 v7, 0x0

    .line 96
    const-string v8, "CUSTOM"

    .line 97
    .line 98
    const/4 v9, 0x5

    .line 99
    invoke-direct {v5, v8, v9, v6, v7}, Lorg/seamless/util/time/DateRangeOption;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/seamless/util/time/DateRange;)V

    .line 100
    .line 101
    .line 102
    sput-object v5, Lorg/seamless/util/time/DateRangeOption;->CUSTOM:Lorg/seamless/util/time/DateRangeOption;

    .line 103
    .line 104
    filled-new-array/range {v0 .. v5}, [Lorg/seamless/util/time/DateRangeOption;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    sput-object v0, Lorg/seamless/util/time/DateRangeOption;->$VALUES:[Lorg/seamless/util/time/DateRangeOption;

    .line 109
    .line 110
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Lorg/seamless/util/time/DateRange;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/seamless/util/time/DateRange;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lorg/seamless/util/time/DateRangeOption;->label:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p4, p0, Lorg/seamless/util/time/DateRangeOption;->dateRange:Lorg/seamless/util/time/DateRange;

    .line 7
    .line 8
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/seamless/util/time/DateRangeOption;
    .locals 1

    .line 1
    const-class v0, Lorg/seamless/util/time/DateRangeOption;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/seamless/util/time/DateRangeOption;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lorg/seamless/util/time/DateRangeOption;
    .locals 1

    .line 1
    sget-object v0, Lorg/seamless/util/time/DateRangeOption;->$VALUES:[Lorg/seamless/util/time/DateRangeOption;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lorg/seamless/util/time/DateRangeOption;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lorg/seamless/util/time/DateRangeOption;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getDateRange()Lorg/seamless/util/time/DateRange;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/seamless/util/time/DateRangeOption;->dateRange:Lorg/seamless/util/time/DateRange;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLabel()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/seamless/util/time/DateRangeOption;->label:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
