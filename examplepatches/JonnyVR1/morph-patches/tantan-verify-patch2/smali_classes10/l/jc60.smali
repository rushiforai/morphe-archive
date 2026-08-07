.class public Ll/jc60;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/dw40;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

.field public j:Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/jc60;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic J3(Ll/jc60;Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jc60;->L3(Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;)V

    return-void
.end method


# virtual methods
.method public K3(Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jc60;->j:Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object p1, v0

    .line 6
    :cond_0
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;->startTs:J

    .line 7
    .line 8
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;->duration:I

    .line 9
    .line 10
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->E(JI)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object p0, p0, Ll/jc60;->i:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;

    .line 15
    .line 16
    if-lez v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->d0(Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;I)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    const/4 p1, 0x0

    .line 23
    const/4 v0, -0x1

    .line 24
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->d0(Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;I)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic L3(Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jc60;->j:Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jc60;->K3(Lcom/p1/mobile/putong/live/base/data/BLivePKBufferInfo;)V

    .line 4
    .line 5
    .line 6
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
    check-cast v0, Ll/dw40;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v0, v0, Ll/aj1;->d2:Lrx/subjects/b;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/ic60;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/ic60;-><init>(Ll/jc60;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method
