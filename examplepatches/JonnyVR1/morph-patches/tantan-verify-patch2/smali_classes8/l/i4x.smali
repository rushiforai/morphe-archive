.class public Ll/i4x;
.super Ll/dzw;
.source "SourceFile"

# interfaces
.implements Ll/myl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dzw<",
        "Ll/h4x;",
        ">;",
        "Ll/myl;"
    }
.end annotation


# instance fields
.field public b:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryPreviewProfileFrag;

.field public c:Ll/v7m;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryPreviewProfileFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/dzw;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/i4x;->b:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryPreviewProfileFrag;

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
    iget-object p0, p0, Ll/i4x;->b:Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryPreviewProfileFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public a(Ll/h4x;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i4x;->c:Ll/v7m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/v7m;->a(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
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
    check-cast p1, Ll/h4x;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/i4x;->a(Ll/h4x;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Ll/dzw;->a:Z

    .line 3
    .line 4
    new-instance p1, Landroid/widget/FrameLayout;

    .line 5
    .line 6
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-direct {p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    const-string v0, "preview"

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-interface {p2, p1, v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Mj(Landroid/widget/FrameLayout;Ljava/lang/String;Landroidx/recyclerview/widget/RecyclerView$t;)Ll/v7m;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    iput-object p2, p0, Ll/i4x;->c:Ll/v7m;

    .line 29
    .line 30
    return-object p1
.end method
