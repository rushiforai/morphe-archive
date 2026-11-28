.class public final enum Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/androidx/annotation/InspectableProperty;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ValueType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;",
        ">;"
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\n\u0008\u0086\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005j\u0002\u0008\u0006j\u0002\u0008\u0007j\u0002\u0008\u0008j\u0002\u0008\tj\u0002\u0008\n\u00a8\u0006\u000b"
    }
    d2 = {
        "Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;",
        "",
        "<init>",
        "(Ljava/lang/String;I)V",
        "NONE",
        "INFERRED",
        "INT_ENUM",
        "INT_FLAG",
        "COLOR",
        "GRAVITY",
        "RESOURCE_ID",
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

.field private static final synthetic $VALUES:[Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

.field public static final enum COLOR:Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

.field public static final enum GRAVITY:Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

.field public static final enum INFERRED:Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

.field public static final enum INT_ENUM:Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

.field public static final enum INT_FLAG:Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

.field public static final enum NONE:Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

.field public static final enum RESOURCE_ID:Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;


# direct methods
.method private static final synthetic $values()[Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;
    .registers 7

    sget-object v0, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;->NONE:Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

    sget-object v1, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;->INFERRED:Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

    sget-object v2, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;->INT_ENUM:Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

    sget-object v3, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;->INT_FLAG:Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

    sget-object v4, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;->COLOR:Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

    sget-object v5, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;->GRAVITY:Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

    sget-object v6, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;->RESOURCE_ID:Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

    filled-new-array/range {v0 .. v6}, [Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 3

    .line 131
    new-instance v0, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

    const-string v1, "NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;->NONE:Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

    .line 134
    new-instance v0, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

    const-string v1, "INFERRED"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;->INFERRED:Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

    .line 143
    new-instance v0, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

    const-string v1, "INT_ENUM"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;->INT_ENUM:Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

    .line 152
    new-instance v0, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

    const-string v1, "INT_FLAG"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;->INT_FLAG:Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

    .line 159
    new-instance v0, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

    const-string v1, "COLOR"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;->COLOR:Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

    .line 166
    new-instance v0, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

    const-string v1, "GRAVITY"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;->GRAVITY:Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

    .line 173
    new-instance v0, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

    const-string v1, "RESOURCE_ID"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;->RESOURCE_ID:Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

    invoke-static {}, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;->$values()[Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

    move-result-object v0

    sput-object v0, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;->$VALUES:[Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

    invoke-static {v0}, Lnicoid/network238/kotlin/enums/EnumEntriesKt;->enumEntries([Ljava/lang/Enum;)Lnicoid/network238/kotlin/enums/EnumEntries;

    move-result-object v0

    sput-object v0, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;->$ENTRIES:Lnicoid/network238/kotlin/enums/EnumEntries;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 129
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

    sget-object v0, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;->$ENTRIES:Lnicoid/network238/kotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;
    .registers 2

    const-class v0, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

    return-object p0
.end method

.method public static values()[Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;
    .registers 1

    sget-object v0, Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;->$VALUES:[Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnicoid/network238/androidx/annotation/InspectableProperty$ValueType;

    return-object v0
.end method
