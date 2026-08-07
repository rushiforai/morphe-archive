.class public Ll/szn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ipl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/ipl<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoice;",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoice;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/szn0;->a:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/szn0;->b:Lrx/subjects/a;

    .line 15
    .line 16
    return-void
.end method

.method private b()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/szn0;->a:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Ll/ipl;->m(Lrx/subjects/a;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/szn0;->c()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/szn0;->c()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    const-string p0, ""

    .line 27
    .line 28
    return-object p0
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/szn0;->a:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/szn0;->b:Lrx/subjects/a;

    .line 12
    .line 13
    sget-object p0, Ll/zrv;->f:Ll/f2d0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/f2d0;->b()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public c()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/szn0;->a:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 8
    .line 9
    return-object p0
.end method

.method public d()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoice;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/szn0;->a:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/szn0;->b:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 8
    .line 9
    return-object p0
.end method

.method public f()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/szn0;->b:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLiveId()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/szn0;->a:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Ll/ipl;->m(Lrx/subjects/a;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/szn0;->a:Lrx/subjects/a;

    .line 10
    .line 11
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    const-string p0, ""

    .line 21
    .line 22
    return-object p0
.end method

.method public getRoomId()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/szn0;->b:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Ll/ipl;->m(Lrx/subjects/a;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/szn0;->b:Lrx/subjects/a;

    .line 10
    .line 11
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    const-string p0, ""

    .line 21
    .line 22
    return-object p0
.end method

.method public bridge synthetic j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/szn0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic l()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/szn0;->c()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public n(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/szn0;->a:Lrx/subjects/a;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    sget-object p1, Ll/zrv;->f:Ll/f2d0;

    .line 9
    .line 10
    const-string v0, "X-TT-Live-AnchorID"

    .line 11
    .line 12
    invoke-direct {p0}, Ll/szn0;->b()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {p1, v0, v1}, Ll/f2d0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Ll/zrv;->f:Ll/f2d0;

    .line 20
    .line 21
    const-string v0, "X-TT-Live-LiveID"

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/szn0;->getLiveId()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {p1, v0, v1}, Ll/f2d0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    sget-object p1, Ll/zrv;->f:Ll/f2d0;

    .line 31
    .line 32
    const-string v0, "X-TT-Live-RoomID"

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/szn0;->getRoomId()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p1, v0, p0}, Ll/f2d0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    sget-object p0, Ll/zrv;->f:Ll/f2d0;

    .line 42
    .line 43
    const-string p1, "X-Android-UpgradeVersion-Time"

    .line 44
    .line 45
    invoke-static {}, Ll/ipl;->k()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p0, p1, v0}, Ll/f2d0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public o(Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/szn0;->b:Lrx/subjects/a;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    sget-object p1, Ll/zrv;->f:Ll/f2d0;

    .line 9
    .line 10
    const-string v0, "X-TT-Live-AnchorID"

    .line 11
    .line 12
    invoke-direct {p0}, Ll/szn0;->b()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {p1, v0, v1}, Ll/f2d0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Ll/zrv;->f:Ll/f2d0;

    .line 20
    .line 21
    const-string v0, "X-TT-Live-LiveID"

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/szn0;->getLiveId()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {p1, v0, v1}, Ll/f2d0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    sget-object p1, Ll/zrv;->f:Ll/f2d0;

    .line 31
    .line 32
    const-string v0, "X-TT-Live-RoomID"

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/szn0;->getRoomId()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p1, v0, p0}, Ll/f2d0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    sget-object p0, Ll/zrv;->f:Ll/f2d0;

    .line 42
    .line 43
    const-string p1, "X-Android-UpgradeVersion-Time"

    .line 44
    .line 45
    invoke-static {}, Ll/ipl;->k()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p0, p1, v0}, Ll/f2d0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method
