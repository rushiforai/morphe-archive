.class public Ll/sc10;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/qct<",
        "TD;>;"
    }
.end annotation


# instance fields
.field public i:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ll/td10;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/td10<",
            "TD;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;Ll/td10;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;",
            "Ll/td10<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

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
    iput-object p1, p0, Ll/sc10;->i:Ljava/util/HashMap;

    .line 10
    .line 11
    iput-object p2, p0, Ll/sc10;->j:Ll/td10;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic J3(Ll/sc10;Ll/v7t;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sc10;->N3(Ll/v7t;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public K3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sc10;->i:Ljava/util/HashMap;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/sc10;->i:Ljava/util/HashMap;

    .line 12
    .line 13
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userId:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    new-instance p0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v0, "add connecting call:"

    .line 21
    .line 22
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userId:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public L3(Ljava/lang/String;)I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sc10;->j:Ll/td10;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/td10;->b4()Ll/le10;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Ll/le10;->s(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object p0, p0, Ll/sc10;->i:Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 18
    .line 19
    invoke-static {v0}, Ll/fp10;->d(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    iget p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->position:I

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    if-eqz p0, :cond_1

    .line 29
    .line 30
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->position:I

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const/4 p0, -0x1

    .line 34
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v0, "connecting module getCallPos :"

    .line 37
    .line 38
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-static {p1}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return p0
.end method

.method public M3(Ll/v7t;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/v7t;->b()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Ll/fp10;->a(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/sc10;->K3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {p1}, Ll/fp10;->d(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    invoke-static {p1}, Ll/fp10;->c(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    :cond_1
    iget-object v0, p0, Ll/sc10;->i:Ljava/util/HashMap;

    .line 28
    .line 29
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userId:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    iget-object p0, p0, Ll/sc10;->i:Ljava/util/HashMap;

    .line 38
    .line 39
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userId:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    new-instance p0, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v0, "remove connecting call:"

    .line 47
    .line 48
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userId:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-static {p0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    :cond_2
    return-void
.end method

.method public final synthetic N3(Ll/v7t;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sc10;->j:Ll/td10;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/v7t;->b()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/td10;->j4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public O3(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/aj1;->R()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/oc10;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/oc10;-><init>(Ll/sc10;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/pc10;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/pc10;-><init>(Ll/sc10;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/sc10;->j:Ll/td10;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/td10;->f4()Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/qc10;

    .line 52
    .line 53
    invoke-direct {v1}, Ll/qc10;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Ll/rc10;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/rc10;-><init>(Ll/sc10;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 70
    .line 71
    .line 72
    return-void
.end method
