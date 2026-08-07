.class public Ll/dj10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/g0m;


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

.field public b:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;

.field public final c:Ll/ep10;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/dj10;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    .line 5
    .line 6
    iput-object p2, p0, Ll/dj10;->b:Lcom/p1/mobile/putong/live/livingroom/recreation/multiplayerchat/view/RoomPusherView;

    .line 7
    .line 8
    new-instance p1, Ll/ep10;

    .line 9
    .line 10
    sget-object p2, Ll/cd10;->f:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, ""

    .line 13
    .line 14
    const/4 v1, -0x1

    .line 15
    invoke-direct {p1, p2, v0, p3, v1}, Ll/ep10;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Ll/dj10;->c:Ll/ep10;

    .line 19
    .line 20
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;Ll/ep10;)V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Ll/dj10;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    .line 23
    iput-object p2, p0, Ll/dj10;->c:Ll/ep10;

    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dj10;->c:Ll/ep10;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ep10;->a()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dj10;->c:Ll/ep10;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ep10;->b()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dj10;->c:Ll/ep10;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ep10;->c()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dj10;->c:Ll/ep10;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ep10;->d()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
