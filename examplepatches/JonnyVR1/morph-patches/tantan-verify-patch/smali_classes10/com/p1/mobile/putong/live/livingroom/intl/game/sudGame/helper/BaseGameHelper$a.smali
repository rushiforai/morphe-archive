.class public Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->t(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$a;->b:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$a;->a:J

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$a;->b:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$ErrorEnum;->GET_CODE_ERROR:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$ErrorEnum;

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->c(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$ErrorEnum;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onSuccess(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$a;->b:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->b(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$a;->a:J

    .line 10
    .line 11
    sget-wide v2, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->j:J

    .line 12
    .line 13
    cmp-long v2, v0, v2

    .line 14
    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$a;->b:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;

    .line 19
    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->a:Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    invoke-static {p0, v2, v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->d(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;Lcom/p1/mobile/android/app/Act;JLjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    :goto_0
    return-void
.end method
