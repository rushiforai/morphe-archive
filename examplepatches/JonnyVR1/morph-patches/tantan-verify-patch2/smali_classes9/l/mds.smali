.class public Ll/mds;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketHistoryItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/zsc0$a;

.field public b:Ll/ner;


# direct methods
.method public constructor <init>(Ll/zsc0$a;Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mds;->a:Ll/zsc0$a;

    .line 5
    .line 6
    iput-object p2, p0, Ll/mds;->b:Ll/ner;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketHistoryItemView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/mds;->a:Ll/zsc0$a;

    .line 5
    .line 6
    iget-object p0, p0, Ll/mds;->b:Ll/ner;

    .line 7
    .line 8
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketHistoryItemView;->i0(Ll/zsc0$a;Ll/ner;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->T0:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketHistoryItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/mds;->H(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketHistoryItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
