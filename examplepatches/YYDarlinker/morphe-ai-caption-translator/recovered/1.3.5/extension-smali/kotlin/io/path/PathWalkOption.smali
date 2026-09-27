.class public final enum Lkotlin/io/path/PathWalkOption;
.super Ljava/lang/Enum;
.source "PathWalkOption.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lkotlin/io/path/PathWalkOption;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0087\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\t\u0008B\u00a2\u0006\u0004\u0008\u0002\u0010\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005j\u0002\u0008\u0006\u00ca\u0001\u0010\u0008\u0008\u0012\u000c\u0008\t\u0012\u0008\u0008\u000cJ\u0004\u0008\t0\n\u00ca\u0001\u000c\u0008\u000b\u0012\u0008\u0008\u000c\u0012\u0004\u0008\u0008(\r\u00a8\u0006\u0007"
    }
    d2 = {
        "Lkotlin/io/path/PathWalkOption;",
        "",
        "<init>",
        "(Ljava/lang/String;I)V",
        "INCLUDE_DIRECTORIES",
        "BREADTH_FIRST",
        "FOLLOW_LINKS",
        "kotlin-stdlib-jdk7",
        "Lkotlin/WasExperimental;",
        "markerClass",
        "Lkotlin/io/path/ExperimentalPathApi;",
        "Lkotlin/SinceKotlin;",
        "version",
        "2.1"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final synthetic $ENTRIES:Lkotlin/enums/EnumEntries;

.field private static final synthetic $VALUES:[Lkotlin/io/path/PathWalkOption;

.field public static final enum BREADTH_FIRST:Lkotlin/io/path/PathWalkOption;

.field public static final enum FOLLOW_LINKS:Lkotlin/io/path/PathWalkOption;

.field public static final enum INCLUDE_DIRECTORIES:Lkotlin/io/path/PathWalkOption;


# direct methods
.method private static final synthetic $values()[Lkotlin/io/path/PathWalkOption;
    .registers 3

    const/4 v0, 0x3

    new-array v0, v0, [Lkotlin/io/path/PathWalkOption;

    sget-object v1, Lkotlin/io/path/PathWalkOption;->INCLUDE_DIRECTORIES:Lkotlin/io/path/PathWalkOption;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lkotlin/io/path/PathWalkOption;->BREADTH_FIRST:Lkotlin/io/path/PathWalkOption;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lkotlin/io/path/PathWalkOption;->FOLLOW_LINKS:Lkotlin/io/path/PathWalkOption;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 3

    .line 57
    new-instance v0, Lkotlin/io/path/PathWalkOption;

    const-string v1, "INCLUDE_DIRECTORIES"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lkotlin/io/path/PathWalkOption;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lkotlin/io/path/PathWalkOption;->INCLUDE_DIRECTORIES:Lkotlin/io/path/PathWalkOption;

    .line 65
    new-instance v0, Lkotlin/io/path/PathWalkOption;

    const-string v1, "BREADTH_FIRST"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lkotlin/io/path/PathWalkOption;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lkotlin/io/path/PathWalkOption;->BREADTH_FIRST:Lkotlin/io/path/PathWalkOption;

    .line 77
    new-instance v0, Lkotlin/io/path/PathWalkOption;

    const-string v1, "FOLLOW_LINKS"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lkotlin/io/path/PathWalkOption;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lkotlin/io/path/PathWalkOption;->FOLLOW_LINKS:Lkotlin/io/path/PathWalkOption;

    invoke-static {}, Lkotlin/io/path/PathWalkOption;->$values()[Lkotlin/io/path/PathWalkOption;

    move-result-object v0

    sput-object v0, Lkotlin/io/path/PathWalkOption;->$VALUES:[Lkotlin/io/path/PathWalkOption;

    check-cast v0, [Ljava/lang/Enum;

    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->enumEntries([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    move-result-object v0

    sput-object v0, Lkotlin/io/path/PathWalkOption;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 48
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static getEntries()Lkotlin/enums/EnumEntries;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/enums/EnumEntries<",
            "Lkotlin/io/path/PathWalkOption;",
            ">;"
        }
    .end annotation

    sget-object v0, Lkotlin/io/path/PathWalkOption;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lkotlin/io/path/PathWalkOption;
    .registers 2

    const-class v0, Lkotlin/io/path/PathWalkOption;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lkotlin/io/path/PathWalkOption;

    return-object p0
.end method

.method public static values()[Lkotlin/io/path/PathWalkOption;
    .registers 1

    sget-object v0, Lkotlin/io/path/PathWalkOption;->$VALUES:[Lkotlin/io/path/PathWalkOption;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lkotlin/io/path/PathWalkOption;

    return-object v0
.end method
