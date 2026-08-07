.class public final synthetic Ll/cg10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;

.field public final synthetic b:Ll/pg10;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;Ll/pg10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cg10;->a:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;

    iput-object p2, p0, Ll/cg10;->b:Ll/pg10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cg10;->a:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;

    iget-object p0, p0, Ll/cg10;->b:Ll/pg10;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/pg10;->J3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;Ll/pg10;Ljava/util/List;)V

    return-void
.end method
