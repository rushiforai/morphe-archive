.class public Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltech/sud/gip/core/ISudListenerInitSDK;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->p(Lcom/p1/mobile/android/app/Act;JLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:J

.field public final synthetic d:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$b;->d:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$b;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$b;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-wide p4, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$b;->c:J

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onFailure(ILjava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$b;->d:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->q()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v1, "initSDK onFailure:"

    .line 12
    .line 13
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p2, "("

    .line 20
    .line 21
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string p1, ")"

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$b;->d:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;

    .line 40
    .line 41
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$ErrorEnum;->INIT_SDK_ERROR:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$ErrorEnum;

    .line 42
    .line 43
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->c(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$ErrorEnum;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public onSuccess()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$b;->d:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$b;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$b;->b:Ljava/lang/String;

    .line 6
    .line 7
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$b;->c:J

    .line 8
    .line 9
    invoke-static {v0, v1, v2, v3, v4}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->e(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;J)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
