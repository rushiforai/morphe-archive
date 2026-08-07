.class public Ll/jdg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ldg;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/ldg;

.field public b:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jdg;->b:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jdg;->b:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public a(Ll/ldg;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jdg;->a:Ll/ldg;

    .line 2
    .line 3
    return-void
.end method

.method public b()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jdg;->b:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;->l0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Ll/aeg;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jdg;->b:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jdg;->a:Ll/ldg;

    .line 4
    .line 5
    invoke-virtual {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;->m0(Ll/aeg;Ll/ldg;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ldg;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jdg;->a(Ll/ldg;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
