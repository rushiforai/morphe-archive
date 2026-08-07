.class public final synthetic Ll/kas;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/las;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;


# direct methods
.method public synthetic constructor <init>(Ll/las;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kas;->a:Ll/las;

    iput-object p2, p0, Ll/kas;->b:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kas;->a:Ll/las;

    iget-object p0, p0, Ll/kas;->b:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    invoke-static {v0, p0, p1}, Ll/las;->L3(Ll/las;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V

    return-void
.end method
