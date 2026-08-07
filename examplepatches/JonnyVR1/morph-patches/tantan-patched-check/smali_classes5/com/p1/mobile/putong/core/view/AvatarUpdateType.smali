.class public final enum Lcom/p1/mobile/putong/core/view/AvatarUpdateType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/core/view/AvatarUpdateType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/core/view/AvatarUpdateType;

.field public static final enum AVATAR:Lcom/p1/mobile/putong/core/view/AvatarUpdateType;


# instance fields
.field private desc:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/core/view/AvatarUpdateType;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateType;->AVATAR:Lcom/p1/mobile/putong/core/view/AvatarUpdateType;

    .line 2
    .line 3
    filled-new-array {v0}, [Lcom/p1/mobile/putong/core/view/AvatarUpdateType;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateType;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "\u5934\u50cf"

    .line 5
    .line 6
    const-string v3, "AVATAR"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/view/AvatarUpdateType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateType;->AVATAR:Lcom/p1/mobile/putong/core/view/AvatarUpdateType;

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/view/AvatarUpdateType;->$values()[Lcom/p1/mobile/putong/core/view/AvatarUpdateType;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateType;->$VALUES:[Lcom/p1/mobile/putong/core/view/AvatarUpdateType;

    .line 18
    .line 19
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/p1/mobile/putong/core/view/AvatarUpdateType;->desc:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/view/AvatarUpdateType;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/view/AvatarUpdateType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/core/view/AvatarUpdateType;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateType;->$VALUES:[Lcom/p1/mobile/putong/core/view/AvatarUpdateType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/core/view/AvatarUpdateType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/core/view/AvatarUpdateType;

    .line 8
    .line 9
    return-object v0
.end method
