.class public abstract enum Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4409
    name = "HolderType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;

.field public static final enum ENTER_ROOM_EFFECT_HOLDER:Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;

.field public static final enum LIST_BOTTOM_HOLDER:Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;->LIST_BOTTOM_HOLDER:Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;->ENTER_ROOM_EFFECT_HOLDER:Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType$1;

    .line 2
    .line 3
    const-string v1, "LIST_BOTTOM_HOLDER"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType$1;-><init>(Ljava/lang/String;ILl/vad0;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;->LIST_BOTTOM_HOLDER:Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;

    .line 11
    .line 12
    new-instance v0, Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType$2;

    .line 13
    .line 14
    const-string v1, "ENTER_ROOM_EFFECT_HOLDER"

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType$2;-><init>(Ljava/lang/String;ILl/vad0;)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;->ENTER_ROOM_EFFECT_HOLDER:Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;->$values()[Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sput-object v0, Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;->$VALUES:[Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;

    .line 27
    .line 28
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 2
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ILl/vad0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;->$VALUES:[Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public abstract getBgColor()Ljava/lang/String;
.end method

.method public abstract getSpanSize()I
.end method
