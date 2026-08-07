.class public final synthetic Ll/b160;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemMask;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemMask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b160;->a:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;

    iput-object p2, p0, Ll/b160;->b:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemMask;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b160;->a:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;

    iget-object p0, p0, Ll/b160;->b:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemMask;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->b(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemMask;)V

    return-void
.end method
