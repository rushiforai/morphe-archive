.class public final enum Lnicoid/network238/androidx/annotation/RestrictTo$Scope;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/androidx/annotation/RestrictTo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Scope"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lnicoid/network238/androidx/annotation/RestrictTo$Scope;",
        ">;"
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\t\u0008\u0086\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005j\u0002\u0008\u0006j\u0002\u0008\u0007j\u0002\u0008\u0008j\u0002\u0008\t\u00a8\u0006\n"
    }
    d2 = {
        "Lnicoid/network238/androidx/annotation/RestrictTo$Scope;",
        "",
        "<init>",
        "(Ljava/lang/String;I)V",
        "LIBRARY",
        "LIBRARY_GROUP",
        "LIBRARY_GROUP_PREFIX",
        "GROUP_ID",
        "TESTS",
        "SUBCLASSES",
        "annotation"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final synthetic $ENTRIES:Lnicoid/network238/kotlin/enums/EnumEntries;

.field private static final synthetic $VALUES:[Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

.field public static final enum GROUP_ID:Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

.field public static final enum LIBRARY:Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

.field public static final enum LIBRARY_GROUP:Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

.field public static final enum LIBRARY_GROUP_PREFIX:Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

.field public static final enum SUBCLASSES:Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

.field public static final enum TESTS:Lnicoid/network238/androidx/annotation/RestrictTo$Scope;


# direct methods
.method private static final synthetic $values()[Lnicoid/network238/androidx/annotation/RestrictTo$Scope;
    .registers 6

    sget-object v0, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;->LIBRARY:Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

    sget-object v1, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

    sget-object v2, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP_PREFIX:Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

    sget-object v3, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;->GROUP_ID:Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

    sget-object v4, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;->TESTS:Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

    sget-object v5, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;->SUBCLASSES:Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

    filled-new-array/range {v0 .. v5}, [Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 3

    .line 77
    new-instance v0, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

    const-string v1, "LIBRARY"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;->LIBRARY:Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

    .line 83
    new-instance v0, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

    const-string v1, "LIBRARY_GROUP"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

    .line 93
    new-instance v0, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

    const-string v1, "LIBRARY_GROUP_PREFIX"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP_PREFIX:Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

    .line 101
    new-instance v0, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

    const-string v1, "GROUP_ID"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;->GROUP_ID:Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

    .line 104
    new-instance v0, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

    const-string v1, "TESTS"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;->TESTS:Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

    .line 111
    new-instance v0, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

    const-string v1, "SUBCLASSES"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;->SUBCLASSES:Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

    invoke-static {}, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;->$values()[Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

    move-result-object v0

    sput-object v0, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;->$VALUES:[Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

    invoke-static {v0}, Lnicoid/network238/kotlin/enums/EnumEntriesKt;->enumEntries([Ljava/lang/Enum;)Lnicoid/network238/kotlin/enums/EnumEntries;

    move-result-object v0

    sput-object v0, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;->$ENTRIES:Lnicoid/network238/kotlin/enums/EnumEntries;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 72
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static getEntries()Lnicoid/network238/kotlin/enums/EnumEntries;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lnicoid/network238/kotlin/enums/EnumEntries;"
        }
    .end annotation

    sget-object v0, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;->$ENTRIES:Lnicoid/network238/kotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lnicoid/network238/androidx/annotation/RestrictTo$Scope;
    .registers 2

    const-class v0, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

    return-object p0
.end method

.method public static values()[Lnicoid/network238/androidx/annotation/RestrictTo$Scope;
    .registers 1

    sget-object v0, Lnicoid/network238/androidx/annotation/RestrictTo$Scope;->$VALUES:[Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnicoid/network238/androidx/annotation/RestrictTo$Scope;

    return-object v0
.end method
