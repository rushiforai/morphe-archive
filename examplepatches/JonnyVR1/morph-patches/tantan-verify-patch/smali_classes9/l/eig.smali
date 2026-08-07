.class public Ll/eig;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/yhg;

.field public final b:Ll/lag;


# direct methods
.method public constructor <init>(Ll/lag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/eig;->b:Ll/lag;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public H(Ll/yhg;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eig;->a:Ll/yhg;

    .line 2
    .line 3
    return-void
.end method

.method public m(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->L0:I

    .line 2
    .line 3
    return p0
.end method

.method public u(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;

    .line 5
    .line 6
    iget-object v0, p0, Ll/eig;->b:Ll/lag;

    .line 7
    .line 8
    iget-object p0, p0, Ll/eig;->a:Ll/yhg;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/yhg;->b()Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansInvitationView;->m0(Ll/lag;Lcom/p1/mobile/putong/live/base/data/BFansBaseRecall;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public w(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->w(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
