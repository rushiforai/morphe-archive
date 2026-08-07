.class public Ll/w200;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/u200;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VMaterialEdit;

.field public b:Ll/u200;

.field public c:Lcom/p1/mobile/putong/core/ui/messages/MessageNicknameSettingAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/MessageNicknameSettingAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/w200;->c:Lcom/p1/mobile/putong/core/ui/messages/MessageNicknameSettingAct;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public A3(Ljava/lang/String;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/w200;->a:Lv/VMaterialEdit;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->setFloatingLabel(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/w200;->a:Lv/VMaterialEdit;

    .line 8
    .line 9
    iget-object v2, p0, Ll/w200;->c:Lcom/p1/mobile/putong/core/ui/messages/MessageNicknameSettingAct;

    .line 10
    .line 11
    invoke-virtual {v2}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    sget v3, Ll/g9c0;->k:I

    .line 16
    .line 17
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-virtual {v0, v2}, Lcom/rengwuxian/materialedittext/MaterialEditText;->setPrimaryColor(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/w200;->a:Lv/VMaterialEdit;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->setFloatingLabelAlwaysShown(Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/w200;->a:Lv/VMaterialEdit;

    .line 30
    .line 31
    new-instance v2, Landroid/text/InputFilter$LengthFilter;

    .line 32
    .line 33
    const/16 v3, 0xf

    .line 34
    .line 35
    invoke-direct {v2, v3}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    .line 36
    .line 37
    .line 38
    const/4 v4, 0x1

    .line 39
    new-array v4, v4, [Landroid/text/InputFilter;

    .line 40
    .line 41
    aput-object v2, v4, v1

    .line 42
    .line 43
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/w200;->a:Lv/VMaterialEdit;

    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/w200;->a:Lv/VMaterialEdit;

    .line 52
    .line 53
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Ll/w200;->a:Lv/VMaterialEdit;

    .line 57
    .line 58
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    invoke-static {p1, v3}, Ljava/lang/Math;->min(II)I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/w200;->c:Lcom/p1/mobile/putong/core/ui/messages/MessageNicknameSettingAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/x200;->b(Ll/w200;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/w200;->c:Lcom/p1/mobile/putong/core/ui/messages/MessageNicknameSettingAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Ll/u200;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w200;->b:Ll/u200;

    .line 2
    .line 3
    return-void
.end method

.method public c(Landroid/view/Menu;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/w200;->c:Lcom/p1/mobile/putong/core/ui/messages/MessageNicknameSettingAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getMenuInflater()Landroid/view/MenuInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/nfc0;->c:I

    .line 8
    .line 9
    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 10
    .line 11
    .line 12
    sget v0, Ll/edc0;->x0:I

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
    const/4 v0, 0x1

    .line 23
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 24
    .line 25
    .line 26
    new-instance v1, Ll/v200;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/v200;-><init>(Ll/w200;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 32
    .line 33
    .line 34
    return v0
.end method

.method public d(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string v0, "e_save_nickname"

    .line 2
    .line 3
    const-string v1, "p_set_nickname"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/w200;->a:Lv/VMaterialEdit;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/widget/TextView;->getEditableText()Landroid/text/Editable;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v1, Ll/uqb0;->Z:Ll/a4j;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ll/a4j;->K(Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_2

    .line 25
    .line 26
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_0

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-static {p1}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-nez p1, :cond_1

    .line 52
    .line 53
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->B2:I

    .line 54
    .line 55
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iget-object p0, p0, Ll/w200;->b:Ll/u200;

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Ll/u200;->k0(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_2
    :goto_0
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->U5:I

    .line 70
    .line 71
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/u200;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/w200;->b(Ll/u200;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/w200;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
