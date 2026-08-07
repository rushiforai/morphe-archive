.class public Ll/q2l;
.super Ll/df60;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/df60<",
        "Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/view/HideAvatarItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

.field public final b:Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;

.field public final c:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/df60;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/q2l;->a:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 5
    .line 6
    iput-object p2, p0, Ll/q2l;->b:Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;

    .line 7
    .line 8
    iput p3, p0, Ll/q2l;->c:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public b()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->A0:I

    .line 2
    .line 3
    return p0
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/q2l;->a:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 2
    .line 3
    const-string v0, "equipped"

    .line 4
    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->status:Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/q2l;->a:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 2
    .line 3
    const-string v0, "activated"

    .line 4
    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->status:Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method

.method public e()Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q2l;->b:Lcom/p1/mobile/putong/live/base/data/BLiveHideAvatarEnterConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget p0, p0, Ll/q2l;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public g()Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q2l;->a:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q2l;->a:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->isActive()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public i()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q2l;->a:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->isEquipped()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public j()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q2l;->a:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->isGray()Z

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
    iget-object p0, p0, Ll/q2l;->a:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->isLocked()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
