.class public Ll/y1h0;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

.field public b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;

.field public c:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/y1h0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    .line 5
    .line 6
    iput-object p2, p0, Ll/y1h0;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestItemView;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/y1h0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    .line 5
    .line 6
    iget-object v1, p0, Ll/y1h0;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;

    .line 7
    .line 8
    iget-object p0, p0, Ll/y1h0;->c:Ll/z20;

    .line 9
    .line 10
    invoke-virtual {p1, v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestItemView;->e(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;Ll/z20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public I(Ll/z20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/y1h0;->c:Ll/z20;

    .line 2
    .line 3
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    if-eq v2, v3, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    check-cast p1, Ll/y1h0;

    .line 20
    .line 21
    iget-object v2, p0, Ll/y1h0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    .line 22
    .line 23
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->id:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Ll/y1h0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    .line 26
    .line 27
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->id:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v2, v3}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_2

    .line 34
    .line 35
    iget-object v2, p0, Ll/y1h0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    .line 36
    .line 37
    iget-boolean v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->isPking:Z

    .line 38
    .line 39
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    iget-object v3, p1, Ll/y1h0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    .line 44
    .line 45
    iget-boolean v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->isPking:Z

    .line 46
    .line 47
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-static {v2, v3}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz v2, :cond_2

    .line 56
    .line 57
    iget-object p0, p0, Ll/y1h0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->liveSetting:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;

    .line 60
    .line 61
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;->unacceptPk:Z

    .line 62
    .line 63
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    iget-object p1, p1, Ll/y1h0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    .line 68
    .line 69
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->liveSetting:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;

    .line 70
    .line 71
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;->unacceptPk:Z

    .line 72
    .line 73
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-static {p0, p1}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    if-eqz p0, :cond_2

    .line 82
    .line 83
    return v0

    .line 84
    :cond_2
    :goto_0
    return v1
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/y1h0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->id:Ljava/lang/String;

    .line 4
    .line 5
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->isPking:Z

    .line 6
    .line 7
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object p0, p0, Ll/y1h0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->liveSetting:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;

    .line 14
    .line 15
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSetting;->unacceptPk:Z

    .line 16
    .line 17
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    filled-new-array {v1, v0, p0}, [Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0}, Ll/k950;->b([Ljava/lang/Object;)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->E3:I

    .line 2
    .line 3
    return p0
.end method

.method public r()I
    .locals 0

    .line 1
    sget p0, Ll/pv70;->r:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/y1h0;->H(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
