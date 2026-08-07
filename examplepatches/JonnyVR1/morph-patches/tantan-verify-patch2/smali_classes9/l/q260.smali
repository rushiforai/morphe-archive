.class public Ll/q260;
.super Ll/fk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/q260$a;
    }
.end annotation


# instance fields
.field public final c:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

.field public final d:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

.field public final e:Ljava/lang/Boolean;

.field public final f:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

.field public final g:Ll/bnl0$g;

.field public final h:Ljava/lang/String;

.field public final i:Z

.field public final j:Z


# direct methods
.method public constructor <init>(Ll/q260$a;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/fk2;-><init>(Ll/gk2;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Ll/q260$a;->c:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 5
    .line 6
    iput-object v0, p0, Ll/q260;->c:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 7
    .line 8
    iget-object v0, p1, Ll/q260$a;->d:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 9
    .line 10
    iput-object v0, p0, Ll/q260;->d:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 11
    .line 12
    iget-object v0, p1, Ll/q260$a;->e:Ljava/lang/Boolean;

    .line 13
    .line 14
    iput-object v0, p0, Ll/q260;->e:Ljava/lang/Boolean;

    .line 15
    .line 16
    iget-object v0, p1, Ll/q260$a;->f:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

    .line 17
    .line 18
    iput-object v0, p0, Ll/q260;->f:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

    .line 19
    .line 20
    iget-object v0, p1, Ll/q260$a;->g:Ll/bnl0$g;

    .line 21
    .line 22
    iput-object v0, p0, Ll/q260;->g:Ll/bnl0$g;

    .line 23
    .line 24
    iget-object v0, p1, Ll/q260$a;->h:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v0, p0, Ll/q260;->h:Ljava/lang/String;

    .line 27
    .line 28
    iget-boolean v0, p1, Ll/q260$a;->i:Z

    .line 29
    .line 30
    iput-boolean v0, p0, Ll/q260;->i:Z

    .line 31
    .line 32
    iget-boolean p1, p1, Ll/q260$a;->j:Z

    .line 33
    .line 34
    iput-boolean p1, p0, Ll/q260;->j:Z

    .line 35
    .line 36
    return-void
.end method

.method public synthetic constructor <init>(Ll/q260$a;Ll/r260;)V
    .locals 0

    .line 37
    invoke-direct {p0, p1}, Ll/q260;-><init>(Ll/q260$a;)V

    return-void
.end method


# virtual methods
.method public b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/q260;->i:Z

    .line 2
    .line 3
    return p0
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/q260;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method public d()Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q260;->d:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q260;->c:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q260;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q260;->f:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Ll/bnl0$g;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q260;->g:Ll/bnl0$g;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q260;->e:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q260;->c:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->isGiftRedPacket()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public k()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q260;->c:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->enableEntranceAnim()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public l()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q260;->c:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->isTurboCardEvent()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public m()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q260;->c:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;->isTurboCoupon()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
