.class public Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->c(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView$a;->a:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "\n"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x0

    .line 12
    const/4 v3, 0x1

    .line 13
    if-ltz v1, :cond_1

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView$a;->a:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopEditInfo;->loopInputType:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 18
    .line 19
    sget-object v4, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->ABOUT_ME:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 20
    .line 21
    if-eq v1, v4, :cond_1

    .line 22
    .line 23
    sget-object v4, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->HANGOUTS:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 24
    .line 25
    if-eq v1, v4, :cond_1

    .line 26
    .line 27
    sget-object v4, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->QUESTION_EDIT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 28
    .line 29
    if-eq v1, v4, :cond_1

    .line 30
    .line 31
    sget-object v4, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->QUESTION_CHOICE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 32
    .line 33
    if-eq v1, v4, :cond_1

    .line 34
    .line 35
    sget-object v4, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->SIGNATURE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 36
    .line 37
    if-eq v1, v4, :cond_1

    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/widget/TextView;->getSelectionStart()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 48
    .line 49
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 54
    .line 55
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 56
    .line 57
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->e:Lv/VEditText;

    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    sub-int/2addr p1, v3

    .line 69
    if-gez p1, :cond_0

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_0
    move v2, p1

    .line 73
    :goto_0
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_1
    sget-object v0, Ll/bsj0;->j:Ll/qcj;

    .line 82
    .line 83
    invoke-interface {v0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    check-cast v0, Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 94
    .line 95
    if-eqz v1, :cond_2

    .line 96
    .line 97
    iget-object v1, v4, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->g:Landroid/widget/TextView;

    .line 98
    .line 99
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 100
    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_2
    iget-object v1, v4, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->g:Landroid/widget/TextView;

    .line 104
    .line 105
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 106
    .line 107
    .line 108
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 109
    .line 110
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->g:Landroid/widget/TextView;

    .line 111
    .line 112
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 113
    .line 114
    .line 115
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 116
    .line 117
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->g(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 125
    .line 126
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->a(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;)Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView$b;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    if-eqz v1, :cond_3

    .line 135
    .line 136
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView$a;->b:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;

    .line 137
    .line 138
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;->a(Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView;)Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView$b;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    invoke-interface {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditActionView$b;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    :cond_3
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
