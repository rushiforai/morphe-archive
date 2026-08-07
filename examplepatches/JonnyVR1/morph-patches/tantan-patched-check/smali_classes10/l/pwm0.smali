.class public final synthetic Ll/pwm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ixm0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;


# direct methods
.method public synthetic constructor <init>(Ll/ixm0;Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pwm0;->a:Ll/ixm0;

    iput-object p2, p0, Ll/pwm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pwm0;->a:Ll/ixm0;

    iget-object p0, p0, Ll/pwm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    invoke-static {v0, p0, p1}, Ll/ixm0;->R3(Ll/ixm0;Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method
