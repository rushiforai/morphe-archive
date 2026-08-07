.class final enum Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page$2;
.super Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4011
    name = null
.end annotation


# direct methods
.method private constructor <init>(Ljava/lang/String;I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;-><init>(Ljava/lang/String;ILl/tre;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ILl/tre;)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page$2;-><init>(Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public getHeight()I
    .locals 1

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    sget v0, Ll/qa00;->i:I

    .line 6
    .line 7
    mul-int/lit8 v0, v0, 0x2

    .line 8
    .line 9
    sub-int/2addr p0, v0

    .line 10
    int-to-float p0, p0

    .line 11
    const v0, 0x4062aaab

    .line 12
    .line 13
    .line 14
    div-float/2addr p0, v0

    .line 15
    const/high16 v0, 0x42c00000    # 96.0f

    .line 16
    .line 17
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    int-to-float v0, v0

    .line 22
    sub-float/2addr p0, v0

    .line 23
    const/high16 v0, 0x43bc0000    # 376.0f

    .line 24
    .line 25
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    int-to-float v0, v0

    .line 30
    add-float/2addr p0, v0

    .line 31
    float-to-int p0, p0

    .line 32
    return p0
.end method

.method public getWidth()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method
