.class public Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;->p()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt$a;->a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt$a;->a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;->k(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt$a;->a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 5

    .line 1
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const-string v2, ""

    .line 10
    .line 11
    const/4 v3, 0x1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    const-string v1, "\u3164"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    if-eqz v4, :cond_0

    .line 21
    .line 22
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt$a;->a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 27
    .line 28
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt$a;->a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 32
    .line 33
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 34
    .line 35
    .line 36
    move-result-object p3

    .line 37
    invoke-interface {p3}, Ljava/lang/CharSequence;->length()I

    .line 38
    .line 39
    .line 40
    move-result p3

    .line 41
    invoke-virtual {p2, p3}, Landroid/widget/EditText;->setSelection(I)V

    .line 42
    .line 43
    .line 44
    goto/16 :goto_1

    .line 45
    .line 46
    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    const/4 v4, 0x0

    .line 51
    if-nez v1, :cond_3

    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/data/User;->NEW_NAME_PATTERN()Ljava/util/regex/Pattern;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-nez v1, :cond_3

    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-le v1, v3, :cond_2

    .line 72
    .line 73
    sub-int v1, p4, p3

    .line 74
    .line 75
    if-lt v1, v3, :cond_1

    .line 76
    .line 77
    add-int/2addr p3, p2

    .line 78
    add-int/2addr p2, p4

    .line 79
    invoke-interface {p1, p3, p2}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 80
    .line 81
    .line 82
    move-result-object p4

    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt$a;->a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 84
    .line 85
    invoke-interface {p4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p4

    .line 89
    invoke-static {v1, p4}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;->l(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result p4

    .line 93
    if-eqz p4, :cond_1

    .line 94
    .line 95
    move-object p4, p1

    .line 96
    check-cast p4, Landroid/text/SpannableStringBuilder;

    .line 97
    .line 98
    invoke-virtual {p4, p3, p2}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    .line 99
    .line 100
    .line 101
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt$a;->a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 102
    .line 103
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 104
    .line 105
    .line 106
    move-result p3

    .line 107
    sub-int/2addr p3, v3

    .line 108
    invoke-virtual {v0, v4, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p3

    .line 112
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 113
    .line 114
    .line 115
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt$a;->a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 116
    .line 117
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 118
    .line 119
    .line 120
    move-result-object p3

    .line 121
    invoke-interface {p3}, Ljava/lang/CharSequence;->length()I

    .line 122
    .line 123
    .line 124
    move-result p3

    .line 125
    invoke-virtual {p2, p3}, Landroid/widget/EditText;->setSelection(I)V

    .line 126
    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt$a;->a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 130
    .line 131
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 132
    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_3
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p2

    .line 139
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 140
    .line 141
    .line 142
    move-result p2

    .line 143
    if-eqz p2, :cond_4

    .line 144
    .line 145
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 146
    .line 147
    .line 148
    move-result p2

    .line 149
    if-lt p2, v3, :cond_4

    .line 150
    .line 151
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt$a;->a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 152
    .line 153
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 154
    .line 155
    .line 156
    const/4 v3, 0x2

    .line 157
    :goto_0
    move-object p1, v2

    .line 158
    goto :goto_1

    .line 159
    :cond_4
    move v3, v4

    .line 160
    :goto_1
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt$a;->a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 161
    .line 162
    invoke-static {p2}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;->j(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;)Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt$b;

    .line 163
    .line 164
    .line 165
    move-result-object p2

    .line 166
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    move-result p2

    .line 170
    if-eqz p2, :cond_5

    .line 171
    .line 172
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt$a;->a:Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;

    .line 173
    .line 174
    invoke-static {p0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;->j(Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt;)Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt$b;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    invoke-interface {p0, p1, v3}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/NameEditTextOpt$b;->a(Ljava/lang/String;I)V

    .line 183
    .line 184
    .line 185
    :cond_5
    return-void
.end method
