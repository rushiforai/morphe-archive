.class public Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongFrag;",
        "Ll/pcj<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Ll/z1g;

.field public B:Ll/h0g;

.field public z:Ll/m1g;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public M4()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "\u559c\u6b22\u6211"

    .line 2
    .line 3
    return-object p0
.end method

.method public N4()V
    .locals 1

    .line 1
    new-instance v0, Ll/m1g;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/m1g;-><init>(Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->z:Ll/m1g;

    .line 7
    .line 8
    new-instance v0, Ll/z1g;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/z1g;-><init>(Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->A:Ll/z1g;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->z:Ll/m1g;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/m1g;->q0(Ll/z1g;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public O4()Ll/h0g;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->B:Ll/h0g;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/h0g;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/h0g;-><init>(Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->B:Ll/h0g;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->B:Ll/h0g;

    .line 13
    .line 14
    return-object p0
.end method

.method public P4()Ll/z1g;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->A:Ll/z1g;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->N4()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->A:Ll/z1g;

    .line 9
    .line 10
    return-object p0
.end method

.method public Q4()Ll/m1g;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->z:Ll/m1g;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->N4()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->z:Ll/m1g;

    .line 9
    .line 10
    return-object p0
.end method

.method public R4(I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->P4()Ll/z1g;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/z1g;->Z(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public S4(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->P4()Ll/z1g;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/z1g;->a0(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->M4()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->Q4()Ll/m1g;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ll/m1g;->Z()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public f4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->Q4()Ll/m1g;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ll/m1g;->a0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->P4()Ll/z1g;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Ll/z1g;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onDestroy()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->Q4()Ll/m1g;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/m1g;->destroy()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersFrag;->P4()Ll/z1g;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/z1g;->destroy()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Ll/yie0;->h()Ll/yie0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/yie0;->o()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, "price_recall_shown"

    .line 10
    .line 11
    invoke-virtual {p1, v1, v0}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 12
    .line 13
    .line 14
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_see_who_likes_me_view"

    .line 2
    .line 3
    return-object p0
.end method
