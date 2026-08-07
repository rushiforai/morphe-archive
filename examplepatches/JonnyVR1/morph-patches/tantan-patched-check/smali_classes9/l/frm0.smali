.class public Ll/frm0;
.super Ll/zs2;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/grm0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zs2;-><init>(Ll/at2;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static A1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_VOICE_AUDIENCE:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 6
    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    new-instance v0, Ll/frm0;

    .line 12
    .line 13
    check-cast p0, Ll/grm0;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/frm0;-><init>(Ll/grm0;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method
