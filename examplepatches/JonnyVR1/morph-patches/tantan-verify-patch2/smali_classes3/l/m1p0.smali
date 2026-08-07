.class public Ll/m1p0;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:I

.field public final b:Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRankInfo;

.field public final c:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(ILcom/p1/mobile/putong/live/base/data/BLiveSweetCpRankInfo;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRankInfo;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/m1p0;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Ll/m1p0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRankInfo;

    .line 7
    .line 8
    iput-object p3, p0, Ll/m1p0;->c:Ll/y20;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/m1p0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRankInfo;

    .line 5
    .line 6
    iget v1, p0, Ll/m1p0;->a:I

    .line 7
    .line 8
    iget-object p0, p0, Ll/m1p0;->c:Ll/y20;

    .line 9
    .line 10
    invoke-virtual {p1, v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;->l0(Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRankInfo;ILl/y20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->wa:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/m1p0;->H(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetListItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
