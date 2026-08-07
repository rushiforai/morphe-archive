.class public Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryPreviewProfileFrag;
.super Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;
.source "SourceFile"

# interfaces
.implements Ll/myl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag<",
        "Ll/h4x;",
        "Ll/i4x;",
        ">;",
        "Ll/myl;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic M4()Ll/czw;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryPreviewProfileFrag;->P4()Ll/h4x;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic N4()Ll/dzw;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryPreviewProfileFrag;->Q4()Ll/i4x;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public P4()Ll/h4x;
    .locals 1

    .line 1
    new-instance v0, Ll/h4x;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/h4x;-><init>(Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryPreviewProfileFrag;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public Q4()Ll/i4x;
    .locals 1

    .line 1
    new-instance v0, Ll/i4x;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/i4x;-><init>(Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryPreviewProfileFrag;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;->A:Ll/dzw;

    .line 2
    .line 3
    check-cast p0, Ll/i4x;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/i4x;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
