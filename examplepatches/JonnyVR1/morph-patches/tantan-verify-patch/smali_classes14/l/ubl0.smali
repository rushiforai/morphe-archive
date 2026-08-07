.class public Ll/ubl0;
.super Ll/pbl0;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/fcl0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pbl0;-><init>(Ll/fcl0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static p1(Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;)Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;
    .locals 1

    .line 1
    instance-of v0, p0, Ll/fcl0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/ubl0;

    .line 6
    .line 7
    check-cast p0, Ll/fcl0;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/ubl0;-><init>(Ll/fcl0;)V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    sget-object p0, Ll/s610;->d:Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;

    .line 14
    .line 15
    return-object p0
.end method
