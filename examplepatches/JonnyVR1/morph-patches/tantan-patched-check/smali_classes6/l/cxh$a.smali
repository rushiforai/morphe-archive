.class public Ll/cxh$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/cxh;->A()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/cxh;


# direct methods
.method public constructor <init>(Ll/cxh;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cxh$a;->a:Ll/cxh;

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
    iget-object v0, p0, Ll/cxh$a;->a:Ll/cxh;

    .line 2
    .line 3
    iget-object v0, v0, Ll/cxh;->g:Lv/VEditText;

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
    if-le v0, v1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Ll/cxh$a;->a:Ll/cxh;

    .line 17
    .line 18
    iget-object v1, v1, Ll/cxh;->g:Lv/VEditText;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/widget/TextView;->getSelectionStart()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    iget-object v2, p0, Ll/cxh$a;->a:Ll/cxh;

    .line 25
    .line 26
    iget-object v2, v2, Ll/cxh;->g:Lv/VEditText;

    .line 27
    .line 28
    invoke-virtual {v2}, Landroid/widget/TextView;->getSelectionEnd()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    const/4 v3, 0x0

    .line 33
    const/4 v4, 0x1

    .line 34
    if-ne v1, v2, :cond_0

    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-ge v1, v2, :cond_0

    .line 41
    .line 42
    if-lt v1, v4, :cond_0

    .line 43
    .line 44
    add-int/lit8 p1, v1, -0x1

    .line 45
    .line 46
    invoke-virtual {v0, v3, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    goto :goto_0

    .line 59
    :cond_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    sub-int/2addr p1, v4

    .line 64
    invoke-virtual {v0, v3, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    :goto_0
    iget-object v0, p0, Ll/cxh$a;->a:Ll/cxh;

    .line 69
    .line 70
    iget-object v0, v0, Ll/cxh;->g:Lv/VEditText;

    .line 71
    .line 72
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Ll/cxh$a;->a:Ll/cxh;

    .line 76
    .line 77
    iget-object p0, p0, Ll/cxh;->g:Lv/VEditText;

    .line 78
    .line 79
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 88
    .line 89
    .line 90
    new-instance p0, Ll/bxh;

    .line 91
    .line 92
    invoke-direct {p0}, Ll/bxh;-><init>()V

    .line 93
    .line 94
    .line 95
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 96
    .line 97
    .line 98
    :cond_1
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
