.class public final enum Lkotlin/script/experimental/dependencies/ScriptReport$Severity;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkotlin/script/experimental/dependencies/ScriptReport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Severity"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lkotlin/script/experimental/dependencies/ScriptReport$Severity;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\u0007\u0008\u0086\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002j\u0002\u0008\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005j\u0002\u0008\u0006j\u0002\u0008\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lkotlin/script/experimental/dependencies/ScriptReport$Severity;",
        "",
        "(Ljava/lang/String;I)V",
        "FATAL",
        "ERROR",
        "WARNING",
        "INFO",
        "DEBUG",
        "kotlin-script-runtime"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final synthetic $ENTRIES:Lkotlin/enums/EnumEntries;

.field private static final synthetic $VALUES:[Lkotlin/script/experimental/dependencies/ScriptReport$Severity;

.field public static final enum DEBUG:Lkotlin/script/experimental/dependencies/ScriptReport$Severity;

.field public static final enum ERROR:Lkotlin/script/experimental/dependencies/ScriptReport$Severity;

.field public static final enum FATAL:Lkotlin/script/experimental/dependencies/ScriptReport$Severity;

.field public static final enum INFO:Lkotlin/script/experimental/dependencies/ScriptReport$Severity;

.field public static final enum WARNING:Lkotlin/script/experimental/dependencies/ScriptReport$Severity;


# direct methods
.method private static final synthetic $values()[Lkotlin/script/experimental/dependencies/ScriptReport$Severity;
    .locals 5

    sget-object v0, Lkotlin/script/experimental/dependencies/ScriptReport$Severity;->FATAL:Lkotlin/script/experimental/dependencies/ScriptReport$Severity;

    sget-object v1, Lkotlin/script/experimental/dependencies/ScriptReport$Severity;->ERROR:Lkotlin/script/experimental/dependencies/ScriptReport$Severity;

    sget-object v2, Lkotlin/script/experimental/dependencies/ScriptReport$Severity;->WARNING:Lkotlin/script/experimental/dependencies/ScriptReport$Severity;

    sget-object v3, Lkotlin/script/experimental/dependencies/ScriptReport$Severity;->INFO:Lkotlin/script/experimental/dependencies/ScriptReport$Severity;

    sget-object v4, Lkotlin/script/experimental/dependencies/ScriptReport$Severity;->DEBUG:Lkotlin/script/experimental/dependencies/ScriptReport$Severity;

    filled-new-array {v0, v1, v2, v3, v4}, [Lkotlin/script/experimental/dependencies/ScriptReport$Severity;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lkotlin/script/experimental/dependencies/ScriptReport$Severity;

    .line 2
    .line 3
    const-string v1, "FATAL"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lkotlin/script/experimental/dependencies/ScriptReport$Severity;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lkotlin/script/experimental/dependencies/ScriptReport$Severity;->FATAL:Lkotlin/script/experimental/dependencies/ScriptReport$Severity;

    .line 10
    .line 11
    new-instance v0, Lkotlin/script/experimental/dependencies/ScriptReport$Severity;

    .line 12
    .line 13
    const-string v1, "ERROR"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lkotlin/script/experimental/dependencies/ScriptReport$Severity;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lkotlin/script/experimental/dependencies/ScriptReport$Severity;->ERROR:Lkotlin/script/experimental/dependencies/ScriptReport$Severity;

    .line 20
    .line 21
    new-instance v0, Lkotlin/script/experimental/dependencies/ScriptReport$Severity;

    .line 22
    .line 23
    const-string v1, "WARNING"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Lkotlin/script/experimental/dependencies/ScriptReport$Severity;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lkotlin/script/experimental/dependencies/ScriptReport$Severity;->WARNING:Lkotlin/script/experimental/dependencies/ScriptReport$Severity;

    .line 30
    .line 31
    new-instance v0, Lkotlin/script/experimental/dependencies/ScriptReport$Severity;

    .line 32
    .line 33
    const-string v1, "INFO"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2}, Lkotlin/script/experimental/dependencies/ScriptReport$Severity;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lkotlin/script/experimental/dependencies/ScriptReport$Severity;->INFO:Lkotlin/script/experimental/dependencies/ScriptReport$Severity;

    .line 40
    .line 41
    new-instance v0, Lkotlin/script/experimental/dependencies/ScriptReport$Severity;

    .line 42
    .line 43
    const-string v1, "DEBUG"

    .line 44
    .line 45
    const/4 v2, 0x4

    .line 46
    invoke-direct {v0, v1, v2}, Lkotlin/script/experimental/dependencies/ScriptReport$Severity;-><init>(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lkotlin/script/experimental/dependencies/ScriptReport$Severity;->DEBUG:Lkotlin/script/experimental/dependencies/ScriptReport$Severity;

    .line 50
    .line 51
    invoke-static {}, Lkotlin/script/experimental/dependencies/ScriptReport$Severity;->$values()[Lkotlin/script/experimental/dependencies/ScriptReport$Severity;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    sput-object v0, Lkotlin/script/experimental/dependencies/ScriptReport$Severity;->$VALUES:[Lkotlin/script/experimental/dependencies/ScriptReport$Severity;

    .line 56
    .line 57
    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->a([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    sput-object v0, Lkotlin/script/experimental/dependencies/ScriptReport$Severity;->$ENTRIES:Lkotlin/enums/EnumEntries;

    .line 62
    .line 63
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

.method public static getEntries()Lkotlin/enums/EnumEntries;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/enums/EnumEntries<",
            "Lkotlin/script/experimental/dependencies/ScriptReport$Severity;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    sget-object v0, Lkotlin/script/experimental/dependencies/ScriptReport$Severity;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lkotlin/script/experimental/dependencies/ScriptReport$Severity;
    .locals 1

    const-class v0, Lkotlin/script/experimental/dependencies/ScriptReport$Severity;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lkotlin/script/experimental/dependencies/ScriptReport$Severity;

    return-object p0
.end method

.method public static values()[Lkotlin/script/experimental/dependencies/ScriptReport$Severity;
    .locals 1

    sget-object v0, Lkotlin/script/experimental/dependencies/ScriptReport$Severity;->$VALUES:[Lkotlin/script/experimental/dependencies/ScriptReport$Severity;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lkotlin/script/experimental/dependencies/ScriptReport$Severity;

    return-object v0
.end method
