.class public Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/a;
.super Ll/v5w;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/a$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/v5w<",
        "Ll/xwr$a;",
        "Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveSquareBannerItemView;",
        ">;"
    }
.end annotation


# instance fields
.field private listener:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/a$a;


# direct methods
.method public constructor <init>(Ll/xwr;)V
    .locals 1
    .param p1    # Ll/xwr;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ll/xwr;->b()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-direct {p0, p1, v0}, Ll/v5w;-><init>(Ljava/util/List;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/a;Ll/xwr$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/a;->u(Ll/xwr$a;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic j(Landroid/view/View;II)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveSquareBannerItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/a;->s(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveSquareBannerItemView;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic p(ILandroid/view/ViewGroup;II)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/a;->t(ILandroid/view/ViewGroup;II)Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveSquareBannerItemView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public s(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveSquareBannerItemView;II)V
    .locals 2

    .line 1
    iget-object p3, p0, Ll/v5w;->itemList:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    check-cast p2, Ll/xwr$a;

    .line 8
    .line 9
    iget-object p3, p1, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveSquareBannerItemView;->_drawee_view:Lv/VDraweeView;

    .line 10
    .line 11
    invoke-virtual {p2}, Ll/xwr$a;->b()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "context_square"

    .line 16
    .line 17
    invoke-static {v1, p3, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p3, p1, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveSquareBannerItemView;->_text:Lv/VText;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-static {p3, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    new-instance p3, Ll/z3s;

    .line 27
    .line 28
    invoke-direct {p3, p0, p2}, Ll/z3s;-><init>(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/a;Ll/xwr$a;)V

    .line 29
    .line 30
    .line 31
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public t(ILandroid/view/ViewGroup;II)Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveSquareBannerItemView;
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget p1, Ll/vec0;->e:I

    .line 10
    .line 11
    const/4 p3, 0x0

    .line 12
    invoke-virtual {p0, p1, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveSquareBannerItemView;

    .line 17
    .line 18
    sget p1, Ll/qa00;->j:I

    .line 19
    .line 20
    invoke-static {p0, p1}, Ll/ynp0;->m(Landroid/view/View;I)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/LiveSquareBannerItemView;->_black_cover:Landroid/view/View;

    .line 24
    .line 25
    const/4 p2, 0x1

    .line 26
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    return-object p0
.end method

.method public final synthetic u(Ll/xwr$a;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/a;->listener:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/a$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/a$a;->a(Ll/xwr$a;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public v(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/a$a;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/a$a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/a;->listener:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/banner/a$a;

    .line 2
    .line 3
    return-void
.end method
