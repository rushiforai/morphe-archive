.class public final synthetic Ll/m3m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

.field public final synthetic b:Ll/kip0;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;Ll/kip0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m3m0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

    iput-object p2, p0, Ll/m3m0;->b:Ll/kip0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m3m0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

    iget-object p0, p0, Ll/m3m0;->b:Ll/kip0;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/roomInfo/view/VirtualRoomInfoCoverItem;->a(Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;Ll/kip0;Landroid/view/View;)V

    return-void
.end method
