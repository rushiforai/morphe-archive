.class public Ll/bfk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/bfk$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/xek;",
        ">;",
        "Landroid/text/TextWatcher;"
    }
.end annotation


# instance fields
.field public a:Lv/VScroll;

.field public b:Lv/VText;

.field public c:Lv/VEditText;

.field public d:Landroid/widget/TextView;

.field public e:Lv/VButton;

.field public final f:Lcom/p1/mobile/putong/core/newui/group/GroupCreateDescriptionAct;

.field public g:Ll/xek;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/group/GroupCreateDescriptionAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/bfk;->f:Lcom/p1/mobile/putong/core/newui/group/GroupCreateDescriptionAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/bfk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/bfk;->k()V

    return-void
.end method

.method public static bridge synthetic b(Ll/bfk;Lv/VButton;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bfk;->e:Lv/VButton;

    return-void
.end method

.method public static bridge synthetic c(Ll/bfk;Lv/VScroll;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bfk;->a:Lv/VScroll;

    return-void
.end method

.method public static bridge synthetic d(Ll/bfk;Lv/VEditText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bfk;->c:Lv/VEditText;

    return-void
.end method

.method public static bridge synthetic e(Ll/bfk;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bfk;->d:Landroid/widget/TextView;

    return-void
.end method

.method public static bridge synthetic f(Ll/bfk;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bfk;->b:Lv/VText;

    return-void
.end method

.method private synthetic k()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bfk;->c:Lv/VEditText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setFocusable(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/bfk;->c:Lv/VEditText;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/bfk;->c:Lv/VEditText;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/bfk;->f:Lcom/p1/mobile/putong/core/newui/group/GroupCreateDescriptionAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bfk;->l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/bfk$a;->a(Ll/bfk;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/xek;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/bfk;->j(Ll/xek;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bfk;->i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Ll/xek;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bfk;->g:Ll/xek;

    .line 2
    .line 3
    return-void
.end method

.method public final l()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bfk;->d:Landroid/widget/TextView;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, ""

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, Ll/bfk;->c:Lv/VEditText;

    .line 11
    .line 12
    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v2, "/300"

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/bfk;->g:Ll/xek;

    .line 36
    .line 37
    iget-object v1, p0, Ll/bfk;->c:Lv/VEditText;

    .line 38
    .line 39
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Ll/xek;->t0(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/bfk;->e:Lv/VButton;

    .line 51
    .line 52
    iget-object p0, p0, Ll/bfk;->g:Ll/xek;

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/xek;->l0()Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    invoke-virtual {v0, p0}, Landroid/view/View;->setEnabled(Z)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    return-void
.end method

.method public r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bfk;->f:Lcom/p1/mobile/putong/core/newui/group/GroupCreateDescriptionAct;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/bfk;->c:Lv/VEditText;

    .line 9
    .line 10
    const/16 v1, 0x12c

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lv/VEditText;->setMaxLength(I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/bfk;->c:Lv/VEditText;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/bfk;->c:Lv/VEditText;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/bfk;->l()V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/bfk;->e:Lv/VButton;

    .line 29
    .line 30
    iget-object v1, p0, Ll/bfk;->g:Ll/xek;

    .line 31
    .line 32
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    new-instance v2, Ll/yek;

    .line 36
    .line 37
    invoke-direct {v2, v1}, Ll/yek;-><init>(Ll/xek;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/bfk;->c:Lv/VEditText;

    .line 44
    .line 45
    iget-object v1, p0, Ll/bfk;->g:Ll/xek;

    .line 46
    .line 47
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    new-instance v2, Ll/zek;

    .line 51
    .line 52
    invoke-direct {v2, v1}, Ll/zek;-><init>(Ll/xek;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/bfk;->c:Lv/VEditText;

    .line 59
    .line 60
    new-instance v1, Ll/afk;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/afk;-><init>(Ll/bfk;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 66
    .line 67
    .line 68
    return-void
.end method
