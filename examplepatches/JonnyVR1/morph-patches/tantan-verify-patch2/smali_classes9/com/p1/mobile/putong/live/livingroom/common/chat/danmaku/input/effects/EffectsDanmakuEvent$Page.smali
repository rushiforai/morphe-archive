.class public abstract enum Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;

.field public static final enum STORM:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;

.field public static final enum STORM_RULE:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;

.field private static sMaxHeight:I


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;->STORM:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;->STORM_RULE:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;

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
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page$1;

    .line 2
    .line 3
    const-string v1, "STORM"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page$1;-><init>(Ljava/lang/String;ILl/tre;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;->STORM:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;

    .line 11
    .line 12
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page$2;

    .line 13
    .line 14
    const-string v1, "STORM_RULE"

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page$2;-><init>(Ljava/lang/String;ILl/tre;)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;->STORM_RULE:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;->$values()[Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;->$VALUES:[Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;

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

.method public synthetic constructor <init>(Ljava/lang/String;ILl/tre;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static getMaxHeight(Landroid/content/Context;)I
    .locals 5

    .line 1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;->sMaxHeight:I

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget v0, Ll/hac0;->a:I

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    sput p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;->sMaxHeight:I

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;->values()[Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    array-length v0, p0

    .line 22
    const/4 v1, 0x0

    .line 23
    :goto_0
    if-ge v1, v0, :cond_1

    .line 24
    .line 25
    aget-object v2, p0, v1

    .line 26
    .line 27
    sget v3, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;->sMaxHeight:I

    .line 28
    .line 29
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;->getHeight()I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    if-ge v3, v4, :cond_0

    .line 34
    .line 35
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;->getHeight()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    sput v2, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;->sMaxHeight:I

    .line 40
    .line 41
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;->sMaxHeight:I

    .line 45
    .line 46
    return p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;->$VALUES:[Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public abstract synthetic getHeight()I
.end method

.method public abstract synthetic getWidth()I
.end method
