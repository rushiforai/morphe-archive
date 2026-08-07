.class public Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;

.field public b:Lv/VText;

.field public c:Landroid/widget/TextView;

.field public d:Lv/VMaterialEdit;

.field public e:Lv/VButton_FakeShadow;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/uxj0;)V
    .locals 2

    .line 1
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    new-instance p2, Ll/ob20;

    .line 5
    .line 6
    invoke-direct {p2, p0}, Ll/ob20;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 7
    .line 8
    .line 9
    const-wide/16 v0, 0x1f4

    .line 10
    .line 11
    invoke-static {p0, p2, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 15
    .line 16
    .line 17
    invoke-interface {p1}, Ll/x20;->call()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;Lcom/p1/mobile/android/app/Act;Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;->g(Lcom/p1/mobile/android/app/Act;Ll/x20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;Lcom/p1/mobile/android/app/Act;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;->f(Lcom/p1/mobile/android/app/Act;Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/pb20;->a(Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic f(Lcom/p1/mobile/android/app/Act;Ljava/lang/CharSequence;)V
    .locals 3

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "#bdbdbd"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;->e:Lv/VButton_FakeShadow;

    .line 10
    .line 11
    sget v0, Ll/dbc0;->Ku:I

    .line 12
    .line 13
    invoke-static {p1, v0}, Ll/tu0;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p2, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;->e:Lv/VButton_FakeShadow;

    .line 21
    .line 22
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v0}, Ll/bsj0;->L(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;->e:Lv/VButton_FakeShadow;

    .line 43
    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    sget v0, Ll/dbc0;->tv:I

    .line 47
    .line 48
    invoke-static {p1, v0}, Ll/tu0;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {v2, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;->e:Lv/VButton_FakeShadow;

    .line 56
    .line 57
    const/4 v0, -0x1

    .line 58
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    sget v0, Ll/dbc0;->Ku:I

    .line 63
    .line 64
    invoke-static {p1, v0}, Ll/tu0;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {v2, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;->e:Lv/VButton_FakeShadow;

    .line 72
    .line 73
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 78
    .line 79
    .line 80
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;->d:Lv/VMaterialEdit;

    .line 81
    .line 82
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-static {p1}, Ll/bsj0;->L(Ljava/lang/String;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p0, p1}, Lcom/rengwuxian/materialedittext/MaterialEditText;->setError(Ljava/lang/CharSequence;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public final synthetic g(Lcom/p1/mobile/android/app/Act;Ll/x20;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;->d:Lv/VMaterialEdit;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Ll/bsj0;->L(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    if-nez p3, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    new-instance p3, Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    invoke-direct {p3}, Lcom/p1/mobile/putong/data/User;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object p0, p3, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 28
    .line 29
    sget p0, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 30
    .line 31
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const/4 v0, 0x1

    .line 36
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;Z)Landroid/app/Dialog;

    .line 37
    .line 38
    .line 39
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 42
    .line 43
    invoke-virtual {p0, p3}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    new-instance p3, Ll/mb20;

    .line 48
    .line 49
    invoke-direct {p3, p1, p2}, Ll/mb20;-><init>(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 50
    .line 51
    .line 52
    new-instance p2, Ll/nb20;

    .line 53
    .line 54
    invoke-direct {p2, p1}, Ll/nb20;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 55
    .line 56
    .line 57
    invoke-static {p3, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public h(Lcom/p1/mobile/android/app/Act;)V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;->d:Lv/VMaterialEdit;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/widget/TextView;->setSingleLine()V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;->d:Lv/VMaterialEdit;

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;->d:Lv/VMaterialEdit;

    .line 21
    .line 22
    const/16 v3, 0x32

    .line 23
    .line 24
    invoke-virtual {v1, v3}, Lcom/rengwuxian/materialedittext/MaterialEditText;->setMaxCharacters(I)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;->d:Lv/VMaterialEdit;

    .line 28
    .line 29
    new-instance v4, Landroid/text/InputFilter$LengthFilter;

    .line 30
    .line 31
    invoke-direct {v4, v3}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    .line 32
    .line 33
    .line 34
    new-array v2, v2, [Landroid/text/InputFilter;

    .line 35
    .line 36
    const/4 v3, 0x0

    .line 37
    aput-object v4, v2, v3

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;->d:Lv/VMaterialEdit;

    .line 43
    .line 44
    invoke-virtual {v1, v3}, Lcom/rengwuxian/materialedittext/MaterialEditText;->setFloatingLabel(I)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;->d:Lv/VMaterialEdit;

    .line 48
    .line 49
    const-string v2, "#e5e5e5"

    .line 50
    .line 51
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    invoke-virtual {v1, v2}, Lcom/rengwuxian/materialedittext/MaterialEditText;->setPrimaryColor(I)V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;->d:Lv/VMaterialEdit;

    .line 59
    .line 60
    invoke-virtual {v1}, Lv/VMaterialEdit;->H()Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    new-instance v2, Ll/lb20;

    .line 65
    .line 66
    invoke-direct {v2, p0, p1}, Ll/lb20;-><init>(Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;Lcom/p1/mobile/android/app/Act;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;->c:Landroid/widget/TextView;

    .line 77
    .line 78
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->nameStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 79
    .line 80
    if-eqz v0, :cond_0

    .line 81
    .line 82
    iget-object p1, v0, Lcom/p1/mobile/putong/data/StatusesItem;->text:Ljava/lang/String;

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_0
    sget v0, Lcom/p1/mobile/putong/core/R$string;->mr:I

    .line 86
    .line 87
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    :goto_0
    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;->c:Landroid/widget/TextView;

    .line 99
    .line 100
    const/16 v0, 0x11

    .line 101
    .line 102
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setGravity(I)V

    .line 103
    .line 104
    .line 105
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;->b:Lv/VText;

    .line 106
    .line 107
    sget p1, Lcom/p1/mobile/putong/core/R$string;->nr:I

    .line 108
    .line 109
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public i(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;->e:Lv/VButton_FakeShadow;

    .line 2
    .line 3
    new-instance v1, Ll/kb20;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Ll/kb20;-><init>(Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
