.class public final synthetic Ll/vsc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/zsc0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/zsc0;Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vsc0;->a:Ll/zsc0;

    iput-object p2, p0, Ll/vsc0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    iput-object p3, p0, Ll/vsc0;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vsc0;->a:Ll/zsc0;

    iget-object v1, p0, Ll/vsc0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    iget-object p0, p0, Ll/vsc0;->c:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGetRedPacketUser;

    invoke-static {v0, v1, p0, p1}, Ll/zsc0;->a(Ll/zsc0;Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGetRedPacketUser;)V

    return-void
.end method
