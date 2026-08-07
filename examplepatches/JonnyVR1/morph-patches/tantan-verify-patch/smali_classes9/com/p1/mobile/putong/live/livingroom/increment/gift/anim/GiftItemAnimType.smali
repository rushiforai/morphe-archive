.class public abstract enum Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType;

.field public static final enum roomOneTime:Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType;


# instance fields
.field private type:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType;->roomOneTime:Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType;

    .line 2
    .line 3
    filled-new-array {v0}, [Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType;

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
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType$1;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    const-string v3, "roomOneTime"

    .line 6
    .line 7
    invoke-direct {v0, v3, v1, v3, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType$1;-><init>(Ljava/lang/String;ILjava/lang/String;Ll/vtj;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType;->roomOneTime:Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType;

    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType;->$values()[Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType;->$VALUES:[Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType;

    .line 17
    .line 18
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
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType;->type:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ILjava/lang/String;Ll/vtj;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType;->$VALUES:[Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public abstract getController()Ll/qul;
.end method
