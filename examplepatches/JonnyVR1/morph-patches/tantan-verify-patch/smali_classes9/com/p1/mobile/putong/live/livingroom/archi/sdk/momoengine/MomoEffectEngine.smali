.class public Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;
.super Ll/eas;
.source "SourceFile"

# interfaces
.implements Ll/uzl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$SurroundState;,
        Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;
    }
.end annotation


# instance fields
.field public final a:Ll/u1f;

.field public b:Ll/v6m;

.field public final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/mmsdk/effect/filtermanager/TTPresetFilter;",
            ">;"
        }
    .end annotation
.end field

.field public volatile d:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$SurroundState;

.field public final e:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public f:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;

.field public g:Z

.field public h:Z

.field public i:I

.field public j:Ll/wxh0;

.field public k:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/u1f;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/eas;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->c:Ljava/util/List;

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$SurroundState;->UNKNOW:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$SurroundState;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->d:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$SurroundState;

    .line 14
    .line 15
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->e:Lrx/subjects/a;

    .line 20
    .line 21
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;

    .line 22
    .line 23
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->f:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;

    .line 27
    .line 28
    const/4 v0, -0x1

    .line 29
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->i:I

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->k:Ljava/lang/String;

    .line 33
    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->a:Ll/u1f;

    .line 35
    .line 36
    iget-object p1, p1, Ll/u1f;->b:Ll/v6m;

    .line 37
    .line 38
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 39
    .line 40
    return-void
.end method

.method public static synthetic S0(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->c1()V

    return-void
.end method

.method public static synthetic T0(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/CoreEngineAction;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->X0(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/CoreEngineAction;)V

    return-void
.end method

.method public static synthetic U0(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->Z0(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V

    return-void
.end method

.method private V0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->e:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->f:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;

    .line 9
    .line 10
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;->a:Z

    .line 11
    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;->e:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->m(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->f:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;

    .line 20
    .line 21
    iget v0, v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;->f:F

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->setIntensity(F)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method private W0(Ljava/lang/String;)Z
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->g:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    goto :goto_1

    .line 12
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 13
    :goto_1
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->k:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_2

    .line 22
    .line 23
    new-instance v1, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v2, "beauty unprepared when call "

    .line 26
    .line 27
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const-string v2, "[live]sdk_engine"

    .line 38
    .line 39
    invoke-static {v2, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->k:Ljava/lang/String;

    .line 43
    .line 44
    :cond_2
    return v0
.end method

.method private synthetic Z0(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;)V
    .locals 3

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 2
    .line 3
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v0, v1}, Ll/uyr;->b(ILjava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/nxd0;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->getDefaultBeautyValue()F

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-direct {v1, v0, v2}, Ll/nxd0;-><init>(Ljava/lang/String;F)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->getValue()F

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyItem;->id:I

    .line 33
    .line 34
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Ljava/lang/Float;

    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->L(IF)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method private c1()V
    .locals 2

    .line 1
    sget-object v0, Ll/zrv;->c:Ll/tyr;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/tyr;->K()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    new-instance v1, Ll/h210;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/h210;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method


# virtual methods
.method public A(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/v6m;->A(F)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public B(ILl/wxh0;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Ll/wxh0;->d()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->j:Ll/wxh0;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 14
    .line 15
    invoke-interface {p0, p2}, Ll/v6m;->H(Ll/wxh0;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 20
    .line 21
    invoke-interface {p0, p1, p2}, Ll/v6m;->h0(ILl/wxh0;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public D([B)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/v6m;->D([B)I

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public D0(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "removeGestureModel. typeName:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "[live]sdk_engine"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 21
    .line 22
    invoke-interface {p0, p1}, Ll/v6m;->b(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public E(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "startSurroundMusic:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "[live]sdk_engine"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$SurroundState;->STARTING:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$SurroundState;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->f1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$SurroundState;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-interface {v0, p1, p2}, Ll/v6m;->E(Ljava/lang/String;Z)V

    .line 30
    .line 31
    .line 32
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$SurroundState;->STARTED:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$SurroundState;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->f1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$SurroundState;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public F()V
    .locals 4

    .line 1
    const-string v0, "removeMakeupStyle"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->W0(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->f:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;->a:Z

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;->d:F

    .line 17
    .line 18
    iput v1, v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;->c:F

    .line 19
    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 21
    .line 22
    iget v0, v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;->b:I

    .line 23
    .line 24
    sget-object v3, Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;->FILTER:Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;

    .line 25
    .line 26
    invoke-static {v2, v0, v3, v1}, Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper;->g(Ll/v6m;ILcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;F)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->f:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;

    .line 32
    .line 33
    iget v2, v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;->b:I

    .line 34
    .line 35
    sget-object v3, Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;->MAKEUP:Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;

    .line 36
    .line 37
    iget v1, v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;->d:F

    .line 38
    .line 39
    invoke-static {v0, v2, v3, v1}, Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper;->g(Ll/v6m;ILcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;F)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 43
    .line 44
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper;->e(Ll/v6m;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public G(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->j:Ll/wxh0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 6
    .line 7
    invoke-interface {v1, v0}, Ll/v6m;->Q(Ll/wxh0;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ll/v6m;->i0(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public H(Ljava/lang/Boolean;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/v6m;->Z(Ljava/lang/Boolean;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public L(IF)V
    .locals 1

    .line 1
    const-string v0, "updateBeautyValue"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->W0(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 11
    .line 12
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper;->f(Ll/v6m;IF)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public M(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/v6m;->M(Ljava/lang/Boolean;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public Q0(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/v6m;->selectAudioTrack(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public final X0(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/CoreEngineAction;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p1, v0, :cond_3

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p1, v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-eq p1, v0, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->V0()V

    .line 20
    .line 21
    .line 22
    :cond_1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->c1()V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->f:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;

    .line 26
    .line 27
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;->a:Z

    .line 28
    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    iget v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;->b:I

    .line 32
    .line 33
    sget-object v1, Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;->FILTER:Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;

    .line 34
    .line 35
    iget p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;->c:F

    .line 36
    .line 37
    invoke-virtual {p0, v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->s(ILcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;F)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->f:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;

    .line 41
    .line 42
    iget v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;->b:I

    .line 43
    .line 44
    sget-object v1, Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;->MAKEUP:Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;

    .line 45
    .line 46
    iget p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;->d:F

    .line 47
    .line 48
    invoke-virtual {p0, v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->s(ILcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;F)V

    .line 49
    .line 50
    .line 51
    :cond_2
    :goto_0
    return-void

    .line 52
    :cond_3
    new-instance p1, Ll/f210;

    .line 53
    .line 54
    invoke-direct {p1, p0}, Ll/f210;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;)V

    .line 55
    .line 56
    .line 57
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public Y0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->a:Ll/u1f;

    .line 2
    .line 3
    iget-object v0, v0, Ll/u1f;->c:Ll/b210;

    .line 4
    .line 5
    new-instance v1, Ll/d210;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/d210;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/b210;->l1(Ll/y20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public a0(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/v6m;->setMusicVolume(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public a1()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->h:Z

    .line 3
    .line 4
    return-void
.end method

.method public b0()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$SurroundState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->d:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$SurroundState;

    .line 2
    .line 3
    return-object p0
.end method

.method public b1()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 3
    .line 4
    return-void
.end method

.method public c()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/v6m;->c()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public d()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/v6m;->d()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/high16 p0, -0x40800000    # -1.0f

    .line 11
    .line 12
    return p0
.end method

.method public d1(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v6m;->v(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e1()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/v6m;->stopAllEffect()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final declared-synchronized f1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$SurroundState;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->d:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$SurroundState;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :catchall_0
    move-exception p1

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw p1
.end method

.method public h(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/v6m;->h(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public i()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/v6m;->i()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public j()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/v6m;->j()V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$SurroundState;->PAUSE:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$SurroundState;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->f1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$SurroundState;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public k()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/v6m;->k()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public m(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->f:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;

    .line 2
    .line 3
    iput-object p1, v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;->e:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/v6m;->m(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public q()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/v6m;->q()V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$SurroundState;->STARTING:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$SurroundState;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->f1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$SurroundState;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public r()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/v6m;->r()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public s(ILcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;F)V
    .locals 2

    .line 1
    const-string v0, "updateMakeupStyleValue"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->W0(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->f:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;

    .line 11
    .line 12
    iput p1, v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;->b:I

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;->a:Z

    .line 16
    .line 17
    sget-object v1, Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;->FILTER:Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;

    .line 18
    .line 19
    if-ne p2, v1, :cond_1

    .line 20
    .line 21
    iput p3, v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;->c:F

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    iput p3, v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;->d:F

    .line 25
    .line 26
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 27
    .line 28
    invoke-static {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper;->g(Ll/v6m;ILcom/p1/mobile/putong/live/base/mmsdk/beauty/ByteDanceHelper$MakeupStyleType;F)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public setIntensity(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->f:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;

    .line 2
    .line 3
    iput p1, v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$b;->f:F

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->e:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {v0}, Lrx/subjects/a;->i()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ll/v6m;->x(F)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public stopEffect(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/v6m;->stopEffect(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public stopSurroundMusic()V
    .locals 2

    .line 1
    const-string v0, "[live]sdk_engine"

    .line 2
    .line 3
    const-string v1, "stopSurroundMusic"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$SurroundState;->STOPPING:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$SurroundState;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->f1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$SurroundState;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-interface {v0}, Ll/v6m;->stopSurroundMusic()V

    .line 19
    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$SurroundState;->STOPPED:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$SurroundState;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->f1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine$SurroundState;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public t()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/mmsdk/effect/filtermanager/TTPresetFilter;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->c:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public t0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "addGestureModel. typeName:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " modelPath:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "[live]sdk_engine"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ll/xxh0;->a()Ll/xxh0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 33
    .line 34
    invoke-virtual {v0, v1, p2}, Ll/xxh0;->b(Landroid/content/Context;Ljava/lang/String;)Ll/wxh0;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    invoke-static {}, Ll/wxh0;->a()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    invoke-virtual {p2, v0}, Ll/wxh0;->f(I)V

    .line 49
    .line 50
    .line 51
    const-wide/16 v0, 0xbb8

    .line 52
    .line 53
    invoke-virtual {p2, v0, v1}, Ll/wxh0;->e(J)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 57
    .line 58
    invoke-interface {p0, p1, p2}, Ll/v6m;->V(Ljava/lang/String;Ll/wxh0;)V

    .line 59
    .line 60
    .line 61
    :cond_0
    return-void
.end method

.method public u(ILjava/lang/String;ZZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 12
    .line 13
    invoke-interface {p0, p1, p2, p3, p4}, Ll/v6m;->u(ILjava/lang/String;ZZ)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public v()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->e:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public x(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/mmsdk/effect/filtermanager/TTPresetFilter;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->c:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->c:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {p1, p0}, Ll/v6m;->F(Ljava/util/List;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public z(Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;->BEAUTY_TYPE_BYTE:Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-static {p2}, Ll/cnw;->g(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    sget-object v0, Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;->BEAUTY_TYPE_ENGINE:Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;

    .line 10
    .line 11
    if-ne p1, v0, :cond_1

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b:Ll/v6m;

    .line 14
    .line 15
    invoke-interface {p1, p2}, Ll/v6m;->t(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 19
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->g:Z

    .line 20
    .line 21
    return-void
.end method
