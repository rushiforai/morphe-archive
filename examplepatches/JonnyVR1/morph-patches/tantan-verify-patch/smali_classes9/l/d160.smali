.class public final synthetic Ll/d160;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d160;->a:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;

    iput-object p2, p0, Ll/d160;->b:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d160;->a:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;

    iget-object p0, p0, Ll/d160;->b:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;->f(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationItemView;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemCountDown;)V

    return-void
.end method
