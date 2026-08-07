.class public Ll/qfw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/nfw;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Lv/VEditText;

.field public c:Lv/VLinear;

.field public d:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public e:Lv/VProgressBar;

.field public final f:Lcom/p1/mobile/android/app/Act;

.field public g:Ll/nfw;

.field public h:Lcom/p1/mobile/putong/core/data/GreetingItem;

.field public i:Ljava/lang/String;

.field public j:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/qfw;->j:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/qfw;->f:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a(Ll/qfw;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qfw;->q(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic b(Ll/qfw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/qfw;->p()V

    return-void
.end method

.method public static bridge synthetic c(Ll/qfw;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qfw;->f:Lcom/p1/mobile/android/app/Act;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/qfw;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qfw;->i:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic e(Ll/qfw;)Lcom/p1/mobile/putong/core/data/GreetingItem;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qfw;->h:Lcom/p1/mobile/putong/core/data/GreetingItem;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/qfw;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/qfw;->j:Z

    return p0
.end method

.method public static bridge synthetic i(Ll/qfw;)Ll/nfw;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qfw;->g:Ll/nfw;

    return-object p0
.end method

.method public static bridge synthetic j(Ll/qfw;Lcom/p1/mobile/putong/core/data/GreetingItem;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qfw;->h:Lcom/p1/mobile/putong/core/data/GreetingItem;

    return-void
.end method

.method private synthetic p()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qfw;->b:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/qfw;->f:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    iget-object p0, p0, Ll/qfw;->b:Lv/VEditText;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic q(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget-object p0, p0, Ll/qfw;->d:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 10
    .line 11
    if-lez p1, :cond_0

    .line 12
    .line 13
    sget p1, Ll/dbc0;->u:I

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget p1, Ll/dbc0;->X0:I

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qfw;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qfw;->f:Lcom/p1/mobile/android/app/Act;

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
    check-cast p1, Ll/nfw;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/qfw;->l(Ll/nfw;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/qfw;->k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    invoke-static {p0, p1, p2}, Ll/rfw;->b(Ll/qfw;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l(Ll/nfw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qfw;->g:Ll/nfw;

    .line 2
    .line 3
    return-void
.end method

.method public m()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/qfw;->j:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/qfw;->e:Lv/VProgressBar;

    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public n(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/qfw;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    iget-object v0, p0, Ll/qfw;->f:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/qfw;->f:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const-string v0, "data_key"

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Lcom/p1/mobile/putong/core/data/GreetingItem;

    .line 24
    .line 25
    iput-object p1, p0, Ll/qfw;->h:Lcom/p1/mobile/putong/core/data/GreetingItem;

    .line 26
    .line 27
    if-nez p1, :cond_1

    .line 28
    .line 29
    iget-object p1, p0, Ll/qfw;->b:Lv/VEditText;

    .line 30
    .line 31
    const-string v0, "\u53ef\u4ee5\u5c1d\u8bd5\u6dfb\u52a0\u5f00\u573a\u767d\uff0c\u5c55\u73b0\u4f60\u7684\u804a\u5929\u504f\u597d\uff0c\u6536\u83b7\u66f4\u6709\u6df1\u5ea6\u7684\u804a\u5929"

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GreetingItem;->value:Ljava/lang/String;

    .line 38
    .line 39
    iget-object v0, p0, Ll/qfw;->b:Lv/VEditText;

    .line 40
    .line 41
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/qfw;->b:Lv/VEditText;

    .line 45
    .line 46
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 51
    .line 52
    .line 53
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_2

    .line 58
    .line 59
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-lez p1, :cond_2

    .line 64
    .line 65
    iget-object p1, p0, Ll/qfw;->d:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 66
    .line 67
    sget v0, Ll/dbc0;->u:I

    .line 68
    .line 69
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_2
    iget-object p1, p0, Ll/qfw;->d:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 74
    .line 75
    sget v0, Ll/dbc0;->X0:I

    .line 76
    .line 77
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 78
    .line 79
    .line 80
    :goto_0
    iget-object p1, p0, Ll/qfw;->f:Lcom/p1/mobile/android/app/Act;

    .line 81
    .line 82
    new-instance v0, Ll/ofw;

    .line 83
    .line 84
    invoke-direct {v0, p0}, Ll/ofw;-><init>(Ll/qfw;)V

    .line 85
    .line 86
    .line 87
    const-wide/16 v1, 0x12c

    .line 88
    .line 89
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Ll/qfw;->b:Lv/VEditText;

    .line 93
    .line 94
    const/4 v0, 0x0

    .line 95
    invoke-virtual {p1, v0}, Lv/VEditText;->i(Z)Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    new-instance v0, Ll/pfw;

    .line 100
    .line 101
    invoke-direct {v0, p0}, Ll/pfw;-><init>(Ll/qfw;)V

    .line 102
    .line 103
    .line 104
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 109
    .line 110
    .line 111
    iget-object p1, p0, Ll/qfw;->b:Lv/VEditText;

    .line 112
    .line 113
    new-instance v0, Ll/qfw$a;

    .line 114
    .line 115
    invoke-direct {v0, p0}, Ll/qfw$a;-><init>(Ll/qfw;)V

    .line 116
    .line 117
    .line 118
    invoke-static {p1, v0}, Ll/ltf0;->c(Landroid/view/View;Ll/ltf0$a;)V

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Ll/qfw;->c:Lv/VLinear;

    .line 122
    .line 123
    new-instance v0, Ll/qfw$b;

    .line 124
    .line 125
    invoke-direct {v0, p0}, Ll/qfw$b;-><init>(Ll/qfw;)V

    .line 126
    .line 127
    .line 128
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 129
    .line 130
    .line 131
    iget-object p1, p0, Ll/qfw;->d:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 132
    .line 133
    new-instance v0, Ll/qfw$c;

    .line 134
    .line 135
    invoke-direct {v0, p0}, Ll/qfw$c;-><init>(Ll/qfw;)V

    .line 136
    .line 137
    .line 138
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method public s(Ljava/lang/String;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/qfw;->i:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v0, p0, Ll/qfw;->b:Lv/VEditText;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/qfw;->b:Lv/VEditText;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public u()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/qfw;->j:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/qfw;->e:Lv/VProgressBar;

    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
