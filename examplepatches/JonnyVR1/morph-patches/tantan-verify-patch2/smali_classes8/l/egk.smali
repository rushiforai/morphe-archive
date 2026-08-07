.class public Ll/egk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/egk$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/cgk;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VEditText;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Lcom/p1/mobile/putong/core/ui/messages/group/GroupDescriptionEditAct;

.field public e:Ll/cgk;

.field public f:Lv/VText;

.field public g:Ljava/lang/String;

.field public h:Lcom/p1/mobile/putong/core/data/ChatGroup;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/group/GroupDescriptionEditAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/egk;->d:Lcom/p1/mobile/putong/core/ui/messages/group/GroupDescriptionEditAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/egk;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/egk;->p(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic b(Ll/egk;)Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/egk;->c:Lv/VText;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/egk;)Lcom/p1/mobile/putong/core/data/ChatGroup;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/egk;->h:Lcom/p1/mobile/putong/core/data/ChatGroup;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/egk;)Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/egk;->f:Lv/VText;

    return-object p0
.end method

.method public static bridge synthetic e(Ll/egk;Lv/VEditText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/egk;->a:Lv/VEditText;

    return-void
.end method

.method public static bridge synthetic f(Ll/egk;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/egk;->c:Lv/VText;

    return-void
.end method

.method public static bridge synthetic i(Ll/egk;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/egk;->b:Lv/VText;

    return-void
.end method

.method public static bridge synthetic j(Ll/egk;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/egk;->n()Z

    move-result p0

    return p0
.end method


# virtual methods
.method public A3(Ljava/lang/String;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/egk;->g:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v0, p0, Ll/egk;->a:Lv/VEditText;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/egk;->a:Lv/VEditText;

    .line 9
    .line 10
    new-instance v0, Ll/egk$a;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/egk$a;-><init>(Ll/egk;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 16
    .line 17
    .line 18
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/e;->Q6()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-nez p1, :cond_0

    .line 31
    .line 32
    iget-object p0, p0, Ll/egk;->b:Lv/VText;

    .line 33
    .line 34
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/e;->Q6()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/egk;->d:Lcom/p1/mobile/putong/core/ui/messages/group/GroupDescriptionEditAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/cgk;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/egk;->l(Ll/cgk;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/egk;->k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/egk$b;->a(Ll/egk;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l(Ll/cgk;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/egk;->e:Ll/cgk;

    .line 2
    .line 3
    return-void
.end method

.method public m(Landroid/view/Menu;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/egk;->d:Lcom/p1/mobile/putong/core/ui/messages/group/GroupDescriptionEditAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getMenuInflater()Landroid/view/MenuInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/nfc0;->b:I

    .line 8
    .line 9
    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 10
    .line 11
    .line 12
    sget v0, Ll/edc0;->j2:I

    .line 13
    .line 14
    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    sget v0, Ll/edc0;->i5:I

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Lv/VText;

    .line 29
    .line 30
    iput-object p1, p0, Ll/egk;->f:Lv/VText;

    .line 31
    .line 32
    iget-object p1, p0, Ll/egk;->h:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 33
    .line 34
    invoke-static {p1}, Ll/mgk;->b(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    iget-object v0, p0, Ll/egk;->f:Lv/VText;

    .line 39
    .line 40
    if-eqz p1, :cond_0

    .line 41
    .line 42
    new-instance p1, Ll/eik$b;

    .line 43
    .line 44
    iget-object v1, p0, Ll/egk;->a:Lv/VEditText;

    .line 45
    .line 46
    const/4 v2, 0x0

    .line 47
    invoke-direct {p1, v0, v1, v2}, Ll/eik$b;-><init>(Lv/VText;Lv/VEditText;Lv/VImage;)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Ll/egk;->h:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/InModeration;->description:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {p1, p0}, Ll/mgk;->f(Ll/eik$b;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    invoke-virtual {p0}, Ll/egk;->n()Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ll/egk;->f:Lv/VText;

    .line 68
    .line 69
    new-instance v0, Ll/dgk;

    .line 70
    .line 71
    invoke-direct {v0, p0}, Ll/dgk;-><init>(Ll/egk;)V

    .line 72
    .line 73
    .line 74
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 75
    .line 76
    .line 77
    :goto_0
    const/4 p0, 0x1

    .line 78
    return p0
.end method

.method public final n()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/egk;->a:Lv/VEditText;

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
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :cond_0
    iget-object p0, p0, Ll/egk;->g:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    xor-int/lit8 p0, p0, 0x1

    .line 30
    .line 31
    return p0
.end method

.method public final synthetic p(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/egk;->d:Lcom/p1/mobile/putong/core/ui/messages/group/GroupDescriptionEditAct;

    .line 2
    .line 3
    iget-object v0, p0, Ll/egk;->a:Lv/VEditText;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/egk;->e:Ll/cgk;

    .line 9
    .line 10
    iget-object p0, p0, Ll/egk;->a:Lv/VEditText;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p1, p0}, Ll/cgk;->q0(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public q(Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/egk;->h:Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 2
    .line 3
    invoke-static {p1}, Ll/mgk;->b(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ll/eik$b;

    .line 10
    .line 11
    iget-object v1, p0, Ll/egk;->f:Lv/VText;

    .line 12
    .line 13
    iget-object p0, p0, Ll/egk;->a:Lv/VEditText;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-direct {v0, v1, p0, v2}, Ll/eik$b;-><init>(Lv/VText;Lv/VEditText;Lv/VImage;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/InModeration;->description:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0, p0}, Ll/mgk;->f(Ll/eik$b;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object v0, p0, Ll/egk;->a:Lv/VEditText;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/egk;->a:Lv/VEditText;

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 45
    .line 46
    .line 47
    return-void
.end method
