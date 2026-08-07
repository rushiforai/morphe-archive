.class public final synthetic Ll/yb10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/dc10;


# direct methods
.method public synthetic constructor <init>(Ll/dc10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yb10;->a:Ll/dc10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yb10;->a:Ll/dc10;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;

    invoke-static {p0, p1}, Ll/dc10;->O3(Ll/dc10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkLeaderboard;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
