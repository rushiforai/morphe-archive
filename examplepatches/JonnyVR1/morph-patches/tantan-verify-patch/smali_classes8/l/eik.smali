.class public Ll/eik;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/eik$c;,
        Ll/eik$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/bik;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VEditText;

.field public c:Lv/VImage;

.field public d:Lv/VText;

.field public e:Lcom/p1/mobile/putong/core/ui/messages/group/GroupNicknameSetAct;

.field public f:Ll/bik;

.field public g:Lv/VText;

.field public h:Ljava/lang/String;

.field public i:Lcom/p1/mobile/putong/core/data/ChatGroupMember;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/group/GroupNicknameSetAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/eik;->e:Lcom/p1/mobile/putong/core/ui/messages/group/GroupNicknameSetAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/eik;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/eik;->v(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/eik;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/eik;->u(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic c(Ll/eik;)Lv/VImage;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eik;->c:Lv/VImage;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/eik;)Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eik;->d:Lv/VText;

    return-object p0
.end method

.method public static bridge synthetic e(Ll/eik;)Lcom/p1/mobile/putong/core/data/ChatGroupMember;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eik;->i:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/eik;)Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eik;->g:Lv/VText;

    return-object p0
.end method

.method public static bridge synthetic i(Ll/eik;Lv/VImage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eik;->c:Lv/VImage;

    return-void
.end method

.method public static bridge synthetic j(Ll/eik;Lv/VEditText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eik;->b:Lv/VEditText;

    return-void
.end method

.method public static bridge synthetic k(Ll/eik;Lv/VDraweeView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eik;->a:Lv/VDraweeView;

    return-void
.end method

.method public static bridge synthetic l(Ll/eik;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eik;->d:Lv/VText;

    return-void
.end method

.method public static bridge synthetic m(Ll/eik;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/eik;->s()Z

    move-result p0

    return p0
.end method

.method private s()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/eik;->b:Lv/VEditText;

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
    if-nez v1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/eik;->h:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method private synthetic u(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/eik;->e:Lcom/p1/mobile/putong/core/ui/messages/group/GroupNicknameSetAct;

    .line 2
    .line 3
    iget-object v0, p0, Ll/eik;->b:Lv/VEditText;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/eik;->f:Ll/bik;

    .line 9
    .line 10
    iget-object p0, p0, Ll/eik;->b:Lv/VEditText;

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
    invoke-virtual {p1, p0}, Ll/bik;->q0(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private synthetic v(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eik;->b:Lv/VEditText;

    .line 2
    .line 3
    const-string p1, ""

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public A3(Ljava/lang/String;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/eik;->h:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v0, p0, Ll/eik;->b:Lv/VEditText;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/eik;->b:Lv/VEditText;

    .line 9
    .line 10
    new-instance v0, Ll/eik$a;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/eik$a;-><init>(Ll/eik;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/eik;->c:Lv/VImage;

    .line 19
    .line 20
    new-instance v0, Ll/dik;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/dik;-><init>(Ll/eik;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/eik;->e:Lcom/p1/mobile/putong/core/ui/messages/group/GroupNicknameSetAct;

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
    check-cast p1, Ll/bik;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/eik;->p(Ll/bik;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/eik;->n(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public n(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/eik$c;->a(Ll/eik;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public p(Ll/bik;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eik;->f:Ll/bik;

    .line 2
    .line 3
    return-void
.end method

.method public q(Landroid/view/Menu;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/eik;->e:Lcom/p1/mobile/putong/core/ui/messages/group/GroupNicknameSetAct;

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
    iput-object p1, p0, Ll/eik;->g:Lv/VText;

    .line 31
    .line 32
    iget-object p1, p0, Ll/eik;->i:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 33
    .line 34
    invoke-static {p1}, Ll/mgk;->e(Lcom/p1/mobile/putong/core/data/ChatGroupMember;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    iget-object v0, p0, Ll/eik;->g:Lv/VText;

    .line 39
    .line 40
    if-eqz p1, :cond_0

    .line 41
    .line 42
    new-instance p1, Ll/eik$b;

    .line 43
    .line 44
    iget-object v1, p0, Ll/eik;->b:Lv/VEditText;

    .line 45
    .line 46
    iget-object v2, p0, Ll/eik;->c:Lv/VImage;

    .line 47
    .line 48
    invoke-direct {p1, v0, v1, v2}, Ll/eik$b;-><init>(Lv/VText;Lv/VEditText;Lv/VImage;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Ll/eik;->i:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/InModeration;->nickName:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {p1, p0}, Ll/mgk;->f(Ll/eik$b;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    invoke-direct {p0}, Ll/eik;->s()Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Ll/eik;->g:Lv/VText;

    .line 69
    .line 70
    new-instance v0, Ll/cik;

    .line 71
    .line 72
    invoke-direct {v0, p0}, Ll/cik;-><init>(Ll/eik;)V

    .line 73
    .line 74
    .line 75
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 76
    .line 77
    .line 78
    :goto_0
    const/4 p0, 0x1

    .line 79
    return p0
.end method

.method public w(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V
    .locals 2

    .line 1
    iput-object p2, p0, Ll/eik;->i:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 2
    .line 3
    invoke-static {p1}, Ll/jek;->s(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 10
    .line 11
    iget-object v0, p0, Ll/eik;->a:Lv/VDraweeView;

    .line 12
    .line 13
    invoke-static {p2}, Ll/jek;->j(Lcom/p1/mobile/putong/core/data/ChatGroupMember;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p1, v0, v1}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 22
    .line 23
    iget-object v0, p0, Ll/eik;->a:Lv/VDraweeView;

    .line 24
    .line 25
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p1, v0, v1}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :goto_0
    invoke-static {p2}, Ll/mgk;->e(Lcom/p1/mobile/putong/core/data/ChatGroupMember;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    new-instance p1, Ll/eik$b;

    .line 37
    .line 38
    iget-object v0, p0, Ll/eik;->g:Lv/VText;

    .line 39
    .line 40
    iget-object v1, p0, Ll/eik;->b:Lv/VEditText;

    .line 41
    .line 42
    iget-object p0, p0, Ll/eik;->c:Lv/VImage;

    .line 43
    .line 44
    invoke-direct {p1, v0, v1, p0}, Ll/eik$b;-><init>(Lv/VText;Lv/VEditText;Lv/VImage;)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/InModeration;->nickName:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {p1, p0}, Ll/mgk;->f(Ll/eik$b;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    iget-object p1, p0, Ll/eik;->b:Lv/VEditText;

    .line 56
    .line 57
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupMemberName()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Ll/eik;->b:Lv/VEditText;

    .line 65
    .line 66
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 75
    .line 76
    .line 77
    return-void
.end method
