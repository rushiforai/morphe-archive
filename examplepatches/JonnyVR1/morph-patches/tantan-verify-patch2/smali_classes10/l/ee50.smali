.class public Ll/ee50;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;

.field public final b:Ll/pe50;


# direct methods
.method public constructor <init>(Ll/pe50;Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/ee50;->a:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;

    .line 5
    .line 6
    iput-object p1, p0, Ll/ee50;->b:Ll/pe50;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillItemView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ee50;->b:Ll/pe50;

    .line 5
    .line 6
    iget-object p0, p0, Ll/ee50;->a:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;

    .line 7
    .line 8
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillItemView;->e(Ll/pe50;Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowListItem;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->H4:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ee50;->H(Lcom/p1/mobile/putong/live/livingroom/officialshow/showlist/OfficialShowPlayBillItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
