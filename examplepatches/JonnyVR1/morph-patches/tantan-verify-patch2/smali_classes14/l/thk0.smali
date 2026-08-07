.class public Ll/thk0;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/external/page/rights/manage/view/UserRightItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/os/Bundle;

.field public b:Lcom/p1/mobile/putong/live/base/bean/UserRightType;


# direct methods
.method public constructor <init>(Landroid/os/Bundle;Lcom/p1/mobile/putong/live/base/bean/UserRightType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/thk0;->a:Landroid/os/Bundle;

    .line 5
    .line 6
    iput-object p2, p0, Ll/thk0;->b:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public H()Landroid/os/Bundle;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/thk0;->a:Landroid/os/Bundle;

    .line 2
    .line 3
    return-object p0
.end method

.method public I()Lcom/p1/mobile/putong/live/base/bean/UserRightType;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/thk0;->b:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 2
    .line 3
    return-object p0
.end method

.method public J(Lcom/p1/mobile/putong/live/external/page/rights/manage/view/UserRightItemView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/external/page/rights/manage/view/UserRightItemView;->k0(Ll/thk0;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->l1:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/page/rights/manage/view/UserRightItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/thk0;->J(Lcom/p1/mobile/putong/live/external/page/rights/manage/view/UserRightItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
