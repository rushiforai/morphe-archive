.class public final synthetic Ll/cc10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/dc10;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;


# direct methods
.method public synthetic constructor <init>(Ll/dc10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cc10;->a:Ll/dc10;

    iput-object p2, p0, Ll/cc10;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cc10;->a:Ll/dc10;

    iget-object p0, p0, Ll/cc10;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;

    check-cast p1, Ll/cm0;

    invoke-static {v0, p0, p1}, Ll/dc10;->T3(Ll/dc10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;Ll/cm0;)V

    return-void
.end method
