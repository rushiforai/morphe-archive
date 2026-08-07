.class public Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel;
.super Ll/e9d0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/e9d0<",
        "Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightHolderView;",
        ">;"
    }
.end annotation


# instance fields
.field public e:Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/e9d0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel;->e:Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;->getSpanSize()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Ll/e9d0;->c:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public H()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel;->e:Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;->getBgColor()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public I(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightHolderView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightHolderView;->b(Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->k1:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightHolderView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel;->I(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightHolderView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
