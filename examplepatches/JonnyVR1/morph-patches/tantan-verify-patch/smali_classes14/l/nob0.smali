.class public Ll/nob0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;)Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;
    .locals 2

    .line 1
    sget-object v0, Ll/nob0$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;->a()Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams$PusherMotionEnum;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    aget v0, v0, v1

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    if-eq v0, v1, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    if-eq v0, v1, :cond_0

    .line 18
    .line 19
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;)V

    .line 22
    .line 23
    .line 24
    return-object v0

    .line 25
    :cond_0
    invoke-static {p0}, Ll/ybl0;->r1(Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;)Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_1
    invoke-static {p0}, Ll/ubl0;->p1(Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;)Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method
