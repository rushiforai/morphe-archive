.class public final enum Lcom/immomo/molive/apm/temp/TempSummary$TempType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/molive/apm/temp/TempSummary;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TempType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/immomo/molive/apm/temp/TempSummary$TempType;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\t\u0008\u0086\u0001\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002j\u0002\u0008\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005j\u0002\u0008\u0006j\u0002\u0008\u0007j\u0002\u0008\u0008j\u0002\u0008\t\u00a8\u0006\n"
    }
    d2 = {
        "Lcom/immomo/molive/apm/temp/TempSummary$TempType;",
        "",
        "(Ljava/lang/String;I)V",
        "CPU",
        "BATTERY",
        "GPU",
        "MODEM",
        "SKIN",
        "MEMORY",
        "POWER_SUPPLY",
        "apm-tracer_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/immomo/molive/apm/temp/TempSummary$TempType;

.field public static final enum BATTERY:Lcom/immomo/molive/apm/temp/TempSummary$TempType;

.field public static final enum CPU:Lcom/immomo/molive/apm/temp/TempSummary$TempType;

.field public static final enum GPU:Lcom/immomo/molive/apm/temp/TempSummary$TempType;

.field public static final enum MEMORY:Lcom/immomo/molive/apm/temp/TempSummary$TempType;

.field public static final enum MODEM:Lcom/immomo/molive/apm/temp/TempSummary$TempType;

.field public static final enum POWER_SUPPLY:Lcom/immomo/molive/apm/temp/TempSummary$TempType;

.field public static final enum SKIN:Lcom/immomo/molive/apm/temp/TempSummary$TempType;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    new-instance v0, Lcom/immomo/molive/apm/temp/TempSummary$TempType;

    const-string v1, "CPU"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/immomo/molive/apm/temp/TempSummary$TempType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/immomo/molive/apm/temp/TempSummary$TempType;->CPU:Lcom/immomo/molive/apm/temp/TempSummary$TempType;

    new-instance v1, Lcom/immomo/molive/apm/temp/TempSummary$TempType;

    const-string v2, "BATTERY"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lcom/immomo/molive/apm/temp/TempSummary$TempType;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/immomo/molive/apm/temp/TempSummary$TempType;->BATTERY:Lcom/immomo/molive/apm/temp/TempSummary$TempType;

    new-instance v2, Lcom/immomo/molive/apm/temp/TempSummary$TempType;

    const-string v3, "GPU"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Lcom/immomo/molive/apm/temp/TempSummary$TempType;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/immomo/molive/apm/temp/TempSummary$TempType;->GPU:Lcom/immomo/molive/apm/temp/TempSummary$TempType;

    new-instance v3, Lcom/immomo/molive/apm/temp/TempSummary$TempType;

    const-string v4, "MODEM"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Lcom/immomo/molive/apm/temp/TempSummary$TempType;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/immomo/molive/apm/temp/TempSummary$TempType;->MODEM:Lcom/immomo/molive/apm/temp/TempSummary$TempType;

    new-instance v4, Lcom/immomo/molive/apm/temp/TempSummary$TempType;

    const-string v5, "SKIN"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6}, Lcom/immomo/molive/apm/temp/TempSummary$TempType;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/immomo/molive/apm/temp/TempSummary$TempType;->SKIN:Lcom/immomo/molive/apm/temp/TempSummary$TempType;

    new-instance v5, Lcom/immomo/molive/apm/temp/TempSummary$TempType;

    const-string v6, "MEMORY"

    const/4 v7, 0x5

    invoke-direct {v5, v6, v7}, Lcom/immomo/molive/apm/temp/TempSummary$TempType;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/immomo/molive/apm/temp/TempSummary$TempType;->MEMORY:Lcom/immomo/molive/apm/temp/TempSummary$TempType;

    new-instance v6, Lcom/immomo/molive/apm/temp/TempSummary$TempType;

    const-string v7, "POWER_SUPPLY"

    const/4 v8, 0x6

    invoke-direct {v6, v7, v8}, Lcom/immomo/molive/apm/temp/TempSummary$TempType;-><init>(Ljava/lang/String;I)V

    sput-object v6, Lcom/immomo/molive/apm/temp/TempSummary$TempType;->POWER_SUPPLY:Lcom/immomo/molive/apm/temp/TempSummary$TempType;

    filled-new-array/range {v0 .. v6}, [Lcom/immomo/molive/apm/temp/TempSummary$TempType;

    move-result-object v0

    sput-object v0, Lcom/immomo/molive/apm/temp/TempSummary$TempType;->$VALUES:[Lcom/immomo/molive/apm/temp/TempSummary$TempType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/immomo/molive/apm/temp/TempSummary$TempType;
    .locals 1

    const-class v0, Lcom/immomo/molive/apm/temp/TempSummary$TempType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/immomo/molive/apm/temp/TempSummary$TempType;

    return-object p0
.end method

.method public static values()[Lcom/immomo/molive/apm/temp/TempSummary$TempType;
    .locals 1

    sget-object v0, Lcom/immomo/molive/apm/temp/TempSummary$TempType;->$VALUES:[Lcom/immomo/molive/apm/temp/TempSummary$TempType;

    invoke-virtual {v0}, [Lcom/immomo/molive/apm/temp/TempSummary$TempType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/immomo/molive/apm/temp/TempSummary$TempType;

    return-object v0
.end method
