.class public Ll/vxp;
.super Ll/a4s;
.source "SourceFile"


# instance fields
.field private cardData:Ll/vpn0;

.field private goAction:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

.field private trackData:Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/a4s;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()Ll/vpn0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vxp;->cardData:Ll/vpn0;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vxp;->trackData:Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ll/vpn0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vxp;->cardData:Ll/vpn0;

    .line 2
    .line 3
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vxp;->trackData:Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 2
    .line 3
    return-void
.end method
