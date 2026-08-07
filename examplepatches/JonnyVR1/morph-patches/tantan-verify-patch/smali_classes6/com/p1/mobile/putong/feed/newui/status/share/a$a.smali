.class public Lcom/p1/mobile/putong/feed/newui/status/share/a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/status/share/a;->J(Ljava/lang/String;Ljava/lang/String;ILl/y20;Ll/y20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/status/share/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/status/share/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a$a;->a:Lcom/p1/mobile/putong/feed/newui/status/share/a;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a$a;->a:Lcom/p1/mobile/putong/feed/newui/status/share/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->C(Lcom/p1/mobile/putong/feed/newui/status/share/a;)Lv/VEditText;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/widget/TextView;->getLineCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x3

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a$a;->a:Lcom/p1/mobile/putong/feed/newui/status/share/a;

    .line 19
    .line 20
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->C(Lcom/p1/mobile/putong/feed/newui/status/share/a;)Lv/VEditText;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Landroid/widget/TextView;->getSelectionStart()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a$a;->a:Lcom/p1/mobile/putong/feed/newui/status/share/a;

    .line 29
    .line 30
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->C(Lcom/p1/mobile/putong/feed/newui/status/share/a;)Lv/VEditText;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v2}, Landroid/widget/TextView;->getSelectionEnd()I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    const/4 v3, 0x0

    .line 39
    const/4 v4, 0x1

    .line 40
    if-ne v1, v2, :cond_0

    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-ge v1, v2, :cond_0

    .line 47
    .line 48
    if-lt v1, v4, :cond_0

    .line 49
    .line 50
    add-int/lit8 p1, v1, -0x1

    .line 51
    .line 52
    invoke-virtual {v0, v3, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    goto :goto_0

    .line 65
    :cond_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    sub-int/2addr p1, v4

    .line 70
    invoke-virtual {v0, v3, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a$a;->a:Lcom/p1/mobile/putong/feed/newui/status/share/a;

    .line 75
    .line 76
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->C(Lcom/p1/mobile/putong/feed/newui/status/share/a;)Lv/VEditText;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a$a;->a:Lcom/p1/mobile/putong/feed/newui/status/share/a;

    .line 84
    .line 85
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->C(Lcom/p1/mobile/putong/feed/newui/status/share/a;)Lv/VEditText;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/share/a$a;->a:Lcom/p1/mobile/putong/feed/newui/status/share/a;

    .line 90
    .line 91
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->C(Lcom/p1/mobile/putong/feed/newui/status/share/a;)Lv/VEditText;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    invoke-virtual {p1, p0}, Landroid/widget/EditText;->setSelection(I)V

    .line 104
    .line 105
    .line 106
    new-instance p0, Ll/gwh;

    .line 107
    .line 108
    invoke-direct {p0}, Ll/gwh;-><init>()V

    .line 109
    .line 110
    .line 111
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 112
    .line 113
    .line 114
    :cond_1
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method
