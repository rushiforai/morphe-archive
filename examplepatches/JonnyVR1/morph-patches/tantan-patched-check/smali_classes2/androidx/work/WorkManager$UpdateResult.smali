.class public final enum Landroidx/work/WorkManager$UpdateResult;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/work/WorkManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "UpdateResult"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Landroidx/work/WorkManager$UpdateResult;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\u0005\u0008\u0086\u0001\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002j\u0002\u0008\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005\u00a8\u0006\u0006"
    }
    d2 = {
        "Landroidx/work/WorkManager$UpdateResult;",
        "",
        "(Ljava/lang/String;I)V",
        "NOT_APPLIED",
        "APPLIED_IMMEDIATELY",
        "APPLIED_FOR_NEXT_RUN",
        "work-runtime_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroidx/work/WorkManager$UpdateResult;

.field public static final enum APPLIED_FOR_NEXT_RUN:Landroidx/work/WorkManager$UpdateResult;

.field public static final enum APPLIED_IMMEDIATELY:Landroidx/work/WorkManager$UpdateResult;

.field public static final enum NOT_APPLIED:Landroidx/work/WorkManager$UpdateResult;


# direct methods
.method private static final synthetic $values()[Landroidx/work/WorkManager$UpdateResult;
    .locals 3

    sget-object v0, Landroidx/work/WorkManager$UpdateResult;->NOT_APPLIED:Landroidx/work/WorkManager$UpdateResult;

    sget-object v1, Landroidx/work/WorkManager$UpdateResult;->APPLIED_IMMEDIATELY:Landroidx/work/WorkManager$UpdateResult;

    sget-object v2, Landroidx/work/WorkManager$UpdateResult;->APPLIED_FOR_NEXT_RUN:Landroidx/work/WorkManager$UpdateResult;

    filled-new-array {v0, v1, v2}, [Landroidx/work/WorkManager$UpdateResult;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Landroidx/work/WorkManager$UpdateResult;

    .line 2
    .line 3
    const-string v1, "NOT_APPLIED"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Landroidx/work/WorkManager$UpdateResult;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Landroidx/work/WorkManager$UpdateResult;->NOT_APPLIED:Landroidx/work/WorkManager$UpdateResult;

    .line 10
    .line 11
    new-instance v0, Landroidx/work/WorkManager$UpdateResult;

    .line 12
    .line 13
    const-string v1, "APPLIED_IMMEDIATELY"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Landroidx/work/WorkManager$UpdateResult;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Landroidx/work/WorkManager$UpdateResult;->APPLIED_IMMEDIATELY:Landroidx/work/WorkManager$UpdateResult;

    .line 20
    .line 21
    new-instance v0, Landroidx/work/WorkManager$UpdateResult;

    .line 22
    .line 23
    const-string v1, "APPLIED_FOR_NEXT_RUN"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Landroidx/work/WorkManager$UpdateResult;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Landroidx/work/WorkManager$UpdateResult;->APPLIED_FOR_NEXT_RUN:Landroidx/work/WorkManager$UpdateResult;

    .line 30
    .line 31
    invoke-static {}, Landroidx/work/WorkManager$UpdateResult;->$values()[Landroidx/work/WorkManager$UpdateResult;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Landroidx/work/WorkManager$UpdateResult;->$VALUES:[Landroidx/work/WorkManager$UpdateResult;

    .line 36
    .line 37
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

.method public static valueOf(Ljava/lang/String;)Landroidx/work/WorkManager$UpdateResult;
    .locals 1

    const-class v0, Landroidx/work/WorkManager$UpdateResult;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Landroidx/work/WorkManager$UpdateResult;

    return-object p0
.end method

.method public static values()[Landroidx/work/WorkManager$UpdateResult;
    .locals 1

    sget-object v0, Landroidx/work/WorkManager$UpdateResult;->$VALUES:[Landroidx/work/WorkManager$UpdateResult;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroidx/work/WorkManager$UpdateResult;

    return-object v0
.end method
