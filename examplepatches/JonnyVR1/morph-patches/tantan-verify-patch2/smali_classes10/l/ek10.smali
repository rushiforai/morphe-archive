.class public final synthetic Ll/ek10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/zk10;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;


# direct methods
.method public synthetic constructor <init>(Ll/zk10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ek10;->a:Ll/zk10;

    iput-object p2, p0, Ll/ek10;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ek10;->a:Ll/zk10;

    iget-object p0, p0, Ll/ek10;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    invoke-static {v0, p0, p1}, Ll/zk10;->b4(Ll/zk10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Landroid/view/View;)V

    return-void
.end method
