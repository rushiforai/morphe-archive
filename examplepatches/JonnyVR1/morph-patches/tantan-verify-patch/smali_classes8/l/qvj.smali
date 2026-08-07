.class public Ll/qvj;
.super Ll/g1e;
.source "SourceFile"

# interfaces
.implements Ll/rul;


# instance fields
.field public final j:Lcom/p1/mobile/android/app/Act;

.field public final k:Lcom/p1/mobile/putong/data/CoreGiftPanelName;

.field public l:Ll/owj;

.field public m:Ll/bwj;

.field public n:Ll/ovj;

.field public o:Landroid/view/View;

.field public p:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/CoreGiftInfo;",
            ">;"
        }
    .end annotation
.end field

.field public final q:Ljava/lang/String;

.field public final r:Ljava/lang/String;

.field public s:Ljava/lang/String;

.field public t:I

.field public u:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/CoreGiftPanelName;Ll/y20;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/data/CoreGiftPanelName;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/CoreGiftInfo;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p2}, Ll/qvj;->I(Lcom/p1/mobile/putong/data/CoreGiftPanelName;)I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    invoke-direct {p0, p1, v0, v1}, Ll/g1e;-><init>(Landroid/content/Context;ZI)V

    .line 7
    .line 8
    .line 9
    const/4 v0, -0x1

    .line 10
    iput v0, p0, Ll/qvj;->t:I

    .line 11
    .line 12
    iput-object p3, p0, Ll/qvj;->p:Ll/y20;

    .line 13
    .line 14
    iput-object p1, p0, Ll/qvj;->j:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    iput-object p2, p0, Ll/qvj;->k:Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 17
    .line 18
    iput-object p4, p0, Ll/qvj;->q:Ljava/lang/String;

    .line 19
    .line 20
    iput-object p5, p0, Ll/qvj;->r:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/qvj;->J()V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0}, Ll/qvj;->M()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static I(Lcom/p1/mobile/putong/data/CoreGiftPanelName;)I
    .locals 1

    .line 1
    const-string v0, "note"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/CoreGiftPanelName;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eq p0, v0, :cond_1

    .line 8
    .line 9
    const-string v0, "greet"

    .line 10
    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/data/CoreGiftPanelName;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-ne p0, v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget p0, Ll/cgc0;->e:I

    .line 19
    .line 20
    return p0

    .line 21
    :cond_1
    :goto_0
    sget p0, Ll/cgc0;->k:I

    .line 22
    .line 23
    return p0
.end method

.method private M()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/high16 v1, 0x4000000

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/high16 v1, -0x80000000

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/16 v1, 0x400

    .line 32
    .line 33
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->setLightStatusBar(Landroid/view/Window;I)V

    .line 34
    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 38
    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public E()Landroid/view/View;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qvj;->l:Ll/owj;

    .line 2
    .line 3
    iget-object v1, p0, Ll/qvj;->j:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v0, v1, v2}, Ll/owj;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/qvj;->o:Landroid/view/View;

    .line 15
    .line 16
    return-object v0
.end method

.method public F()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qvj;->r:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public G()Lcom/p1/mobile/putong/data/CoreGiftPanelName;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qvj;->k:Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 2
    .line 3
    return-object p0
.end method

.method public H()Ll/ovj;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qvj;->n:Ll/ovj;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/ovj;

    .line 6
    .line 7
    iget-object v1, p0, Ll/qvj;->m:Ll/bwj;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ll/ovj;-><init>(Ll/bwj;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/qvj;->n:Ll/ovj;

    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Ll/qvj;->n:Ll/ovj;

    .line 15
    .line 16
    return-object p0
.end method

.method public J()V
    .locals 2

    .line 1
    new-instance v0, Ll/bwj;

    .line 2
    .line 3
    invoke-direct {v0, p0, p0}, Ll/bwj;-><init>(Ll/s1e;Ll/qvj;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/qvj;->m:Ll/bwj;

    .line 7
    .line 8
    new-instance v0, Ll/owj;

    .line 9
    .line 10
    iget-object v1, p0, Ll/qvj;->j:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ll/owj;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/qvj;->l:Ll/owj;

    .line 16
    .line 17
    iget-object p0, p0, Ll/qvj;->m:Ll/bwj;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/ij2;->C(Ll/iam;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public K()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qvj;->m:Ll/bwj;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/bwj;->l()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public L()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qvj;->q:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public N()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qvj;->s:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qvj;->s:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public d(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/qvj;->u:I

    .line 2
    .line 3
    return-void
.end method

.method public j()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qvj;->show()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/qvj;->t:I

    .line 2
    .line 3
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/app/a;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/qvj;->E()Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/qvj;->o:Landroid/view/View;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/nu0;->setContentView(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Ll/qvj;->M()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onStart()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->onStart()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/qvj;->K()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onStop()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/nu0;->onStop()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/qvj;->m:Ll/bwj;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/bwj;->destroy()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public show()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/g1e;->show()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/qvj;->r:Ljava/lang/String;

    .line 5
    .line 6
    const-string v1, "from_meet_picks"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const-string v1, "showfrom_meet_sayhi"

    .line 13
    .line 14
    const-string v2, "e_chat_gift_bar"

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Ll/qvj;->q:Ljava/lang/String;

    .line 19
    .line 20
    const-string v0, "picks_say_hi"

    .line 21
    .line 22
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    filled-new-array {v0}, [Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v2, p0, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object v0, p0, Ll/qvj;->r:Ljava/lang/String;

    .line 35
    .line 36
    const-string v3, "from_meet_liked"

    .line 37
    .line 38
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iget-object p0, p0, Ll/qvj;->q:Ljava/lang/String;

    .line 43
    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    const-string v0, "I_like_say_hi"

    .line 47
    .line 48
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    filled-new-array {v0}, [Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-static {v2, p0, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_1
    invoke-static {v2, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method
