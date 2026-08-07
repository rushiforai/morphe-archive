.class public Ll/ns3;
.super Ll/jbf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jbf0<",
        "Ll/js3;",
        "Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CCodeChooseAct;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lv/VRecyclerView;

.field public d:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public e:Lv/VImage;

.field public f:Lv/VImage;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Landroid/view/View;

.field public j:Lv/VSearchBar;

.field public k:Ll/is3;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CCodeChooseAct;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CCodeChooseAct;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/jbf0;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j(Ll/ns3;Ll/nsb;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ns3;->q(Ll/nsb;)V

    return-void
.end method

.method public static synthetic k(Ll/ns3;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ns3;->p(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic l(Ll/ns3;)Ll/is3;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ns3;->k:Ll/is3;

    return-object p0
.end method

.method public static bridge synthetic m(Ll/ns3;Ljava/lang/String;Ll/nsb;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ns3;->s(Ljava/lang/String;Ll/nsb;)Z

    move-result p0

    return p0
.end method

.method private synthetic p(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CCodeChooseAct;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CCodeChooseAct;->onBackPressed()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ns3;->n(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/ns3;->r()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public n(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/os3;->b(Ll/ns3;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic q(Ll/nsb;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "from"

    .line 7
    .line 8
    const-string v2, "CcodeChoose"

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string v1, "ccode"

    .line 14
    .line 15
    iget p1, p1, Ll/nsb;->b:I

    .line 16
    .line 17
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 21
    .line 22
    check-cast p1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CCodeChooseAct;

    .line 23
    .line 24
    const/4 v1, -0x1

    .line 25
    invoke-virtual {p1, v1, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 29
    .line 30
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CCodeChooseAct;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public r()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ns3;->e:Lv/VImage;

    .line 2
    .line 3
    new-instance v1, Ll/ks3;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/ks3;-><init>(Ll/ns3;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/ns3;->f:Lv/VImage;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/ns3;->g:Lv/VText;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/ns3;->h:Lv/VText;

    .line 23
    .line 24
    sget v2, Lcom/p1/mobile/putong/account/R$string;->I:I

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 27
    .line 28
    .line 29
    new-instance v0, Ll/is3;

    .line 30
    .line 31
    iget-object v2, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 32
    .line 33
    invoke-direct {v0, v2}, Ll/is3;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Ll/ns3;->k:Ll/is3;

    .line 37
    .line 38
    new-instance v2, Ll/ls3;

    .line 39
    .line 40
    invoke-direct {v2, p0}, Ll/ls3;-><init>(Ll/ns3;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v2}, Ll/is3;->J(Ll/is3$a;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/ns3;->k:Ll/is3;

    .line 47
    .line 48
    sget-object v2, Ll/nsb;->d:Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-virtual {v0, v2}, Ll/is3;->I(Ljava/util/List;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/ns3;->c:Lv/VRecyclerView;

    .line 54
    .line 55
    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 56
    .line 57
    iget-object v3, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 58
    .line 59
    const/4 v4, 0x1

    .line 60
    invoke-direct {v2, v3, v4, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/ns3;->c:Lv/VRecyclerView;

    .line 67
    .line 68
    iget-object v1, p0, Ll/ns3;->k:Ll/is3;

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/ns3;->j:Lv/VSearchBar;

    .line 74
    .line 75
    new-instance v1, Ll/ns3$a;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/ns3$a;-><init>(Ll/ns3;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v1}, Lv/VSearchBar;->d(Landroid/text/TextWatcher;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public final s(Ljava/lang/String;Ll/nsb;)Z
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "+"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p2, Ll/nsb;->b:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 18
    .line 19
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/CCodeChooseAct;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iget p2, p2, Ll/nsb;->a:I

    .line 26
    .line 27
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-nez p0, :cond_1

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_0

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const/4 p0, 0x0

    .line 45
    return p0

    .line 46
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 47
    return p0
.end method
