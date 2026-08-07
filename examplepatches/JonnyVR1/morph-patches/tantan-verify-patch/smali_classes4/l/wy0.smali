.class public Ll/wy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/py0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VEditText;

.field public b:Lv/VText;

.field public c:Landroidx/recyclerview/widget/RecyclerView;

.field public d:Lv/VMaterialEdit;

.field public e:Lv/VButton_FakeShadow;

.field public f:Lcom/p1/mobile/putong/core/newui/appeal/AppealAct;

.field public g:Ll/py0;

.field public h:Ljava/lang/String;

.field public i:Ll/jy0;

.field public j:Landroidx/recyclerview/widget/LinearLayoutManager;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/appeal/AppealAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/wy0;->h:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Ll/wy0;->f:Lcom/p1/mobile/putong/core/newui/appeal/AppealAct;

    .line 9
    .line 10
    new-instance p1, Ll/jy0;

    .line 11
    .line 12
    invoke-direct {p1, p0}, Ll/jy0;-><init>(Ll/wy0;)V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ll/wy0;->i:Ll/jy0;

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic a(Ll/wy0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wy0;->j(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic b(Ll/wy0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wy0;->m()V

    return-void
.end method

.method private synthetic j(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/wy0;->h:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    sget p0, Lcom/p1/mobile/putong/core/R$string;->Iq:I

    .line 10
    .line 11
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p1, p0, Ll/wy0;->f:Lcom/p1/mobile/putong/core/newui/appeal/AppealAct;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/appeal/AppealAct;->pageId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object v0, p0, Ll/wy0;->f:Lcom/p1/mobile/putong/core/newui/appeal/AppealAct;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/appeal/AppealAct;->b2()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "appeal_type"

    .line 28
    .line 29
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "e_p_appeal_reason_next"

    .line 38
    .line 39
    invoke-static {v1, p1, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 40
    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/data/AppealMaterial;->new_()Lcom/p1/mobile/putong/data/AppealMaterial;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iget-object v0, p0, Ll/wy0;->h:Ljava/lang/String;

    .line 47
    .line 48
    iput-object v0, p1, Lcom/p1/mobile/putong/data/AppealMaterial;->text:Ljava/lang/String;

    .line 49
    .line 50
    iget-object v0, p0, Ll/wy0;->d:Lv/VMaterialEdit;

    .line 51
    .line 52
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iput-object v0, p1, Lcom/p1/mobile/putong/data/AppealMaterial;->contact:Ljava/lang/String;

    .line 65
    .line 66
    iget-object p0, p0, Ll/wy0;->g:Ll/py0;

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Ll/py0;->p0(Lcom/p1/mobile/putong/data/AppealMaterial;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/wy0;->f:Lcom/p1/mobile/putong/core/newui/appeal/AppealAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/wy0;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/xy0;->b(Ll/wy0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/xy0;->c(Ll/wy0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wy0;->d()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/wy0;->f:Lcom/p1/mobile/putong/core/newui/appeal/AppealAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Ll/py0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wy0;->g:Ll/py0;

    .line 2
    .line 3
    return-void
.end method

.method public i()I
    .locals 0

    .line 1
    const/4 p0, 0x4

    .line 2
    return p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/py0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wy0;->f(Ll/py0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wy0;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k()Landroidx/recyclerview/widget/LinearLayoutManager;
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/wy0;->j:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/wy0;->j:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/wy0;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-direct {v0, v1, v2, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/wy0;->j:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 23
    .line 24
    return-object v0
.end method

.method public l()Ll/py0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wy0;->g:Ll/py0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final m()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wy0;->a:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/wy0;->h:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v1, p0, Ll/wy0;->e:Lv/VButton_FakeShadow;

    .line 18
    .line 19
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-virtual {v1, v0}, Landroid/view/View;->setActivated(Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/wy0;->h:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    const/16 v1, 0x78

    .line 33
    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    iget-object v0, p0, Ll/wy0;->h:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    sub-int/2addr v1, v0

    .line 43
    :cond_0
    iget-object p0, p0, Ll/wy0;->b:Lv/VText;

    .line 44
    .line 45
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wy0;->i:Ll/jy0;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/wy0;->k()Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object p0, p0, Ll/wy0;->i:Ll/jy0;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/jy0;->getItemCount()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    add-int/lit8 p0, p0, -0x1

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPosition(I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wy0;->f:Lcom/p1/mobile/putong/core/newui/appeal/AppealAct;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/R$string;->h0:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/wy0$a;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/wy0$a;-><init>(Ll/wy0;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ll/wy0;->a:Lv/VEditText;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/wy0;->m()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/wy0;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/wy0;->k()Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/wy0;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 31
    .line 32
    iget-object v1, p0, Ll/wy0;->i:Ll/jy0;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/wy0;->k()Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v1, p0, Ll/wy0;->i:Ll/jy0;

    .line 42
    .line 43
    invoke-virtual {v1}, Ll/jy0;->getItemCount()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    add-int/lit8 v1, v1, -0x1

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPosition(I)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/wy0;->e:Lv/VButton_FakeShadow;

    .line 53
    .line 54
    new-instance v1, Ll/vy0;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/vy0;-><init>(Ll/wy0;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method
