.class public final enum Lnicoid/network238/kotlin/reflect/KVariance;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field private static final synthetic $ENTRIES:Lnicoid/network238/kotlin/enums/EnumEntries;

.field private static final synthetic $VALUES:[Lnicoid/network238/kotlin/reflect/KVariance;

.field public static final enum IN:Lnicoid/network238/kotlin/reflect/KVariance;

.field public static final enum INVARIANT:Lnicoid/network238/kotlin/reflect/KVariance;

.field public static final enum OUT:Lnicoid/network238/kotlin/reflect/KVariance;


# direct methods
.method private static final synthetic $values()[Lnicoid/network238/kotlin/reflect/KVariance;
    .registers 3

    sget-object v0, Lnicoid/network238/kotlin/reflect/KVariance;->INVARIANT:Lnicoid/network238/kotlin/reflect/KVariance;

    sget-object v1, Lnicoid/network238/kotlin/reflect/KVariance;->IN:Lnicoid/network238/kotlin/reflect/KVariance;

    sget-object v2, Lnicoid/network238/kotlin/reflect/KVariance;->OUT:Lnicoid/network238/kotlin/reflect/KVariance;

    filled-new-array {v0, v1, v2}, [Lnicoid/network238/kotlin/reflect/KVariance;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 3

    .line 23
    new-instance v0, Lnicoid/network238/kotlin/reflect/KVariance;

    const-string v1, "INVARIANT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lnicoid/network238/kotlin/reflect/KVariance;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnicoid/network238/kotlin/reflect/KVariance;->INVARIANT:Lnicoid/network238/kotlin/reflect/KVariance;

    .line 28
    new-instance v0, Lnicoid/network238/kotlin/reflect/KVariance;

    const-string v1, "IN"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lnicoid/network238/kotlin/reflect/KVariance;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnicoid/network238/kotlin/reflect/KVariance;->IN:Lnicoid/network238/kotlin/reflect/KVariance;

    .line 33
    new-instance v0, Lnicoid/network238/kotlin/reflect/KVariance;

    const-string v1, "OUT"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lnicoid/network238/kotlin/reflect/KVariance;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnicoid/network238/kotlin/reflect/KVariance;->OUT:Lnicoid/network238/kotlin/reflect/KVariance;

    invoke-static {}, Lnicoid/network238/kotlin/reflect/KVariance;->$values()[Lnicoid/network238/kotlin/reflect/KVariance;

    move-result-object v0

    sput-object v0, Lnicoid/network238/kotlin/reflect/KVariance;->$VALUES:[Lnicoid/network238/kotlin/reflect/KVariance;

    invoke-static {v0}, Lnicoid/network238/kotlin/enums/EnumEntriesKt;->enumEntries([Ljava/lang/Enum;)Lnicoid/network238/kotlin/enums/EnumEntries;

    move-result-object v0

    sput-object v0, Lnicoid/network238/kotlin/reflect/KVariance;->$ENTRIES:Lnicoid/network238/kotlin/enums/EnumEntries;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3

    .line 18
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static values()[Lnicoid/network238/kotlin/reflect/KVariance;
    .registers 1

    sget-object v0, Lnicoid/network238/kotlin/reflect/KVariance;->$VALUES:[Lnicoid/network238/kotlin/reflect/KVariance;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    .line 34
    check-cast v0, [Lnicoid/network238/kotlin/reflect/KVariance;

    return-object v0
.end method
