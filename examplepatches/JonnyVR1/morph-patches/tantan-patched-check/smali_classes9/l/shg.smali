.class public Ll/shg;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/xhg;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Lv/VText;

.field public l:Lv/VEditText;

.field public m:Lv/VText;

.field public n:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/xhg;)V
    .locals 2
    .param p2    # Ll/xhg;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/yec0;->w0:I

    .line 2
    .line 3
    invoke-static {}, Ll/qag0;->g()Ll/rq2;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {p0, v0, p1, p2, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;Ll/rq2;)V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->B(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic F(Ll/shg;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/shg;->I(Landroid/view/View;)V

    return-void
.end method

.method private synthetic I(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/xhg;

    .line 6
    .line 7
    iget-object v0, p0, Ll/shg;->l:Lv/VEditText;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p1, v0}, Ll/xhg;->V3(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/shg;->l:Lv/VEditText;

    .line 21
    .line 22
    const-string p1, ""

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/xhg;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/cyr;->C0()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final G(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/thg;->a(Ll/shg;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public H(Ll/xhg;)V
    .locals 0

    .line 1
    return-void
.end method

.method public J()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/shg;->l:Lv/VEditText;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ll/wyd0;

    .line 7
    .line 8
    new-instance v1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v2, "live_fans_recall_content"

    .line 11
    .line 12
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    sget-object v2, Ll/uqb0;->b0:Ll/sre0;

    .line 16
    .line 17
    iget-object v2, v2, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 18
    .line 19
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string v2, ""

    .line 31
    .line 32
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/shg;->l:Lv/VEditText;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v0, p0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public K(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/shg;->n:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/shg;->L()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final L()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/shg;->m:Lv/VText;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v1, p0, Ll/shg;->k:Lv/VText;

    .line 6
    .line 7
    if-eqz v1, :cond_3

    .line 8
    .line 9
    iget-boolean v1, p0, Ll/shg;->n:Z

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Kb:I

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Lb:I

    .line 17
    .line 18
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/shg;->k:Lv/VText;

    .line 22
    .line 23
    iget-boolean v1, p0, Ll/shg;->n:Z

    .line 24
    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->i3:I

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->j3:I

    .line 31
    .line 32
    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 33
    .line 34
    .line 35
    new-instance v0, Ll/wyd0;

    .line 36
    .line 37
    new-instance v1, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v2, "live_fans_recall_content"

    .line 40
    .line 41
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    sget-object v2, Ll/uqb0;->b0:Ll/sre0;

    .line 45
    .line 46
    iget-object v2, v2, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 47
    .line 48
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    const-string v2, ""

    .line 60
    .line 61
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    check-cast v1, Ljava/lang/CharSequence;

    .line 69
    .line 70
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-nez v1, :cond_2

    .line 75
    .line 76
    iget-object v1, p0, Ll/shg;->l:Lv/VEditText;

    .line 77
    .line 78
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Ljava/lang/CharSequence;

    .line 83
    .line 84
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    .line 86
    .line 87
    iget-object p0, p0, Ll/shg;->m:Lv/VText;

    .line 88
    .line 89
    const/4 v0, 0x1

    .line 90
    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_2
    iget-object p0, p0, Ll/shg;->m:Lv/VText;

    .line 95
    .line 96
    const/4 v0, 0x0

    .line 97
    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 98
    .line 99
    .line 100
    :cond_3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/xhg;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/shg;->H(Ll/xhg;)V

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

.method public m(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/shg;->G(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    const/16 p1, 0x11

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->A(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/shg;->L()V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/shg;->l:Lv/VEditText;

    .line 16
    .line 17
    new-instance v0, Ll/shg$a;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/shg$a;-><init>(Ll/shg;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Ll/shg;->m:Lv/VText;

    .line 26
    .line 27
    new-instance v0, Ll/rhg;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll/rhg;-><init>(Ll/shg;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public bridge synthetic n(Ll/y8s;)V
    .locals 0

    .line 1
    check-cast p1, Ll/xhg;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/shg;->H(Ll/xhg;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
