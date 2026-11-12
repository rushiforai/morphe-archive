.class public abstract Luul;
.super Lz43;
.source "SourceFile"


# instance fields
.field public final j:Lcom/opera/android/bar/TopToolbarContainer;

.field public final k:Lmhk;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lpt3;Lk6l;Lesk;Lcom/opera/android/bar/TopToolbarContainer;Lysl;Lpde;)V
    .registers 8

    invoke-direct/range {p0 .. p7}, Lz43;-><init>(Lcom/opera/android/BrowserActivity;Lpt3;Lk6l;Lesk;Landroid/view/ViewGroup;Lysl;Lpde;)V

    iput-object p5, p0, Luul;->j:Lcom/opera/android/bar/TopToolbarContainer;

    new-instance p1, Lmhk;

    invoke-direct {p1, p5}, Lmhk;-><init>(Lcom/opera/android/bar/TopToolbarContainer;)V

    iput-object p1, p0, Luul;->k:Lmhk;

    return-void
.end method


# virtual methods
.method public final q()Z
    .registers 2

    iget-object p0, p0, Luul;->j:Lcom/opera/android/bar/TopToolbarContainer;

    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    move-result p0

    const/4 v0, 0x0

    cmpl-float p0, p0, v0

    if-nez p0, :cond_d

    const/4 p0, 0x1

    return p0

    :cond_d
    const/4 p0, 0x0

    return p0
.end method

.method public s()V
    .registers 3

    iget-object v0, p0, Luul;->j:Lcom/opera/android/bar/TopToolbarContainer;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-eqz v1, :cond_c

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_c
    invoke-super {p0}, Lz43;->s()V

    const/4 v0, 0x1

    const/4 v1, 0x4

    iget-object p0, p0, Luul;->k:Lmhk;

    invoke-virtual {p0, v1, v0}, Lmhk;->h(IZ)V

    return-void
.end method

.method public final t(Z)V
    .registers 3

    iget-object p0, p0, Luul;->k:Lmhk;

    const/4 v0, 0x1

    invoke-virtual {p0, v0, p1}, Lmhk;->h(IZ)V

    return-void
.end method

.method public final u()V
    .registers 3

    const/4 v0, 0x0

    const/4 v1, 0x4

    iget-object p0, p0, Luul;->k:Lmhk;

    invoke-virtual {p0, v1, v0}, Lmhk;->h(IZ)V

    return-void
.end method

.method public final x()V
    .registers 3

    const/4 v0, 0x0

    const/4 v1, 0x2

    iget-object p0, p0, Luul;->k:Lmhk;

    invoke-virtual {p0, v1, v0}, Lmhk;->h(IZ)V

    return-void
.end method

.method public final y()V
    .registers 3

    const/4 v0, 0x1

    const/4 v1, 0x2

    iget-object p0, p0, Luul;->k:Lmhk;

    invoke-virtual {p0, v1, v0}, Lmhk;->h(IZ)V

    return-void
.end method

.method public z(Lb2l;)V
    .registers 3

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->o0()Z

    move-result p1

    const/16 v0, 0x8

    iget-object p0, p0, Luul;->k:Lmhk;

    invoke-virtual {p0, v0, p1}, Lmhk;->h(IZ)V

    return-void
.end method
