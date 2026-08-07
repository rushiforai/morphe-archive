.class public Ll/ozh$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ozh;->s()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ozh;


# direct methods
.method public constructor <init>(Ll/ozh;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ozh$a;->a:Ll/ozh;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a()V
    .locals 1

    .line 1
    const-string v0, "\u6700\u591a\u8f93\u51653\u884c"

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ozh$a;->a:Ll/ozh;

    .line 2
    .line 3
    iget-object v0, v0, Ll/ozh;->i:Lv/VEditText;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/TextView;->getLineCount()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x3

    .line 10
    const/4 v2, 0x0

    .line 11
    const/4 v3, 0x1

    .line 12
    if-le v0, v1, :cond_1

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Ll/ozh$a;->a:Ll/ozh;

    .line 19
    .line 20
    iget-object v1, v1, Ll/ozh;->i:Lv/VEditText;

    .line 21
    .line 22
    invoke-virtual {v1}, Landroid/widget/TextView;->getSelectionStart()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    iget-object v4, p0, Ll/ozh$a;->a:Ll/ozh;

    .line 27
    .line 28
    iget-object v4, v4, Ll/ozh;->i:Lv/VEditText;

    .line 29
    .line 30
    invoke-virtual {v4}, Landroid/widget/TextView;->getSelectionEnd()I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    if-ne v1, v4, :cond_0

    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    if-ge v1, v4, :cond_0

    .line 41
    .line 42
    if-lt v1, v3, :cond_0

    .line 43
    .line 44
    add-int/lit8 v4, v1, -0x1

    .line 45
    .line 46
    invoke-virtual {v0, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    goto :goto_0

    .line 59
    :cond_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    sub-int/2addr v1, v3

    .line 64
    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    :goto_0
    iget-object v1, p0, Ll/ozh$a;->a:Ll/ozh;

    .line 69
    .line 70
    iget-object v1, v1, Ll/ozh;->i:Lv/VEditText;

    .line 71
    .line 72
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/ozh$a;->a:Ll/ozh;

    .line 76
    .line 77
    iget-object v0, v0, Ll/ozh;->i:Lv/VEditText;

    .line 78
    .line 79
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 88
    .line 89
    .line 90
    new-instance v0, Ll/nzh;

    .line 91
    .line 92
    invoke-direct {v0}, Ll/nzh;-><init>()V

    .line 93
    .line 94
    .line 95
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 96
    .line 97
    .line 98
    :cond_1
    iget-object v0, p0, Ll/ozh$a;->a:Ll/ozh;

    .line 99
    .line 100
    iget-object v0, v0, Ll/ozh;->j:Landroid/widget/TextView;

    .line 101
    .line 102
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    if-lez p1, :cond_2

    .line 115
    .line 116
    iget-object p0, p0, Ll/ozh$a;->a:Ll/ozh;

    .line 117
    .line 118
    invoke-static {p0}, Ll/ozh;->f(Ll/ozh;)Z

    .line 119
    .line 120
    .line 121
    move-result p0

    .line 122
    if-eqz p0, :cond_2

    .line 123
    .line 124
    move v2, v3

    .line 125
    :cond_2
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    return-void
.end method
