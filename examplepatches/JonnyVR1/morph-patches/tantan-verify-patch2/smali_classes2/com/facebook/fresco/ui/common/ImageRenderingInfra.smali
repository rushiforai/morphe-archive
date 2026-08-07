.class public final enum Lcom/facebook/fresco/ui/common/ImageRenderingInfra;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/facebook/fresco/ui/common/ImageRenderingInfra;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\u0007\u0008\u0086\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005j\u0002\u0008\u0006j\u0002\u0008\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/facebook/fresco/ui/common/ImageRenderingInfra;",
        "",
        "<init>",
        "(Ljava/lang/String;I)V",
        "VITO_V2",
        "VITO_V1",
        "DRAWEE",
        "OTHER",
        "ui-common_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final synthetic $ENTRIES:Lkotlin/enums/EnumEntries;

.field private static final synthetic $VALUES:[Lcom/facebook/fresco/ui/common/ImageRenderingInfra;

.field public static final enum DRAWEE:Lcom/facebook/fresco/ui/common/ImageRenderingInfra;

.field public static final enum OTHER:Lcom/facebook/fresco/ui/common/ImageRenderingInfra;

.field public static final enum VITO_V1:Lcom/facebook/fresco/ui/common/ImageRenderingInfra;

.field public static final enum VITO_V2:Lcom/facebook/fresco/ui/common/ImageRenderingInfra;


# direct methods
.method private static final synthetic $values()[Lcom/facebook/fresco/ui/common/ImageRenderingInfra;
    .locals 4

    sget-object v0, Lcom/facebook/fresco/ui/common/ImageRenderingInfra;->VITO_V2:Lcom/facebook/fresco/ui/common/ImageRenderingInfra;

    sget-object v1, Lcom/facebook/fresco/ui/common/ImageRenderingInfra;->VITO_V1:Lcom/facebook/fresco/ui/common/ImageRenderingInfra;

    sget-object v2, Lcom/facebook/fresco/ui/common/ImageRenderingInfra;->DRAWEE:Lcom/facebook/fresco/ui/common/ImageRenderingInfra;

    sget-object v3, Lcom/facebook/fresco/ui/common/ImageRenderingInfra;->OTHER:Lcom/facebook/fresco/ui/common/ImageRenderingInfra;

    filled-new-array {v0, v1, v2, v3}, [Lcom/facebook/fresco/ui/common/ImageRenderingInfra;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/facebook/fresco/ui/common/ImageRenderingInfra;

    .line 2
    .line 3
    const-string v1, "VITO_V2"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/facebook/fresco/ui/common/ImageRenderingInfra;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/facebook/fresco/ui/common/ImageRenderingInfra;->VITO_V2:Lcom/facebook/fresco/ui/common/ImageRenderingInfra;

    .line 10
    .line 11
    new-instance v0, Lcom/facebook/fresco/ui/common/ImageRenderingInfra;

    .line 12
    .line 13
    const-string v1, "VITO_V1"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lcom/facebook/fresco/ui/common/ImageRenderingInfra;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/facebook/fresco/ui/common/ImageRenderingInfra;->VITO_V1:Lcom/facebook/fresco/ui/common/ImageRenderingInfra;

    .line 20
    .line 21
    new-instance v0, Lcom/facebook/fresco/ui/common/ImageRenderingInfra;

    .line 22
    .line 23
    const-string v1, "DRAWEE"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Lcom/facebook/fresco/ui/common/ImageRenderingInfra;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/facebook/fresco/ui/common/ImageRenderingInfra;->DRAWEE:Lcom/facebook/fresco/ui/common/ImageRenderingInfra;

    .line 30
    .line 31
    new-instance v0, Lcom/facebook/fresco/ui/common/ImageRenderingInfra;

    .line 32
    .line 33
    const-string v1, "OTHER"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2}, Lcom/facebook/fresco/ui/common/ImageRenderingInfra;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/facebook/fresco/ui/common/ImageRenderingInfra;->OTHER:Lcom/facebook/fresco/ui/common/ImageRenderingInfra;

    .line 40
    .line 41
    invoke-static {}, Lcom/facebook/fresco/ui/common/ImageRenderingInfra;->$values()[Lcom/facebook/fresco/ui/common/ImageRenderingInfra;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sput-object v0, Lcom/facebook/fresco/ui/common/ImageRenderingInfra;->$VALUES:[Lcom/facebook/fresco/ui/common/ImageRenderingInfra;

    .line 46
    .line 47
    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->a([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    sput-object v0, Lcom/facebook/fresco/ui/common/ImageRenderingInfra;->$ENTRIES:Lkotlin/enums/EnumEntries;

    .line 52
    .line 53
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
            "Lcom/facebook/fresco/ui/common/ImageRenderingInfra;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    sget-object v0, Lcom/facebook/fresco/ui/common/ImageRenderingInfra;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/facebook/fresco/ui/common/ImageRenderingInfra;
    .locals 1

    .line 1
    const-class v0, Lcom/facebook/fresco/ui/common/ImageRenderingInfra;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/facebook/fresco/ui/common/ImageRenderingInfra;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/facebook/fresco/ui/common/ImageRenderingInfra;
    .locals 1

    .line 1
    sget-object v0, Lcom/facebook/fresco/ui/common/ImageRenderingInfra;->$VALUES:[Lcom/facebook/fresco/ui/common/ImageRenderingInfra;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/facebook/fresco/ui/common/ImageRenderingInfra;

    .line 8
    .line 9
    return-object v0
.end method
