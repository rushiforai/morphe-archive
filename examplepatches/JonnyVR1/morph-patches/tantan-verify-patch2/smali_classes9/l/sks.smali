.class public final synthetic Ll/sks;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y9m;


# instance fields
.field public final synthetic a:Ll/uks;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

.field public final synthetic c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Ll/uks;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sks;->a:Ll/uks;

    iput-object p2, p0, Ll/sks;->b:Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    iput-object p3, p0, Ll/sks;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    iput-boolean p4, p0, Ll/sks;->d:Z

    return-void
.end method


# virtual methods
.method public final onCompletion()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/sks;->a:Ll/uks;

    iget-object v1, p0, Ll/sks;->b:Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    iget-object v2, p0, Ll/sks;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    iget-boolean p0, p0, Ll/sks;->d:Z

    invoke-static {v0, v1, v2, p0}, Ll/uks;->a(Ll/uks;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V

    return-void
.end method
