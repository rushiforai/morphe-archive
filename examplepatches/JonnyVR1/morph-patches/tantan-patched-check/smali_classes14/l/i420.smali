.class public Ll/i420;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

.field public final b:Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

.field public final c:Lcom/p1/mobile/putong/data/User;

.field public final d:Lcom/p1/mobile/putong/live/base/data/BLiveActivity;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/i420;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 5
    .line 6
    iput-object p2, p0, Ll/i420;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 7
    .line 8
    iput-object p3, p0, Ll/i420;->c:Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    iput-object p4, p0, Ll/i420;->d:Lcom/p1/mobile/putong/live/base/data/BLiveActivity;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i420;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i420;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i420;->c:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/i420;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    instance-of v0, p0, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLive;->isMultiCall()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public e()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/i420;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 4
    .line 5
    const-string v0, "onlive"

    .line 6
    .line 7
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i420;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    instance-of p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 4
    .line 5
    return p0
.end method
