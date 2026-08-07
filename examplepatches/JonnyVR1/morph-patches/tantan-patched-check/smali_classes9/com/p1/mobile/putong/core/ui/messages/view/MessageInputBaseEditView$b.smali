.class public Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$b;
.super Landroid/view/inputmethod/InputConnectionWrapper;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public a:Landroid/widget/EditText;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;Landroid/view/inputmethod/InputConnection;ZLcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$b;->b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3}, Landroid/view/inputmethod/InputConnectionWrapper;-><init>(Landroid/view/inputmethod/InputConnection;Z)V

    .line 4
    .line 5
    .line 6
    iput-object p4, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$b;->a:Landroid/widget/EditText;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public deleteSurroundingText(II)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$b;->b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->k(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    :try_start_0
    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/InputConnectionWrapper;->deleteSurroundingText(II)Z

    .line 11
    .line 12
    .line 13
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    return p0

    .line 15
    :catch_0
    return v1

    .line 16
    :cond_0
    const/4 v0, 0x1

    .line 17
    if-ne p1, v0, :cond_2

    .line 18
    .line 19
    if-nez p2, :cond_2

    .line 20
    .line 21
    new-instance p1, Landroid/view/KeyEvent;

    .line 22
    .line 23
    const/16 p2, 0x43

    .line 24
    .line 25
    invoke-direct {p1, v1, p2}, Landroid/view/KeyEvent;-><init>(II)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$b;->sendKeyEvent(Landroid/view/KeyEvent;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_1

    .line 33
    .line 34
    new-instance p1, Landroid/view/KeyEvent;

    .line 35
    .line 36
    invoke-direct {p1, v0, p2}, Landroid/view/KeyEvent;-><init>(II)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$b;->sendKeyEvent(Landroid/view/KeyEvent;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_1

    .line 44
    .line 45
    return v0

    .line 46
    :cond_1
    return v1

    .line 47
    :cond_2
    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/InputConnectionWrapper;->deleteSurroundingText(II)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    return p0
.end method

.method public getTextAfterCursor(II)Ljava/lang/CharSequence;
    .locals 2

    .line 1
    :try_start_0
    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/InputConnectionWrapper;->getTextAfterCursor(II)Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-object p0

    .line 6
    :catch_0
    new-instance p0, Ljava/lang/RuntimeException;

    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v1, "getTextAfterCursor error:"

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string p1, " ,flag:"

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    sget-object p1, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p6:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 34
    .line 35
    const/16 p2, 0xa

    .line 36
    .line 37
    const-string v0, "b_core_message"

    .line 38
    .line 39
    invoke-static {p0, v0, p1, p2}, Lcom/tantanapp/common/utils/CrashHelper;->f(Ljava/lang/Throwable;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;I)V

    .line 40
    .line 41
    .line 42
    const-string p0, ""

    .line 43
    .line 44
    return-object p0
.end method

.method public getTextBeforeCursor(II)Ljava/lang/CharSequence;
    .locals 2

    .line 1
    :try_start_0
    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/InputConnectionWrapper;->getTextBeforeCursor(II)Ljava/lang/CharSequence;

    .line 2
    .line 3
    .line 4
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-object p0

    .line 6
    :catch_0
    new-instance p0, Ljava/lang/RuntimeException;

    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v1, "getTextBeforeCursor error:"

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string p1, " ,flag:"

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    sget-object p1, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p6:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 34
    .line 35
    const/16 p2, 0xa

    .line 36
    .line 37
    const-string v0, "b_core_message"

    .line 38
    .line 39
    invoke-static {p0, v0, p1, p2}, Lcom/tantanapp/common/utils/CrashHelper;->f(Ljava/lang/Throwable;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;I)V

    .line 40
    .line 41
    .line 42
    const-string p0, ""

    .line 43
    .line 44
    return-object p0
.end method

.method public sendKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$b;->b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->k(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-super {p0, p1}, Landroid/view/inputmethod/InputConnectionWrapper;->sendKeyEvent(Landroid/view/KeyEvent;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_4

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    const/16 v2, 0x43

    .line 33
    .line 34
    if-ne v1, v2, :cond_4

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$b;->a:Landroid/widget/EditText;

    .line 37
    .line 38
    invoke-virtual {v1}, Landroid/widget/TextView;->getSelectionStart()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$b;->a:Landroid/widget/EditText;

    .line 43
    .line 44
    invoke-virtual {v2}, Landroid/widget/TextView;->getSelectionEnd()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$b;->b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 49
    .line 50
    invoke-static {v3, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->n(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;II)Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$b;->b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 55
    .line 56
    const/4 v4, 0x0

    .line 57
    if-nez v2, :cond_1

    .line 58
    .line 59
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->l(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;Z)V

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$b;->b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 63
    .line 64
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->m:Ljava/util/HashMap;

    .line 65
    .line 66
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 67
    .line 68
    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    invoke-super {p0, p1}, Landroid/view/inputmethod/InputConnectionWrapper;->sendKeyEvent(Landroid/view/KeyEvent;)Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    return p0

    .line 76
    :cond_1
    invoke-static {v3}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->j(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;)Z

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    if-nez v3, :cond_3

    .line 81
    .line 82
    iget v3, v2, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->a:I

    .line 83
    .line 84
    if-eq v1, v3, :cond_3

    .line 85
    .line 86
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$b;->b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 87
    .line 88
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->o(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;)Z

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    if-eqz p1, :cond_2

    .line 93
    .line 94
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$b;->a:Landroid/widget/EditText;

    .line 95
    .line 96
    invoke-virtual {p1}, Landroid/view/View;->clearFocus()V

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$b;->a:Landroid/widget/EditText;

    .line 100
    .line 101
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 102
    .line 103
    .line 104
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$b;->b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 105
    .line 106
    const/4 v1, 0x1

    .line 107
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->l(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;Z)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$b;->b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 111
    .line 112
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->m(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;)V

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$b;->b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 116
    .line 117
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->m:Ljava/util/HashMap;

    .line 118
    .line 119
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 120
    .line 121
    invoke-virtual {p1, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    iget p1, v2, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->a:I

    .line 125
    .line 126
    iget v0, v2, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$d;->b:I

    .line 127
    .line 128
    invoke-virtual {p0, p1, v0}, Landroid/view/inputmethod/InputConnectionWrapper;->setSelection(II)Z

    .line 129
    .line 130
    .line 131
    return v1

    .line 132
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$b;->b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 133
    .line 134
    invoke-static {v1, v4}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->l(Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;Z)V

    .line 135
    .line 136
    .line 137
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView$b;->b:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 138
    .line 139
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->m:Ljava/util/HashMap;

    .line 140
    .line 141
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 142
    .line 143
    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    invoke-super {p0, p1}, Landroid/view/inputmethod/InputConnectionWrapper;->sendKeyEvent(Landroid/view/KeyEvent;)Z

    .line 147
    .line 148
    .line 149
    move-result p0

    .line 150
    return p0

    .line 151
    :cond_4
    invoke-super {p0, p1}, Landroid/view/inputmethod/InputConnectionWrapper;->sendKeyEvent(Landroid/view/KeyEvent;)Z

    .line 152
    .line 153
    .line 154
    move-result p0

    .line 155
    return p0
.end method
