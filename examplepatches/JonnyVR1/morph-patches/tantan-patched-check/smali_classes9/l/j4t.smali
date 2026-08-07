.class public final synthetic Ll/j4t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j4t;->a:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j4t;->a:Lcom/p1/mobile/putong/data/User;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->g(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
