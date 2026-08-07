.class public final Lcom/momo/xeengine/XInputActivity;
.super Landroid/app/Activity;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xeengine/XInputActivity$XInputMode;,
        Lcom/momo/xeengine/XInputActivity$XKeyboardReturnType;
    }
.end annotation


# static fields
.field private static final KEY_ENGINE:Ljava/lang/String; = "key_engine"

.field private static final KEY_HINT:Ljava/lang/String; = "key_hint"

.field private static final KEY_INPUT_MODE:Ljava/lang/String; = "key_input_mode"

.field private static final KEY_MAX_LENGTH:Ljava/lang/String; = "key_max_length"

.field private static final KEY_POINTER:Ljava/lang/String; = "key_id"

.field private static final KEY_RETURN_TYPE:Ljava/lang/String; = "key_return_type"

.field private static final KEY_SELECT_TEXT:Ljava/lang/String; = "key_select_text"

.field private static final KEY_TEXT:Ljava/lang/String; = "key_text"


# instance fields
.field private beforeTextChangedCalled:Z

.field private editBoxID:J

.field private editText:Landroid/widget/EditText;

.field private engineInsPointer:J

.field private hasReturned:Z

.field private submitBtn:Landroid/widget/Button;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/momo/xeengine/XInputActivity;->hasReturned:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/momo/xeengine/XInputActivity;->beforeTextChangedCalled:Z

    .line 8
    .line 9
    return-void
.end method

.method private native nativeBeforeTextChanged(JJ)V
.end method

.method private native nativeFinishInput(JJLjava/lang/String;)V
.end method

.method private native nativeOnActivityClose(JJLjava/lang/String;)V
.end method

.method private native nativeOnTextChanged(JJLjava/lang/String;)V
.end method

.method private setInputMode(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p1, v0, :cond_3

    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-eq p1, v0, :cond_2

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    if-eq p1, v0, :cond_1

    .line 9
    .line 10
    const/4 v0, 0x4

    .line 11
    if-eq p1, v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/momo/xeengine/XInputActivity;->editText:Landroid/widget/EditText;

    .line 15
    .line 16
    const/16 p1, 0x10

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setInputType(I)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    iget-object p0, p0, Lcom/momo/xeengine/XInputActivity;->editText:Landroid/widget/EditText;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setInputType(I)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_2
    iget-object p0, p0, Lcom/momo/xeengine/XInputActivity;->editText:Landroid/widget/EditText;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setInputType(I)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_3
    iget-object p0, p0, Lcom/momo/xeengine/XInputActivity;->editText:Landroid/widget/EditText;

    .line 35
    .line 36
    const/16 p1, 0x20

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setInputType(I)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method private setUpSelf(Landroid/content/Intent;)V
    .locals 9

    .line 1
    const-string v0, "key_engine"

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-virtual {p1, v0, v1, v2}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    .line 6
    .line 7
    .line 8
    move-result-wide v3

    .line 9
    iput-wide v3, p0, Lcom/momo/xeengine/XInputActivity;->engineInsPointer:J

    .line 10
    .line 11
    const-string v0, "key_id"

    .line 12
    .line 13
    invoke-virtual {p1, v0, v1, v2}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    iput-wide v0, p0, Lcom/momo/xeengine/XInputActivity;->editBoxID:J

    .line 18
    .line 19
    const-string v0, "key_text"

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "key_hint"

    .line 26
    .line 27
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v2, "key_max_length"

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    const-string v4, "key_input_mode"

    .line 39
    .line 40
    invoke-virtual {p1, v4, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    const-string v5, "key_return_type"

    .line 45
    .line 46
    invoke-virtual {p1, v5, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 47
    .line 48
    .line 49
    move-result v5

    .line 50
    const-string v6, "key_select_text"

    .line 51
    .line 52
    invoke-virtual {p1, v6, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 57
    .line 58
    .line 59
    move-result v6

    .line 60
    iget-object v7, p0, Lcom/momo/xeengine/XInputActivity;->editText:Landroid/widget/EditText;

    .line 61
    .line 62
    const-string v8, ""

    .line 63
    .line 64
    if-lez v6, :cond_0

    .line 65
    .line 66
    invoke-virtual {v7, v1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_0
    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 71
    .line 72
    .line 73
    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    iget-object v6, p0, Lcom/momo/xeengine/XInputActivity;->editText:Landroid/widget/EditText;

    .line 78
    .line 79
    if-lez v1, :cond_1

    .line 80
    .line 81
    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_1
    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    .line 87
    .line 88
    :goto_1
    if-eqz p1, :cond_2

    .line 89
    .line 90
    iget-object p1, p0, Lcom/momo/xeengine/XInputActivity;->editText:Landroid/widget/EditText;

    .line 91
    .line 92
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-static {p1}, Landroid/text/Selection;->selectAll(Landroid/text/Spannable;)V

    .line 97
    .line 98
    .line 99
    :cond_2
    if-lez v2, :cond_3

    .line 100
    .line 101
    iget-object p1, p0, Lcom/momo/xeengine/XInputActivity;->editText:Landroid/widget/EditText;

    .line 102
    .line 103
    new-instance v0, Landroid/text/InputFilter$LengthFilter;

    .line 104
    .line 105
    invoke-direct {v0, v2}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    .line 106
    .line 107
    .line 108
    const/4 v1, 0x1

    .line 109
    new-array v1, v1, [Landroid/text/InputFilter;

    .line 110
    .line 111
    aput-object v0, v1, v3

    .line 112
    .line 113
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 114
    .line 115
    .line 116
    :cond_3
    invoke-direct {p0, v4}, Lcom/momo/xeengine/XInputActivity;->setInputMode(I)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p0, v5}, Lcom/momo/xeengine/XInputActivity;->setReturnType(I)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public static start(JJLjava/lang/String;Ljava/lang/String;ZIII)Z
    .locals 3

    .line 1
    invoke-static {}, Lcom/momo/xeengine/XEnginePreferences;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    new-instance v1, Landroid/content/Intent;

    .line 10
    .line 11
    const-class v2, Lcom/momo/xeengine/XInputActivity;

    .line 12
    .line 13
    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 14
    .line 15
    .line 16
    const-string v2, "key_engine"

    .line 17
    .line 18
    invoke-virtual {v1, v2, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    const-string p0, "key_id"

    .line 22
    .line 23
    invoke-virtual {v1, p0, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    const-string p0, "key_text"

    .line 27
    .line 28
    invoke-virtual {v1, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    const-string p0, "key_hint"

    .line 32
    .line 33
    invoke-virtual {v1, p0, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    const-string p0, "key_max_length"

    .line 37
    .line 38
    invoke-virtual {v1, p0, p7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    const-string p0, "key_select_text"

    .line 42
    .line 43
    invoke-virtual {v1, p0, p6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 44
    .line 45
    .line 46
    const-string p0, "key_input_mode"

    .line 47
    .line 48
    invoke-virtual {v1, p0, p8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 49
    .line 50
    .line 51
    const-string p0, "key_return_type"

    .line 52
    .line 53
    invoke-virtual {v1, p0, p9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 54
    .line 55
    .line 56
    const/high16 p0, 0x30000000

    .line 57
    .line 58
    invoke-virtual {v1, p0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 62
    .line 63
    .line 64
    const/4 p0, 0x1

    .line 65
    return p0
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0

    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/momo/xeengine/XInputActivity;->beforeTextChangedCalled:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-wide p1, p0, Lcom/momo/xeengine/XInputActivity;->engineInsPointer:J

    .line 7
    .line 8
    iget-wide p3, p0, Lcom/momo/xeengine/XInputActivity;->editBoxID:J

    .line 9
    .line 10
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/momo/xeengine/XInputActivity;->nativeBeforeTextChanged(JJ)V

    .line 11
    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    iput-boolean p1, p0, Lcom/momo/xeengine/XInputActivity;->beforeTextChangedCalled:Z

    .line 15
    .line 16
    return-void
.end method

.method public finish()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->finish()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-boolean v1, p0, Lcom/momo/xeengine/XInputActivity;->hasReturned:Z

    .line 2
    .line 3
    if-eqz v1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    sget v2, Ll/ucc0;->a:I

    .line 11
    .line 12
    const/4 v3, 0x1

    .line 13
    if-ne v1, v2, :cond_1

    .line 14
    .line 15
    iput-boolean v3, p0, Lcom/momo/xeengine/XInputActivity;->hasReturned:Z

    .line 16
    .line 17
    iget-wide v1, p0, Lcom/momo/xeengine/XInputActivity;->engineInsPointer:J

    .line 18
    .line 19
    iget-wide v3, p0, Lcom/momo/xeengine/XInputActivity;->editBoxID:J

    .line 20
    .line 21
    iget-object v5, p0, Lcom/momo/xeengine/XInputActivity;->editText:Landroid/widget/EditText;

    .line 22
    .line 23
    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    move-object v0, p0

    .line 32
    invoke-direct/range {v0 .. v5}, Lcom/momo/xeengine/XInputActivity;->nativeOnActivityClose(JJLjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/momo/xeengine/XInputActivity;->finish()V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    sget v2, Ll/ucc0;->b:I

    .line 44
    .line 45
    if-ne v1, v2, :cond_2

    .line 46
    .line 47
    iput-boolean v3, p0, Lcom/momo/xeengine/XInputActivity;->hasReturned:Z

    .line 48
    .line 49
    iget-wide v1, p0, Lcom/momo/xeengine/XInputActivity;->engineInsPointer:J

    .line 50
    .line 51
    iget-wide v3, p0, Lcom/momo/xeengine/XInputActivity;->editBoxID:J

    .line 52
    .line 53
    iget-object v5, p0, Lcom/momo/xeengine/XInputActivity;->editText:Landroid/widget/EditText;

    .line 54
    .line 55
    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v5

    .line 63
    move-object v0, p0

    .line 64
    invoke-direct/range {v0 .. v5}, Lcom/momo/xeengine/XInputActivity;->nativeFinishInput(JJLjava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/momo/xeengine/XInputActivity;->finish()V

    .line 68
    .line 69
    .line 70
    :cond_2
    :goto_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    sget p1, Ll/fec0;->a:I

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setContentView(I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/high16 v0, 0x4000000

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    .line 16
    .line 17
    .line 18
    sget p1, Ll/ucc0;->a:I

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    sget v0, Ll/ucc0;->c:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Landroid/widget/EditText;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/momo/xeengine/XInputActivity;->editText:Landroid/widget/EditText;

    .line 33
    .line 34
    sget v0, Ll/ucc0;->b:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Landroid/widget/Button;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/momo/xeengine/XInputActivity;->submitBtn:Landroid/widget/Button;

    .line 43
    .line 44
    iget-object v0, p0, Lcom/momo/xeengine/XInputActivity;->editText:Landroid/widget/EditText;

    .line 45
    .line 46
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/momo/xeengine/XInputActivity;->submitBtn:Landroid/widget/Button;

    .line 53
    .line 54
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-direct {p0, p1}, Lcom/momo/xeengine/XInputActivity;->setUpSelf(Landroid/content/Intent;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/momo/xeengine/XInputActivity;->setUpSelf(Landroid/content/Intent;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onStart()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/xeengine/XInputActivity;->editText:Landroid/widget/EditText;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->setFocusable(Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/momo/xeengine/XInputActivity;->editText:Landroid/widget/EditText;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/momo/xeengine/XInputActivity;->editText:Landroid/widget/EditText;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const/4 v0, 0x5

    .line 25
    invoke-virtual {p0, v0}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 6

    .line 1
    iget-wide v1, p0, Lcom/momo/xeengine/XInputActivity;->engineInsPointer:J

    .line 2
    .line 3
    iget-wide v3, p0, Lcom/momo/xeengine/XInputActivity;->editBoxID:J

    .line 4
    .line 5
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v5

    .line 9
    move-object v0, p0

    .line 10
    invoke-direct/range {v0 .. v5}, Lcom/momo/xeengine/XInputActivity;->nativeOnTextChanged(JJLjava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setReturnType(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p1, v0, :cond_4

    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-eq p1, v0, :cond_3

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    if-eq p1, v0, :cond_2

    .line 9
    .line 10
    const/4 v0, 0x4

    .line 11
    if-eq p1, v0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x5

    .line 14
    if-eq p1, v0, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/momo/xeengine/XInputActivity;->editText:Landroid/widget/EditText;

    .line 17
    .line 18
    const p1, 0x10000001

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setImeOptions(I)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object p1, p0, Lcom/momo/xeengine/XInputActivity;->submitBtn:Landroid/widget/Button;

    .line 26
    .line 27
    const-string v0, "\u4e0b\u4e00\u9879"

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/momo/xeengine/XInputActivity;->editText:Landroid/widget/EditText;

    .line 33
    .line 34
    const p1, 0x10000005

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setImeOptions(I)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    iget-object p1, p0, Lcom/momo/xeengine/XInputActivity;->submitBtn:Landroid/widget/Button;

    .line 42
    .line 43
    const-string v0, "\u524d\u5f80"

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/momo/xeengine/XInputActivity;->editText:Landroid/widget/EditText;

    .line 49
    .line 50
    const p1, 0x10000002

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setImeOptions(I)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_2
    iget-object p1, p0, Lcom/momo/xeengine/XInputActivity;->submitBtn:Landroid/widget/Button;

    .line 58
    .line 59
    const-string v0, "\u641c\u7d22"

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lcom/momo/xeengine/XInputActivity;->editText:Landroid/widget/EditText;

    .line 65
    .line 66
    const p1, 0x10000003

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setImeOptions(I)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_3
    iget-object p1, p0, Lcom/momo/xeengine/XInputActivity;->submitBtn:Landroid/widget/Button;

    .line 74
    .line 75
    const-string v0, "\u53d1\u9001"

    .line 76
    .line 77
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Lcom/momo/xeengine/XInputActivity;->editText:Landroid/widget/EditText;

    .line 81
    .line 82
    const p1, 0x10000004

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setImeOptions(I)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_4
    iget-object p1, p0, Lcom/momo/xeengine/XInputActivity;->submitBtn:Landroid/widget/Button;

    .line 90
    .line 91
    const-string v0, "\u5b8c\u6210"

    .line 92
    .line 93
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    .line 95
    .line 96
    iget-object p0, p0, Lcom/momo/xeengine/XInputActivity;->editText:Landroid/widget/EditText;

    .line 97
    .line 98
    const p1, 0x10000006

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setImeOptions(I)V

    .line 102
    .line 103
    .line 104
    return-void
.end method
