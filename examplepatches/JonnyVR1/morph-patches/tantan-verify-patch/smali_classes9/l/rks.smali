.class public final synthetic Ll/rks;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/velib/player/d$d;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rks;->a:Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    iput-object p2, p0, Ll/rks;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rks;->a:Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    iget-object p0, p0, Ll/rks;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    invoke-static {v0, p0}, Ll/uks;->b(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    return-void
.end method
