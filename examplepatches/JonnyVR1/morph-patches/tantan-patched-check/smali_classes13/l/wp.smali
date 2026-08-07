.class public Ll/wp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/mp;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Lv/VText;

.field public c:Lv/VLinear;

.field public d:Lv/VEditText;

.field public e:Lv/VButton_FakeShadow;

.field public f:Lcom/p1/mobile/putong/core/ui/account/AccountInactiveAct;

.field public g:Ll/mp;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/account/AccountInactiveAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wp;->f:Lcom/p1/mobile/putong/core/ui/account/AccountInactiveAct;

    .line 5
    .line 6
    return-void
.end method

.method private synthetic A(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/wp;->g:Ll/mp;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/mp;->g0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Ll/wp;->g:Ll/mp;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/mp;->h0()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/wp;->d:Lv/VEditText;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_0

    .line 34
    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string p1, "\uff1b"

    .line 44
    .line 45
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Ll/wp;->d:Lv/VEditText;

    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    :cond_0
    const-string v0, "delete_account_specific_reason"

    .line 70
    .line 71
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    filled-new-array {p1}, [Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    const-string v0, "e_delete_account_specific_reason_submit"

    .line 80
    .line 81
    const-string v1, "p_delete_account_specific_reason"

    .line 82
    .line 83
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Ll/wp;->m()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveAct;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    const-string v0, "input_method"

    .line 91
    .line 92
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    check-cast p1, Landroid/view/inputmethod/InputMethodManager;

    .line 97
    .line 98
    iget-object v0, p0, Ll/wp;->g:Ll/mp;

    .line 99
    .line 100
    invoke-virtual {v0}, Ll/mp;->h0()Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    const/4 v1, 0x0

    .line 105
    if-eqz v0, :cond_3

    .line 106
    .line 107
    iget-object v0, p0, Ll/wp;->d:Lv/VEditText;

    .line 108
    .line 109
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-eqz v0, :cond_2

    .line 118
    .line 119
    iget-object v0, p0, Ll/wp;->d:Lv/VEditText;

    .line 120
    .line 121
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    if-eqz v0, :cond_1

    .line 138
    .line 139
    goto :goto_0

    .line 140
    :cond_1
    iget-object v0, p0, Ll/wp;->e:Lv/VButton_FakeShadow;

    .line 141
    .line 142
    invoke-virtual {v0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-virtual {p1, v0, v1}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0}, Ll/wp;->F()V

    .line 150
    .line 151
    .line 152
    return-void

    .line 153
    :cond_2
    :goto_0
    const-string p0, "\u8bf7\u8f93\u5165\u5177\u4f53\u539f\u56e0"

    .line 154
    .line 155
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    return-void

    .line 159
    :cond_3
    iget-object v0, p0, Ll/wp;->e:Lv/VButton_FakeShadow;

    .line 160
    .line 161
    invoke-virtual {v0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    invoke-virtual {p1, v0, v1}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 166
    .line 167
    .line 168
    invoke-virtual {p0}, Ll/wp;->F()V

    .line 169
    .line 170
    .line 171
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/account/AccountInactiveDetailItemView;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveDetailItemView;->a:Lv/VCheckBox;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    xor-int/lit8 p1, p1, 0x1

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic b(Ll/wp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wp;->z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/wp;Lcom/p1/mobile/putong/core/data/InactivateReason;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wp;->x(Lcom/p1/mobile/putong/core/data/InactivateReason;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/wp;Landroid/view/inputmethod/InputMethodManager;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wp;->C(Landroid/view/inputmethod/InputMethodManager;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/wp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wp;->y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/wp;Lcom/p1/mobile/putong/core/data/InactivateReasonDetail;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/wp;->w(Lcom/p1/mobile/putong/core/data/InactivateReasonDetail;Landroid/widget/CompoundButton;Z)V

    return-void
.end method

.method public static synthetic i(Ll/wp;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wp;->E()V

    return-void
.end method

.method public static synthetic j(Ll/wp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wp;->B(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Ll/wp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wp;->A(Landroid/view/View;)V

    return-void
.end method

.method private synthetic y(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wp;->m()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic z(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wp;->m()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final synthetic B(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wp;->m()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic C(Landroid/view/inputmethod/InputMethodManager;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p2, "delete_account_specific_reason"

    .line 2
    .line 3
    const-string v0, "\u5176\u4ed6"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    filled-new-array {p2}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    const-string v0, "e_delete_account_edit_reason_submit"

    .line 14
    .line 15
    const-string v1, "p_delete_account_edit_reason"

    .line 16
    .line 17
    invoke-static {v0, v1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    iget-object p2, p0, Ll/wp;->d:Lv/VEditText;

    .line 21
    .line 22
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    if-eqz p2, :cond_1

    .line 31
    .line 32
    iget-object p2, p0, Ll/wp;->d:Lv/VEditText;

    .line 33
    .line 34
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    if-eqz p2, :cond_0

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    iget-object p2, p0, Ll/wp;->e:Lv/VButton_FakeShadow;

    .line 54
    .line 55
    invoke-virtual {p2}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    const/4 v0, 0x0

    .line 60
    invoke-virtual {p1, p2, v0}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Ll/wp;->F()V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_1
    :goto_0
    const-string p0, "\u8bf7\u8f93\u5165\u5177\u4f53\u539f\u56e0"

    .line 68
    .line 69
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/wp;->f:Lcom/p1/mobile/putong/core/ui/account/AccountInactiveAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic E()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wp;->d:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public F()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/wp;->d:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/wp;->d:Lv/VEditText;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, Ll/wp;->d:Lv/VEditText;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    goto :goto_0

    .line 48
    :cond_0
    const-string v0, ""

    .line 49
    .line 50
    :goto_0
    iget-object v1, p0, Ll/wp;->g:Ll/mp;

    .line 51
    .line 52
    iget-object v1, v1, Ll/mp;->a:Ljava/util/HashMap;

    .line 53
    .line 54
    invoke-virtual {v1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-eqz v1, :cond_1

    .line 67
    .line 68
    iget-object v1, p0, Ll/wp;->g:Ll/mp;

    .line 69
    .line 70
    iget-object v1, v1, Ll/mp;->a:Ljava/util/HashMap;

    .line 71
    .line 72
    invoke-virtual {v1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    check-cast v1, Ljava/util/Map$Entry;

    .line 85
    .line 86
    invoke-virtual {p0}, Ll/wp;->m()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveAct;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-virtual {p0}, Ll/wp;->m()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveAct;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    iget-object v4, p0, Ll/wp;->g:Ll/mp;

    .line 95
    .line 96
    iget-object v4, v4, Ll/mp;->b:Ljava/lang/String;

    .line 97
    .line 98
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v5

    .line 102
    check-cast v5, Ljava/lang/String;

    .line 103
    .line 104
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    check-cast v1, Ljava/lang/String;

    .line 109
    .line 110
    invoke-static {v3, v4, v5, v1, v0}, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveConfirmAct;->Z1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {v2, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 115
    .line 116
    .line 117
    iget-object p0, p0, Ll/wp;->g:Ll/mp;

    .line 118
    .line 119
    invoke-virtual {p0}, Ll/mp;->n0()V

    .line 120
    .line 121
    .line 122
    :cond_1
    return-void
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wp;->m()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
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
    check-cast p1, Ll/mp;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wp;->q(Ll/mp;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wp;->l(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/xp;->b(Ll/wp;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wp;->f:Lcom/p1/mobile/putong/core/ui/account/AccountInactiveAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final n(Landroid/widget/LinearLayout;Lcom/p1/mobile/putong/core/data/InactivateReasonDetail;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/wp;->m()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/sec0;->n:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveDetailItemView;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, v0, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveDetailItemView;->b:Lv/VText;

    .line 22
    .line 23
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/InactivateReasonDetail;->name:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    new-instance p1, Ll/up;

    .line 29
    .line 30
    invoke-direct {p1, v0}, Ll/up;-><init>(Lcom/p1/mobile/putong/core/ui/account/AccountInactiveDetailItemView;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, v0, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveDetailItemView;->a:Lv/VCheckBox;

    .line 37
    .line 38
    new-instance v0, Ll/vp;

    .line 39
    .line 40
    invoke-direct {v0, p0, p2}, Ll/vp;-><init>(Ll/wp;Lcom/p1/mobile/putong/core/data/InactivateReasonDetail;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final p(Landroid/widget/LinearLayout;Lcom/p1/mobile/putong/core/data/InactivateReason;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/wp;->m()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/sec0;->o:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveMainItemView;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, v0, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveMainItemView;->a:Lv/VText;

    .line 22
    .line 23
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/InactivateReason;->name:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    new-instance p1, Ll/tp;

    .line 29
    .line 30
    invoke-direct {p1, p0, p2}, Ll/tp;-><init>(Ll/wp;Lcom/p1/mobile/putong/core/data/InactivateReason;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public q(Ll/mp;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wp;->g:Ll/mp;

    .line 2
    .line 3
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/core/data/InactivateReason;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wp;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/InactivateReason;->name:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/wp;->a:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    new-instance v1, Ll/rp;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/rp;-><init>(Ll/wp;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/wp;->m()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveAct;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/wp;->b:Lv/VText;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/wp;->b:Lv/VText;

    .line 32
    .line 33
    const-string v2, "\u8bf7\u95ee\u4f60\u79bb\u5f00\u7684\u5177\u4f53\u539f\u56e0\u662f\u4ec0\u4e48\u5462\uff1f"

    .line 34
    .line 35
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/wp;->e:Lv/VButton_FakeShadow;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/wp;->d:Lv/VEditText;

    .line 44
    .line 45
    const/16 v2, 0x8

    .line 46
    .line 47
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/wp;->c:Lv/VLinear;

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/InactivateReason;->reasons:Ljava/util/List;

    .line 56
    .line 57
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_0

    .line 66
    .line 67
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Lcom/p1/mobile/putong/core/data/InactivateReasonDetail;

    .line 72
    .line 73
    iget-object v2, p0, Ll/wp;->c:Lv/VLinear;

    .line 74
    .line 75
    invoke-virtual {p0, v2, v0}, Ll/wp;->n(Landroid/widget/LinearLayout;Lcom/p1/mobile/putong/core/data/InactivateReasonDetail;)V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_0
    iget-object p1, p0, Ll/wp;->e:Lv/VButton_FakeShadow;

    .line 80
    .line 81
    invoke-virtual {p1, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Ll/wp;->e:Lv/VButton_FakeShadow;

    .line 85
    .line 86
    new-instance v0, Ll/sp;

    .line 87
    .line 88
    invoke-direct {v0, p0}, Ll/sp;-><init>(Ll/wp;)V

    .line 89
    .line 90
    .line 91
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public u(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/InactivateReason;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/wp;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wp;->m()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveAct;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->m0:I

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/wp;->a:Lv/navigationbar/VNavigationBar;

    .line 17
    .line 18
    new-instance v1, Ll/np;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/np;-><init>(Ll/wp;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/wp;->m()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveAct;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/wp;->b:Lv/VText;

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/wp;->b:Lv/VText;

    .line 40
    .line 41
    const-string v2, "\u8bf7\u95ee\u4f60\u4e3a\u4ec0\u4e48\u8981\u79bb\u5f00\u63a2\u63a2\u5462\uff1f"

    .line 42
    .line 43
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/wp;->e:Lv/VButton_FakeShadow;

    .line 47
    .line 48
    const/16 v2, 0x8

    .line 49
    .line 50
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/wp;->d:Lv/VEditText;

    .line 54
    .line 55
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/wp;->c:Lv/VLinear;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 61
    .line 62
    .line 63
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_0

    .line 72
    .line 73
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Lcom/p1/mobile/putong/core/data/InactivateReason;

    .line 78
    .line 79
    iget-object v1, p0, Ll/wp;->c:Lv/VLinear;

    .line 80
    .line 81
    invoke-virtual {p0, v1, v0}, Ll/wp;->p(Landroid/widget/LinearLayout;Lcom/p1/mobile/putong/core/data/InactivateReason;)V

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_0
    return-void
.end method

.method public v()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/wp;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wp;->m()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveAct;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->t0:I

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/wp;->a:Lv/navigationbar/VNavigationBar;

    .line 17
    .line 18
    new-instance v1, Ll/op;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/op;-><init>(Ll/wp;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/wp;->b:Lv/VText;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/wp;->b:Lv/VText;

    .line 33
    .line 34
    const-string v2, "\u8bf7\u95ee\u4f60\u79bb\u5f00\u7684\u5177\u4f53\u539f\u56e0\u662f\u4ec0\u4e48\u5462\uff1f"

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/wp;->e:Lv/VButton_FakeShadow;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/wp;->d:Lv/VEditText;

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/wp;->c:Lv/VLinear;

    .line 50
    .line 51
    const/16 v2, 0x8

    .line 52
    .line 53
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Ll/wp;->m()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveAct;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    const-string v2, "input_method"

    .line 61
    .line 62
    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 67
    .line 68
    iget-object v2, p0, Ll/wp;->e:Lv/VButton_FakeShadow;

    .line 69
    .line 70
    new-instance v3, Ll/pp;

    .line 71
    .line 72
    invoke-direct {v3, p0, v0}, Ll/pp;-><init>(Ll/wp;Landroid/view/inputmethod/InputMethodManager;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 76
    .line 77
    .line 78
    const/4 v2, 0x2

    .line 79
    invoke-virtual {v0, v2, v1}, Landroid/view/inputmethod/InputMethodManager;->toggleSoftInput(II)V

    .line 80
    .line 81
    .line 82
    new-instance v0, Ll/qp;

    .line 83
    .line 84
    invoke-direct {v0, p0}, Ll/qp;-><init>(Ll/wp;)V

    .line 85
    .line 86
    .line 87
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public final synthetic w(Lcom/p1/mobile/putong/core/data/InactivateReasonDetail;Landroid/widget/CompoundButton;Z)V
    .locals 4

    .line 1
    const/4 p2, 0x0

    .line 2
    if-eqz p3, :cond_2

    .line 3
    .line 4
    move v0, p2

    .line 5
    :goto_0
    iget-object v1, p0, Ll/wp;->c:Lv/VLinear;

    .line 6
    .line 7
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-ge v0, v1, :cond_1

    .line 12
    .line 13
    iget-object v1, p0, Ll/wp;->c:Lv/VLinear;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveDetailItemView;

    .line 20
    .line 21
    iget-object v2, v1, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveDetailItemView;->b:Lv/VText;

    .line 22
    .line 23
    invoke-virtual {v2}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/InactivateReasonDetail;->name:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-nez v2, :cond_0

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/account/AccountInactiveDetailItemView;->a:Lv/VCheckBox;

    .line 40
    .line 41
    invoke-virtual {v1, p2}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 42
    .line 43
    .line 44
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    iget-object v0, p0, Ll/wp;->g:Ll/mp;

    .line 48
    .line 49
    invoke-virtual {v0, p1}, Ll/mp;->f0(Lcom/p1/mobile/putong/core/data/InactivateReasonDetail;)V

    .line 50
    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_2
    iget-object v0, p0, Ll/wp;->g:Ll/mp;

    .line 54
    .line 55
    invoke-virtual {v0, p1}, Ll/mp;->l0(Lcom/p1/mobile/putong/core/data/InactivateReasonDetail;)V

    .line 56
    .line 57
    .line 58
    :goto_1
    iget-object v0, p0, Ll/wp;->g:Ll/mp;

    .line 59
    .line 60
    invoke-virtual {v0}, Ll/mp;->i0()Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iget-object v1, p0, Ll/wp;->e:Lv/VButton_FakeShadow;

    .line 65
    .line 66
    if-eqz v0, :cond_3

    .line 67
    .line 68
    invoke-virtual {v1, p2}, Landroid/view/View;->setEnabled(Z)V

    .line 69
    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_3
    const/4 v0, 0x1

    .line 73
    invoke-virtual {v1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 74
    .line 75
    .line 76
    :goto_2
    invoke-virtual {p0}, Ll/wp;->m()Lcom/p1/mobile/putong/core/ui/account/AccountInactiveAct;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    const-string v1, "input_method"

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 87
    .line 88
    iget-object v1, p0, Ll/wp;->g:Ll/mp;

    .line 89
    .line 90
    invoke-virtual {v1}, Ll/mp;->h0()Z

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    iget-object v2, p0, Ll/wp;->d:Lv/VEditText;

    .line 95
    .line 96
    if-eqz v1, :cond_4

    .line 97
    .line 98
    invoke-virtual {v2, p2}, Landroid/view/View;->setVisibility(I)V

    .line 99
    .line 100
    .line 101
    goto :goto_3

    .line 102
    :cond_4
    const/16 v1, 0x8

    .line 103
    .line 104
    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 105
    .line 106
    .line 107
    iget-object v1, p0, Ll/wp;->d:Lv/VEditText;

    .line 108
    .line 109
    invoke-virtual {v1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-virtual {v0, v1, p2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 114
    .line 115
    .line 116
    :goto_3
    const-string v1, "reason_custom"

    .line 117
    .line 118
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/InactivateReasonDetail;->key:Ljava/lang/String;

    .line 119
    .line 120
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    if-eqz p1, :cond_5

    .line 125
    .line 126
    if-eqz p3, :cond_5

    .line 127
    .line 128
    const/4 p1, 0x2

    .line 129
    invoke-virtual {v0, p1, p2}, Landroid/view/inputmethod/InputMethodManager;->toggleSoftInput(II)V

    .line 130
    .line 131
    .line 132
    iget-object p0, p0, Ll/wp;->d:Lv/VEditText;

    .line 133
    .line 134
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 135
    .line 136
    .line 137
    :cond_5
    return-void
.end method

.method public final synthetic x(Lcom/p1/mobile/putong/core/data/InactivateReason;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p2, "delete_account_reason_category"

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/InactivateReason;->name:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    filled-new-array {p2}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    const-string v0, "e_delete_account_reason_select"

    .line 14
    .line 15
    const-string v1, "p_delete_account_reason"

    .line 16
    .line 17
    invoke-static {v0, v1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/wp;->g:Ll/mp;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/mp;->k0(Lcom/p1/mobile/putong/core/data/InactivateReason;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
