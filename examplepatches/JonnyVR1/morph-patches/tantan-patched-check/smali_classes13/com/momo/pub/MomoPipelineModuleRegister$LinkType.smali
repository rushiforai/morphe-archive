.class public final enum Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/pub/MomoPipelineModuleRegister;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LinkType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

.field public static final enum AGORALINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

.field public static final enum MOMORTCLINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

.field public static final enum TXLINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

.field public static final enum VOLCLINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

.field public static final enum WEILALINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;


# direct methods
.method private static synthetic $values()[Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;
    .locals 5

    .line 1
    sget-object v0, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->AGORALINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 2
    .line 3
    sget-object v1, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->WEILALINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 4
    .line 5
    sget-object v2, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->TXLINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 6
    .line 7
    sget-object v3, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->MOMORTCLINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 8
    .line 9
    sget-object v4, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->VOLCLINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 10
    .line 11
    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 2
    .line 3
    const-string v1, "AGORALINK"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->AGORALINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 10
    .line 11
    new-instance v0, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 12
    .line 13
    const-string v1, "WEILALINK"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->WEILALINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 20
    .line 21
    new-instance v0, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 22
    .line 23
    const-string v1, "TXLINK"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->TXLINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 30
    .line 31
    new-instance v0, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 32
    .line 33
    const-string v1, "MOMORTCLINK"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2}, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->MOMORTCLINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 40
    .line 41
    new-instance v0, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 42
    .line 43
    const-string v1, "VOLCLINK"

    .line 44
    .line 45
    const/4 v2, 0x4

    .line 46
    invoke-direct {v0, v1, v2}, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;-><init>(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->VOLCLINK:Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 50
    .line 51
    invoke-static {}, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->$values()[Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    sput-object v0, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->$VALUES:[Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 56
    .line 57
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

.method public static valueOf(Ljava/lang/String;)Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;
    .locals 1

    .line 1
    const-class v0, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->$VALUES:[Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/momo/pub/MomoPipelineModuleRegister$LinkType;

    .line 8
    .line 9
    return-object v0
.end method
