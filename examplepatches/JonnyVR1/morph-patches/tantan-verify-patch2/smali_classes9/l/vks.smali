.class public final synthetic Ll/vks;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/xks;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

.field public final synthetic c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Ll/xks;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vks;->a:Ll/xks;

    iput-object p2, p0, Ll/vks;->b:Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    iput-object p3, p0, Ll/vks;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    iput-boolean p4, p0, Ll/vks;->d:Z

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/vks;->a:Ll/xks;

    iget-object v1, p0, Ll/vks;->b:Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    iget-object v2, p0, Ll/vks;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    iget-boolean p0, p0, Ll/vks;->d:Z

    invoke-static {v0, v1, v2, p0}, Ll/xks;->a(Ll/xks;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V

    return-void
.end method
