.class public final Lhtg;
.super Lh83;
.source "SourceFile"


# instance fields
.field public final A:Ldb;


# direct methods
.method public constructor <init>(Lnvg;Ldb;)V
    .registers 5

    const v0, 0x7f1411b4

    const v1, 0x7f140075

    invoke-direct {p0, p1, v0, v1}, Lh83;-><init>(Lnvg;II)V

    iput-object p2, p0, Lhtg;->A:Ldb;

    return-void
.end method


# virtual methods
.method public final I0()V
    .registers 5

    iget-object v0, p0, Lh83;->z:Lnvg;

    iget-object v0, v0, Lnvg;->c:Lp8f;

    new-instance v1, Llvg;

    const/4 v2, 0x3

    const/4 v3, 0x6

    invoke-direct {v1, v2, v3}, Llvg;-><init>(II)V

    invoke-virtual {v0}, Lp8f;->t()Lmvg;

    move-result-object v2

    if-eqz v2, :cond_19

    iget-object v3, v2, Lmvg;->f:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v2}, Lp8f;->G(Lmvg;)V

    :cond_19
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object p0, p0, Lhtg;->A:Ldb;

    invoke-static {v0, p0, v1, v2}, Lxih;->w(Landroidx/fragment/app/w;Ldb;Lfv2;Z)V

    return-void
.end method

.method public final y()Ljava/lang/String;
    .registers 1

    const-string p0, "base-account-onboarding-fragment"

    return-object p0
.end method
