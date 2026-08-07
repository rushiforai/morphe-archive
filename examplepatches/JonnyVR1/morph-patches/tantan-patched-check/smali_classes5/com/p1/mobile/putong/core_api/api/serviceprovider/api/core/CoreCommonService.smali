.class public interface abstract Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/core/CoreCommonService;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/android/injecter/facade/template/IProvider;


# virtual methods
.method public abstract A2()Ll/s0y;
.end method

.method public abstract C3(Ljava/lang/String;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end method

.method public abstract G(Lcom/p1/mobile/putong/app/PutongAct;)Lcom/p1/mobile/putong/app/a;
.end method

.method public abstract I(Lcom/p1/mobile/putong/data/Envelope;)Z
.end method

.method public abstract L0()Ll/s0y;
.end method

.method public abstract P1()Ljava/lang/String;
.end method

.method public abstract P4()Ll/s0y;
.end method

.method public abstract R3(Ljava/lang/Throwable;)V
.end method

.method public abstract T3(Lcom/p1/mobile/putong/data/Envelope;Ljava/util/HashSet;Ljava/lang/Integer;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Envelope;",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Integer;",
            ")V"
        }
    .end annotation
.end method

.method public abstract U4()Z
.end method

.method public abstract X4()Z
.end method

.method public abstract Y1(Lcom/p1/mobile/putong/data/Picture;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Picture;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Picture;",
            ">;"
        }
    .end annotation
.end method

.method public abstract a()Ll/tq8;
.end method

.method public abstract a3()I
.end method

.method public abstract alipayAuthWithErrorCode(Lcom/alipay/sdk/app/AuthTask;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/alipay/sdk/app/AuthTask;",
            ")",
            "Lrx/c<",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end method

.method public abstract c2(Lcom/p1/mobile/putong/app/PutongAct;Ll/x20;)V
.end method

.method public abstract counter_()Lcom/p1/mobile/putong/data/Counter;
.end method

.method public abstract getMainActIntent(Landroid/content/Context;)Landroid/content/Intent;
.end method

.method public abstract getUserByIdInModule(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;
.end method

.method public abstract j0()Ll/s0y;
.end method

.method public abstract l3(Ljava/util/List;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Picture;",
            ">;>;"
        }
    .end annotation
.end method

.method public abstract l5()Ll/s0y;
.end method

.method public abstract me()Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end method

.method public abstract me_()Lcom/p1/mobile/putong/data/User;
.end method

.method public abstract mergeNetworkStateIntoLocalState(Lcom/p1/mobile/putong/data/Envelope;Ll/x20;)V
.end method

.method public abstract pollUserCounters()V
.end method

.method public abstract queryMe()Lcom/p1/mobile/putong/data/User;
.end method

.method public abstract r(Lcom/p1/mobile/android/app/Act;)V
.end method

.method public abstract trackPlayerBlockTime(JLjava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract u4(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/AlipayAuthEnvelop;",
            ">;"
        }
    .end annotation
.end method

.method public abstract v0()Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "+",
            "Lcom/p1/mobile/android/app/Act;",
            ">;"
        }
    .end annotation
.end method

.method public abstract z5(Ll/pcj;Lrx/subjects/a;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ll/x1d0;",
            ">;",
            "Lrx/subjects/a<",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Contract;",
            ">;>;)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end method
