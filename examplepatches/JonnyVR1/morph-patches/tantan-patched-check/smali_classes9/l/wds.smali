.class public final synthetic Ll/wds;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;

.field public final synthetic b:D

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;DLcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wds;->a:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;

    iput-wide p2, p0, Ll/wds;->b:D

    iput-object p4, p0, Ll/wds;->c:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wds;->a:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;

    iget-wide v1, p0, Ll/wds;->b:D

    iget-object p0, p0, Ll/wds;->c:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;->k0(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketView;DLcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;Ljava/lang/Long;)V

    return-void
.end method
