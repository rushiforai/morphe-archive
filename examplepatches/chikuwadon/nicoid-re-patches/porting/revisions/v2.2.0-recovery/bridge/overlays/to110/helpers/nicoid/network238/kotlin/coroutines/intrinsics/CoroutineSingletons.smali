.class public final enum Lnicoid/network238/kotlin/coroutines/intrinsics/CoroutineSingletons;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field private static final synthetic $ENTRIES:Lnicoid/network238/kotlin/enums/EnumEntries;

.field private static final synthetic $VALUES:[Lnicoid/network238/kotlin/coroutines/intrinsics/CoroutineSingletons;

.field public static final enum COROUTINE_SUSPENDED:Lnicoid/network238/kotlin/coroutines/intrinsics/CoroutineSingletons;

.field public static final enum RESUMED:Lnicoid/network238/kotlin/coroutines/intrinsics/CoroutineSingletons;

.field public static final enum UNDECIDED:Lnicoid/network238/kotlin/coroutines/intrinsics/CoroutineSingletons;


# direct methods
.method private static final synthetic $values()[Lnicoid/network238/kotlin/coroutines/intrinsics/CoroutineSingletons;
    .registers 3

    sget-object v0, Lnicoid/network238/kotlin/coroutines/intrinsics/CoroutineSingletons;->COROUTINE_SUSPENDED:Lnicoid/network238/kotlin/coroutines/intrinsics/CoroutineSingletons;

    sget-object v1, Lnicoid/network238/kotlin/coroutines/intrinsics/CoroutineSingletons;->UNDECIDED:Lnicoid/network238/kotlin/coroutines/intrinsics/CoroutineSingletons;

    sget-object v2, Lnicoid/network238/kotlin/coroutines/intrinsics/CoroutineSingletons;->RESUMED:Lnicoid/network238/kotlin/coroutines/intrinsics/CoroutineSingletons;

    filled-new-array {v0, v1, v2}, [Lnicoid/network238/kotlin/coroutines/intrinsics/CoroutineSingletons;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 3

    .line 64
    new-instance v0, Lnicoid/network238/kotlin/coroutines/intrinsics/CoroutineSingletons;

    const-string v1, "COROUTINE_SUSPENDED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lnicoid/network238/kotlin/coroutines/intrinsics/CoroutineSingletons;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnicoid/network238/kotlin/coroutines/intrinsics/CoroutineSingletons;->COROUTINE_SUSPENDED:Lnicoid/network238/kotlin/coroutines/intrinsics/CoroutineSingletons;

    new-instance v0, Lnicoid/network238/kotlin/coroutines/intrinsics/CoroutineSingletons;

    const-string v1, "UNDECIDED"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lnicoid/network238/kotlin/coroutines/intrinsics/CoroutineSingletons;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnicoid/network238/kotlin/coroutines/intrinsics/CoroutineSingletons;->UNDECIDED:Lnicoid/network238/kotlin/coroutines/intrinsics/CoroutineSingletons;

    new-instance v0, Lnicoid/network238/kotlin/coroutines/intrinsics/CoroutineSingletons;

    const-string v1, "RESUMED"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lnicoid/network238/kotlin/coroutines/intrinsics/CoroutineSingletons;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnicoid/network238/kotlin/coroutines/intrinsics/CoroutineSingletons;->RESUMED:Lnicoid/network238/kotlin/coroutines/intrinsics/CoroutineSingletons;

    invoke-static {}, Lnicoid/network238/kotlin/coroutines/intrinsics/CoroutineSingletons;->$values()[Lnicoid/network238/kotlin/coroutines/intrinsics/CoroutineSingletons;

    move-result-object v0

    sput-object v0, Lnicoid/network238/kotlin/coroutines/intrinsics/CoroutineSingletons;->$VALUES:[Lnicoid/network238/kotlin/coroutines/intrinsics/CoroutineSingletons;

    invoke-static {v0}, Lnicoid/network238/kotlin/enums/EnumEntriesKt;->enumEntries([Ljava/lang/Enum;)Lnicoid/network238/kotlin/enums/EnumEntries;

    move-result-object v0

    sput-object v0, Lnicoid/network238/kotlin/coroutines/intrinsics/CoroutineSingletons;->$ENTRIES:Lnicoid/network238/kotlin/enums/EnumEntries;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3

    .line 62
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method
