.class public final synthetic Ll/ge60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/ke60;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;


# direct methods
.method public synthetic constructor <init>(Ll/ke60;Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ge60;->a:Ll/ke60;

    iput-object p2, p0, Ll/ge60;->b:Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ge60;->a:Ll/ke60;

    iget-object p0, p0, Ll/ge60;->b:Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, p0, p1}, Ll/ke60;->J3(Ll/ke60;Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;Ljava/lang/Long;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
