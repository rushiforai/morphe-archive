.class public Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"

# interfaces
.implements Ll/pcj;
.implements Lcom/p1/mobile/putong/core/ui/vip/likers/b$a;
.implements Ll/cwl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongFrag;",
        "Ll/pcj<",
        "Ljava/lang/String;",
        ">;",
        "Lcom/p1/mobile/putong/core/ui/vip/likers/b$a;",
        "Ll/cwl;"
    }
.end annotation


# instance fields
.field public A:Ll/nnr;

.field public B:Lcom/p1/mobile/putong/core/ui/vip/likers/b;

.field public C:Lcom/p1/mobile/putong/core/ui/vip/likers/a;

.field public z:Lcom/p1/mobile/putong/core/ui/vip/likers/c;


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
.method public A1(Lcom/p1/mobile/putong/data/User;Z)Z
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->P4()Lcom/p1/mobile/putong/core/ui/vip/likers/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->A1(Lcom/p1/mobile/putong/data/User;Z)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

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
    new-instance v0, Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->z:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 7
    .line 8
    new-instance v0, Ll/nnr;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/nnr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->A:Ll/nnr;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->z:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public O2()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->P4()Lcom/p1/mobile/putong/core/ui/vip/likers/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/a;->C()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public O4()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->S4()Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->U0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "from_meet"

    .line 10
    .line 11
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Landroid/content/Intent;

    .line 18
    .line 19
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->S4()Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->l()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    const-string v2, "see_count"

    .line 31
    .line 32
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const/4 v1, -0x1

    .line 40
    invoke-virtual {p0, v1, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public P4()Lcom/p1/mobile/putong/core/ui/vip/likers/a;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->C:Lcom/p1/mobile/putong/core/ui/vip/likers/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/core/ui/vip/likers/a;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/a;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->C:Lcom/p1/mobile/putong/core/ui/vip/likers/a;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->C:Lcom/p1/mobile/putong/core/ui/vip/likers/a;

    .line 13
    .line 14
    return-object p0
.end method

.method public Q4()Landroidx/recyclerview/widget/k$e;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->B:Lcom/p1/mobile/putong/core/ui/vip/likers/b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/core/ui/vip/likers/b;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/b;-><init>(Lcom/p1/mobile/putong/core/ui/vip/likers/b$a;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->B:Lcom/p1/mobile/putong/core/ui/vip/likers/b;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->B:Lcom/p1/mobile/putong/core/ui/vip/likers/b;

    .line 13
    .line 14
    return-object p0
.end method

.method public R4()Ll/nnr;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->A:Ll/nnr;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->N4()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->A:Ll/nnr;

    .line 9
    .line 10
    return-object p0
.end method

.method public S4()Lcom/p1/mobile/putong/core/ui/vip/likers/c;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->z:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->N4()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->z:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 9
    .line 10
    return-object p0
.end method

.method public T4(Landroid/view/Menu;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->S4()Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->F1(Landroid/view/Menu;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public U4(I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->R4()Ll/nnr;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/nnr;->X(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public V4(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->R4()Ll/nnr;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/nnr;->setTitle(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public W4(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->S4()Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->N1(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->S4()Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->E(Lcom/p1/mobile/putong/data/User;ZZ)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public c(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->S4()Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->c(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->M4()Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->S4()Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->Z()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public f4()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->f4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->S4()Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->a0()V

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->R4()Ll/nnr;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Ll/nnr;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public n()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->S4()Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->Q1()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public notifyDataSetChanged()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->P4()Lcom/p1/mobile/putong/core/ui/vip/likers/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public o()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->S4()Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->E1()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public onDestroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Frag;->onDestroy()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->S4()Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->destroy()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersFrag;->R4()Ll/nnr;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/nnr;->destroy()V

    .line 16
    .line 17
    .line 18
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
