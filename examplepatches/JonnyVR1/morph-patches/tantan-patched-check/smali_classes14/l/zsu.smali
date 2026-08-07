.class public Ll/zsu;
.super Ll/xgu;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/xgu<",
        "Ll/zsu;",
        ">;"
    }
.end annotation


# instance fields
.field public f:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/p2e0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/knu;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/xgu;-><init>(Ll/knu;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/zsu;->f:Ljava/util/Map;

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;->values()[Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance v0, Ll/ysu;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/ysu;-><init>(Ll/zsu;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1, v0}, Ll/jyb;->A([Ljava/lang/Object;Ll/y20;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic S2(Ll/zsu;Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zsu;->U2(Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;)V

    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->SchemeHandleEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$f;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$f;->a()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/xsu;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/xsu;-><init>(Ll/zsu;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Ll/ahu;->I2(Ll/v3f$b;Ll/y20;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public T2(Ll/aae0;)V
    .locals 4

    .line 1
    new-instance v0, Ll/zit;

    .line 2
    .line 3
    iget-object v1, p1, Ll/aae0;->d:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/zit;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/zsu;->f:Ljava/util/Map;

    .line 9
    .line 10
    iget-object v2, v0, Ll/hyr;->a:Ljava/lang/String;

    .line 11
    .line 12
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ll/p2e0;

    .line 17
    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ke:I

    .line 21
    .line 22
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v3, "liveRoomScheme:"

    .line 29
    .line 30
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v3, v0, Ll/hyr;->b:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    const-string v3, "[live][schema]"

    .line 43
    .line 44
    invoke-static {v3, v2}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p1, Ll/aae0;->e:Ll/aae0$b;

    .line 48
    .line 49
    invoke-virtual {v1, v0, p0, p1}, Ll/p2e0;->a(Ll/hyr;Ll/zsu;Ll/aae0$b;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final synthetic U2(Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/zsu;->f:Ljava/util/Map;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;->getAction()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;->getSchemaAction()Ll/p2e0;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    return-void
.end method
